Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E17CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rX0FbXwgpvRNNI/2UkQ8kqjFikT1nbRId3r+WqD3Yz8=; b=svn40pD1/7bYBSVP6Hz5iehxfX
	ZuXns8NGeK/OnuJlU0eKw72WFp3TmHzIFQ3cGKdBjPrkFOsNUpFjNZjCyBVQA7azHM9ixrV6W6JIM
	YUrvh+3aRMxMGAqf/LrleF5r9228D8ED20+SECQFUm98UjmyY181kbnOm5+lcHnBv8ezKIlT3HJAK
	xWUvzfq134Tw6WLVTWxklC2VRcZxKV1NRhBsGRORX1DtZ0i3p7+i8soRSPBisY7DaqfoPdgkwlh9j
	i29BUdEcFlf2ntXbp3sBouBMdnaaKHSu/lbjIR1qU7Z+J32ANu8QtSQ42wwcsmt2GEie/S0G8KHWv
	XLnPSGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUh-00000001VBx-2zJ5;
	Mon, 08 Sep 2025 18:21:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcR8-0000000HZBC-0O5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD78424BD;
	Mon,  8 Sep 2025 14:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B4FC4CEF1;
	Mon,  8 Sep 2025 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757340097;
	bh=rX0FbXwgpvRNNI/2UkQ8kqjFikT1nbRId3r+WqD3Yz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZnvjZ/6dgon0zsoULePF5c8f62g8NAPL6JWkKXEMW+rTzzOo/B6eTVtOChBRUZ2v
	 BzoEEfbqIejDwVxlD0jCkQOQqeBrBLUkVPLKEcsr6kgbVH7Dg8rk+aEHKGO0yatpoV
	 HJXVk6PigWEBgxmG2G+Kz1UoHsjXyn5T3SZLkxftWl27M44J4l2siBT2FizGpx0Gz6
	 wB9iuarryw5uO2bE+K7STq6QB/4cBmn1n9KYZlO2HqKu7ozPMDlmMgeBo4XQFlC7jg
	 eFYDIr23rW4dRi2bVFhjXKWwZGcXVlmW5jeoj+P2MP14r9Am2OrnnnngEyqaaCjM+C
	 r8K6wRtBA4OfA==
Date: Mon, 8 Sep 2025 15:01:32 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	maz@kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <aL7hvEXjXpoyDCQf@willie-the-truck>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_070138_147908_B5763B0D 
X-CRM114-Status: GOOD (  10.70  )
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

On Tue, Jul 01, 2025 at 04:31:58PM +0100, James Clark wrote:
> DEN0154 states that writes to PMBPTR_EL1 or PMBSR_EL1 must be done while
> the buffer is disabled (PMBLIMITR_EL1.E == 0). Re-arrange the interrupt
> handler to always disable the buffer for non-spurious interrupts before
> doing either.

Why is DEN0154 not part of the Arm ARM?

Trying to tighten the programmers model retrospectively in a separate
spec is a lovely idea but I'm not hugely interested in it. The driver is
written to the text in the Arm ARM and is going to stay that way. Any
future changes in the architecture need to be backwards compatible.

If we have to poke the thing differently in a VM, we might as well use
hypercalls/PV.

Will

