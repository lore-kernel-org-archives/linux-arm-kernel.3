Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950B4E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w09I5ZTtfvgiBR6RhikGWnL4odF6u0duJn4zfRFYdkM=; b=tjLx/GqJAyMW4BjkoXwJO0pxrY
	gSkeRQftFnb5TG/vOQFTR+hwApkhB50wzyElsa1x6QCeTjzx9zOi6e+1GpiLgoD4xY4MXLBBwOSpI
	iJMSH5gEMHIkCMfzFXSvPUHxD/7htuSGXIa/vFEb4BaLLgV0wfDjiPBMKgg20uNGQt+Lyt2WgVtTI
	jdDpYwoiSfKZi6H8OEaL8ynJOWS3YhDYRaBBd/KuOWyzfGXNZAIyzz8fAlVQ7dQGLL4JdxYXQMaCv
	qzLHVre+vtZoF1opQeuA1WLDk51R98YKTVrSFK62Nm3D2QkW3BJbboUXAg8EBCJBVnxTcFX7ZQWRe
	h3t2Tp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNP-00000008eo9-0lHB;
	Wed, 08 Jan 2025 13:45:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWJ2-00000008e0T-2tSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C71A65C0865;
	Wed,  8 Jan 2025 13:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACABC4CEDD;
	Wed,  8 Jan 2025 13:41:04 +0000 (UTC)
Date: Wed, 8 Jan 2025 13:41:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/5] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <Z36Abq8mrhnl3cg2@arm.com>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
 <20250107-arm64-2024-dpisa-v5-1-7578da51fc3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-arm64-2024-dpisa-v5-1-7578da51fc3d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_054108_765260_E96E2D49 
X-CRM114-Status: GOOD (  16.24  )
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

On Tue, Jan 07, 2025 at 10:59:41PM +0000, Mark Brown wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> The hwcaps code that exposes SVE features to userspace only
> considers ID_AA64ZFR0_EL1, while this is only valid when
> ID_AA64PFR0_EL1.SVE advertises that SVE is actually supported.
> 
> The expectations are that when ID_AA64PFR0_EL1.SVE is 0, the
> ID_AA64ZFR0_EL1 register is also 0. So far, so good.
> 
> Things become a bit more interesting if the HW implements SME.
> In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
> features. And these fields overlap with their SVE interpretations.
> But the architecture says that the SME and SVE feature sets must
> match, so we're still hunky-dory.
> 
> This goes wrong if the HW implements SME, but not SVE. In this
> case, we end-up advertising some SVE features to userspace, even
> if the HW has none. That's because we never consider whether SVE
> is actually implemented. Oh well.
> 
> Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
> being non-zero. The HWCAPS documentation is amended to reflect the
> actually checks performed by the kernel.
> 
> Fixes: 06a916feca2b ("arm64: Expose SVE2 features for userspace")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

