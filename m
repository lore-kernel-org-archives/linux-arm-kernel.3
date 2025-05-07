Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D9DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd1rWEvK2H4HurtXzFWa/x9Szbu0oBY1TfY1+UU3AHc=; b=vQuuYaJwjiYuv7ZDXc5rZvJX3A
	REByAa2lYlMCwmjQDFYtebjqtLpowvjcGqedV6EnceOKlGcAPI8NHdPU6MnkooNL4Q7UK3fe/Y7FD
	0Ic4rgLm7b/u1Hl6uqo7OQcfa6EynOgCI//bKzeu6EFpMeWeVcyEHEzIQBwakzgPeZNvR2plAHqhJ
	CI9HsOMUv9dx9sWz3KbobxTFPobagR4mZgrUEYDu1XYCBt9JdWeoBu1H5hGRx1oBRv25h+N6MRGQV
	q2YXOcKE4p9nzv6GWZy2pyvdg3zks47uZAADENqsZ3WjvqOr35D2f/7uqVtOQjO5x0KyNn2h7zQK2
	BeAZiXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClpm-0000000Gk37-43Ui;
	Wed, 07 May 2025 20:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcU-0000000Gi4C-12wo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 May 2025 20:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pd1rWEvK2H4HurtXzFWa/x9Szbu0oBY1TfY1+UU3AHc=; b=q7QrAkRIJM57QjRzHnCZklVcLL
	o3/dDxG3LzJIM20RR6dsuPVzcTVDlBkByDmeMK5DmpgplmCiy8T307L4cdK3Ql2rpHJBWGFlgcGQA
	YGSNI2kh8VMsx78ApALWtgOhksJ8+0vnAEwrzf7hS+kjE12UF22aOvDXVM4PoLzgZObdedGvoJHQq
	LKiaKSyvcnzXQ48OwuLqg2NbZH/J8yS6jvG70GEImYoLBkJMGPra+y086vzjoVLnpqKRLxjk6bV3l
	ZEFlHKOZ4CrzIWfnt01DWFV5aWCquJ9Sh/TfEgdY0lEN5XIPHLgg3mZAB/O/+a8XrEim2cFVO3SGK
	xl/qkc/Q==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uClcO-0000000Fv44-1lFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:56 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-60634f82c77so99821eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650628; x=1747255428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd1rWEvK2H4HurtXzFWa/x9Szbu0oBY1TfY1+UU3AHc=;
        b=0xnD84x9RK8PqOQ5LPgi9HALqJWTDh2YboStJNmkW6sfo19sVgJynICbo0oPiDeyDQ
         +/agXiwDQPzCYZ2nVhADjG33cjUQQDapXDirwmVIiZ1toj+7pes7fyZGbGdgl7CuYdpY
         Ly3aJyvdkaGPlE9hrQ1XNaPWhVabRNWi+F4XnhdVSEh7GGMdqNJck4+Tl4nXhfDYsn+e
         jlBo/dAiOntR4u3e9apgdMs8JXuhB02S0K4dagrURV/3p2WzCP5EqX/RkyBak5rlQOTX
         t5rYkrLgAhItFzSMSnYCXUT4rHc4yb1jwADmFrgqk6arN/SaLajnaAuENlmQmKuYi03F
         6Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650628; x=1747255428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd1rWEvK2H4HurtXzFWa/x9Szbu0oBY1TfY1+UU3AHc=;
        b=JVPS2FoPcYfIIRk7BWVoLGHbVYuGS1Jg9uMh/an3DgcKda+5N1VdjbdiK/fi1ZkwX2
         v6FyJxKEqWqPqHJqIeelF9yBsczR4yLy9UXBsV6V7vKuqcb8nNxHHJtXsCnwJBO+/Qlh
         niKEqLJJUUg/wM8PLaGkiu8mSUX8w4uf1X1qRFs/SVpUpFGGjCOg812n6jadxgKXQY/u
         fDZgaq6z9O3H5sZS+FdnB/sfA+qKXVWim7DCWzY6QGfXjKePrZ98c8XJaitx21wozi0s
         DRGPAs89wmlZw3kYqiX93thQfGHPsRZ0YwpWTnB6T1EZdSxR43/tIBuaJdisz19IPEot
         PlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfbcRH6kQxK971n4fahTGYJqZuPcLNQWa8SOHRSJiOSJAbgf96ja+vSdUinT6RIfnycaRMJeR2+jRvEC7fRl9T@lists.infradead.org
