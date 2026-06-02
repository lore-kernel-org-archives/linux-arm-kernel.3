Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=db4ZDp99XGdk8QVglDB5KTc3dov06pGrTY3LBK3e++o=; b=zPtV/hspL9VTuBL3gdWQiTmEp4
	+80Ty4XsHTrhorV9Yp0obJeMrHnJQCnaM/dzU+gDw5HBpZZriGCcwS0/6p20j/UyLpSmwU/ffxry5
	rZWm0unntG/jCTNqLm0KET4RzDqzpyNH2T/m2mI7jSzDk5m6zPJseLu+N5TbzQmXePwYclpefHWse
	WHXLKaBwbX64XlmxH4HJmbgfpdn0YK5ospUMNaBnbkyCWEMRpez+ERUdQd1xIhZODy/hxv8//M0U8
	9LMLxKgz5qQpxJFVBTwssSGnysFl58jCAwXvFkOp+X8bHyY2NCBOctoBaZ8E6t9zFN3PhWt3/6XFr
	MW0mbwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGAv-0000000CFRK-2RfO;
	Tue, 02 Jun 2026 03:52:21 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGAt-0000000CFQY-0ynJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:52:20 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304f0039c02so7171869eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780372338; x=1780977138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=db4ZDp99XGdk8QVglDB5KTc3dov06pGrTY3LBK3e++o=;
        b=bcYTCw71kVzKYHUJsbelay3SSkW20GP3Qz55tnRYYoJFlW8ndRYHz/ufQ/GEHQcfkV
         +ZC4UhOuCGBZHTSf2b1dh+y4kLdtoEdrbJ9rVXf0d/NWEq9f8eq0RxCNfbSLLc6nbLqY
         GxYqLXht4G38cpck0UeS4OCM+lrDRFR7oJQObIzzDdvgcPR9ig9kMyvjK6V/eho8Bugh
         l0BapDfWY2Bs/2W6lo81shAZ7iR++trw1/CmxAy8UklV/dPIS6abWGiI7SNHoU6Uqtgc
         tj/EDaPfLQDKm/FYZ5OLJb5uYrH6r6ER3BVqbkDb6dIHJxpdrq+SdefjfdwcTp8HvmjJ
         uFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372338; x=1780977138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db4ZDp99XGdk8QVglDB5KTc3dov06pGrTY3LBK3e++o=;
        b=VAKJMwoUHEedJourSWKj3Xb35e1bviMyYMBZHJPDCVNPz7f6QKLOCRn6mTiKi4MWOB
         JXP2qhWyBgrQAsEOVPDe24E8H/HkgVH9Gc81bLRF5iL2Ep9SSX8E5jvLjeV4jIiZHGIE
         NsR2sXlXtxdmI9xGsNnN+rMMLOnvM7sg4X+3cVUz055of7uJqhD940kh22cO7/1kKzIX
         jYjvInQEj575RFx+1oDL/VEKCYoQb03V45lv9xhFd1+0bipB5KDQ4lfDllfc6/RXSUJ1
         GZcKMOKLy3Tx3q/oJ2c2UvIDxjQMNvQg0b3LAlSzXfbEnK57p0JEV0liIY/+zH6Zz+7o
         8CpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+XPi27qe5vAn3IY7U3yqmweIdI83/dkA80A8T68uwwlf0Gwt4G2OkxpmbxXh0gVGf87dOhmJR+0GuxykfUz5m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn1yhL5tCGR4LSFqwVpecvxhVnIkFyKOeqxaKnRfA9laj624F1
	8q27KXYpv5N98/q3Ao0EGgHI4ao85JccR7oG5YyWAy20AdQ6iTaGjdQL
