Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496CACDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=; b=qxQnlThkRqu3HlK3j0CTqrl75f
	oRUTUNMchHYBs2Cyv3Ng4DzvFzkpJdEkxic0Nb+v5E9vS2GgTFK7dnE86pZbrYtTWOqdDtEcgCzF3
	htha/7bre4OgGgvEANjgn7WVOpdDNxKw0fc4/qpZmnSdjXmWeo2RmTHrc0CPZfsgHdfW+g+GLulsO
	DSUtsOrqWNdr7DVDAY9dnqJit0GkcJ2+RGm0TL/OCQqmaB15rJ95XhgMEkROItsw/ub+KSrRGDJ0A
	qswlD1mZlxSKmGxpvebqQB6F/EE/Tnr8eL+BMucpSeMqYtnysRGKicBJ/XoaV7JnboKKNG3MMClEN
	tvmuSh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6u-00000007rsO-073Q;
	Wed, 24 Jun 2026 13:57:48 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6r-00000007rqH-0872
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:46 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-7296071d19fso583139137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309464; x=1782914264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=JT7DeUGJw26HBVx7cUjvHmk4w0ja+o2ShE09dYEfJI1hl/XhEQPS5k1iusC0qvZYj1
         YY09SSGtJPPrnBGvyst1ZQPoJm0J5LmO/olBLi2u9pwROyGQqbGTTpJ+p8ebXf5jtbyx
         G3STXni/NwOBD2RmxnaKp5l+JJSd1Ed7lcp0I1bO1Axh4Hav3tN82PSc819aABW4nnlX
         WqxM7Vwcjf0onMAwwoXzGIZtoky7GxmWsozcQiag/4B1E5kPTqWzVDa5xyrxfqFU6n3e
         4IbWs0o5tasc4SDJOBzI63IWYlyYQn+oMGN4szy8UxsN0iUCOwWJ6n1HuKfeg5s8tFKb
         OEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309464; x=1782914264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=pBuUkLxvvtCvUQm8NUFi4GgWwLZ88bD/+Iy6ZS6s0R1gyQlqR6wxdudi5JVDMvhfaX
         vKjvL1nR/GWsoQAwliJjU39I50pU5u+bZXHnOW1qGE8p3ZdKgwNBqirHmjyPjFlXWcoY
         KhBrNS/GSAR5WefEqRqgREdmluBP1O8YO6X+KE+54Z9D5spuFsZq8bliawH8M3mFDAxE
         ycS6tYSxMe2XmwXDEn+f+waf+4f5v2SK1AI2dwoag2txHgYuwBsM+j/qab+7lshRWAa1
         2qsnFlfM+SwDA4kzPcxw2GLZy/A3y9DOp6FCJ882HxeQqQDVnBanCUF/k+WazLdC7scC
         lv1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpQtn7eldz/Liy0aR47Dfu1q06tNx6VAipe13G8n9+ZYCcxJ9QbfcYebJzzqhU4/GHAN7OqG4AJ45pmUPD/8Rw7@lists.infradead.org
X-Gm-Message-State: AOJu0YzZG7uJbeWSJizR9aMw2MEj2pG+LezMH2kzEDgnPluwEVItSC3P
	xsdCMD3KSeY4roHiraNRgFKm7+h/Bw7OkNUiMWZHoJi2LWZztPWYGxQF
X-Gm-Gg: AfdE7cml/KfyGnPDcXQfM+I9BGsaWKff2dfbXAd/Df6H+KJA8C/z4r7x5bqqPKLhf1m
	jkjGm+R/s1omIH6dmjMal7yNY08N/4Sofa/YHYovt3ZUrxBGGD/pUTz7Bp/Nig7fsSQrJbvwtj6
	o3fN+q1skcD8HAo6Avl4My7OrlmMSDaKSMssHB3LXCB4gadYjsOuLUlTQXW8So2JlcAtPXhQ3Fb
	LTczHKn5qEgHdfV/2d+EUNk/tFeiZC2vseBOnWPGlomvHaUvBv7m8u87IAHYhiyFDIxoFjUWWIL
	oa1w7DB242rWbJHBr9KyU6RUP7VT8AvzYbrmXF2dDimC2bxmk912EifldVuEaBPquWUrcQnb3aO
	4U0kzbYrwFJGpVV8rNGxLsgY4oYVoSehmgL0brsk30FY7xeahybag8JZNaZ5Ru/AOuGvu9gx7Dd
	qoht9u79q1IhyKB6skr4ww4Ts5YrIs6g7v/1V5JYzxA7SoqQ==
X-Received: by 2002:a05:6102:1611:b0:723:b92:31b6 with SMTP id ada2fe7eead31-73115d8fd1dmr1491466137.27.1782309463680;
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
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
Subject: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 24 Jun 2026 21:56:42 +0800
Message-ID: <20260624135650.727077-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065745_072149_523457CB 
X-CRM114-Status: GOOD (  10.52  )
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


