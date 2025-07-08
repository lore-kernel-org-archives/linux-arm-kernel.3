Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrxF6nK+mYO5VydcxGnIEhVOlrvvr7ZKNJscXE8JZuo=; b=oCxcsvn30btjC3jz/FKSMSwxYz
	/6h2VufLv9vlE5//DlgtPGkXYPOAsFB95fs0Kn9rHyVCRYSEhQccDUvVsBiVPwnxdRrjsTr2MF42d
	8vPZC3FtpQX7aolYi5lB1SfPph2AUkNFwbjajdffTFtQL8IxEO6yURFAywdYlS3hZyfhpXWtMZA6N
	Pl1iPDiUs+JMx4J1vzbxC7b5aFwvzKt3qwogpkpBURhxzT6Qp16TEtA/h0/2+vMUNXV8iOgoKr53D
	um7a1jujKQtkrpaYBhAfBIKkXrO4NDmKRDXDdT3cAFCOyfL2/rfgrpUx+OTxwVk2n8lHjQhr2s/yG
	tkmP471A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8vH-00000005Wnc-0JkB;
	Tue, 08 Jul 2025 14:03:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8mR-00000005VOe-2ack
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:54:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso8561204a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982882; x=1752587682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrxF6nK+mYO5VydcxGnIEhVOlrvvr7ZKNJscXE8JZuo=;
        b=ibNF1D63kLywHE1oZj2bGlI9bTb+lLPGOune+ycWCLkKFNsibabaNxJoeX1gWsMANn
         MMqJdZlVxmlzWOdu6nxYFcuYxv1peTQ0cLaR3ZiDXZcLQmYHnXzHex/gxsICoQvdHCwk
         wPcLe+0UHNM6yJwqBWWP88TBdMpwmzT7u9sO0Z9iUkjGYlxdFvQ/7HU+UX/VbB6NFWrN
         C7weXVbtu/fgrNAHT00z9BVDIeKMmPOQNn+g9Mjx2mZrnUHVhiHRqN4rSoZy/KLKoUkR
         Dw9i9F7IEHivEPipp1PXHhd7w5nHEB/laa7HJTaFQ/9EH3a+N31X8Ykwja9NfZ/odmUP
         m1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982882; x=1752587682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrxF6nK+mYO5VydcxGnIEhVOlrvvr7ZKNJscXE8JZuo=;
        b=f5hRmoGbTsR3jxqjX84TRufkEmK/W13Z0yz75082ck5FJ88R0O9Gx5ymTtyA4zDykr
         +/VQHaXMSgM2csjF+JBbW+6llRibsNNPhrPbdnJzkUiHPe3DZI2ru2Jjdo/RY3SHqQ05
         IULAZLBVbu3jXYKh0KxGKcP9/l0xMkIkyq6bzizPi3dUaOREEc/anrtGsJQdGSI+MrFE
         QfZxkjeNl36sg62kjW9xB0z8H9BxV6pXXIqdyaYPFRVCUz5yT/KpidFHLsaGp9ZnX3Cv
         6PsyiTSx5ARnlgAT4Cw0sFuFXkJ62Lj4o1HvA8TxVp4mGZd4NIcC0ZaTZZJDMBA/hQLP
         lZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOgNzVHkgMMTCocqAoaM6dRl509zcgNlNyzOtHLRpr+8q+u3kAjQWvvEHvzjWq8tVmAgPphxJTZOlwsihjO2fW@lists.infradead.org
X-Gm-Message-State: AOJu0YwhbrzwTeruapK4GmQ1XvhCTPSHXs334MoGvCcYR45QuoNTkmOn
	6rU2lu/s7YyzjO3Bx6QEvIWhGCiVtPWorEfmwm3ss2nHdCYpflENheo9
X-Gm-Gg: ASbGncvwcTmiEr+L5OhTiGxF+eHIajbM2ARuEiYu93dXB0lu+J/fsk7h12meK/Mpgpv
	xX9M5NDuAzzaGXOJTqnBE9HEFjHgkrbn4MKrP7yFPPTg8wZwRIDDQq8DI77dCgfyNqdAH7oc3ih
	Ufl+bcoesC6stvPT/K+Vr6egPRIaIYCMEEFHd95LGiFLSLuOMx5BynWTURFS+cLbdxThnInK00h
	E9hKCq9dXNMrt50HvxcbmsS4jeq4GS7Xbuwm9cheOiX3AtYmI7OT8M2PNprzEpBaXYCm7FVePnH
	zWlCREnP0FmuSaF1KGVYo9wheYaopMatJdA1w5CZfTyTJcXxL3znJNM1jFm1SjNJtId9OBabbm8
	6cotiThldXldzHnhq8sTYY+XDwCqE8KpFTmdgi7pmOFWDbhprRi3pF3B+PLnktJeM
X-Google-Smtp-Source: AGHT+IE/M5dxRM2q5OIUramUmzAa8UWPZ+qACUHBsAkQqnqxLmZ2oTxm7Fg0gydn9CIl664bZfqKDw==
X-Received: by 2002:a17:906:c10f:b0:ae0:b239:7fd3 with SMTP id a640c23a62f3a-ae3fbea03bemr2120751666b.57.1751982881901;
        Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog
Date: Tue,  8 Jul 2025 15:51:42 +0200
Message-ID: <20250708135300.2855155-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_065443_659734_051E7CE2 
X-CRM114-Status: GOOD (  12.35  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Remove the gpio hog node which forces using DSI signals rather than
the second LVDS channels signals.
The dsi signals are not used in any of the current device trees.
Leave that decision to the actual device tree which will also define
the consumer of the signals.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 11fd5360ab90..bebe19eb360f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -351,14 +351,6 @@ &gpio3 {
 			  "",
 			  "",
 			  "SMARC_I2C_PM_CK";
-
-	lvds_dsi_mux_hog: lvds-dsi-mux-hog {
-		gpio-hog;
-		gpios = <7 GPIO_ACTIVE_HIGH>;
-		line-name = "LVDS_DSI_SEL";
-		/* LVDS_DSI_SEL as DSI */
-		output-low;
-	};
 };
 
 &gpio4 {
-- 
2.42.0


