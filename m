Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95145F3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=; b=yDOKKArvS86Ra34bVxH8UJZRzo
	yTYhgsUcxN/Emode0M+6M493hUu+iyH/70d+JxlPGj9wr7DK26bZm42nBDjbDPiBTOalwyfjZhIi+
	vP9yNlN5BfezcPloScM4COjS6FZjdV0T18w315fPl3MGxRrQqSqfkapTY6VrNHYw+rduBvKQ1z4pc
	+i5v7nwbpprZGOuD2uShE58GFfoAZ1t1zGiSSBV0xEshYBhk4brGAN1PE3mCg63igeE40gh1n5+kB
	bixU67MCJRpGwtrQlh26PTLoPdUsoe0Fj9iSROsno4P/FssGb+I4tlKKPfpO66MicsJHZ8OKbX4zf
	jAq+jcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786v-0000000AsWo-3jco;
	Mon, 30 Mar 2026 08:36:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786u-0000000AsUm-022y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:36:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so34787705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859794; x=1775464594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=rG/fmF0DZZPMRd0JIxykF7R2pwvLDSn2AEAgyKWN5xFQIsNyOKiAIO8S8VOEb25a1i
         tsshLEiXo85QVGS6X1dAJbi1QhW2KODN7FicT47n2EFyqIv6RsxwlTELNGiSf3qzYOIR
         L+3kjNVzSML3/2jdhFbyEzL2MxPxuVS0FPf+wTVygCBs/REyKms2NsfTDxpNyEZU3I8p
         iTkE64gPJGPkHSnUcSgSq/dBxYBMM8eCxmfeCZA8A1P6QjdXaCaYIkPY+34EE9cyC1Hd
         a0VVmJLRRKdEqGzVLJRMgmATjj60r0+lM4/3Z1uRVOtJhOSANXwjXl6jLYH+y7z3wk8/
         v31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859794; x=1775464594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=sVCzWLJuQIBcgGXL5MuoCc/t1PXoQpyvWLxzm6gI/jKmsWhEnrK6e3zsIJyAI15e4e
         1jW3kUkIzDNz4rGouEtZQp/QS+z17nTMjfS7tJs/jtM6I/GbYo4fuv2x7sdcfmA95afH
         NUcVJG2PjFQMUAEJaEwByCrd8lywvrkxK8rRar5N3AexP3pu2n3NGPMtsvmyoTOeFnE6
         dhcz4rnPSrZrV4O9pdnQpzwd4xe/OoRu98eIJUzdeUGdnioVSWY3hISrHEgvjewz1lQN
         3eGoyL4Eox7sqsHH38d8joxaml56tPDHGRA5bsH6qNXATn+JbjjmDn9m7wSGVYBLLWDm
         JWng==
X-Forwarded-Encrypted: i=1; AJvYcCW39amx+rodGBUEYMhOR0vHlto4q+NFURz8ZVLv7UE7xcBGTo67FFgXgnAMAur4doAMEjyk+Xl/F8MF/uL7fewS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc6Q8nY6rLGuMr5q51OxsJIWJPISDIOERQ7alBOIhCDs5m3I7A
	6FWzHWyypNKqa8vXUWlJ6/lgVxOU3yc6oeebTAxjw2qebB55VWxhwpTD
X-Gm-Gg: ATEYQzxUAtklKPPUKjbH+ha2vhtdmUJxwhFcznCf1PXMu1kolnUvoUVMTIq4ar8a+aO
	r5MkEW1XaTz5Sx8uexZ9b/+FKMSkvm4yaeyhjWeVr9uevPHDKiO10wmOcucyQTaP4t39MJZy9w2
	vOP5DHaYfyxcTIQVt/pz103HYImi1ZH8DtHhQQAD1RrXvp8pPDunHtUA+V4P9G4RCbiCWbkqFBD
	+yY4395VHJAaZrDIJ/3kutMYWu5OgI6e6DNvwNN8u9p4/14fPfgAdm0GTBXOFpX4Ba+1rguKc2Z
	nJt1slKQu0drZqtfk3X4JGD+rTARFmCn7zmEeKMvdiM1cebQJsVO8PTssECUja/UCGjM1sLU2M1
	hwZKXGLySSVzqQtQ+ZViO81yjViLuiutmRVrcaLsRDOhgWeXBzDTbCgjfP8++O+maFH4ucNlsgl
	bwmpwSO7anVWEayXJnnOrsXljQJc6+ag==
X-Received: by 2002:a05:600c:6386:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48727ee5720mr183078015e9.1.1774859794164;
        Mon, 30 Mar 2026 01:36:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:36:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 30 Mar 2026 09:29:43 +0100
Message-ID: <20260330083429.359819-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013636_093990_61770E5C 
X-CRM114-Status: GOOD (  15.25  )
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

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..750ee9b2856f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore { };
+			mt6392_vproc_reg: vproc { };
+			mt6392_vsys_reg: vsys { };
+			mt6392_vaud28_reg: vaud28 { };
+			mt6392_vxo22_reg: vxo22 { };
+			mt6392_vaud22_reg: vaud22 { };
+			mt6392_vadc18_reg: vadc18 { };
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 { };
+			mt6392_vio28_reg: vio28 { };
+			mt6392_vusb_reg: vusb { };
+			mt6392_vmc_reg: vmc { };
+			mt6392_vmch_reg: vmch { };
+			mt6392_vemc3v3_reg: vemc3v3 { };
+			mt6392_vcamaf_reg: vcamaf { };
+			mt6392_vgp1_reg: vgp1 { };
+			mt6392_vgp2_reg: vgp2 { };
+			mt6392_vefuse_reg: vefuse { };
+			mt6392_vm25_reg: vm25 { };
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm { };
+			mt6392_vio18_reg: vio18 { };
+			mt6392_vcn18_reg: vcn18 { };
+			mt6392_vcamd_reg: vcamd { };
+			mt6392_vcamio_reg: vcamio { };
+			mt6392_vrtc_reg: vrtc {	};
+		};
+	};
+};
-- 
2.43.0