X-Gm-Message-State: AOJu0YxBCLFsEEVFR7xmF1YkW18JnruqmZhmIaSpTbpdrzFhmmIa5ceA
	A+Gvr6ZlctfwfWgmBAVc/kI0ypkqaqasLQxpnAqwdEYlcGFUn7pjEPtHA46ucVM=
X-Gm-Gg: ASbGncubNhpmM+rPsGeI099e0RJ9PiCBeJBYgZljtDznLjDPuYT+QAJD9u+/Rau8JNg
	lKfs3tMeKCZe9lGO1tJ7Eo6ozO81YQnKd7gkxUaMTm25CPSfjBoXGbS0tutDSx2tTQEagOsvHfS
	0HxHjFEpjhd5QV3O/qPUj6fRQlKwvCToLAN1N3TwMdEUunyOi3Z2erVojjUmuOtR/zaKxhqzvuq
	eTnyJCUAo/CTFynLJLdNNN7W4Spk0juPTS0E8wJGsGcsLLaN5OWOjQZANwGdE3FLujtn011DCQv
	1EBJ4CanRhmY4UVDCsAQX2RQnb9ezFDTnRUP1Nki7MmVFw==
X-Google-Smtp-Source: AGHT+IFG69yhKzeAewFZifPcUv9VhJ1g9tWX1TCPK3VZrLJYfK0PymFFMWYMU/UQ1P6qhCb/J4P36g==
X-Received: by 2002:a05:6870:898b:b0:2b7:7abf:df6b with SMTP id 586e51a60fabf-2db5c0800cemr3373849fac.26.1746650628324;
        Wed, 07 May 2025 13:43:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:44 -0500
Subject: [PATCH v6 5/7] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-5-4aee1b9f1b89@baylibre.com>
References: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
In-Reply-To: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=qTxxm8SfPufoyQPrSsaW7TicDEaOrmpRvi6YmXZisJ0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XlBguqCmqtDIVqJDkB9dfLXj5+9lqxiP29V
 msICqsmsqaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF5QAKCRDCzCAB/wGP
 wPyNB/4w+gWujWX4jrqO+DhhHJDthKJLkpfmKOfGt826Ejvq9ojUsmr0EKTXXTuQoDDSteDB83j
 232ECMEEZ1/KxZMYGwRwHiM7Ql44o7XJVgtVi4/DjdGE9ifE1ahwNlEGqa47IszLrZdnK2RpumW
 1TuYPeS83q/0utvHbfyguuS0I/5Y22fc2zz05e3brqnNH0DdRYqEafq5YI/1W+xHeUgqLJeBrYi
 gpkXbPspkbP10Fa7K0EccZnti/onu6l8ieO2a8V5z3Kia7EVPO4B9snycru05rcE4psJ0OZcwJY
 AavywEoibXqRuD1VIRuAezcdL4J+GPfOlgNCxhb2k8DLea7R
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_214352_811645_69AFC2E7 
X-CRM114-Status: GOOD (  12.88  )
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

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.

v3 changes:
* Use IIO_DECLARE_DMA_BUFFER_WITH_TS() and drop __align()

v2 changes:
* None (but I messed up and there was supposed to be a change).
---
 drivers/iio/adc/ad7380.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..ed5e43c8c84cfcc9c4ce1866659a05787c1d6f5e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,7 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32));
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0


