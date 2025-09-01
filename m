Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106FACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwJ2WKH1H490817JZrIF2HhbRB9uxRG9YoYOE03Ti6c=; b=24uoAWgxeUzMdA+hIHWC8AkD93
	VRieWsQsFL/LPGBCsA3S6jUMJanAhrz14U+P7ECHjTox0QvdQJOQhiunvxmT2i0k0Tq2BYynWafmw
	xF71ny9ber/C/BKMYfwi00NC86iYxuo9pyuTysuBMWJppqDS5ENPqc4CDJE7NC+svQV9dVsf5O3Hk
	KOvZxhWhPbj5H1pct+B/M1J9p6wTULCoNeSyu5KP1O80eW5nDJsvxuAxmrldRXLhOzj4Atm1SLUFf
	mZDlFPl0DNRMQnn04tEwiIj5pdbSGRAHVpSrhYweAy+dsqucuOheZGDngYHnK2eK0ghx0+cBs/NR7
	kgbNVcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vl-0000000DHWW-3LzI;
	Mon, 01 Sep 2025 16:36:05 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zW-0000000CakN-0rD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:35 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5607a240c75so694047e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731032; x=1757335832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwJ2WKH1H490817JZrIF2HhbRB9uxRG9YoYOE03Ti6c=;
        b=P3iWYUvEbWkgo2y2N6ne9mXwc53eO8eA6JMmB8H0Cpn/aRaBuPFs45KQ3rCdAPVVcW
         kgd8xyPoNI+Pe26OMCZ33qBEt5iJ0lJse1vvkkF3f4ecvulp8q/fEx6n+1ok4lzkFZBH
         UayI0+3vzzJ/khxR7JJFsiS9vVPsoTuqLn8p9vYAjIsCR7AO9zR4n9RC2PSNx+mghw5p
         Z98i5LrxLksOFVc4LkbmN7i6Yaq4M6a+uccC7/25LTDR5bwSmSeFF6YIAwR3UNoAb46F
         8MDIVGAtj5TfyRp1t7QC2t0NbbjyVIbx6oT5JiJ36otTGftv21+plPITfVsNORMGSi0V
         V3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731032; x=1757335832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwJ2WKH1H490817JZrIF2HhbRB9uxRG9YoYOE03Ti6c=;
        b=wbNITJwOkX0a4AXbpOFRX612lJAIKz/v2DQMurDfv/47oYO0Y0j0AiGDg+6ywVhshd
         QJ1jmVRJCj63bBzPe5vTjpoFWzrFggTyMfp06rWILAOESfedpYgWg5m2JAppn6KQmlcJ
         W737Kog3b5WqMUe6jiT5OdZ4VWX85Jx2eSfO3dgz9xjjDpM78nF5mV5K4fauIY2p6nli
         T/snIQLiNLmtnihFj7RJPR4BcuyCFnM4M+Pkg02/B+mhqpQOFB0Szcb8E/tBxYEfrLzH
         jSMqXDKGNrvC4gt8un4bM+4dV7B62RDK87fbRWdQWgDJF1ifx4DqBmWaI6D/JeESE992
         Gi/Q==
X-Gm-Message-State: AOJu0Yy9JGBkhOjivOwDEUdO9/PkutqhUgX/E/FkHBHwLFtoxa90NE7g
	m4oZ7MH/OLLmenCmt0q0msevMj1ctyidGn8Joru3JD/QMZNTUf51AaqdiYYG8XeFoAM=
X-Gm-Gg: ASbGncvnuoh76lKy8xAUm2OkmQnrN5QSEUcRBQ/l+AHM+6nJGMNPylDMgHsrz/P5uXu
	WeTakPpCfPuLMo7xrcLo3ILTibQPnEobF3vWpxkwAqPr0k9rORa2O6WSEypEojZi8Fcq+FoAT5F
	f7V+gpFMeRyZTRvMQPBMQqux/MwX06vyWKN4D0op0eFVmsWrAL73ZACE06bWOUSwHzBQPu6gVVT
	W0J+jE6bwSAtHuLP3YiJJ1t6OPgrfhIXqcpmdRm1pbQDA0y4QoQ4iG4qPeA8+4O151cKbLba/aP
	FolfdBbSZDfV0cv/8YwpLpYh6e2C8g4zO7iGJnqGSXeczmwui20JZag0U2ups0oxZjJpByjigGx
	OXzc4MPrSblDcuY6VjenAxDZx6QD1Wkzs
X-Google-Smtp-Source: AGHT+IEsND7V6rDobBlr45ywRBtCrSw7oTFRiTtaEVycfQ4gGkM7LfCecQZGNk7Yz+5CdfVv21mwUw==
X-Received: by 2002:a05:6512:104c:b0:55f:6bae:50c5 with SMTP id 2adb3069b0e04-55f708c204emr1887113e87.19.1756731032433;
        Mon, 01 Sep 2025 05:50:32 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:29 +0200
Subject: [PATCH 4/8] ARM: dts: bcm6846: Add I2C bus block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-4-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055034_265723_575CA547 
X-CRM114-Status: GOOD (  10.51  )
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

The BCM6846 has a STB I2C block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index f5591a45d2e4ad64d8f95680aea327771825252b..ac5c810a92d76f1130d0caf0286d6401e0e7bbe6 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -242,6 +242,15 @@ mdio: mdio@2060 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@2100 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x2100 0x60>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pl081_dma: dma-controller@59000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.50.1


