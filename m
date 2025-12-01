Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E50D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Th9QIGTGx5TubvrIKd4rYbZwHElm6Jjolg9pSmpCDxM=; b=dXAJleUS2Pq8RXCMf5bFQfNZZ1
	PPGaE5LMwBPY/bskqOx1xaCQWaJSVFiW4an8LP23lzPNIjlQaOsFgZbYh/kAB9WEHAj+SfHP7p7vy
	02CAA8oa5OnzCUWeD9rjS+0dUpkLJwFxo1rQQQo0vBQ9t3IQTd2qB0tk1/8+fdS67wkx+MveZXUFk
	gPxf3jIAbYpbenpxsfJ4HJ7vsbe80GRSWyBv9gLYJdc9nOjAZqW20JSGTZyZuL1H9oDVcaFRDaju0
	eat2MKIcAlV+hDO2fyYWl5E9BM9qfOeEKKcClJdN7cBJnNuDLOahEdFRhb58pHJPxpz2p/Z6rVHo9
	YQMkOmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3AG-00000003ZBB-0bel;
	Mon, 01 Dec 2025 12:38:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3AD-00000003Z9t-1o2b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:37:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so29066555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 04:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764592675; x=1765197475; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Th9QIGTGx5TubvrIKd4rYbZwHElm6Jjolg9pSmpCDxM=;
        b=NXKXUm4vG9zcp/h8sptRgvBQpmXkSInXWp50TVSxgsFDmY3UDqNgAK72e8xWyF0DWK
         w+5b35/+yH87qH2SASROF8YW7hpFu6Shj25kWhiRjZftk1OiY/vQeFczqzU7p3N+kGUB
         q1edVLmEn71BpMHMUwrmOhyMTrTIlhf/NI+SjIknyH76/sooczfs7GbCGoZTJ9r6XBVZ
         dvcINEzmbX2NFkYE5ErAanJ9XowK3wjps/SMBDjjROHefQXW8Gcut3+5BL05/8HB7a8D
         kxxI2QqWY7H5jiWCvlSnw/caViGIWMhwA6bV8ecKuT9FsDvCcTzvHJtC9XNZ9BBsz7pZ
         N7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592675; x=1765197475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th9QIGTGx5TubvrIKd4rYbZwHElm6Jjolg9pSmpCDxM=;
        b=Zqvu2O4pyTy86f4I4vHCG/t7nMoBZQkKjlrt99pDNyaldvJzK3uGC9STAtBgyhnRF3
         gEpgy4yb7vnK2QvJIdiuMWaiMKjbUZ7FCHNhwgRfcqldBztlDO7A7cyfJeO/VgMovmKR
         clmDDdYgLE43ODAUcmyNOJMWUymN1Lnu7l+ljtmoh6SHY8/JvjRLWANT9JMUITQOsKUC
         sK6+5xk2jU7ZBbDdE8nzcLwqbndwW1MuRSkgdT/YBYI1cJKHwxSHUK9TnHaVVokOXkdf
         q/iMTIrxDqSuM+NCdxrF0K0oZl3P8uZZp6wa6XRqciigPtRxWnkQFngrgPATtAAMgVjU
         UrOg==
X-Forwarded-Encrypted: i=1; AJvYcCUlWi9UWANihvm3biN4C1AvFkXpDSH/3xmrA22NPFL7d7FlFllDwdB+yJqqUTTDx6sNBr4NkHDZilJUV9Qaocy8@lists.infradead.org
X-Gm-Message-State: AOJu0YxErxvZ9zBZTfD0mCrG37EgvRUpPOMP3AlnB4eFfqH0PfZulQCR
	on28mAUGDjoO0Uh8Hp9QLBkmU90i3b6w0IcZz2hwOvUVG5XMTZHm2n6IFwJg9DX8+cM=
