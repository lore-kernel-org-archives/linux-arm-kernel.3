Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A66CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=; b=U3lHnVknZio0IhDfL4ZK3uoeN/
	Vz8uxUCY9oKK7/f4pResujzY1W2e6arI+bAqQwiU8bVBwfDmbzIZZ+tcv3/VKlpbpCZG8KisM1CQO
	IiKWTPrZEZ3NCF2dqRqq0QmK/k8afkAtKFSykAoSY6p/FtPB0QvsA2OvkPWSSv+HC3q5CjK2qgZ/A
	Qwn9iWnMEqgVYVN35//pbcTllp7ioIrFOLhQWj4q93lZYoD/aCtWOTxS0KJnezONEK+SgBdKBAadg
	4wtfomQtjhEn5MBB1DMZeqmNReaTOip3OkflIF9Dbpx8QOwJOXTu2Uly6uNoY+U8Zl2mi3ip5Z0h3
	gGfy7hVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyM-00000002Uo1-0jsB;
	Fri, 22 Aug 2025 12:34:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIoj-00000001RoA-2FDt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:51:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1658270b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834713; x=1756439513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
        b=mocg5mWSxfWSmhxQAAo7bO17CFeblepokrmG+tEMAT4WhoIzsNUdt9+QqlDt8u1iZB
         gh3sG8g7P+6Gm5EB1Zf9Hmr/sKs9CyWnLY0EtypWMQ7Pnc/eTXWNm1yASh9qBcH+PHRO
         2GAUO4BMYE7BLn0tOS9YDH9yzNm7Vk8/r/WB658pWcc9QIT3bPj/N0vWNCGOcrAi1UKo
         MDONdN2VKDcPr+VMVlyiSDnIHkuCYzZCnh6ZZq9StH41CGg14wnwGFHvtnpmnEMWI6BO
         r45AYlWOICtLKEpFt/k5M8NH7X6ZXPrf5pt7q4JtHt84kMhg8odco83enI+po5dPsJbI
         kERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834713; x=1756439513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
        b=hOOU9BepCqID8mvpJh3cBqkNbgfFLQFTgO/47YFrNFp6pcYtOg2775KnmRrz+ULy7E
         FWq90tKxlAlYXb/HJcvptwtCv2l/NgcCDjdouT2khSYEjag5Ae3mFQptAatOzbrNeIa7
         DmJ7EBus8vV69rC1jRtYng/Ef/7WqHOs6jUzkrvuUqjBk6gp9FxFdvhCJys54IMIH4zA
         2/HloRiVBd+gzusonOEjbQmsQ2c5iMzdmh2tKiT2VOCveG0NCWyhx+vjhvNwT+NMifvj
         fSmvIVeSKSS25twNZjPrk7AR1oknCGgxi6nmNmefX920NoMMG3MVvpEErbTlYIAqB09T
         7pVg==
X-Forwarded-Encrypted: i=1; AJvYcCVc7TY8kjNkPiMYhko8CCN13D+rkuiQjtZjA2JqTrwMRyxXsZXYYnAQYc33VglnLiDpahp0nP+Ve2hm/7ZuX2kc@lists.infradead.org
X-Gm-Message-State: AOJu0YxIUQpvtk9ZHQJda7b1+AQb6wwGCc+JzndWZ4zsmxwqW0KM4LJU
	lIzpJ/LW+tjrkxUFEiXmU5pYa56DlqfPl7+ww+3vRIWmX7LdzkbGYS4t
X-Gm-Gg: ASbGncurd2b6HiqpQgitRWdiirUwQtWcd2dBsLuuWhO8wswvQTWNLf3nsydQAVxR4JT
	v7fskQkdPAAwNcTp+Mzjbm+JNUPh+3GLdYndhWiRZ7eAK0wnyJ/V1P6/UGj2TmRu5oqnSKc01fE
	e4/l+bY3D0dA0Ke27rCCogvObhmJbNdXNdrrnLTSiTD9gdCOTQwgOs5n6YVcxOKdXGAPOCD6UEr
	HlrsgpGRY33TCNat8ibG5mAUVGqDnkR+EBGE9V1hlC4b5Cndacxl8iIYYyulx6W/DW5IiPJfrSN
	2cpE7PgugiXxaV8CjNJ8/FA1O5Hj5fHf1tfpFgKDAowoUxesMpVAIvMy9dCTcvSUAKZazb1XjSO
	BhBHRYtzeVXcp8rzM2o8TLVl7J7En
X-Google-Smtp-Source: AGHT+IHEL8ONsqgS7iIxwqRUVPY9B8jnNtZgB3rknZG4iSaMdkOlahK3+51EyJoqDE0SH8cv7geg1Q==
X-Received: by 2002:aa7:8889:0:b0:748:e289:6bc with SMTP id d2e1a72fcca58-7703051195bmr1992722b3a.1.1755834712769;
        Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:57 +0530
Subject: [PATCH 09/10] iio: proximity: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1421;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=o0kHbqFpyBP/mgTiX4N/QGk9oAOztYPO8grzmPdvqrY=;
 b=Q8J70rA64x5Wx/SDVM/m1/65rdR7MZeOH79krewJg9gKcpihiqbOP8UjztiODzFgeo32vIohz
 JBzgUFPJRTDAPYbuF7xQHLIOA4XuPnb93j9EvkSJSHk3SkSO6mnz926
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205153_582049_CD372BA3 
X-CRM114-Status: GOOD (  13.63  )
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
 drivers/iio/proximity/ping.c  | 4 +---
 drivers/iio/proximity/srf04.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
index c5b4e1378b7d..e3487094d7be 100644
--- a/drivers/iio/proximity/ping.c
+++ b/drivers/iio/proximity/ping.c
@@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
 	struct iio_dev *indio_dev;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct ping_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;
diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
index b059bac1078b..f9d32f9aba1f 100644
--- a/drivers/iio/proximity/srf04.c
+++ b/drivers/iio/proximity/srf04.c
@@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct srf04_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;

-- 
2.43.0


