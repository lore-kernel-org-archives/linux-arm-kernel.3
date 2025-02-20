Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa0nagdj/BekeE52UFxAhdwBwxZ74jtsbiGrMqcOGSc=; b=tOCEeR0bj7ZhnHnJTK2ltNq4Iw
	5LVNLDpg/jB+pLpdTAy9XEvFGpuFGVz8SroOT6tEmnDN3FKKjmjFZy7/qM4+fJSdGdeqdeCoR4YjH
	ndRGW8eEX3VrncpEnXuAGqZGy/5WIHHyMWf0YtY81MrCd15JLJmgPJwSYyhsW7/p92fViqfEhLkCf
	C14BGw5zusHEG3QreWBuLLzeaaWKLGoqAzsswBAIQ1MChqBRyV0najvnOql+qpbEoqgm4+/wmAUwa
	vYscW4xAuzSh1Sa/BtvV2Spumx1yBlp4Rsqs1m5tdjclH8+FYLDu0r7K6uqYWPvbBhMmyIBzcyB77
	3TEUC/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl44L-00000000MXS-1UCz;
	Thu, 20 Feb 2025 10:46:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl42p-00000000MAH-3N5l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 10:44:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6D916A3;
	Thu, 20 Feb 2025 02:44:54 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 882E73F59E;
	Thu, 20 Feb 2025 02:44:35 -0800 (PST)
Date: Thu, 20 Feb 2025 10:44:19 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/2] KVM: arm64: EL2 PMU reset handling fixes
Message-ID: <20250220104419.GA2511466@e124191.cambridge.arm.com>
References: <20250217112412.3963324-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217112412.3963324-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_024439_886631_0F7888AA 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Feb 17, 2025 at 11:24:10AM +0000, Marc Zyngier wrote:
> Joey reports that some of his PMU tests do not behave quite as
> expected:
> 
> - MDCR_EL2.HPMN is set to 0 out of reset
> 
> - PMCR_EL0.P should reset all the counters when written from EL2
> 
> These couple of patches attempt to remedy the situation. Note that
> they have only been compile-tested.
> 
> Marc Zyngier (2):
>   KVM: arm64: Fix MDCR_EL2.HPMN reset value
>   KVM: arm64: Contextualise the handling of PMCR_EL0.P writes
> 
>  arch/arm64/kvm/pmu-emul.c | 21 ++++++++++++++++-----
>  arch/arm64/kvm/sys_regs.c |  7 ++++++-
>  2 files changed, 22 insertions(+), 6 deletions(-)

I see you're discussing the API around this, but this does fix the PMU tests, so:

Tested-by: Joey Gouly <joey.gouly@arm.com>

