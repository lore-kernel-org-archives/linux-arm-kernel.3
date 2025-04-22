Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C35DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyqEc2A1DVG0wlj0as96NOrenir8mMhhJ0tJFCy/DAk=; b=S0qtDClFG0zfx++OboQHq+UfAR
	/CaGIv+KeGK81wgD9wFKi9QH5avta+MAgUnFrlR+uDStURq0GIY2EOCjbvK+39pfNsFXNQsgBERKy
	wN1lemaJWJG5GNFR96JywCthj13OqUWssINq/tW6ORGFiKWyYboIDSoIRGAGUMKVAJdEtuhyJz24Q
	hT74Mko3rRivv3ibU+3nlWjDN3pqXdOnjP8O1BA5DduhnWyUimxP6xl4DHboBWXSRBCkGXoScibJT
	kvwGbYribd/oSIYJLzsYI21Fc+ckkY7SkWKY2Dvs70wvkO2TEto3H9AIDw64w6rR/r5ab5Q4a5+gn
	fdqgMLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lys-00000008hLv-4Bni;
	Tue, 22 Apr 2025 22:20:43 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnM-00000008foY-40uz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:50 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7302a769534so1475197a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359728; x=1745964528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyqEc2A1DVG0wlj0as96NOrenir8mMhhJ0tJFCy/DAk=;
        b=3LOXotjtxU9kqakQBHRwWL62pejNI1O0hw6khN83Umrs1C06awxPSqljaw+gGu589/
         kP7pQ3aQBio+Ys8BnIomLsn9aoum0RmtqdS1tW50F/ibJs+UO7imbpo1kqwMId+UFy8/
         DXlG17no5LMXGEFMd0IB7s9VNueO8tqGOkL4FA+gVj5L3u85+a+5OV5B1O5DwdhwMfuC
         1UwzAitt1XWYMTa+45SQheKF3+0NLSizeqNQ2xAcYmdEDyAtIwAtW9eLFz+4phni0Rlw
         H8V8bwxptRxCHX3tNPcXAUnR2F2jT5y3xe2cyX5s4UlyElRC4xQYcg7gLIk/Zp4tIe5d
         GJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359728; x=1745964528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyqEc2A1DVG0wlj0as96NOrenir8mMhhJ0tJFCy/DAk=;
        b=Z/FhSq2+V1dp1UptEl2v54o75J3halc/wPMUgeWuAMG/iwY9iTWJdKu0CcfgtAeaGo
         cpXvm8FkX4hdVuy6ZSfx95imsFO1Y4PoEUWBJRUvCdbhuc4EuRMNXUMl0m7JIezqcype
         eF1+pc8HB8verhlGobagpUgehXQL3BSqy1mRT8eJWsPmPLst1hMVWpksmijQDncVCn3H
         S54iFQe7FK73x2y1IZtDnGSaXZGyPjIZH6JNsykviV/JiqpwgWtWEqHUvflqsdHn8lOH
         7hmyW5aObeXGsLV62ch3JzTZVpR117w3oj9RyMtJJHdL7pjjzw7g/ah5au92mx0XuW1q
         Wn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTgcqIAHr5pX3EUViG40FaLTg+QWUrr9XUW4w/aZwtgOpHNSv4efGCFYwpDHPIztE2Wwj93pz+LUagsMzPm6ih@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+HnqkzrwvxIYX9CiWe37ylH/vqC5TaVl4R/0GHETqqoJNw+5U
	TSpT34knwuxw+Fnz6xqhMpRQCWHNtxQ9M4qV+FkCna149j6/fkYejwc1X+/Ritw=
X-Gm-Gg: ASbGnctcEaxl5Ro0g0cki3rDM+Qc46DLHtMWWRopncObZ3NOGxpWKuFCcLVGCxag9++
	k6D+dvROyWwwWmqhOSwNjwp91XC+vsi/CO2oqbXpXIGvgoKTGl/uJJDVirODiioNp12bkHVnycA
	NRhHQt+oTVGlqAWrtpW1uM49VKbpjmUQsUfcktAdjst2vQ9w0mY4TiXhnls47e4e4pVNUYF8G+n
	Zgt+sXW2qkUx+YxKoqDbCQPWwwfDOkvj5mD/pssVVgT4tcUWbs6VlKnw7fl44jC/KD6gvE1WvvL
	nleTiK/mLTNFWC/ST+/mpIITfT40WhdSBTLUMrMR0WPqAOM=
X-Google-Smtp-Source: AGHT+IEwuSSEoXlMTOYuepjnaQFx4CQHYKXQ+tl+tvq0S6my8j7uhxkWwjCkcKQdGsBjFpysXR3rjg==
X-Received: by 2002:a05:6830:3693:b0:72b:9316:d596 with SMTP id 46e09a7af769-730061f15a7mr10959124a34.3.1745359727937;
        Tue, 22 Apr 2025 15:08:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:48 -0500
Subject: [PATCH v2 3/6] iio: adc: ad4695: use IIO_DECLARE_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-3-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NrHDY/s0Q8dzJXv6IKAEg8Tm8DyekgOKnNJSWC3747I=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNL77G6l8A6/bF//fY7ZeTEg8wbGvyZFhMTD
 6IADhTu2bqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTSwAKCRDCzCAB/wGP
 wH2AB/976GCXJlNczBYNpuoqzA3QSldjyAoLBUjnc98rGro5CMS2LYb45sJ2n0Imtc0rqRArxHL
 w6jcfJEO4D9RR5471sgm56n3vimrEmNiNoJX5Go0VLqd24YLaCCIzi5LfAw+2bIQvGpqIs9OMz8
 y/F14BplhIVtRU25Ncgcfmnwa+ZIo52uWrQFI88i3mSkHVKvLktfZz1VlUgWrcavbCNCf9Rt1jo
 f7U2Ca8mfA7CF2AEgiz9OCIc0XzDEH5SiKpp5T5tPCByU7j71MzT7C8nBRSubav6SCqRIWisv1O
 LCl2DRu4gvDq3NuXQandle0Z6LC8R0WdvHNaXPvlbITyoWz3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150848_998844_67ECEE14 
X-CRM114-Status: GOOD (  12.44  )
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

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

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


