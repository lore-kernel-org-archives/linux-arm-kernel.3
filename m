Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B01CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=; b=z6bHwTIpno89U6SO5rucDHtOma
	hEwIhfpyiMPhPWSM2SX7QtEszfn4Rz/vrEeA+ETI10CFaMeihygqydvD8PzoSOgwmpoWBWweulDLa
	ghUzDXrB/T2MrQTF5xrLIm70QyukDBlKBFhPwjLDOwEQdnwl/FVR/n8RXTiD08KMuozYu9ZX/BZ1P
	XdJQHctKQCrW7hD3hf4k39gBtngTVHCwkFSkkCHGpRntIaQ/fVYDt5JIz3FTTHGNp3UYNPYYkT4pt
	Vy/UWEhypFGblXgSJfLu2b4UH8K3eUODZNUZrUCUiVlyshcfHbcccvuVUbMAxTTiZDz4hnZCQ1rsN
	lcnkMznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyI-00000002UjL-3fqp;
	Fri, 22 Aug 2025 12:34:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upInp-00000001Rdn-2Ne4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:50:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so1765530b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834657; x=1756439457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
        b=DLbV+snfNL4+ElhualMh11eWfj+sXSKU8Jgxry7beVVb7ZY0RyDbe7havrZ3yrVtZh
         upM2pPYjlGQo7WGaGc20+yp1eGh5RTJVm02eYaiFLGg4dsXoc9/Svzly08aSWzEsvbja
         8h2XuKPBNITLaKOZzd94i8G6PnVFFQK42RDxaWhYHgqhuiTXG1JjGyee+RCujrT24rGZ
         50JqczQFPZkvPyIXXrp3GjaWVAa3cgdHczdE4ZRDUoP+9a5fpj0ZJCkuG7pw32b2qJQ8
         LyG6Rc4MnSroL3zSUXp7D1cE+ZraNUjm/ujTmEVAuOoyXBuUE6HRPPRd4498iL1SuOIg
         HdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834657; x=1756439457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
        b=C8dVipWp26YwnPUDjiWTe70w6aDSNUJ2F3Q+a/AiOigTEuq/q1c3mCLZPzhqQWKU8L
         M2RqR0hNqrFaxM2K4LuBnEhRdH5x4zgbsm6ikTZG35F9+N0qcfLD5dBagDplnRq3Gq+F
         hG1Ih67wsqu0c6RMbNvS5FKa4fpcApZ2UhcEoow3kCtiONDCj2KQBXDBu+OFS9NayxqI
         U92w/NOsUZwwRBV1traCQBKfcHpVqtH9OkjwZvSXRQXBrkO/2EmFSAwKphT5sKrNK9xl
         LsYp0H08Y3Mn3VJjWllEIUVVMQh0Aro5zA8ZWQ5tOcMD4VFGmDlTpdUWa4pGdH34ttqg
         v9fw==
X-Forwarded-Encrypted: i=1; AJvYcCUYGeVHwtmfQDM9K54gYuUvOjIcaQ/jm20IOEUy3lVd6quA2rEJ29QFCFH6c3pQhBsAB3ld3FBgg6nb9GbBOMkc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1XUG9mmhd1y82WtB2zfuzVK2zueC3WGa47Da65piQrS+gOhSB
	TktvKeTz18IqOwFD0EzFoDrWT1/ZP7L3sHAqrzxc6rSynds3+NLTQObG
X-Gm-Gg: ASbGncthZydrR+jP+Bq2YTJ89SifCj+QwIuN0ny4t1XX7KRU7wWbeVOgfKwnVM6KgSa
	oxIXowgM+sRfSYgnzwSVsBZHlPD9iLzVcUknL9FyODGDBMhKNXAdaXlb5zls5WA74yyJWV16e8q
	3RlC6Hz1QwQMuUiDwQj+xY88TkeKOpytJ33EONeJ/cyKVUozxGOuiuLljtGxGpIOAP0LsFQ3lIL
	EXwmGy18GdlvTtDFejk+LLqrLjIhyz39T5Ry6DhCXzphhNY7eiAtv4j1UuEY9ncvHrs4BJAGxYW
	V1dLeaNIdGW2UgedlrbVKU/b0Zd83y8XTAIPiCxWoOnt7Ng+gZ5RfL7YsGgbxKGHxp5I/zXeegt
	T7rF6ZE0/jtJzo9S8RgxdEG3Ol0Q2
X-Google-Smtp-Source: AGHT+IEDplbG/6XF12lPxx9itIgjz12WwucZKRq9+cOsqGQDlvGhf+WNacIYrhLVVvaG53XeD5NjCg==
X-Received: by 2002:a05:6a00:8d4:b0:76e:7aee:35f3 with SMTP id d2e1a72fcca58-7702fc182a8mr2167240b3a.31.1755834656645;
        Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:52 +0530
Subject: [PATCH 04/10] iio: health: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1430;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=rO9VuR/oVVGoakCjeEjj+XT6+ebILUa0tyZFOkIL2Qo=;
 b=4b2jPbSe8j92/XCjL6XXtT4A9XSafT+S4e6mVe2Kd2YIm/HD9yFiVI1p7o9NlKstS6ok8mzyx
 C9ICz5YdiGjAlatKIORLRTH1V1wdnZKz0xgwurThCEbeEno2qe589S6
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205057_613893_4A0EDB10 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/iio/health/afe4403.c | 4 +---
 drivers/iio/health/afe4404.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
index 1582cfc03579..8e5db2235de0 100644
--- a/drivers/iio/health/afe4403.c
+++ b/drivers/iio/health/afe4403.c
@@ -531,10 +531,8 @@ static int afe4403_probe(struct spi_device *spi)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 
diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
index 99ff68aed27c..11a0f465fd68 100644
--- a/drivers/iio/health/afe4404.c
+++ b/drivers/iio/health/afe4404.c
@@ -538,10 +538,8 @@ static int afe4404_probe(struct i2c_client *client)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 

-- 
2.43.0


