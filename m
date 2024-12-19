Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F1E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFGjNRP0uxlPAr23RP6P0EE52jzssqCnQg6esu3jwuA=; b=c00dbCQVjJu3MU0rA7/UebA/NG
	7QFPr/SK2/wPdnxSmNJt21fGXvHZ51CegGgnrvAZxvEHuCahbRp0ppfkDNsw9q8cmPr82xYXOx1k0
	+shup8eEJQvcCVV3CkpOMAvBHzGzC7lAecjb/KkeEbP9lMMRRMejzO2Nm1nTxag0sDO9PlSY7foIp
	VintN8/MvJd4Ra1UkWzwEJacHYSevV9E/Hhz4rLg/ypeMm+MZraNC8tqurEaNlE/BSw1RKIO/kgv6
	MGO5Iohxyf1BbvLPGzoVJOLNOcGrsQ5g8moAb2fTs2Gg2bZgGMPZDsPtdAmpmEv/L0EXzuf9DAzJd
	gs2q6lNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJfg-00000002PWC-3WmJ;
	Thu, 19 Dec 2024 16:46:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJeZ-00000002P7x-16B0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:45:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAEE45C0F89;
	Thu, 19 Dec 2024 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28886C4CECE;
	Thu, 19 Dec 2024 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626734;
	bh=z93HmXnc81TA1fMKgPsmy/CfQOosGuiFqnEeu+NkhsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLBqOUDXkpZyuXuhAV67RC04KxCF+3r857JtI2JP4+yF5ByMmECwcZAHpwVrkfwss
	 02T24N/GhJRALsDFYOWlkUu4knNSmtUzUNJSO0sIgq/fuoQ7fVz5HY/hq30mbLgzgx
	 Ewg41YcrCnbB8pecqakD83QnM8nJqjoNxXOBKF/BCzzjDVfpuc3ISyBk+OqCqFcGbh
	 puzDP+i3h8KI0FTDjIdZ/CQwsPbw8SVqnbJeNLWKovfviij1p9/IPn+xwPWnI/QkpI
	 syM7Qt6BLDWrRTMEsYcskdhfUaSjtElV7uFcRAV3NyYK83C8QmkLiJ0wpdrLU4smDv
	 /pitC3Q/mXCyw==
Date: Thu, 19 Dec 2024 16:45:28 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	catalin.marinas@arm.com, corbet@lwn.net, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241219164528.GH24724@willie-the-truck>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org>
 <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
 <86ikrprn7w.wl-maz@kernel.org>
 <2b1cc228-a8d5-4383-ab25-abbbcccd2e2c@arm.com>
 <86h678sy00.wl-maz@kernel.org>
 <5c551e43-78e9-4336-ab16-b55c0d6c7f92@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c551e43-78e9-4336-ab16-b55c0d6c7f92@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_084535_349637_342FD2A7 
X-CRM114-Status: GOOD (  21.71  )
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

On Thu, Dec 12, 2024 at 04:03:52PM +0000, Ryan Roberts wrote:
> >>> If anything, this should absolutely check for FAR_EL1 and assert that
> >>> this is indeed caused by such change.
> >>
> >> I'm not really sure how we would check this reliably? Without patch 5, the
> >> problem is somewhat constrained; we could have as many changes in flight as
> >> there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
> >> being modified. But if patch 5 is confirmed to be architecturally sound, then
> >> there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
> >> VA-range}'s that could legitimately cause a conflict abort.
> > 
> > I didn't mean to imply that we should identify the exact cause of the
> > abort. I was hoping to simply check that FAR_EL1 reports a userspace
> > VA. Why wouldn't that work?
> 
> Ahh gottya! Yes agreed, this sounds like the right approach.

Please, can we just not bother handling conflict aborts at all outside of
KVM? This is all dead code, it's complicated and it doesn't scale to the
in-kernel use-cases that others want. There's also not been any attempt
to add the pKVM support for handling host-side conflict aborts from what
I can tell.

For now, I would suggest limiting this series just to the KVM support
for handling a broken/malicious guest. If the contpte performance
improvements are worthwhile (I've asked for data), then let's add support
for the CPUs that handle the conflict in hardware (I believe this is far
more common than reporting the abort) so that the in-kernel users can
benefit whilst keeping the code manageable at the same time.

Will

