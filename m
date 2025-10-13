Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBZLTh6s0lltKnY5a3/F+yVrDShDmFtRfyBueSsIJVc=; b=twdoYwWrtYQJef2KisFhdRupsZ
	kGAN4ZZT9HPDHrnOAgEm+4diT6oeZMXsNPAiQiM00X4hgc1M4k970zuKxeuWcjGugDdfKu50Wg28N
	pHT0nNMg9eGPZO3MzlYeYbvTjQauzRVGgTt0qxrnzbkCxpiLoVzyQQmSB5RQ+QF1HzckaDPojM09q
	4ejIeftlruCa5swZTvlxmIQnbvwMZTNYob11QckFqDD1J8uAj2U140uud2RkjzpmiZu0FeJwxyGQ2
	NacdvVQm1Qx5iUUb2nWZNPxksJA76B5vgv3d/tz2XfQC0iLTnFp9A0WhTS+Ka6li9V5Oj7dKsMxOE
	QoUyTjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GYx-0000000D0WY-0cfx;
	Mon, 13 Oct 2025 11:17:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GYv-0000000D0WP-3Ct9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DBBC61210;
	Mon, 13 Oct 2025 11:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC4CC4CEE7;
	Mon, 13 Oct 2025 11:17:54 +0000 (UTC)
Date: Mon, 13 Oct 2025 12:17:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH] arm64: Revamp HCR_EL2.E2H RES1 detection
Message-ID: <aOzf4A6nVZhnLvka@arm.com>
References: <20251009121239.29370-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009121239.29370-1-maz@kernel.org>
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

On Thu, Oct 09, 2025 at 01:12:39PM +0100, Marc Zyngier wrote:
> We currently have two ways to identify CPUs that only implement FEAT_VHE
> and not FEAT_E2H0:
> 
> - either they advertise it via ID_AA64MMFR4_EL1.E2H0,
> - or the HCR_EL2.E2H bit is RAO/WI
> 
> However, there is a third category of "cpus" that fall between these
> two cases: on CPUs that do not implement FEAT_FGT, it is IMPDEF whether
> an access to ID_AA64MMFR4_EL1 can trap to EL2 when the register value
> is zero.
> 
> A consequence of this is that on systems such as Neoverse V2, a NV
> guest cannot reliably detect that it is in a VHE-only configuration
> (E2H is writable, and ID_AA64MMFR0_EL1 is 0), despite the hypervisor's
> best effort to repaint the id register.
> 
> Replace the RAO/WI test by a sequence that makes use of the VHE
> register remnapping between EL1 and EL2 to detect this situation,
> and work out whether we get the VHE behaviour even after having
> set HCR_EL2.E2H to 0.
> 
> This solves the NV problem, and provides a more reliable acid test
> for CPUs that do not completely follow the letter of the architecture
> while providing a RES1 behaviour for HCR_EL2.E2H.
> 
> Suggested-by: Marc Rutland <mark.rutland@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/15A85F2B-1A0C-4FA7-9FE4-EEC2203CC09E@global.cadence.com

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

