Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2843CD116FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaEhz6O2P9o+eF4N4eTnx5zXJUYRgf4JEjtCniVcp2w=; b=MiM2N0zgKnoI3DRWZnlQilv5lQ
	CKYFY76FC4RTcDOoK9k/zXNCsOE66EMJJOvPQSaTaudUKTJV+d4wU8sPRbG4at4DkJlpcd5jI0++b
	1mx20Y6un94OQCSKVs47UMsgup2Yx4N4wcm5KYENwiACzs7uDCHCZxfq5mlPquYZw3RHLqwmNS+HO
	fV5bQ9Qx+K4iuFxg/xXObA4P7ZjuZqN9KW5bkmYJv3Lbl/l06VH5byKRFXX4HhSvxi+LRB/C6floB
	gkKafIzdIx+UGHicttkHglvNnvTx+aOmeQFzNUOBtvm9HkH9pl7iuhawJ7C3Ae4JvUrzEDbNA1l3q
	At7cW3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pm-00000003MMR-2sLB;
	Mon, 01 Dec 2025 10:45:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Ph-00000003MGF-3vrQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so729686f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585948; x=1765190748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaEhz6O2P9o+eF4N4eTnx5zXJUYRgf4JEjtCniVcp2w=;
        b=H9p8VMEvlJ5MzCDFgrW8xMgZbwWHX4fs0Yx/CVJHm+nuqZJSjvuoVw5xTF9KRVijf7
         l5Z1Pno/nUKfooG6a40tWoAfelJ+7w3/482WWbKFZsstDRCgmGvZotN7p45jhDIsbiRb
         sqq4RL4Cqh3kr5WDlXWtmtIFV8fBdNog/ew5t1XboMsQpMZI4S91jhrOWi9DbReEqHtu
         rnyvELRv7wusjTrM0Gfla2bV/aXCGR6y5NpjKcQGJIi1lfus31OzAvpZsBYQtKEg6LNP
         Ix6hgxVQTlPg+r0z3TS72QecvD6n9et2ByrFi80gI1EXUcQQsh0AqAjcBdy7ZKub+a27
         zp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585948; x=1765190748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaEhz6O2P9o+eF4N4eTnx5zXJUYRgf4JEjtCniVcp2w=;
        b=lCr9D/RwVZrd8yNgY789eymSyMB81Yz2HwUUxjwNdqavGbpnT72qxEHSReQE1DOpDX
         /MYA4adIbN03n2NgBwN3tnDApaEx4eGq62F1RHYRBFA2LluMu+seHNfJdzz7+H6XnEpj
         WF/6DeWqVyicaeLY+olAacRvJBVNa5Ixo3xGuE1cXW6/G9gcIM41t46z2rVo+RjsNe2L
         /BU1NgvkOBjsV44SodFgtIQ4tjTst9P4j/aBaFbpnJVAiU85SzLdfKcOvAt6VrTDbAMo
         EHaAZmcjPnVxOmv+IcB43vF+ac66zbxNmyRNwPrE1GDdFlSnsRLPEUx5l9N2K0RD1gCl
         OfEw==
X-Forwarded-Encrypted: i=1; AJvYcCXEzIcg/E6L884RHbKeOqsyjZtCGge+YSdeOUn8qWjvOmM5gb9ilnUjEcT1CCO4ZHLzEvhQrnbS4k1+lL4VB+/K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhoiv1zeitV2KOfFY6Yj1GpwOLTRU7Be5ThVV9z5uAoaCbK9gn
	9c1xU2C9WVHaDueTaoTAfo/fBsZ2SbewXxmGNDoQICNw5wA0uEtAs4ix
X-Gm-Gg: ASbGnctftLyey1kJXqGqOE+YOiCnMQCQrWGBI7mYW7+QffttEZZZhLBcCbmfL2R6BLm
	hIV3UHdZBOtQpVEZH7zQCMM3rNhjftlXvq2/t49O6+94a2/TyNV2KU86k99LwFN037eFMadd11B
	1vYTGKmjDFZv2OK/vo8MmOUzM+yiPfSYpXRqgXvIphs0uwAmDU2u4KW4nob8lK+co5DbcCHODJy
	1ftuHNquhe7N/0m8gpVvFvMJOGFZmtiaImtyeJ8ZhgMs62Ozyh+yBZDoMTYikG5Y1tff9nhqYrv
	hkujp7LxONAs2V3WT+yQK8wAXwEY/b6qudJiuQwO9ADcwrvv2xZz6auaGV2msALpV/RgHGraIh/
	TM+LMnXcFDgo085WpREp2ZeDvPY29JkXe/75h4K58zT9xYHSKulL5ApuQ+hFBDULPC6wMyvfpwU
	gTGkFMl6AUcBsDAi/SHlR/DqsbFQ==
X-Google-Smtp-Source: AGHT+IE8G4qn9MtqoJRt6EwzOs1Re3GYjg7OEjxSvjTqoKuOR37PmgQUIwGfViG46KaNtOidrvSCPA==
X-Received: by 2002:a05:6000:24c4:b0:42b:3268:bfc0 with SMTP id ffacd0b85a97d-42cc1d51edcmr41874577f8f.49.1764585947940;
        Mon, 01 Dec 2025 02:45:47 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:47 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:45:20 +0100
Subject: [PATCH v3 4/4] arm64: dts: mediatek: add device tree for Tungsten
 700 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v3-4-07f9af7341fd@gmail.com>
References: <20251201-review-v3-0-07f9af7341fd@gmail.com>
In-Reply-To: <20251201-review-v3-0-07f9af7341fd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=2265;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=8KaOuw6GZeezjBlK0qtnPyFb+grvQ/ybFVCMd9aLdYY=;
 b=AsDpy0c1UumnO9hVt5+7BO2Zwo3WS5S4yoCjwC+QAKb4mUapitLgW4BNxeVRPZtkvoZYv0U42
 VGYhnErXsBMDbl0zUmg07sf3hmHrpdCz8hWwbLDmMhvu6p9+/FJQB1U
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024550_052077_8F6EA9A7 
X-CRM114-Status: GOOD (  14.17  )
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

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- None
Changed in v3:
- None
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


