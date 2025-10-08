Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB5CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=160A2U5i9iLy9c3GkzI3Pm6Z8R9R/+UzazkMkhWI13c=; b=Pw0kE2Ki0qZ1C+UQx0ma2Qjr3n
	4aSaFzcvInPsMHDkUocn2bcXc/Ampb9nL6r8SYlp2nnFprAImqt/0bNM40VxZFmAy8AKtQ0HwCYnq
	2mitYIfyd3czvVzgw0svIyKfQIi8Icg6LKcTW21n4wF7dewV4DTJS0i7ZZpCXMgzgVyUd/C41E8B1
	bjC0xsJarXNn5yoTGjIHgdNA+9kf8PptBm3J9N3BFFPTQ9UpoUVL+Y6h7BHmrMUDZoNj21vhmRZ+V
	+tBeq8R2QBTk2NLpBIlWVYrAizYb0NVRtaae4253l0iGTcvF0Fx2aRdpVdmnFF70blPR/fwCnlNkA
	vFtNodZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTM-00000003q4b-1JKu;
	Wed, 08 Oct 2025 12:40:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTI-00000003q30-2qYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11AC022FC;
	Wed,  8 Oct 2025 05:40:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CEA73F738;
	Wed,  8 Oct 2025 05:40:42 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:40:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Oliver Upton <oliver.upton@linux.dev>, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <20251008124040.GC77665@e132581.arm.com>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev>
 <861pndzn4w.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pndzn4w.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_054044_760960_B06A4A85 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, Oct 08, 2025 at 11:46:55AM +0100, Marc Zyngier wrote:

[...]

> > > Lets guard the change with cpu_has_spe() check so that it only affects
> > > the cpu which has SPE feature supported.
> > 
> > This could benefit from being spelled out a bit more. In both cases we
> > check for the presence of FEAT_SPE, however I believe the issue you
> > observe is EL3 hasn't delegated ownership of the Profiling Buffer to
> > Non-secure nor does it reinject an UNDEF in response to the sysreg trap.
> > 
> > I agree that the change is correct but the rationale needs to be clear.
> 
> To me, this smells a lot more like some sort of papering over a
> firmware bug. Why isn't SPE available the first place?

TF-a grants permission to non-secure world [1], only access from secure
world or realm will trap to EL3.

So yes, it would be good to check if any issue in firmware.

Thanks,
Leo

[1] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/heads/master/lib/extensions/spe/spe.c#52

