Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C83D767DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGlZIwMvz6c7bRFXG/zclkCMmlIDWe/JH5j5KVgG3hQ=; b=gN7/qIYF2GQdANb69lKxj6vNSM
	6aqmndjhg7fXPvvaLCrbGtngDj1tBAZ5HekMC61fzVdwAgLToV2MarMIJmvNenkv8sYVNJH28BbqP
	sTzvSm7b4CQHmbp7QnfBL5bj7x9jY4RKoXKg0/Wi1sNUCW+fJ+P/VJ4Lc7FaQY8jAOlpOHNQN+ygE
	59rDH17iP0X4ekM40hAMoIXh/A/sSe4GGnVYNAExEr4QIgC0ILT0rCyCBbruK95cLzMyvLQzfzYJa
	aABmN2m2uL4J3ooVS9SlFf/EZ/DZ/1cLi99bzg5rPUUP8VIqdmjiG7GHOdEni/s6CUPjgu34+QVSf
	sLxzzRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Xfk-00000004860-1NKw;
	Thu, 31 Oct 2024 16:05:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4v-00000003zHB-1MTE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so8583765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388436; x=1730993236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGlZIwMvz6c7bRFXG/zclkCMmlIDWe/JH5j5KVgG3hQ=;
        b=yjsxM6J5y0x/+bE6j62Q/lbVSoEkhfe+35sVafiMpSPV+ESIHHjU+lyj8Xp0AjKtoU
         RbgcQRA6KXhUNz4ftNrfA4WWknxbFiK1Ps5/CqNFooxUcR728NhwnpsvrdDk2c0ACMMu
         F8oNF/SMR6JhoR0+Tjqs2Yvk687HgoDbfjPZxqdLWVBTSz57TD7LcX5EanQqyeHhs9a4
         MRDd0TR+jAtyXerVJsVyZSwKy0Dk06ZXrnl/LBL5U/0EdezLZKWDFACKSPzoXwgHzJ1C
         iyIwNgsGxyG4iJK54xaJTlGO5pzYJxqwTfx7UEI4EF3SL2iRAAJM+s8XBM0sOR0Xqmk2
         6M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388436; x=1730993236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGlZIwMvz6c7bRFXG/zclkCMmlIDWe/JH5j5KVgG3hQ=;
        b=h8PFjjqa0ALKGLsxLwpNFGbi8sZ8emh1kQZ52EiOzlWagKwp+OabvHRodU+bhq+abQ
         Kw+MHZhr6nbzqAne/SUpn2z2wFBDtsSwIUh3W+owpLGODlS8b9M90G8bTodOCVJbpOHc
         3Y2v6e+RijH+bofIt9FWUV51P+JTe+tX+DlQHf/MTJ4HrggcF0+0E2V1wJ9EMkdL8gz1
         9BiEtManwVWU+iJaRBl8LAFr/ezJvAEW5SwVtWbuqzS3B7so3SvD+ck50Ft3zYmkFD34
         clbfP0x9ILJdig50hqB3MDpV2qMCOm+MoygHSNzZW5qe7Yek0CdY0GsOP/+IjTLEM/Fd
         Y7kA==
X-Forwarded-Encrypted: i=1; AJvYcCUqRf/TilfFxW6pzk51afJ92ilkywSuiknI9kqwbp/lH5M4cuJByXn8hUfvINYw/rxqb5Sj7uurJgKfH6aRFxuz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8TlGiXqwnzrgAZNJhXrp5MTZN2AnwleViyEprO++nD6y5upL8
	iTmcI+2rDyZ7cQmB+3TQttlGpyHmeaa43UMsiuPhMQ+AEMElDrGN5eayIre0yYs=
X-Google-Smtp-Source: AGHT+IHlxC61R96I9SqIUQT7uQ6GYz6mwcgP7vSir2EsAglaq5XnaVblxKW0wQCsPc9q6MdamJ1CIQ==
X-Received: by 2002:a05:600c:458f:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-4327a82f755mr47859695e9.18.1730388435648;
        Thu, 31 Oct 2024 08:27:15 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:15 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:03 +0100
Subject: [PATCH v2 08/15] iio: accel: mma9551: use bool for event state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-8-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082717_414558_DDAE754E 
X-CRM114-Status: GOOD (  14.14  )
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
parameter, update the signature of the function it calls accordingly,
and use a bool array for event_enabled.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/accel/mma9551.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
index 605022f5239a6412827f4ba059aa18d490908720..6d73eec951263956f314f82542becbbae933de91 100644
--- a/drivers/iio/accel/mma9551.c
+++ b/drivers/iio/accel/mma9551.c
@@ -45,7 +45,7 @@ enum mma9551_tilt_axis {
 struct mma9551_data {
 	struct i2c_client *client;
 	struct mutex mutex;
-	int event_enabled[3];
+	bool event_enabled[3];
 	int irqs[MMA9551_GPIO_COUNT];
 };
 
@@ -162,7 +162,7 @@ static int mma9551_read_event_config(struct iio_dev *indio_dev,
 
 static int mma9551_config_incli_event(struct iio_dev *indio_dev,
 				      enum iio_modifier axis,
-				      int state)
+				      bool state)
 {
 	struct mma9551_data *data = iio_priv(indio_dev);
 	enum mma9551_tilt_axis mma_axis;
@@ -174,7 +174,7 @@ static int mma9551_config_incli_event(struct iio_dev *indio_dev,
 	if (data->event_enabled[mma_axis] == state)
 		return 0;
 
-	if (state == 0) {
+	if (!state) {
 		ret = mma9551_gpio_config(data->client,
 					  (enum mma9551_gpio_pin)mma_axis,
 					  MMA9551_APPID_NONE, 0, 0);

-- 
2.47.0


