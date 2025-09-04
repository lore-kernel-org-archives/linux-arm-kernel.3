Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E0CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNdZCLI9Qh4c9oJ4l0QFxSHO1I3wLPIs2ZcoTVbvVSI=; b=K8N5Uf9XnyKbOlRzxBVJ6q/l2f
	CgHBPBgFdwrxpRmEid7rd3AcinhIb+IVTMX4xn+EK6PO5/i4o1H6lTRx5LuDrJ0VwfKf5jRfBp8vh
	uPsY3Kn2qAEO5t8v/Hcy/oQaG63Xvohw7TQMokkbd6sDlP942U15OGv0JMDin0TSlgrp/L5pEiyuO
	Nw3tFxXw1xArMHVb9XqalAJHZCk1bZ2JdR6mvTVAKyvLRk2yJrQhvUQwOv/xUpUx9P9OHScpq5ss9
	+zlIKHSiqQhtKHEiSlPKemxgF7uIHY7mD0LaiQA0FeVn2rJ2KF5dCr4yBF1+wG/XvC7JP7rqiucnf
	AHVYQRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5yx-0000000ATCX-1tm7;
	Thu, 04 Sep 2025 09:10:15 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5Mv-0000000AFCS-3eo3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:30:59 +0000
Date: Thu, 4 Sep 2025 00:26:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756974655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oNdZCLI9Qh4c9oJ4l0QFxSHO1I3wLPIs2ZcoTVbvVSI=;
	b=xZZHEQPICy+oxcy5y2oGaGUIUdwzJ0QpB0CjVdocLgXh97ZBpxbOzHhYQ366AXqVNLIVYS
	Uc48K+mfCygSr09+VVL+rHrFbxEYnSq1LyKoavn7mwraT6POlwjhCXOeeKT46YDUl7fHJL
	YgdMjHHiu85UjKVXDkQIH/KuLMsce24=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
	jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2] KVM: arm64: Fix NULL pointer access issue
Message-ID: <aLk_F8LgpFW6Qo3O@linux.dev>
References: <20250902-etm_crash-v2-1-aa9713a7306b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-etm_crash-v2-1-aa9713a7306b@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_013058_258417_20608EAD 
X-CRM114-Status: GOOD (  15.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Yingchao,

The shortlog is extremely vague, you should aim to succinctly describe
the functional change of your patch. e.g.

  KVM: arm64: Return early from trace helpers when KVM isn't available

On Tue, Sep 02, 2025 at 11:48:25AM +0800, Yingchao Deng wrote:
> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
> is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
> will result in a NULL pointer.
> 
> Add is_kvm_arm_initialised() condition check to ensure that kvm_arm_init
> completes all necessary initialization steps, including init_hyp_mode.

OTOH, the changelog is very mechanical and hard to grok.

  When linux is booted at EL1, host_data_ptr() resolves to the nVHE
  hypervisor's copy of host data. When hyp mode isn't available for
  KVM the nVHE percpu bases remain uninitialized. Consequently, any usage
  of host_data_ptr() will result in a NULL dereference which has been
  observed in KVM's trace filtering helpers.

  Add an early return to the trace filtering helpers if KVM isn't
  initialized, avoiding the NULL dereference.

> Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for guests")
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> ---
> Add a check to prevent accessing uninitialized per-CPU data.
> ---
> Changes in v2:
> 1. Move the warning to the end in order to improve readability. No
> functional change intended

IMO, the warning should be the very first condition we evaluate. Even if
the system configuration leads to an early return anyway (e.g. protected
mode) the caller is not invoking these helpers from the right context.

Thanks,
Oliver

