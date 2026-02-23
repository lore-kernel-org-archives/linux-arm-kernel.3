Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54DCEC110E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=; b=IonCdx1PcJ+HEseF3EywacfEml
	YM0tUdbTs8hP5QqHTnyT5PYvwilu3yHM3N2vC5YHaZ8ffd3arftqp0YHIkkdY0LxLjJq40aqJ3pw9
	aIrqHbui4rXyvFAfJH++ak6p9L/5t6iplTT6E5+t/wbQa9j0jb7smy3PZV6f6KWtxhBFDWDHiZdGF
	gR77dV6fAzDSTrB4cFx4I6icvIP/nGB/N1IPrlubnL1zWki4qq+j4DqATSP7lR6fD9RzcfMkgxvWr
	MDJPRIk6ABBqe6pw8fJSxPD/vQLAjyYSBMIsKNDHUWBtU7OwyGd6BNlPT9E6sQe5SJyNpiQC1V6sO
	PzMe+v0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZa0-00000000ka2-37PV;
	Mon, 23 Feb 2026 17:18:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZy-00000000kXT-2nGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-435f177a8f7so4561267f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867121; x=1772471921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=;
        b=nTQKPuqCQbgyrdI+nr36MYzlMulef8y/RCIdb6ncPEfyjgs+wg/FrPjtqQ143rF/VF
         4UTCP8AlPo16VoJ8wUpsDaih1vFNhrHzJdnD9xivgqb9B4BQfCWcKcT+5xcIqyKziek4
         6G5Lzd1RlqOvcQduMFJOfq0nKUHDlRZ+6SOJaoCC1lk37BZagMUlQ2lHswSu6dFJPzaZ
         rm8QaATt7rpWxQ/64z/3Xw/QhhCdezKl3DvYFM4XH8uomUWrce6U+pOw2RHXgACDB6DN
         wMyPid6N+4HOcXz8zhZLdaVRi8sl9BGiGkXCV6b0ZY7npd5vIRHCs5RQermNB33UE9lb
         kjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867121; x=1772471921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cjndx/viWwHPLwXhm0pJTNs0ZpyDgThJGXcIfdXyo2Y=;
        b=I7QbfOKKYPFqSdbVsXRl81st+qvxSFZTR/Lp1GfhOqPDSDN+625JuB3o6r2NFhQIBI
         s+2TkJFAWZcN5tTxsw0SbcD2oO6NKnOncJSq5jW/woNdQQfdF90Ir8MbPYetecTAUGkc
         OJBkN5leQ5sEtV4ELeXc3HxXcrs1x+H+mmULmDv/ajX95dEZ11uXHYVt9BBIUsaaiMaY
         GqQbcly1zSo/ZaS5632appqQ6EuYLgMEN5g/VFpiA5kHGja3EbmVKv6y2YWP5hquRqpk
         36DAJIS0VbKU9ZioyF/sKtJkG4OuPAMhYg/4jUsaeFhxqupgxodXxhMtfKOjWVs2/6IN
         /W6g==
X-Forwarded-Encrypted: i=1; AJvYcCXDg1a09dtfwoj4wAt1c9dEOrzdwgI3QVA3TUJFMVPYJtuyIMIoHXv6ZtETzpm9mtd6JChcYePt0rBBWpQdB550@lists.infradead.org
X-Gm-Message-State: AOJu0YyQVyoodP3YhqHJxsFTqpvhgiLD78QTZdfyctKuHQAYTk/9ngUQ
	L2U9rMK/1d70Xa0GjUKBg8lu3GnKtMHuIjcp1GiSCBO/mB7IJ1VZoh6T
X-Gm-Gg: ATEYQzwdMKALpIBW5ow+NsBD8xUP9890rUaWPM2F5tma5ssjhGz9fcUUSoKhNAr4tmI
	9IwabN1iOAcqBWrCYpeuFqHfg/E5aROEnGUORqtxkAujgA2RQcnDHZpxesF0HBBJQBuX/EjE0v9
	pi7FSNV6MB8TmYKh9Ba6zzG1PUQfn6zNiOljTn9d/ZhD3qzJ/h5f2uUMDzELnwgp5r4WB/FoH23
	/5Jf3z4yz83UKcVBPac84RpGryf6UakWyfrpXuN2PaO7OthBw3skjMvcymyq9lAI2+puf0IUdGd
	a2qz0XJMbCREdl1rRYRrtdroibPuHYX2B6q1V60w4zpY4brWW7BqJiPKu09VdYv5SVyf2GK2A7C
	+cJIxAwitXaT6v4pPzrH4anRJtKhFbca7vJea4p6V6KhY7X0KJ4H3kyBZCfInznpM8sQU5dQeOy
	qo2LlLsS2WQph7Cln9g+8=
X-Received: by 2002:a05:6000:2dca:b0:431:369:e7b with SMTP id ffacd0b85a97d-4396f157e6bmr19371413f8f.18.1771867120734;
        Mon, 23 Feb 2026 09:18:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:40 -0800 (PST)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
	linux-rtc@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Date: Mon, 23 Feb 2026 17:12:48 +0000
Message-ID: <0eaee8c3be8dc848314b2e9aaac9303659fc2a49.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091842_744384_049BBDBF 
X-CRM114-Status: GOOD (  13.86  )
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
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 133 +++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..d0d86ae0f073
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,133 @@
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
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck_vproc {
+				regulator-name = "vproc";
+			};
+
+			mt6392_vsys_reg: buck_vsys {
+				regulator-name = "vsys";
+			};
+
+			mt6392_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+			};
+
+			mt6392_vxo22_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+			};
+
+			mt6392_vaud22_reg: ldo_vaud22 {
+				regulator-name = "vaud22";
+			};
+
+			mt6392_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+			};
+
+			mt6392_vaud28_reg: ldo_vaud28 {
+				regulator-name = "vaud28";
+			};
+
+			mt6392_vadc18_reg: ldo_vadc18 {
+				regulator-name = "vadc18";
+			};
+
+			mt6392_vcn35_reg: ldo_vcn35 {
+				regulator-name = "vcn35";
+			};
+
+			mt6392_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+			};
+
+			mt6392_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6392_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+			};
+
+			mt6392_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+			};
+
+			mt6392_vemc3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc3v3";
+			};
+
+			mt6392_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vgp1";
+			};
+
+			mt6392_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vgp2";
+			};
+
+			mt6392_vcn18_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+			};
+
+			mt6392_vcamaf_reg: ldo_vcamaf {
+				regulator-name = "vcamaf";
+			};
+
+			mt6392_vm_reg: ldo_vm {
+				regulator-name = "vm";
+			};
+
+			mt6392_vio18_reg: ldo_vio18 {
+				regulator-name = "vio18";
+			};
+
+			mt6392_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+			};
+
+			mt6392_vcamio_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+			};
+
+			mt6392_vm25_reg: ldo_vm25 {
+				regulator-name = "vm25";
+			};
+
+			mt6392_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+			};
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc";
+		};
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
+	};
+};
-- 
2.43.0


