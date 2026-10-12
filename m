Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33FACA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1guPBLeRuoTTtMeHefrhThDJT+DgCk4LZwa1SJroCk=; b=HKsV70W//OG/ZHFJgYa2GagR2x
	jCNfdOAM7FPBu2lKkYBxG+uug4IVaec5y2/wZudKXGpUJwH+sLmp9A8dMJrGDLz23uY9cEz3NGCfG
	G/yOQAznIM2pYzJaDhOx5HXaFW5sOXCdggc01DtCTqfBziJ89djJ222CCDOtjhREHOnZGbPdq15Il
	oTTW6nOKoI82geq4SFGRSO3no7V3SrM8RK2YQ9CaFhyvFhp7VnhyS06HBuD4otuexQnIT7CGIo1R/
	MHBs9Lc8dBFNTUuxtXV5UU/jqWPo4cS0fu5D8QCfBn/QZauGlHklQ6/qSQn2lWuVe6fWNUKMFYMwL
	ujHLs4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBou-0000000A03d-0B4w;
	Mon, 12 Oct 2026 08:55:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBos-0000000A03S-0rRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1E4A406D4;
	Mon, 12 Oct 2026 08:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77081F0089B;
	Mon, 12 Oct 2026 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795339;
	bh=f1guPBLeRuoTTtMeHefrhThDJT+DgCk4LZwa1SJroCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gI43ed4j/Vh4tdMPwUmmHOJleQqrnGPjtNMfhrwkjohD7MNtRZeFub7E8QETh7r94
	 qC/eEhFSqMItzFfpkbkWW1ppUrKPsFE8NM063lXrF3kJ2GyGoaXFkdIyIoqLxf4kx3
	 aDhW/Ww6zLNgFp9norWgMSJOMVV7OFt7Kd0Pax7edLIO7e17vQ7x6jr2qvtTrz4YOJ
	 hCQr2pyAj372HCv+AICdpePUGjzBAde8QnAcTWbCjdTp1yoWg5ulG76oEm93xZg5R6
	 W/zut/Vqy+xvmealqkAQyTNnbPSaaukIwWHJ7G4xrWKP4M4948bT9OaIQ+P7PpImtP
	 OQyX8q8k0M8iA==
Date: Mon, 12 Oct 2026 09:55:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe
 arguments
Message-ID: <20261012-loyal-polecat-of-defiance-eba732@sudeepholla>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010100249.643327-1-aneesh.kumar@kernel.org>
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

On Sat, Oct 10, 2026 at 03:32:49PM +0530, Aneesh Kumar K.V (Arm) wrote:
> The device probe passes zeroes for all seven argument registers to
> arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
> GCC 8.5 reports "r7 cannot be used in asm here".
> 
> The current smccc_devices entries need at most one argument after the
> function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
> version. Pass zero for that argument and omit the unused arguments,
> avoiding the r7 constraint. Check argument requirements when adding new
> probe functions to smccc_devices.
> 

LGTM and should be enough for now.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

