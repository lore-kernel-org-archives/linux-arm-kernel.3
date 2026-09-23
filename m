Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81086C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=; b=woHSjDLR548Ubcym+JMWs8TuXk
	ad+XQr0VMMehD1WL5yy1OqJEQ4jW6U8KxM3QDj8D1BuXhT2optoIpoAEJuOZ7vIhseMKeovLW3eh7
	rMMPcI3skH3IHOJ8g3XScn4YgVxuU4XFp/qWXBjtnkfYb6+p9oR3RFvam3NUFtaeH4p3WgdMOqjmk
	/QKq1HPehNAyjDHaJrj5M91rU2WwMcvxvGGZraFz3DMZD0G701YX7bZAeJzYxHsYEQ9senJqVLeB3
	gQqU6pJCAJtCZe4y3wGNgfHCs/1ZffAjo6DhbgPCpOXqRcQm8tmJcG4uqF6TT6b+URlTKUQ8J+bm8
	Duwn84Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpE-00000007zyn-37Bd;
	Wed, 23 Sep 2026 11:07:44 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KpC-00000007zxg-2mv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:07:44 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso779942e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161660; x=1790766460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=FP/Q2nj8s4RMql0EGRuqmendQ3z6MuuoZg6FvuWJpZyid8j8GAjjLa1Sx+sdubO9gO
         0WxMX6NXW8iVdjJvh4wWMJz/rZM72gJ9gP0JOgYjzRCPT0Z039TsQL/gEa1t6sRFpdQG
         jwjCpwt+0kG6h9vuKqTzvbL6hBG06WRcrDIDDWm21DIrHiCBTinNh1poA840yKi+VjLL
         OjJUfUmKpUFh9+IFF7gqPg/z59lQ/YCvQ5AqQglcDHMhtLBO7W4hT1PwehN0sXgjVPgU
         PkaucItK+Xsl0oDQiaQYrTWvzcG2jrcjrAEIl8pJjZo9tSiJCsi04WCh7x5pC+DQFyI2
         hg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161660; x=1790766460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=o8pMnjKP5zVAza9ljmurNxVZdWMAmwaycwmfm2AQ38ZKzvIR87MZuBVYkBUyI35R3H
         SNVADsTOmbJ1Qr4h0hVAK9GHF4ii8QtD9XM73zYMGjnPNZiw2WHggalgzDAmDV3MGIE9
         ULitseoX55t5WlPT9CbayRFgSX2n7yc0akAQqpBbpiHNpJ/mQzb/SnMLh8r9V0pjaNFg
         ir56ZLeqnJTdXsqCfk1uS782AD4TCEZsmONQgWunRB4KoH8kukGdTqsZq3KtoUJDDgK/
         wN+6nYS7d6BLufhOlr9TBJHs1ymgF3lvxHS8kvcJUBUWNaHuQjNG2/UgBCcVwGB/qT30
         5VLg==
X-Forwarded-Encrypted: i=1; AKwUvBxIgO7jGlui1bB9CV7HLWa844+CisP3iFmexcH+WaxgjS2FDi04z+oe+Ymd0ue0Ff5LDq5xHxIihF7twrE1XmRP@lists.infradead.org
X-Gm-Message-State: AFuF++nSCjfF8fAfQYFao+xOxgGvGV1cfhCJfV/vW1kCjiAn7elML0Ue
	XUzdznHIuopNpemQToUt+px3M4p9JjkVIFJp5v756l2UrELlnhvGwhKv
X-Gm-Gg: AYBFou1HTeb6RD2o5KCB5WxOGLQjTm7b88HTSuJOo/ancC/Ga9qTlrbikYqTak0HQt4
	QTrZc3hj5MVBtUKoSssC9f0xHnhIyUNbGy4ea5w2vJgVQ7vIKCGwTyMFzZN7Sp6lfMJomxF/w3G
	wqe6D2j1hW4Oo4DPuB+sDVKH/mT7C+mNLYbuoGl+1CY5RMv3o9BI02TM8eUxJmIQbPMi+1T4bHi
	gyklUNLkMOGmUs119TsTh1yjm1H0N5eZuv6Z+6OWG/KBVfO2NFLgqWl+OQAFkg1t6c/rqkd9pVV
	FurRydSILsFoRllLtrOViHPPntMc3NvSMNvtrH+hm7RWwbw2gJygEUJf1xDfba0AMMCcXXTD1NB
	5KbE4rs9J+uPec1FPFsaiq+aVmcYvDRTK/D+awbHIZ4n/QhPRcVZ+RVAuY1TWjQEl+C7ZQbO3GF
	WwEsrsTMpDwPpkYZPsQ4t8IM4BNwHMvdBXRapDtJZss/Js+zkAqNMyauDH2h76gzsfPflR2joTM
	eg5omJMWrLwOzXIVUpg
X-Received: by 2002:a05:6512:3e01:b0:5b6:17b6:2224 with SMTP id 2adb3069b0e04-5b8d89779f0mr771643e87.23.1790161660218;
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:39 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:07:35 +0500
Message-ID: <20260923110736.10-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_040742_724148_7ABD3C5B 
X-CRM114-Status: GOOD (  14.45  )
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

The optional 24-pin expansion board carries two buttons on LRADC channel 0
and an IR receiver.  Keep them out of the base board .dts: with the board
detached the LRADC input and the IR receiver pin are not driven and float,
which can produce phantom key presses and interrupt storms.

Provide them as a devicetree overlay instead, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  2 +
 .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd646..e4576030276 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
+sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
new file mode 100644
index 00000000000..2d7e98e4b66
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
+ *
+ * The expansion board provides two buttons wired to LRADC channel 0 and an
+ * IR receiver.  These are only present when the board is attached, so they
+ * are deliberately kept out of the base .dts: on a bare board the LRADC
+ * input and the IR receiver pin are not driven and float, which can cause
+ * phantom key presses and interrupt storms.
+ *
+ * Apply on top of:
+ *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/input/input.h>
+
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.55.0.windows.3


