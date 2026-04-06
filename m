Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B64EF4EB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CmI+hzyBqRr28Y++VrQXgi0DtpH9W0BGd3T//ob2zds=; b=2OUXe9NHBmGh1CgY91rHzdn8dT
	pteo85i159TOAVJDBOPWBUS6bmE442PoUBUxKG1mJ5sEipA8vuC4vmfoLaKM4cehY61aTp/vQuNY6
	7UA/JtMwWzhBTY4hVkZzl7Vssmh8WN5S9LnreC7yn5EEp40Aj9ZprA88E7Qodmmm1w+epQiCEuxXN
	kFpx9wvVIkMteTpHsMYqnbAz9Wao7JP0b6uN0jpJfCdMuXQ8yf36jX2OntEOASOIL5GI/sKOL9QQ1
	ctsyUcuYeESNIKgzbk/Oe0e4XUMfRtkyNyg8PmB0GnbS8T/qPjZ0ZPOK4CH4P9A5Df2CLjfraa4PY
	TZkfUWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9e2g-00000004sGp-1rO3;
	Mon, 06 Apr 2026 07:06:38 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9e2d-00000004sG3-04ti
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 07:06:36 +0000
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b9c9d03524cso191583166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 00:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775459192; x=1776063992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmI+hzyBqRr28Y++VrQXgi0DtpH9W0BGd3T//ob2zds=;
        b=BgUQ4OC3VHY5/uLsXFzqA2xAJkJrB3JLGEPUi/J9ZQC+y8nVRlyRfwS7Q06369FHw8
         VKLI62RGVvXPIjIF8/Q26JXwrfn90reFOZffIb49nQFRfQ7Hpia50H3kiIgvLHgVFBol
         5bFsw/1SyFq7BVCDAz+lJUDjaHRPRCEtFRxC4n6gUtjLmHKcrYF6MV3cowO5XjMm6xn3
         7bxnJocWE6PQDmrqVmI+pjBHjAWBCbpFcXv8x79oMJ7Z0NJPmRItBe2GIhIqNQKme77I
         6dofHvuHPB9LAR4PB+1WoAkEkPrEBC2N9qqN8vrCZwj8uvZzgaifqF5Udjt9VTi/dvIO
         PihA==
X-Forwarded-Encrypted: i=1; AJvYcCW517kvia4T5U0LvgyiAHGwec84cFZbWHndyjAOSvAJtxtpqPEg3Crx+FMMURvg9mXTk7CDHGq2uDfhDi/DTU5i@lists.infradead.org
X-Gm-Message-State: AOJu0YxunNfm6PRObj0UrxUpO2F8l3qhhMg1/VIfhGmmYaojEXVzXF7z
	A1bq5wlqjuNdF3pIQtDneDGJ1uNiG6HDb5iaFbG2k1biLwOeQpGaVdP2
X-Gm-Gg: AeBDietBLpvVjp2Qkot3mAlSwsUh8L2Xsj70QldkYUAizliMruv+sStysF9lzsE8k/Y
	zoUWCtOrws35FXOE4PmlzGvi/IzM/hIz5N1EcEGjefDT0NR3XRGQzjl4zfa49esdkIPGhvxtNXz
	f+I+03TmUshkWLZ77kE+LqEuRDs/KbJmqtlp+V4ahm7ULWfr7cmI9oJQaHsGBt2H4Qg0WvuXGhT
	z4UaYqFNpfmQonjBVGNYhO14q7ed6bRaUiLGdeQ3TwN+kMfLKrSPdDU+PKOUhpmsuVN87K8zvNG
	HIeUrU/TtkNFkZZAj1R7hiE41WkIv3xv9vfCME0FSzjN+3S5nTnJD5loRSm7YatkIv76j0vfdVS
	iKPgR3XLiRHE6hW7OXcFT/Nhw6ssnriYNZsSdMXfS6dRMTcOypKzvbNzj5nDY8isnPFFzPTmC62
	R9I8Oi1VZbjhejSqnuqdOsuH77+s4+VHWIAY08WBqfXoXZcDabM7uGexegJ2237w==
X-Received: by 2002:a17:906:4fd4:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b9c676ad8bfmr559766366b.20.1775459192157;
        Mon, 06 Apr 2026 00:06:32 -0700 (PDT)
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl. [5.185.72.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm450129466b.52.2026.04.06.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:06:31 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	pritam.sutar@samsung.com,
	kauschluss@disroot.org,
	johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
	stable@vger.kernel.org
Subject: [PATCH] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
Date: Mon,  6 Apr 2026 09:05:48 +0200
Message-ID: <20260406070548.132491-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_000635_075158_ABB8B95B 
X-CRM114-Status: GOOD (  10.29  )
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

The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
causing the USB 2.0 PHY to fail high-speed negotiation and fall back
to full-speed (12Mbps) operation.

Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
(squelch threshold) from 6 to 5. Also explicitly set
TXPREEMPPULSETUNE to 0, which was previously missing from the
tuning table despite being included in the register mask.

All values are derived from the vendor kernel for the Samsung
Galaxy A6 (SM-A600FN), as no public hardware documentation is
available for the Exynos7870 USB DRD PHY. With these corrections,
the PHY successfully negotiates high-speed (480Mbps) operation.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Cc: stable@vger.kernel.org
Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Tested-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..8711a3b62c8e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1958,13 +1958,14 @@ const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
 			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
 			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
-			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 14) |
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 3) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 1) |
-			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPPULSETUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
-			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 6) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 5) |
 			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 2) |
 			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 3))),
 	PHY_TUNING_ENTRY_LAST

base-commit: caf08514bbee0736c31d8d4f406e3415cdf726bb
-- 
2.53.0


