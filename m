Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E4ED7B8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awUe3e2jpc4F1xQVkktJdoRgPIx6DXz98TwiAeCpRmw=; b=YkYAhCBHVA5Rg76s2W9HXXJ28g
	4iz2EY1meJapZAXwYkRiV6LZFHdWojm6ubkEzgtDkyIEUv0NtKdisAv8i+b3XKbXZE9CDYf0jmcEW
	eWaY03rvwTIC/B5xHrC+c12jwqc0uO/ENCNUWXz/BBERIVBKCJbrU2ejhAkxnBUGifxdJkaEtA0El
	lIc6xLLbTR6IE13Jt5rdS0UDBASHFoud5/szM0cfBeEGShhgMEk/ttKgM1KTHlpE4Hnv3YXXs2dV0
	xPchhtqlxh9gFM9g9sAdc8AgGu2OSCIJAF2YyoP26d2cwc8bIabC7RhekUr7swOJbsoZ0vyBxcR3D
	1fd53h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6V-0000000H3XH-3LVm;
	Tue, 14 Apr 2026 09:30:43 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6T-0000000H3Wi-2UB1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:30:42 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2d9916deb14so2751040eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776159041; x=1776763841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awUe3e2jpc4F1xQVkktJdoRgPIx6DXz98TwiAeCpRmw=;
        b=sq77FWj2SRdMxX0ZMJD3Eosi11jjeIV+CoZn7NQ+8a6PO4CgbBWQFWViQ6Tw9px0Iu
         BoYZBmEcljAnClxUFu25T/Q8PsflGWGwwmgF8gHgOjoxcykjvZid6sNDgXGjnap3K50c
         bspazAUNHQBijDlc6Eq88YFN88tAZEiQ6cphkDv7GjWCJ5ZLUuiMr6Y3fFEgVIN7bmt5
         lBqVNfOj5T0j7WFpm45oR3uCGAbc+2d6rENguJpTdZEGIufOCRpIi1vTjwAii3oFhXEP
         z9IDr9khGzmyXEqWz0iHkoAX0bwUEUhXhtX1uYXd5rwTRPFXGSPLj+yfa8ocSkBJ2t5b
         TtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159041; x=1776763841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awUe3e2jpc4F1xQVkktJdoRgPIx6DXz98TwiAeCpRmw=;
        b=dc2kpWUh8aZu/lW8QPqdJ4aXeTjOHQylgSIlq3Tnq+xbslrr2pVR4C8lfm7q3SsChT
         V9lyobDSAS+Kmeu4P2C4r1vsisnXo/XFe/TCnF45SswevKsNgZq+8ZO97hcZ9804t0vu
         /PFOOV/3S1E7qm1WbLEs/iDOVqJazCYmuDw7R9CPKklVzfGYk3xJJ3j7lu5srD5wooPn
         HSB0aFjbtPv4cW+VhyttCzYB2aqdDjh9ivdRMqsR6X1tlHbTuSpjmFNVObgmQ3VUzyJ7
         QCtGlu7K0F1uCYIi2NUdeJHvzW7K9ayviPrHMvevdbTgd1KaXJ0MUF+qcjsdnhZmagSN
         MPNw==
X-Forwarded-Encrypted: i=1; AFNElJ9piDrwZnUNiyc6oGAvftxMZwrWT+cPqGk3fi82MJrY9fpL5JfghKg7u5RN+T2zfqejOE5BTb7SW2IPaUQJ3126@lists.infradead.org
X-Gm-Message-State: AOJu0YwSQ08S/+sBgWX7sHrsFdaH2GQXQmUnqU2XB/+Ojc+Mf8tX+FDf
	8Gs79xW0rXw0pdI8gIPS/EnRpCNFYRQEXKW5U6xDr/JPqDSciDymEubFAfUxfmORmbg=
X-Gm-Gg: AeBDievPO32rb+W5TQbvemuM19VJh01ALH1E2rTqfEZ8vba1nJyIiDviXugBduO1wUj
	0R3J+T8x1nhJuq9RhL3XvYTyYqq3boWY4Qz0rxu3Q8xIMr2XI/qeFejvY/19fK/sFJjeRnDedLt
	N7QYbV9iKVeve9Et7Q2ZmL6AmQJ5EFIax5mdfnHYNeUMetyyyM49/f2wsNKPHGrPSlagL9LYiSz
	4qwFRZrVwG9b3fmFWtFQR5OGsModBpqiVX6qYMqTmy2N1Vicn9y8e5widAJEOBpzEaerNm3gTGP
	mYBp3uJomu8XXzGv5PCWUa3GNdi33PFoZGee/J+lc8t0HVx6vzWkIht53/Ca4XI6/lczxbnvy34
	zNGmJsDc3PRjE7kzsfk4NlEXTN8GBIgYaMA0ewuYK9uHO/Wuby1J+yniXWl4pQzgHi4ZR6kjslN
	U0eldji8zadLN4uTZSTf1e+6i4Kfic2FJA2bids99fFpbjhpn1eefKHZwOOsxyS64RfGzg3kLnE
	/C71EwtTtRmCl1fWSxtTeNTnBpGkELy5cpCBAA52ciYmVNGYA==
X-Received: by 2002:a05:693c:26c2:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-2d8730215b3mr3347154eec.16.1776159040566;
        Tue, 14 Apr 2026 02:30:40 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm20327599eec.26.2026.04.14.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:30:40 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
Date: Tue, 14 Apr 2026 06:29:28 -0300
Message-ID: <20260414093018.7153-2-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414093018.7153-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023041_633843_5A5DB0CF 
X-CRM114-Status: GOOD (  11.40  )
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

ams_event_to_channel() may return a pointer past the end of
dev->channels when no matching scan_index is found. This can lead
to invalid memory access in ams_handle_event().

Add a bounds check in ams_event_to_channel() and return NULL when
no channel is found. Also guard the caller to safely handle this
case.

Fixes: <d5c70627a79455154f5f636096abe6fe57510605>
Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
---
 drivers/iio/adc/xilinx-ams.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 124470c92529..f364e69a5a0d 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -871,6 +871,9 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 		if (dev->channels[i].scan_index == scan_index)
 			break;
 
+	if (i >= dev->num_channels)
+		return NULL;
+
 	return &dev->channels[i];
 }
 
@@ -1012,6 +1015,8 @@ static void ams_handle_event(struct iio_dev *indio_dev, u32 event)
 	const struct iio_chan_spec *chan;
 
 	chan = ams_event_to_channel(indio_dev, event);
+	if (!chan)
+		return;
 
 	if (chan->type == IIO_TEMP) {
 		/*
-- 
2.47.3


