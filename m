Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264DACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZtzKsYKXuyZOjPqT7ixJbnhG4D+CsUiH+r4jEbNTKM=; b=k2+eV1/ebUJUVeHLtYEBF6mFVj
	+RxQh3CziAZE02KQu0hlhORhreCVumjvzlNZVOIfHFETvnFiGNdok5eJtYW5q5XS1P3hpbUDqWjkZ
	HUpLARP0TQhoGhfdqQvoxKmjB3os+9jMFFesYYVTYXGDp72R2OkrmgQ5OHrn/XldqdIuHyY134IFt
	XX30ETJycZO4UMVKTrnA83ZPyxGhXSjoLxwTXFwZ2YGjsnRdc0VcHe0tkZG3wELLEv8yAsJgi+0rv
	29x2bG7Z+v0+E7pEb6eacm7j4kPjeiHy/0tT9YR7/1rmY+XDjBeFt4MoaFOAMmlFDAttVajm7AHCd
	GZpWahEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlRz-00000006vyK-17oE;
	Tue, 11 Nov 2025 10:18:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlRx-00000006vxv-0p30
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:18:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 702DB2F;
	Tue, 11 Nov 2025 02:18:00 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA2843F63F;
	Tue, 11 Nov 2025 02:18:07 -0800 (PST)
Date: Tue, 11 Nov 2025 10:18:05 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 09/11] coresight: etm4x: Add flag to control
 single-shot restart
Message-ID: <20251111101805.GD281971@e132581.arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
 <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
 <20251111092403.GB281971@e132581.arm.com>
 <a5ca5a65-8d5c-48b3-83f2-82d13c0b930d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5ca5a65-8d5c-48b3-83f2-82d13c0b930d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021809_294487_F61F2FD9 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, Nov 11, 2025 at 09:43:13AM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> >    if (!is_idle_task(current)) {
> >        if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> >            config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> >    }
> 
> What happens when we do a system wide session and a CPU is running an
> idle task ?

For a system wide trace, the ETM device is enabled and disabled by
the perf when the session start and finish.

During the session:

- If CPU off states are not enabled, nothing will happen in idle
  threads, as no CPU PM notifier will be invoked.

- If CPU off states have been enabled, CPU PM notifier will save and
  restore ETM device context, and keep single-shot status.  This is
  same with current save/restore flow.

I don't see any issue for this.

Thanks,
Leo

