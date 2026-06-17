Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2F5CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=; b=FhtiJGo37JgCCn0/aAmyuZEMa8
	UgsjvMlCJCpsONKIrg+QdYVWgxAjDdsco/yzjrUytBww+LVrd38QT0lrBHsB5oizchPTJWBiiwxHN
	5TZLR3sb7Ptke0HW4Iwa/5nKO9QGufau6XTiYh129ppegpF7tUvp08CWoYjNydWo2KKlAHVfzpVDf
	AuLzRslgV8RPhjz79AC1HsC/zLCzcQkvae1hBl8KPzkELaFT+CmLqGiLqMnXYytM5lOdZpjW8iDNn
	iSEWmEEGvyVsFVxbaCzRYEIdyduDO8hcYQCijQv7QJRsttJs9MWzoGOhVvl+yAKR2j1n/QBzGvqIU
	p57lHJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVn-0000000Gnkc-0xfo;
	Wed, 17 Jun 2026 07:16:35 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVl-0000000Gnis-1rOO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:34 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c858cc9870aso252437a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680592; x=1782285392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=rEqzDdV1Jd8JjsIJblAzricJdihf1c0jGpClFdRlDnEbbdIZSwC092d9X3h/l8vk2E
         aH/okCqeg+N625bNhCG14cqdgBmCAFje94JSpPVLT0HBB0FMZu48vDd4uflih2picQLq
         6PpxbTkKlg+7OBlzVyxhorLMpzAXHP5YfoHjIGX7aB2LghGSyHLGgExMaBNid+Ee85BL
         WF2BGYuiLNsjmOPqwNwawMpO+3beXy35NbQaQXsdc9nVF8BrKqpntXKnwtcsx3FGxNQp
         Hpu5nW2S+0mffOa0x6y+Rlcz1qkD4gsbzQntvmvk0pEuCXow5UemQZSBnWhKqMdfp+pe
         HocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680592; x=1782285392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=iYHGfsAEjOZCg8QF2mlEHRC8rTjXZPspB3312ET1Djwq4D67Q+WeY8eUfN6Cbtmv+U
         6wz7a6hJmS8aOywbhoPlaNyA58F4GrwXVswge7ggNbaAKxHrws40C09AhHN06mmMGr8G
         lcwtNmiEOHPi8VxO8bwg8fpGKZyxasuSjcY/ufXZXlr54EghlTFxm2ouQDMJB4WoPFJT
         jMsOV7AsCmeVDoFfX6rjUdOkUOYmz3Z1gG2XuI1fKEjDJ104um8xAJo38Hl2gstTBSya
         2y0jCM3FsSPLcYG1peLGfWLmrg2tiH9sOIW4lkr2VpGGRLAeYNRbGWUK5pbKF9CFyjJX
         8Hsg==
X-Forwarded-Encrypted: i=1; AFNElJ88V0IY0+wtW+ujuydvn3HQjMkhCP7eafx0jkbLUBTjUxEBzq8OZ5tHof6z4U2GkUHgabb5dDckYTXmtxgYiXyw@lists.infradead.org
X-Gm-Message-State: AOJu0YyPX6YYh/fMBEWbiU/R/ieyrHXfPYHNKSXRihI0TKZXvJGjxIDn
	bY4hpprerGza3sXhHHaXRDVqgsr+WDijjCIEL6Xm2LX4iv0Djppa8BvC
X-Gm-Gg: Acq92OFq9how1+/fcWqpOazOlglTsFkq6u8sNZRQaiFTlJZQSA9H/tk893w8EOVwbd7
	c+It1ar7Nig+X4P/pzaQ7DdwIK7K5ycWdbVgwcTsG1dKMwaYlDhdOxkFyMNzf93V1J06TZwB1ys
	WIkZujOxKnzNrPlJUvhP4YRFSPIH8L6CyorwSg45o2bVfvE2hFgaxkyquBaPbZq/+xR3Y/LE+Dk
	lx5lxXpO9sNHI3lV/7yg8moPsX7YnrWoCOxDSzCvpvczBlzj2qlhx2Rt77SDgz5H3gnklpFs37F
	suKKjakWkioP4ZJqNPX7M808/cUVQHzdNHxvbEQSZYD5SVOwVLmUMNYZjBOT65gccG9oxAUIllp
	p395zkm4vrIkH0zK738GylQNp1/600PfdVe9h+DbsL/2gOZaNgnO/HYOvbBFI5SFfboLeMbRYS6
	TnuRWor633dQ==
X-Received: by 2002:a05:6a20:3d1f:b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b8dc83dedemr1795872637.14.1781680592429;
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 15:15:57 +0800
Message-ID: <20260617071604.635627-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001633_495972_6CD096CA 
X-CRM114-Status: GOOD (  10.28  )
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


