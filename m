Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E26DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=; b=Ybb9hY0YRR6bMpxCXTIy91iepq
	75mT24q93JeuZ9Q2xubp/8G0mdaKuDRAZgmLqNsQM7WxoTWhtch16qbyX3XLCf0dQYPRhGDxLwcWq
	zML8eLZ4AOsY7337tLHnP6Zjs7gciOLNG7N1d0aUIvfmuSyF/81pq1uoLAbEj7aA0BaDw6wfxAMuP
	6cf+/gOPQT/VxemVxyMumf8E+RNmRa2iRY5FenTk+STbDSqDraZdYQCKQDCfC7sX23OAQKMKC5e8K
	FqcIsuKGRHCgGc0K+Mpsa5PuInWXSJMbkanuR6de2Sb5+Hdf4BLJTDvWDpfspM3LVZmsGyIcH0Wxc
	/NVsml4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIM-0000000G1ki-0fA4;
	Mon, 25 May 2026 01:39:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIE-0000000G1h6-3YZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:49 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7de46b8e432so8544455a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673186; x=1780277986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
        b=AeJrqKPgOtoi7XyiGAzD243z3VdWiLPNFM2OdeqibJLrP3ouTr+g2e+ohkKLoZZT9X
         rg5bBnHFrv3F+9ki0HIsCpPN6ZImuuoFwf5DICm7XQAO+ZJYuuClwjfwGE02PXU8wn6T
         mvBjZe6h6i2pcjhRZ9ACjRf8mn1dzJornDWW6RIddnmmFs2FYvZZBwSrTNGnqnGgZrao
         1sGZCEa0AMLDbBFAPNPB9IbpzHUXmR6rAzfNolnUYNCK8BFSLDN6DWih0zsQVrrOSc/Y
         OjMoYPOL2h/cb8iyzlWhE4mjRe30c5HZ8oGRejiDpX6Evgs1Tr8fClKeVWbk8bYpPLjL
         fwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673186; x=1780277986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
        b=UDxAdZfZ7u5X4/iLpW85UAG25wGO8+gBQB92x+delEfzaqvrVsDU60hSYvdSA028Jw
         fz+vQhhPpbjC4P/14EOtdrssJwZ55HFFJVoEXO3dZJ91Gi1yT8T6OYkRoUaA8HHdfcE3
         CyhfwZKqyU0nYVfN7ZvhXuDJXGi9ELMd8z9ZILIuNQYOrGOYwk6E05kATqO0myFwaGUm
         Aceetng2y+MdcEE3TSTg5sD32pvjNWoyOVKA30VoBtSN3wLvCHuhcp6jNmPyM/a+xAXb
         6yfTSY6HNSswolr8jhWH6gq7UGMnzj+nLOtYeWg3mr4Vph3e2jbaFQ1Ndq5NiUu9nO12
         8n/w==
X-Forwarded-Encrypted: i=1; AFNElJ8XvC8O0wnAke5sSu3RxE/oxfuyBBm6qRefzCXSj4yVvQ0nUyXxmQlAYMaXQphcDGjrT8gMuksW8X7q1Hgw+z64@lists.infradead.org
X-Gm-Message-State: AOJu0YyjCJER8OxbGhLtzwX8DfTu+lK0eWwo0Is/mNTCDoADP571PI01
	k4Sn6FnIstzqbPjBFhhdUVNGyhMZspFGT8qETTLlIcHmFNagMRLwf5CTR6sWbLd52X0=
X-Gm-Gg: Acq92OFQylHdJAerKwJld8C2Ock8a6AyFrtM5BZDUidhsFkdApPUcCUORCHpsMU5eRe
	o1neWVh4nY+g40IX06fzszaMLYOIu14cATVrQb9YGVgd6HmN7ADu+trlaaM/k/gB9YJpB1Q2/Ld
	Z/YrtgCFVafhi2vAGlT0gncKDtqHRw/aszGPx8H4lXG5UizH+f0mXh65Xxwl9HQfoj5IG/f3eXO
	TjnMkmImkxezFEBCWhVfc9riCn6N4HAk3iRkOzu7BkrKTkTSlHMHc0IcZPv8lFLntHntspVvIPb
	hl4R2yAHsJBXq2gidjBvDcSoi2ArmSoBBV98GH14TR5/aANc+8c68VWDolEjfuEkFZBZ7P7VRoh
	fSyIR7FebdPrsavG0bf2nSNJ4WcBOIdYWBcsPyVan5HKwdjRrdn3SzSUD6O7mmyC0+nYbR8Djil
	f9diTEhkbvE1NJPHSAwWSmhOMZaEpXNrSP4C5nRCQ=
