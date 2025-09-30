Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E49ECAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wq8AM5fpXK6eEk4la14RAF7oSZLrkv9gGWRw1LyBjWA=; b=W0AvdS2Is47w/SRwO9xxtBiG++
	/kMmCSEIY5/pMhVfoptTRzU9Zjdi1QOjys8TrdeDoL3Nkiyiz5K4dPcAkL7BNfqUReBbdWBUfFzY6
	O9VRw9ORDUIBIXlucCo4sY5zq9gRsjbwxMdbXrD6vhd5T1EMAFA9vMcYVJi9xDw5imIfCNE/8hyve
	3NghS1U4Iqk8r3SfQWEsKa3pq9+b8TzYAbdg1M73kD2m6R6Cb5wIjNuskFETy/7uP3iCzIUIsEkS5
	fbInwVYQ6YNwAzEmifKaP6IPvWUXE0ze5bUBwJ5NORvklGKBPxL/GNKFGdSeF44ZhQyCgWVQ2+/NI
	GT8AZxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QQs-00000003xvi-3Yzz;
	Tue, 30 Sep 2025 02:49:38 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QQr-00000003xvA-0oCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:49:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7811fa91774so2935894b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 19:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200576; x=1759805376; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wq8AM5fpXK6eEk4la14RAF7oSZLrkv9gGWRw1LyBjWA=;
        b=gU0Wp+FavdLmj4CAZKygRwpf6UXWtoMXqrmAfO6+fPOO3nRCLBHgzrioFLxI0ls7Od
         Jkl3KJRyXTJyCM/F9iBcDT4DFqF6Smdk49S9CYzxsPtUb7OcfaI7yK9yFafVhoz7L27f
         Kf3pTG8SNMlsWqMEwsINdfi8NRlQGJYf0ffXTiG1UnGmoKLQQNr6w920fLvzm3PxhiAG
         W9JPu2RKV3xOFv6l/s0Q23P0ZPfO+aBCCAe/f86L7j+QEPrwlQy10VHnW6FJ9VcKD26W
         e8Yn1v4SJOFEJK627nuHmy6D7eJBA2hzj11HtHHsV0ZLU0QYxRp0hQ1723CshS0jOdyc
         pxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200576; x=1759805376;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq8AM5fpXK6eEk4la14RAF7oSZLrkv9gGWRw1LyBjWA=;
        b=m0mVyxUFRa9s95tUK1dvBPw2Ph92dfisHKNua9ER5DGpYVRmVsbnDjckwo1JBt4Bb1
         uxJstz+aC4NHG1KLNzKO1Ao8CPR7/nMcywICX5Ehj5gI7+baJbT7/jfWhWPI3UFTrMBq
         ufgSZULP7xKD6g1mf6j13nFzHjjlIyJedbW9O4/Vg2N/22vmJZX5lN3L46yIMgrBnoVL
         Me3wJdR60fgi69TPHTVOA7Df7d3bcuszaPejCn3ON4ScZ5/+THUyOR5CyWPFE2Xr4cn0
         dcPOrNTt7n6VI6MFvABRid8h7Wkxkgfx8Ke1N7tv3+q6mqHR9MBREzRMC9bQVyWBQ7Rr
         TFvw==
X-Forwarded-Encrypted: i=1; AJvYcCUxFOUcbZCGYJQ2yW1rMdrs45eIQslqI4iU/bXGERIhBp0ArHYgtlee38IB9nw7WcC9XwShRH5FecMzCME72kDV@lists.infradead.org
X-Gm-Message-State: AOJu0YxZjtdC9J6OZc02tGrQS5pmCteri+fPRTTm7bodI0ML9UH29WJ3
	HCzI7RGY0QE7uMDvbfOVgN1lZZTXL1Pngls0xm7fkKZ37LGvhWsYTjtIEjXdDQ==
