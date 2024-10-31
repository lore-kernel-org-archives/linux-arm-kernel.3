Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0705D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q6n3vif9yRqdpFEirWIbpqWZyq5PPsTaLuK/TXVuwM=; b=Q/2L7AeSbkapNqlWHVzTdTLB7M
	tpR0SuFXGhytCJAHPp+RehoRLfv0ZoknOuITcI64ZOyGYUovPp5/tH5aiGxXcuu+BN2Gp14B+JXzM
	BRHprv+/1OBoGezY86PMXr621uO5CBi38rNjkomPux6Um3daFXzfO2mCHB/bGC7wBRxfwoWDA30DE
	eehTzUOvQG4/+5UJZB6QV2rRFKmvtk8i4fNMpTJj3AjxA7+emKaNyUzqdGMSY/+FE0huwx2/pjTEp
	qgWDxCg3vLXar0lZSgv48Iry3QpM8d4AloWCEoTvO++JLuB8VGrEQxfWPFDvLBeEd6bZ7jln0OLmq
	9DhZYcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XUD-000000046Ck-3VtX;
	Thu, 31 Oct 2024 15:53:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4o-00000003zEp-2mPy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d49a7207cso770160f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388429; x=1730993229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q6n3vif9yRqdpFEirWIbpqWZyq5PPsTaLuK/TXVuwM=;
        b=e+pa94E1BhHFScB06mycl3RmH8GJu73jdM6AC2oLGolER7legHlDE0DHXSo65qc2+U
         nn43ujFJoX9ZWDX0tUvMJb/7XI7yFaCuulhF0cPWVRjj4nTzoPvzgR62QqnpGGcFy9Jc
         dCbTN6R5I27wq7bK8jVMGjY12Pk3kl+PO/i3QxVIdkwTh8Isjni4iT/aY5CyB3lcfU6c
         gdlbQ48iI0vFXOTc0/QwvCXpUoqpXTameviCvKqnTAC7oueQrIt6yEUyZEEuwW5HzuPi
         MK6FzL5OYxBXnJgepIb5x7m1mSZzvnTnrqeGveb/o5vfp6X/YLAajwG77CotzoOLcLaK
         lkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388429; x=1730993229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q6n3vif9yRqdpFEirWIbpqWZyq5PPsTaLuK/TXVuwM=;
        b=DBsAQbM9xlK180U6jQJkSs4SdKFPgNtWGyFDjM0qboEJgtcKwjxZ3WjebDCMmsOAub
         dR7gL14gr2oKaayHr/UzWdepVIKS+1Bevxe4WJcW8Ff3dNn2zcBaUGdjdFQ7j/FPC7Dh
         kLskT+y0kmK7OoAwif5CIbqp59gAvRWORoT6hCx2lDMwDdqe9HHQ3+wCMnjl7l+y8mIE
         9G2WyFAaJaJbDMdxVOMkhOQsAY3ZWkOb5D9B44moW7U8669beD7cfVds8OEFxG/5c1xz
         eBYvGQp4pxs8Vsw8hWlbYu7h/MZDJvT1PkY/2DUsdHVAAQKm4Kl5Gz3AAfQBj4BHOboV
         Glow==
X-Forwarded-Encrypted: i=1; AJvYcCXx4U4ztKPRSP6+Yde62aVOROQJkeuUfMjSUBVWi2IJmJA/g1sLonDSKmJ3GDC4BISmqTaOvV8Zf36yNCtZQmAj@lists.infradead.org
X-Gm-Message-State: AOJu0YxVOqEglKBnsUC/mRuGyyl2wngeVKHWCMW/Tl2V7A7pbEhUHcLW
	k6xnGADX/TBnflA9LcQkqtSY5j7lYFUlBe7jpdbQDdIq+0jEW1V1yNB/JvyvZ54=
X-Google-Smtp-Source: AGHT+IGaw7tHL795rWp+9Pukkty49eWxvccjSs+5mhazyr072wPwTV8LiZfSVUziuIlxxgcHMJ0lWw==
X-Received: by 2002:a05:6000:1569:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-381c7aa4a56mr334756f8f.42.1730388428718;
        Thu, 31 Oct 2024 08:27:08 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:08 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:26:56 +0100
Subject: [PATCH v2 01/15] iio: light: ltr390: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-1-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082710_735889_563DD87E 
X-CRM114-Status: GOOD (  11.15  )
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
 drivers/iio/light/ltr390.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..3bdffb6360bcbaab4df1a2d39c8ea3813b5d6bd3 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -558,10 +558,7 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
 	struct ltr390_data *data = iio_priv(indio_dev);
 	int ret;
 
-	if (state != 1  && state != 0)
-		return -EINVAL;
-
-	if (state == 0)
+	if (!state)
 		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
 
 	guard(mutex)(&data->lock);

-- 
2.47.0


