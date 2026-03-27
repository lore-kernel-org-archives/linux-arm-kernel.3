Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D446F10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCbLjBWf2b55Ge/3z8jm9aEiQT0X4UuXkcvJNvdHJnc=; b=gq9g+IhHI2OTi0GWuAVT3zbTXQ
	qyct47ibJJFIpRRT3XQ30vS2a3rerfn44lBD7Z/mjatmQ9oQm4bPj1IzA19aAvulFbHfgjZEDXDBO
	JRxBavnbR7zYnOJ87VluLC4e2jEIpQ0YsvfMp3kKr3+QxgYYflUfHZ4yUFFQEtQBOPtgFTuQ7i/CZ
	h2naSi2mbuWsn5H4cx79enoiftSBvIrY4UrZbidCTnpuwABV8sX7NsAAx3BJO3lBejukJhUTALo7s
	NDFDtWxC3WcXtwnqZzjWO2kl3pGOVPJiUgHJi4zhzawCgXdbw6Aep+r2llIREQBgSgTTP1k2vaeHU
	XDwt406A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cae-000000084Wi-219F;
	Fri, 27 Mar 2026 19:11:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cad-000000084Wc-3LFS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 19:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zCbLjBWf2b55Ge/3z8jm9aEiQT0X4UuXkcvJNvdHJnc=; b=QtQrKRDFk0DTQkeFuZ8pHcI+E4
	qRUB1IrKw9tWg7zjDvO96D3+m56bTlydVeHtnxoIMx/8zT4YWWQri/VSxsWP/bMZnj7pJCE8JQU6E
	nxMPlG8WTmREGOWB8xnif4LVhDOwNsW5q9himUzcJQqGYeIvrirVZzoMEhLAiY9j++Tl/qJkx0J3i
	IGUG4rcSD2ixvsPM/i59rKOWik8YmdPRDuU1r0DmJYNB7mu5I2yyZ/FBO4k3Monn/nDLn3wf90LQd
	N6+fqeOhXn/5Y3I9pI+RVv/uI93WqL8vgW+1U9e4qGIdgutXuns3Aa9PV47ysGN0LQ94KPUj/ydAg
	Znt9rgAA==;
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cab-0000000B7BQ-0Rho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:11:26 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-128e4d0cc48so3138191c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774638682; x=1775243482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCbLjBWf2b55Ge/3z8jm9aEiQT0X4UuXkcvJNvdHJnc=;
        b=lGD5q2EK23kzrdyTzoqogH/Wr4qgnzu0fmVDSdkzc77cYCDaXyXAHkIl8pb5qhC+Bo
         WmJUBx5aRfkJauwQr+58CNP2ctco6VNOI79YeQXW1r/Igs197AiWJeuX3a523EI9HaK9
         dCty2juvwn9kO6yPgjvx3+PgG9Lk+yrjSGc0laoiBiGPQDWkYMntdT1MlEWxiiPcGQ5W
         37sITzkH+zt35myT73qn0lplKT/lVwuvSerFa//vI/CCb+JeQ1ebW7dj5JGIiREL/veS
         SciwCASpuLhG11nKWHjTxl9T5/s1org9fGEzVCaXYeQPwrmbuxJbwRJQQthhBMMVPoFC
         VnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774638682; x=1775243482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCbLjBWf2b55Ge/3z8jm9aEiQT0X4UuXkcvJNvdHJnc=;
        b=Ncg2MK62tuHKFuho3h+9vj79KEmHw0PEobn3t6KGy7DaW75GingMa7jy72+TFfVeDB
         Y1Fj6nxbSgAxaJR08feVAUMoLSVfDWyUlB+oyMhjNAgdzq4t7xdl4oCmexwkksK1wJoC
         dU1IdKa13dnisiVhEC3+QR1V38TXmu1H0xE6oCL7Tev4uGLbCh0jHQWHDLiWAHdPHmPX
         dtuHdIrFk1MeijPLeyZLQKU9TDhrFmapEvKEQ27BC2wKJXa7/K1U30BR3wWE6WVRS9IO
         CKxpBYnqZawFOmvAR+JRqKcESz24erxoaylzS8rnCtqEzt2XWmU9cWBU/oF/1GF7ajiE
         cVgA==
X-Forwarded-Encrypted: i=1; AJvYcCVXBjj3ZR4OyKKOaOSZf+V3rcNDdxfAwfxbqH04LGwhOI5eAsN1xtgHcVPYGApNlvGsUPZ2wpOefmuEvqJDAFff@lists.infradead.org
X-Gm-Message-State: AOJu0YxQZRQXtWsplbheq/2re241HOrTlZJIZHeBHEqrg2r6M8OUWjo2
	k8Bu2N5qL5Br7eu9Aie0pWLTVWBOtv7hngyMZ3uZ0EZ3IotWEvEKDSEG
