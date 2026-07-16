Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B64C44518
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+owPLS3W62V7LASlKWJAuonWiR0ofRaVkRMdZyo+/Oc=; b=N7mfMDkyyvoANH80iG3wHAcdqW
	PoAUWvdg5Kd+d22Fri+ganji53Wh3veFPUslAXokzcVb1IxAJtIARCisL0eB96dfHL8+is8+528Uw
	bFxMYMnoSVcsznYzBwflOOO7eyK5+zTUDzP7ASDkb+hY6iHbz+M0VtmwrL1ebUnjKWO4oJxKOsHQm
	ZR1QCf5OQxtijcoYh64SIgkrCsZTjmDlQTmjEYdNsZI2imkS39HLMLWN062CRajy0VC2vL0MDca6n
	UJKBlKhVMUS6OOHc003iP3RakQX6xaLe9+nBfalSrFUU/bkEAYtusJZEYo1DVGB1ogfM/MVQHX4E3
	oNjzKBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3M-00000000Pvt-2tOW;
	Thu, 16 Jul 2026 18:43:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3I-00000000Psq-0Zcy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 18:43:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so47904335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227398; x=1784832198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+owPLS3W62V7LASlKWJAuonWiR0ofRaVkRMdZyo+/Oc=;
        b=QfOYuzp6GsrIcaGgFcWIDthYWnMG4X66AZA2hpj9ygOcVDpahBHyf6e0mXJUFoy4yV
         Ycn319WR+zTw9dnKYBPn6D5OghyO8IA3RQ4yk/+EtBOzbeIX0yZadEG0t7oo2b8bbBag
         8d0vZYF7jsA1OcYAcwdmd1oy5faAr7o7A7MpPuhF4q2KOK0sOY0me4woK9Ghmxrs+TUX
         svaGTgdNFBkm0w/BW7l1zYATjjHp63PGOSy2TgNDrt/QydluhHnHo4x8uVO4LgW/sBSY
         qE86qc/q471eAMmI8dEATgdRfyLkwHMYtEOl1B5E98VQOzZybBZuNkzjANFZF74y5ygO
         0siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227398; x=1784832198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+owPLS3W62V7LASlKWJAuonWiR0ofRaVkRMdZyo+/Oc=;
        b=iAIeCIGWbQkstocbNA814H/SPkouLb2yGIPGEShiKPwTvzwwFQmAfM+ytwNuQ5IFK7
         Cq7g8zwNEnOmTzV6yOkZzakfexx1V0imrAba0x8JL9CzrDZISJn62wQTmuNuHKoHy43w
         MtSDMjEmHL2L0/1k6m8xVXnMo1ep4JpZiwgRqlqpihG1SoHmHKTecA0XG5BffvN3SRNs
         RnsEo5SHeW2o91OR2tZc8mzRbJa/3sRR4ph0HQz9haghFIxdcSvV2DxrjRnDZ+4w/bR+
         s7JhWcd1CgJ1lnBS5C85bLBnOFLtjFwJOdUfoeyjXTta2R6iE8Rv6lN6c2icsUaomESb
         P2KA==
X-Forwarded-Encrypted: i=1; AHgh+RoU1R1Zq5NMHQFCEaP+DZPTGyei0l8o6wjJqhQVLz4SjQe+pNhJVEYvhoVY2lgnjSwugNUCwvjn6g/TQY2QBBQi@lists.infradead.org
X-Gm-Message-State: AOJu0YzKV2Q21YCuigwwS9JASRlbqLWTRaq0P6lNq9plI+uWzaAy+gSN
	TPtKWzAHaUYw6yRYFKANbi8A9uxWO0ByHERr7EcVLxUKBfbBt6JgyGzg
X-Gm-Gg: AfdE7ckVu+ezRggeL6LikIabtzUzw/mbCh/iEzw/EH1qlEb6NIvTcg4UU6zNDxpWt01
	lzMNwvqL1hp6j5MQx2U1zwK6m4s7Rq0MmICxCfGEUgQbAhDbyGHxLmEmby3SwXlOqZ6CoUx9sA3
	2zP9Xqhg6OeLljjmVhXpJlLiVXQJV2WM+l4Ev1nf84b6yvBkVy2i4aPPxx+O3QhqbJZUacBt3px
	f9kfN7pe5CnpKcD9/rbbg/4gw5jniExfNY3rjXUGYMd0HN1vplSdi6M6vHxARFAzMClfGoDIIvj
	d0iwCVrJ4rCKAwsOjT8vk6Q5qNjHpCWQSEDARG7Cj5pDRPhglQflvvnUxnWdWgVcnA3Azg+H+x7
	mCB8ZIdJUSFxUx16o6sMT5a1tWLgBwMUwQxv64EQx7xgwu4AZqCeFgFFK8VQ12fqM0DLysg==
X-Received: by 2002:a05:600c:4614:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-49538999453mr94144035e9.14.1784227398284;
        Thu, 16 Jul 2026 11:43:18 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:17 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overlay
Date: Thu, 16 Jul 2026 19:43:02 +0100
Message-ID: <20260716184300.85413-8-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114320_238475_B3943415 
X-CRM114-Status: GOOD (  12.10  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Verdin AM62 and AM62P both expose mcu_uart0 as Verdin UART_4, and the
reservation needed when this UART is used by the MCU firmware is
identical on both SoMs.

Rename the AM625-specific overlay added in commit ca61bcec3e8a ("arm64:
dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F") to a common
k3-am62x-verdin overlay and use it for both AM625 and AM62P5 Verdin
combined DTBs. This avoids carrying identical SoC-specific overlays for
each remoteproc firmware/peripheral combination.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                          | 9 +++++++--
 ...din-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} (69%)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8541e43d24b7..874577298d6c 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -48,7 +48,6 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -98,6 +97,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
 
+# Common overlays for Verdin AM62 and AM62P family of boards
+dtb-$(CONFIG_ARCH_K3) += k3-am62x-verdin-uart4-mcu.dtbo
+
 # Boards with AM64x SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg0.dtbo
@@ -248,7 +250,7 @@ k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
-	k3-am625-verdin-uart4-mcu.dtbo
+	k3-am62x-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -283,6 +285,8 @@ k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-ov5640-24mhz.dtbo
 k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-ov5640.dtbo
+k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62x-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -384,6 +388,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
+	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
similarity index 69%
rename from arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
rename to arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
index e263809cdf74..a3b50efbe52b 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-verdin-uart4-mcu.dtso
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) Toradex
  *
- * Verdin AM62 Cortex-M4F debug UART
+ * Verdin AM62 and AM62P UART_4 reserved for the MCU co-processor
  */
 
 /dts-v1/;
-- 
2.54.0


