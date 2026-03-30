Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE111061B24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uL4VcJmIWiPMelM8MkKEBxP0uSyKH0wJwktcMh1N2Xk=; b=BIUYY20AvO2m7gpQPT62TxS1TL
	6kI1DPY051UEE8SANUoo0YPMayRh2JNkLfBBd4I4MyFOBaYBfAf/Vnn1c8yUHxvjd64vohf2ff2xy
	kxqBAOO7yniZz3ay71sPDPvv3L6RQkVgSsYqw6a1oydXBJBDj/TBinmrA1tB4DaPLbKMH6QoGKIva
	lwh4NMb34SEm0q8383hcVoCGJiT98j58Nv8PixEgnvEfsOxh6kPxFmXQk1zMM9mFtb+W7dS4KeUHh
	sigupVy/wReb8h3T5+x0fzTvppaYSX+TFy0hs15HNCFAoXYWoi6OlDpjdvMOm5nrJtijJoA39bjfF
	mfcfeY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KH2-0000000BuyW-27I2;
	Mon, 30 Mar 2026 21:35:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KGx-0000000BuyA-2Nil
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:35:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso2065851a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906547; x=1775511347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL4VcJmIWiPMelM8MkKEBxP0uSyKH0wJwktcMh1N2Xk=;
        b=N1g/x5NT9WAV4G9WHcsBCX/YiHzK3UQlrfRw3gic7fM2/v8qbYbdJ4D4f3/6M2GqYB
         sIUmCrVwte5TX9ji2kckOQO3+Ry3v91bogEV4A8IuqCqBKKLHV1Zm4OS/McSoclqR3i4
         1Bh+PACZLVZreVe2hP6eR+U1YpZTvxxBWdq1XVl2c0LO0j60jpSMYQ14AjbFXk7vWDtg
         QhOnUUFHHUB95/1EzF44yUwLrdnTs5pyaz0aASVfbvJ7mA4nnwpGb13Hc6/smb4SDOeq
         TfLDUasGX8/dP1yXdmIJJNqrdww0quaMfPe3fvdlXjdgBwVCyc8DNxPUFeuVMrIP0fur
         llHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906547; x=1775511347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL4VcJmIWiPMelM8MkKEBxP0uSyKH0wJwktcMh1N2Xk=;
        b=K3g/8gicyJdr7bN1WsnJwbxSec7G/FthVVKhLpcQW8vJWE5zYmKYPHdCaOm3GnLWi+
         TBn0yO7XXNnzyRiGVpb9jp6BhHFKGiHdpKhWZKouqH1YN49oO0Fbn+PFxjzPKSaP6MmG
         zS7nGw2D5Hv4I2Lxxn31hQHaDvK6T9lI53swkIHzC5V8HDeMj6XwPoXSNMlEH6O9mI5I
         2bUVU8j+rfKOjNn/4AFX9EikrEAFePrwuMpqY5nsYkh88oW5YJrzTw13Cbh7G1rR4eke
         NFMstvgnXyoaGJAap2u6dAxntnC93ORANy+UzRRth+yh0d/g+DYMiEFIiFl/dp0dIzFt
         5Fyg==
X-Forwarded-Encrypted: i=1; AJvYcCWJcERi9QqkIYiM9AQMx+bZlmYqzXOJAo+BHDRPtedhf8s1O+1q9wonfP7fIUpc8Pbi5SXZTvtAswzvGnDe1nHE@lists.infradead.org
X-Gm-Message-State: AOJu0YyPiY0VmAzGbKnbbrB5GWCwbUfU3Be22/aW0UNw7eji7SpjpufG
	RJq9OkkSY8I7V76rmOn80/Cyj0LeRu4SFiT70mcSD/yALTmDVsDXDOwK
X-Gm-Gg: ATEYQzyC78fclLcudlWxBmwOCK9gw0Vkt45A+hrSpSNQStyhPnl/5AUWpq0ThoFQn8y
	UkmWUtnAR5sJ2GFzzsEgIXD/E3UXDR+yYMBbF79uHG33UI+uWUDqfjD4SJRBJG7ajtDXjU/Y8UB
	4cN3KxK2ECq/TMRMBHLvymKxVjRFpNH7ASt9Ijp0pQDLltsIdiibl/FlzzTVqK4XCSL2PGR0KVQ
	vw1yV4c4T62JCKGguHT2G1YjEwB32bkqELWyrCkhZltiS6hU6pjKd3yom/NMwdS7v8LeJYVP/+D
	NgRjB5uYX0lQglb+COLznzLsCVLrnX5j9S1xxcZZS+qbdGoKJ3hHslMY3NX5HmjmNlkkP88gVXa
	lppK2iZHNCrMM/QK8NBo2Tn7JYIoCIjYakvteGxFGe9D96DIZlskZnZnr8Ay5FELR5B36cP+LUP
	MDBj3/VSr7mjJ4vVYiQNGJAkCccid10i8nXHMD2jvrlSK/ghg1bsBzcjo=
X-Received: by 2002:a17:902:f54d:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b0cdc215ddmr134897835ad.13.1774906546605;
        Mon, 30 Mar 2026 14:35:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24278501esm93975165ad.58.2026.03.30.14.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:35:45 -0700 (PDT)
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
Subject: [PATCHv3] ARM: omap2: simplify allocation for omap_device
Date: Mon, 30 Mar 2026 14:35:28 -0700
Message-ID: <20260330213528.18187-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_143549_858282_8336A1A6 
X-CRM114-Status: GOOD (  16.66  )
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

Use a flexible array member (FAM) to combine hwmods array allocation
with the omap_device structure. This reduces the number of allocations
from two separate calls (one for the device, one for the array) to a
single allocation, improving efficiency and reducing memory fragmentation.

The FAM approach also enables bounds checking through __counted_by(),
which provides runtime verification that array accesses stay within
the allocated size. This improves security and helps catch bugs during
development.

Simplify error handling by removing the unnecessary multi-label goto
pattern. The new code is more straightforward: allocate, verify, copy
data, and either return success or error immediately.

Also removes the now-redundant kfree(od->hwmods) in omap_device_delete()
since the hwmods array is now embedded in the structure rather than
separately allocated.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add a verbose description explaining why. Powered by Claude Sonnet
 4.5.
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


