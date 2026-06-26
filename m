Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A06CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nvBLBJx+kT93NTleCT7dpiOIClkWaZ9So3A0zf5NePU=; b=Ix+vqPrRQBcWjKjR2ziDlQyvBp
	Jyl0aWr7fU0wJxuRtDhoyErXNMHB4Xb0kaEnoI+/J0quRqbN7oT3OB/e2nmifAbXWcRUPAKnBbu3r
	zvFQVkqgztvGCodRhbGHnb7Gi6fud368x/KdHI7AtvKk4h2eX10nk1qFGMGAvWEBfPVhuuU8bDYYG
	6FxRQx3B1P0sQBDjKr1B0eQOWuSer5W8WCqwe3KyD5xy7TEkSPdmLZpmmKh12nYLEpxpB9wfvC+9v
	zMHkaqqWts+G7aJf1usKcExGj2IRGrluesu60oUttENpvJVGLJuFuOc5GxGMKIafUE25ySn3gTVL4
	fKuJFGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Z3-0000000BCNg-3pbX;
	Fri, 26 Jun 2026 11:17:41 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Z1-0000000BCMN-08Nl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 11:17:40 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-30c713f37c2so1717327eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782472658; x=1783077458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvBLBJx+kT93NTleCT7dpiOIClkWaZ9So3A0zf5NePU=;
        b=MWM7ZMFskLhOh0Ip/5EvQu+zIrgeSPjtxY/yO1CJYro+kXd0lYKvSBlNMsl0o75in+
         A5XG3AzIzfdyM66rRe4nEQa66bIbGLHQUBUMR0AwQwJBk8LmZ5qT+yKjpMwYBq+gZUoA
         OQ1/tk+WeknknZy9Td6S3Ot8QRIzM1RnbSbOx0KOQQUzi66hqPPU/UcjVG3vnBw9jaMV
         xzKiX1uyNE7Mi98yB0ZaXcSb7jleGakflgISObyKsblSsejnYhhI3ae49KaC+X2DVnFd
         JmI2jjUvaXgwAJpEqcaqmg3tQINh3kipGrzsa5CkD5DvXwpJYpVLm0KKmseCNhzcIPNG
         oNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472658; x=1783077458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvBLBJx+kT93NTleCT7dpiOIClkWaZ9So3A0zf5NePU=;
        b=IEYF+MFNrjT/aiCUSlUfK+r8vdJxeFfEyA8fdcRDSuypyP886PvkOS8933HpiA0GGH
         nn7AvIAXHA0kOaqlJHm8zUBnzuJ0bXpqaSXQ19B3IUSiTDJPViMQ//3Pk1edMJt+Asa5
         W7wJUxsfAbuL+m8omiqjyo9M8XRebn1lJnOicuFoaWWqRrmE6TpHK6sz9AIhGgMV7VbO
         z2+zDx6QP4PsGJKu21zIOyA9qeb7gi/fv4kozTKveNtck2U9FuXxBhSz6hX0lmquvh8X
         I/RjXUwGhcAy+p99R7mWOQZOUUaRofkOLVVvPR9u7w1AqiP5fsqxwN5zkC3nGTjVN246
         gFxg==
X-Forwarded-Encrypted: i=1; AHgh+Rrs+EX+2EgMZXcWdCxZZwAds/2GSLrpdd4BXiCAixCVBLrxbXZXTHurvv3+/vMPY8+q/wJMcsWOUCXZL8uyFUix@lists.infradead.org
X-Gm-Message-State: AOJu0YxOI9O64WBetgjdhfqHgkYhE0RtyEfqIHmZAbISn7MsRXhSfPGi
	MLI35CseFbI6I7YWIgOowytKnfGnWoo4YltyJtWPUSv4EwMl7XpS3aIO
