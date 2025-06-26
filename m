Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A7BC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNFuxJyu4lFW1KKh7ZXTdnCioa3olqumEo+f3P6R3ho=; b=SHYIOCc36Pr0MOpUo3s352Aikq
	o279qg2z+i+ZUM3+FZIzjYsZivNcvNBLuRLzodzAo1RBpouYoSSvCaYp02hyeMQUG/vZcjE9WwD5k
	3uMYa2nISxwHdfwJ8efOMg0Fb6X6p7EAqY1gYHdpMLsCCanQeo4Xooaa9W0yjeNgh013HQR0SAsYc
	dH5qIQkAWQFmkFGdTY1xLYnr4QtwUvLdRbB/S5NpjwSSuuIx83B+GByAz4hKNUUmZ99qoe346FNQR
	uhg19wBsUSz7m8GU3D5tSDdn+TM788HZWEheYZt8kbpLl9raLPZAv57L2Yg5pcI/evqrbYwzDwj0P
	VwSlBz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnKV-0000000BsAl-0gWB;
	Thu, 26 Jun 2025 14:11:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnDl-0000000Bqz0-2y4L;
	Thu, 26 Jun 2025 14:04:58 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae0c4945c76so146893966b.3;
        Thu, 26 Jun 2025 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946696; x=1751551496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNFuxJyu4lFW1KKh7ZXTdnCioa3olqumEo+f3P6R3ho=;
        b=YViMz5vYeHEZtF6KGpVtrf2Q3R3y8LW/CxgpADwQXaburx7lak+tB2IMsIXTs77tOX
         TXzUV4W16d869D8NvvNYW+6dMt5gLg5RN+LlzqnlabmLfjFXEjpdf/EnVh4ZTrpmeY6T
         JAYNf3gddcVxO5uDCC7JvBLXp3sJ6IieYXEabHhaaQRIzyYFwp42BwaqdAwmnoeFfLgk
         hHIo03JpKKIC2IjU0LMtydVFg9NPBSpvbyByEvsO5P52EQ3/7AIDOr/oop/ryUZ4j27r
         5IXl1t9ZPEWsuHWVe5p8vhJNvR/piawvTdYZ8fV7N6y0+ecMNvjDwN/tZS0d7+a9OycK
         Ga0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946696; x=1751551496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNFuxJyu4lFW1KKh7ZXTdnCioa3olqumEo+f3P6R3ho=;
        b=MW+opZKF5EI4fD96azO8q5Xbd9UbeaHZv/Y1b3mMxUyN0GQSWxaal92nWpGC7oqX+B
         cJK5o68BG05OsbbAqOo+clf+boRrm30G+R8qXc2KJ/KnKqaNyhPxs+u6LIf2Wg097a6l
         GcqXqckWz7fvR/Ltp4UIZ0b++I6f6SxDHuX9dxAGPcZorJd4iUNvJmzs1ztKJ+heXdkA
         QKA2S/YKZPAK+LCLvjpnkZbvH3xaq28CSk2+Wn39ybMbZqDHRNH9/LVnoX7SKCxAYEy/
         Sfg40Y5bZmAc2sr+4FZxJa+Z0BXX2cumI+2kpzgLgX2Evfs9Rg1dd0YhuUPJSiGdWlWT
         OmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3GsLTfkIP4gQnULBwE39/f6hCzVIGSbCqHo7qLaAiDilQee2uIK/fG6Tuz/hcp4lAqDI22hUoB7Kda1Vlo11B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw06C4TyJgwaLOH8dBvTwOGBid0ghsWEUWlnL71KpmvPCJPo1vX
	eamS/hYhX72Mb6QKtGXOjqWmL37ZsDY3tzYU31oFtoj37VhVc8Y5cdTmJjRRxP8BqECU2g==
X-Gm-Gg: ASbGncuZ4V0zcOrJYCY2JBoq3fJDwhSdPUhUyqddjYZFPyES+GBAZdH1MpQv9bJrXG6
	J2q4frxaHcIccvdlvcGT2VRZa0dR5Cpv55hsGorsEcI3LB9kvkgpINgMhkwnsjmQGDiwubcsiJT
	nz4ARto5RjQsi7SWqw/IfxLqh2Cm4tEyQhSzqny7PE+cYlL5176+Bf09b4GwtHg7n+oHbDvCMHl
	3sFRh/Irva5GB6eWwqKti+0wsNp0cjHd0z5mdRh8jKJsG+qw4a/YDkzqm8KtKvytxFrs9yOUM3j
	fQVb4ZQjlg/mr1rMQ1DwEWE3LN+H37EUs62aiSymRUPcSoezgLFwfEGqzem4rqrGStkLBs4GZxG
	3ZluOGSPwLCVb/DliRG45lA==
X-Google-Smtp-Source: AGHT+IFp6DyXdblOU/xvQb9UjfBpjvuHf4IC4x//qSo9Y5vJDwiBZNnXQsyJDow/QrDZH73Gl/yAUw==
X-Received: by 2002:a17:906:f043:b0:ad5:55db:e40d with SMTP id a640c23a62f3a-ae0be9c2452mr641299166b.34.1750946695744;
        Thu, 26 Jun 2025 07:04:55 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:55 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 2/5] mfd: khadas-mcu: drop unused nvmem code
Date: Thu, 26 Jun 2025 17:04:29 +0300
Message-ID: <1b421ddfd44d096cd3a979462ced002e2356eb21.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070457_747994_D7A18D21 
X-CRM114-Status: GOOD (  10.95  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Drop "khadas-mcu-user-mem" code since it is not used anywhere.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a788..ca4bd6cf5 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -80,10 +80,6 @@ static struct mfd_cell khadas_mcu_fan_cells[] = {
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
-	{ .name = "khadas-mcu-user-mem", },
-};
-
 static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -105,13 +101,6 @@ static int khadas_mcu_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   khadas_mcu_cells,
-				   ARRAY_SIZE(khadas_mcu_cells),
-				   NULL, 0, NULL);
-	if (ret)
-		return ret;
-
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
-- 
2.49.0