X-Gm-Gg: ATEYQzyEIsw2zK3nLhppQl4JllwCBWslp8k8zFhprHUpkMOxv0G/9kQ4kVjh7mE6RrX
	lyHi4SUlGUOsk4P1jFoN3IIJ/23Bm83RTeNE5qJ1W7Sr2Gp5zV6CI6lHGmPFeLUIGdcElw9EiM+
	NzInVhvmEveqgdaxba2M2hebM7ZHjCF6EEOsezhpGcvGC1Fqgc/8KNq86PvD+Ozm9xIgP2ko7Rc
	/CYiRVI96QVIMRzZmLifN6/nWy29Ihtuf1v0BqUjilQS3JZEbwVHCKu8R1S9QfTSYn8MeELuKkD
	Me0me8j+dF4yAxQtaoDdkUArB32sIag6xz/svzRgxDukUS40p0R0gdZKG+f5b3PTbKkBCZChQTx
	zReWzBNi3Nhh4A19XkoRonAwUabynE0hA6EIns0f/W/OCI2StinEtMXCrPr2WJ66OMX6mxBbYKL
	pAewBXZdLFGAh9R3Pt9AJxDjurkEqD9cAu+UiBdTL13fUtY0SBCB4lCcg=
X-Received: by 2002:a05:7022:6191:b0:127:3b1e:7e0e with SMTP id a92af1059eb24-12ab28cb779mr2194710c88.20.1774638682181;
        Fri, 27 Mar 2026 12:11:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c46a0a84sm216527eec.9.2026.03.27.12.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:11:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] ARM: omap2: simplify allocation for omap_device
Date: Fri, 27 Mar 2026 12:11:04 -0700
Message-ID: <20260327191104.206512-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_191125_217238_A34868E4 
X-CRM114-Status: GOOD (  14.66  )
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

Use a flexible array member to combine allocations.

Add __counted_by for extra runtime analysis.

Remove goto paths as they are not really needed anymore.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove kfree and fix compilation.
 arch/arm/mach-omap2/omap_device.c | 29 ++++++++++-------------------
 arch/arm/mach-omap2/omap_device.h |  4 ++--
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 79db4c49ffc9..77a75b0b9ae6 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -307,35 +307,27 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
 	int ret = -ENOMEM;
 	struct omap_device *od;
 	int i;
-	struct omap_hwmod **hwmods;
+	struct omap_hwmod *hwmod;

-	od = kzalloc_obj(struct omap_device);
-	if (!od)
-		goto oda_exit1;
+	od = kzalloc_flex(*od, hwmods, oh_cnt);
+	if (!od) {
+		dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
+		return ERR_PTR(ret);
+	}

 	od->hwmods_cnt = oh_cnt;
+	memcpy(od->hwmods, ohs, oh_cnt * sizeof(*od->hwmods));

-	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
-	if (!hwmods)
-		goto oda_exit2;
-
-	od->hwmods = hwmods;
 	od->pdev = pdev;
 	pdev->archdata.od = od;

 	for (i = 0; i < oh_cnt; i++) {
-		hwmods[i]->od = od;
-		_add_hwmod_clocks_clkdev(od, hwmods[i]);
+		hwmod = od->hwmods[i];
+		hwmod->od = od;
+		_add_hwmod_clocks_clkdev(od, hwmod);
 	}

 	return od;
-
-oda_exit2:
-	kfree(od);
-oda_exit1:
-	dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
-
-	return ERR_PTR(ret);
 }

 static void omap_device_delete(struct omap_device *od)
@@ -344,7 +336,6 @@ static void omap_device_delete(struct omap_device *od)
 		return;

 	od->pdev->archdata.od = NULL;
-	kfree(od->hwmods);
 	kfree(od);
 }

diff --git a/arch/arm/mach-omap2/omap_device.h b/arch/arm/mach-omap2/omap_device.h
index aa8096ecb23c..fae09cfce137 100644
--- a/arch/arm/mach-omap2/omap_device.h
+++ b/arch/arm/mach-omap2/omap_device.h
@@ -37,11 +37,11 @@
 /**
  * struct omap_device - omap_device wrapper for platform_devices
  * @pdev: platform_device
- * @hwmods: (one .. many per omap_device)
  * @hwmods_cnt: ARRAY_SIZE() of @hwmods
  * @_state: one of OMAP_DEVICE_STATE_* (see above)
  * @flags: device flags
  * @_driver_status: one of BUS_NOTIFY_*_DRIVER from <linux/device.h>
+ * @hwmods: (one .. many per omap_device)
  *
  * Integrates omap_hwmod data into Linux platform_device.
  *
@@ -51,11 +51,11 @@
  */
 struct omap_device {
 	struct platform_device		*pdev;
-	struct omap_hwmod		**hwmods;
 	unsigned long			_driver_status;
 	u8				hwmods_cnt;
 	u8				_state;
 	u8                              flags;
+	struct omap_hwmod		*hwmods[] __counted_by(hwmods_cnt);
 };

 /* Device driver interface (call via platform_data fn ptrs) */
--
2.53.0


