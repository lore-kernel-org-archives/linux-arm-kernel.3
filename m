Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14431D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=; b=jEhL8Kyf7BhQ9jr8ehzMf7AFDE
	33fLz4sSpIriKTZoHpIJBJJYkaxLBCF9Np51mqTqpYzDHskfGnIo6CKqlH7bXigkwRtyM398OAJH5
	qu2sxfJsC5/bhbUAvjxtpKiKVNPU9LJBMbpbNQqWUCeG3yCuaa/45V5oXSe1dHXis0erYZTg6fsc6
	6QwpAHD33Bq08AtsMQpoU9g10resUd3hJjJF52J4Lxeo77JQON+iEwp2pfDAE52MzP2BJf+VIFzcO
	qsPVeyw1vddQZCNz853m81iS1GhhokkWh2lEg27V7lZzHSQeMs8rv9WKEuSztN9qL9ucy9fDg+z+B
	/8WXEYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzU3-000000038Iz-0IU8;
	Mon, 01 Dec 2025 08:42:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000385l-2Reu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso23476085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578508; x=1765183308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=;
        b=DRt2+wAXGqkbWWdFAuAphOmOLVdtKDynsSYf7Y64nrgjw2g917GCLN60P33if0F+SR
         1L7EhNfy0L2g9+6XdSCc8UlwiBajr1IGW36JyoRxbXOPmumreUkOS4dJEEEoyKv0NSJG
         Frt1JBshmUk+cRKm5UNS9CDePDD7AUKc1ElRguevPFw1MOJ894o2GpV2P1hCAg/426ji
         96UalfH4Y9ddzI557vRac71gbFtfHb8IK2dhGfj/yNKlGU2rV8YMA8Kea1+05NCsDdAx
         vUA8vzxjddmVGYL1BtGb0WO3l88XvcVjrhJpSYZjtt05nEAXldxNs/KLgAub/SklGDoZ
         Lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578508; x=1765183308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=;
        b=cT7nMoQIWg32x4P47g0s0nCaEDx5i3gnQfu8OD4uZK4163jpQAc/IWQLcWqrUfVL4A
         v4eKQBRL30Vl5oWXJJ+Fo5OIQmDpuPknBHwN9yN1MvPLnFrqQdNdrpIcSlQYiHxaFI+M
         tVBPDbbKhIkpPyZZuCGCyqZM9HCUMgU++Q2bdKawGxRv8h4dfHDc1JoIH6S9SPXLh2tw
         P4UVWGKnURkk68vRnMB4g0VbSozYxq4uAax4qi28pnLGvEgNczK1ZQxnis37nbMG42kD
         jGSEq84ocwo6grbhG/6JhAwfCXCA1Qa4rk4/34mH025KBm+DRhdr7Ad04UPQdEsHmiN3
         7D+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhmyTu4gI1nMQzHDNwjzmb0sQbeo/4L7O77d4cqFI6xQzmEeIndM3BvXODiyRZ0dNuqi4Uda2D2cpMq+SOskj8@lists.infradead.org
X-Gm-Message-State: AOJu0YwK1GHWUktPU3p1ZdLQrqsRFBzTDCs1dMuHR82V8lvT9UYhD2Gu
	v3e/z+9aEUErXgxF6b80gUDcJ+nzFcaf+0qd5Add3LXvA33NTWePK0Fw
X-Gm-Gg: ASbGnct5NqFXF2Ts161V3EXE4pGyReT2bxgRzvFpTgxaIIXis+o3cWrOuau0qNIhqaG
	sRI/xV3ZZ7rSqbmGfCtC8sGV0rQnJnzZnnT9481nEgm8BtjjJHt2qGhoM6NgbrmKW17qmkcMaaC
	a9gpezO4UyAaGQHAjxLek52sHcIHmWwdlCHfW/H5+lfNnECij+coOMj2A6HKO6QfDA7y4wJVycQ
	0dYgSJqgmbNnsu5m7A999+B5+YfwOgXtywjX+KEx4Leei4+YvsHZ55L8xpFLoA5gWo2i7xTZ56B
	XZgnYql647YuolCyYG0FFCJXtwnwwAYEnT6+QGcnZAyk7wtQRXgXPf7kWNqeEG9dcF04OF+1Jl2
	5Mu5TJid+/Zjx8gYG9zJ+phZYhQ/Eee5e8d31z2mv/ecy5deeTGGI8lWIB7GrfEuAANzR+CbFzW
	Q+3tu/0LclyEK/T7t1uCE=
X-Google-Smtp-Source: AGHT+IECSZOOzFpRsQBwV4DiBbIBy+ZguLwshUjKK6DnwndqMxwWnIHiJCXqyIrDr0xEJyjk5tiDww==
X-Received: by 2002:a05:600c:468c:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-477c01b219amr386219315e9.17.1764578508035;
        Mon, 01 Dec 2025 00:41:48 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:47 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH 5/5] arm64: dts: mediatek: add device tree for Tungsten 700 board
Date: Mon,  1 Dec 2025 09:41:40 +0100
Message-ID: <20251201084140.376058-6-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004202_038646_C79780E2 
X-CRM114-Status: GOOD (  14.31  )
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
[2]
https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
[3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: angelogioacchino.delregno@collabora.com
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
Cc: conor+dt@kernel.org
Cc: matthias.bgg@gmail.com
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts

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
index 000000000000..f1cf2821107f
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
+#include "mt83x0-tungsten-smarc.dtsi"
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


