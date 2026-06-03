Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C82CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=; b=3zP5BUbxDfrtD463nuXcrbTbjr
	JXlfTZRjjQCA/RlYPqE7POFwqbGAV/nV43nisU2uEFdroE4/EvGUUyaKOLDDjE9ss6UoJM18cnsKx
	XIvgrpIRj4DESSnGPtubk/ynxfAF9CEGTl7kLVISLqQYdqxqBjGocoydsSquh8KJouyeASNHIUCl8
	rR0WDRgH5oho9GfcEeQ+xvFA752dDyOqCg3rUTU46fSFX5Aba8pdsqN/93sExHBsNuR2WswnC646A
	ECckAPA4Pf3LgS4WtgiYpTzq7bBtT+D4vsprK5QWn7047KQE+40WUjpODCTaVuxKoAVkKX21yVJa5
	x2G7CgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGU-0000000F0JR-2rLO;
	Wed, 03 Jun 2026 12:00:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGR-0000000F0HK-0JYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-46013161068so1720802f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488001; x=1781092801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=oaXG20hf2cof+Ym2Gu1XLTz3EpbCJCql5r8wZyTEjr7/pRnCK0PHiYKJse7pecb7GX
         U26DwHzO/d5/aKNPPclogT7Dd+DK97MLE6fJ0NMinOYMsuLeCtexq/FyXW3Yj+BISlID
         zNLZbNZndmkAZNeSs1PcNyjG89spHn88j69dxuPqNU4anywRCZ4wCw2P43kyj1bIne4n
         6nhVsD46VjiULUmszXwE2Zf5HdnK6ricbrGaFEXUYIJmKYwkwauWyNudgB7vIH++MAHf
         wF0eJ85Z7jWamkUrbixlYqBEHqZBvFHPm2+Ztdrwg14XmS1KZQQFTEadniAy9zFKBZp1
         0aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488001; x=1781092801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tO3scwQLDILDFlQjuU89g4Kx7wsmtUF5t3cLtUVDts=;
        b=HYNxDr3xHgAVYuuMaZLoGnYNzbTwY3MdrjCyAHzx9etxuYYIFAyjGT8ILBJJLoXU6P
         7V/Ij28kmEtiu840yw5fsdJy89TVDrem5uqsxpB4Dgq7l10P9Q0h43bNsk7QzjGfJLhw
         1tXcMK+YVS6XYnEtwzw4I7NmtaKdba5J2b0LFxapJk5frTfQ5Pqq51VlMiwd3ER9nZXZ
         I6IsFiIhKtL2bTN+OWgh61/DwIHOQfAJJAIcejKo3zHjJiTFKkr1i79xfDtWGfVcgfke
         tAuPOCAdpu2fX7GMcOGhfq76bNMGdJlv5dvPyrxzHtxbMQIADyACGc7weFfRAjpGUpLP
         C0xA==
X-Forwarded-Encrypted: i=1; AFNElJ+K/fA8RjG235+e1+uV+N9KMdj4g6dhTvsZQBfwee0CLPjzzchY9BUPhkc1zus3XZPSRTD8rKMxRYrXqV9xe84N@lists.infradead.org
X-Gm-Message-State: AOJu0YyzFh7fakRiknwcjxCuqha7667Km0Qg8s0k+mvYjRzPjnI01L9f
	/aIznT0CDElzEWMqddgFudFBc4e3mjZ3jv5OSK1RnM95NR3yjOVtGXS+
X-Gm-Gg: Acq92OGzJtXo+KYq1CPBe9mBX7+8OuP+y9FM20ZO8XxnE1RHJMbW9YENKUX2OWpe3fN
	995nXfkCRsJxtJqZMgE9btUd/z40fE2YY6ZexhTJrB73G23A6PaL6BjcsWw1Qd9canTdFrdXDF/
	Tq4NopVPX7k0vTnTGD318hDRBTlzSLjewPHjkiBiPVZBhtlL4MgmCbKDFzxhdTLzAvGihzTZfEr
	5lweG9YcBfhNh7B3ntT193nSYNmMvPOwSyo8iNtSLaPsp12SgSZNYFSAT8N5HaDD7jp/jkyqM+g
	wuPn6xfQhPLoRwKK3QmuSR7GsNtlXPz2ez1hkFzG9IV2HdutnvrFV1xB/KCLDxZLZNhRzbzurhg
	yiau1EAmGPQCHfFcFINlAQCRbP4rdf24KH8pXHh8ej6fIIAqL8U24JbzD6OxPRqSu8XOUKr+nhY
	NvaRaihmL7QNtJ/cDBHsUluVbwZRzmMrLLVepXvE0Z+3wG9BHoMEIS5Wi1OkXvqTAQpHqnApexi
	8kycMo/DlqWB6+nooMy4MwNd4KmoOG7DdNilD6P2vcWKcYF
X-Received: by 2002:a5d:4e05:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-460217bbdbdmr3322115f8f.15.1780488001203;
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 13:55:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050003_127342_2256987B 
X-CRM114-Status: GOOD (  11.40  )
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

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


