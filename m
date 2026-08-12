Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4515C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGyGvWCodz+0FevuarrifPNB90a1n0BY2okOjukDJ30=; b=c+8gj91HwZJBKtK/WFIfVpCtpq
	ZSnsXFvBTvNq55dtMSr+w/uVwxVvGclJO1WkLS2ywfsrxWC6vmJufOp5/SpQf9cdgf+hYHqphy1gI
	eO6aqsiDMydizNXOkyG56wHc50AnYb9M7yqfp5H3bHQM3H0RlvAuj0ff1M+LaxRYPPrBM0IzDzabH
	yFPek/22ic2VlFpmkWMg63VmFsqUdbyv2SCDNsjzOAtbNUhGtYjGsAqV8d7B4zop7rBz+wxd+/zZY
	JveZv4S0zalxe3bIH0J0hweP/qU1MnK7nBH+KkcGo2gL3ciAE1ZeJ3qsTHLhNskMN26Y/bgeogjtv
	MoybOIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90H-0000000GHFS-1mtq;
	Wed, 12 Aug 2026 13:28:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90E-0000000GHE9-3vPD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:28:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49954b88fffso10494815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541297; x=1787146097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGyGvWCodz+0FevuarrifPNB90a1n0BY2okOjukDJ30=;
        b=B6tL5nuxdMYnje1JCSH3JXAeAPPYZ4XwpAGWRekxRVlVkBm6YZiTRZKiaqkULRzj3v
         I+GYfSRPQHBEiDWwFG8UkuC7bdqdfxDGpPo5iMqe93qxr7RgjpK49bWoAFV2xvKpBjef
         uX3hRQF/WsaqEgUHf6ep2ZAcVjxLtVmlnMBHWdY/OiRW1pIZObrkITd1O7riX7hHT++y
         A1U/C4b5fyn7LMmAutU1nISJZK6AMG+7Z6vlt6JLtJTYppFWLow2D9iiFIHLgVe7Qnyg
         bqOgq3FTqVF90M4TJjGAGfRIYRWSpUkOlJyUhynOo5JQ0gFrRmgVaKyN9PDUmHXrPK7i
         TRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541297; x=1787146097;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGyGvWCodz+0FevuarrifPNB90a1n0BY2okOjukDJ30=;
        b=N/sfY/UJKhQWNTGT1WBskgAxeJyGtKyt+Dc5bjOeLLfUDNb5CeW3iTCEyWtUprkaSN
         cAM1yUVR9X6GDYnLzS6ZzP+uk8944/zis13p1z3ItxupUY2qd4Q0+anoI34XQLADOTDz
         1/uvyz1NaCjexjRE23P+r/gXLzI1M3xl0hxD3ua9L7YBS3CvasCMBl2X1ZPUrsokTTtN
         JXjzH0MmzbDOwuwCLORKAXoqxm3mYhpa1y/73r8x21yaof6dxkm4MXHc68W+hr/+NHCD
         tT3gPu218OumZ/DMBxsnJ+I64xJXIIpaVXr85gGHXjlnKD7lJR60vAwjq37wg4hVSIMU
         Zt8w==
X-Forwarded-Encrypted: i=1; AHgh+RqQNtvqfL4uiKw+H+0+IMrsxr7JLX9tjFZDQjBwYFuvxikkVbc6MpdTPHyPF1BLQ5mVBCdH4jf6z541FbQlLUj6@lists.infradead.org
X-Gm-Message-State: AOJu0YzOiGw4168+6ksRJaDkOUoolhwIk2w2rdAYprvtOHHk1/e1tT/a
	NLsJil2cqfRNBC3uLxvKWrCqP9HnCdTa1jCIVhbZGs1gxs2TKiIW3DVo
