Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C3AC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IPN5zjvUiujE84L8mSRQW14VNC1zQsKq5wxQYikpNA=; b=NOpdaMbY5A25es+liUAnXjWHRs
	eP3/Mmvpedg8ObdOdQP/6DG5ipl9SHoszpoGwlJ9qjX37Omdza5HAU+PpQ1dKkcyN6tD4CfHaaFpQ
	Rn6mKYOk+9lCAPqvWzTe1dDBLlunGtny6nvASCs8TqGmUetc/SitusOdcqJtZk37AKj8X0OjFfCne
	6yEP6ewy9OCHMepxtxHuq2FooegeFFlbYkfvyXTq3+gbV5DGZddBAorz1Q57KN7/9F5yn0zksRE+a
	61MA9575b4VmsFNCzsK170nkJLxSGHU6E4jmO9qGBSSsJqNqBjr9b+hIQWnPfgFP6Pz/TDbVBQPu7
	LawUC4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz1v-000000083QN-1HXl;
	Mon, 05 May 2025 16:50:59 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykH-00000007zx9-3yDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:47 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-400fa6b3012so3551426b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462765; x=1747067565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IPN5zjvUiujE84L8mSRQW14VNC1zQsKq5wxQYikpNA=;
        b=1cl0Z9VNAjUErU0WgEnyX5Curk4MpL3GuQ2zuNpuvgA6qqTRiX1Ksd1v+wnnnV52FG
         KVi8ExEyf5ymwyt5cXIt2rFQGCYSOkN7jt0eUL/FSPrWiHsBrrWOqQxAJrxUFdAA7Buk
         /pFzFppA9qCxz7m/dpxZojUdWQYCm3ZPZ7GWMI0DOL00vw3IZBrXS44HI+VzAfokvcw2
         bvOOfY5AkIpznfUeln+nnNNhd+6nVlfyGV+q5QF51/lByuNQJ1wZB44zDcl77zCull/F
         JefE407cxxssC+qCUk7jsks0550PPYOSH2RibmkRsNkamZ1Hbwq3H26+3YE15b+ubY9P
         rZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462765; x=1747067565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IPN5zjvUiujE84L8mSRQW14VNC1zQsKq5wxQYikpNA=;
        b=N4VVD7GmyOWTxF2z/PHXdoi/yaq+SD86vWeY9wkDSpQCVWRD9ChkrJpAdAwj4fM75c
         wfaG/wq07rmexL2AJ+Y7uy7zd0yz8wVbKc2eqO80CRwRWhfFrRpTYQmjVuFp50yDrpS1
         ku6gEORBPb9l72hq8FQRYtxPRLmY6M37hp0/cqezppe+uzvS5H8/bIz2nkCDuIMIHWo/
         7W8ykM205/3KdzAlzAgrVwUHZvoin6v6YPzL+ku53TNTV2VeoeDHg4D5YLb+2y+xCuqI
         CbzYYqo16us0oTmyE/ErH4QE0I9BHnH1ajetsb1df1/x1ejMqkCEYaob1YpFO/EY/5dk
         McJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTFHTMI3K+O9vLGt8p3zhpDMjPOUpE83gH46bRPmsBupAB0pdXzwyz4cAFFGvkABOJ9SklWj9tRK0tb+8ODZ8i@lists.infradead.org
X-Gm-Message-State: AOJu0YxK68DflHMQypFtP0Yb4Gdxtwm6o8N864H+2S8evMGxXqzz9074
	Fd330kEeH6HFs+GSgQOjTrFKpI8XBDvF/q5kFH+GiYdLqU1hOt3LyzQZok7QRtE=
X-Gm-Gg: ASbGncuUQtnYSIBR433mcIOC6fjevt+yhvHWrG7HinlzVexidkTy5S7toGacX52sEEl
	EsBtwXgoScE1jLnV2+/NMZMGqWuJZJHSFKoOGnjHYz7B3CHKkB6T5+XWtbjS+tpKVlfND04WEqA
	uP5wOsvsOEGFmYg8uEhLb+A7TTtGknfefKKaaejjgh7N2EePSFVqgK51SH+CxYtAvzoN6RLLAL+
	ffNCElTswrPO/o96I42Bah6QNoaQL8K7p/s8O8n4qaO4MReulEoQV77AJwM7xm3jWNt5yFh09Sp
	izq9YZvUp3gfxINlfUz7GAZkDApwcpqyiVSAwN6/N8Ie1Q==
X-Google-Smtp-Source: AGHT+IEFUEDmgHRmBqQ8B5zxNYM6/HsizxzM2vpvn/QoFOlX3G5WG8djuuoSv4JBpEGGSMZ04czZcg==
X-Received: by 2002:a05:6808:22a9:b0:3f6:a851:fe85 with SMTP id 5614622812f47-4036883782fmr91899b6e.14.1746462765301;
        Mon, 05 May 2025 09:32:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:44 -0500
Subject: [PATCH v5 3/7] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-3-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Bss/MM4pMUG+funKZXn/aR/hWEcoDzCMv41P7cSelc4=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDIkXrBxrO9yZ/pqWRHQ8+feW2/xBhe5u73nF/cwMRSpf
 s7OfLe/k9GYhYGRi0FWTJHljcTNeUl8zdfm3MiYATOIlQlkCgMXpwBMZNZr9v+5ruc312X+li+y
 53IzV7yYuM599YuoKcu2/XI0yuUq855i+PprWPxfrkph/lY92SlPy40auDZ0cdj2Rif6fKvL37t
 Yi229QKSzaMUktTWPJNg+bn9du1W6W7CDteO5kkXVT/fS+nVKFdfdp15XXThbpn1Hho/rDrPXve
 sEveMcTuxR0OuQ+JA881pgRk/Mq2vWW+z+G0gVu2QlXdVbZcXAslFh5TPVlbmsH4RTkp4I2wewH
 DYKcFatVTihbLL3bcsfHTeDWQ+qzJ496rg+57DRLIOHSZVK/kpPvKv5eBjYF25+oPPBzCRqw7z/
 +i6Ou85q5rq/S7X9eutV7tK/md5Pd57uzTGInHFD/mojAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093245_987078_40DB45E4 
X-CRM114-Status: GOOD (  12.15  )
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

Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
used with iio_push_to_buffers_with_ts(). This makes the code a bit
easier to read and understand.

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 0c633d43e480d5404074e9fa35f1d330b448f0a2..992abf6c63b51dee222caf624e172455fb9b9900 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -160,8 +160,7 @@ struct ad4695_state {
 	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
-		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0


