Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0267ACCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bdqoW+LR5yZxLdoidUpEK8sPbCwQ5DxDfyq2+aB58A=; b=yJv49uxdnldJPDH64UsCkGW/Br
	CAry3L5DXPoiySN7S/0sIgdWyq6ufk2/PAChjLun/S0fz0h8NXhngW8PQUZ7/4Gf24mLEHoVBYqm1
	ozyuimueSF/d5ghEg9+MpTtKEEMTDx+N0geQmx2nBEpXBf0T93zXOVL+IpyZXfdzlGDWQkAUCl41j
	Dneq/owCwhmTtQxyQ3v7lmym53C0IWgJlu4rMvZpJuazxTKMGixKSqX7p7kpTRx+nKRX5IxBWxfTq
	AYhGUUSNyBhU+zmLtW8N0Yl5owApOUbTjx4c+jFTsc7EF7q6AJmYw1hkml4QqwnyWADu1kxKYACu8
	qPGvkclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoP-0000000DFUo-1P9l;
	Mon, 13 Oct 2025 13:42:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoL-0000000DFRX-0Nvj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso7251567a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362919; x=1760967719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bdqoW+LR5yZxLdoidUpEK8sPbCwQ5DxDfyq2+aB58A=;
        b=Ox6Fd3LNmHvUPEaAnzT7hfQwZPq4VM5zhDpZliF4uviItYxqfyzh7hwBd+0pyQDug3
         g8GbbPzWP4T81DNcJG3/18M6cTSxYyltMIORbySzG3EXjgQC5MrkhVxbA3qHKc0/jwSN
         xF3xXOjyVEyrxUI2y6DCVnTsU8L+/79JbFxkHeWt8ixQ3OxTJVvBmLGAEM1NoBeAhu54
         o8uslU5L+Xk2wl5bP+6umJ7n6HbNEVqU3HmUVRuOryA6hDttiJisw3kChvYBRtqz1pwE
         i8CwapTpxmvpeffEOQQle25sNlVQP+4ybCNam+QXWV933cV7vWz0uPhpgV2egbjMSDgy
         e+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362919; x=1760967719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bdqoW+LR5yZxLdoidUpEK8sPbCwQ5DxDfyq2+aB58A=;
        b=DC23HRtVlagS8c+dAaD1UKOuGUhOLzCQ9czEnXOYMWrBRep78erlx7qBh2wh+RsDc4
         vWEun6CsgT1+fwb1kAeJWurp1iR3d+3EiKOCDwF1jH237mdQqkIZ+7zszamdNmzEjNFF
         agheNEWrSdUEEEAeJPZoyifq+9BL7I8vu7nHr86lGjPdbj4sSMVXYkyTS7utL16Jv2Uj
         yvcx9HuqXXJj38o4crqkRvNKn7h7+ZsryttJim7eavmURWgaGygpYS69a95BIcSUzwCb
         L/edTq71RxVdslAjV+MRJqiLKb94pp0BQPFq3U6smhNB2jQLBNx4nnKKGabLme6wTxsL
         n9vA==
X-Forwarded-Encrypted: i=1; AJvYcCWcAQnwOHHsdiZSJtq3GbboOaCjL33v+DgpzNNMOSTeOGzRX4VlNTYsg/3UcezO76Exh8JJqg+H+ElV4K6MLF+u@lists.infradead.org
X-Gm-Message-State: AOJu0YyPChUQs7EaEo8jSZvgvEiuFZrT2ZjrNJaKoesvfoz18K7tGtT5
	tY+DcTXwby6h5QaBjRpYRDMXKXUv3pyEfdUUyxtdEp+0dQ+xBnCJEmrq
X-Gm-Gg: ASbGnct5zavpZB6MAjT4VID7sqSLIc6B+d1Fkd1lXNOWLaM22MfT3qeJ+8pMIfCGAv2
	HTUchUxu5iyHajs3LNi2ZBYfcETKBuxy3nXY2O6iWP/91mwIpuvJIS1JwQFqIan+J6qa6yCoC06
	f/UyGTooYzlRk8Y73ZDUdAQuj5XHMZ70iGdEIj3EBB9KOOmkBCxg+u+sFfhtNS7OBiwugq8ZD0R
	+55azYjWSR58EKewFe+oGsBGUVXU81rRgu2JEQLVE1AJ2WYg21wRMZgIv47fQUBCxO2GlbWyg1g
	QvpCUNbIhXREc25sb5abVgMHQSyNPMrvrxUyIuJMc6JDHJctDFGEXkGX1gkVHGjvs9ZP4Cft/P1
	ujabfGk+mxSslSv2E9LJC+4nZyCY59aSdJTR8C9IydyEBqTXg9uXKvEK5uczpOe5O5nRj0yXw2B
	XZUHVP3/SbQeZ/
X-Google-Smtp-Source: AGHT+IHJtzeYQurhnlAW9tml/nOCL3ntwqVOYGzJy1iG+4nFDJLqIFVys/FUilJjcxgefmjojh9Slg==
X-Received: by 2002:a05:6402:50c8:b0:61c:cf8d:e51d with SMTP id 4fb4d7f45d1cf-639d5c2f5a8mr20630779a12.22.1760362919103;
        Mon, 13 Oct 2025 06:41:59 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:41:58 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:49 +0200
Subject: [PATCH v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT
 defines from DT headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-2-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=E+oiUZgen68cnjAENtdOLkMPulLFXMt4mXOQGkGDE6I=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGf+ItKfJtMmRNf1EyGe+DAhXxvE0FB8Xc6T
 83+l6P8PoOJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aPJED/99jvVa+gYxsmfku8hqbnFcbTpy+1rL64+7ChnpDDOCPdBm9QZy3EIrI8kdBmDM/Mvnkos
 6Ch9+AXNcxcMJFWRvFLHQ4dBKCPBVdAwwm8qLE8KzrbOs3Cxt7CxnxlkRgQAYkzXr/va10iBxm3
 g4EbK9bjqwsioUSLpTofaQEMW/Q6kwO+tLtEHaDGy05NE3lZyW1eCD7Nk8wW5dky/oRoTHtSENu
 WV3gbXwPCUxqJXfqaGwhdkboXDbiQM9f3vCSaf4qMVzRPjvflptITwBBtJ/8hWAZKHvpe/HJ9Rt
 ACGdZVSxYSs8MZHavFpOET3Kma70j+FpO+BV9QYEcVKRj5JzKPxEQf6VMRIAh4tHHGVa3ie6YOe
 fjWqQbkCFYYuVepxgU4ErDN8USVu+i1lcnp7b8yNyrwgMX8jEK3Qh057xtnXt5amoGl1CC48vi+
 hzb5jpuXFEMLsoI7++jWQoMdbv2N2oRNZXJ0dzKLv7Kvp6Sy8ziP/wZIf181ElGMVweMg1LGljI
 +FIqPhVmTgKwXYsCuyV8/cnGif3jwdkiO0gzgatXLEzOUw4FPPiTij4gVzT6Do1YA6XT5m6YRAo
 bJSuMIOK8C2ooGlD2BrMHGHOoSuIFc1coN3h+k3Skc4FlubsZjCY5PeFAvDKRjpa7j+H5WXqobe
 uf9fYV4PlZKuuFA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064201_173241_8A46748D 
X-CRM114-Status: GOOD (  12.72  )
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

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d..7a380a51848c 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e7..0c7a7e10cb42 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.51.0


