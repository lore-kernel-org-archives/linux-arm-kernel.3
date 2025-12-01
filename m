Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B960ED116FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8CAVIC9PpVXkhs180LWF9wfGHiFo2jxUgFjb1PoE2k=; b=GepUElgWkWQsO9H+uT9d9q/H0s
	OAKq8/4bvHH8+hCQNvK6GA3QlM3FK9HUhsTmDGx5sgdaeIkmY/ju1xVhI6cLxoels3VAiRQ9up581
	JPsIw4lJezQ2wwvgbXUt/fYtMp3Z0rvafVy5rL4Ssudz1rf7zSV7j1fhgIcnEovCS94/MmFCg79Qc
	TkE0aP+sAzJrecCchj37nCcbvNLn3C1zrxOk558362ysAo9YR976eti1FzOKybyyhatM+m9bVmDIA
	VNR14tXnfv792zmPiydnRsa4Q+cVXT+coQ/LnSG5TTH/te0zC5yZ0BM5M893s+6Lt1HeDNFu7svAr
	QTK8iOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14K-00000003JbQ-1HKf;
	Mon, 01 Dec 2025 10:23:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14D-00000003JTw-3TeH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1396798f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584616; x=1765189416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8CAVIC9PpVXkhs180LWF9wfGHiFo2jxUgFjb1PoE2k=;
        b=Srh5dbf4IEjTO0bdFHKp59teBb6uPp7pZnyar2RkTTuPf8TFIX/vfqxxBZsu/x6rjU
         /oSOqsis0imrLgf38DXXo688C1Y7EhcajZw5nHQslUHdIz5qPm0SsdwhqXOKA5Cgq8vr
         seCLZtE3BK0HUCLJErgvMIjSpNczCTzGF1vN+ekryv9EZSlbcQ+RJCMFe3Zx63vviN0v
         +KvXvkI57hqeJig8REcCcthLozG4zLpv3hLLKVKRXa+yCxbYsVomFX/WcXsDWqwXTw+w
         zKPbTnVLkCbl/UvdxrI4Ji5UIHkQvd2WRZAOZBas0l4+ifBqKIABx4CjbtI0m5TyyxXF
         KdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584616; x=1765189416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8CAVIC9PpVXkhs180LWF9wfGHiFo2jxUgFjb1PoE2k=;
        b=Oaxn+C22MzY0NsC1u5jEbgHR3GVQ4fo2gSW0ZR5u/xfkDDykPi5T1f031leTk5sJTf
         Hd+JUbnAgqdgrMfa3SsHyg7eJU8RxhgGelO5ks5+81sUM9YsmDFE/p8DJa56noDh/csd
         WAdZHgf8uGJ1vVCACn5GTd6bQtuO4AN1BHo0MdJSwtjLcToBT+eIe7mRuzqY2IfuIRQi
         trUEs1k7UhUUNhbqcn6NKvH97unpLtMd6KsSUox6pd5FFv5tF3gPrT50kBJFKMroTUlo
         uGh0uJEK5Nen+7jHo+oZo9dlotHNHGuDCUlNNdBseeKXqIabkqeogcTcDYf4bESoqvRc
         9Z0w==
X-Forwarded-Encrypted: i=1; AJvYcCWN3HUwkQ/D+N547KghfyCySZvx4cdrArIsI7Prn+PE/WX5KnqTDNjMQrcmiBNbzp4v/dOqqcuxLIA/yAdUXwi8@lists.infradead.org
X-Gm-Message-State: AOJu0YwVeqOYuDQmbdgymfPtGaRaM92+9Ku0GQ3hvlaytd/d55aY+SuE
	vp3xPQYH7jCER7nVIhyxLvRzXKXdV6ihdVZKDlR4clffFQ/P2zCljl8FFoNJ74cv
X-Gm-Gg: ASbGncvMZq9kkCZATppfmCIdA+zNwNmWviRMJrIBs/UFzNoIbPlHvvlEmlMJHaUUWd9
	kHaL8LjJ4Jig2/iqXXy3MQwoslxA5xeNf2al1qFZGqg8Bx0DimySx2usQ8urSCaIEuc0cCGBgjC
	lz3yULeB3sJYkmKhT8fpSBmQRjuhq0IvNYnuHnOoFK4n5gZuL62qDYeHR7cS04oHM/ZxopCya4q
	YOnQZF57Dnx/ihk/DVG6+paU7qqPCNUsgIMvrDvi1Aa/Uvr54UOpUVdGrjKE7pB9MIysQiZoLRz
	quy3A7ooEOOqORdFZSQFJh3KwVSYXlqBa2Ok90cgSsdRZdfED7R2v5rkQspM3e58lIwL5vckm8C
	TJEJBGa2nNuAEU0qOs2MDuVklIGpBnSIFxWN2nCZSp8tT3DhJVQIvDnINBfHOnWw/TJ+gCDngUT
	FvgAoJNFqPgWwuDsHKKugoThsC5g==
X-Google-Smtp-Source: AGHT+IHbpL16Twpni2j6apBZiSSNStuPrewEU95uI80ZbYU8Yegb2CYXK6zD/vMhSPSNv/oBCtUVCw==
X-Received: by 2002:a05:6000:1841:b0:42b:3b4c:f411 with SMTP id ffacd0b85a97d-42e0f344618mr25927721f8f.36.1764584615902;
        Mon, 01 Dec 2025 02:23:35 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:35 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:23:18 +0100
Subject: [PATCH v2 4/4] arm64: dts: mediatek: add device tree for Tungsten
 700 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v2-4-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=2210;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=gXUZR/EGzQDpkyZGOXdSnQda5XyD12I8pKMHU6W6Yfs=;
 b=Xu4taPQtU3Ale0zTeSo5uEpHkgogI0xDEl0D9NiuorsPinPyzqiEGjfYhpOoNRHnmAK37aKhn
 Klt+HeIFOc1DD5VkgV4cizNIw5J5C6RmQv3vMQd4qit+fPQKWQUxFMJ
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022337_927164_431CA892 
X-CRM114-Status: GOOD (  13.90  )
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


