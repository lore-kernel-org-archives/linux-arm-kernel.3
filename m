Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E71FD1BDE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQYJPvwvgRgQ+uacXhfRNgoaW5IOSiziugCJWe/WiO0=; b=TOldGNqynQXUD091mjqSRrMGRr
	dkSV6kp7obkNI0jijz1Ikqm9pSc1Uq7ye/5l6YxsTEYTej+r+9tUVXrN0nj5uWBMPiiwPLvF+sVn3
	ZGLlYic5RS3GnTjb2NBegRpkYxQWhkjkBuDRKNkBOwjU007XHSSIMgdGtRHxj27a5lvhbrnrwapZF
	btI2XOn6/D9qTvRhjqM5qeeS7Rk8NiYhAsOLc8WK9TWDuUuj33cBKokobWFYptdWYS8OBCc6A4mdj
	WhHgvmOQm/ISy5i/gJcosV3CIGVA0mhJ3ByR8VzsDhnN/2hZa2YYD+miW1YqW/obCXtmdRST0Z7o8
	RTailn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHt-000000077eZ-3UUi;
	Wed, 03 Dec 2025 21:21:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHp-000000077WT-0cSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so164630f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796879; x=1765401679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQYJPvwvgRgQ+uacXhfRNgoaW5IOSiziugCJWe/WiO0=;
        b=D9z+OT6wig+D5apQBBgR/JmNW+DV/CPCZeCxR3rGTyoYcbct+teGIX83zk3B1spwj/
         g9vQxbkdZIIcQNnai+Bb+4HVaExcf3k4XpLs5iq2TiNljWDxKoyVJqp5YQome/mC18Z6
         jd0DcPgHwp8EmgyaGOR5njSiNA0Ti3sqf118pyfgPsmHIQ5KqwpIQaL6k5n1FA39xTjT
         Ny8kkwu0UaCrGvnJebtTtQvTd5CVGyyk7kNN9ZcLTSKERPIAkOj6k5k00lBpyZKUEvA/
         mqE9g4nUhg10cmlP9Nt6oR/cRffT80qnpys0NzhS2gAxRcaN1GO8YVFHXg7gbIJOV2DC
         t8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796879; x=1765401679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QQYJPvwvgRgQ+uacXhfRNgoaW5IOSiziugCJWe/WiO0=;
        b=pk7p5DA8EwcAfDwsLFdd5HVToQZUfeoxu+nAcT+2j41JS/EurAkxPiVub4/qHkg/OQ
         vAZsK0msyyBc4VQfXnXjEdV3cq/il8zYDG/8kLF8Vo3h6F0MFxEq0rFBL+dyY52NjjeX
         dK7kdbR8E3E2j790DaT7noqow+YbBuiLRx1nBYumj/2tMnxB8gyZPwvxyIpHivNoi8WR
         zZbtW/xCMNVwbopV6EuDH9i68lEJn6S8LX5POxZumVOGqcrXAKy4vtnE6wmDbNu7EdxU
         zNQZNcF1loCs0ajUtokON7oDVgUJJATA3U3menxRpPScMMHza1cfLFZgEpS7QJObdt4Y
         RblQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2wRi1xYtrB4BwieQtfdgjRvyDLlvkCFaPS8fzqYAqzOBpR7bplk+BUTzlZMITessxM3KB+hp0jPNVttluGTf3@lists.infradead.org
X-Gm-Message-State: AOJu0YwsfIW6qU2kL4+UCvHv5/p56wT9WUShEHW+TAToJw43hZUg7Cf4
	EnWCTI/CVeWkvYzht7lT6pdIEP8lnYXJwO07ktitPwAzO9FbqkzSq7ke
X-Gm-Gg: ASbGncvGCb8usfwziivLXXu6UDCdAT25BShMipeByOSnfOCZWWM9PM8yruTK1i1Jc1r
	unj+UXyplrL97f/WCMV7gzNC1rE3vOKHnKO/ld/B+C3IT30SPsrc8BE9XI9AF6CfoHhFZoRQHXg
	ZGONn6RsMBjAEBfos0uT7D2QKTvFvbgzJ0AyUqMnNKwz25u6rgQwStpBfa2CWnyRoNokeAOTwsb
	NX5NLaNGRlBcj5mXoy7t13XQPwTQupBtWlaAZ/lX7B3YTjA8Pa/Rm3rCjHAMHlkHuWDldkXrlhP
	M3AOnzYMpxZ48JIYeljdqOqslISrt7j1vAKYPVT5kehQ0IH69MuEFEDb8N1+j9XL3y51FXTDuA2
	bE4kunb8te3dpyLp/5aeIcp7FIUHbLX+4IG36tiusvaskgF2yhtcgMr34v5pnVXYOVQhJgbO262
	jmNZ2IpEyQu0tI9m8v0MTPZR+5Qg==
X-Google-Smtp-Source: AGHT+IE7S1JA9mBaFmTuoYgRyXZzK5/6ZUPVSz3qyQ9WBh4nTi0eMribDRvh3NSIjTNQKMCIakZKfw==
X-Received: by 2002:a05:6000:2013:b0:426:eef2:fa86 with SMTP id ffacd0b85a97d-42f73173ff9mr3865087f8f.11.1764796879215;
        Wed, 03 Dec 2025 13:21:19 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:18 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2025 22:20:41 +0100
Subject: [PATCH v5 5/5] arm64: dts: mediatek: add device tree for Tungsten
 700 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-review-v5-5-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=2426;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=1kcy4covU8RAPnEUqKANcyZxULd507eUO8g6XjGH2V4=;
 b=x6qWatvga+4olc5mMNH0ZKHSQe2NkVNuVbPQLbPiuTQp2oQU82LdSiLe5bnZTMnhxoE9PXKvV
 1C3xuN9dI/KD9v3v/tJI4UKY/rU6rLavJ7RB4Vdot1scC/N1MBj0J+v
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132121_274535_0AF43BB4 
X-CRM114-Status: GOOD (  14.13  )
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

Add device tree to support Ezurio Tungsten 700 (MT8390) SMARC SOM [1] +
Universal SMARC carrier board [2].
It includes support for the MIPI-DSI BD070LIC3 display which uses the
Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].

[1] https://www.ezurio.com/product/tungsten700-smarc
[2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
[3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Changes in v2:
- None
Changed in v3:
- None
Changed in v4:
- None
Changed in v5:
- Updated dtsi name to remove wildcard
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 30d169a31b10..85f338344dd3 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
new file mode 100644
index 000000000000..7580f9e2f20d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Ezurio LLC
+ * Author: Gary Bisson <bisson.gary@gmail.com>
+ */
+/dts-v1/;
+#include "mt8188.dtsi"
+#include "mt8390-tungsten-smarc.dtsi"
+
+/ {
+	model = "Ezurio Tungsten700 SMARC (MT8390)";
+	compatible = "ezurio,mt8390-tungsten-smarc", "mediatek,mt8390",
+		     "mediatek,mt8188";
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};

-- 
2.43.0


