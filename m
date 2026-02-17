Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520A6E68172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vzbt13cTVVUa8qerShN1nuevA2JZNOozrXrerglEvXI=; b=QrFxfmFnEW4h8Kg/BQlnA4LQrS
	uvW0PjCxAGxo1xQf79bHKr98u0RTMtNoAdV7s2E/IvLrKMu2MkDKhzFiiQmwxtZ4x8lZ8/o+v91I3
	6HlCI8ShQv+0gp8b4gy2GQkSndqCBi37UfPjnHQz2w5tfi3GAFfL8dS7apVCqQa9Wc5y38MeEJIEK
	3VkfA5E7bHX81lwzxJCm97GtN7HoEK/kdXMh8uzHnTdZeGG624m49Weu+xvHHdlIboQsgAcsxdxmt
	ZEF3myd6/ZXxUrrVrxJE7A4vg27hE/DYTHOuvzNedYZ8I+zoDlJg8kVbovKL9C4v6PuoC6EJdqTJ9
	qQcaQsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJnT-00000008ANQ-2pBF;
	Tue, 17 Feb 2026 12:03:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJnN-00000008AHj-3pUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:03:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 354D141750;
	Tue, 17 Feb 2026 12:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B651C4CEF7;
	Tue, 17 Feb 2026 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771329787;
	bh=OG0JE3ZDSDuBNbp+6jCwFLyNlStXOPQThoSVaHZplx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgRf/6Q6Wf448bI25XnrqX0FldCqSn8HMrHu9cFI8/IrX1gq7gkuY5leptfsghRQB
	 W+JKKOGryjvf3iF9mQQkztwezc0m7dYNMaTdOycyDg6vv/H90QKoNNIAi97S0KBYFf
	 bLkL6UVWwNrwPEJAYef3mQeAMNgrsad54dGtIvhh3EUGHetmAco4tqgx4U+wlXK3A/
	 A7ezpQDql0dLHe3b3kNnMsq8BRo9wHU9jSOG3JhCPP+qgfkfMQnfgDFxVXE4PbW7wT
	 I6ldl0zh5LxsNZ8dzHr01hm4Yf1PaoxhVzb8Kg/9AoOaVcPoGWBVbw5r5IDXSVoT3a
	 XS9evF+cryRrA==
Date: Tue, 17 Feb 2026 12:03:01 +0000
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com,
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com,
	ascull@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZRY9UTSgw0Zf2Y-@willie-the-truck>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_040314_867539_53323068 
X-CRM114-Status: GOOD (  24.99  )
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

On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> Hi Catalin,
> 
> On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > Although it is currently possible to fully disable MTE on MTE-capable
> > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > the kernel because CPU capabilities are traditionally exposed directly
> > > to userspace.
> > > 
> > > To address this, introduce a new cmdline argument (inspired by the
> > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > the kernel. Combined with KASAN, this results in only the kernel using
> > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > field are hidden from userspace.
> > [...]
> > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > +			support for userspace
> > 
> > Why would we need this? It's a user-space choice whether it uses MTE or
> > not. It's not like the kernel is forcing it onto the user processes.
> 
> Correct. This patch is useful when working with a pre-compiled distribution to
> ensure that a MTE-enabled userspace falls back to untagged allocations, without
> the need to introduce system-wide policies (and ABIs) for said distribution,
> which would also be inherently less robust than this kernel-level gating.
> 
> In Android, we can simply append the flag to the kernel cmdline instead of
> relying on sysprops (or similar early userspace concepts) and hoping that all
> users are properly gated on that sysprop, etc. This can be used for A/B testing
> of the feature or as a highly-reliable "remote kill switch", for example.

Why isn't arm64.nomte sufficient for that? It seems weird to insist on
tag-based KASAN support for the purposes of userspace A/B testing...

Will

