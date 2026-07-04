Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C173C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=; b=koIkiicn/7+EvAcJgLXzkf0VUW
	TamSoPye9A8Mc6aLml6VGK7H0JIazpqjELGRkLR1Kc7iM0HoiA0fyE1e6CXCmm1Njy17WwK9K0RY4
	h53AgtQycOiwS0Nehxhjyp7Lvhk13pDP/FB3hQGNzn6lCCNsyzuczfPQDSl1SFmTx+neB64vxB8vT
	KGEEua+JlYg1g09VYkPdms4CNDyKnX89WCYkQKU3UmSqoFlgPYDf11cvVfKDBVYE84vAjqxIFK472
	OgxYTQGkIB3fE5UTvWb5+2gIWjdKmR23Bqfa+zZ4UuJZEoWzEn1On95pnNbRDGHur82RFoWND9zEo
	B8b1uhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xr-00000008bQK-21bB;
	Sat, 04 Jul 2026 17:15:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xp-00000008bP0-1ea2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:15:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so1558588b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185336; x=1783790136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=UcoN80KON11rZ8Et9hY//fwyKk3jOX9atmTo0cXv4rxQ93FFSXYgO119GH0/bJCiNj
         PIgyg/JkHBupbIlaoCensrJgkzewzE8os/NnFn8bJ/vtkGwtqU1cntZrHti3ZLea2umw
         Fal0CwhrQXxnWso7vWBZmUP97f7y0XWQNDFUbfq61xQy1M7P+okhpGyyIXigAM9yHVip
         IdYaL1MxpRrlzBnGdHuWKK0rSIysAAvCLnJaye/qluAiyRu4pkxAhlhvObJFp5S1TJPn
         EvqA0dRSXP0T/pDLZLuDNhbbyd1BfW+bLpmHNP6nSB6B0Z3bveAsTLolIdn4nGUdoJu+
         3YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185336; x=1783790136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsQaU9uZZtvn5+lIZrSejmQfTd4zI1y5dE5Iy0qO9rc=;
        b=UbXg6J+OdujRoZ/i/CWA99pdqZT1FZJaYzZNqT42bCJx+gKwSSvNJL8SCzUmf58p9N
         5gqX7YBblt4KpfWXSx6ETYDxL7Kb1nc+dLGgxapywUmvptnrQA+s+aeY376cyMQ6HEDN
         2C4xNvCxbPxPcESThcTuVJH7sxUImhcvjrQbNit47jQh/I+CMdvElLgMCay8GhPixmLP
         AlZ5I8ZfsxrXDJaop4RERVi1V8FLI64WcLZV0AcnpVIZckk6uXVSrFhwbbgZhMBVnta3
         N1UFUvTaNJSNl4moMI0Sevd665LzMuxF51RaifmsrsTXuNc03xNPvhT8cOtFnRRx4Yy6
         OHeg==
X-Forwarded-Encrypted: i=1; AFNElJ+89i+IZzPWaCqwB5coVpq2cph9dfDgN84/ASHy6tvd/q3QgQpNvo/ETOyTUIRnJS9PqMnveI3+QZ8l8H3ogt6X@lists.infradead.org
X-Gm-Message-State: AOJu0YwVishZ/jzb9Yqo300GUTgmZJD2rjiGm/apKgEaKia4R/n3+sYf
	uM87c9HkCR8WtkKKUe/oH500GZm6tukuWzokIPbKGIear2q4nq+GvHmk
X-Gm-Gg: AfdE7cnRAjRpJKiXpdd4mu2pz1/COY7znlkAyhOyLZ7FtlnHHVgAadK/paaVxR3Lr2r
	ub3/q2jrdUlxanJeQtd8Oa6NJeamfKz7r5MVobVXuTreg0TEF98VjDQSUI+DeQuRcyRDRr4/Pap
	ltQ0m8CCCii0osRif2BuqV4GEqjyBrwTOWowkXakKL+61xAsTQkxslSrKI60FGat8VJYIH5DZIW
	GZKTbZTteRvUFOfjE5XBvMoLhNoaozwEKqxGpdQ3DD9yfjxc4WxFhsd4RQ14rl72Fb6tTc0pkx8
	RD1ZxzqFRt5Ijdmmu0Zi0u0zRcv0+tXzjKsNSLVKxbfFlfW5swbx8boopXeixIrf/lQpRnZMizs
	GExCr2eVSF7dZRiJDCgi6mtgdid4j3nrlD3J7lTZFt3P/7cssUXwdtmd7QVBsoemX9zCIR0ecPG
	PkjjSA
X-Received: by 2002:a05:6a00:3305:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-847f6f84d6fmr4092931b3a.57.1783185336159;
        Sat, 04 Jul 2026 10:15:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:15:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sun,  5 Jul 2026 01:14:09 +0800
Message-ID: <20260704171411.1413349-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_101537_433925_0C2A5C58 
X-CRM114-Status: GOOD (  21.79  )
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

The A523 processor has calibration data in two nvmem cells. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 80 +++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index df0c26970..3bdd62aa8 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -301,43 +301,65 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
-	}
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
 
-	caldata = nvmem_cell_read(calcell, &callen);
-	if (IS_ERR(caldata)) {
-		ret = PTR_ERR(caldata);
-		goto out;
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (!IS_ERR_OR_NULL(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.55.0


