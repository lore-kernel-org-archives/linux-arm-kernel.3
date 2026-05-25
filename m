Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D34CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=; b=3nbqsUcTPhVdR5d9ndouVJT8Nq
	bIaegueXPczhVNSvp6WxzjIZbEBkxUZQS3BiBtkzBT53uiZU78QPjcSaIrIWzf1lN6q8UHl9NKXko
	3ASAkiQePS7s428UThjYwRsVK45CBSRNvEbaJT4Haq24sOAms/5bOaKSbTRoXhgoXArAgLG12K9KR
	TRJZE4BfHi1shHX0xAFpsFYypBB9vFWT/HNYo2tUMv17t79QCyInMbB9x+jdFSNvGB6mIVeoGZOa8
	Hm1qKqbPgjSAnFwrMu7ARI6pMUVkA/yok81TQFRP+nDNeCKrnN///58yUpT1J/gODzZTro/Pehs6T
	+9pUFM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKId-0000000G1xI-3Izl;
	Mon, 25 May 2026 01:40:11 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIL-0000000G1kF-2A1W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:54 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e61da76fd9so1073295a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673192; x=1780277992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
        b=i2Bj5WHPPWQ9YWI6/vm9sN3zPq9pIonxHLokqe6uLcie8qgQ8SknZeLuI3JWTT3uEP
         9evvm+wPSMaDUPOe2YzbPl41xUsF0vG0bGrR6gXkcpGcudr8J9BTfYN7euaRRCXzQfao
         s5YX2qW7GMjQG88M/7AfvfgP9iKbZY9OuUKoHlh2oUUZRgQVrj9IFWa7L5vy3kGWmNh1
         C7Zzmu6fWOF20ssyx09GdWY06/LO9h8Z7At79cGL1iM6fvBKWLDhbWceTaiJGTCK9PMI
         XlNr5mPC8Iq3b14iC7Padmvlb5t9kb/o/KOiFlMNyybuSUm5hZBQ6T3IO1TQXjKlQ83O
         bSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673192; x=1780277992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
        b=LUOQQ2+N0PmTLi9H2f/h+Zmyio1vorje1DkUS7XnMrtXY+PIVTZSDKvdwWRytlUswr
         CK+3rzXNW7XvsbvfTDPbjGrdztSs8G57lZQign2Nh9/vAt+0YFrR3xE2F3S5TsGMUI1g
         c6dhHe8M3e8ogyYGUa/E2xUmNqmY5LZOMpRbYQMUvc6i9ONOoBaLordXqha3PpYgmnPh
         fEb17OhV0Sp4jy0gbRq01V+P4Iyl79f1n1kH14MAJNg/a+NHD2DqVERPj3qYstcEOFDA
         HkoO7tAAHgVHbkeM62Cxuh3xcHiWhheIj7fXAdLGn1hLHYVn0/zvaNilFAoTv0JeEObq
         tuDg==
X-Forwarded-Encrypted: i=1; AFNElJ/urChWl0tLyfuCqLcZ7dGtJL9G577BlNkU2gbn/P/YPg/7sGMdsT89MzZLozUY1OMIj0Bl/cZiEuPxWlbn73SR@lists.infradead.org
X-Gm-Message-State: AOJu0YweiW0J2lUG19l4thlVPuaoOJHp2gA9EHBT7Vp49FmKvHRNxknG
	CeSYXup0eGWT7OLesNKKJYZ75CAqRfFKUNzz5Uf2o96zp4idkh6mF/n9HcQORpkhhpQ=
X-Gm-Gg: Acq92OEsTSgU33+00+g3Z0T32Cc7n+/KWPzpX2QWgQSjYGO9SrJNiyIgwXP7TyKSjJj
	gfkQcoWga2pBvpA9M3x6Z3X2F1/3BB6MBN6IeJrZIA0zR815ibpMdY19jMAmptwdEqFh2Jc3WhO
	UNo6xqP8Edb8THLtcD6Wm73SagZBBej2pg24ZpEEsjNBK/s+ZdrVm4h2RyzjyTEeHdrUePNpoGE
	+qs0EolNWJ+O/rEHedblv3LeTWoxLfA/fy1NIZQVTqr7nK5oInaQ/FmJPXxOUPXIP86oX4aANOe
	XjLgKQCNteezrJ/Fxv0wVKAMuIxMFCs8RpUo4BXbwb4u5Cf4YsyCEs0zus1eXlOeXGd0pm6xFC+
	vmYNrkdzaA52lbIoAQc0KLqIIBmraV8kawZMJswSNcqJwFr3X5ieCfHLhbhSCEVJXQzOaTPZaQV
	GQqiX1q52MEQy25A4jaXC/+FNAWsq6
X-Received: by 2002:a05:6830:67eb:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7e5fedf1913mr8821807a34.11.1779673192588;
        Sun, 24 May 2026 18:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:37 -0500
Subject: [PATCH v2 5/9] iio: adc: cc10001_adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-5-c37c9408b7f7@baylibre.com>
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
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=a5s5z+cub3SAmh1xynpckVoWZ22C7+19bL3gHnAgtKo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g/yjb213zQLbMwk6iuHebY91dnjXtb+FUCD
 vvtjZPSn4+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoPwAKCRDCzCAB/wGP
 wPwgB/kBmXUguncTbHCacyEQoFcxVZzlf/TOYZUKfnV2TLLum71flgDtMY1b0gdyXRmp3fM/OyK
 GuIvva8ImnHI+QUy7DVup2FJijaxuRZL4liv8BzuDmz+jrk+tGdFxjou/iziU5yzpsxn3h0UReg
 crutlwGxtN4TM7gBRUBqtvDGeGuTAtMiyHz3lJidkFemL9Vnwdy11RXMoLo6xpspnIby3loNKcM
 rwkb03JkzYTPV90rUuc1zVI4NWRdGhcSJ6QcGg25nQV8e+pjnmj4ZPxBeI518VkgGwI2bg+ySOG
 7EkIojBOcPvtAZMyAu4+KQxGhDwPFUmM2l1bB+pLFJTdoSgq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183953_568073_F90F8EB8 
X-CRM114-Status: GOOD (  12.63  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/cc10001_adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..d42b747325aa 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -262,7 +262,7 @@ static const struct iio_info cc10001_adc_info = {
 static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 				    unsigned long channel_map)
 {
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	unsigned int bit, idx = 0;
 
 	indio_dev->num_channels = bitmap_weight(&channel_map,
@@ -289,13 +289,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 		idx++;
 	}
 
-	timestamp = &chan_array[idx];
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	indio_dev->channels = chan_array;
 

-- 
2.43.0


