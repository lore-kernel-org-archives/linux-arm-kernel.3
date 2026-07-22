Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB7C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/pATTsYUQb3NxIiOQb/wmyPkTDqGg6SXe95ZoxSscA=; b=gyIqe1qhUoPT5DLs5fnfTKy+fI
	iKGax7NXudbBNiubXnj2gtZpdy0TFXnLGv6qFojmmB1lhMlkQxhR2ZwEY1110fS/dx0plyXgKytWR
	i1dZLox8cFRDbKpMPLVYBxcrrlfNZnJQiKmSqLU31TNL0WJosWUtxqLFLhTPNuSJju3I3BdprPUqb
	xI8nbnwb0py3MrpS7hj6GaELTvWu8o6xBUxQv5NSLzKpW412T2nU6F7zdyepSaRy2NS5vQiqs14GH
	/sUzJ3Uz3Wt+NIvf9l4CG6Jq2dBTKK6Kp+b6UF1rBjEXmAdU67v8Y3wtLCG2aLGgpeFZfD54f4Gr3
	+43RnZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcnA-0000000Cer0-096A;
	Wed, 22 Jul 2026 19:39:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcn5-0000000Ceph-38KC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:39:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so8932029f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784749177; x=1785353977; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3/pATTsYUQb3NxIiOQb/wmyPkTDqGg6SXe95ZoxSscA=;
        b=DSAA4eHwd46zF5JLThRyafJbeCbw1k1BDDPMq6swovgzCmuG+BBa827IsT/JafWPmU
         ErNfSKJVTt8eWi7nGEXCRSXOan9wufJYv2qJIRPvkS7l3JkIrXTWx9TwwAsY7XFpcqFW
         pCWd+y/NuA2kp0vNY4MFJjDUfTNzgWBnwG2GfeU1c/xVeoMSHch6JHonyc0sh7jqWKNl
         S8oKBFVv0+8wAO2ZlbXeIAQDc06RQRm1ItfMKk8PvkRZQOZoCE0PzDq3rcGDXvTRgjE+
         qScyIbnwClSRh/TmV0KGp6lKcf/zJF5Q1s6ebnxDskLMWQPFBySTi8QBhIqrT3YGDlyJ
         3CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749177; x=1785353977;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3/pATTsYUQb3NxIiOQb/wmyPkTDqGg6SXe95ZoxSscA=;
        b=HC/1UywuM/4Vq3fueWdoGkwomTepq3WYOyrf1dOnm/QjjuxtyEmk5N91cFzPLO98zX
         xCVpXNqUigaEuhwTqstLIN5dhx1bKNTwTcqDqL7OAELuBUh5UKBStNzCIGz/vtVmJVgE
         wcdDAaIVQY7bxu7JwFh7FDDdmmuxfg/SDhcWaOYcPMb+1+uHEsIoz6CbmQW8j9xTfazk
         LzQKjzyxEUho2x2xmgFJnUhbLSauDlPDIxZ5VKry6XaUrwe9xTf6C+kzOvc85ziU0G1r
         aB/2M45Aru9HhKdv0DwAAYvZxetlbycKTiFqtlJe/wLvh99SuaA2INZnVAM6xYUVMqwe
         cJ7w==
X-Forwarded-Encrypted: i=1; AHgh+RoYH02037qXtB9vcPULXaQJH9Uag0n6CjKtzBmdkDZsie1tiMoAXnvSHqKOC/tWdrdYJZEhql7H0uhDnT+h7eNd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc0qeF18G6hoHD0juz62AFSrUM9+SeSJCUC3gvmpBe2ZZTiI0H
	qqhznVfK5v+PjTERE3aWvd8n2zRaPzFLQ7a93eVbglUrpMiGI5sW1zlI5WDL/dELB1k=
X-Gm-Gg: AR+sD13lgOZXPqNZlyJNQpb9OpevQ8CAgV1fSNQS0BO9fMIErH6C0HWhSVzQ8tozsJ4
	dQEXhoRrpUpFN9zE13JlR60PNu2aNoyP41VUxUeYQS/50TAr0vc/3SIfjg10D5577sh57qHejCu
	fz598cbKPgaUqUF0ulWaJ7oUR6Xh0PWXxjBE4DVEdPkcoe97OO8ZM/CDKl7Qokm312XScZrevqC
	A22IV1ElGASX2Uxi8gHT/LoMqD7ycsq0ny03VI0ZwG9jAj0RMOnA3LpNBfqwJN0BqQnlBIkFm9R
	AFfsrTTicxzFtuCijdjuCBsueulCES3auKVSlswOeMJvPtHstYiaNngNoNG5MffvmsJKQFdVwdu
	jM0fRFRtWeLO8KYBCYN5jSr+jLBF5y3q2rXq4na8bYdjxd8rrakvZjbLguj58PhofKclJDRquTH
	N5TNaHbKBUPtq1mIUNMm/5v5NXnqx+o9oIkiY7hbXNI4ikbCEk/Hiz/KCPFjnQHol69iE=
X-Received: by 2002:a05:6000:1849:b0:47f:6d57:5a9d with SMTP id ffacd0b85a97d-47f8dc9d728mr202566f8f.47.1784749177126;
        Wed, 22 Jul 2026 12:39:37 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c599000ca1676dde693a1e.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:ca1:676d:de69:3a1e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm8416243f8f.14.2026.07.22.12.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:39:36 -0700 (PDT)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Wed, 22 Jul 2026 21:39:32 +0200
Subject: [PATCH] iio: adc: at91_adc: use const char * for DT string
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-master-v1-1-ab0591897e4b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHMcYWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3dzE4pLUIl0jY0NzyxTzZAODZBMloOKCotS0zAqwQdGxtbUA6rU
 4h1gAAAA=
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784749176; l=1257;
 i=amin.gattout@gmail.com; h=from:subject:message-id;
 bh=XPNZh5Xwi4uWv1AMYrkob8yNIlR+8Um03AjzUYZVkS4=;
 b=duOiTGUULrhHnUItYRTOCMeN5TIN+RIYU4M66Ic3AEffJWCMmbKYv8Toonmt22z6r7aR05FiC
 1YqzrJz8s/gA6vAVaoVVpntIsLwsgvOXakeeuMsQAqnZ8iPX6Fb99c9
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=C9HM6Jf5d9dPl9fnP9pM/nhMwm+c280ldqYZ0ESu3a8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_123939_808861_1F24D582 
X-CRM114-Status: GOOD (  12.13  )
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

Declare the local variable as const char * and remove the unnecessary cast
when passing it to of_property_read_string().

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index f610ad729bf3..0ac74ad92fca 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -988,7 +988,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
-	char *s;
+	const char *s;
 
 	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
 	if (!idev)
@@ -1023,7 +1023,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	st->res = st->caps->high_res_bits;
 	if (st->caps->low_res_bits &&
-	    !of_property_read_string(node, "atmel,adc-use-res", (const char **)&s)
+	    !of_property_read_string(node, "atmel,adc-use-res", &s)
 	    && !strcmp(s, "lowres"))
 		st->res = st->caps->low_res_bits;
 

---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260722-master-23179d7c00c4

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>


