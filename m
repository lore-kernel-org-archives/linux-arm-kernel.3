Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2322E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE3VuT8nsu8wH/NcmNLwmjpan81n5nZM7l2ihsD7w6k=; b=D9b9AsAtMqCqpsOiVHznENopxc
	HI1xmzDC/jeT4MLpsy4jnlud1HP3rHdYDFZ3fXfyD6FEJD9Lh0N8tyuc+ZqqllVm1ecEehUVVhFrZ
	ffYCvy36UDAlv2UyFW050kXKhS9CvokMd//6U6ibBmrUwC+NC4ldp0X7ae2mPjam5jAw7TKeX8MT1
	3aoCwXJVB02zfjHW2rT+VTWjLIEMQuH/bY1CkRBYabnF2f/xEPh+QmQ934XkV3PZSN9yrgXg8TdKw
	//TSRI8ifcLZj/tMMKHrDmXzBf/bsdpTta9oZAuOeI+vS9KGjUioTDGtaXNEj6PuTmMkWISGJFInE
	mm4Poq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOzp0-000000071ke-2Bgt;
	Sat, 21 Dec 2024 13:47:10 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOzno-000000071fV-30mX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 13:45:58 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id B6291114012E;
	Sat, 21 Dec 2024 08:45:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 21 Dec 2024 08:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1734788752; x=1734875152; bh=bE3VuT8nsu
	8wH/NcmNLwmjpan81n5nZM7l2ihsD7w6k=; b=TvV1PzxadDVx9nYjiOTs//1BE/
	91OUtYCme66eCNJMVeHli36Cp4mjztFxK35EYIP1h1yotAe3IMR2HV/pzSjbBPzT
	TljCmUoI1rb7F/XJIgEZMotUiGjXVawAkJa6TveNE9EH1oe5/Dc8jsFSyYYgROCA
	NMoMqZANmNMCr6M6yVot1fjWz/8hnH10F5p+QQiwfYCVaeE2ZRbXR6unXl66HdBg
	dKwVgQV4LZfRFO/IndmYjodwz3JkMZ2RC+nNhCcHhtCttQmp9TheIUvPjUKE/jZS
	zEQHJYt6t6RfIVtyTEgN55Ra6vyzIH/domYmAGShEsAcVBdLYcr80NkhG9iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1734788752; x=1734875152; bh=bE3VuT8nsu8wH/NcmNLwmjpan81n5nZM7l2
	ihsD7w6k=; b=hVK09Ri5p6Ljy+rKNuBqAOXt1Fc5+nseFQzvvYiqfMUZrIUkgad
	wjVdksFQIcZzjE4L1DNHh1vxylO/M1nBXHThzDX8eIOkjVHuFHeXI8Zcrvf9q740
	Xw5+nnGXhe4vE4ZgABlD8IozDFzAMMSLgCLdOjo3CVXLLCRKfm5qiqKlkoOzvTL4
	VhoCX6hAKPXyJPvD5eNcgK2DqkJXmPZVyfOIHP4v2FDIni3qsLMMr4O+uSQzHuqO
	Pk6Kme8K3zaJF5JwV2JMxCW+VD2WknIvaaPcRPWzSM0HohNfmeMpaZvqiLJYKjfZ
	UZzu2vrIx4haGOIolv+pbGAAkRXtBSv/bow==
X-ME-Sender: <xms:kMZmZwsFywgE024mlAgvbsa2SNYyKT7m2AXFdzkgPvBXCEHTMQdtIw>
    <xme:kMZmZ9cjE52ahsur5INrHwRrBLnXj2PTs6vIpVFD61xpozOxEjNkvuKBi8lWvdeWJ
    4-B8OHtNePj4b1VXtY>
