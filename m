Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1712BD59D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wAHMSsIO5ddeQOx4lVtN+I8avLKmTpynXtfS6IHjzgE=; b=SRbXFqe/t1udWNDlmAFmSM8SrX
	Q+Rm9znyslDA5DyYLCbCP9W1ny1s5BfdNQG0HPBE5kfJSdFaNbD9JdGQK0Xk5OPGtvMp504MDs2LA
	t1w9IDX3OHgy/jvaGVs5/MF3kSm/X8VGXFxCa5YbmljJQ+Hj19c/JMH7na63AR3xadEYqOwzFX2eu
	kbZHJcmLA73BZQALuCFmQTLoW2MnSjmH49iJluncEMu+XXoDv5GkulWCig4S9GDX0u3T+NTd5jBMx
	RyU8FlI5MbtJEESAfvcbsVKHCk6Ay7d5Op5i8UU3eJ6EsjjkWrySv9DkpT3qdcLs3QOXUm9bnti/0
	MtT2D7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFecE-00000008x5x-0P6G;
	Mon, 25 Nov 2024 19:19:22 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFebH-00000008wvI-1Mnt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:18:24 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-466966d8dbaso7497751cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562302; x=1733167102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHMSsIO5ddeQOx4lVtN+I8avLKmTpynXtfS6IHjzgE=;
        b=jEAL8Bx63ymDljnpYXiQ4DxbsL1g0RgfJP1FfbsopvXh8YY9iDuI8ftlL8as5mjVp5
         DayphUmYe/E4s6GfIjLZa6mwyf76g2fuJbm+2W0QOb42PgLWYk6yJlWWKnWpoS4HZ4U7
         r+14jA0UjdOftuP0EkHY19J2S8lSvZcU6X9XebJl9J+PPqy9Qi3hESToixEpWJIxfvqc
         NTVF9Bwo4luFW9DBWA6f/38USWUrRgQ0uwhnW1XCojQleQLlM0ylc2lOcUrCI82l+Juy
         lmXkd/1EYI9J6qzt30rcKKITNdTWU+Tf6akqaSKMCgtoT2olcYYgoxtBDIHrveTt+Rzs
         GWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562302; x=1733167102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAHMSsIO5ddeQOx4lVtN+I8avLKmTpynXtfS6IHjzgE=;
        b=ckLXbct1UC/9o0JFnsqz+CcWYpg6MYZklsYV8unl59aNAg3jIRfuvXTPf/CHJi/MS+
         dw3mFdEi8cGD6oYm87KmyYytv/VLxRXOKIRFB9CDBMJdBjCLeUfhGu0D8W0aumuEPctZ
         uwZa6tcHbsuEi9ruYtt7fBYW8C9LsPH8jOG3rLhDWkkyQKylbKEUdoeXo6J2qQa7BSH0
         +rEs9vByfE6/16NpNmr1+JKZCKJiKEn2TibWfa5CgwZL+3sk6pC/b8nWYvqPa4P6XIF5
         oeKvzEUttABQ9/FGdAMT5kyfAMByd53iBi3JvBSL0PvapglYBMVM0Br77DTPXfFACkIG
         hK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXF8BAFsFdT3FSj6YSvPeuAuT3l4vRZMjB/jV1FC9J7BOzE+PJzM/uKAeZHDa+nQ9RI8OP8ZSvN/kcb6/GD/iJW@lists.infradead.org
X-Gm-Message-State: AOJu0YxYtG3ebTsD2tB5mYQuRFdTBY4Fuz1eWssew7Yq5Seokc9zFB4j
	0N/kQF9GShihurCxJaddSD0Hmt3gh/5iDNmX1/OTuwfS5B9KxjCa
X-Gm-Gg: ASbGnctXafUKuI2V3oz4W6/U9zkoDW1+1da5p0uNm04wtYnk+T6HW6zqcfoBsn601h5
	bcaaItDWpXedXX8LBLyccYU+nu46P0FvF2Him6HtdwIyFi8YMLPeWo3jiyS+cer0l30g77cWsHf
	fdvWV7LZBaROk9LBTqmgAQkWm70SoyLGfuW/U3gjHqeBKKQks5wZnKMreFeKUKr14aFc7GF29YX
	Gb7W6ypNAdcDU9VdYfNLL9HLdbvtV6aZKnmW4685d7B2GyjHHv3iABSOXgBoOnlX36SoNic
X-Google-Smtp-Source: AGHT+IGTeVRK8dnEv8pLZMHBWIn9oa+b5th9cKFLAQnuxR7nxKyS8JQjQJzxVPrI1VwR4PTpAiDRDQ==
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id d75a77b69052e-4653d63ec53mr203814251cf.52.1732562301606;
        Mon, 25 Nov 2024 11:18:21 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466a41010dcsm1193741cf.23.2024.11.25.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:18:21 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH RESEND v3 2/2] media: camif-core: Add check for clk_enable()
Date: Mon, 25 Nov 2024 19:18:17 +0000
Message-Id: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111823_362561_23993C83 
X-CRM114-Status: GOOD (  13.48  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. No change

v1 -> v2:

1. No change
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


