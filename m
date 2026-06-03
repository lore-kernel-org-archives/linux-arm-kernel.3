Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE7CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=; b=RKrmLsNEfgOZ5jcx80rHsY+Lyn
	RkOXa0rEjE8FP71dIUOUnZEBJS9+67SHd9WCdyt2e4E7QcsEG/AXKQbKebDeD+m0fRyQs6BjKXQSl
	0YmRsXruRfoJyIjEtFDedGrtTD38sNWF4+SuIaYVWYCfCMzPNiFzWtamy7c+v2FyzX9y9W7Ui1/gv
	IxFlI8Z4kgAH6k4djLY9m+HSwDb4Kn9H3donUsB7jQylcZ4vN0AB+EFrTNh/ZRk5fPh0RQHs0l0Ca
	H2CATtKItIXb/yShOwQ1w1TJaOx5zJazAmf94Nk/wGVhJKVA94fpusttDR55djkHwleacr3s2M9IY
	Pk3EUSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguX-0000000EacO-3ygM;
	Wed, 03 Jun 2026 08:25:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguU-0000000EaaF-0iKU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3931799f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475108; x=1781079908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=s3s4d0nMd7WErOx6WD1HomU4qCq7SPradxYXGsvpaIBJl/YEuHXVTu0eSlI0oqCzX5
         O7UqEyyhNoi1srkus3XJ/hmMkxVEaRLk5VoV9+5NXkNUaB/sKAjk5mU3AsvmJkxB6URK
         hjrmWHzuBpR/wUw633yr0zq9Ewh+XkAgkGn5qLMBuQjYj5X7kTf7zvvizwKEApxZSZNY
         Ac/X34jJaWLxxLQu4trbuXeW6at170Jd43QEgKEcqMVK12WkJ06A0nYekmbTTTRtMmvB
         D37wQS47zmGYp8YKbYRNfJ2iG8D37DILHuOhsRoHJOVS2GJ5S9spCtYS3bKXY3kUAdTL
         8pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475108; x=1781079908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=p5alcLDGCxHil3nYvGa1yi3/K9Qr60Du9M2nYwzNiQHKhy/O5/BLcMadyzjmnZeabP
         PtKHn9txdtNVN6HBJolPNS7b1f5S5GTs2LK58Qpkv1Xvq91w3P10DLpWRn84IrTa+rDp
         Cv3SABe+SsL6AmPRu8+LcyslxaYnYLH9XaWJfFHkPgeyAVA9Hah2Tf1deFeWdLKbeMrm
         b+IkWZEbjqJW4KeM7QaQ9XMB3tQgfN1do6dOCmi9bn3wVERyagWK+7EKqv1JyEmbcK7k
         Jk1zA1rPpK8Etzo7vaCYVGIrgc1sI9vTMt6uzdY+7jN5vgozCvzkE0rV4VgoUuyjaU+G
         b64A==
X-Forwarded-Encrypted: i=1; AFNElJ+EXugEcFKZI+XZcFXbAyKvKBjRpq5UI0++0BaEQQIG9031LBstVb75dolR2e3iazk6DUiXKafrCDWmFWrl7Lsq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1iPUusTzC7VOhMwC/oTrf1fNCcfBCl2e9WkKF4hh0ccJb9XHX
	Ssy03Ncs9jrZuFCvylaah2BuEWy2OF+dVsAHCXtq5+PB6EJIayzQaXa2
X-Gm-Gg: Acq92OEOF0rJn3qtku0hzkBnJMRbRalVAuCTlMQcz7wpas9WM7BHG2v27wBNOXOZnLp
	wooTpu48l6uuJL0L0yxHIw77DF4pPJRYJTZKWbZbrZhxlGLRMDQdfxQ1my6k9o2byqg0yqgQV5o
	6WbmiPb/7reC7BEPHF4HqV/nN1zZ9pJBG6RLvW+w/oUKUj9HM6JKyWGxhx5Bmwv2agBrbwiRIuF
	lKMERYBhl9zyQXlrToRbPyyGUkUrje1N8xj9qNDpR0cruhI9Jwpg6jD+RB4NReG63Gi9JV76Wrg
	LaKQgsvNoklpYfdM7EGFPTrovftZgwaAdv6Jb3pvl5Xb78BVwEP0TTmqrqzfmLMgLvuhnJxplCG
	NHtHjNnr4JeYipQoN6/RkLuPQw1j8MZ4B9G2KXMmzO1qwDe+ib/VUBDn67U4skzr7syyEO0Kz6v
	gQhyR5Ej3KB2Y8dfc9Z/3KJoFPLqcYcu6DtmEToCypA8XQ3qTXZu4ng6ywToiQugNgNLilU4QMl
	TNcC3hDb/vvH2NsqzAkNB0oin4VVvDeEwfosbOcLGHmD13z
X-Received: by 2002:a05:600c:8184:b0:490:b3f1:e41b with SMTP id 5b1f17b1804b1-490b60e20b2mr36144035e9.26.1780475108116;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
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
Subject: [PATCH v3 1/5] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 10:25:00 +0200
Message-ID: <0018706953ce5c0ab87d1e9f361973429bf0457f.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012510_225703_8131DD76 
X-CRM114-Status: GOOD (  12.75  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset line is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and describe the TPM reset GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../boot/dts/freescale/imx93-var-som-symphony.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..c736127c7115 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,21 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