X-ME-Received: <xmr:kMZmZ7zE7YYe53J0H6RKMQ0A7ol8XKYFlvu3zXHx6zeRpUIj3v3vb5hOrCrPWLzjuxGwMy9gdhuRpZSxtc727f2DSCzaKEoZaQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddthedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgvdffveelgedujeeffeehheekheelheefgfejffeftedugeet
    hfeuudefheefteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepudehpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopeholhhivhgvrhdruhhpthhonheslhhinhhugidrug
    gvvhdprhgtphhtthhopehkvhhmrghrmheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvhidrghhouh
    hlhiesrghrmhdrtghomhdprhgtphhtthhopehsuhiiuhhkihdrphhouhhlohhsvgesrghr
    mhdrtghomhdprhgtphhtthhopeihuhiivghnghhhuhhisehhuhgrfigvihdrtghomhdprh
    gtphhtthhopehmihiihhgrnhhgsehgohhoghhlvgdrtghomhdprhgtphhtthhopegtohhl
    thhonhhlvgifihhssehgohhoghhlvgdrtghomhdprhgtphhtthhopehrrghnrghnthgrse
    hgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:kMZmZzMYMbxNKDZTU30BJEzm4UB0sfPOEUQa9a3PSeXpqw7v-HD68w>
    <xmx:kMZmZw_k7AEaAotwDy1RIjctUIt69gtq0qHA4pHxrux8_K_kqb-EsQ>
    <xmx:kMZmZ7UwfWcPnpfyvTB03Z6MX-D3yDMRbDIq7NlLhUSxc7gDIW8pAA>
    <xmx:kMZmZ5fsidmnKnYtRFGAMB-AOoreA7Z9kaQ69Ahbw7T8hcy_a2Eggw>
    <xmx:kMZmZzelUpnZqgmVXitvSoXGTBsS5q0zjgqNP_10BFDLRzIsgw_vYrkY>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 08:45:51 -0500 (EST)
Date: Sat, 21 Dec 2024 14:45:49 +0100
From: Janne Grunau <j@jannau.net>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Message-ID: <20241221134549.GA2917938@robin.jannau.net>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_054557_282554_F2E677E2 
X-CRM114-Status: GOOD (  18.80  )
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

On Tue, Dec 17, 2024 at 01:20:30PM -0800, Oliver Upton wrote:
> One of the interesting features of some Apple M* parts is an IMPDEF trap
> that routes EL1/EL0 accesses of the PMUv3 registers to EL2. This allows
> a hypervisor to emulate an architectural PMUv3 on top of the IMPDEF PMU
> hardware present in the CPU.
> 
> And if you squint, this _might_ look like a CPU erratum :-)
> 
> This series takes advantage of these IMPDEF traps to provide PMUv3 to
> KVM guests. As a starting point, only expose the fixed CPU cycle counter
> and no event counters. Conveniently, this is enough to get Windows
> running as a KVM guest on Apple hardware.
> 
> I've tried to keep the deviation to a minimum by refactoring some of the
> flows used for PMUv3, e.g. computing PMCEID from the arm_pmu bitmap
> instead of reading hardware directly.
> 
> RFC -> v1:
>  - Rebase to 6.13-rc3
>  - Add support for 1 event counter in addition to CPU cycle counter
>  - Don't sneak past the PMU event filter (Marc)
>  - Have the PMU driver provide a PMUv3 -> HW event ID mapping (Marc)
> 
> Tested on my M2 with Linux and Windows guests. If possible, I'd
> appreciate someone testing on an M1 as I haven't added those MIDRs to
> the erratum yet.

Tested on M1 (t8103) with perf in a Linux guest and the patch below

Tested-by: Janne Grunau <j@jannau.net>

I'll import this into the downstream asahi kernel as there was a request
for performance counters to aid FEX-Emu development recently.

Janne

--- 

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 441ee4ffc7709..45ef67ec970f5 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -195,6 +195,12 @@ has_neoverse_n1_erratum_1542419(const struct arm64_cpu_capabilities *entry,
 }

 static const struct midr_range impdef_pmuv3_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM_MAX),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM_MAX),
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD),
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE),
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_PRO),

