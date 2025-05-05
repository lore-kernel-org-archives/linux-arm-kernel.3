Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D962C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJgqOXHKtLEYu5Dc95e8O+Sgs8ALpz+j191fEgS8hIA=; b=ZLjFPNcelbBG5frf3TbGVTYgOR
	e/aysi6VgCbVO22DqX3gV6Oz8nA5mJQXkZjBTLnGcPaJj6wKRfULxJ938nspLicTIMMX8sRRSq9z2
	SAFHosv+JJ4py5GUZ0sARxVEk5lA/d1AcImrSi+Li36Gkl004634435xYoILaZH3HJy7Fj8Ag18fe
	aqLevnbgSyZbAJqmRyKjQi0MPKIYtVUZze5+dRUi3THcg6qnGah+z+RUHz9lroKeVtNT6+QOL+kNV
	jOBfGP1hvQWL9WRNcrvO5dqhl1gt5PQSDCZdajdXbHoQfh6DTDEdSoVGuWWoIPcs2/FdjAQZmEX5W
	eWooA8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByw2-000000082ba-3l04;
	Mon, 05 May 2025 16:44:55 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykF-00000007zvh-1whU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:32:45 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-400fa6b3012so3551393b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462762; x=1747067562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJgqOXHKtLEYu5Dc95e8O+Sgs8ALpz+j191fEgS8hIA=;
        b=uJsIoy1VwmcLjC4jytZl6yPSa4iAz/MkVS+JeMTeh+FE0bDHpy3PoMsytOMnSytRyI
         o3aiYcWEVxagEdZNrwomKl3BjUdMydM04M/KZd2DBuCXDXoG3MACn3kM8nWlCHeLpaJY
         ojjpVFqSf2fD+ugIxYLzSX5AekLu83ReqmUGXTQqCiiT/Z7x8MgQ2QV2wTsF1XmLVdUR
         M1LvfqvNiXACCz/zk8fyDxnXstyLLGQER8TzRacnIhYMdoB+wq6/Gn6nOBnPx3MzaUVo
         nidueJtCnJ+OQd/g6UU6Vr+xby1uvdM7SkFUDka3b58YkQ218W2HTzpBoojnL1u6zCnm
         ngZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462762; x=1747067562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJgqOXHKtLEYu5Dc95e8O+Sgs8ALpz+j191fEgS8hIA=;
        b=UUvLtZOEGGLavnXn5m7PcZyJYv+S307CNWu/tM5EF5xKJdnwwO4YkyWbkt0zs36/pz
         oKzIZFmx9SA660G/PGfrbnu2LD7atn2Y74lJh6P/bmCYjWlh9pIJzuisNE03LlKSsDc/
         EwQ/zLwZKK/Mj3AzLklFiCqAKkn8evnuAfA2bJkE4Y8cXtN0/fdBvBLmk5Qvaw6wvlSH
         CM+B5QyhOMWq1PCwP21hGEUpAon5d8xm6WFTxTxfRORrFLWs1muRwFktItQvdYaEdwYv
         IpQ2Qc2EVVNAdfIjJTgCzUhwy89wf9vmROdoqsOKRWcxtdTdF233GkkqIJY+bTTjQuyv
         hZnA==
X-Forwarded-Encrypted: i=1; AJvYcCXoNCapiFV92RSdHC6KuRHcTa9ViKdRUZuGEMdnYl54o4hckzzyGQMvuV25OJ+r5hFU/bp2bygKCSeipM5j8WHE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy35/APOztTDEdC5udnoUE0lfPLyDsdeDV+Vi5/a2FNhNchxQiM
	28qTVLi38k3sL349dSpyOd2cI4gj5V/aMTLeXa+T1ePO9gBmKIAwmN8kdKsyd8Q=
X-Gm-Gg: ASbGncth1JQAAULsDrXVUnAdDY+Qsrp8lp8oY8jn4RRfqGRIZOJJZRZ48y5pZtiaGb3
	W6vL0bJ55YuQsJKeewbAemjGjHa2dQxxjcukpH6rUkMT2iCwKLO/1tF8UpgJVEvgAJhgBA1NNIJ
	sIbtB9yAiyScw28jWCy5LPFCkI7p9T5tN/3zoirRudQ7/B9jgzysUssJ7NMtDEyWErGbLTDfukM
	TrcPUDmWIzWJawKcntQGmK85kwY6UrqIjL4eYbqUKhQac912v2Xqvuv/irsK0GpCOKPSedYGdME
	S79EUHz0AK1/P6sGXy+NDQrHMxp8HaE/P8yXzsLmdYDR1g==
X-Google-Smtp-Source: AGHT+IGs/uio+N9GX6uoXBshi7EmIQjByvrsNNXX+NqolBl5ZTXdpZVjZB6aOujcazOYysdZc1C7fg==
X-Received: by 2002:a05:6808:2e44:b0:3f3:d699:e1a8 with SMTP id 5614622812f47-4036889329dmr99556b6e.13.1746462762462;
        Mon, 05 May 2025 09:32:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:42 -0500
Subject: [PATCH v5 1/7] iio: make IIO_DMA_MINALIGN minimum of 8 bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=46OSuZf2dhljZm7iLcR4nEvANejbGAzfctNVEsdQaN8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOf3wI8ZT4eFmRiGA5GwE6azCjTTRo1UWmFKt
 qQemRE5B6eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjn9wAKCRDCzCAB/wGP
 wH0mB/0emTwkt4s59h+lwHQxEogmsxeNHdHGwpxtKif1U4oSd5BIhv04bnXgOEzZHho6ORDkML5
 T5Wx+rUcoPcfdZv4UINUOowft6FL8a2ZLzKxwV/cYf+93la/1Gj6fxP/tAmN4GRnTSQgtbKowYM
 KarS+EJX/y+GonOePKZqncyxqtKtoV4DX+VPCOJ8FqK1PYW/3e4GBut/zPaLq4I+X+mG+oZZ8Mx
 IVsCipaI9EJmcaP41FAXPSuw7BMqzbTfv6OPxBcNyWi+/5haxvZcJ75P8m7BHkrYJlZw9CFeO+Y
 XR+bpiOEfvYEZQlo3vHnK3lt8YXx5RKltXnVVjyN9KBxGTnw
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093243_509665_4F9295BF 
X-CRM114-Status: GOOD (  12.94  )
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

Add a condition to ensure that IIO_DMA_MINALIGN is at least 8 bytes.
On some 32-bit architectures, IIO_DMA_MINALIGN is 4. In many cases,
drivers are using this alignment for buffers that include a 64-bit
timestamp that is used with iio_push_to_buffers_with_ts(), which expects
the timestamp to be aligned to 8 bytes. To handle this, we can just make
IIO_DMA_MINALIGN at least 8 bytes.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/iio/iio.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..7e1e3739328d103262071bd34ba5f6631163c122 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -775,8 +775,18 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which
  * must not share  cachelines with the rest of the structure, thus making
  * them safe for use with non-coherent DMA.
+ *
+ * A number of drivers also use this on buffers that include a 64-bit timestamp
+ * that is used with iio_push_to_buffer_with_ts(). Therefore, in the case where
+ * DMA alignment is not sufficient for proper timestamp alignment, we align to
+ * 8 bytes instead.
  */
+#if ARCH_DMA_MINALIGN < sizeof(s64)
+#define IIO_DMA_MINALIGN sizeof(s64)
+#else
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+#endif
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0


