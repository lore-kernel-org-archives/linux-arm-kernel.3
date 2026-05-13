Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE8ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=; b=DlaQ2sSlbg7iZZc3Vj319eq8SR
	zZbsJ5DjAJKhWiDYx6bKbU/V5kcDNG1FZFdrabZpzcbSefUUD7wODRlbt/zkQseOIgvQbDjwM9es6
	hmxcdV6jepcTtsi+3NjHNYXSs5l7d9zuiZXy4k0tF+nAW+12hIbFFP4f0eNFpviAZUaSk3uxe9qJU
	rQEw6y6tNqf0puJuZIa7YACHevK1nSdAw1rxkKaxdaJaYN2ib/ce/zhoq7WjZgh24uzCUEzVFzP5n
	Hy1ku/1oTiaU9fvzDQbUeE2LN4rylDfcflIy7f6DZe1iRhMQOVjCN3vfX5e2Mzg3z6NMhR8bCGqqy
	+VPhh3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZW-00000000n64-483t;
	Wed, 13 May 2026 00:35:34 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZU-00000000n5D-0zWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 00:35:33 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2c156c4a9efso8362127eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 17:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778632531; x=1779237331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=;
        b=eROsODcQIPXcNgGFsgAjRtVmRqzHF7xsW7KyeFBEgTnPm+Cn3N3wYINMGMlaKrWmuy
         a9Hz5yVjwt2MKVrOd+YRgdXpiEpxphZH/5FaofgkqO3ItXw67ZhxUXxpUuLPKQ3B8sXj
         04vaw6qkdKP/dnErnHYC96rujY6tbyvSvQSPMqtEDqlL9JBpw9ynqgOp4CrMWjNitR8e
         ZrFcdpZ46iUjGQwN0SLQ+D7xNGcdzx1SrUvlOYKKCboRHHklyGvlnR31TsgZkNxBE4md
         i2qCzXxep7oPj4OJRurhkdkmlOOLvh/EfD3Jbkyd5iw1ldfs2eaPtAe/Nr4pc2cYX5dW
         T36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778632531; x=1779237331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=;
        b=LpXC2EfSqrP1LSP+0OnI8EuyFWeq8kyoScjGNCszB9EJ2gZZux4xxvLQ8UMqWy8NjZ
         Y8zxnnbK7VB2Z7aP6iSpOUa2aMLdg8OftGCYMUKpjQGYzibRX+rB54ivmMyFXSOaiI6u
         CNOHCFbbmrcjC4n98QfkZyNIQxg/MorQvIDPpVGryjMLIM2cGYzG3M++bB+roc2+Ey/I
         XaGLHIxY43GgrHI5BH1+FLPZRKpQC2RO9JlsNYXeQzWV5gLVI9sUnVJMtlunAzTqYe5v
         JLlPTrg/5POyJ+x5g9UaHatzHC9lih6fjvaabWr4P2JI65trpgvi9BG4+qyTkzR7Bze7
         O/uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nZ0OBAZgTb/GfCm/USMqtjv8AWkIRbX0lJhGBufhD0KpVX8kFfhYZo9MjQcOXD/TmNScwLh6UzDsU1Aep6tN9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ZqR5TTs1Gx/cBCx5mABhxnl00JrUKIEm07bDcflLFJo1ZmXT
	OkwtngE4HS+K7JykkW1qsM3O2kv6OeP28kklaa/H0QBZ5mdut93d0q8KZ3Q1MvRa7vU=
X-Gm-Gg: Acq92OGKci7FalWHCPyOwF6yv775fJ9SGRE1Sp7oiJfs00+ijwsrT5ejpnzn8ioUk30
	noaSVXYwdkeSWZukkGEwIwzmZ4YBtRA2Q4yTmpN4HMkWq6HvGp8uLOcXS35GSLLTaYt04tV1mj2
	WBXLkCEmm1GogfbGxqqz4UB1qITk1PKvdEinkt81FB6Uz6qarlzuvC2Teag70GxlY1wBgd2e6C2
	HkVmqTkxppE9rkSSt1oat3cvkaWx9Z5nBXF5B8dcPH+/jKtNMK9FYnfI0HUgfdGkoLykgiBN6Kt
	ExRWQMHLZ/mcwa9yoareyJ4O+kly1IdHMbq+JcNH4HGoSDdSt6/XlqSUQXEIr3bpeFZjC42pODd
	8v0Kd6X2dcYFffXTP9gsuXS9l+y63fg8mnlcqMLCVSJkeph/QwKAZtDqIURUG5WGPq35O3cO0I1
	gpdJXG//7f5KCWdS67IqyFII60I5QVwsoyP2xi3ZVBzlBX/J//kwkN5A4jaxZHjmaWbVNZyl6ID
	8zhjfY/SNXhy2b304iirNJr3q44Vybw81nnCVPF8AhnKkfr
