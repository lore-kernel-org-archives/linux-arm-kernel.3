Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3E0CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYJ3Waol90DxIJJuBJ0Cdr1sRkDiR+1RilwvhBCpH8A=; b=QTugr/mv5bV05l2OKPU8M3IP6L
	3EBMLRIJrINUY4Z39vskHMlgQB7ZB+8fM1mqpG7w1qTV94768aFVI80OeOZxWoVtjpNwvaCZxJTfx
	/LKmNhO9wzKWvUBicQk0XLXqXhmiIeucOg+hnScGV8j0cilN+g5sjDvmpL9t0/SnOK/fh2U1a3mre
	iQCtCDsTgx8hIwMZYNMT24VtWeVMVb4H7mse6nAfOhWvz+gAmFvACYxFLeIy0Z5k2nKTuHHVy8cyD
	TcDgDN0Aqs52aGnixeo1QpohbcGemFHOdwD9TWmkBwZ8uieMQYJDezaUMeTYROmJRahRPvL/JwRuL
	wI8bcBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdz-00000004SMe-01qE;
	Sat, 23 Aug 2025 09:34:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRth-00000002dgn-07iA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6188b6f5f9aso291151a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869615; x=1756474415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYJ3Waol90DxIJJuBJ0Cdr1sRkDiR+1RilwvhBCpH8A=;
        b=I8OEfW3BJiBohH4T7kSzJdR5UgY4BzytZ+rI2oLRE5sPMz2KSwKeXck6iUCSkxoQ4u
         NlK9q9w6JVn9IG2mS1R6q1QyMaNfYkfLYYpjrbB5kb70npms3jW3HSoNtk5khuw74PvM
         N8TAo6apEPhO+HcFBViKRdMoOKQk1u/4AZvYdcGP3KW35B+Og5ViI89+kihRA7mUJyUL
         kZLZJV+r4cZ5J3HaqqG4K9iROxX/A7/YtyCETh2NuuVEScCEMmUJ8UHmAYpaD+H7Gvfq
         BvSFlgjpNK778tFD8EMJ6PiyvBmX3m3bLKhCbCHBJzRkiPuOj6w2o764IJJ7XPE5yCTF
         iyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869615; x=1756474415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYJ3Waol90DxIJJuBJ0Cdr1sRkDiR+1RilwvhBCpH8A=;
        b=s5ZpL+I7uwtH01bDlxKV3nHv9sCH9COCIaOfy4kNVduyrCWtWkxQqB20FsnUPGe4r7
         RLIryeSmZjT+5+kkyFEoY0oyM1oE0i2zlhtzvez2bz/+zpyRu6F4rXgsOoTGeo+aSLgb
         ywSFEesRAg5nMM/pUoPT9K4v1CjWrF91pl2cbTPVsJXJIvgMwPOb0R5hz5bq+0klVQt4
         yalyCRARv/SvJsOAuzZkqgw8YzYgCpgRxZTHJ+wQXWyWn6LfQrHoLhzlAWqszwkid1/8
         6JJKb/2sL8P7nhn1CPPzSop1AFj7KXptT3V4NEEycs9SWygRauefKKKvqRznWdAy1rvx
         PIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzh5+kEUY5h7EjUWPtpnT8LFbT1zLdV0nkvZVnTdxXbG5jV6HSfzXjpDaI5h34VMmLIjy8Pj2XoWawvI1ZUNO0@lists.infradead.org
X-Gm-Message-State: AOJu0YwIBAYyQm1JGt6Qw6js84ZLQLnP4BeE9tM99ZA9gRlZZ33ELyVA
	khHttMyVIva13Jb4yJjLbeqkxhRrObQZG8JKBIaPyKQtZQmsdEjgGAk3I8glxiCqzLM=
