Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EEBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2eAy2RW5hS2l6KPQzT1N6BY4unTaPpEg4WKTF1g7HU=; b=FrfTnBS/9GKPPRXmYtO7HbHCXv
	hRb81SldJWyjFmTb4t9fkuE2Qzx1yYX0omDGCl2KFW2v0KMp1AWs45QTTIGppzvzAsiUCDpIM+oJj
	uUT7a16zGgq6fQjwJLH0xfyZPx4KvQ+zdunRuOZbqYCrvy9rR8Nw0EW1F88irye9+olecEi2CogQH
	LgclzMk+9U8jupTh7bTAAeafO16FkbxIOAnsUdrObe8ZUJBlGL3RIcw9LCQlEw6eWa6mUTJ7lbS2I
	MBHMiANJdM+ghMBbMvP5r6A7K9/ZYzP0Wm9JpA42gL1sw7opswQF6cigqaq6glPAZFMlDedrBXGDb
	++VUvFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClns-0000000Gjrg-0mgv;
	Wed, 07 May 2025 20:55:44 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClcS-0000000Gi3s-2Qg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:43:57 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-85d9a87660fso19040739f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650635; x=1747255435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2eAy2RW5hS2l6KPQzT1N6BY4unTaPpEg4WKTF1g7HU=;
        b=roWE9zukVXd00ZTghTeDyFQKCVb/QkkTojxeG6a/jbiGSFyHPFllbbGK4VhZ/gi6Dj
         o1j+U801cVemnee+MeTo3gU4lxhfyfJ0S6lBmjhjCA7oM89vwdtfx20WlhHHXGOGjXWH
         w4dwZjZnd1aOoFH3lmu2bRPz+AGlJ1If9nGZkITXHze+quislX39JHZ9fAtIdKcNL10j
         NsvVtg4/P9blNWFXZrZW2CPMNm9q+4VgcYMrB6zXBRAQqDmQZg67l6mHoZo5dcT3H4KT
         d2w4u5Lm8apkufRZ/ifnRLEzaHCtOHqokAj7TeQuE/ysCL033Vmr8ek/2FeTLzPIWhek
         pABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650635; x=1747255435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2eAy2RW5hS2l6KPQzT1N6BY4unTaPpEg4WKTF1g7HU=;
        b=Ap6Arpfpyl9JyYSI3piwpUSypd+PYQrVc2VJLULXygJ+JRZZwKbCR3WJ23028vO1ka
         v/13094SEHH96CpJaQ/mMCyHWJyzp12Hx5JdPqJ99ayWX4KWBcIr4soiMNM1dB0gjwz5
         3er9QsnV1c6zY+6BAXhTgtQ3SbFmNJAkOIci7W1tRNSmyEeikaSg/CovjXWutiOl08WS
         uN5Us78rxjM+cJ1zlFYRFDpvSCKvRaw3BV20Xm+iTy0viOwK1MdFWSkvvcGMAmC8aS8U
         0ZpuGMoJ+PJv1UAaHkZtt2sbm1W1mmx2dsOGHQOk5wJg36XXuIqeMtvHjpIJdiBeEghH
         Z1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBC38RbFjo5VrqkYbfvwAvvvvQHGYFkEFrcnLDDT2cnxXmkwzbLkfmxNazixeZGIWbgeqczCtzQlv4TtOI1yH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Y/5OpcirkyEO9CeOqlhgp12Z+ACS12TEin2xN9c0cAGvUSo7
	syXBUAOL5rA6PvlG2cN6grUE5W0RBcqkdUEKOElUXtAvEY4GcoUNrK5JPB7JuJGqKRHzzEMUCDT
	B
X-Gm-Gg: ASbGncv7wI7x0zTazkd0wIUWXPqCyIdKqOeve4M16BZs54mXkFGx4xTRGug6Xy/LTCE
	kXbSmQbQZx4gQjZzbDlCCQzM8LVKOExN82mktRK7nb7f/wa43xTX18JJzypW9kd9Br2cOXdvC1t
	Ec74bEdLM55VakSWmoEr3m4XJG11XSXPd56uktkNWWZxbvg/5QJjf/AXYseL8dMyd6Oh8iIzYtH
	+Pyz9LuyDb5AGSg6rRTFkH4NYExru6Atjl5xGhSYNqrmOBaRDmkBaVO07XSnXmZO9ZNKEuRit+2
	hX4QgZzpIQDwF/cb4s9DOcl9fop5aw7zNFkAMrFNI6P79FjnVR4NLChI
X-Google-Smtp-Source: AGHT+IHzAHhf7adgAgCwkuC/t79NMGTnVH1TVIxPBrVXd3EvJcltzOzimp3xX9uDQtvTagqhfmWlkA==
X-Received: by 2002:a05:6870:9a17:b0:2d6:241:aed5 with SMTP id 586e51a60fabf-2db5c084b8bmr3450729fac.26.1746650624758;
        Wed, 07 May 2025 13:43:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:42 -0500
Subject: [PATCH v6 3/7] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-3-4aee1b9f1b89@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=FKpB3dJAiexqEBZWnTYr74fw3YEDDpNI+Is7oC3Guzk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XYJuOU1coFxNGXKJ8ETwdyznURBIo5GKTW0
 fBmAN0sBOKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF2AAKCRDCzCAB/wGP
 wNwqB/43rBhN0ftZxpOAJIUlM+JDMGXM3Gn1VMlrXdmDKN5av4LjjrP7qsqMeRZtKu6gtCeGuVm
 uTcKbDXFWKlXySdMtaKESE05oUfYN9sxjSyl+8XDHIzIdzt/X0zePBoCPD0UTi4BMiPxp05uh18
 A4ltomln1OzMmicJ5HhtVRH6q8Hd3aa701di+9Y6P1dcJT35pCV3t8QsT+rzhD9Pga/0+sgWc2m
 JlEl7QrVVWti4trSwEpjkrtjDr08ohggzW3i7oPd/fSjhybXBV7C+gelbR2Jbg+gn8edn8Eb2Sh
 OwWo6ZofWr+dNGQjVAemLQAFKR8ZKYcS0UzWuEzSsfuz9cgt
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_134356_618233_9668C54E 
X-CRM114-Status: GOOD (  11.94  )
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
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
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