X-Gm-Gg: AfdE7cltowAN8hc1WOHtmIcu3RXPuki2H82wiSvsv10/DaTQr5t9G1zlHjV10Fag74C
	nZYUAoxzw5olyGJhFpyR2UsqP6Dx7/qro43GjkmXYr/n4Kg644vL6/CWQAYhd2i0B8NhbHYxETu
	6fZa/z4et8zgZWu9IOVRP0tjTuI1XiCLokhPJrg7vih7MxDRt/qf8rzG6o8YKNb/Gb3b9XMnls2
	+cx04w2hnn2miirWpS60gLOEoEYpLrAduhfD7poJxyp30v6KHhywVa2ji5LFVGKkOxit8PrYtP8
	lV/1NhH6V0zIroeeKrq6pvMgClvBIXlLa99v6Ma9hJQJX/US+IDrIZPsMnA807xJlLtvHAdTAQp
	Jq8COz8WcT0V6yXhNU8zbF2pHpnlI8kuUf5YQ6mxRcQwrE1W0h9Q+VDN06AWoHuafElkDmyMYm9
	XMInlGbAToov5fx4SQoKv67+P1AN/cahIokKjq0fXd
X-Received: by 2002:a05:7300:a485:b0:30b:8878:9c8e with SMTP id 5a478bee46e88-30c85468412mr5529542eec.2.1782472657813;
        Fri, 26 Jun 2026 04:17:37 -0700 (PDT)
Received: from primary ([223.181.21.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm19391852eec.31.2026.06.26.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:17:37 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH] ARM: dts: ti: Fix typos in comments
Date: Fri, 26 Jun 2026 16:47:20 +0530
Message-ID: <20260626111720.56688-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_041739_071595_0E7CF2EA 
X-CRM114-Status: GOOD (  13.81  )
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

Fix comment typos found with codespell across DaVinci and OMAP
board files:

  limitaion   -> limitation
  swithes     -> switches
  converstion -> conversion
  differnet   -> different

Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am3517-evm.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts b/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
index 8390d71b000a..e70edd5274fe 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
@@ -366,7 +366,7 @@ nand@2000000,0 {
 			 * to NAND block 1 (NAND block 0 is not used by default)".
 			 * The same doc mentions that for ROM "Silicon Revision 2.1",
 			 * "Updated NAND boot mode to offer boot from block 0 or block 1".
-			 * However the limitaion is left here by default for compatibility
+			 * However the limitation is left here by default for compatibility
 			 * with older silicon and because it needs new boot pin settings
 			 * not possible in stock LCDK.
 			 */
diff --git a/arch/arm/boot/dts/ti/omap/am3517-evm.dts b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
index 40f15da81043..a4357fa9f006 100644
--- a/arch/arm/boot/dts/ti/omap/am3517-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
@@ -213,7 +213,7 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
-	/* User DIP swithes [1:8] / User LEDS [1:2] */
+	/* User DIP switches [1:8] / User LEDS [1:2] */
 	tca6416: gpio@21 {
 		compatible = "ti,tca6416";
 		reg = <0x21>;
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index 43cf4ade950b..76bfb364777e 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -420,7 +420,7 @@ stmpe811@41 {
 		st,mod-12b = <1>; /* 12-bit ADC */
 		st,ref-sel = <0>; /* internal ADC reference */
 		st,adc-freq = <1>; /* 3.25 MHz ADC clock speed */
-		st,sample-time = <4>; /* ADC converstion time: 80 clocks */
+		st,sample-time = <4>; /* ADC conversion time: 80 clocks */
 
 		stmpe_adc {
 			compatible = "st,stmpe-adc";
diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
index a933fe560834..70c609811d11 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "ti,omap4-panda-es", "ti,omap4-panda", "ti,omap4460", "ti,omap4430", "ti,omap4";
 };
 
-/* Audio routing is differnet between PandaBoard4430 and PandaBoardES */
+/* Audio routing is different between PandaBoard4430 and PandaBoardES */
 &sound {
 	ti,model = "PandaBoardES";
 
-- 
2.53.0