X-Gm-Gg: ASbGncskyHKcHsMoz8P9Pl/DxFfrC2198Y+ZWOGCKBF9PViAfkh0zX3MtEnrnLiaknQ
	gueON0W4z0l4HCTeZukZ8mOa5i1iR52PCeTSy4LTRfSMnBlpJJFKrPWeL7VTy6pGszoOkSBdnJi
	CTs7Hub7rTzMXO8TLG9igpxiEIvY8JPRaA3fmWvDdRD6yCzUQzvrbVs5mWsvsVdm8Nuo7ENn36Q
	I0jybXdZhClhAxK1WWUrQxw2H3/HDwwb05gf/XooLCgQCiB4hHoSNBfREikzpwI31kk1fnyH+He
	TA7Xd3cObc94fapsnwbC0c0oK9DwEvdXSyWnZpq3PCQf+bjcDf3ssB8dPhtbdld6lTBruCnvT7H
	CZnmLv2ypMjbBwJi+UVU3QpplVVV7ovM7DFxwUvwO6Bjk
X-Google-Smtp-Source: AGHT+IEDljXQJso1O+dt/12kndTs/eRYZO+jTymQLY2/8T5kyJtnHBEBf/E3oIyet20GFVSY0iZuHw==
X-Received: by 2002:a05:6402:234b:b0:618:1835:faa4 with SMTP id 4fb4d7f45d1cf-61c1b4d0198mr1621928a12.3.1755869615455;
        Fri, 22 Aug 2025 06:33:35 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc305sm599477566b.18.2025.08.22.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: marvell: armada-cp11x: Add default ICU address cells
Date: Fri, 22 Aug 2025 15:33:31 +0200
Message-ID: <20250822133329.312326-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
References: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=dtID5g8DJtSmQ3vJl5ZBxIlLQ2hkiY+HtiOqkvEqEts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHGqLJ9+bOCak+ZL88H6M5j8mYmsduALpOpAp
 pZT4h2zS2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxqgAKCRDBN2bmhouD
 1wqSD/9JH9wq5MUh1vmWps3nd7umQISUTcAEpBTG5mGLu5zCK0ee3/brMUx/K1Gh1twJg5d1GGr
 i6MBwSn7u9U9fmeX41RXZm7QufPAISvPMcObjlZxtaH9GYlImGchPgCRpRCcuNAL0N6sigVvpAe
 UbEqLCBlJ0gymCMI/DnsrCr1pf2Cnp1Ib45ZTQiNKByrEmlOVu+bYQBOf6jdXqAArrTbMwePAN7
 TBMz6u/HTTKmEEHi4YNlNipYXDND/ebgzIX4IOWM/L8skFZtn68mngdgKoJwSwbfhlSbsVNG7zm
 7RX43L2Wd6J9coVVeOZALrhErv3/cxMkPkmIg5f5xCRh7nwAD149gCbj8J8uhMOvl+W0/zrgsuM
 +LHkAeZBharDSCqbDN7DXWrt/wGDLWJLRQ9vk9QgyrMiI8uVLj/rPq8QSJ9uEC6g9soEMOAL9zJ
 PAy9BHLuKTERj7B4vfeLwW72igV+0GBTTMpDEAGxipMejOuBfFBCNJV87yPjrSZD1RKunofBvkq
 PqfiBV8lNPT5mQH3BfYQ4KIP0CoXWUeoP6fiSa72x8swEws+naUMAj5mr8vURXqblMMmpbhv+yP
 V+09dmphvNC/ZpJVejg63DSjnnvjV3jM1SakqT2m5N2HARhhaYpgO1lJ7ue39v/77KE3kBdbr8K iC7rdJrkptN/aPw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063337_067517_3DE97C79 
X-CRM114-Status: GOOD (  11.55  )
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

Add missing address-cells 0 to the ICU interrupt node to silence W=1
warning:

  armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map:
    Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index a057e119492f..d9d409eac259 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -202,6 +202,7 @@ CP11X_LABEL(icu): interrupt-controller@1e0000 {
 			CP11X_LABEL(icu_nsr): interrupt-controller@10 {
 				compatible = "marvell,cp110-icu-nsr";
 				reg = <0x10 0x20>;
+				#address-cells = <0>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				msi-parent = <&gicp>;
-- 
2.48.1


