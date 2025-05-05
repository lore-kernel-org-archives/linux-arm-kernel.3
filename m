Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CCC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=; b=uldghVC+dsUXmiTwMioC8j0y7i
	iDsMF79+BYceJwgE56WMDPvG1QMPJaX1InZ9c9CMnsnj8uXlmiLd84cYO7aAmaXcS8buCZtKOlPtM
	KjlSIP9eYsjClESAk4mUej8+C0QtAQx0+rp22TuGgRrEXVn178flSoqbIz3gyazMpbgckLk2mOjGs
	ph6x/mKdBsiVk3Ahei3u3wveOU+h9q8t22dqa2WBNvwlq26UwWIVH8FKHLBETF/UixtsTIyljobw+
	xc/ygDv+NkJYrhUiBN/he7lYdvlyxv7lwi/G9kfgGWg402du5hTYQkRiaOSlZUWZYuPcaRwxe8Gii
	SarZpb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz9m-000000084ln-0lt5;
	Mon, 05 May 2025 16:59:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBykb-0000000801E-29Dg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 16:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=; b=HFmy9QV5tTriZ9/XuP2HFAPsdQ
	xpxYPTH58mdqP3SGHaHHgo9fv9uHbNzaAEh//c8mH8yX9OWKY08upq7XekBx9mUuUZDNYyCEPjo5m
	kTEwxBz1VVvvqEb/rWcszIxf9rcqBhB6nsSb2Q3mhwSZjznJ1FhSA/NzKwdqK83aKsdeFHEaIPB0w
	bcb1y9AHsaBe6BZQ/VyI4bDSVjpM7n+9BmKLCPrzMpi96Q5xaabB4PBbxYozc7Wxb0UP9CkMFcE9A
	reXwk3DXHccBOEqRcrysrveVAlENu5vMnipxF7Kc4ptFkKyisOK36OUaAJ6f4k5TR6cv9f9nz6eG9
	Lpi22KuA==;
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uBykR-0000000FW2u-2MwO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:33:03 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-401f6513cb2so3167534b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462766; x=1747067566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=;
        b=iDAT7shA0tzBiy3JSugz7/b7BXSM4ihU8tP50DnkdIBgn74/374iQQ/HbmvBwKBtBA
         Z+Mc+09ODrAMVquAfcqSQ7f8WBme0950Ou8OMOrzU5WJxNJ+iiDDfp34sWO6CGwp9cOv
         /05s2FOnNRjj/tL1lD3N2//nbhU9wZakjMpeaByNSHhZ6K5zaMTWPlGZ6U5eiODth7qq
         TBwn8hHrqm5nfN0yT0pSezg238V7Nhr1KKIlh5WbtOezwWs8wJuO8WojmgkxWI3/+PLz
         03nfQC4qCLMl0St17hbIhkXuNFlHbbG6zY+57km5l8k1gzY8UJAXHeanazx2TP94hqZM
         O0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462766; x=1747067566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=;
        b=nRX8UdcmRXk2t3M5vzL4playoKa+s49akMt896j5CaIhjeTnTWmXCoE6Lqw34U6jjG
         ZjlLRG9SPrZASOaVhgqiLkV9q1owjoKAvBZlVDWBdrreDzhNV5WupPM8KK0cBX+gvOay
         kOtUvsS2+ItMdTGCXsYE4kOL+VfL8QRUHjq/JBMbGQFVujRefom6dNuonF6H8dWdvSds
         Tkxv3380+Fs8tgW7+qqPIOsgb1ywncnHbI74q1ER1Z1gGu+UG92jwboZZYuN8gcy1wFo
         WdFc6MYOrroj/PzMo+0/uZIjH2Jyj59bpoPo93fAQ4ybhxojAi7dsSUBczqZJ4JU+Q2C
         5o1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeX9Cj7OGrtAtK2AXpU90Pq6s+I+qm/E9pyKmfbeDhyN6E/SVVV+tsv2TIWkDNcStDvfk3reJ3MfabrNNM6Grb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFL0GCKax9KL4vZDcAWAdiLdhaEkAgHdJt6Wgo50cU9X714ro0
	DGTDgifs9OsuS1PtGqboF4XwUiYXwUCe8TwLlx6ktzbTm759IwFCnFLwusbBsNM=
