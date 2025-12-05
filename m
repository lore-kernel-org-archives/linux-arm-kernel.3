Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871FDD339A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nPqydn2keEbLZ+PDjtZN3gmL/j/+WbvJVseRhOSLE04=; b=aIjzb3jTDuhZT+QrUjLjPkClgM
	gjtg9It7kmeGZYgPV3wUHruU5xz2WjD3rJN+uxVeDgDo9qOg2KRjxS0KcjF9Q8ry+ivxwFClMlOiB
	J3Po17bKDZR5sz9qQo3pHETnk4r+IFGKsHly67g/Kx3jhrRFL0GpbQEKLr5/onsl7Z0SxLfT1nAad
	9kCcfOl17zE39G2UZAB6E6dBAN3FGs6BoBHWbEpkCeb+RUzMmd7b9cK4kpTlAGDrhPsDL3QsMAh2a
	HBGPuSRPrdfVWtSfYXV3D75NWsNJiT7eZgJf15QTJu6oJ6+4aqCzimfLrrp4UIhqt18Q5q/fFNLhO
	CtiwgAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaVn-00000009nr0-1kPr;
	Fri, 05 Dec 2025 18:26:35 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaVl-00000009nqA-0IOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:26:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B0137A0189;
	Fri,  5 Dec 2025 13:26:31 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1764959191; x=1765045591; bh=nP
	qydn2keEbLZ+PDjtZN3gmL/j/+WbvJVseRhOSLE04=; b=kY1SDh5SRJoJg5fWFo
	1Vd0Tv4BQOci9CXGxEWyhq1KvmDI29wFEeB0483Ros/u2rMBySroPISzMwUE0+Nm
	JLHplM6Qyhs3TYf4PZo+U48ExEv8IHNRoVvReFbo7I0P/mrO7dMMVtXKYZ1FfoeJ
	g3GmkZ3PgMeBQdGCZoSGX9nd7TlFsCPUXkdTGHqfSInoGK9zgyErTT7VHAhSttOF
	7gU71uufQn4GOMoJMcOCXJcVeUoCh+pFPgTsFvmW0x+Iu3HoQPierOx6ft/Xa0j/
	DVo8o0xfrl9c+iXkc9pY111N791PoJmG8LtCcNDTxm6FyBWE/Gb/se5Hm0jQ+PKx
	I76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764959191; x=1765045591; bh=nPqydn2keEbLZ+PDjtZN3gmL/j/+
	WbvJVseRhOSLE04=; b=lSi3Zq5ATK8N1AlAZYarCJSPzYb4C96VN+MeWlwQmZ86
	qUk5UP3NP2+l/FUuNe+HSXPebd0BLRLEw7XMQBMXdwwd3G27WClwrlTTWdRAbCyJ
	NtNysuUmudg7buYp9W/Hb64DawfKlhpChyVDaJaRI4Zwk9Tm2nCUj/FPtZfZLjbs
	9pbuk1xgwEmQB27BSxMLi5xA4tWbRUEdJ3Qs0PhyfWJtIC818/Vxy2HWms5iRWrv
	pJmNopVF+cIdrUbck+QmgF0CpiAht2e7kAMbtLxZ7kUlFXrC/E0Wc48V6sNUkUDz
	x2niBCIBuf4mb/RnTigwEZS7VxC8TAs/KLb0kzDNsw==
X-ME-Sender: <xms:1yMzaWaD89lSCQDRcFsJuSCYsfbklAdW40ckju5XQRl1msPfQqg1Yg>
    <xme:1yMzaUNqUwYbq9PemMq5wlsQH808dMUfwttLi6-skTKXdknYAq94cDS0LgWenzGwM
    gDANxTIpODj7yl20B8HueeV-bFKFZnmYSNEq4vDSIJzFteEjgDu8FMm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkffutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceuvghr
    ghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnheple
    evheekfffgtdehkeevhefhtdehfeekgfegkeehuefhgfehjeetvefgtdduvdeknecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrh
    hnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1yMzaQFJr_rTUtDwHYsmS8TMlsFQArBYRJ7uwH6lDXEPBA1e104Acw>
    <xmx:1yMzaQPiUX4MNljV6E2CCrkapvu5W2g4DAX2_BycaWPE-A6K2DD-cQ>
    <xmx:1yMzaSeAwvHxNjETShuee1dn_PSjEtG-SjLaCOA_RQsrmHijnRNKxw>
    <xmx:1yMzadvEiCoZ8OEzMVZMKaguqfBkpcgWqWOLRvg69y6IZKDz8B67pw>
    <xmx:1yMzaXeFo_pcCtuav3yyw5ARwDmzo-q0be9VmYhLF4XuPl3Ny4Bcxflc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 39C12C40054; Fri,  5 Dec 2025 13:26:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:26:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 0/6] soc: updates for 6.19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_102633_596090_796004A7 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
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

