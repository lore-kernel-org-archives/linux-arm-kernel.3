Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49DAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHMZx75Kp4IqzfyIVXcCNI72mZZvOdecszaJSRJoUdk=; b=DH74sa0WRABjYkXaikA3ufmnzm
	Nc4klJNc/b2AF5e7zTOrJZ9ZtoR20HL3Ew6f8c5zpTgl/0M3lHWMt/PAyru1MKgUWpVkGiox67WFD
	ZxKdqiMhK8q9HpZdzbK7AfmT7tNOzLvrN0GKoa1KpQ5u0vfoUkQA/1Buz+0E3Afz/Fsw1q9yvsid2
	ylrDhQ3OzHndnoka/pR8r7W1UvdlBZKxrk47hF9WptdOJgaW241pHvplrDk1G3xfMf1NCvaYZSwty
	ZbyA52LVeL7L8xo/XYv4u802vjhMWeDQwZ9nvhsVXyEn56/62uupUtGtG7d5mW/1AyQBhCrzxpDp7
	FmLYT7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOq-00000008wrE-2GuS;
	Mon, 13 Jul 2026 11:00:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOf-00000008wiE-2fTu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:35 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8487b7b3fc7so1086992b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940425; x=1784545225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHMZx75Kp4IqzfyIVXcCNI72mZZvOdecszaJSRJoUdk=;
        b=kNFJhMDrhbhuFgAqj+7dNV+HDJs/qUxnrjdYf2GQjLpUG1EBYEx3FX1hvXtRH/cMze
         tMAQrScmgQfr5OT4brxrvWvOV9iManFHw7I7zhaEpKLgSewWo6/+6N7HNoxViLpGCqe4
         wSjP40TRmATxElt/sax9Lq1TCFLDo6XORHvAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940425; x=1784545225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHMZx75Kp4IqzfyIVXcCNI72mZZvOdecszaJSRJoUdk=;
        b=VXZqWskD7Ir+hnjVBF0nvIHagxkitSqsjl1dWQmueIOIm6UhCh8fCNOOva4+sVloCf
         uc0ICiC7fi4LrzoppGr/Z36k4xKPNYtR9ieE8qxOqUYKNa+bUYeUYaBQQTKTPl/oFF/E
         XrkSelSG3fO5oYnVNQwzXzQO8CDTX+uDgx/xdxuO6p0KbTC9n80iiob+cr8l7wC7pE3k
         ScFUTwjg8cwZv+YjwRTnJRL642WodAWm/KqeOzfx+GC9FF3z0159wgRLqwH/RfevHFCo
         Hs7j3KKrL8yaqNlfyJzzruEKwJk0AXIsLdPfkRe3W1qtfqfq7Xvv0gVhAQYtPB5IH4z1
         zQRA==
X-Gm-Message-State: AOJu0Yyif/vSDUAweHdED4qbkAAZgEYbVjUHJtJJqJ8mdk9JtzplTIWC
	QYTvbqts2BhVzo3iLuWqIUhwNldJz29LSUl98mxnarBSxtP1Z39G7/iiKqf0Z9pdo6YfhVQiE1P
	EgEPa
X-Gm-Gg: AfdE7cmT/VzDYJLcbvXSKKsoYs4aKDZWbtpR9yUyjArRnxTvMe42Vhtg4uf4bCzRcTO
	14po5Ddz+eZMVo4PjwVat3G0lYoojFLpRM1otqxN/P6Pi0Wm1KSrBU+eSEgC2TRQVp8ExBg1cLm
	5abfpNJGyKJb/BAcPIqYO/X58k/dxrOZXX2egiNCdFqmdjtpBK9UvxhabqRLbqSz14FJzJzWbCq
	8CNDgWJvSfve48Wr3BmDcDJtAAn7GMrgZinlYecEpgsC5oYz8UuwDMiAixP0phhbyO07cfOScMj
	wLpye/OekgZ8UsYQdXb2zJzxoaWkThlnMOanhnolJOnDFPmiLHv3AxSxtHSzaonP2ICpjxbqu7/
	ZZbfUsirjF+zsxGZjJGYQNsqYZkZy3vY+PW5GhaNMsxQdSgBRHIBS7/58B7pKcsDhwVzcyscaU4
	Xmy8o12us7uzKt3GQxivfIFe5EzQ==
X-Received: by 2002:a05:6a00:a212:b0:848:79af:8b2a with SMTP id d2e1a72fcca58-848896863bcmr7700636b3a.27.1783940425055;
        Mon, 13 Jul 2026 04:00:25 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:24 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 6/8] ARM: dts: mstar: miyoo-mini: Add vbat switch
Date: Mon, 13 Jul 2026 19:59:48 +0900
Message-ID: <20260713105950.1346962-7-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040025_676538_E751E9BD 
X-CRM114-Status: GOOD (  10.51  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add a GPIO controlled fixed regulator for the battery voltage rail
on the Miyoo Mini.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
index 5e927f41fa73..fde4703eb52b 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-miyoo-mini.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Miyoo Mini";
 	compatible = "miyoo,miyoo-mini", "mstar,infinity2m";
@@ -24,6 +26,15 @@ vibrator {
 		enable-gpios = <&gpio SSD20XD_GPIO_UART0_TX GPIO_ACTIVE_LOW>;
 	};
 
+	reg_vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &pm_uart {
-- 
2.53.0


