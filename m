Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B9FD339B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw3/XGx+n6MFRz2AkAl7ezkOVqSXQTBuj2kUsjQMn1E=; b=YQ6kxprr94Vs//OILsR4jloeEV
	IZueP6hXbx+HEhqsBR5//5uPZp9+pW3koGwS8bRQ3SfS0tTw+wKzsI4T4tNt4ph5NZk610/4ZGN0x
	Y3MrZA7oG9PdCABv+pnTOMg0IRIsArWE8TvkYwJx5xh7C7kzNgvUgbBx/wYoVFGwFxx5TgFG2/fZ3
	BFVsg9uz/2mfRGK/YsQ76J00Hq5MD4Vk5nD+3Jsw6/LXBiLdPXVNtktp3GPDhXlmmra53XrnVJf5l
	MZcLMuAajWC13/+AnrAG3fFA2cqAyPXucfrM9/EXXzZaWtmH+vrcWAhBsPEK0DnLoXQNMelUPHdTt
	vQbLSm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaWt-00000009o4Z-2VtY;
	Fri, 05 Dec 2025 18:27:43 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaWr-00000009o3l-2OuA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:27:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E7B7B7A016B;
	Fri,  5 Dec 2025 13:27:40 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959260;
	 x=1765045660; bh=Kw3/XGx+n6MFRz2AkAl7ezkOVqSXQTBuj2kUsjQMn1E=; b=
	ACwGEEQNkb0UoTL1eF8uMCOQhU+z70qyvZWUGxgmb2bQp5xMYaQ1rikm/4Fy5pJf
	Kh9q2hjXhwCbW7TQbcPcsWLgcozAuNiaq3ZQtHO4zJnFNrQtbFw5AAx64liZH9rl
	9iELvzSJ8UxRUiWpNSYhVXBOYDAdW+yumwlqBRnbvxqIC/mjlRj2dyRijR9Adqc/
	EK8zR34alk36xsifwIQcKTKiudbcIk5qKgfrLm6azSGH4DZv1PU8YBtMTOAxIqV4
	yHrHVn/AoeqkJZWEb3QI3MdpGLhij1PWKtaly2FWk5qTRWoI+pYUtS+LZ+g87SKd
	QkK18hi0uBlDWic4l9mJ6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959260; x=
	1765045660; bh=Kw3/XGx+n6MFRz2AkAl7ezkOVqSXQTBuj2kUsjQMn1E=; b=O
	6GgxzaqPery8//kX7ZbTOSSgbyS7OQoyicWeuwRHBHYGQ6PyJQpX5WUt8dwZ/K7X
	BOYqU4OsLbe0n9lXQAiSNxNCrTDV4jMnjOGlLKx7J20OYTm9OLf0CeyJrRr0Q168
	o2sVaw8yNmBPHieB7C2yn5BIkZ467JrsA/Oi3dqo/eZI+b/+DyDHzKp4DuTqAqbq
	D2qiT1MTAZOnuzmYAzWNuMTZrijp9xphIyn+n/+Vkcv+nYJ//k/HFI08KKMrIgQK
	9q0M8NwUwVSNTSTtnnFaDNHYBIYf1FFtDsBNZUxdRlPpwWu38N8oFFQSmrDp0v4M
	jr/hQAIjJlsmAPiEEcBrQ==
X-ME-Sender: <xms:HCQzaTb61VjN1-70VJAFwlh1oNWvjYFxjAY1TAwkE-T2fh1TtkAGNQ>
    <xme:HCQzadPgPmsbTwXXcgLR_ViRJr5qTdvxU6Q-cluRjf2ir5Uc52mSfN6F-VMshcZFp
    QP7LZKb0SKMaFI2NueIjRDwCodSm3XIdAvgcLVSXssPkEZ31GA92jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HCQzadFnpbonUmTidBMGLxD5d34V-mtkRHtDMf2p5CLNedP00cx14Q>
    <xmx:HCQzaZPgiyEKIuLGFEgSwpFGxTAd-29KymuDmnZO-jvrPyOtemeOVw>
    <xmx:HCQzaXdD6RisaR5Fyff_Bs_Yx1Aajq6_cHlUUm_WOgRI4ljOs_1e_A>
    <xmx:HCQzaevNQxdk1zI-SRyT9-HmEhpf7cpu7i5kzl0fizHWIHchVdw7lw>
    <xmx:HCQzaXsJ4ZV2nAXt-DUx2_GmRecliiB6qTj8af-rt1JFGgMG8hJCJ3mb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 93453C4006B; Fri,  5 Dec 2025 13:27:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:27:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 2/6] soc: arm code changes for 6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_102741_656871_75851A95 
X-CRM114-Status: UNSURE (   8.09  )
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

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.19

for you to fetch changes up to 3ce8f4a501f61edbb5cb3fe13520f09ffb33396e:

  ARM: omap1: avoid symbol clashes in fiq handler (2025-12-05 15:25:13 +0100)

----------------------------------------------------------------
soc: arm code changes for 6.19

These are very minimal changes for 32-bit Arm platform code, enabling
SMP bringup for one more SoC variant (mt6582) among spelling changes
and a build warning fix.

----------------------------------------------------------------
Ali Khan (1):
      ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

Arnd Bergmann (3):
      Merge tag 'mtk-arm32-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/arm
      Merge tag 'omap-for-v6.19/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      ARM: omap1: avoid symbol clashes in fiq handler

Cristian Cozzolino (2):
      ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
      ARM: mediatek: add MT6582 smp bring up code

Julia Lawall (1):
      ARM: gemini: fix typos in comments

Shivam Chaudhary (1):
      ARM: versatile: Fix typo in versatile.c

 arch/arm/mach-gemini/board-dt.c             |  2 +-
 arch/arm/mach-mediatek/Kconfig              |  4 +++
 arch/arm/mach-mediatek/mediatek.c           |  1 +
 arch/arm/mach-mediatek/platsmp.c            |  1 +
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++++++---------------
 arch/arm/mach-omap2/omap-secure.h           |  2 +-
 arch/arm/mach-omap2/omap-smc.S              |  2 +-
 arch/arm/mach-versatile/versatile.c         |  2 +-
 8 files changed, 29 insertions(+), 23 deletions(-)

