Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0953D6406E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk2qbkT+uPe7dB8QD3lp2P245Y8mdzpsNSq+cs0R5ok=; b=dU6VzuUeN8klgl56zJ4mitDolN
	F54cPyssU+UifITUU3i1KXfdLEH5tqUljf1LQHZIDSJSUtXGkb+WlErr3BW5MMpPLVsqcWuAhPX8i
	US85HqpzSQk9YbT+WiTrBCNkra2xbsCEk+nQ2WDgqnKxVfXZkN0iqovx9wx8RynEreQ6kugxdcFrf
	OMu31fKFEVWlzQXjaUghKQP6ooIRzAV6V9VtiAHpwL8IXWxWN04+e3E20+bBj+Ov5XfzsTGgC5IMs
	EEbA0XlrCylbln+7tqv8X38K14n/eGFBKRKlOXyTztEy4X6sytuv9EvzVBcE+y+7wl4P72ducFBEw
	coQDc2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUf-000000064Iv-1ZbP;
	Wed, 17 Dec 2025 02:42:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUc-000000064H1-1kGj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so4990488b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939342; x=1766544142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk2qbkT+uPe7dB8QD3lp2P245Y8mdzpsNSq+cs0R5ok=;
        b=jD6c+ioa4dMmwwLl23dqrh3Th+ND8bJNQ+ZpabIzthP4/7/9g1/IhBNDQQKSOcFTeB
         AQpceKnre/MMneWp5PUNip4zg/WSHKlPubcjGn/FNYov0ISuSXPxhlfhCJkxV4CbV0N8
         jWNtq6PyDODiyEDFqAbF8JIYUU1Z73vnCJn87DHucnkcYG0MyAdPdFixk/fVF9z97Snc
         nZEiotqcyfUOWwfglNKf2GDm/fQ5jH3bFEv+3Y04aIgc1vO/zfcDxpEPfVgPUdMM619b
         EpGtvvOTJYtjidfACBSbYzuxTlSmuYCSaTtqsy6r72Gd31xFWZ448dQdM5FsiV34k3GB
         tFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939342; x=1766544142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sk2qbkT+uPe7dB8QD3lp2P245Y8mdzpsNSq+cs0R5ok=;
        b=UD7NLNNpF9/rN9g7royx1DvzlPRBpC51KG4Mxkz2bsXf/3kDocT6uEOAWXQaC96DTi
         LryfswSOitioG7eUB5nzijWaNT5MCcR9oZr3ClCaxi7NOZxZB7NxSZTWj6aXCqrPOFk+
         beGnOF2eSGGqsiqpRwZb0r0mcgRPvud8X3VXINXQZu0GRUBlop25TNWwOdsD0pk8p9Mw
         OlFf8btWL9vNwn0LiT1jd/KKuo32V5NlEi9qZ7wLIrhLcE/mWadogJx/QnenNsaVCkoX
         on23X8P2vcwY0P6T5E9irRe/s3JKBeY7UBpWEz3RjU406FDo9NfCDiG5Adujzp1pswtQ
         gI0A==
X-Forwarded-Encrypted: i=1; AJvYcCXPuuubZU35r0SODXXmZeCYmpmAEfgDcw/KZMOTexQGk8q2e/k2iMVX+mDdMyDcnjMPi4Sy7fsGwlrxvKZDhSsp@lists.infradead.org
X-Gm-Message-State: AOJu0YxhJudQB+XB5G7g6k1i/7b+l2/EVnTJJXxzzXrTIlfx8Ymb2X7s
	dhCVpO9+3KHTcnlV7dM0llfE3FPv9AL3lRYm7R0LfUpu63xkVcxtuVny
X-Gm-Gg: AY/fxX7sOBjUKD2uS6YaKw8ODnvDrwFF61OsZOuTOYWByQJzqUH3KgMGiyA+2oSX9QV
	8zcWXX3jO5tNT1sLQmdNaHDrXfP4Lr8hIHkhBsO9iT6dWsJP6IonUIodJInAsHNQvcvM+e/4Nth
	98CNW5bacSaEtiycWHpcnhopMyAwFzMxsyaeFa/SNS3ywQ+oi8bz5iTc18BO8BGC+OzZJqMKFQy
	140uSicR4AMLDcSg+O1hHncSDbHIGFwlAgdiU9iSAzsLjAqQ60bOt08OpoCCHXV0SQZ1s6Nib+x
	XlTLe+uIHplLOE/G4vSRQ3ZiTyQjWRmFnmc4F7oZX8s45bufvTakLVwmlckw8RqUN4uHwkGjO74
	SGWGJV91gq94fYMUhofkUjJL8okepDbmEJTY4sdGMy6xFAihs4BohArqS6RY5UCuXHXbY7XLIzp
	ydqWyFVCqg531y6DBtdv3pWYftdLVujsvp8RrmImD6pVZyHHG2YWhhM7vzmsFEv3F7KUkENMcK0
	iy8T9kxc+QBoTg=
X-Google-Smtp-Source: AGHT+IEEKjfjDmcAxd44EGFsYj4XdOPu6wFwNvyi9NIvCiiOd5PWZPd+nRHMqunn54uZ6fUDCXQHcA==
X-Received: by 2002:a05:6a00:bc10:b0:7e8:4471:ae77 with SMTP id d2e1a72fcca58-7f669e80094mr13699793b3a.67.1765939341840;
        Tue, 16 Dec 2025 18:42:21 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:21 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 2/5] ARM: dts: aspeed: bletchley: Fix SPI GPIO property names
Date: Wed, 17 Dec 2025 10:39:35 +0800
Message-ID: <20251217023938.445721-3-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184222_458002_BC3BB63B 
X-CRM114-Status: GOOD (  10.03  )
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

Update SPI GPIO properties to use "-gpios" suffix:
- gpio-sck -> sck-gpios
- gpio-mosi -> mosi-gpios
- gpio-miso -> miso-gpios

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 9cb01381e482..5919a5046078 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -39,9 +39,9 @@ spi1_gpio: spi {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
 
-- 
2.43.0


