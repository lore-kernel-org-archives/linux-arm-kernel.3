Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=; b=v0B8tCNYT4c2zzj5RKk2YVzqTZ
	GAlUYExmdgvVwr8iWQLwltzCgFM0S67vnZzH9DMXaSdZdSu/8CuteqYhAI0MsEmzWXkXcUPWgTEPW
	Ip6x7o4GI3IYttWL6On/JWffmiSI8k4i/ESIo3AXs0BUpAZpnO1E7VzWSRibi6konqGZp7Vc9l/kg
	jYHMCYAsZtvXn3t9/BT7LBLClUnNHpzZDnq4wK1IbwNkn3rK7CTV9Ak3iB+oZWIQjgznR41ZHrJoL
	LxJ8/b1dvHAZvoaJTUjjKnAPU+C23WMnbOGFKwfBg1lkH53Venok7J8Na4uvgl9KEEHrlWz4Jcr4W
	hA/IWhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9O-000000015mz-2bHI;
	Sat, 12 Sep 2026 19:12:34 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9M-000000015lx-2cFY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:33 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso931207a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240352; x=1789845152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=b61vN+5SpigyXbrpdWw3Ytm0njJL/sJkV6idkF8edmRgERxlnsvZMcefbOEGdXn5eT
         +EdZh748WzKEyk9ea9d/nhmAL3VH+tJ4SQ0ZXhOm5v2coC5UEDvSqoolVO88kr1znpfB
         ttuzWVQajoRXnVPNUIJA+KsD2HpoMzKRRjRsXzbHxlz5sLtUOFmBGRc31jaCOI6Zd4IF
         ECkpYSvyH2IPS/uip3nllWClhX9rvEfX0OPHaiK8w8QHBmcTJOz2v5PhEZPxpcEcvjV9
         z5oHCjc0/W6etRUjHUjmyS7dZcASSHSssUW5OhuWLeV4AJWJ0vQYNbBU2fsZZjI8JpZV
         dEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240352; x=1789845152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=iTyi037BmACv/JQxHwrOtDdr1A5qeuyTQOjCuprEpHqPJPr9ibVj9inBygg2lTuHFZ
         MDEbUXijJh8JeSwLdOxvJG0i1ccE+3M4T+lY1R2UVDtMMZlqMqLk6IhTARzv2yCQTkRu
         gmlwUnD6gQjUoNQ3/In5/SBgH0sZsx82fV4B5uPQLDiJc3/wTZ5c6fnAFp0Z0VJnOXlY
         6tNUt57QIMT0ZRpRtjRtpFJuVOLbqNvjQnKX+ScLSjLLfb7Tel3weDld+9SVVKfpn22j
         L/fkmUUZtWOBsQ+XTRYix9FoJQoha/73x8QT45NCCC82qoE416H4VDROgdlOFsGJyAe0
         AeBg==
X-Forwarded-Encrypted: i=1; AKwUvBz5E9Vi4CSpMJ8CVT4+2MZNDQOMAmNn+z1H1r5h0zCxa7tk+XFQ8GozDbm0MFeUWK2emjAO+huL4E9ebTEMPOis@lists.infradead.org
X-Gm-Message-State: AFuF++kPC51Gg2FZnR010ewjKJodmrmAZljQ4+DIQtdjDBVzqblLeyj6
	Vedoim6MggczeEwiSTHjDYffSTajGEIiEWKgk5DVxKut1U8tENqCdxvS
X-Gm-Gg: AYBFou1jPb3D2Tm/5IUEExtml/Cf/yDHey/CtiYijwbiESprzqZPtj6uljvIrVlnzF4
	f4fgdMFMM6cFxHjPEJ1X0rLSEwmCEZYhBupuKWnCGTcZv696jjjwLcG2cvmm24C5kPd6nQHEQrV
	CDBySbzZNiDXaR8CN++9Le364QgJUBll5wIKM+fsWy1vQWHV2n6MBGMkZVx+SmxjkiAAbFeveX3
	LaDrEwcT8cqkOf8A4Wgrf457gH9/Cl7PmxCFsQqEI+OuUFEJniiy/OaGMMo3IJ+U6353Z8PQekP
	EdHiRi1Vfa14aQ8VdQqeWq7nBZx2fbR/BaLfJN+XZyeuhkX/HFET5l85nROn//eGdazRvx04/Oj
	J/+HSDp0/3OPsVKYDlYdqLMBss9OgWOgv2SoxaOq4FlXAJfgfh5GeQrRc7IgD9ofLbiIPgo8EXu
	9PWfgJtr/kxPyHjsOa9B3WRE4z6cmjDAEGSELAXW9jaUP4aqxJAg5EHr5ZWFgPHKGkdwyz
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr19386123a91.23.1789240351619;
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 1/5] power: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:51 +0530
Message-ID: <20260912191156.185448-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121232_704758_B37D4C53 
X-CRM114-Status: GOOD (  15.96  )
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

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_Warn and dev_dbg(). The %pe format specifier
prints a symbolic error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME
is enabled, otherwise it falls back gracefully and prints the raw integer
value. This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0


