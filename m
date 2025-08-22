Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA00CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=; b=0D0mwKf8+P4sU18ICGxBhzU+c/
	JoQs915aP4wsAZ7H/hFUBjmfoiHEJzPQ2LlWZ80DG7M8GmaQ0oMbRBRIsDTpq65Zz99R4h67WUp1e
	1wtJtVyhQJVUU5uwYoe5CQq76yOYDUHlWXOMNG+nIreoJegqTC8Aea+xEqQf6e5iZ2HBKEx4jeru5
	sy8a0geEXQzrtDN1a3I5LUWiLjApYVn5XeszKKAg1ZrccfGfFMKaQtSIWWyJz2Ath/01ANLep9UrL
	JhRD8vdk2TAPA2fW+DZDoNhU5PpWh+dsZJJ4Al8G5Y8JT44lVNCvT24V98woLiIDMTJN99L1WhRrF
	0IFn96pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScF-00000002m4x-1atW;
	Fri, 22 Aug 2025 14:19:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIot-00000001Rpl-1ySZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:52:04 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1658337b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834723; x=1756439523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
        b=V6GUJ3KCARri1VeFuw9rUzqFH+qH6+j3OpR3eYyXGOKmP5e/8vO4Iq9vaZ1LZzwBZC
         3dhQkSJVQmt+PgR7Z3eBuYmv49uQcJ8pp8RGX9OHijSdr6OUTC7b4oCT2L2/qoMPKnCw
         4mNy3nyP6mgVotPVvVmhwy5Z/4XK/xh8sxtmDpw1xcUG1mKKjABNI6X5R10coZqcVvSR
         S8KGoZZx7VNbkgQrpKo1QYPBRgGBKlZmij+dk8EKmEHMX7v8H93D1PyKLyERbyp3JFze
         Fbw8wscSkpP4it6U6Y+6m24i+3e9F0wvJ7I26krN0/F9n5I6LSjJcjIPrGROaGEmPi1Q
         nLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834723; x=1756439523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
        b=D638cOyIhRuhikLLe7rmDYy4k7LckUYxUbJk5PNMraW8bt6JWmRgH0C+t0b8bQzCwy
         PRaG9O3PAnFElVfzqSIzzDibgG4fmlLidLYukSmPCQSb0Hb+mA7MdLfKPzLAF1rGRA4N
         cu4jqV62LxhaoXIL+iqyN10+odnodJx998xBvHM5nY682oVcyOa2lZ0YwZtPkDzdHvRW
         toRBGkkWW4el57IS5ioHEYzi/lLsUFvmTHKFUm3pT1jeCAGYJEr4+/S+glV5o/dqvzwe
         PnwHid1HYulHiWMCu3AehFMMCF2z39XCI9BGFluyy7fHz0lb//G/yO7abqzuRbGFATPs
         u4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWDLvSjKCKWG8RII7aKnfpTD5/fidrm83vKdc72CdckaoyloEOMFHGSwaJrvYUhfg3WkZvRjV5w6CeIjbb3EIBL@lists.infradead.org
X-Gm-Message-State: AOJu0YzwN/THN9Jl4tr/8BqIT8cEp211Y+lMw/DYX9FaHGe0hW5XhokO
	XcmEvtJ8eDOXqBxieKHLBRMKFYfi+Kw89sW4j2P/kVGHe97HCbn0gPCk
X-Gm-Gg: ASbGncthsuUnVfcgfroVrGXqRwPPpM6TAEn/YVBDfcr3iPOLLhQcNFDb+3M0Lkgx9cU
	0DgBv2GRyXhJqrI+7IR4MAvSCeA6R784tq9cia4XA03h4MLOARykfw5SIDCgZK19BJsjZgOzYbF
	+sHjKHCygeeJKzxXTz3imrXTx0Z6ntQZB6aPWHAc8K114+EUC1leZYFNET76/lju/QAInxglDdX
	F7p07X++nhstmG7mjmvripue8TJP2Zshcs1S3L512LRYg2eBkQ61qKBOEsH7AqwIzks1woivntA
	24Zh8XFDFwOn2LoyYO98NzkPV8jlQiKbtV4Z8a3IEJZ/g9jIqL3yU+FJxx6aj4LL76IHrZxmjLj
	CMk9x4Bk4+DQTBkFpG8iE/6BeJZ7g
X-Google-Smtp-Source: AGHT+IE/XZWblGeCYZs22CUnDKwXULfC+6SOqnh7RXjuAgW/Urgwc5sc12Db+DpiqPeiba2SievDcA==
X-Received: by 2002:a05:6a00:1742:b0:76e:99fc:db91 with SMTP id d2e1a72fcca58-770305105c8mr1796426b3a.3.1755834722669;
        Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:58 +0530
Subject: [PATCH 10/10] iio: temperature: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-10-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=910;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=/52vRgIJUjMO/j9jQkvKz+7tt80vmSfVQHF7sXmO88g=;
 b=aO9X2tBzsuRCvTKvElyomG3RIlmdjR2h4cNhhqfgx56wssi9qwsbgRVsLxnMuUkDukkoN2haD
 KMTw66khfeTCy0kwjT6Jv3/dYxro2mv3JCJumcVZAKzBT0O80Sr5yzs
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205203_517929_AFC8B1E7 
X-CRM114-Status: GOOD (  12.04  )
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
 drivers/iio/temperature/mlx90632.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index ae4ea587e7f9..c4bf5dc2f266 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -1178,10 +1178,8 @@ static int mlx90632_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*mlx90632));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	regmap = devm_regmap_init_i2c(client, &mlx90632_regmap);
 	if (IS_ERR(regmap)) {

-- 
2.43.0


