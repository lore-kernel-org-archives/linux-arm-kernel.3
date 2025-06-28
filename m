Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23939C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=; b=3J/C909Wm7LZd3V1HMawQDlJt4
	qfV36SYBDZOxTMz5MXgjk+sHu1aGtMzrVULutf862zc5ahzwAVFuMZitDeY3q3VLwpvaiFDMxLniQ
	zFusYKKyZBo6DGUk11jTwQnPHzciUpO1klZyC7O/zT9BNhD3hTv0SIheRJei0BjRj9h6XVWtYzvlZ
	vBspBzws8+6ZfWeeOykKJJGxB/CWnSd/uDg449jCQu/XDSsYrvOeozVRzTxBCVm5I3ke0sgzmZ6Jg
	s6kljCJQaZmbpUGEP3ENwBwfe7kegtRk4vcGcS3XIImRfy67pUz7yILKFW4ssyFUdjvOhHp319HAK
	v4sVALqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKnQ-0000000GAHE-3PEn;
	Sat, 28 Jun 2025 01:56:00 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKl7-0000000GA6D-1kkX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 01:53:38 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7d38ddc198eso40119685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 18:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751075616; x=1751680416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=E0VBxT77BTKZmnn65JXGkkGzaW5t4L3qhw7rWTQOJcCfj17ctexrTk9PCSVrNgVIwI
         08tieKAIawzLJT1b2cICnT7BeXleHLtrkkGC2vkegT5cn8Ejw3uegLWr/lbp+SYkhA7v
         ZpI0fQtMTvcyTS5Zz+RHbDZRY1AyN+h2C8EYyb9jxgoBHAlzUsLukaYHjx5t8KuaZ0Vj
         eogjFOFdEUGKt4ihVgIEz27E9wXD4Oh6UX5TC0VWUz89kGZTByyAN1QCXWRePued+k4s
         4DnqlNEQc9mTiIHvdl75wQ68++IngyvGLuqIy1xNb/rtPkmdYTAojBD5TYgIOgEitpoe
         Y9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075616; x=1751680416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=tOb3jBbTf5pKK4/Bb8Al+E6rxRgOSRCOWcKEfyZ9CRc/TNoNgIfc8KK+amWQl5ugVW
         IrJ8lqPpbpeQ6LVHdB+3CTQU4l+wIJ2sTG7v7MsVgVIQu3eSucENRHB1+VPt2x32wpK5
         hs94oVEBO+QQ+C3jNpCxsjZNHRqqsJqnDzyWu+NP7mNsh6ALo4AsZQgpSmW0y8RXtzR9
         O3ckPH8ku2shawj4NEULrPujnh9k1p6HKXzNCa/pdZEma1QVQ4OiWWmCnQ+B9XZ4fHBP
         k6TLMorXi2BoKptu93b/r4/n8O9tOUKSNYBwNRRIjVnke7QVYA9EP71uNXxlWlOYOONd
         7TxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeCLjhXVrK7FHpNJbpHWmesJ/bHZKGWDy49iK0+mFGVdSm9HC4fDl9tclBERflVhNFd69IdFlfd5oowCbnrfwF@lists.infradead.org
X-Gm-Message-State: AOJu0YxbSI6GFNcNObnAwtgsQxha2YP4Imm7sTAhlI6NZGN/cPD6KfyL
	yrpZpOmjhlt2gUU/5skYf/1SX7ey9cS9SGOpFkbsoZPxSMeymzSetA7e3HLCqzf9bQ==
X-Gm-Gg: ASbGncurcrbYQKhMzF9znNF87zjYITPZCgcdoMXiFS4JUVp4/ouaVdai0SY4x9MweKl
	QkzIDnKDDJAweo/jpGfsRYdcpwKu738/9EqaZzzh6h9DVmVqPSF9HHUR8AJYwZ/H+KrtpEIQ9zb
	OB7pXYKGw9Y/oFWqHREISu901g7SUJWv34sG+9yUr4KGfjfnhU8mmBXpV0T9IZ+pdW5bDHAF17N
	cJ28kGgHeuag702VlMedskUOOAGOZS3+ioiFPAvMzHBvZN+8KEL/9EwA0TdER/RK3f/XKwbvJlk
	rzPtck956NR6OlqDOYB2Ppstv4VqJhaFF/WwzoYFrwfCOZPz+p0/RjJWsTLd4kVjdiqlnw==
X-Google-Smtp-Source: AGHT+IHDOFs/ZbAzvN7ioQVvaBO3tKspbKCC2PmmEG/e0ea92CY3dBFRoIiyAncqYqaZi3cyXQ2vdQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:f3e1:b8c4 with SMTP id af79cd13be357-7d443944e85mr816887085a.15.1751075615803;
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
Received: from localhost ([2607:fb90:6159:6306:aa35:a456:78ca:2103])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c396sm21861621cf.50.2025.06.27.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] mmc: meson-gx-mmc: add delay during poweroff
Date: Fri, 27 Jun 2025 21:53:28 -0400
Message-Id: <20250628015328.249637-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_185337_534315_1F9D3282 
X-CRM114-Status: GOOD (  11.92  )
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

Regulators controlling the SD card power need some settling time for SD
cards to fully reset from UHS modes. The regulator framework seems to
ignore falling times set in the device tree causing a few boards with the
same hardware implementation to hang on reboot because the SD card still
had some voltage and did not reset properly to be initialized again.

Add a delay sufficiently long for the voltage to drop so that the SD card
can reset properly. Otherwise the reboot will hang at missing SD card
especially with Samsung cards.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/mmc/host/meson-gx-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..a39906079d29 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -605,6 +605,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	case MMC_POWER_OFF:
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
 		mmc_regulator_disable_vqmmc(mmc);
+		msleep(50);
 
 		break;
 
-- 
2.39.5


