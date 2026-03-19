Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92AC1088E74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUnbmXHqSDL7dPZI/Qu8hE1Nu6Gyv0faqBQ59rr7QWo=; b=rg7T4i+C6ape7EXbA+50jS+WOj
	uxI7fWZ+S0Ses1GlDd/GawEtsQIc11IAkGOGHz7E0czPfP/96n9NTOlPpSlTCqwlLoGhcD5dFjW5w
	AFDaHj0k3ddK3+Hx0YO5tqYtYvmMfD5Aow3H7xQx3vKMJoy6irD1K7bAgKSlgMA9Lzh3BPBlUPOpn
	lyjogsFxsUVJDvZBrluuWtdXX3Ct4UPJKZ3pH5kv99EwmR6EXreAp9onezaPyh+5lxTYnqJlRotAK
	h6tw2rb5Z8CnuwZCI97RYVITHuK7q/FVFV4+2Q5UOnscX8fOCj/ua1nABrBTcvyu3BgrhQ30YLc36
	uQRFD1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SM-00000009rLk-1ZKg;
	Thu, 19 Mar 2026 03:53:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SF-00000009rIb-1cpx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35a1230c60eso338734a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892430; x=1774497230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUnbmXHqSDL7dPZI/Qu8hE1Nu6Gyv0faqBQ59rr7QWo=;
        b=hm1cvUXzHWMrxu/2SdTbgX0nK1HKaTK+ajRuaJsY7WnP0c7Fa7F6arg5sVQmA4BOH2
         J5wXRev2KLVxtwPw/lTlvbmtSzHgWgig0tcaFFAFLKMNqM6wkgLd8c1A1IVTXY5ByFIP
         RrcvlJw+6WG8jBeG/one+abXfwj5/MSYhS5DumwMvepqQ+E5Bw59+F2n3DYzObQ4IwLW
         Gu0muS8KNxbeBWF4bVUECfCdPui6YbGZfxaAYqHTdhiEzT+SXlt57mInFzw+qSXGhc7B
         Z/7pvbD9QzxO9yAoMF/NKBklB0SyVwR3Lty7uxeKcniw1R+Bejgb2fWR7/MoANS/zvYD
         QolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892430; x=1774497230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUnbmXHqSDL7dPZI/Qu8hE1Nu6Gyv0faqBQ59rr7QWo=;
        b=SrRB9+E65LLvVC4dbJoxbaqUPdLdRXiv8OPGMFbFCIg04SQaPIO3aQe/tSKygaHHdH
         wq7zxtJ4G6o50gjV01AbMk8SJMmuBMVE2ZY8ux/eTLP66XxR087ZpHl21UvTaHAALgEh
         FMaOQNPjCr2Q0SvRa2pSt6UNAuU5Du+KNpDcO45gD8737eyUBG2VVrjF5joICRWC+d1m
         eJK8olyqcowApMba2QZhrC78Dam6L2cEWe5RoVvgZvhBpI6Uo+EaN3DR4OOqO+rPdKDB
         t5fLTtMk5+rSxO/aM/hMnBG+BjryqHeVyoYc3ZdMRJahkBdiP0IBFo9pkdNbhnFPOjMJ
         x/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6eElQHs/13xy+lrIfrCnuWzcDAHv9V9xGaIJk+RwdheM9DkjLVUcI1+hUBv1vwq9mj0NGvzREM1OoYGpODB9y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2UZlaKDSmtrcTxLiIcnoNimXEK/3XZGldCb1SjKJI/44s5OO
	oaHsatrGn1c32VQ8oeAzxF57dRU4jGKUlkD3VZ0+orbO4ozWFJ/bbPQj34MJEwKb
X-Gm-Gg: ATEYQzzI/8zcw8WvAslpqWLVLMbXSOAdVO07HFqjaXMBZhP1INrboNugqOFmSBhuZk+
	coaAzTv6iJYwdB2u913WO6P7pW84Un2XylMQ17V5eKTMNuPLg0Lmvv3tMbMRrepOUr9h2hkAWXm
	tctNkW/Ipl8rFjXDCaYWJFhNulHo7vXgVks4BQKfiBYMhWY1auwQOkdwkyPVl+e2xkaG/nE2Hyt
	EJ7SjgbJxAHMyH9RTiwwuyfxOaJpPURDKeBQPeleYkVIOWeGxvX4SdIDTTC3+XWKV3zZTe+7aac
	DJO3icw43PXdU1U0GEOpvro+nomW0lzzMEHKitWkd2z9qk5l8aCqniASQbNraYvmqNv0sOnuO+E
	XZZYcwG1G2V0D6sSatmxvbh6Hc18He1dXjOBd9FSim3fQGccPJ2HGqjfs4WogurBUqLB7FiZKsk
	FrK5j8VEoBLd+smSOwO7u/+o+gD/8kRrl/mWSqr2tuFzK+Ih43rFJBvpw=
X-Received: by 2002:a17:90b:5346:b0:352:f2a6:334 with SMTP id 98e67ed59e1d1-35bb9ef6093mr4927666a91.16.1773892430381;
        Wed, 18 Mar 2026 20:53:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/6] ARM: dts: BCM5301X: EA9200: set MAC from nvram
Date: Wed, 18 Mar 2026 20:53:24 -0700
Message-ID: <20260319035324.269905-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_205351_503902_D8F8B7E7 
X-CRM114-Status: GOOD (  10.59  )
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

Especially needed for the WAN port, which is part of the switch and
inherits the MAC from GMAC2. Added extra definitions for the wifi
interfaces to make everything clear.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index d8aab570dbe8..8037eac1c3b7 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -115,6 +115,8 @@ wifi@0,0 {
 				reg = <0x0000 0 0 0 0>;
 				ieee80211-freq-limit = <5170000 5250000>;
 				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 2>;
+				nvmem-cell-names = "mac-address";
 			};
 		};
 
@@ -129,6 +131,8 @@ wifi@0,0 {
 				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 				reg = <0x0000 0 0 0 0>;
 				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 3>;
+				nvmem-cell-names = "mac-address";
 			};
 		};
 	};
@@ -140,6 +144,8 @@ wifi@0,0 {
 		reg = <0x0000 0 0 0 0>;
 		ieee80211-freq-limit = <5735000 5835000>;
 		brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+		nvmem-cells = <&et2macaddr 4>;
+		nvmem-cell-names = "mac-address";
 	};
 };
 
@@ -155,6 +161,11 @@ &usb3 {
 	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
 };
 
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &srab {
 	status = "okay";
 
-- 
2.53.0


