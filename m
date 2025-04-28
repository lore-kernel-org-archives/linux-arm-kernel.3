Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74093C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=; b=MsMtuNgXysr1db5l399FNaPOg+
	NL4ckuEYeBjIvdG4Eqaj184CtQBJemTfSZ5R2mATztsXsUTuKcGnJGeO9MbFslnTyUUYfqSdTnt2P
	AjF3Zg4A/AX8GCUNYb383ptSKR6n9o6qfwO2I91FlSv3ug86mSPqwoxd9rnjOSYt7Qc8hMAnl39+a
	TyO0HuULvOzcYVEMvPka0o6Fh75SgZi3567j46WM3GhMfkbFvG2n3faxwoLa4uR8nmrjvaHzR3Gnj
	JbPKPJN/HFl7IMs2TJS6fFJaAy+rSTxRVkqTZONxVU8AWSEIpp34yVqKt1V7eOqAfhwXplx28P6L3
	3AG6eoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V97-00000007TqF-3rqR;
	Mon, 28 Apr 2025 20:32:09 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9V1N-00000007SFF-1ahS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:24:10 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3fbc00143d6so4426618b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871848; x=1746476648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=;
        b=MX6sZ8SBLXhKLxOJHE1KvqpiG6nVTKDzbl2h6rpoSCthYYAJT2yZJaCsAf/yavD3NP
         uDP+L5eEAw7qd8eH0KqUv7V4IiBJqxfQIsjeFhTQ6hvs5y+COCVMhj3rEfj600M+mUHO
         Oz6C4pbHeU1EvQlpEISTdPgc/WL2gqz9nbid3dfGTpddNyFTIMddCvzTUGF5xcx1osQ+
         Zv8KAHm/WG8cWIctNNbqwIaeYOt7o8dB+YSdUJH2EbG9DqpJOjGKY6PGXtefdcAdd5kM
         BB6ssGYDpcBLMubb2HZG85LA743BemiE9HoZP49h86qH77ETTR+AkANsdeqBQEhKJDVr
         ZBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871848; x=1746476648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTje6aj5o1aqilClKP/XjHDRm21nPtMuz4RymFa7ygU=;
        b=BYEl4EkhHhw9k8L5qn61f2lornuI/JXhlnm786lsqYgCyzQFQMVQl08P9FkGYS7jmS
         7vaVyGmhjMBZElLnK+v7lWHb3jGNlvMoTaeZ0AElChKWRh5Z0QErYx8ySUoSH9q1uhv5
         iT1OFrmg8+Keg+5R/rcA5HV8KN3gfY4G2VD3wXfee4Dtt2HEj5xNaj2CwnPtxqChQamk
         xJXJvpEyqDUoCk2FyphUVV0zcqFf4Yo5YvHzgObe3K5cUnlXhJjrHvNieR07LPoYhRof
         VItNP+gXfGtvqsd7KIiJpSOBDtVhIqyKdkt40PXegoqA/4e/1LJl2MTWtRZjsILrLp05
         sN3w==
X-Forwarded-Encrypted: i=1; AJvYcCXSe3nsbQwAMrMKRdkhJ2HV3Z7OBIIqnloTl58DwVS4oOOYQXwcQVZi/CGQ9abx4C+VxTRV9aAPKhedhQy0mSvf@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQCCIY3MqVh/9GjRGGILodqkZx7+D3eh1uc28CGenLzRy4api
	0be3XO2wI7DGkYK8ao8DL+3HSpvkSQmA6osq0NGQ04w7Kiuh56Q61YrPXrRs7A0=
X-Gm-Gg: ASbGncvKlTraAjD0cgtDLVLVKSIeNqteeEPagOd22JrgKWGq6P6pIk+mewpgTpAbQdx
	m4S5xlJpOGoGVoh0UWNh074LboQdu732iiw8pomFbNjrVPnJXzE33BHCYGwI3W28W2wDokQ8W9E
	6zNmjHEB+T6wPwQiWjCz5NLXaGbDrAmDlFkv7Hf0ZSqoXaHd7cfpU7lw+aa55vIKGXdsJDaNBSl
	nzcwUYnH43hNpCKk/AdudJpjEMlmkcWrjAdHbSVs+T6+JRXHtORNjQvHWlaKQ/tUtOHVUhGhpHh
	631ZqeyNe51VGBRghUzcxGiBtMWAZssiNlSdxoccngjXvQA=
X-Google-Smtp-Source: AGHT+IH5KDMoXCV8pNi4SkosxNjndqHGUg5FZmoI1A1D85SMMHZZKyW1TrrYK1HTGGR4BOcicOe06A==
X-Received: by 2002:a05:6808:bc6:b0:3fb:eb1c:2a83 with SMTP id 5614622812f47-402107f1c7emr578970b6e.9.1745871848357;
        Mon, 28 Apr 2025 13:24:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:05 -0500
Subject: [PATCH v4 3/7] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-3-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=J4aWhg+jCqZDPjq8gAC6cdfS6rEoLENhaBlAy0BO4RQ=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDL4H+//d7X71mGbm6depN80VNtx05mPNSFz0yoVBo/3D
 68l3pPn62Q0ZmFg5GKQFVNkeSNxc14SX/O1OTcyZsAMYmUCmcLAxSkAE+ldz8HQPWHrlnNSMWl+
 eiGv3DoXzklSatqxPbFZQNbZ8eGzmL4pTzQEc3RjJa+l6cwqWDL996PJ4k2Lfs8sM7/xdJdmkrR
 U0UTbtg9nhcuqGR+szP9+z7ymUET43eU7yTyqbYdZp/OZSB049sYlpe4p53GZfak7bgjZzNjkye
 ykejZq9p5XSiLKFwIFEvUWvajebyLxoigkkzWTOcmLb3FeZYZ3a2aHcQrfF4ntL2at3lR46tf02
 yw6zExpnfeSxWuilTkT+Q9Fm5xgfqvUzGYV5/4s6ud8iy4JywintqBYZ86sHZqnIv57bti9tWGr
 fpG/YO+BiBN39GuW1FnsnM3p1thgUvAtTO29XvGe+1YhAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_132409_416791_EE561E18 
X-CRM114-Status: GOOD (  12.20  )
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


