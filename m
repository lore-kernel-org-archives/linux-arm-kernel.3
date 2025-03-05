Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA47C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qo71ZpEWjiEuvLYpOm6cAQgKCLTzQJocq3h05KhJ4+Q=; b=DuUFbJtYgw1kxlsI2lHyW1vMWj
	ApLErUusqEd9va1eKvD/HwncuOKwwceAzAmnlMYEz11zgicBcvz2QAolNn4YYPNFtL51LHRqjfCG8
	QBLFBKMkepjNc5mztC9q96Qm6dWmEodz+onnbNytDTVCepMswxPjtwazuhM3p0Uhjs7pqgR/LTBbJ
	QY3fIdsZZE5pUbayabGvjdBO+u9nGPb3q5Fp7Ho7TwXrrOxNQeaTdQ7sTS6D1eCZmHkH0fodhZDEs
	t3N/0RmPYMTNZe3zKT2E4gq01mjbOFxsUHv7g7VqGGktVMIycypUcKkZP4GEAK1w6n2M16/4v5ekq
	OmGAgq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzeP-00000009kd7-0aed;
	Thu, 06 Mar 2025 01:03:49 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpydw-00000009esO-0vy4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 23:59:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741219150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qo71ZpEWjiEuvLYpOm6cAQgKCLTzQJocq3h05KhJ4+Q=;
	b=g+fwP1vVUZCiSK3tA3+HTbZuRMGqSIym7xip6ti4nJpm1G6mEk0M86mhjE/vpR2pHEd9+E
	E68cTE/B8DuevphtzeOPhYpsPhm7dJdakl13OJ8DPeTR53caffF/jKYtLMQJNDPeLFVFKm
	TfS5DP7TKpjBghTLTJ9PxQsj6az55jI=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	maz@kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	cohuck@redhat.com,
	eric.auger@redhat.com,
	sebott@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com,
	anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com
Subject: Re: [PATCH v8 0/6] KVM: arm64: Errata management for VM Live migration
Date: Wed,  5 Mar 2025 15:58:56 -0800
Message-Id: <174121899987.513001.15032119490654823649.b4-ty@linux.dev>
In-Reply-To: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_155916_681063_6245EB83 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
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

On Fri, 21 Feb 2025 14:02:23 +0000, Shameer Kolothum wrote:
> v7-->v8
> https://lore.kernel.org/kvmarm/20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com/
> 
> Changes:
>  -Fixed the compile error issue due to CONFIG_CORESIGHT_SOURCE_ETM4X=m
>   (Thanks to Sebastian for checking that config)- patch #4
>  -Added R-by tags.
> 
> [...]

The feature branch for all of this can be found here should the need arise.

git://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git kvm-arm64/pv-cpuid

Applied to next, thanks!

[1/6] arm64: Modify _midr_range() functions to read MIDR/REVIDR internally
      https://git.kernel.org/kvmarm/kvmarm/c/e3121298c7fc
[2/6] KVM: arm64: Introduce hypercall support for retrieving target implementations
      https://git.kernel.org/kvmarm/kvmarm/c/57e5cc9b8a39
[3/6] KVM: arm64: Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2
      https://git.kernel.org/kvmarm/kvmarm/c/c0000e58c74e
[4/6] arm64: Make _midr_in_range_list() an exported function
      https://git.kernel.org/kvmarm/kvmarm/c/c8c2647e69be
[5/6] smccc/kvm_guest: Enable errata based on implementation CPUs
      https://git.kernel.org/kvmarm/kvmarm/c/86edf6bdcf05
[6/6] KVM: selftests: Add test for KVM_REG_ARM_VENDOR_HYP_BMAP_2
      https://git.kernel.org/kvmarm/kvmarm/c/f69656656fa7

--
Best,
Oliver

