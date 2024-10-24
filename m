Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0DED0BB7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdOPmGMXx+g86q2x28kwH3RDTuMEma+ZJf3qhTRWEDw=; b=ZQyUDTFHRKexu7ZyAaG7n46e/k
	DxD/hoH7wiFlCQyIaeyIQFPO+GtmhQl8EIlbTTJIxH1RoURbLDY6H7sVsb29d7QJ5tE4wWBs323wq
	g2DUz1IpKJWAu5De7acZXOZaG83nMawXQreAoI76YvC8nv864kgjnAG2qAz1SYUCnshjn5OhXFqBi
	HztnrO0DOHkQ3Jb91Hk542n8QX8xrSBIM54XyFPX97VNcJwVDdEvjHLc33U6/58D0G6e4VTAlcbTT
	y8LPFsGhMs/vXVYq8rDX1QhEXKG+HELM014ep0dR3cwQ1r956easp4r5w22ExaANmy/9aqR2wXIgY
	/kj7MXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tzx-0000000HQjJ-248l;
	Thu, 24 Oct 2024 09:19:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ttk-0000000HPNw-2j5Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so556024f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761171; x=1730365971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdOPmGMXx+g86q2x28kwH3RDTuMEma+ZJf3qhTRWEDw=;
        b=M0O/eydfmVgrValfvrNOrD6iC57KxhD9hlMBqzQbpbCecVBG3jU3zDwhgbSuSpmOxD
         1Q5MU53B0mqf20SKMTu99shJixzc2BrFZ+Y7eq3t4DOTXx+Ef0SKrI3gX2SxnCN9DTPH
         IirO5T1hfNpX9Hxak9fAvywkY6bro2v2rSkYCEkneIiO2BPDM5Dl35+fH1gRCyD8iIJg
         IeA9UijMCgOX/L2ecKsem2lPymLnhV+J29pyZKX6sbTEPCqMgdXBW3J8CLTxds0cP+2h
         sWECAbBffe8M5GiB/HepMvniS32ZcFv1xHHxr0eDuMKlFpw+5Nz+gqamHEC8qo8g7NVA
         inxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761171; x=1730365971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdOPmGMXx+g86q2x28kwH3RDTuMEma+ZJf3qhTRWEDw=;
        b=EnaLEFFdb9cacJaftfC+utCrP/BE9cHVUHh1nAYomWJGKBpuIrqLEuVmxiOnVhtwyY
         bjnZ3RyV5WDE+z3ez9QiodwdyzEKZi3HtmNgveYHRbddCZFbPMc3M+/cPMuMzBIjfD87
         L03MrFauGBBqeD1Rqy6yDQRo8H5jJjLCPIg6Sf7iWbPFd90bDMVRbshiHAzOtjk3Mm4x
         M+UyNtGIBKa2a3BQwVn6UD0/kPkgM/sbjQkzB6umLPhYH3PGjTkViqfn1pLJhLSYs8N3
         LDm6Bc86X7NzjpfedSSMh3xgbSLxmXwXhXAMvsqAlBVmDR75N9rPqgaR29V/De1xKylI
         3zwA==
X-Forwarded-Encrypted: i=1; AJvYcCXEcUmYLzCp1SFAuCMjiObqM+Flu1mTtWZCSwMvwlpS2MdwToYG/EV/YNOk/iIFZJf1OXIfUcMKdP7AJ7kNrlx1@lists.infradead.org
X-Gm-Message-State: AOJu0YzoikPqDcnIPp6RjIjS8syGMyisrYRTreTSGYk2FjEuQ5q48sOR
	83fp4Yy3GYwWHRHH/VtEXxoRfE86Sl097cAu6vvSO9A0rnj6cCxQmvanLcBKPRw=
X-Google-Smtp-Source: AGHT+IEJMo4HXjFBb2HAgz0IHf1OOTvuQTF5X6gInGGPV/HyBWXnP/yzVC8dnCAhyj14nu5bNPIoqQ==
X-Received: by 2002:a5d:5747:0:b0:37d:48f2:e749 with SMTP id ffacd0b85a97d-37efcee8c46mr4654386f8f.10.1729761170851;
        Thu, 24 Oct 2024 02:12:50 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:50 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:25 +0200
Subject: [PATCH 3/7] iio: light: ltr501: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-3-7d29e5a31b00@baylibre.com>
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
X-CRM114-CacheID: sfid-20241024_021252_725894_C124900F 
X-CRM114-Status: GOOD (  11.30  )
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
 drivers/iio/light/ltr501.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 8c516ede911619bb4ee8f8a823f242b7aaa6af55..42daebd6023456098dc4bcedc3fe3a45f9ae5be0 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -1083,10 +1083,6 @@ static int ltr501_write_event_config(struct iio_dev *indio_dev,
 	struct ltr501_data *data = iio_priv(indio_dev);
 	int ret;
 
-	/* only 1 and 0 are valid inputs */
-	if (state != 1  && state != 0)
-		return -EINVAL;
-
 	switch (chan->type) {
 	case IIO_INTENSITY:
 		mutex_lock(&data->lock_als);

-- 
2.47.0


