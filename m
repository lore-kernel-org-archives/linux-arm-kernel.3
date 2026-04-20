Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74900F5A8C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=; b=fZS7+fvDRoOBITFvoKJrBMjZ1P
	ZGEKe+04oCi/zJ0D9xYaLTtEXI8R8Ot/nj/aPgulK1XgZgetsaj1ZNXMYZRBrGJTvGqZB671Cyg6p
	X3eHJ4ibms5kryIP/uYHS86sB8w1TtnmcyxmvWZE7QNuEx2d6tudutWC9bn0KSRQ0PN+AbGYjoZMQ
	WdqjwBBhTgFH/1q+9Su1vSHid0gCwcsHbaJJ61SAvKi9tYK2l8m802JI3nr2kpgMsAJInkpombzpR
	L/RNEsxTORE79YLFbTd5Y3Xd/IkGaCWZu37ubFJtFIBDHGnbdOpB0yMOCsyg39taj945sSpvOMF4V
	3whPv1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwLi-00000007kls-2y90;
	Mon, 20 Apr 2026 21:40:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwLg-00000007kki-2hF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:40:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891b0786beso14018535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721207; x=1777326007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=CiZ5mpr3OC6hQwBuhi4OAMuF1PTWMumgazKJWSqRcFOyfto80ZiqsZ+isF8ROGzK8+
         ocKizVKKIbyzFAY1xVaLJD3EcJiomaGhl7ddaPjcHvJlab3Cad2WahvUUI88nWQjD6oS
         J+hb972lHQU2xk92yL/6xfp7cX1rAMwQHhbiIU2TSZ+0E70p812BVgb9dB/X/Z3F4Yju
         tGpMLuYGLc/7HRihdvjDJD3QeDmQPe/4i1fr9gy7UhS0LDUG0plDoR/3MCpzH0LQIYkj
         L/fQBLYk9xpncfI+K4F6XETfwk1VbAouDhWY/jeAwj3+hdEjGWAILoS7lzm6IGzzV+5h
         YP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721207; x=1777326007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=BQ03G0MFajmaMdzYlu3tnwIiM6HbRcSV8RrS5Xf8tEUFIpJL+p8kVESAgmIfce06dM
         ZWhYhCoDn/tIdG8zVjq72dl9Itp/ITccQdN0WcNshsafOeUr8ugdBGemJKzqFGFDdW54
         bIOihkUZ8xN42b6nfI6+qaH68mbFicy+X7kBOD553V/R3EjhDNkki+cHSWQFxvvhjRah
         s/aZWSS3VjPYJL4hyJq5temr8iEIf+bLjMMYe/yOd0a0UsiaaB6++iBrW8HZQcS6xCfL
         /9OaB7derC7UE8/9AWICmoVjPXIfodcqnqJemaGc1Lpq7xlojdAGZDp87oArCKvKTnxQ
         Qrqg==
X-Forwarded-Encrypted: i=1; AFNElJ8hXi6dxm4A4gmFWxPZnORMI0BXdVL/hgpgCbCMIKhq3x788aQWVirQ7I5K7GB9HSYOyK8CtcRbVvUe3iA32+fe@lists.infradead.org
X-Gm-Message-State: AOJu0Yym5weMj+D2ym130DXmoMGsvxcIQr7dsCQcFxFtKdPkNY7KTkh/
	kA1UomG9Q/r8k60dtSKwz3BySx9AO+3KqsYapBJkWxCBREnS5ac1sasd
X-Gm-Gg: AeBDiev+gRDh6+QILioyxX9mybRmcm3FqsP3vT4Dm6/kcIX6OnnoJ/TyskbhyVhoGVs
	3gQ/KO87xkOA4lI98MB3PaHJXcbgXwxSlMM9aajYUHziu/H1lU4a6Z5h8AxMicx26Yn/BtdDIPB
	KnaleDsR1kgqBTPzWxvQt81ePqx0FBjyzOo4ukU4OYTab0/x91INMNV8ysI47MdZHfezcHggYSd
	ubNBj0yvbWwZUaYhmN+DGY8ltL4hPRaURSvzG0dtqXB35LYCs3b5T8ITWVtPp06R9Ljv/nzsNdD
	0PsFcODKbLIryiUqQiL66YG+0e5EAFuvUM897fYR0jA38u79e9L7KtwyGOkj1SRFK8B5BsbuQy2
	kvDWAEqCYRikPgQJzCw0fFeXyxRxd+pl+qiVlyI8JDy00KdAnuyNWoyOcmP2meGHiiN4WbbXQWz
	gTod6TF+B472YW26DVmKth9VXW8Ka0qg==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr105875175e9.8.1776721206634;
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:40:06 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 20 Apr 2026 22:30:08 +0100
Message-ID: <20260420213529.1645560-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_144008_703613_77EECD50 
X-CRM114-Status: GOOD (  15.06  )
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


