Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991C0FD4F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=; b=G8yT6BSum9+kBTp0R5IO0clyYW
	qWA9V1/DAle2lkjT65ESI6VbShGOPUmo6WavtyXaT5gYFEfR6jtbHrlHsaGV4PeowG5J67ePCwu5G
	CwDSvTgzpNK7SqJzqzxDdkvEiCxaCvUUejBthOQzbXRSGlVb6QPIS8S/TYrXk32+rSoI80Nk8bKOD
	06Qbq8AcdINCoaVsxzvoMOo2OGPNmLiuwJP6MtwixvdwbVZvzM9U2RdLgDC3Ih5BuMCMktC8xdqKf
	lz3Bi4FoRbi89WdXsUL4TN7pInBEvlnoBky6IOnMVIPGQKVuMnS6zvwOziI/QuWjIVjAe1xN9JW2q
	A4eJoqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LE-0000000ADnT-2Rg6;
	Tue, 10 Mar 2026 20:06:08 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03L9-0000000ADlH-3q08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-829b2018c94so2370725b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173163; x=1773777963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=SheI5TSDpUb6bHAxnHW2kUXrl+I36NXS8on0JYnxpZeSYNlJk97yzWZ0jtGfh2rQqY
         Z3xp2opjui+LjfDEuAKu5X/1b4qshSJI3/Ai5i+vGpN8U5sNA1oolLlkZUjTHtaFSPTZ
         hdCLvvUmaSVYC8F4h9gvtHVxKlsWtqe3IW0xHiXqdpc2UhfalFXgKg/rmFKRGJJew/HG
         SdsTIUDeSEFbv3s9psPbnRjwzUCKpdpn0Xc9RgdSIz2TidOp9+RrAt+bsH1GdmtkKZkK
         pTeXc7YKvpO7a1h3ctXnIHNwTVZC66e2FFxUydtDyv8v0tVXatlZEp/ewq+T6jeS6rDI
         OtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173163; x=1773777963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=YFyB9B79YcJi1CBpZr0pGckC5qUit+wWTo7cw3YgwXLHZWjVpwSh3t02mac1ysVBzf
         Ol5wugvNeC1re7cDXp2dt9NJ/PbLjZdwK2qo6UfeDmB85SbQeW2xkwmeU/p+gWvzuWiN
         r0iEDHa6ZiCV1Ft2TvcCvKxq/KqDNuHBJ+JQry+Cxnr24fxdVIfp2RNona+QdO5g/zJo
         5XH9OoQJVsZXHXnrrIHceZESaZGN1QiGKUjMihBN6mGohZvF9JOZ9hQJjyL8Tw8wDOES
         /mzYMTb4n8X+4+AbkheiY41/f3yOyQC/qCVFKhYPicBeL1HQ2+ah7U+r3zizlrI3UyTl
         6LiA==
X-Forwarded-Encrypted: i=1; AJvYcCWz5bCXoGx+HCwz1JupTtCGHjY47QQ2RhbpgGt8ddYgGIRaNnv45Ap0daXx3b/NFtnFNTYSJeQIvI9xURzQpGwH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+bTHEOL96TeIzf6uQl/T6mnm/7gDmJKj6lLYJgXJbxBhEmq0
	FTYlqDBpgcC8Czqro8wlmT8uIJjay/l7HECeP5RuksMLamZr88JOo0Ig
X-Gm-Gg: ATEYQzxCGLrXa9HcM7hQCi+096JUBNCDX46mXOtfsPR2GJqOknIRDuCucRKF+t516kp
	2Rnx8TrBPws9m/DWP+OA9v9RAJ7BAIijAe6D1IroBMe0dC4JGOMHIeN5a38pZ/s/n0mPNWCfhOw
	w5S6AFWNSOLMNm2eBNaagDsCauHL6cxKjKdgZyhHfQpUpaebU80MIqrykG+qH2lphZPZsgNv/Qo
	/TG0iGE8PEkcSWfjlYb+CFJZnPSvQ+6Y9jrBfgwLVqnJvB5VOF0vRSL3JTmKQPmi5qpkKTIxPq6
	jWKnmtrL9J1cHpwnaJWgY4VeOIs2wwZ8g/bQLRkCFqNrItp2RfazbN++A2eDKd17BZ4sZtLLexY
	BNqiQP/f0exQY+1Qkrq7GJLFq9RfBJ06dx65yTdRGJYW2wjnGJpdEyoU3h/eUvDOT2ci1BjlSLs
	XiwOC4srUgiNbhqKcoyryYheQfmWdILKDtHSmmEonnx7nWTnfS
X-Received: by 2002:a05:6a00:3696:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-829f6e71c7bmr133338b3a.4.1773173162881;
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:09 +0530
Message-Id: <20260310200513.2162018-4-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130603_957726_BF5A9468 
X-CRM114-Status: GOOD (  11.22  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index dac593be5695..f641b62e692b 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 
 	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
 					ch->scan_type.shift, 8);
-	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
+	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
 	if (!outdata)
 		return -ENOMEM;
 
 	err = regmap_bulk_read(sdata->regmap, ch->address,
 			       outdata, byte_for_channel);
 	if (err < 0)
-		goto st_sensors_free_memory;
+		return err;
 
 	if (byte_for_channel == 1)
 		*data = (s8)*outdata;
@@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 	else if (byte_for_channel == 3)
 		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
 
-st_sensors_free_memory:
-	kfree(outdata);
-
 	return err;
 }
 
-- 
2.34.1


