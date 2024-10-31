Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F675D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynbTz0mAIREWX9DSd8GtfjNx2HTiawNK3KErRQuBlPE=; b=0YZI2dXCNO+2dS8z4YpZkqQDUK
	GTEvPPXpczvPXIFSlnkWsN2IqOA1NfTaRaDBHz+odDD2d8ONcqhVNrbohUv/a38Uupz4GEr2PtO8g
	T5ahdvFNbjOkgsBlbap+Lod5U/Eot/K/Xz6pGOmtwfwNNKZt0glEJTLOLsT8MzIzcFne9qIa0etP2
	wRgenUFNNS0aO+1vM3ZWXy2qCzdKNulvof6z9M6axr19k/UxU5lwteyGr9M8tjWwBU05pf7vOYDDN
	5ljjFqQx/f2KpvLHFEdslfFzMpz3RK7nA5w/IMEzVazlTT+SQPYzKp3X3CUXUdSfUurWjzp2SF+Xk
	wV0bSJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Xe2-000000047kJ-18ng;
	Thu, 31 Oct 2024 16:03:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4t-00000003zFk-2ESp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so9521465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388433; x=1730993233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynbTz0mAIREWX9DSd8GtfjNx2HTiawNK3KErRQuBlPE=;
        b=qiNNVRMMpPpwtWaIXsTP0lgr39RJ6YjpOo4m7crYNb5+Zd4rCX1pI+maUr3UirWiCC
         8dj9hro5NLG0fO/vqh+VZeSmMtytB9FQ/wFNFV+VktnJ6dN3cmMXg4NH0NsoXCq59e0U
         H9WccerEekUzAkSS3jct2i88D7hS592lRGT8TL3xlIvGbQO4ebpg1QTiVmzhco7fJKJs
         8FCt88m9KxL2gUfORDdZDqkOEfcYJ1MS5ubyckds4ZI+mAZ5zl32dsXbnzN2ogaHvpTk
         CX75m1vAuhJijeYtC4Ls0hpMQoaam/BQd/IeLCMgsBvMoCq8gPLTXZtShyGwBjZ1VWts
         0Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388433; x=1730993233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynbTz0mAIREWX9DSd8GtfjNx2HTiawNK3KErRQuBlPE=;
        b=ILqG3lYeTiVw5AgMCWuP2Pl/gRHjYHyvlznSuGvlT3fB3GQAx72qPxU97PSrxLwxqV
         rg+JAuORPe2ow58NmTj7W0RKMwKJkR3OIvyRHxtr7t+mMT26CmIAJkz7zxyHHh0jMrhU
         bOlO48wuuXp7GD5wZ91eUY2makrfaaccbvFUwIxSL0uqMR52yd2HTMgtUkj8TYwhAzwF
         arkOZb1cCx5oKB8ouo/BVnFJycAiY2DnWQZFOnY1sEplbhaxBnHOck4tpjmPprusmgdU
         a9qGJxbUzGqrSzM1wPTBU5K92nSlDjIvhw1V3X8f4PYjrjw31u0434qB1FTaWpY8NgUi
         MtQw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZ+wf8l/D6mzF8NN+kG7uOYty1avUQrXkzggBSkfbNVU+F6Dt11Oxt46KkLY9ghDda4hYsiZxiSPMtCcpt+Ox@lists.infradead.org
X-Gm-Message-State: AOJu0YxkC3X5uKPWsAwfn5j71OgD7dpY6PYGmSeoku7uBmODtbfJ0DPw
	03VHQ+KeWRKV/GlrVmk/74WHoVX5iXtHczhbB53q8iQhUcUHpSZu1kPey8OUsPI=
X-Google-Smtp-Source: AGHT+IFcDhwM/WUu2euAD7a6xckHNF1ZKNFT/G1Ed5VwyVng6DCbMufZzTDi7LNt16ADIplrfYs/Hg==
X-Received: by 2002:a05:600c:4f04:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-4327b6f9574mr33906995e9.1.1730388432612;
        Thu, 31 Oct 2024 08:27:12 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:12 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:00 +0100
Subject: [PATCH v2 05/15] iio: proximity: sx9500: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-5-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082715_618471_79B1866B 
X-CRM114-Status: GOOD (  12.52  )
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
 drivers/iio/proximity/sx9500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx9500.c
index 3f4eace05cfc6a4679fe82854dc059aa4a710d6d..e3da709424d5b2bd4e746df7adc4a4969e62f2a6 100644
--- a/drivers/iio/proximity/sx9500.c
+++ b/drivers/iio/proximity/sx9500.c
@@ -551,7 +551,7 @@ static int sx9500_write_event_config(struct iio_dev *indio_dev,
 
 	mutex_lock(&data->mutex);
 
-	if (state == 1) {
+	if (state) {
 		ret = sx9500_inc_chan_users(data, chan->channel);
 		if (ret < 0)
 			goto out_unlock;
@@ -571,7 +571,7 @@ static int sx9500_write_event_config(struct iio_dev *indio_dev,
 	goto out_unlock;
 
 out_undo_chan:
-	if (state == 1)
+	if (state)
 		sx9500_dec_chan_users(data, chan->channel);
 	else
 		sx9500_inc_chan_users(data, chan->channel);

-- 
2.47.0