X-Received: by 2002:a05:7301:600c:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-30156511808mr260791eec.23.1778632531367;
        Tue, 12 May 2026 17:35:31 -0700 (PDT)
Received: from gui-host.Dlink ([177.140.77.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm18471381eec.0.2026.05.12.17.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 17:35:30 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: anand.ashok.dumbre@xilinx.com,
	andy@kernel.org,
	conall.ogriofa@amd.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	manish.narani@xilinx.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	salih.erim@amd.com
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan.Cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 2/3] iio: adc: xilinx-ams: use guard(mutex) for automatic locking
Date: Tue, 12 May 2026 21:31:51 -0300
Message-ID: <20260513003503.339418-3-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513003503.339418-1-guilherme.bozi@usp.br>
References: <20260513003503.339418-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173532_279816_B3A07AEE 
X-CRM114-Status: GOOD (  12.51  )
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

Replace open-coded mutex_lock()/mutex_unlock() pairs with
guard(mutex) to simplify locking and ensure proper unlock on
all control flow paths.

This removes explicit unlock handling, reduces boilerplate,
and avoids potential mistakes in error paths while keeping
the behavior unchanged.

Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/xilinx-ams.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 6191cd1b29a5..70a1f97f6dad 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -720,22 +720,20 @@ static int ams_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
-		mutex_lock(&ams->lock);
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&ams->lock);
 		if (chan->scan_index >= AMS_CTRL_SEQ_BASE) {
 			ret = ams_read_vcc_reg(ams, chan->address, val);
 			if (ret)
-				goto unlock_mutex;
+				return ret;
 			ams_enable_channel_sequence(indio_dev);
 		} else if (chan->scan_index >= AMS_PS_SEQ_MAX)
 			*val = readl(ams->pl_base + chan->address);
 		else
 			*val = readl(ams->ps_base + chan->address);
 
-		ret = IIO_VAL_INT;
-unlock_mutex:
-		mutex_unlock(&ams->lock);
-		return ret;
+		return IIO_VAL_INT;
+	}
 	case IIO_CHAN_INFO_SCALE:
 		switch (chan->type) {
 		case IIO_VOLTAGE:
@@ -939,7 +937,7 @@ static int ams_write_event_config(struct iio_dev *indio_dev,
 
 	alarm = ams_get_alarm_mask(chan->scan_index);
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	if (state)
 		ams->alarm_mask |= alarm;
@@ -948,8 +946,6 @@ static int ams_write_event_config(struct iio_dev *indio_dev,
 
 	ams_update_alarm(ams, ams->alarm_mask);
 
-	mutex_unlock(&ams->lock);
-
 	return 0;
 }
 
@@ -962,15 +958,13 @@ static int ams_read_event_value(struct iio_dev *indio_dev,
 	struct ams *ams = iio_priv(indio_dev);
 	unsigned int offset = ams_get_alarm_offset(chan->scan_index, dir);
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	if (chan->scan_index >= AMS_PS_SEQ_MAX)
 		*val = readl(ams->pl_base + offset);
 	else
 		*val = readl(ams->ps_base + offset);
 
-	mutex_unlock(&ams->lock);
-
 	return IIO_VAL_INT;
 }
 
@@ -983,7 +977,7 @@ static int ams_write_event_value(struct iio_dev *indio_dev,
 	struct ams *ams = iio_priv(indio_dev);
 	unsigned int offset;
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	/* Set temperature channel threshold to direct threshold */
 	if (chan->type == IIO_TEMP) {
@@ -1005,8 +999,6 @@ static int ams_write_event_value(struct iio_dev *indio_dev,
 	else
 		writel(val, ams->ps_base + offset);
 
-	mutex_unlock(&ams->lock);
-
 	return 0;
 }
 
-- 
2.47.3