X-Gm-Gg: ASbGncte4bT9a+virgBf0ol3r1fFmfBL4zeQVWu+iS8ef69NafvTLnLKxtTGikoKZ+V
	e71kSaKgQRLXnoKzdqwbHwTVZ/XvIpSHS4jv/bGIBZxCcmsIGcjmSHpHldSbnfld0nfmW5dxdOs
	TyZQme49G4Jc7TpfpTy3BRb5hp2ZfduV7k+6QhW/LFFEoPry2Ot+LV7/0M4k2SU7z6nLmc6dE1S
	lX3a+RlUVoKSSim+/6cRfUNgT9Df/EMyf2W3pp4BWn2JP3tRrmJ2idInFv9SF0aQNmZdeWH5N8D
	QOirzqt25TKBwS1+avs0R88pUjYvv/4sM93AIdP2SwBDOigw9omacxjbZrlMOT9s1X4tKsuUSXi
	XBCNc7pHY2eYOGO+rWo32W7k7zn2xlvtOnaMO3mfPQ10MBYf4Obdr23iGBdzyNNnkJH4pjkFeAl
	1bZtYjqOolu3SnGwhIsg==
X-Google-Smtp-Source: AGHT+IFMe6D44grpGqaN30+IACiK1ag0L1YVwPsQdog/6V2aBU+Upngdj4V9R3NOTeGT0ryw35P7Jw==
X-Received: by 2002:a05:6a21:3293:b0:2df:b68d:f64 with SMTP id adf61e73a8af0-2e7d4dfb6b7mr24100790637.52.1759200575723;
        Mon, 29 Sep 2025 19:49:35 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb255sm12688305a12.5.2025.09.29.19.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:49:35 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
Date: Tue, 30 Sep 2025 10:49:23 +0800
Subject: [PATCH v2] ARM: dts: aspeed: clemente: Add HDD LED GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-leo-dts-add-shunt-resistor-v2-1-8712984f04c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIADJF22gC/42NTQ6CMBBGr0Jm7Zi2yp8r72FYlHaASYCaDhIN4
 e5WTuDyvXx53wZCkUnglm0QaWXhMCcwpwzcYOeekH1iMMrkqjYFjhTQL4LWe5ThNS8YSViWEFG
 51l4vXZm3jiAFnpE6fh/xR5N4OGaf42vVP/tXdtWo0VWltkVV1qZT936yPJ5dmKDZ9/0LDIQHv
 sQAAAA=
X-Change-ID: 20250926-leo-dts-add-shunt-resistor-0cba43f75bce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759200572; l=1492;
 i=leo.jt.wang@gmail.com; s=20250618; h=from:subject:message-id;
 bh=klDRu2KGjM+0nX0HtilCbWli5VflcdgLmjY2aTzwD5E=;
 b=ZPnwa3kHMLZcbssExhvWUM2QAqYAJS1I7iHpxlKd7keXV5gaKRp07f4D4Fa3UWcplSv0Hmsab
 TM+5DwS+2TIDCG9kMJDLaoT9z5ObGavmkF/TWkmp56UEMqOToPr0+XG
X-Developer-Key: i=leo.jt.wang@gmail.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_194937_237345_16A3B43F 
X-CRM114-Status: GOOD (  11.96  )
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

Define a GPIO expander pin for the HDD LED and expose it via the
LED subsystem. This allows the BMC to control the front panel
HDD activity LED.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v2:
- Drop "Changes include" section from commit message
- Link to v1: https://lore.kernel.org/r/20250926-leo-dts-add-shunt-resistor-v1-1-c871a68792f0@gmail.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index a614f947dafc9a6628c3f3d45b62ff3ca9d2b618..450446913e36b1418fab901cde44280468990c7a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -95,6 +95,11 @@ led-3 {
 			label = "bmc_ready_cpld_noled";
 			gpios = <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
 		};
+
+		led-hdd {
+			label = "hdd_led";
+			gpios = <&io_expander13 1 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	memory@80000000 {
@@ -1199,7 +1204,7 @@ io_expander13: gpio@14 {
 		#gpio-cells = <2>;
 		gpio-line-names =
 			"rmc_en_dc_pwr_on",
-			"",
+			"HDD_LED_N",
 			"",
 			"",
 			"",

---
base-commit: c65261717599d419e9c683d85f515d3ca2261549
change-id: 20250926-leo-dts-add-shunt-resistor-0cba43f75bce

Best regards,
-- 
Leo Wang <leo.jt.wang@gmail.com>