Hi Linus,

This merge window is not quite as big as the last one for us,
but it still has 974 commits from 274 developers, mostly for
arm64 devicetree files.=20

Despite the size, not much sticks out. There are six new SoC
types, with three of them being completely new platforms from
smaller companies (Tenstorrent, Black Sesame and Anlogic).

The most active developers this time, by number of patches were

     44 Frank Li
     26 Kuninori Morimoto
     26 Dmitry Baryshkov
     22 Wolfram Sang
     20 Alexander Stein
     19 Krzysztof Kozlowski
     16 Geert Uytterhoeven
     14 Richard Zhu
     14 Aaron Kling
     13 Luca Weiss
     12 Heiko Stuebner
     11 Lothar Rubusch
     11 Chen-Yu Tsai
     10 Duje Mihanovi=C4=87
     10 Cristian Cozzolino
     10 Conor Dooley
     10 Chris Morgan

Dirstat:
   0.3% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/display/tegra/
   0.3% Documentation/devicetree/bindings/mmc/
   1.2% Documentation/devicetree/bindings/
   4.7% arch/arm/boot/dts/aspeed/
   1.3% arch/arm/boot/dts/intel/socfpga/
   0.3% arch/arm/boot/dts/mediatek/
   5.1% arch/arm/boot/dts/nvidia/
   0.7% arch/arm/boot/dts/nxp/imx/
   0.5% arch/arm/boot/dts/qcom/
   0.6% arch/arm/boot/dts/renesas/
   1.5% arch/arm/boot/dts/ti/omap/
   0.3% arch/arm/boot/dts/
   0.4% arch/arm/
   0.5% arch/arm64/boot/dts/allwinner/
   0.6% arch/arm64/boot/dts/amlogic/
   1.9% arch/arm64/boot/dts/cix/
   0.4% arch/arm64/boot/dts/exynos/google/
   0.3% arch/arm64/boot/dts/exynos/
   9.5% arch/arm64/boot/dts/freescale/
   0.4% arch/arm64/boot/dts/intel/
   0.5% arch/arm64/boot/dts/marvell/mmp/
  10.6% arch/arm64/boot/dts/mediatek/
   4.6% arch/arm64/boot/dts/nvidia/
  11.4% arch/arm64/boot/dts/qcom/
   5.8% arch/arm64/boot/dts/renesas/
   6.7% arch/arm64/boot/dts/rockchip/
   9.2% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   0.3% arch/riscv/boot/dts/sophgo/
   1.2% arch/riscv/boot/dts/spacemit/
   0.4% arch/riscv/boot/dts/starfive/
   0.6% arch/riscv/boot/dts/
   0.3% arch/x86/kernel/
   0.5% arch/
   0.8% drivers/bus/
   0.3% drivers/cache/
   0.3% drivers/clk/
   0.6% drivers/firmware/
   0.5% drivers/irqchip/
   1.2% drivers/memory/tegra/
   2.5% drivers/reset/
   1.1% drivers/soc/qcom/
   0.5% drivers/soc/renesas/
   1.4% drivers/soc/samsung/
   0.5% drivers/soc/
   0.7% drivers/
   0.3% include/dt-bindings/clock/
   1.2% include/dt-bindings/reset/
   1.1% include/linux/soc/samsung/
   0.3% include/linux/
 982 files changed, 59312 insertions(+), 7066 deletions(-)

There was a slight delay sending it out as I was still in the
process of setting up my randconfig tests earlier this week
and I wanted to ensure everything is well tested this time.

      Arnd