X-Gm-Gg: ASbGncuRS/l9KLYrbOKWM9nLP9WGUkThBqIxjTZnt3rUPlhj6RqxZzsb6IHsh6EiwxH
	Mkv1tdN7Ysy/0fdqNdCoNLOqy1+tRDaKLS0Xa/rhmucm+v4OY6p88+VCUEipDeTg8OW1kdwLGMQ
	AqF62dUMJ8IuKbhgrWZPGbTuPDN82hOFDUT7weR99YyailMacWPboxOrMeXX94ub5wNasAI4CpH
	TtXRVFU7DbGksxZHQnCIWaLp4VlXmseHMEpWKVvkm8ZpbAAFByYkVuQtbXT9yY+OnHoZ9Ogka6j
	sfOgF+iGNg+67tzI687oBbu6lz3EgQlfVok9Gv2OaBoNRewanl7fEvti+7CvhigzImHLl9ocdjo
	C6sd+DISW5OYGsVBU7Vgd6iQEwSUO3LI4IOrhEMLvLmUasDglhiSvj6nyIKja43mPeeq/htmcrv
	+iRh7d/WZu69fDm+F9l83ZHmWKV3rZjAsCOxdsErBmVXtUr8rJrHp0CBpgPU2QCDrOp55LJ8IBQ
	g==
X-Google-Smtp-Source: AGHT+IHuS7ih0/r1wtiTtCRYhrtbZkOYclnmpf83ik6Tv1jMFCB/iqtIuG69FulsayoBVRSfhmATZA==
X-Received: by 2002:a05:600c:198e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-477c1133927mr378893455e9.32.1764592675414;
        Mon, 01 Dec 2025 04:37:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-92-99-175-128.alshamil.net.ae. [92.99.175.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cac4fd7sm26232131f8f.42.2025.12.01.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:37:54 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 01 Dec 2025 16:37:54 +0400
Subject: [PATCH] arm64: dts: rockchip: Add overlay for the PCIe slot on
 RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-evb1-pcie1-v1-1-c62bba5c1167@gmail.com>
X-B4-Tracking: v=1; b=H4sIACGMLWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3dSyJEPdguTMVEPdxJRUYwvLRJMUU0sDJaCGgqLUtMwKsGHRsbW
 1AFzmF8ZcAAAA
X-Change-ID: 20251128-evb1-pcie1-ade389a4d590
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2800; i=alchark@gmail.com;
 h=from:subject:message-id; bh=3Vvq8LPwxXKHOKoZ+a6kHlkt56selPRWjocT3g952Go=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTq9qjM+691ivHks9cl6irvd3S+X5b8yzb0c/Wbn8kXV
 J+fCNi0t6OUhUGMi0FWTJFl7rcltlON+Gbt8vD4CjOHlQlkCAMXpwBMZIEsw1+5Xs2myvIjZp5G
 Zg+Mzn3R+X2u4btNSYuWg5DLtMXMx2cxMjzIdo88aLhfr3Zr9D1l2f+H4948v7/RWLmP55WDrXb
 xOUYA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_043757_493197_FDBDE3C7 
X-CRM114-Status: GOOD (  16.20  )
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

Rockchip RK3576 EVB1 has an onboard PCIe slot (PCIe 2.1, x4 mechanically,
x1 electrically), but it shares pins and PHY with the only USB3 Type-A
port.

There is a physical switch next to the slot to transfer respective pins
connection from the USB3 port to the PCIe slot, but apart from flipping
the switch one must also disable the USB3 host controller to prevent it
from claiming the PHY before the PCIe slot can become usable.

Add an overlay to disable the USB3 host port and instead enable the
PCIe slot, along with its pin configs. The physical switch must still be
flipped to the "ON - PCIe1" position for this to work.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  4 +++
 .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   | 31 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..63198a618a2b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -252,6 +252,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
 rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
 	rk3576-armsom-sige5-v1.2-wifibt.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
+rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
+	rk3576-evb1-v10-pcie1.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso
new file mode 100644
index 000000000000..dccf4a5debdb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to enable the onboard PCIe x1 slot, which shares pins and the PHY
+ * with the USB3 host port.
+ * To use the PCIe slot, apply this overlay and flip the Dial_Switch_1 right
+ * next to the PCIe slot to low state (labeled "ON - PCIe1"). USB3 host port
+ * will be unusable (not even in 2.0 mode)
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&pcie1 {
+	pinctrl-0 = <&pcie1m0_pins &pcie1_rst>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pinctrl {
+	pcie1 {
+		pcie1_rst: pcie1-rst {
+			rockchip,pins = <4 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	status = "disabled";
+};

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251128-evb1-pcie1-ade389a4d590

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


