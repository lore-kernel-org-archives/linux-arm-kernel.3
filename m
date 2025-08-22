Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE9CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=; b=UjsCmVChbYXkPLgACFzxXzVeXw
	5G4+1L/mSqMxULimwIOSO6LbXR9UNRFHvNTN5e8u7+eyLN3A4iaUGiHQ68n4plsCpC21IrE3wdlQS
	NARmw38SKJdOGy2weRJM6GB8wk9Bo1HTYaqVRMAEg2wyE3VmcYAxGkPraUJeL0uyyYHHjhQHWEnGD
	D8/540+e+FcaSWZpo4c//W7A5l46OLAcPs9K3+9h0hMq/YRxjZ68rzUxZCo4O7a/diGhvz4MTSDDv
	ofnzEQO5Kqch3ycgnzzkdzFc0IfLX2eNWlwZvy0JtuTvWarrHaIBBZ+w5LbXN/AjiwWqcat6/o2ni
	90vzgyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyK-00000002Ukt-0VkV;
	Fri, 22 Aug 2025 12:34:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIoC-00000001Rhi-2gCb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:51:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323266d6f57so1748287a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834680; x=1756439480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
        b=LHU1JGjxV/YLsG1qz7Z8+rS37fj/fhWhKTYvQ4JYi564qAT9se2IDOcSldvsaiUUno
         alpssPRxw+YOx0tzyj+XEBL5JBmvF4URdWh6n1g4lU7T2XWcBEPzGvEBHLGe2FrpOzF3
         BvQsfnAI2udCnSygBk2x+/K28qy3OqdxZo41FnkRrxDNhaAOXgdAIIpWQq7j6O4IhIVw
         PcurBAGX+SMdKnA8+1mFe3tk4N/WRMHrnoOf9r5LoGpQWXVxDN8DeYtuLy6zlH2+vCkf
         ehjKBhVaTP46v/4gJxfxhvkhb1qZLw19Aa0ZFAAJyPOpqVTW5CnwngC64d/9W9n7lGJo
         S8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834680; x=1756439480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
        b=C+EmQIWugWVLU8Yu0w+TzEauvC7PwZVsRKfXrZMpg6WQQokMUO62+qy+731HF7fce5
         yVFdTL69CHdp3V5cmD9nEZrT024ZAFEDF7nQEmGJo2iOJeZ6gOJa2lqTq3G1dFfHEIhx
         UrFRvtShfCKq220e3hLqJS1pRPGg1XTk5JBlhn1gO64qUoOYbqbfs0IwUZyIRjE4tpM2
         +MccnD9x28kkBHWWEHZW1J+8KNUGTlj8yjbKskUMJ9zOfF9sOWV1kmy09vzs0zQz8l09
         A1nEjrVQRFFWVTLnm4sZpdww58TM1mfWJHkoBblHjFFJ1JCrQP1/hoeNgOjUnQondiTc
         TlUw==
X-Forwarded-Encrypted: i=1; AJvYcCWr1z3raT2u7Upb+LmZowThTFWyxs843vt3y9bDpvmB81G+pm+MvtuxGMsISUXcfKnmlVb32E8t2ZvQZAFB/2/D@lists.infradead.org
X-Gm-Message-State: AOJu0YxLYxBcJmMwi+kO/00G+19/g0SmbNTUsJVbO4g+n93+ZOXfq0Yg
	CbRdjhfgASIMuLBZD85JsWxYlAt5cLzTo6qVlhE+RWboz7y8CQVk+kZy
X-Gm-Gg: ASbGnctzJ2126Z9g906w82f0iF4+XSvmDox9QfO3lPIo5eqg2rmMaTBo3y3E8ijOjVy
	He4WGoEYD9KWUelfJGTDejZTeuxvVXi0jf+cDbomhbzrf1W4VojzETmg36aGbUPume73WeJvHR+
	D6pPZb6h4AYmjbSqrYdIlNBD00yTr/J1ZUwVx54/Y9eveV4dIRwA7pYvLvJIPtNHv0Iazx7ad2i
	e9I2w/X5mlHVNwLgHTJIKylU/b3DcZ1glztvwn9pJLuEstX1C7aAm4vge4Z0s3aTPqNEKSHlvv+
	fK1tHqX9zR7H0lFLFhxpiQQGg2QRajuOdFoKs/UGgCJkELdsixFnQqLzqWUmiXEeq5hn5YsHpH8
	S+Q2neLWvoRhC5SwxajcMVyaNkoh1
X-Google-Smtp-Source: AGHT+IF0W1wMk0TjpqOG5yWpDYSHE+kGycH9vB3pAPEZix8kJbdhTkbj67P4mBR5VUeKZQKxuFXy/Q==
X-Received: by 2002:a17:90b:2f47:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-32515ee3cf2mr2179359a91.5.1755834679733;
        Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:54 +0530
Subject: [PATCH 06/10] iio: light: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-6-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=855;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=pH5Ai2hUrCDisN8BOZgbmkwzCO0ZlcGH3OL3twprr98=;
 b=Y4ggOYOq64L6yz5Aop13NAzu+enc9eQG0wtQN7sAaQGY/CtYvE7KKRmnVjQ/LyhlGnFPJNk+s
 4PGO2+PkJQrCiL+ev9sp3RlbFbdj4x77C3RhVe0TX59MpA67qjAQTzb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205120_685287_063327BA 
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/light/stk3310.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index deada9ba4748..c7ccf58e52d7 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -609,10 +609,8 @@ static int stk3310_probe(struct i2c_client *client)
 	struct stk3310_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;

-- 
2.43.0


