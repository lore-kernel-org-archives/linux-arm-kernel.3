Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F0CC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=; b=d1Ian/rX6EioDlRD5S7+yhuaoE
	KcKWhPoDyGz/jJ4ia7UVo0pFeCN31sSsIUyV3yHJHUNwIaBz6FhExFFXEaebUWstR08bFVkZ1A2fK
	6ZXKuwk1I83eLGc93Yy4HLYfFFSqVXjByxRoD9UxFhKsa7Q3VBlB8tuZ3z7r8pawtDlnDq/URSHMC
	LRabDBLbvrVyc5w8B63c1WiV92pefNxWeqxDSIrgFjiu4K9e/Psp0SwFZVG4Iu+pCc8nb3L+CyprV
	Hnz8mizwn/SWDTCHCqt8JFjw2jLvW68AI2ZUWnOUawu3kNonUa2aGSa9SyA2pzpk/1i2SsodeBACA
	68QNduMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kfp-00000007y6V-0KAu;
	Wed, 23 Sep 2026 10:58:01 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kfm-00000007y5Z-1BDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:57:59 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a5d4688decso6945171fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161076; x=1790765876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=ca+gtx7ZNIea3i8nPrp631o/3y/anYlUSnlt52yU20qbABsUXaKOUH6KgiG9nHwuT2
         MnXhScwjN8mcq79gmIU3urd1ICDlEvBW7X+sTAZx1ubT2i6cBe9tAPqi8vAn8lIqEBdw
         Z+2AlQUIV+Wu4M1U9r0+fRzBkbV0K1ON359MYGj6Czy+RHiGffmYfkHKKoUMh+CJPbuI
         iXLtI4Pt8Dq5zcSnlQb4sUjg0OssxiprDGmO0rfILsABqE57oF+rPwWlHXqx3K02VJLQ
         yYXwhu+6wtPUrjFHF0cV15hac4KbjG+ammN7doqNegYRme09wpOH5gfsR146jFlGco/E
         eQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161076; x=1790765876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=0aKW+MB1qvTJ4pm4TV52Nilb8/H8n0GsMBm1M0aXOCRXANWnPWUs1/RZ4ljp9JHE5u
         duD04ywuqtmf0NL78lUq5tr17/kJSKspjf4VMnw0af+YSO7XoqYa+ZZCdekniOjXTw9M
         6wjGc+p9M5VezNyIaQpF4NPGGR2VHtcJMRVUwSdhWaqUi9Np01mQHBRLbLfK3ktV04oB
         p1VB1TXCGTbFfq+AsR0QsdtJZpxSe7Vn0kdHv0utooqOxySM3RA/xvSPuV2VExGJv0Sa
         0JfcVveTiOQpO/cWDnvSYftscwze1C/WWH2BlerBHYlkPFHNRpkQyKZxMRKbHIUsqkbA
         zcvQ==
X-Forwarded-Encrypted: i=1; AKwUvByBPXG0q778JNaB1rHtUaAK5QHPY1h2ZsRmt1qaJr+gTdXDO1KuTCKFo1t/653/tpHVWO5yUKO84CK2beXXg5Q+@lists.infradead.org
X-Gm-Message-State: AFuF++l3L2RRSBy/QwMi9AZ/kJHnmG2ck632LGCmU2CC3ViWW+GWSfUL
	HpIgkIbjW6vI6yc1Bj42A5BDKq84pfKZg863hRz+KLzXtq8el6IIZzSy
X-Gm-Gg: AYBFou3SI5DVp1suaRITbP9PU1yCyzOZZ4m12hLvy+qOKRgttao4CkTEcgbeMYQdIYi
	UxpcCWE6Jgwz8JUcBOJ8IdUK4DV0QGORJOspkcND7Zce64frUFRhGjGW3LjqYvsu7UnUuXDcQ64
	k0W9UERy12gPLRV/1dDA3hGCD9CiaviNBfniLhJ9zbmYi3OP+Ruq2aQUkgcaOoARw1M83/iYn2n
	gQf8LtRcf2S2EWGzJcs6NL5BADneZ5CTmzwjCHZ8Jfb63PnoN3rAA8hG7yyVJW3/RbDpC++Itth
	ZdYnCpBflPFOnGZGse0I6ym56L5+7xmKfhzJBnQ3NQea901fMj9H4C3UhytR4FJzBIUSGmw5pNl
	+CSe1sbBx7tDVUjwYtuQ7nRrl9AqCIOQfwTMlhkszG1kwFAaltFnFj9FZknL8B8eN+ZCF1rUcAo
	fC7Fo1ODuNuETeQkZmJ6TnYJ9pSjvcfCNYQ1c1nUDO6KmNBjPFx7ZeVLuMI4AXjI5F6gt6UXLBR
	7xpoiSX+6dRjn7emanUL7oRqcVGPQ==
X-Received: by 2002:a2e:be9f:0:b0:3a3:368:fb9f with SMTP id 38308e7fff4ca-3a63069666bmr5961811fa.13.1790161075789;
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:57:50 +0500
Message-ID: <20260923105751.435-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_035758_337673_27E1E293 
X-CRM114-Status: GOOD (  10.90  )
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

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352..1b690e3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/*
+ * Buttons and IR receiver on the optional 24-pin expansion board.
+ * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
+ */
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
2.53.0


