Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECFAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mL3WUAt/E/JB7U4/txK3K9d2bFPzk59C+WVfG91tte0=; b=dxH7tSdDyhT1LHgqkV1LrertBJ
	Ec+9g3magEraQRT0e0zcZffSSo1K982RJIuLVQfRKyVrFgu8ZHHpPslX89WNj1yOBGxcJjaXJGO11
	tS0I6trYeHR1cBLsScR3JHgEVZa0/wkR10eP/6j4sMBntp6nFqfl6MmVgJIgYJEfcV4+snpEJj4yf
	+WhCzqc8MKMgrAjxUULhdH79k1TVRAd+q0MDCa9ZKG5ut5xP3F71/coJURS6AoLw6tOtRYXZ2ntvd
	ok2glqmpY8iuR4ZvNPJyX2xv1oVMSFq59cuR6rNQ42utbR0FwxDnfDQfBI1SFvBCGbMPYFHog68ur
	4hPK+QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH4T-0000000Djqe-2rkL;
	Mon, 28 Jul 2025 06:10:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqc-0000000DhLv-0UXt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23636167b30so36423935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682189; x=1754286989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL3WUAt/E/JB7U4/txK3K9d2bFPzk59C+WVfG91tte0=;
        b=KcP/hbb+F7N8WIyK99oGTbkbTf44QCWnJazFbIRahtZXFepRlpq3mCz8pnGjOuWefC
         k9jpdUVVznvnlgerBsdo2KhJoc6VbcOTonCAIcd3rF8MctR1NB4imTk5e30ZiPr2osjw
         qy8RoL2laPy0epxajls6/r2xn/v4Fcz/I+XhEO8q+GUKnzXMygvDY3kvzW8SVargSC6N
         S2W1mpyvJXZiOmhXT3LbX0gF4R4r23HSvTFk2JKujj5zMH/f/xovWmKOF0z1JpyeWas3
         SCnOD8nUXLm5BtCnhuN/yZ3zai+3IVn3Xfg4ULbIYQ9jMOcaQ51vwg3uOhaf6vE+AO06
         W2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682189; x=1754286989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL3WUAt/E/JB7U4/txK3K9d2bFPzk59C+WVfG91tte0=;
        b=C9fwb4FCooKc+EXYmaxFNUkLcwtIIz9iug+atWBNdPIVjgidFVOH4cLr2rikm1UG1B
         u61/j4erqMgH81xssK1ZW8W4eZc4dZs5uzRnkjVYw6PT+4qgUsuiJGnq0C/e0jZqOOTI
         aaCP9D06bZ0QxXfoweJ4XxJFohk/QSlXpEYsu+FCEe5uOo08wByutZO7LzMfo0g/vNS1
         Lcp04jYiI51zbbQT4cZ6f7nm4hPn2j4fYVKE6wjfb9VoHxj5TusNKjtB/zFFbBivLwJ+
         TnC84H5DXtQhgvAsjlQTrgAoZt1bxmpUbgJvT0vBl+Ttualy5XcdpbgYVfrSzIS4WM9K
         B7ig==
X-Forwarded-Encrypted: i=1; AJvYcCVoRL3IRY+gd/OMvfQcjx3cPTJWm4kwRBOS5vsjUDHERAg1cMfdJbZj8dY6+FMB/n+yy3tqwqLnrPtda5XViCzg@lists.infradead.org
X-Gm-Message-State: AOJu0YwnrA0BkWm+JdCh9SAQrOCDIfXlNOgTCmstxzqKBgip+2nQs3hL
	QwEHjyMO3ZMWfj2vat+3wK/QQp4z1/2GfOJYVU31Di6EDccFo8KvNWEk
X-Gm-Gg: ASbGncsTZ1SCwve5c2Xh1WDdcyS+roIZ1Icx/gQUXYXKrYcn6fDR6h7JdofPpZNB2LC
	6ffQgumvwvlJZ06Ys0p06JfmYuLoTtmVpMLNcyoSOp6n8EMq99rYV3mTiVnEKR597ofOZNZyZh8
	2Wv72iI8GLooSGI1nJGqGN3c+oQL3JQZb9/swxYB9tW/UjvT58r0ApJ/zZmbpK7T3KpYo6YOO/F
	XfWTwXK3HaIjduvyc+xsZJks/2KMMwKB16R1Y3bHjxFae5U/AlEdPU3uU01a86U301MFD0FUTdd
	lf2/GieML3wxwIhm7fU3czLRf8Ik2KmenxUtk2TXa+fJ8/HqLe++sNTV6Ds8hu37vBJGn3GWXEO
	qIxRO4iZhztk6LQvFSOYs6NDUq805KlJlBY1DbLdHmNFXE3/S1+gDjnPv07oCrg48pZWTursGbU
	g=
X-Google-Smtp-Source: AGHT+IFYSrKh0tfdTWTrBVWNM0zAsQJS4EjDsjvUY58SNitCxSLezcS2f29GrbOUsvr7sviStuxoDA==
X-Received: by 2002:a17:903:1a08:b0:237:ed8e:51d4 with SMTP id d9443c01a7336-23fb30b3205mr188991885ad.24.1753682189146;
        Sun, 27 Jul 2025 22:56:29 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:28 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 04/13] ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
Date: Sun, 27 Jul 2025 22:56:06 -0700
Message-ID: <20250728055618.61616-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225630_156874_72E3B6EC 
X-CRM114-Status: GOOD (  12.05  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Move eMMC entries from ast2600-facebook-netbmc-common.dtsi to each
platform because eMMC is removed from future Meta/Facebook AST2600
Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - The 3 emmc-related patches in v1 are squashed into this patch.

 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..ff1009ea1c49 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -201,3 +201,15 @@ fixed-link {
 		full-duplex;
 	};
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index 840d19d6b1d4..d0331980d082 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1243,3 +1243,15 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 208cf6567ed4..0ef225acddfc 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -156,18 +156,6 @@ &vhub {
 	status = "okay";
 };
 
-&emmc_controller {
-	status = "okay";
-};
-
-&emmc {
-	status = "okay";
-
-	non-removable;
-	max-frequency = <25000000>;
-	bus-width = <4>;
-};
-
 &rtc {
 	status = "okay";
 };
-- 
2.47.3


