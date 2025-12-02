Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B63D11707
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=; b=fUK3XFhB7+cgikN815w8qtD8aa
	2bXLPKuVyDYvq9v9I0Ah8LZcRvcon5Va51lRKCGqBZmNJEKTZo92oW3GJlCfTHf2WMDPdsReTeggf
	bsAJS7OXyYI3B/EC8pjpe3Y0WR+b/Kf5V0f0ydUhjlsLRDJICIlQgekLFrF6KI1JRBXYab0OvBoF4
	MkrOSMmlfOBXRclB7UtvRoYF042ux0Yd2NRtSqhXSSZKK6fHEMPSPhreCuu2yO4IuqrD0rpwMh9AU
	Ud7QNYAZB9/zW0YA+Rt8MXZ7bSQG8tCYYElgI41v+yUlt/Y7RDdU7EBLMehlGEyH2u6sG4IQTbzcj
	6IRtUwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQT1M-00000005bgE-1392;
	Tue, 02 Dec 2025 16:14:32 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQT1J-00000005bfK-37Q2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:14:30 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-299d40b0845so91902655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 08:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692068; x=1765296868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=FBdkZ7W30H9TZ0RDRdVqlnIDQ0v+Z+joQpsqHhPLDOGKPyAjUVSSTINWn1l4xyXvKe
         pYnxnXJ7EhPIiTd2eZS7qj2N2aYWDBaodYj2jbaNQEUbmihMjXXA/KLexgD2ez5J3sG4
         kG6swSatxB5IxUic3kqBM4JjU8wZcNtIXueTaSGPKK6HtlIfbr3oqkPVzXwljpl0raeD
         8PqjEKQ6LZQ80drfnZyuOSvJZsAfNheWukfu7ZFGXyunbSa4BP/wBBUsr88ezdW7gH8L
         DS6+0nBZj6zeZBDxHrI4892dZm4m9dMjlibIo+ZOVKG7227FVzah9GjYMaCSdROl8sWG
         6oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692068; x=1765296868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=PYiukF4u0PdYkGAyu4hJcSETv2QhNy3xBntxcUHtOVz0E4iqJSyjq5O4qyMYewkmsE
         2qo+iSQlW989Stjo5uASiQqLE/sdV/tBfH8LQENZ3TAPNI/ckRAiLo2qIssq7it5Cei3
         F6x0s6WMyBwj8owE9xoNK09gZy2xNQI3BLLI79r1/n/2+N3lJe2sVfn1dZhLmYBr4sQR
         lEs0oAmPkqzV73vMqwEBKN3alfjG/8YI7T6TbyEUmvo3wx3DnDfWdEZAyKQmyJNcId2l
         vDy+xff7R4A89ASO0aA6uadlVLxNR3ysexv1/5dmL30XN7Dysli84lOK13oFpiVFIkYo
         dGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBCmVc0Tp/Ad/67AgH51/W93huVmbEkyqBqPHM86BMpx6ggv3lxNi+wCm1s5ef62yprvZRBUFZKE1E27/4Iev9@lists.infradead.org
X-Gm-Message-State: AOJu0YwsOOOt1oAer2IfEPdITjPEVieau3O2HmXac6W2Yq4N9Jx7EP3g
	ns4wwPat2cOvt8swHiesvOGNkhTTQ4N+SkfCLJTGlAc2QV3PNi2Yjpk6
X-Gm-Gg: ASbGncu64HlRi/Qx611SuVd+KY7ZQyemfKMBCmu1hvnuo7jYB+aoQShBtwghc/fshm2
	PRPdC7OJ38XvykbcGCiA4nt5OnztTljo60qUAC5IFTbjSvNlZGs4AFfjCLC4puWrfptjLYD8yMv
	HV47Z2S7MJIBFuV3WMtd9K67S2NUAg+r7wCa5jZeNjXyZdXneM+bH0VF98vfXsOpednI1GYIe+O
	drPuDMoAT/Aoe0OGqvlZBif9z4j8dBoZP1PtZnGMLeS2eORsXKBAqUum2CW7Ap2f9MgoMxye1fr
	a1yoB97HSYZeLtuO4KHALuXqRu6oEVlLzRPRVop9+GBy6vsSmgDMHGTrpUrkUBZGQnevBauYW2X
	HJOeOm4jxSnOrsH50IjjulrPWi2rn4jdu+kjU64SMDFrmoiVx41Npis/pgL6UjXL9jUWE4YoJxW
	6dDwxrcZGihBGFaoYNTgDAfRj4UyXlSIKgJ50=
X-Google-Smtp-Source: AGHT+IHKFWblm5LnaQm2d8+shTmkcU+FDf+0H06eH8nxVUhcOjJfWxAnQTwqjA0T3qIJaqWoH98RSQ==
X-Received: by 2002:a17:903:244a:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29bab1ae07fmr312387985ad.47.1764692068151;
        Tue, 02 Dec 2025 08:14:28 -0800 (PST)
Received: from vivek-IdeaPad-Slim-5-16IAH8.. ([2405:201:c020:c865:ca9f:dff7:8120:8577])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44389bsm160814385ad.32.2025.12.02.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:14:27 -0800 (PST)
From: vivek yadav <y9.vivek@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vivek yadav <y9.vivek@gmail.com>
Subject: [PATCH] staging: media: imx: fix style issues
Date: Tue,  2 Dec 2025 21:44:13 +0530
Message-ID: <20251202161413.92230-1-y9.vivek@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_081429_784004_2E967D4D 
X-CRM114-Status: GOOD (  11.67  )
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

Applied checkpatch.pl recommendations:
- corrected whitespace
- fixed line length
- adjusted indentation

Signed-off-by: vivek yadav <y9.vivek@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 2 +-
 drivers/staging/media/imx/imx-media-vdic.c | 2 +-
 drivers/staging/media/imx/imx-media.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fd7e37d803e7..725478bc2026 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1509,7 +1509,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	}
 
 	imx_media_try_colorimetry(&sdformat->format,
-			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
+				  priv->active_output_pad == CSI_SRC_PAD_DIRECT);
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 86f2b30cb06c..58f1112e28e5 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -616,7 +616,7 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vdic_link_setup(struct media_entity *entity,
-			    const struct media_pad *local,
+			   const struct media_pad *local,
 			    const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..135daca7d55b 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -231,7 +231,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier);
 struct imx_media_dev *imx_media_dev_init(struct device *dev,
 					 const struct media_device_ops *ops);
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops);
+				    const struct v4l2_async_notifier_operations *ops);
 
 /* imx-media-fim.c */
 struct imx_media_fim;
-- 
2.43.0


