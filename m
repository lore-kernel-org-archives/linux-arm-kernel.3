Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B7ED767DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91AV8uDRorYbhW21+smtHmhnNIXchkEJXBaZcxgDOnE=; b=RR+pJW7n0ANwRBgmktKuQEN8T8
	nIV5h7DK6N/4eYk4qQPmeJYlJh7lc4KC7AnrR/Pc2TQnVIxms8qVo+cFR9h8cuEcdIzmlwhicz5zL
	OW+eipAqKrKNE/DEqfRFE8GG2g9px/KXq7joPz4ZZemN+jEmtlNK6IFH63KE4fRbo8NJobBo279RT
	6y2PXku694fNTFWLvvRSxQ9cZS21JOiu7FZ6QVG4l3BAIRTVAvv/tugKlvUgOy+xo1WtNJ3/Ot2Wn
	rslc/84OVAuiVRownNbIha/qPXzwsbxLv1EAqmw0inROFT4cFNAnGMrCQwosO+MILi+sboNLrmbJv
	WXYk4R+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Xj0-000000048Yx-2Gq8;
	Thu, 31 Oct 2024 16:08:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4w-00000003zHa-1zeA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so780042f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388436; x=1730993236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91AV8uDRorYbhW21+smtHmhnNIXchkEJXBaZcxgDOnE=;
        b=vdi4yLhXZiHyFKX7Pqug6JqzazIbnJ3Zf5rjB5xMRbg7+nntUHmVPpYPFgNL0Rw2sj
         2v4g71ulnYHGq8vD+v04lFE7K79pAeEW/fbZ3wOz7jQdWFdpzq8YHJm8RL8DlZYDettp
         j+fd5aHIzHitI+DBax+e9GmDqmu+xvGeAeisrmoScNTx6pbZRPVoOoDU6LaKF17nm/Pf
         KMQwsIl5sk+T8bYKyQ4F4lEsWZCGrQikuamlmimM8w6hBuZpmyQjVfqgOYJ+ENZHXaGP
         po/5mSdi5CAGbN2fdhnvDmgzEWdRVt55hXI7w5w+OSuc7YUR+Nq6GrMbh9MY9qts8CW2
         lxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388436; x=1730993236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91AV8uDRorYbhW21+smtHmhnNIXchkEJXBaZcxgDOnE=;
        b=ajdMbrKZxpvEaZo23BrcM3Zo/mT+DXyWd0tkJsBzeyghY4/SZ4S6om5SqEkGOrlEww
         UVuYCpBlbjyHZY4Ns1wQPQKO7hZPPOuk1rrjwmvK/PHtCtFhzjPJz8p6fTPSbXGUakJR
         abTJk/pFbTQLbHrw/LFL4q/cDGQqv6CWlnYE/MvpIiEZqVHexAr8WuylCaZuI/+9YdsX
         jKEF8dGrJpZQN+lDp2jaUaCSW29rIV4Wa6Bibdqhe4Ohwar1tUxFlxCOBmck6P7diCZg
         1UmwrXmElOccp69345dRLuFmQJzKlxq+O0i6Fp+TGhLBHqJ2NNcLEAJU7G8aqlN6Jdl0
         dSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuJBfqaO6BQjfu3R2+3D3sI3V4ZOE+fczxDs4CzlGs4HW0nT527pU0odBGOBLmfPhkn0euPtKBRfqru1oQun1w@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRpxktxCcfA5DWOb7sghRs/CzD7I3hMf5RWNvVLr21CHCXuqC
	njXBauu8JsAAC0jtHyfzaaMgBSYWQntJg6d1jXxw2ru4hkPgh7oi/vLeib+tOMA=
X-Google-Smtp-Source: AGHT+IF/NKLNlGsRd/1UMFl9TQ3C8cdSO5qCxZ9mwQG+PgwUSTDjp5JjuM36PcnisykqTLYhpsYWjA==
X-Received: by 2002:a05:6000:4006:b0:37d:3171:f2d4 with SMTP id ffacd0b85a97d-381bea1c0f9mr3497430f8f.43.1730388436559;
        Thu, 31 Oct 2024 08:27:16 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:04 +0100
Subject: [PATCH v2 09/15] iio: accel: sca3000: use bool for event state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-9-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082718_551970_5F615CB2 
X-CRM114-Status: GOOD (  12.22  )
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
 drivers/iio/accel/sca3000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
index 36cbfcbba04d6920ba68bebd70d21bc3898a044d..3fb0f386c3db603714a746c28be36ee78d1b2a6a 100644
--- a/drivers/iio/accel/sca3000.c
+++ b/drivers/iio/accel/sca3000.c
@@ -1158,7 +1158,7 @@ static int sca3000_read_event_config(struct iio_dev *indio_dev,
 	return ret;
 }
 
-static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
+static int sca3000_freefall_set_state(struct iio_dev *indio_dev, bool state)
 {
 	struct sca3000_state *st = iio_priv(indio_dev);
 	int ret;
@@ -1181,7 +1181,7 @@ static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
 }
 
 static int sca3000_motion_detect_set_state(struct iio_dev *indio_dev, int axis,
-					   int state)
+					   bool state)
 {
 	struct sca3000_state *st = iio_priv(indio_dev);
 	int ret, ctrlval;

-- 
2.47.0


