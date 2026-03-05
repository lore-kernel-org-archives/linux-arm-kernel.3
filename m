Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01519F47CB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQKhQUi+swdzg9il66n4f9gaOL84j82V5dgnOB/FgF4=; b=hbXsTnYGfvA1astCzyboYS/loC
	BxuJlS6ZZlgB2YbhrvKTw8TxJ/LFSj1bF5aoiUAC6LZZ9Vb48kIgOdI0qs1oFqUGIX2Y34b7p4uM/
	7DLlzg6Hz0TFuhDNJKdHzKDJBZ/At2qgS5gOmw0P7BF3DaJ0wV1Ceyt37bYATv8f8PKu9ocHlohh7
	pOHMg2COvVpH/KLBEO+uPEfaIIg0Md352e/M8Rr3LPG4+d0MPQSwbKvIy+G+wI5QhsYc8ML3r9V1j
	yG0uh+BHLpj1OZdSmRFVrAbp4U4Xthmfh7tDTN8vZGdHn5VpmHsF4deDb08C1ECEG3yZ236GfTSq9
	DnCD+iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnd-00000002Plw-1dEI;
	Thu, 05 Mar 2026 18:51:53 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDna-00000002Pip-0XEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:51:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2983819a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772736709; x=1773341509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQKhQUi+swdzg9il66n4f9gaOL84j82V5dgnOB/FgF4=;
        b=K+ZwiJSySEk+P1IL7lsxhW4KvGMP9LbFddsW3PWMfXJ1+wG4Fn0bV9J915883lOMqd
         wLDRggxsFTlOgEIfdunQtE7Vb1mBfl1xC6dVP+vO8h17kPAjjnBeGIkiuyCE7vvXWKf9
         s4ivofL492rX/yYx0fUe9S6Ly9ZqxAxw5K4MuznhrlnOgqdBmJIh98qbDTPa3d0fAkV2
         ErUCSnlkvikCS0u0kIlK7VrlAEZTRjak106pzZgpOppISOnyvw5LHMLalOY33JeKwM1a
         Xx3/nN1F7wuHr/RlzIAYa1dTAuBZIKBKhHaU//ih7GyDel3UJMzyVVooMYrV39odNoG1
         +D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736709; x=1773341509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQKhQUi+swdzg9il66n4f9gaOL84j82V5dgnOB/FgF4=;
        b=s1wJTgEX4RG6yltEmxZ8h5r9UK1rZ2+gm1Eg0Gse3YOsXGnHG0cRo/KCJzFZkaqMBp
         EzW4IUTXfDuuVytyBWPiz/DsGzzblCoV78+Bh7R4eQeNUN8PDyCWiVcRrp7P1pOHZD/D
         3lmB4zBLFDirT5dy6Fzq/48G+ifo54y8a0FqTqa5RT7bDENHRbQKjh1UfiuBIOVBFuFg
         nsNp2SbM/ZL9w9I74UQWmY7XwhAQe4V6wjXvLMrEUqYTtlvf//o+14BecG4PR30ZD4By
         iUZss0oqTKKcotEnjP98pnwc8U0xKCjUAZVDyf/uz6AX3W84gsXDb4SG1WnxX8VYu36B
         kkCw==
X-Forwarded-Encrypted: i=1; AJvYcCVY7usj9NqxXR1tVslfEHa6rlw8kyCpB+jU3aJ2Gh+Jxc668S3eOKEskCXtub/nFfA4vWOz2omFdiIj1M6pjhsw@lists.infradead.org
X-Gm-Message-State: AOJu0YxTtRT4MT+5ONWXV/XuGiypblPnVLSLzA7LuChdByFFFrXuDb2d
	xYTLuUaSdjR7rjUbrbtyYsZ+6m16dDUugQaSsGux0hgjCS7zaueetS2/
X-Gm-Gg: ATEYQzzNuHS4+h7GzHyef+/JYAG9vGZKy+mJXKxYRJGXAgsERWaiWh3MvQp5KDbHd/k
	GJg+sBODs2gtw6QN6HndjdDp7kII5fE6gEbP2JZOaE6+9OXk50eCSJoZ6KXLqMR9fgUdTGOIiym
	lOuH57AD5cQ5yV+a/nt/zRl6/yA3+i4iy33+oAeEsSSSoa9zwgSlguTIu05pRulUmsk5xD3y/20
	D1X4teDgcTe/Ok+pG80SlyG14+WwCi5XeBm30Tr8YaP5vz2ICMzH1zI46OEtLn/sl1F7/tY5Nx3
	zyKgR+SLwU9Qx+kbPbhUgvsiekrSVwecA05YDLByowKWTztD2dU9Sk02IsN15KkM5N4wuIpDUIp
	LaI4iP1ruguf5jkYy2tmu8/RhXjWv1viws+cCAzvzRPmNWL2nybdO/z/wBr5MWZk2l3KoqXDWiN
	B00cnnpi090O3uZXkdP1Ipa6AMI4dNKbHYXsLWwp6ZzO+PxMtyIE6gDuQcO3ygkS1m1DukAPXxo
	KVVMjV6G8JP9Fmr9g==
X-Received: by 2002:a17:90b:2f8b:b0:356:4c1f:98d4 with SMTP id 98e67ed59e1d1-359bb3ae591mr494840a91.13.1772736709067;
        Thu, 05 Mar 2026 10:51:49 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2769158a91.17.2026.03.05.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:51:48 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 2/2] arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F
Date: Fri,  6 Mar 2026 03:51:16 +0900
Message-ID: <20260305185116.781184-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305185116.781184-1-akkun11.open@gmail.com>
References: <20260305185116.781184-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_105150_169502_A9C49DFF 
X-CRM114-Status: GOOD (  16.27  )
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

Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet which belongs
to the "blade" product family. It is powered by MT8125 SoC,
which is the tablet version of MediaTek MT6589, and has 1GB RAM.

Like other devices in the "blade" family, it uses a framebuffer
initialized by the bootloader at a consistent memory address and size.
This patch adds basic support including UART and simple-framebuffer.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 ++++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 37 +++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index 37c4cded0eae..b67b94b7cbd0 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
 	mt6589-fairphone-fp1.dtb \
+	mt6589-lenovo-b8000-f.dtb \
 	mt6592-evb.dtb \
 	mt7623a-rfb-emmc.dtb \
 	mt7623a-rfb-nand.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
new file mode 100644
index 000000000000..47bb6ab1fe72
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+#include "mt6589-lenovo-blade.dtsi"
+
+/ {
+	model = "Lenovo YOGA Tablet 10 (Wi-Fi)";
+	compatible = "lenovo,b8000-f", "mediatek,mt6589";
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
new file mode 100644
index 000000000000..3a6e0d8c8a64
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+/dts-v1/;
+#include "mt6589.dtsi"
+
+/ {
+	chosen {
+		framebuffer0: framebuffer@bf600000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <1280>;
+			height = <800>;
+			stride = <(1280 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges;
+
+		framebuffer_reserved: memory@bf600000{
+			reg = <0xbf600000 0xa00000>;
+			no-map;
+		};
+	};
+};
-- 
2.52.0


