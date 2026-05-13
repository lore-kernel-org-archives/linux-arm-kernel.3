Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EA5CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE9EKx1/wkTsoQUzPsz6//nDZdCFOzQbMRqAhJ3rRGg=; b=LgaBwGpL0f2E0HjQ9E1UK5bvNg
	D2rvEtNfHPlmXHmLzHDtxduPvYAk1H+Q0ovITC9FvyrCi9rACOrPiBjFPmGfpxHr/ZO2N5+vc8R5q
	/oXNuweySxDrVfO6T1nahXUkcmpIhAzUZUjoWKhVOufQ0n6ScC0N88EJW090gw7f4nblz3zRJE4qZ
	9puYTJ2chO748ylS50r2dRAMwFCbK0nEVfsWfAfxXDP6/99q0dThdih+ZuPkGeIlQvG5SpjV5nJKj
	SIjb/45FHuS+HHKdL4//w7e9DNhicFohxSnsac6crFDcJAUkgSAyz1W4uwpj7cfU+bjiPG8abj43F
	Hnn1/WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g8-00000001ruI-2MKO;
	Wed, 13 May 2026 09:14:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g2-00000001rnj-28b7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48d102471a4so64567155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663689; x=1779268489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE9EKx1/wkTsoQUzPsz6//nDZdCFOzQbMRqAhJ3rRGg=;
        b=bnQpeiplFB02stbnO1LouEudwkamZQWqnhg3E6sXC6DhLBpCTCjN2SEjaJ8HDVFcE3
         eVtTIjPoanJOrpkLVdLZ5x6Odz9S+xwGChWF+pwydQlytMHH7iDvr6gR9SNXWzKxIPCO
         XOUYCCqjMtiXs8L2Kp1SJlvaKhvNkbv4/uT92uJBToYKNNARpOF3HbgWybMQPUqMXI5v
         HfQDRfAb4Q3wVGuHsD4AKguBxfh9zz9dBKM7aTun245tsJmOFu+l3/4+QnLGtsPF34Ea
         XLhTCdJl5D2BBj4WA/sKOdp0IhpfP//xHrDwVEYl2YGM/YqCXc78OSFcMeErPR39cHAT
         J54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663689; x=1779268489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lE9EKx1/wkTsoQUzPsz6//nDZdCFOzQbMRqAhJ3rRGg=;
        b=h7C7w6nq5NlWzo9O6r/gQl0wLecWmf6qfLJF6Lthvi6xiLtro/ZF53ZXmMmdgJu9Um
         +dmk1ZsRZ2DlgMTHeUM0dpUSdzAkJ88ZZCyQyKTuZOgKnw6RbW19bcFpt+XYU+D+Y1uP
         Dp2tIUzonZ59JzR8r7EzD+oyh01w/af2feFH140F3CTwVTNwhQYX5NvzbxS9O2oknkCP
         4NPRygWfBrppktL+tgHgnP/IELgj4KDyGn9U30B3UtZC0oij2nnUya9baqIwoEb9BXsw
         54NRca2s5lqOexhtw6+XFcsbAOHfO2XYo/MiLX7vz9hEnlZXhz2ugWN/ng8Jt8TC9kn5
         E9Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9REPOUP6keQnjAJD+X+XgdXGETGux7Z+iGs8B4CXlvnTkfxz2/VuBpLCfYH+Spuf9Jy5gJVS9G6ugjzW7scArB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt1wp8yXiDQpfuT5kDliuyB5az6w51VCzqXO/5vwUa0VdAjBY+
	D+OAsBu5jfK04u0z5mZzePDmBTEpujqahWMGGj386yAzM/v61mDYZNW7jj+IGdw0XdY=
X-Gm-Gg: Acq92OHtZZWhqJhQQXTFrgxkIIxFQf/d67TMQqHHCYlhltjNXYwQZfPBtxoTqmWitZO
	Vu7C/EWTxOKRV9Y2nUpKXuthIs2wS2P1WEn58StUJcmpCMt51nGgPHIKvJqlI7eqYdfmMxHFdrC
	pDG5SoIyHK65oloIBux/yEufsYmcuRqAR9CFjhcDQNqKQpV5Jz9Q5BAURXMFIemviHNrqArjnvo
	1v4m6g4yP+VbLANN87Q+VId532dXNU5XB7RAdEM/CotZObzwpLbd11YRM6XgxSoiuNLd9ukDTLU
	1S0CWX1nlE3RCgIvR/tvQWennGQE5RHFXzJjyM/IsPQlOou0PEvt/TP/TcYpcHel6nkFDV4XPC4
	aMOpulitsNO875BWTRntUvsiBGGeS5L95uRwMEW2SdGoRhqJDVZfOJLhrf7tQ7JZnlP1cGjhlNN
	nw3FLrONAHRES4BKGXM0YA0dBuEq8T+NU=
X-Received: by 2002:a05:600c:6096:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48fc9a30d10mr33302395e9.14.1778663688627;
        Wed, 13 May 2026 02:14:48 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:48 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:32 +0200
Subject: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_021450_573753_710CC3BE 
X-CRM114-Status: GOOD (  13.10  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
---
 arch/m68k/coldfire/stmark2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..aa2b4d2a8a64 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -94,8 +95,32 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
+};
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dac0_resource),
+	.resource = dac0_resource,
+};
+
+static struct resource dac1_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
+};
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dac1_resource),
+	.resource = dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0