X-Gm-Gg: AR+sD11/p5Q7w+NaIHgXcXh/WZUXF+5aszqy9hJ1cfYsapKG+K9kY7LZ4u0Txed7SU/
	Zf24CH4AegDp9dRGeaL1Yj0wkrt+6DP5+FVdgnME4Yp+Jj2g7dWLEAmHIr0XktwTTbiDB3uohXk
	4ZwCEBLUH7HXTTuT52yYidvaBka7kjFRH8W08DJvTrjSiKm78piO2RXRfNiVGfz3ZRpvECAaISv
	GAAeJvxSnW+cVkWQ4QdUjQqbL8VfU8FBtWYqT14xb5NC0WRvY/gzArCRaPAqJB4epsz/FYI0jvK
	JFqc+ZZWIGsj554o7Su8/FJX92n2JkWp3rlPBojDmH8ZwTNqlx19GAY0WOzznkndEC3fYkLQnOS
	HDekwx8iw4lTx4dEIe/ACmGFWLjtD68yZ6gvZ84WpnwOc57M1S8QAzgW4eSmWMP9Mrp+fCeBklB
	lnwGHNTkqmCuMEeXLj9XQsUeWW28iwqSv4irE9Su3oZ6tAh0VpUlx9JLKxmXHtKROhVC9ct9aI8
	6G1QQljq9QQNTZu+0FIOuuCADv4EA==
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr71100895e9.18.1786541296817;
        Wed, 12 Aug 2026 06:28:16 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 3/4] ARM: dts: BCM5301X: drop pointless "cpu" labels from switch CPU ports
Date: Wed, 12 Aug 2026 15:27:54 +0200
Message-ID: <20260812132755.32585-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_062819_044209_C26B5D85 
X-CRM114-Status: GOOD (  13.34  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Those labels don't really have any use.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi |  4 ----
 .../arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts |  4 ----
 .../arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts |  4 ----
 .../boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts    |  4 ----
 .../dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts    |  4 ----
 .../boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    |  4 ----
 .../boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    |  4 ----
 .../arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts |  4 ----
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi   | 12 ------------
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts    |  1 -
 .../boot/dts/broadcom/bcm47094-linksys-panamera.dts  |  6 ------
 .../boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts  |  2 --
 arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts  |  2 --
 22 files changed, 91 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..b3bd99ae01f4 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -178,10 +178,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..efef16da1242 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -82,10 +82,6 @@ port@4 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..842dc9af6fc2 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -85,10 +85,6 @@ port@4 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..e480e2006657 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -119,10 +119,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..4a72501cfdfd 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -160,10 +160,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 192b8db5a89c..55f7a12001bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -142,10 +142,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..a7aa8992b87d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -78,10 +78,6 @@ port@4 {
 			label = "poe";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..3fc4bded5cf2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -145,10 +145,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 9041dc6bfa8d..23e5ae237602 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -196,10 +196,6 @@ port@5 {
 		port@7 {
 			status = "disabled";
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..bbb6b869507e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -242,9 +242,5 @@ fixed-link {
 				full-duplex;
 			};
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
index 2d2e7e581291..8cc9db307527 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -151,18 +151,6 @@ port@4 {
 			nvmem-cells = <&et0macaddr 1>;
 			nvmem-cell-names = "mac-address";
 		};
-
-		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..74290ada098c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -167,9 +167,5 @@ port@5 {
 		port@7 {
 			status = "disabled";
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..f79c9c5e2023 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -205,7 +205,6 @@ port@7 {
 		};
 
 		port@8 {
-			label = "cpu";
 			phy-mode = "rgmii";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 675967a1ad0a..0c89e103a95b 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -241,7 +241,6 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
 			status = "disabled";
 
 			fixed-link {
@@ -251,7 +250,6 @@ fixed-link {
 		};
 
 		port@7 {
-			label = "cpu";
 			status = "disabled";
 
 			fixed-link {
@@ -259,10 +257,6 @@ fixed-link {
 				full-duplex;
 			};
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..fc518a8a28cd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -104,10 +104,6 @@ port@4 {
 			label = "lan1";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..532d3edeec70 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -97,10 +97,6 @@ port@1 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..3ba672b090cd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -104,10 +104,6 @@ port@4 {
 			label = "lan1";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..9149bf85e716 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -72,10 +72,6 @@ port@0 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..7133bbb94ae7 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -144,10 +144,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..0a5c6df78466 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -135,10 +135,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..38af5b3428d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -137,8 +137,6 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..f635a49e1857 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -178,8 +178,6 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
-- 
2.51.0