X-Gm-Gg: Acq92OG9ORcFIaajh29kopgKIsFLUXZA3PE+qmKKzE1dwNMiVd6QJ28hntLP1v64fyu
	ghyDv7gwQFwlA4AdSDDrxcoEZAdvGp+uV6Dmx9L5o+qezEfqsyhH8aooQaUDn+6hnmjMArU8ra/
	e9n9diH8f0UsTHfsxf9Ddq7AxQ31OmSdaMuiGymZWgjvyGwqav0SFuCkb4cUBehYboiiq9p22zG
	eYTquI2i8qewCRo+R3UJOXXG4BdH5CA2UixJvZx0iwFNLpGX8Xmtsssu1D80qKDe/7J9RwCT0k8
	viP84P0yE4M2lxJ7VY/qU6VPYTw6DESpX9E8tb0m+/2G031SI9eDMqeuNjunikrXitEP/qj9Yxi
	BbfP5Log7WpGWThb2SvKpj48/kCxrRwmfQyM9Pc/FWq9fGX3jGSs4Yg5SVmkM4P+yvIHoaPpTCL
	SD7zhZoUyP3rlQo5q6gS7RfjoU12khyi936R/5Agtz1UqNFcvyXgOq4zkHiRu9873llJMo5ohkf
	rCyppQx2WbHXSEdLQvspzTJZil5yTRj1dn1PmQH6b1yp5lQsHVY3tpXpK9q49Sa1rBdmJxQkd7u
	7pnxZ1nVwN05+H6LtEgoeJek7Pi2Uqlg150s9BqSYhg77G1SDhawCFMRTUNAuc9GlUE=
X-Received: by 2002:a05:7301:5803:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-304fa4fd14fmr5878983eec.10.1780372337755;
        Mon, 01 Jun 2026 20:52:17 -0700 (PDT)
Received: from odroidn2.. (c-67-180-34-11.hsd1.ca.comcast.net. [67.180.34.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d06asm11425664eec.14.2026.06.01.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:52:17 -0700 (PDT)
From: Yi Ding <yi.s.ding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yi Ding <yi.s.ding@gmail.com>
Subject: [PATCH] soc: amlogic: meson-clk-measure: fix debugfs directory leak on unbind
Date: Mon,  1 Jun 2026 20:52:09 -0700
Message-ID: <20260602035209.62335-1-yi.s.ding@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_205219_271944_DCB31FD6 
X-CRM114-Status: GOOD (  14.09  )
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

meson_msr_probe() creates the "meson-clk-msr" debugfs directory (and its
"clks" subdirectory) but keeps the dentry only in a local variable, and
the driver has no remove callback. As it is registered with
module_platform_driver(), unbinding or unloading the driver leaks the
whole debugfs tree, and a subsequent probe then collides with the
already-existing "meson-clk-msr" directory.

Register a devm action that calls debugfs_remove_recursive() on the root
dentry when the device is unbound, tearing down the directory, its "clks"
subdirectory and all files.

Fixes: 2b45ebef39a2 ("soc: amlogic: Add Meson Clock Measure driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
---
Reproduced on an ODROID-N2 (Amlogic S922X, G12B), v6.18: the
"meson-clk-msr" debugfs directory survives an unbind, and rebinding the
device then warns:

  # echo ffd18000.clock-measure > /sys/bus/platform/drivers/meson_msr/unbind
  # echo ffd18000.clock-measure > /sys/bus/platform/drivers/meson_msr/bind
  debugfs: 'meson-clk-msr' already exists in '/'

 drivers/soc/amlogic/meson-clk-measure.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index d862e30a2..1bcaac7b7 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -902,6 +902,11 @@ static struct regmap_config meson_clk_msr_regmap_config = {
 	.reg_stride = 4,
 };
 
+static void meson_msr_debugfs_remove(void *data)
+{
+	debugfs_remove_recursive(data);
+}
+
 static int meson_msr_probe(struct platform_device *pdev)
 {
 	const struct meson_msr_data *match_data;
@@ -967,7 +972,8 @@ static int meson_msr_probe(struct platform_device *pdev)
 				    &priv->data.msr_table[i], &clk_msr_fops);
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&pdev->dev, meson_msr_debugfs_remove,
+					root);
 }
 
 static const struct msr_reg_offset msr_reg_offset = {
-- 
2.47.3


