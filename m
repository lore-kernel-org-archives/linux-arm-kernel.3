Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451A1061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=; b=oJrqN/ElYjcPvdckwvY8aaGLuH
	0nG9nZY2HkfP/Ae1nkffT3zdb7FmXlAwpFKi5pvMe2azSsPIyJOJmqKD+/lxQ8okasllUJyauXgse
	o47/1MVExIaV1NiB2gNPlm75Q+L+76Mw7zOE2UyQrRKu2vRSSp1tWj2OLj/LVw238cimJZTXQt3KK
	kEewVl0HfkydERVdYAzteL7K0oHqXSdBegfxM1nWNJjzrqtRdu4NbdRnt8xYJ+5Bw1ite9xx3kAw3
	rBZKSbqbF9qGgOUKcI8IBWZSGQadeVng0I6kw7UK5mUIP5OuRJjM9Jik+sN+ZNho5+ExfCmFjwGqy
	0XT6jKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dzi-0000000BWB7-09nz;
	Mon, 30 Mar 2026 14:53:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dze-0000000BWAO-2zUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:53:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3155332a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774882409; x=1775487209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=QGuC8WKmEjGack4Do02Z5CywKtHXDsBn7MNeikPhjOSRcXU16wa6+6HuPIvDrSyC0N
         EaWlLi+bTb1/G9L5pNLWjmX8VEkT+0XjdG+9ghstn/Tc2ay48TsseWt8MVnOnOJchFew
         pYDCHdF8dRS0wyCL5mHKK4zZE/EihZ/bCGEN0H5SCTtYqJottoxsA6dgWoUuJ38JCkzn
         Lnu6bOkhk3q7ZrRmz0mWddNe6lf94I57DN06Qv1gpCvQliv85Wq3oI0Hrx1eQ9AWg4H3
         K6CnyG2sr/bm8sR6SGvjYh+LczJPQ5ZtQXwwPWsvxeXNg6fTfLmfHcskmZO+zekCqwEj
         bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882409; x=1775487209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=bFOtmaV4c7HEbDAuLn5xp8E83QYf8DNITX1bFOz5DEbtYI0DzO+8w2Eaf8OXnV7uA0
         iIEEjNNWPOSgJPFEMIjn9spCpenqsHL0ID/iljxtw/nwOSqC3sOzF99pl24gWyDLOiqP
         WCkJUVy0RIqV26XsQWwD02CwUARHb4+XVHqHGBcpnXelI1m9AaVZ3sCMtXpVxsVxseii
         fQNYK428p9UKPz1u+DjCrxGQ242/0znoeatmhARXyGgHjdu8B8Wr4lv1vC8X17NurSQO
         r+zpl3r/b5eT8yRUOdIDqxzGROTL4eljHseIIzK2MoPUskt4rGfhhGaTZtNXuFDgVcqp
         2ROw==
X-Forwarded-Encrypted: i=1; AJvYcCVrsQL4cwt20WlJDyzaKctH0pr9uITFrl+c7yNghDaluIaT645I7UevywyHWOvgDniNCpXtNOO86ipeNR/QV8qw@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJvPa/RE1FYgjP1s+9tE4LwPEKwaiAuktFGc0SoPzpTXU9mbo
	F4xVP5UpVfIp/mzOxj+7YgzQpAoLQtgYhhzAiQUWe72MYEcS306rZPSx
X-Gm-Gg: ATEYQzxH1YuNl6Z7QbSivzoWcyeuglKft5Nz+Ix2aIKcWR4Wwy11Up9N3PQvjVzJlWZ
	6GhVQw7aHDiUQfwzstCa6xot+IyKEg5jmCPG9dfz87x2vCfYvxkQLerxDxCP18rpo5lWnCv11l5
	dS08yryIQzMkJeucgEw9z6X/NXjnC9Qeql+chhAfnH+Nckq/DxkYE1akYKCj1sa6M1Na8DZnAEt
	aX9Ypl0bkzRyowW1cR9INut2TJcCYZeivos2/IuG4q73Txia6ov0u5LKPRs2VrUj3uDh+njxp2W
	41a4PfB5KQdnGIIMnMAPGiqilVKbykteT+jahbB8TI1d/4BCTgzLX+t38F9U9p+vtWwA+ZIm+bm
	1rqIkn7Kr3LmB9EIr8GOjfvmldBRa5sGLI38UcvnpFjxyMV6S12DMMHjMdyf2evtR0qofpLCzNy
	IX2iLxnJEh3ZMzQEpQ3eGHnD/JT5vZO4uQyUtwlqRzjB+DGA2aFK+L9R9zZO8yUGs7rBclecl7C
	g3VQ86vgvDV2QqASpQ=
X-Received: by 2002:a17:90b:4cc6:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35c3011512cmr10970363a91.28.1774882409439;
        Mon, 30 Mar 2026 07:53:29 -0700 (PDT)
Received: from arch.localdomain (n058152025253.netvigator.com. [58.152.25.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c92dsm13218247a91.9.2026.03.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:53:28 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
Date: Mon, 30 Mar 2026 22:51:11 +0800
Message-ID: <20260330145111.115318-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075330_751582_0F44F852 
X-CRM114-Status: GOOD (  11.22  )
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

Correct the interrupt number assigned to the Realtek PHY in the p230

following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
interrupt improvements [1].

[1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/

Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 7dffeb5931c9..701de57ff0f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -84,7 +84,8 @@ external_phy: ethernet-phy@0 {
 		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 		eee-broken-1000t;
 	};
 };
-- 
2.53.0


