Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFEAFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=; b=ulDa8yY4+nCTEPzHPfB5aQQUQS
	5uUQZSoBI7vAdBNpyxPhWysJnnnGhi2IDgjN2XY8frsIcVTIY6yYXfYmleMsvQiAW17s4sP4fvaOF
	m52yIzHNlf5DJzBvPYWQURyeM5Kqh49jX/HlJdDuJhw4kPsFs7plCsDv4L01S+GYOhvK5SZ6Hd/Y9
	O4054oua7iIIsD9dYQMfUNTh+fQeBEP6fZftfLhil9HvR1wvJtJv8+WGF911sUOnpNTa3kkDh9V8a
	UykLULNAjfKkxXyP+LGu5qhQEA4gd7MH94abCSrG4pJlyb4DuEA2QbB1ljOnrSYUMMUFUdp7qNJ1G
	DCjrJsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPHd-0000000HOcY-3OAy;
	Mon, 27 Apr 2026 16:58:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPHa-0000000HObP-40gG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:58:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso110122545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309085; x=1777913885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=VwkZYsQlZfmVuY+N6x6ZjKYQz6/3ntZaHqp6a7VWY98+OVKxjKa9vH0ZFbShGfMomv
         /ThglZXT0NO6lsbIrXz1OT5Vh+LRynwQTvxsQXD6EndjyUzYUEb6xjRqG7i8Y0GZiiVd
         hVIi7QpUXz2kkjI8yzNgQGSxCcimMjXr+/UiLpw8xbOC3imsS3s5cFodqqMYRuxJMDrr
         ke5PUqViwaGslgqQIP3Lp0IFrQPw71bU7dqm8m1BeU5SUMQpkUPKCiRiOym+2kRlWQnc
         SJpNGHnmQFq1MZIgKkLaK+6Bul/HXEHN6HjtWD25sw9UBaID/TKxw2ev6JTbh3EfVCOi
         uk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309085; x=1777913885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=gPOpxtweQoVWUMRRqtwPw8NnLLKI7J01r3wMyyy8KnOTdE92HxmwOHctcFlQoyVPGD
         uz/2FAkxHrp0maic1K6OrGlk9Y/43+wLllr59mW4VSzbFsF9bQfLxqlIycWKwc99u5F0
         QvrnpGWJvU/pVN0tmm/oI60IsbXIg/rKZYDE40oXRzi8DuwhK6HiMXKm8FDFKeh5QWF5
         aFT5SgxVmgl2CP6Q9b4bcP1RmXYKVPxEFIVmVMQSeytYmc0MCIuIN0wC16RmHKr6gC8i
         j7txBIc0N332Gk8RMcnG0+Iw+iLj0Yw0nqw/zkSYZHPtE2R+RMinJi54aPHSmpeaK25K
         mUgg==
X-Forwarded-Encrypted: i=1; AFNElJ/puiJ6ghTttWXoxXjwZt0cUAGCPe5cEqa+hVMdmpMlpzSrXJsPPchYPfjVQ5peI3RkH/Aw9UZn4KybYqUrp/NV@lists.infradead.org
X-Gm-Message-State: AOJu0YwVLohO8/mxB1gFKKCylZ8hlUcEq20h26yKh1Up1hw6JB9nXTYq
	5KoEMPvZsxYU9YvbmPpEtJKXoaANDj15xnC6nzkhMmfjhmxnAdlif56CDWrAnEUV
X-Gm-Gg: AeBDietl0lmpXU1+G0wtT7OzFtsJV6yAXq7B/04M3uxa0ALIc3RahvYFjM7W389Y7om
	wwdg2PQdLvm+4roWbKs2Pt6gSbHeHJsJfUTUdbjYzs1RLB0L/WBN+o+6YfFDEyAw981CR9xgXZZ
	mqFYURfUGobyZTq1dAQ51ZL9Qulmmz/lcuBgQ68bxQyAxChUozRFikFtgjz8ne/L0F95fguM2b6
	2uR3LKx8ym7OAaHow8S0/m0oNrFJUmEsqfj2ER00vcT0Nryk5zz8g0RzMyXeSF1Q2EIy+CfKOwa
	4LlSPKmlYn3IWZTl6HGTVQkC7spvoYtyF6Tjycmy5HVFDZ7lswZjamJ+WZ62J37mD9ta89J6ubr
	YK9nlid1Qj+Kw8JQmlxh40rZ0/eI53xqn2OL2g7QZUliT4moJS1XxPb98J6uckjH9lJPtQ9vx9B
	39xsU8ot9MhuJiwA4GeOMCL5jrYXHFieFs/n9bAkwJ3f1l+DAY
X-Received: by 2002:a05:600c:a319:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48a76f91970mr1400915e9.29.1777309084799;
        Mon, 27 Apr 2026 09:58:04 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a76f7f483sm2721465e9.0.2026.04.27.09.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:58:04 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v2] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 17:57:59 +0100
Message-ID: <20260427165759.5756-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095806_999945_F79559AC 
X-CRM114-Status: GOOD (  18.46  )
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

In mt6358_read_imp(), the return value of regmap_read() is currently
ignored. This is problematic because if the bus read fails the variable
val_v remains uninitialized.

The function subsequently assigns this uninitialized stack value to
*vbat, leading to incorrect measurement results being reported to
the IIO subsystem without any error indication.

Update the function to check the return value of regmap_read(). Ensure
that mt6358_stop_imp_conv() is still called to clean up the hardware
state before returning the error code.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in 
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data 
  to userspace.

 drivers/iio/adc/mt6359-auxadc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..f927bff4a26a 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -497,10 +497,13 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 		return ret;
 
 	/* Read the params before stopping */
-	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
+	ret = regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
 
 	mt6358_stop_imp_conv(adc_dev);
 
+	if (ret)
+		return ret;
+
 	if (vbat)
 		*vbat = val_v;
 	if (ibat)
-- 
2.43.0


