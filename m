Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17F7D767DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFsb0303PjNI48V2V72P3jKH8c+L4bxDvzzJkb075Z8=; b=U7A2QPOmwMmJUsa1OLM35YgLCU
	epnCX1Z38nb9wcz0nXGRjaHTqbyjwXDDGrbVGAGh7u9/NqPJF9lNJF+olVDbxWo5PtrqOdYszOBed
	6khwXdezbltu7jmTND5ujZot8EooIYNSpPRvdjACP+DyBYeI0KL9s3GIJPy+A+7Is5XQ5yzCNNwNg
	+Ul2Fyjzlz6tw0XajGZ9MglDUDeqY63LsRpAcmurx/iEeQfOZCrMgr4u2RHId39lGJs0oIQKl6+Xw
	Btycg/sDfXjjbwgDoZAnRZAPN9Q28PzbuC5Ym0+zhLqtKNmiwL+kWdHpRjKPYt1ZIvzFBlE55HCMM
	nuvOBwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Xkd-000000048m8-1FUO;
	Thu, 31 Oct 2024 16:10:23 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4x-00000003zHx-3nJN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:21 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1153345e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388438; x=1730993238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFsb0303PjNI48V2V72P3jKH8c+L4bxDvzzJkb075Z8=;
        b=BkTGB9UOupnL7zaUwf75zUVnNIDRNQcbfoVre2lTJSK8KUGNFwvqvlR44Wx8tlChig
         o3qyBZtAq/O+BUai/6ZAcrKvIlN3B3iJwaQvCGkGMPrrnayBg/s+AZcePcPdFdugk01u
         BgcS1kz8adAle+5YjLJhHGyNRTla6Ip27qzfPvsodcBoCY4jNqyz0BkHZXJH3k5WCceF
         m5P51Fq4tKUt+gahbMmt9Nfe9NjNgp80tdXPMdGVMaotetGh7nJ1s8+Vf/wg8o1c5s+p
         tY3XbZAL3mm+oY4N8e+R6bcMuA7vhRDqW36nq5cY0F5IyiXZZXafZjnoj/7voW0sWZ+o
         lMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388438; x=1730993238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFsb0303PjNI48V2V72P3jKH8c+L4bxDvzzJkb075Z8=;
        b=vtOvYeAA84nHFFx636rnLJ0lBG7jAspwt/V5ZcP4Gwa6K9LoQ4S2UOi//vGSBIydLT
         vDVTOfdAsp9d7gs1N2SFgfQnhCdiDrWf56nMk0Uk4McZAqGJRnrZEourjgHbd5xpjocD
         ReXUIoi2OPr9EaaQi3kihTQn6FjyK4+5CglyhqWYnHvLRKa/3zl4/CXoKFQcoXG9lXXr
         mbPrstRqw1yyIAQuwsOU5JYj50UeSY4OHSC5ISb05osWFsj/WEh9K9ryWdrPFbTO+7aR
         SXFtlvB73UJUJ654jOSTIst3DUyYp1MKd+npjt/KsijH8ctYjPY7SOGOQc9eSiJdCYof
         2H+A==
X-Forwarded-Encrypted: i=1; AJvYcCWuHIQnzRTECeyZbAOIUmyHfM6SdTl6/kaVLV8ktrbBUXMfnwlaSz2dhdBhpZFvxwV37j7k/QvFg4FMaKWX2Kex@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3JKLlO38wyEgpg08w+AwKyYvgZO/rrojzK3a71LYu4SNNFFG9
	suuS7B6OPmPWRM72ZB2yocoxe6pPR8Ym80ndnNMzf28ISfqSBFTX296Lrf4aMd0=
X-Google-Smtp-Source: AGHT+IGZJyt5pS0YUa3i9kFlv6G7+rYaLlulmcGcSn6EUiy6VmRiBhyhHkSniuvcZZRqwpxExeJiyg==
X-Received: by 2002:a05:6512:1255:b0:539:dca9:19a2 with SMTP id 2adb3069b0e04-53b3491c152mr9322585e87.39.1730388437575;
        Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:05 +0100
Subject: [PATCH v2 10/15] iio: imu: bmi323: use bool for event state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-10-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_082719_984003_74ACE74A 
X-CRM114-Status: GOOD (  11.16  )
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

Since the write_event_config callback now uses a bool for the state
parameter, update the signatures of the functions it calls accordingly.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/bmi323/bmi323_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
index 76a88e1ccc1d89988eb52d6b1be8da0f5005f0e6..161bb1d2e761688dd740635f8a2830e9562d1b59 100644
--- a/drivers/iio/imu/bmi323/bmi323_core.c
+++ b/drivers/iio/imu/bmi323/bmi323_core.c
@@ -467,7 +467,7 @@ static int bmi323_feature_engine_events(struct bmi323_data *data,
 			    BMI323_FEAT_IO_STATUS_MSK);
 }
 
-static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
+static int bmi323_step_wtrmrk_en(struct bmi323_data *data, bool state)
 {
 	enum bmi323_irq_pin step_irq;
 	int ret;
@@ -484,7 +484,7 @@ static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
 	ret = bmi323_update_ext_reg(data, BMI323_STEP_SC1_REG,
 				    BMI323_STEP_SC1_WTRMRK_MSK,
 				    FIELD_PREP(BMI323_STEP_SC1_WTRMRK_MSK,
-					       state ? 1 : 0));
+					       state));
 	if (ret)
 		return ret;
 
@@ -506,7 +506,7 @@ static int bmi323_motion_config_reg(enum iio_event_direction dir)
 }
 
 static int bmi323_motion_event_en(struct bmi323_data *data,
-				  enum iio_event_direction dir, int state)
+				  enum iio_event_direction dir, bool state)
 {
 	unsigned int state_value = state ? BMI323_FEAT_XYZ_MSK : 0;
 	int config, ret, msk, raw, field_value;
@@ -570,7 +570,7 @@ static int bmi323_motion_event_en(struct bmi323_data *data,
 }
 
 static int bmi323_tap_event_en(struct bmi323_data *data,
-			       enum iio_event_direction dir, int state)
+			       enum iio_event_direction dir, bool state)
 {
 	enum bmi323_irq_pin tap_irq;
 	int ret, tap_enabled;

-- 
2.47.0