X-Received: by 2002:a05:6830:3c8c:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e5fef83672mr7641141a34.25.1779673185757;
        Sun, 24 May 2026 18:39:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:33 -0500
Subject: [PATCH v2 1/9] iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be
 compound literal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-1-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fKuBtJfAfzCPrk3RdMloY3OvsD35TA24knEc3HPqxbI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gkbp2XpLy55TfXwCfXUXCOiKIRuOMxo3k8B
 SKcIFfNBt6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoJAAKCRDCzCAB/wGP
 wGJ0B/sF6GcNKoszGrdS3K3qVjnpXeZGkJO10bpDXR4Y3SRxc7dVTNe9sllJCpyKPQhdmnCCdbJ
 8MYmZ77vnGZLM3YPs09/4cO6Oz6yDoJdjxh7zlvnMcmgzm6Dj5l0P/a5r3Uh0V2wvH2dex7ggHd
 SaF2Oi0IeM0dI26Bx0hksIsaLx2dTD8BLZqrx+y6qY4bVH9v0EmzoSsAmfE7WKnvYGyxdGtFB+2
 UvMVrh/rhy3kOiOk0JJNOyIo2OsCanJ/fKxsfW12+iDCn6TSQXXQZG9iH8086GSo3wlX5XRc77q
 SCocumfHN0Fis55ywvYaqhtzzSiGdfFfcIICVJQWNs/3mTWy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183947_013002_CD161795 
X-CRM114-Status: GOOD (  14.11  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Currently IIO_CHAN_SOFT_TIMESTAMP() can only be used to fill the static
data.  In some cases it would be convenient to use it as right value in
the assignment operation. But it can't be done as is, because compiler
has no clue about the data layout. Converting it to be a compound literal
allows the above mentioned usage.

While at it, tidy up the indentation.

We also have to change existing uses of compound literal at the same
time to avoid compiler errors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: David Lechner <dlechner@baylibre.com> (fixed compile errors)
---
 drivers/iio/adc/ad7606.c   | 2 +-
 drivers/iio/adc/max11410.c | 2 +-
 include/linux/iio/iio.h    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d9271894f091..cebb8ed8dcb1 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1475,7 +1475,7 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 	}
 
 	if (slow_bus)
-		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
+		channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->channels = channels;
 
diff --git a/drivers/iio/adc/max11410.c b/drivers/iio/adc/max11410.c
index 69351f4f10bb..dc1b96356592 100644
--- a/drivers/iio/adc/max11410.c
+++ b/drivers/iio/adc/max11410.c
@@ -804,7 +804,7 @@ static int max11410_parse_channels(struct max11410_state *st,
 		chan_idx++;
 	}
 
-	channels[chan_idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
+	channels[chan_idx] = IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
 
 	indio_dev->num_channels = chan_idx + 1;
 	indio_dev->channels = channels;
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 96b05c86c325..711c00f67371 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -353,15 +353,15 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
 		(chan->info_mask_shared_by_all_available & BIT(type));
 }
 
-#define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
+#define IIO_CHAN_SOFT_TIMESTAMP(_si) (struct iio_chan_spec) {		\
 	.type = IIO_TIMESTAMP,						\
 	.channel = -1,							\
 	.scan_index = _si,						\
 	.scan_type = {							\
 		.sign = 's',						\
-		.realbits = 64,					\
+		.realbits = 64,						\
 		.storagebits = 64,					\
-		},							\
+	},								\
 }
 
 s64 iio_get_time_ns(const struct iio_dev *indio_dev);

-- 
2.43.0


