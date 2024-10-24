Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10AAD0BB7D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ExSlIGvQ1qKjNeppy5CslHA0+Ug61+8Wg56jV+Rbdo=; b=GtYeDt4HQ1TV1Ce0/0B7W/YQ09
	5fclLjlSskBKbg7vdUwjU3R/cnuhhVNaeBeU0hnuRZq0ADTjUNXqs4h5vkLuAYW/nVs3MnBA9fUHC
	yawFXkcLjM4phd7V2zh9eBqA93ovLxjw+Hnc6OV08CKQo+vcNqK2emdMPeTrj6OyLNb8JlHfrlQBA
	4exnPuRVZtW6GYpVFbae8TqdtzPqk1PD439b6aeUhc+tIaq7PVtYoXM+foWXVZ+I9FtFWitE7/y9F
	J7ftdu/3eux13ByWd1FYxgdQmhQ3nA0eCA6mlWO4+lqzZh/sKWFjEdwQEHZJ9KWZTNX2ibRYAIq1V
	KRsAcQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u4V-0000000HRQZ-3m1n;
	Thu, 24 Oct 2024 09:24:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ttn-0000000HPQ1-3eml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so407338f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761174; x=1730365974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ExSlIGvQ1qKjNeppy5CslHA0+Ug61+8Wg56jV+Rbdo=;
        b=Nj3Npw3MBia2buvkk/fxCuICjpC7w+zgtBbx3zaVBw6Jw6SQKOR2/+9msNcYi/yGKY
         ZeEI4ks5GrdeVmP9utoOHwj1queYOlYda7oi3do5sW9qPZZEBN0uEOXAOAwZjiOljSD6
         3BvOHXAT8by44OBiz1iocmauBgO4ysDQ5CToIPfblxIf0AiVBfd+CfdvO2tANRXQvzRz
         5y+rDoMrpL4N3IZK9HnR6Kif0Fb0w9MS0/98Xhe2ltoR6QE3gCKhj3X0C1EQV3l9KMbF
         QOMECAVnbM4GpQCBrUJgnGmaHRyqDsg2b7Fc1ZQe8HkvO6Eog496Cg22xftwVf3cSHuw
         uKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761174; x=1730365974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ExSlIGvQ1qKjNeppy5CslHA0+Ug61+8Wg56jV+Rbdo=;
        b=uLAdhejIcALBwHCe4FXZ8Mpltk24DFu5XG4jraR3WuzjBrjsR7Wnfodhrnukqa8CJ1
         NPgZUy5LWwBcLyosJ5zDIvm1C51G3qqscsMUOGmU1c9YDngdQAnWwat1mKn2dXhWyIin
         qntKW7Ac6tosu9QW3XYthPAvZkYHUmGvTvQOIzoH5/u4m6wbdQSF7iLTapkHHOnZ3N3u
         VUpRMO9sFeCJfkjvggy4Xo99awJhlejvf+Fy7/ptSIgsSlJ4RdF0pePOzR05qz7X7Pck
         IRrHzkxqh1cg3gzxCK+lRMAjrQS69JuZFrrUU/jC+47Rbnbs9puswSK7tBMrfZiBEzWd
         P1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQsRPkYIEi3zoXATf1V/Z6gGMMf0nNZ27I6FqPpJa4gEwkbkfI1xTh2qE9h+4RJb/pHdvDvbYMIbitNB5e1v+M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BLEdUrQZw1puUKkCVC80MrumVFU3eICyigp7evZs1Y9Vq7Om
	slmpyoOJLYA4rhnHEx2H3dFEqCByI0s9PCvEueFzdWfNM256I01YOCOyxiTuOGk=
X-Google-Smtp-Source: AGHT+IHssIn5+2M6/mPZQxU0hUVx3UQF3gcvmL8dKPbUHqhz4gdaCpTX+p1XSijdvMnFvDxT9HuOTQ==
X-Received: by 2002:a5d:66c7:0:b0:37d:50f8:a7f4 with SMTP id ffacd0b85a97d-380458f3f6bmr784047f8f.52.1729761173970;
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:28 +0200
Subject: [PATCH 6/7] iio: light: stk3310: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-6-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
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
X-CRM114-CacheID: sfid-20241024_021255_956134_DA01DCE3 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/stk3310.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index ed20b67145463d253a0dff28a4c1c3e02e710319..c6f950af5afa0f77a617bd2baf0a08eef5ec26f0 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -330,9 +330,6 @@ static int stk3310_write_event_config(struct iio_dev *indio_dev,
 	struct stk3310_data *data = iio_priv(indio_dev);
 	struct i2c_client *client = data->client;
 
-	if (state < 0 || state > 7)
-		return -EINVAL;
-
 	/* Set INT_PS value */
 	mutex_lock(&data->lock);
 	ret = regmap_field_write(data->reg_int_ps, state);

-- 
2.47.0