X-Gm-Gg: ASbGncs29VnhmZXm9Ov/qFQ/7Lhj9V4R7BjwSWhZAE5TpjqhpGeuzfXi2wf3PdDuVls
	/ABZPd4KiMdtWehgSi07vY+kT1RKRVKKIiYJxRftlXQCXzt2pyPkCEuncRfdk45iFR2KZF4pdi+
	f+HeGrxb1FfIn0gUp04MZDv6F3YBzk52DE0yCLZKI99bBxHsuPQBucf2/pwHinCwAuS/k5kWdbY
	ptDZPYIGVXouf8X87q144NO9nIBMJjwu5rqjOjOxOkn7gvT1ChMlSKwdEtqbGCjWH2hW+R9+OF5
	1k0OTFfQuvVHJb1AA77eB2o2HEI6/uRCGWJbd4DMMSaeBg==
X-Google-Smtp-Source: AGHT+IGjVvx13O/rf133nL3urpzlzpZTfLRHIzG/5ZXSnqMUPazyvAzh0R6WlxrPiFRp18aa2mb6Tw==
X-Received: by 2002:a05:6808:200f:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-403687e92a8mr106932b6e.3.1746462766163;
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:45 -0500
Subject: [PATCH v5 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-4-814b72b1cae3@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=190oW7EKQBK2cT++cC5GYqS0UzCs0C8IHqrc3B+wC/U=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOgNgp+O5onlvKdwSMSAuSxVRXfym9gmQnerJ
 CwXAjJsRDGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoDQAKCRDCzCAB/wGP
 wCzGB/9tkNAu3L/NYL4jUrJdPuq4kd5U92kII2ncj9G+E8nygqUsgfvB8ZVCttp2uIGhWPa0KjU
 L+FgFikSr5TpwK+Dx+I9xp0oHZvKGMWhG+vFSImOX4ddssY87CnMto24juggEDAIVO0Nr1SDTRN
 pqYXD31idseN7tLXHs0YRZr2jqf5pzbj4eaFAi5HOhZ3EfH4MmFFNvkhbfsA1CcKGL7LYJHc4ty
 LBDkdk1VL2vTv2TVXt1cw6t4a1oyRqhzW0q10pgQuwzxpjUH1bOmENiAQLTKWqntQFXOlVBfKwF
 SwTPdAUlIgd+3/HpuvBvsIAik10kcLajLaNABIAPw9tXT4Hg
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_173256_407547_9D7BF035 
X-CRM114-Status: GOOD (  14.23  )
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

Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
point of confusion that this macro is only the voltage input channels
and not all channels.

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 992abf6c63b51dee222caf624e172455fb9b9900..cda419638d9a88debb3501d05a513b17a4ecde95 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -105,7 +105,7 @@
 #define AD4695_REG_ACCESS_SCLK_HZ	(10 * MEGA)
 
 /* Max number of voltage input channels. */
-#define AD4695_MAX_CHANNELS		16
+#define AD4695_MAX_VIN_CHANNELS		16
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -143,8 +143,8 @@ struct ad4695_state {
 	/* offload also requires separate gpio to manually control CNV */
 	struct gpio_desc *cnv_gpio;
 	/* voltages channels plus temperature and timestamp */
-	struct iio_chan_spec iio_chan[AD4695_MAX_CHANNELS + 2];
-	struct ad4695_channel_config channels_cfg[AD4695_MAX_CHANNELS];
+	struct iio_chan_spec iio_chan[AD4695_MAX_VIN_CHANNELS + 2];
+	struct ad4695_channel_config channels_cfg[AD4695_MAX_VIN_CHANNELS];
 	const struct ad4695_chip_info *chip_info;
 	int sample_freq_range[3];
 	/* Reference voltage. */
@@ -157,10 +157,10 @@ struct ad4695_state {
 	 * to control CS and add a delay between the last SCLK and next
 	 * CNV rising edges.
 	 */
-	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
+	struct spi_transfer buf_read_xfer[AD4695_MAX_VIN_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_VIN_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0


