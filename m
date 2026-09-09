Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DE9C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l+Zr7ZH/3uj/Y31eE4ONXsO32kJg+iEv0h43imtrhVA=; b=NyLBWNC3ha9WxkQPAX3MZm8KUA
	D8xAZ1dTneBwtcQA5Bm2PhZgW4Zt5zXeSnwV7zNSO4VxsYmP6M0cxDkaytqvu4pZCzknJmDslRIEx
	Q4dhh0iObwdb7NnDpYx7l+SV5cDcYTZwBZ0FdlDpMfCpZTd3/0+gFbWctgy4LBWhDsfmkqb3XUiVl
	hjt95py9dNf4mMYzAgj3N3AJc4/IHevvOA+aBYaUD6vt+6tiWUmKjUg3sUxhNSbc+ZIkfoJw9DTCU
	olvc4Mn8UhPkmBKWAIP6lDegslFdfixkIUaoHVDTF0cWqjHkN881MZ0rUUqgNrJeb6pB1xeynZhHY
	7qTAr+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jzl-0000000C6Ut-46RT;
	Wed, 09 Sep 2026 15:13:53 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jzj-0000000C6UE-0PhI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:13:52 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hg48F01nqz8sdx;
	Wed, 09 Sep 2026 17:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l+Zr7ZH/3uj/Y31eE4ONXsO32kJg+iEv0h43imtrhVA=;
	b=Gav6f28FwdptAziLY82ADN0vdmsrkDPYlFlviD/5ei6lMPSfzczQY3CMTBcEY6NSVW2oFm
	letVWebuREF7RlBxMTaTNSO4H/t7dhtXtaGQ0JmajSI+F67S5sXEeH0S4WKajgL5yOn0/l
	7vu03VvXbrwtr8YQN7R25zOaXocBfqi8PNDX/e7DwdjFru3vq7btQqXMgKL2s3NxjOYOIm
	4qqgthWXEE3DjFXQ5HZTB5TljW3SYSGqum5OnKOG9Nouy53OPtiCHOYf7/tMNLR8RfGUzt
	Vv5o3EkFJcvJDRxJQr6I72Kv9r8JrJ2M8Sh71+PD5CKIxEFTWmusYrbrCBMrRg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l+Zr7ZH/3uj/Y31eE4ONXsO32kJg+iEv0h43imtrhVA=;
	b=R8qONZ/TD7rKNF3I+ETMBdQGOXlb1p/XfJrzoAj+9MAe0DQ7PjPbpZlfIC0Mw13HxyRDIQ
	AWMgzezBif9hb2da9UpPG/7HPzutfiaCjd7yPAlyCYzjUYP60LG0SmnCkbuhI+WH4/jLc0
	2P1AznxCL+IuSolQ6tS6qFyO6wfDEAbWJqIzhtcO0sTcj1Lhql+nr0jsij8Ksq1ax973qs
	y3Je7fRtz7rQpk2MjwFmbfvrRkRfgjtImH9O2NJCy8tm+txQKlUl7GNv0K2OLi+fHMfJi1
	8bNvDMiupFbo266FtQ0pqyI5tFZA68n6phk8e1e5XBFwZOc8pHklkYd0Q9k8EA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name with label
Date: Wed,  9 Sep 2026 17:13:12 +0200
Message-ID: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: y1izspzudz5mcjqp53uq1e7u5ezqy9hj
X-MBO-RS-ID: 950bc9a4690d73fbaa9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_081351_297934_708B05F8 
X-CRM114-Status: UNSURE (   9.67  )
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

Align MSIOF1 PFC node name with label to improve consistency.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index a6294fd32daee..c6848a364098e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -700,6 +700,12 @@ irq4_pins: irq4 {
 		function = "intc_ex";
 	};
 
+	/* Page 30 / Audio_Codec */
+	msiof1_pins: msiof1 {
+		groups = "msiof1_clk", "msiof1_sync", "msiof1_txd", "msiof1_rxd";
+		function = "msiof1";
+	};
+
 	/* Page 31 / FAN */
 	pwm0_pins: pwm0 {
 		groups = "pwm0";
@@ -751,12 +757,6 @@ sd_uhs_pins: sd-uhs {
 		power-source = <1800>;
 	};
 
-	/* Page 30 / Audio_Codec */
-	msiof1_pins: sound {
-		groups = "msiof1_clk", "msiof1_sync", "msiof1_txd", "msiof1_rxd";
-		function = "msiof1";
-	};
-
 	/* Page 30 / Audio_Codec */
 	sound_clk_pins: sound-clk {
 		groups = "audio_clkin", "audio_clkout";
-- 
2.53.0


