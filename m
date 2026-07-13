Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT6625sxT9u6/pwIDim1PTSaGmJ3x8vyuHF6KsxdV78=; b=alVzYOqI8XXQCTxQmUO4IjWtDa
	H95iOC9QJK39IfsDH9Ai15mKR63g84MbVIUb4jsOL+KudTwcXjRzDtmCb/cF4q0YJjPClrxzPIyf6
	9kxmXbx6GXE+vRZNx9u3hQssBYBy66sZNGhLtS6He/dylNSdEMPQ8TdexdvugQKxoDCAgpb8L+GSC
	uAZKRkVJSPXSxeMk3WQzTtZApjkgf1+btgiGci8z5SiwRNid/HvEGIe+NMgYmfa5n5EZt55J4o+Bm
	C4jrGJGXFybpny3lf7ud9xIYISKPJFbnd9/5p4fI+RiXRcCAWJp3AmGqL+BbaMMOu6H0an2iRI5MS
	dlkMxaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOX-00000008wdu-3LqO;
	Mon, 13 Jul 2026 11:00:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOV-00000008wcH-0o99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1666315b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940414; x=1784545214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dT6625sxT9u6/pwIDim1PTSaGmJ3x8vyuHF6KsxdV78=;
        b=GARxjoV+5/sUv4M2INJtPUbBpp2MD1aQ8x8norevA/TgJ2I4RTxgphYojswdGG7mfM
         olO+/Pac084wLN9s2ejsgF/v5UYO4j9o6mUm7IFWNS82W9oc6/awgROj5zVsK5YVRK3s
         HatsTUc0Qeu5YVPmlw17/WIntLAnHzaIn9hGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940414; x=1784545214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dT6625sxT9u6/pwIDim1PTSaGmJ3x8vyuHF6KsxdV78=;
        b=XC36F88E3vtuTq51bEpRmYnFniS4PFi/+uNg6TE+YlkWrOclzfdqqJO+ZMa20Mox2Y
         TIJIBIMabKxQiMxZq2vi6eI90+jXf2QsDqWhk26KKZ9nma8fkZBwJy+drZmwIY+d/tNZ
         hV+lfyRBNEaxSqGDBx4+qmXt8cnnVUa0Ac39EBzCXLKc5Z5G5sMpcgaAF4Pq0FysXvMw
         UDZornxPdH+ZQK5wzVSCjARCav+vMLCdH9HLIWO+fhUkBfgemQpnNYGEtGGFlybYcb3u
         zr2mPabQ768dlPnmbrVvHvlOxinJ+stMYKF+e9nyBAReAW+J1+icV/2ZMmCJrdSq/xJQ
         XxfQ==
X-Gm-Message-State: AOJu0YzPd6e6U+qqp++ZE4dgz7hwHzYmfeyqdbECnau/ZCpkBJmdrFoP
	zhpiOFQ3aYVpTkx5uqWo5Fo8FgiWKvsgabab7vp8BR2tR29hpidrfmwRG5H2XauisYod6wpiPe3
	fHHtq
X-Gm-Gg: AfdE7cmjmoirvncLLt5y4PGsTgzEoBiPgqfdBYn9cg0qOYIZpAl7IqQgXEhv7zVfdJs
	vTaADixcWPijFDEVzex7NSd5RErVGi3n0D+6Whi0TLjRV8GA/6q1mV8tCjhs5Pe8p1CiAHHazA8
	nVA2jFgJ9p8qr9STZS2F/6FRHYLQInQ9UKVlWFSxiW/JrvrwNVAVI9pvoqm6x4NquxTW3TuxBJp
	/z42OLmZD02PTgLbqYsdQINdXpRBvQRLWA5PTbCcbvtvPEtkN3NaMkCwpMHU0kQMsvHXUoXTJEe
	tih3tfnwmeTQtqDDjThQjCmIsQWKl67TSRKeZ2ocUiWo/4MEc6kbO0e9D1ACSfXTLYbALuD8JaH
	z4bouT/79RTGQayECgDk5Vv6e6AaMHXWZw/9eNyFyb2ny4u0qr4O42wyAa7Wq23rJYyUy6OCnUV
	XHHLPeIDoejUqcE86TxF5x//FNvCCK5v/WFmkb
X-Received: by 2002:a05:6a00:1f0c:b0:848:68d7:c673 with SMTP id d2e1a72fcca58-8488987231emr7672953b3a.47.1783940414281;
        Mon, 13 Jul 2026 04:00:14 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:13 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/8] ARM: dts: mstar: unitv2: Wire up LEDs
Date: Mon, 13 Jul 2026 19:59:43 +0900
Message-ID: <20260713105950.1346962-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040015_237214_1A7880A2 
X-CRM114-Status: GOOD (  10.74  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add the red and white leds present on the unitv2.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index a81684002e45..f02de5b475af 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -7,6 +7,9 @@
 /dts-v1/;
 #include "mstar-infinity2m-ssd202d.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
 / {
 	model = "UnitV2";
 	compatible = "m5stack,unitv2", "mstar,infinity2m";
@@ -18,6 +21,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "cpu";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpio SSD20XD_GPIO_GPIO1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pm_uart {
-- 
2.53.0


