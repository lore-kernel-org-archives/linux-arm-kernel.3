Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340C4D0BB7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duITNe75XLdkXVHfqcx4G37ll9Oas4mILkoMai22Wuk=; b=QXbI2y/UpNsLeMZfn6CVkzppXD
	tzZQMDLprhI7iueoMVOU4OT4PcHv+Y4np2IouBz2Y44hIcXJ2fkTX6EoJj4lW0ZQYedh3FbgI1fTr
	aWqqmmuWCrt2o2iXenvlMxpY1CSWwRQROzAPF0gLhC7JYI+0l4rCRUXDhUh4mh9GpX2RTJ1uvy3yB
	KWM/h+LqXbJI5qfYmlObBJYIq/rab5hnuKN7NtqfJYrVABcNuMSrZNdZp3DFZfE/DfbjIExzNfBnE
	C7EvDHmEjkbpPu4OPWoMwAPQoMkSYVXxCeuLSbwKqBtIO7QYNFSg0uuBv3DhTngwKtoiXoQzv7kQw
	b+Yv9mxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tyR-0000000HQYC-2dPQ;
	Thu, 24 Oct 2024 09:17:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ttj-0000000HPN5-3Vjt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d4ba20075so428839f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761170; x=1730365970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duITNe75XLdkXVHfqcx4G37ll9Oas4mILkoMai22Wuk=;
        b=RTx+WgEXjldUORT9LKusVpGSA9J1PZmf2BFJvpZoIbVxXyeLJkf8iQ2ktJOZZc0t1i
         musXNGjxtiHkAusOdg/qGgZ5P9SrOl/wBvj4T48f4Ar3eQVvEgCoqiYA9xDvV3j1JgEo
         Hc6yR5gT4+AppDi/PZ+BrJxKjlZdwBzCxm73gZ/tO0uLzypF8/n/+wZ/A/fSp4YivpJ2
         xoiiqGSQKtW97UmtjvdvvnSp9HCEv9PmuWSybanjqi5/eVaeM8Jr86j4JZW0MOrz8Tea
         3m8hLAYpYT1w4VlUXToCs7dXAWGzuRhgzVkkJNpN0pBElFcnATFgmpVG9w0ju1tqXodC
         JO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761170; x=1730365970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duITNe75XLdkXVHfqcx4G37ll9Oas4mILkoMai22Wuk=;
        b=ngaFLsbJt4e8zYdh6EMKF4vFB9axmKC1uJHe22S1QVHJ3S9UVkI7728GTZzcm0ZjQl
         nY3aUQC2R0dLZREUFXbl74GPagI8fHXait3WyWflZ8z4aUVEXHcGu0ircs9i/0SqYxyM
         u0rbvzng33mD/Ctw5cth9dWJnXFWlLBP1zqtZU8DJhphWXd5v/L/c5rwoWvMN6HT2X+p
         a9x9+2mwK6v5F/FJmPIVJ/MmW79Zf1aOrwUSTAxtuxGvaZK8Jtq2EBZBJVAv7zaLMpzH
         nno492u/DcpjIYbbLSsOciSvT1oVw/rFtp7a1fw/uDB9loaYorZCry5fLhDBwJzZo0Ju
         AIJA==
X-Forwarded-Encrypted: i=1; AJvYcCUolJ1x96WEvcLS/TvD4BMS6isFges1KF4Q5aoIv2jLZCZKUpFkXuSPOlNtpif1XhoPMKEGkU8gqiFlu+E7pV7T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwlj+bm08Hi0Jnr8LMOcNZtSFpSJLE5iG+FKPpaYNpuzO5mmK9
	qnTSEvjY9Fia8bvbPLYC3Qg6riyGuLo310WNEw/p8tLTFpE1sX+beTMFkajQnF0=
X-Google-Smtp-Source: AGHT+IFd+bjGts93b5OuoBtQQABH8NKlASdqk/65SlHR44FOjuSVpR7GA/iovKo4zKUodKx38sL06Q==
X-Received: by 2002:adf:f7c2:0:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-37efcf85335mr3594577f8f.53.1729761169925;
        Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:24 +0200
Subject: [PATCH 2/7] iio: light: ltr390: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-2-7d29e5a31b00@baylibre.com>
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
X-CRM114-CacheID: sfid-20241024_021251_937880_805EBF0F 
X-CRM114-Status: UNSURE (   9.99  )
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
 drivers/iio/light/ltr390.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..ff6b5d8b582b33eba60b769dff529caa00fb7244 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -558,9 +558,6 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
 	struct ltr390_data *data = iio_priv(indio_dev);
 	int ret;
 
-	if (state != 1  && state != 0)
-		return -EINVAL;
-
 	if (state == 0)
 		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
 

-- 
2.47.0


