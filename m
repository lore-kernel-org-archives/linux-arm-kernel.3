Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB6ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jQ8I6G5OSQI9Zc1AI/cbg9J6IIMEuuRXgGgav8SlWE=; b=gwcamFGsnosMyCeJfioZmk4p2A
	dj0NkWo42ckervD9jyravQ++jtY6CHwx6/fkRhDqz0iFSc9xKdZL+muXcb7qHeYjYrzaZMN7OUECD
	hs7BMVlxBAAcUgI3Acwmdd1S21PD/oZpsb6Lztbz66JssEYVXKCyXCaVVJy7rSIxJtRd1RJcvWipV
	mxmu9Oa6E4hH4zYIsmP15/OCTQVZUTbRkIRgFpBklNocTQ2Cvz8psc8fr2SKgZyNpeBa5aK/tbnHz
	ssR7gM9PNII/mtPO+EhLz+ZpO4pof8gPPm3naIK7wgxfX+Y9al/XsCuvSSzdm+sOf3TXAm0EhEw3n
	yzZgIJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs7-0000000D9uf-13KZ;
	Tue, 02 Jun 2026 14:13:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs3-0000000D9sh-3oiY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:13:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso103682305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409610; x=1781014410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jQ8I6G5OSQI9Zc1AI/cbg9J6IIMEuuRXgGgav8SlWE=;
        b=L/5Pngx/LTgSXf8Up9V/D79EBr2J0OSxrUszE8BUkXA8gE+wcXjpdtFI48tF3d+b2P
         ttmOrZgFVzIV9IZquKG63/YY0GC9SSLKCcMG4cv1TEA5KWpLIUuh+brHJ7R6KdW9Zq+r
         OxgIK5VzzsMy9fmaRe+JPN9SSw91UHvQ3Rfp1BxxlLO2Z73+QEk7ePuCtECxU8TX50jd
         YyFAGyOWhu1V1agRoLn82V1nrnBIMqhj2+wgakEKYcImgKb36jkqryrGLKfTV12GCha9
         mtjIw1UWmehJLfYYEn6dFwzcEQckdsVN8dGAXkqXlfaL3XDFq5ZG46jeMkLYRUpBs8M3
         AQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409610; x=1781014410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jQ8I6G5OSQI9Zc1AI/cbg9J6IIMEuuRXgGgav8SlWE=;
        b=VzwrlbbfMQy2CyFDkI+SUMM+Dedkvlkdmu5hNt4KF8W4QWHx6NbT18VVNV25ovbXv0
         LBYJFkeazUV3nl+JRyjUZnug/xqRiVDHwDTa7D9Flf4+9jltelH0jGPmaZd4UvfyBIIe
         RhUSiCBtK6a0nsRLL3oyglQR0r0zeO+M9k2D23kOJXg4TirupZ3bcKk0ft/09jnBNiic
         bYKP2J6uQWqhrjn4ntw8oZktYkwROUPUMeGYte+0PlfpOjS4o1eocKGbKHUO6sclA2zH
         v8EXce5Txhk5604X8PCnvOoQIRs7oeLUugxOAyWGOD0q/DTXKNP4X7+lFAWJ6Cevda6t
         1H9w==
X-Forwarded-Encrypted: i=1; AFNElJ/0/GO8f3Gm6O1evG3lbkf6V+0/rYL5RCD7kfbwwcQbP9uLLXHoXzQN/OQZCSJpJRdUz4k0cT281+UFdzCNywIX@lists.infradead.org
X-Gm-Message-State: AOJu0YzVg1fphbxhvbE+b5nLRUXLRuyUXBGixyZUPbhmjztE974Y4Uvs
	87jP8ZdwatnU0Oq6C6pDMDzuIBlNiGmtLxh2az4duirhXsgca6x3xYYu
X-Gm-Gg: Acq92OFFdu6MCQMJ/rD/XIFs4BxpBOkSVjQyHyUQcenJTKcOTHUeZgI7y8k/7hef4bz
	ZtS3bF/5tI+Dnc3b+AG9Fc2mH7BDucF33OorbEOLTnd4QhOeot1lNgABqxQltTvTrYBj60EsF23
	18pVnL60/Bm66miAcXhC3qkKcD4QbtCAiFAfHtY/DRHdn5iy9t/wCA3H5gTi9UKVFvtFM26aeP2
	Qlqut6MaP3dC4Cthpi3qJW2PBaBEPvSpRpm+DyufT8cHmZPLV8oM2ZmU12aaQ+6kECSTiMc6dGm
	976AKw2D+MUjUV3ngP5i6z4QMKx87J35K6RPXYeutx8W5A/nq+PCuhMoD7KwOGf6WoDuSEwef4R
	FMseOSJGzwK2nKNIMvCpFve1045R5lp7GP2RFnPSM7E6extfZnPXtj8xTLgmLfP1xB2kYuDBj1K
	sCuUHLdFT0ZyaCkOrDtRx0iyoJ6ntdcnYeU405
X-Received: by 2002:a05:600c:c4a5:b0:490:b432:6f1e with SMTP id 5b1f17b1804b1-490b4327145mr19699815e9.33.1780409609821;
        Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for Cortex-R5F
Date: Tue,  2 Jun 2026 15:13:12 +0100
Message-ID: <20260602141311.1366818-7-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071332_013411_19701396 
X-CRM114-Status: GOOD (  14.04  )
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

Add a device tree overlay reserving AM62P MCU_UART0 (Verdin UART_4) for
use by the Cortex-R5F co-processor.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso     | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f2db3c878993..27a56abb1d7f 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
@@ -277,6 +278,8 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -376,6 +379,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..ad5d6a5c17c4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62P Cortex-R5F UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0


