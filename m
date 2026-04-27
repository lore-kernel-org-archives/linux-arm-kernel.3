Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9CBFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XX52kU6I+oTtnTaZWgm7ccpRK71cywO/xadAPHW06nA=; b=UGNuVNGFby0Dbex8ubSSTrZZrc
	lb9rHwVNToG/UhPa0C3oV9BBrz6OLty5sXW69mt6SXSkyY9HVgZsBasvEg9ySAKFuRKECIMOdNd7l
	UjB9XKxs4FiVtMQY91gd1u9mcsvKmSlQkjrNIA0YJvUM7WSdaDdUpQmQybTlqXfsCpI+ixFPmHSiR
	IPfuE9144VbfmBKEzzNfpds9V6zPMi9Qig57+5Xa4QTTVV6ktVN26fChdcNqwD6v/Hs6uT/rHnxPV
	fKfeafqXLwobBD04lyip9TBguE9/Pd6MAfGypXNut53/ZXOAwBOYeYJggtj8Po1uyilHy77GRpDSD
	/JH9OsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSKE-00000000628-2aTr;
	Mon, 27 Apr 2026 20:13:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSKC-000000005zr-1Cho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:13:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-445795cf6f1so646027f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777320778; x=1777925578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XX52kU6I+oTtnTaZWgm7ccpRK71cywO/xadAPHW06nA=;
        b=bfDgfoCjhCydKOopKWJFtcgbRiPJNZLQgOvxvqOmKgsOofgkE/EWouzAv5GH6J2SKO
         IZjGGChaXtcm4TmYE98Bt3oC/yH+HpRISoybp2jeHP7Qb5JuQZvng7PvLTKRhn0wLC7t
         rzBw2y7f/D3rKpJo8OxyfcAc2ZPzlS0Ehax/eoXERyX8xodqUw6eLgr0HJD5Gt834xB/
         vol4Mg/9kN+7s/duwUoNliki1yuJZKopBhk+uDv+K4fytRB03V5zOmcX/+JqxXZRmWD0
         bD/DZMCrl9nstBjrxviGQ1XE8XCB6rKX6P5lEJrTK4eNYnJzN8ZySPLpbMrFBcLte5ZY
         s3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320778; x=1777925578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX52kU6I+oTtnTaZWgm7ccpRK71cywO/xadAPHW06nA=;
        b=TRpnc9dqstxxGNomovSgc1ywOc3oFcFFxE5+8eqVJ3QZhmoTdAcswsm9uBmVKYkMGn
         OIJLGLIqMxPnsjgL8BUwJFLunmSFfhNdUXM7Iu0N/GgdeH+9fPitJ9hjp6Phua+1wiJ4
         Uc0QfEm/EXL/CXmPn0C1T9bI64Jb2jO+Gc9V3lxKmaP49OS8Oo/ZZIXgIASAIF7jac6m
         gJKBSFOv1kM1wrXQp/lFXej6Dq1kM1cC876CY05ra96HYfH/pYDNCJe74QwjgGmDqFjX
         EAqKLLH7pMoHX5jyncp3EkpuJUdB3g2bNxsAX7BArB6gauwzTHCI0B6X+6Q36WP5jG+f
         m2wA==
X-Forwarded-Encrypted: i=1; AFNElJ+x2aFkBGoGJ4KFqB7DGsrW/aCyWQmuhBm0lFJ7vfevnTSR10ZSoZX0j0izybRTNyHC/kNNPh+FX0B2zoHp3gM2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz25I4ga2JCfJV/Py7ucqAlfyLgmhTzy1eWISEvW8bdA3DjmUKE
	h7JQohf8BLMTI8j1DsUv+PqkU8uHjsVv6gcdbxFLavBL1XZMUSjTy6UH
X-Gm-Gg: AeBDieuJ4IGWeJ8wLmItXx18X3gGFZLGORGc1dIIJgy/uw7Ju7F058IYVkeHlwmoR9Y
	qwjFeTTchkiYId3wd2i7FI7hTW+5MPgULYzd6x0dFpaYohd2D3v3Ap2m0M+c+AX2bsvdrPn9kfB
	IaLIRvK9H2WiSA8am3u7irOIK7+5O6kNScKwTmp7gqEUdUZPEgt6HPtzLlvuEBsmBE1iSHOh45h
	lHANEuvgbAYs4cdwOGjp7TmOgsRlm4HW0V1YMQvkQZGtE82l5P3vEVkRkZDCVKbCbJPtOKVEgIH
	1TX5YFV/WdXSZM/pg15tMi0mF1+xeO41HWluO3f0/4nC/MAKzpntpzvcbTzFG6BYCFzE0LtKxQa
	CrcXp1FCj7JbZZYzAtf3bH1Bas1JwvKD0W1mmoKPeKldseU/OtFOWQQ2v0NRV/0K8bj1OqTpgTX
	LTyVMJ3z5NhoGKNWnVVaxnEyiBKArL3fGGLUJLR+U/xHF/vZC1
X-Received: by 2002:a05:6000:26d3:b0:43d:7d6f:f535 with SMTP id ffacd0b85a97d-4464b1b84e6mr423171f8f.35.1777320778397;
        Mon, 27 Apr 2026 13:12:58 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f270sm726826f8f.9.2026.04.27.13.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:57 -0700 (PDT)
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
Subject: [PATCH v4] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 21:12:38 +0100
Message-ID: <20260427201238.20823-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131300_389375_9EDF1481 
X-CRM114-Status: GOOD (  15.25  )
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

In mt6358_read_imp(), the variable val_v is passed to regmap_read()
but the return value is not checked. If the read fails, val_v remains
uninitialized and its random stack content is subsequently reported
as a measurement result.

Initialize val_v to zero to ensure a predictable value is reported
in case of bus failure and to prevent potential stack data leakage.
This also satisfies static analyzers that might otherwise flag the
variable as used uninitialized.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v4:
- Move val_v initialization just before regmap_read() call as suggested 
  by Andy Shevchenko to improve maintainability.

Changes in v3:
- Initialize val_v to zero at declaration instead of checking regmap_read()
  return value, as suggested by Jonathan Cameron and Andy Shevchenko.
- Update commit message to reflect this new approach

Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data
  to userspace

 drivers/iio/adc/mt6359-auxadc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..1d9724ef0983 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -497,6 +497,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 		return ret;
 
 	/* Read the params before stopping */
+	val_v = 0;
 	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
 
 	mt6358_stop_imp_conv(adc_dev);
-- 
2.43.0


