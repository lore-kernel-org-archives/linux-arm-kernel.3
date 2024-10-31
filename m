Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBF9D767DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeXr3qZeoMT4Q41ImmT91MFFoZboqwE1uhQTfbeavwY=; b=TsIyGtTvW8+EhnWIC69w8mM4Fs
	EM2Tl8i+4YOoPvdgeW6bInUr6X+SPe84fzWQEwSg32DcTNr6sAEsz4r1Oz8vny074TO/vBGdBJkle
	exvUNxm5fwLPYxWqMZ9FMVEAlTIncXrAQ7s3ghzKBek0H/Cy7lUvGWii36GsjLdLx7dN0aGthp69H
	edohkkRod+gv4aHup5jp0d9m+WezF6IEOCr/GMuvBI0a0jIxYX9X0wMmNbW1XC5RzD/i4hjzHHDuW
	S8yIvGdVLWWSsDM6ISEL99XndyLjS8kmic2Zobzo0gsYyIDZwH7NZZrD7gnTnZCGOwIYVZM8fCzJ1
	mS+wv4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XcP-000000047XA-2Z7q;
	Thu, 31 Oct 2024 16:01:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4t-00000003zGL-176Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso11531555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388433; x=1730993233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeXr3qZeoMT4Q41ImmT91MFFoZboqwE1uhQTfbeavwY=;
        b=cphGEWICxlV76pV+QgcnxfQU+KVkz/UZI/DW372IHNDGQmmHgoJ01Ldko7MO8tG0z2
         DW11sHnRfI720Gco/eK9LW9W+Et1lEghz/Bac2bG+sQJ9G2IdfFaCjteq+pv/vNxTTHz
         Or4Ib8WZso3bmZEInsZuqpyf5VYWerIbkR9siWYi6WOnb0/4j6CD5jVAA+ozZkG7lOnn
         NUguNAexOUcnNC6n+T3E4xYweVN+7pPQCyynct8GPIUVJMGAkBWgfzI5u1IUH2+U9TTr
         q72YcLv6iQbLvx22uM1u0qP/gbSHDdB7yTH2J7wxFZgGayQNXr+8+yADcLjpdcjGcul2
         eCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388433; x=1730993233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeXr3qZeoMT4Q41ImmT91MFFoZboqwE1uhQTfbeavwY=;
        b=SyoKRRAvqmMhoJrexKbJA+gbw7gg/wQOW3Ya/1UToJJ53U4tOpnR5AR/XKaF0ULVwt
         KbK4TWvntsFYOpBpVIefKWQB9YNY+1ckBKc77RvQiT710vXHlJeBejxMEFyLuIyTOvvK
         MapoGe1SrYiYF5KUeMXKniIjUliJ7A/czdov1+5dyQhRJxwVmsYQiUP7COCnfw2dvoxy
         C33RguDTydY/8FhOuzuJNLdOm1QfVF4TgrjORNJ03lTRqDtuTav4BDt4Z4etoHBM/nts
         6ML5gBONWqCzqRDWeoVOSgN2uTnYYjBLOM7hiPb8hO2mFdbrAEkuz3Jc/I+wRqJjedAP
         bGjA==
X-Forwarded-Encrypted: i=1; AJvYcCX8NkjvgS5jlMRLXC7JSQ5EHWXfHLSo/2i9J3s2FVUqHXd4eKo7q8mSAjwEmazu9alT7hYhu89UiihO5koyAhKL@lists.infradead.org
X-Gm-Message-State: AOJu0YyoUNx3onNkeQ7EmZQu/x32zV6Q4Lu21+/NHutBjCceep0R75hu
	1RQm2cF9ivEo7HP/qBKxYQ4BMBBo2NOruGvG4jC/uo6KlTDQGlmG9a3lmrs2lxM=
X-Google-Smtp-Source: AGHT+IHhKXOtU6WrItuY3dPBqGFS+YCmx9LFZrBINQBT3KJgqU4GZtX+T26R8f/M/h9JuV4y1clo3w==
X-Received: by 2002:a05:600c:5486:b0:431:52cc:877a with SMTP id 5b1f17b1804b1-43283296066mr2433515e9.34.1730388433589;
        Thu, 31 Oct 2024 08:27:13 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:01 +0100
Subject: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082715_341780_36351642 
X-CRM114-Status: GOOD (  12.54  )
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

state parameter is currently an int, but it is actually a boolean.
iio_ev_state_store is actually using kstrtobool to check user input,
then gives the converted boolean value to write_event_config.  The code
in adux1020_write_event_config re-uses state parameter to store an
integer value. To prepare for updating the write_event_config signature
to use a boolean for state, introduce a new local int variable.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/adux1020.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5d1aba08a73ce18c367e 100644
--- a/drivers/iio/light/adux1020.c
+++ b/drivers/iio/light/adux1020.c
@@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
 				       enum iio_event_direction dir, int state)
 {
 	struct adux1020_data *data = iio_priv(indio_dev);
-	int ret, mask;
+	int ret, mask, val;
 
 	mutex_lock(&data->lock);
 
@@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
 			mask = ADUX1020_PROX_OFF1_INT;
 
 		if (state)
-			state = 0;
+			val = 0;
 		else
-			state = mask;
+			val = mask;
 
 		ret = regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
-					 mask, state);
+					 mask, val);
 		if (ret < 0)
 			goto fail;
 

-- 
2.47.0


