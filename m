Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA5EB28CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5zMAhIMXzQJ8=; b=xfVHe27dc3eM/AW62BPh9q3kM6
	1cTC5feecOz8x5S+QRNF2O6ikEP+v8qV7UvVw6uwA/z29oX25ZuGDF9DfcrFSSBZkzabPUyz4nezf
	5kXDzBkyeQ941wsLRH9fkUz3WcUWfR8O3ENuXqwRm0rWu87H7Yn55XWEGjZZQjmPuJtNwd3mjAnuW
	srrV8IWtF0Qr8cBwx2Fqv3c3+mgub1FSSdAua3dpZ/UffQbeDSwT0BemYYP4k3GDnM/Pe7hCyhkPp
	PASu2DgAET3nUpzx/hp2HTVhuJpzY6dEDBwDyIiHpMSyzx6hc1oN323SVKTTVpKbBQZt53N61qMUG
	BDESZpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMS-0000000AtVd-01HM;
	Fri, 06 Feb 2026 05:26:32 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMN-0000000AtTF-19th
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:26:28 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id E7181EC05A5;
	Fri,  6 Feb 2026 00:26:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 06 Feb 2026 00:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1770355585; x=1770441985; bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5
	zMAhIMXzQJ8=; b=PpPCMc3RGGmhHjR5tB+bCfiDbkDNyLiuUADAZ/EfmUay+Qdp
	u6wJErQnynqosG6UqkPAiUrVgou6t4jxACATnEnFpM+LemdVuBeqbMk0vi8UGJSH
	KBjXfrEvdejWtKViG5i2ZW0KT/yTLsilCfZctwNERdVImTPaZVFgAf+JfE9Bfj6H
	0ZSxSfZ2WllkAMIoZfitu1xwVatOL75Kbp4E4Y9eWTduzHR1azI9F5xFN3g1BlOt
	TE2lIInp/GIUWUuETL0n+Bq8cnRpYFNuoo3Jt919ELqvUtRMTpGVmBYO1fE5wNmP
	ZNSP5F7p4IEnt4Y0SoLDeQt6f4FqT0E0b/b2JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770355585; x=
	1770441985; bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5zMAhIMXzQJ8=; b=A
	0S4CdnDmGFPVw+OjKb4FLXJewY0i59OTDvXNpgZCvaGUwGNgN4hpn0UcY1fQ1EC4
	kfHjkYz6xX02456RBGeYqM67Ys3K50JDt/QRcSK+AWSHdfGR7QOL1p7kXSx5EEFN
	yZS8HbYG1pFvw2gjJ1mY/qaxWi3vWcIZDvADzdrHi3nq6Q6Oytl2rQevmGzQvPKb
	jqjsk1jgf3yZuQvRsXaGd0RC1Oy4t5PqmlMBeumyDqcolu4zdLXIkoCM5wthVDTR
	UIxMsl43HQcKjlKxoGw5Y/3safAOygIZMMDmUy3kZMdERp5n5gv2bZl4VccLqIib
	Cl0jwse30T4UVEA31zT1Q==
X-ME-Sender: <xms:gXuFacnX4vZBd7EoMs7kRIhAQjz62NoNdfS6-tMr_O7EC4yDeSycMw>
    <xme:gXuFaeZWdFrMPqVHVC7SW6yAS68eKAiFXLWpffmKdRB7X7p5FSyMc1qpE5R8NId_f
    XGWY7m1Y0QsBqh1FPGPgpkOEF1wuK_QtYwAPayMsHt94sRherjUMaY>
X-ME-Received: <xmr:gXuFaeR4wSArSgY40SDxlAJzVYQhdeTizbuCre8JNgPSZbm_7CzQ4DMS3-u8XL_pLQaVnwQIg-4sRO350afEqUa4GsoSF_h_2xZ31DstsQG5GrR1hLbWPVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepffdvtdfhkeelffffgfejkeefteeuhefhiefgfffgkeduueejheff
    teffleetgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghtthesthhrrghvvghrshgvrd
    gtohhmrdgruhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtoheptghonhhorhdoughtse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gXuFaYsGuvzepFGjKF4gGhqrGfkGFH5maIfnzq3olYrZ-Er2Xh-qmA>
    <xmx:gXuFaQHbudDWngDGjjPptw8PGqI8GUZQKpGUbMdsdKRg27bu6-ft9g>
    <xmx:gXuFaZzbcq7N4M-HiS60L4iFdk7UtIFVt3FUFcWz3uHD3xn0Utrabg>
    <xmx:gXuFaa2lDP0m2PGaEjDsYaE0Zly17n4KWyHu7qqBMYm_u645y40jng>
    <xmx:gXuFaakb5ik90hyeopQnkcUpFPE7ww2WBauDEx_ZpCQ9BLIck5mlfN3U>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 00:26:23 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Fri, 06 Feb 2026 16:26:13 +1100
Subject: [PATCH v2 2/3] arm64: dts: freescale: ten64: reduce maximum SD
 card speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-ten64-dts-updates-2025-12-v2-2-2d77f47a89e7@traverse.com.au>
References: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
In-Reply-To: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770355576; l=957;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=zLFSas7YCXsYAOAsiXQ6e1u69vx7mNvPzVZzPdr1qiQ=;
 b=g5OszKesyImhC0mgmOQgHoww4sPV1OyqVu4tMfGY2GUzUVW/8PoSJtaqORKskmr0DepmlFn6i
 KDEEXfD6lVRBpUFMoqcqtun7IXCRynGPOoIUuaV6UHpyL1QVi5tNk3L
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_212627_648546_851D4DA3 
X-CRM114-Status: UNSURE (   8.58  )
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

There have been user reports of timeouts when using certain SD cards.

To improve stability, reduce the maximum SD card frequency to 25MHz.
Reducing the maximum frequency will disable most high speed modes like
UHS-1.

If this issue is resolved in the future (by PCB change or software tuning),
we will apply fixups in the bootloader to set the correct parameters.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 35470c0a928f..0a460eebd636 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -261,6 +261,7 @@ mdio1_phy4: ethernet-phy@1f {
 
 &esdhc {
 	status = "okay";
+	max-frequency = <25000000>;
 };
 
 &i2c0 {

-- 
2.51.2


