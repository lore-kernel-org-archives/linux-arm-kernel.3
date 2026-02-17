Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C6E909BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBh2TGHPTLvgQExz5eL0TlNfP4fgRz62UAfQJNSjq0Y=; b=0bTT1ra4nYGkA11DBc5zm4MWms
	v2g6UPDMHXEUu8wVpOMweONCmoPeigKfkLLHooK9ubeR6KZG5aCwOEvSWhLccx+5mJzP4SUoVVexe
	nuNaZPtnni7VFx7UUg7GqF8t6fTqG4tvMwCEpeV5LGA8BZtZ4DeEFVxpkUy0tvt1cNUDNeHVlSk5s
	Cp8xPJig4a+l6VqQb++yfpK2lX5WV73U01EnrcOk0jGmVYaKsfkk7wehl8ZYXqeHJ+Xtl4HaRXvmt
	17fvTo/OMEeQzubhnJ76F8fm2Qnco7xPXao0I6vkestYu9LSfcZ3K+EdQI5pnvqDa7FKVjJVp1eI8
	BbKjFFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMou-00000008Ucc-471B;
	Tue, 17 Feb 2026 15:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMor-00000008Ubk-2P3r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3805404F8;
	Tue, 17 Feb 2026 15:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5950C4CEF7;
	Tue, 17 Feb 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771341416;
	bh=PQS9MrJH71dUd00Df5gWcVQOg7DLwo2jFHIJ+AkIGv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAPjneMROTU4OT7z0D+nLcriH2LhEVLvcEgtEx+eiFvVC7zqc6kyx2oAcj9sPd7Rt
	 aNPZcVn7bXBsuuyfmByENnRHJinNEUAuwmcsk82qbiGrF8r8SZ5LdgFzfjb7Wv8YWJ
	 C4KjPGoLMLe2UpozsT3P262ulzou8bkR0X7HbYLgqxjGoOku+tNTMxLEDC+j4JQ6C3
	 2PcQQRLU+Sz48OnGoFwYHv2rN4vMHSshDUKo7EFlTemP87gcQsNYBWgoOdZjs0Y8Sb
	 /0QbHwytK0uCChT1bxfbHitM1u0zJpyFv+cebPvcGu7U9avwDep5BsvD8bz4g1LWNm
	 ttfZwgF+DLstg==
Date: Tue, 17 Feb 2026 15:16:51 +0000
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com,
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com,
	ascull@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZSGY_yeNEeEr4U_@willie-the-truck>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
 <aZRY9UTSgw0Zf2Y-@willie-the-truck>
 <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_071657_650267_0E844189 
X-CRM114-Status: GOOD (  31.88  )
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

On Tue, Feb 17, 2026 at 01:31:49PM +0100, Pierre-Clément Tosi wrote:
> On Tue, Feb 17, 2026 at 12:03:01PM +0000, Will Deacon wrote:
> > On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> > > Hi Catalin,
> > > 
> > > On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > > > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > > > Although it is currently possible to fully disable MTE on MTE-capable
> > > > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > > > the kernel because CPU capabilities are traditionally exposed directly
> > > > > to userspace.
> > > > > 
> > > > > To address this, introduce a new cmdline argument (inspired by the
> > > > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > > > the kernel. Combined with KASAN, this results in only the kernel using
> > > > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > > > field are hidden from userspace.
> > > > [...]
> > > > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > > > +			support for userspace
> > > > 
> > > > Why would we need this? It's a user-space choice whether it uses MTE or
> > > > not. It's not like the kernel is forcing it onto the user processes.
> > > 
> > > Correct. This patch is useful when working with a pre-compiled distribution to
> > > ensure that a MTE-enabled userspace falls back to untagged allocations, without
> > > the need to introduce system-wide policies (and ABIs) for said distribution,
> > > which would also be inherently less robust than this kernel-level gating.
> > > 
> > > In Android, we can simply append the flag to the kernel cmdline instead of
> > > relying on sysprops (or similar early userspace concepts) and hoping that all
> > > users are properly gated on that sysprop, etc. This can be used for A/B testing
> > > of the feature or as a highly-reliable "remote kill switch", for example.
> > 
> > Why isn't arm64.nomte sufficient for that? It seems weird to insist on
> > tag-based KASAN support for the purposes of userspace A/B testing...
> 
> For a given architecture (and product goals), profiling of MTE might lead to the
> performance overhead being acceptable in the kernel - where security concerns
> are more prominent - but not in userspace, resulting in tag-based KASAN being
> required while a robust switch is needed to disable MTE in userspace but
> arm64.nomte is too coarse for that.

Then tell userspace not to use it? As Catalin pointed out, the kernel
doesn't force MTE on for userspace.

So the existing kernel cmdline option solve your A/B testing scenario
and I would've thought you could use SECCOMP to block the relevant
prctl()s if userspace isn't doing what you want.

Also, using MTE as a security feature is a joke.

Will

