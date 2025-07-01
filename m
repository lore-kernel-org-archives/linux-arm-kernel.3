Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C19C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK4p8G0pyCnC9FqEn0RQ8k/V3iMh88LJHP9Q1eet4ok=; b=h/KXtLtvwULNApdFzoSg2vuPGL
	4xSyDfYXQhP6dbqh3VQTwZ052m2BmtXg+mtGlARm+UX5hlvZlyShzCZWiaR8+xShv2ZoWOm7E4A5t
	dG1zCaCHDhZTc1nOTi75Gs4UxrylwDs/NTQeAbHrHTUJrZgI8qbCQHAm8FSzmFWPh0+SsKBFtp4Xq
	B1EvSb1wiO6lwsbH6DiNaHO/ZAjQKdv4chXWPEiqY1b0woB68kaq+fRcJtD2aq2BCiF2Wp+/cEWTl
	AxBi1SPRk4WiWaasNtv/Y+DrimKtZeY2z8Fgq4RgBuqZJjD9D9q3p2y6ESmAlTT3eh5o05kztA7ly
	MHoDYbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV5g-00000004EOO-3yJH;
	Tue, 01 Jul 2025 07:07:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUR5-000000048f8-3oU8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351143; x=1782887143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nK4p8G0pyCnC9FqEn0RQ8k/V3iMh88LJHP9Q1eet4ok=;
  b=kmVuDywKAbNjw1n9dcccwxUJE8WhAGnNDBBGHVEsz9nyCpV/iuaI+BO0
   4rrLv/VWXHg2QY9xUFGi1NxSc2+mbTjq0Fi3KYFR8RG34K+mLq3WkaH4D
   rqjsRermvaThcq0Tuoy2F+BbsbdAKdym/DQV5kTh7L9TmC6Wyqlwwa+IU
   V+cf2wOB3eO0RzbllbjptkZ6783PKO3c3bV80lYY5wGX+0f+btpn4wUr1
   scRE02wh6VsQztv1uV0VcsxmGQkU4MqVJAJS00XDAF/shxoNlpSqlMILM
   NVQlPlrawfhyv9Irl/CwOxZy9SOfgaHpLEu7olaGY+oJcQTf0fS9XfBL8
   Q==;
X-CSE-ConnectionGUID: 620mXZKuTGS5s7ta6AS+yA==
X-CSE-MsgGUID: hWxztEe7TpmhUxhrRTX/Bg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943388"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:43 +0200
X-CheckPoint: {68637F67-6-468F1319-EAD2FB43}
X-MAIL-CPID: 9019E50B743E46FF6436B8F25B1106F6_0
X-Control-Analysis: str=0001.0A006398.68637F96.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8719616A570;
	Tue,  1 Jul 2025 08:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK4p8G0pyCnC9FqEn0RQ8k/V3iMh88LJHP9Q1eet4ok=;
	b=MHCRgmIFBlZwwf4tfLm7JkXog9Lhq0r725SsyHqbDNk6yVNnn6RzFZjMoOYM9xsjXzvH2Q
	J0DK9FnyF1m6rOm8Lzpjb7I4dX9ZV8+RKv1NzB8xNYkzQHIUGqBELUnl1dvdO1NnYYr1dQ
	eCZdEvVISX4oWCrPnBjPdpKb8boKJk0MqVb6KV88/2X1YRmo3UqozReQbZqiXllzM+YPqG
	j8iXo3GB0uaEypxlQbTh0kPJi5LMqV2DfFOQlVkL0ZgC7waJFn2DwXqd1DyF1A3KIJA7f3
	VzlZkJr3EVMYUmUzsH6lnzXENt7WIFP6BilshJUwPWUepihjSC7uJK3CqNd9Jg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 6/8] arm64: dts: tqmls1046a: Enable SFP interfaces
Date: Tue,  1 Jul 2025 08:24:54 +0200
Message-ID: <20250701062500.515735-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232544_250745_80423ECE 
X-CRM114-Status: GOOD (  10.57  )
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

There are two SFP interfaces usable on TQMLS1046A. Enable all the
corresponding nodes. U-Boot will configure the connection if the RCW
is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
index 37834ae3deac5..43261cda3fcf5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
@@ -44,6 +44,22 @@ &esdhc {
 	wp-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp2 {
+	status = "okay";
+};
+
+&sfp1_i2c {
+	status = "okay";
+};
+
+&sfp2_i2c {
+	status = "okay";
+};
+
 &usb2 {
 	status = "okay";
 };
@@ -51,6 +67,10 @@ &usb2 {
 #include "fsl-ls1046-post.dtsi"
 #include "tqmls104xa-mbls10xxa-fman.dtsi"
 
+&enet6 {
+	status = "okay";
+};
+
 &enet7 {
-	status = "disabled";
+	status = "okay";
 };
-- 
2.43.0


