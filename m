Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C4ECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=; b=JjwFrCWdC7a4PK
	B83yVCpS4nzSwcBRTBS01BaeqmVa36VYfjr+KGJzlBtxWAi/YP8U2p+BhX+rgXDZyrF5qk16dziUV
	4tPn8YO2/mEZaSUoWkOY0+6n+exMmA1HkzOmEt7FFBNM47GWjLZm64dihIDyqGKRlNz33QfYHUY48
	QXLovyIcwh7MFsumqiILYzicrPRd2RKJ7tYFYkVPqwhdaDRoLV597cFUK3KZ2g/5AwV/joh7lbPe/
	pRk2td/FoM96s/7Bsf/1SQo/QpXyCJY/YephyZ0rKBKnuOAMnBvS/LHrTxj0wEj4nWuGSw8aFZBRe
	v2x+bWsE2bN+U20peAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyG-00000002Ugf-1fJx;
	Fri, 22 Aug 2025 12:34:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIn5-00000001RVB-0SIX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:50:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so1765179b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834610; x=1756439410; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
        b=f6GixqtOeRS5xTPhWFAy6zz/t9y0GqhZoaw0V8P0RENttNUcr1mwj8we3hk7ubSvF2
         XvkZ+hkxMOGdvscWF+d1fWoirdH4Z8WNmkr+5fwadVszaWI2LKxv1+hNnFq6KoxHB4jI
         40N7ZaegiU57A4QbhLMwaqKyRkV6PM5dqhS5tlCI9u0/GWIg/Ye1EBwDX/rejIj4jbmx
         jjtn8fM3ePpfKd4IU+iKVRslrgccqsSZ8wJNQ8794aZKfR4lz1LlomRwqxDhW0wXgcD4
         b+G0WMWROtC4ICZl94zrknXgflB+1z6Zj9CNFf8u8YmQYC4NHzQM4rkLzn2QAwU0c7b0
         KJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834610; x=1756439410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
        b=J/JG7NoT0ejqtiyIm1HdTopW1F3DtSPL6imqM6f6aC6cKjZDfSg2SRhVRnNpBUaTEi
         AUNyEo7h6N/rzHEzPR/Q3LmBYNliiXAmROjlJ5fUe90OCCuWQVllsw+UgXDr0fB+Rzyk
         m3ARUpTYbJeHX8T0BXbJiMO9trp6IBhxTD4y9geE9yfFeGaQQ8yw8VO/N716Qj7o1lis
         LwU/QoApl7QgLE9wpAeVreRQzF2kCawXcLhTHcgBOh/r9OMsGyW7UU6vIxK1ekk3+WNe
         KhlHOcjIpNVaVRLW8/L2h+Yt5jIOzdMwF9nsRoBwY4iAPgcXsBZUURbyXeBnCuK+N1fU
         gDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLp4cp081l5Mjm39qBygDBGNZZq/I1+6o4s7HN5jxgCGGrAe1Frk9qrDijfDACgSZ2gRa2AuxeKDSGBoe6yKIm@lists.infradead.org
X-Gm-Message-State: AOJu0YzhaJqhJu3Xdqb3RHcFfIZLpTMC0X77Z9n1kXp12hBptYliEt/c
	izQH7gZN8u3bvqEpTVOXpWifTIbaIAisJcbE96AgtV6TaE1HDTD6DP2+
X-Gm-Gg: ASbGncuGcG3DDAk64TIJBdSlexXBu5BpI8zKh+D4z8DCNvqksZYGY/HgPs7e7AA8A7a
	xSDdZkA0qby+3k8eUcMm/k/9bdh3qnDKezfkAkoRaHrzNzu1/hDCP5NifhwzpRpwJowzM0drYcr
	Ja04biiEspB8zb78vGn1RzAAqZWOGSYo5VdedKDTpDAtz69Zr4fK7slLdJUkvn3LrMIVpIFfuKi
	ucG4zoHeW9PyzZECH9m1VgD1MMWUKhRWjGVgklq40RaY0WVS3F/7Y4b8JWPl+0nbh5tnyEY8nPl
	8r5V821KoYEtoYYkoyjsqeHV4skviynrJ1qwNOH2MvfUN9PrxBf4Mg8WfsEEkktdwir+nAxvtsL
	GMWeVW52kqMBnnVi8+PVcICrMnXsr
X-Google-Smtp-Source: AGHT+IGCVxew1BDZArBDIFetyektFCJx25ozr5W6t7TZGZRe9/Jw3ZLLLMj8b6oUhny28mvLZll1RA==
X-Received: by 2002:a05:6a20:2446:b0:240:66:bfbf with SMTP id adf61e73a8af0-24340d2c0aemr2084997637.32.1755834610000;
        Thu, 21 Aug 2025 20:50:10 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:09 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Date: Fri, 22 Aug 2025 09:19:48 +0530
Message-Id: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3op2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMj3dS8/NzE3Pic/PRi3TQzMzMTI0tT87QkYyWgjoKi1LTMCrBp0bG
 1tQCmSYNeXQAAAA==
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3085;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=hgVzG6HidK5orceR0qnfKXbDRBYduOwo4V7lILI4Rm8=;
 b=WRGEFFGiWV0zUgwoAaJABm7znaR2ui0mgJOni6YE0h+a7dxpgGWXH4VPdRYWFcy2vTScWDi7v
 /AbBSSYdX3qABloc3gMuzl/AmRds5P7PoFeLgXP50B5iPhIdDBRp3Z2
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205011_174359_74DAD200 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().
With these patches, all the iio drivers now has uniform handling
of the -ENOMEM while device_allocation and trigger_allocation
calls.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
Dixit Parmar (10):
      iio: accel: Drop unnecessary -ENOMEM messages
      iio: adc: Drop unnecessary -ENOMEM messages
      iio: dac: Drop unnecessary -ENOMEM messages
      iio: health: Drop unnecessary -ENOMEM messages
      iio: humidity: Drop unnecessary -ENOMEM messages
      iio: light: Drop unnecessary -ENOMEM messages
      iio: potentiostat: Drop unnecessary -ENOMEM messages
      iio: pressure: Drop unnecessary -ENOMEM messages
      iio: proximity: Drop unnecessary -ENOMEM messages
      iio: temperature: Drop unnecessary -ENOMEM messages

 drivers/iio/accel/bma220_spi.c      | 4 +---
 drivers/iio/accel/dmard06.c         | 4 +---
 drivers/iio/accel/dmard09.c         | 4 +---
 drivers/iio/accel/dmard10.c         | 4 +---
 drivers/iio/accel/mc3230.c          | 4 +---
 drivers/iio/accel/mma7660.c         | 4 +---
 drivers/iio/accel/stk8312.c         | 4 +---
 drivers/iio/accel/stk8ba50.c        | 4 +---
 drivers/iio/adc/ad7949.c            | 4 +---
 drivers/iio/adc/bcm_iproc_adc.c     | 4 +---
 drivers/iio/adc/cpcap-adc.c         | 6 ++----
 drivers/iio/adc/da9150-gpadc.c      | 5 ++---
 drivers/iio/adc/dln2-adc.c          | 9 +++------
 drivers/iio/adc/exynos_adc.c        | 4 +---
 drivers/iio/adc/imx7d_adc.c         | 4 +---
 drivers/iio/adc/imx8qxp-adc.c       | 4 +---
 drivers/iio/adc/mxs-lradc-adc.c     | 4 +---
 drivers/iio/adc/palmas_gpadc.c      | 4 +---
 drivers/iio/adc/rn5t618-adc.c       | 4 +---
 drivers/iio/adc/stm32-dfsdm-adc.c   | 4 +---
 drivers/iio/adc/stmpe-adc.c         | 4 +---
 drivers/iio/adc/ti-adc084s021.c     | 4 +---
 drivers/iio/adc/ti-ads131e08.c      | 8 ++------
 drivers/iio/adc/ti_am335x_adc.c     | 5 ++---
 drivers/iio/adc/twl4030-madc.c      | 4 +---
 drivers/iio/adc/viperboard_adc.c    | 4 +---
 drivers/iio/dac/ad5380.c            | 4 +---
 drivers/iio/dac/ad5764.c            | 4 +---
 drivers/iio/dac/ds4424.c            | 4 +---
 drivers/iio/dac/ti-dac7311.c        | 4 +---
 drivers/iio/dac/vf610_dac.c         | 4 +---
 drivers/iio/health/afe4403.c        | 4 +---
 drivers/iio/health/afe4404.c        | 4 +---
 drivers/iio/humidity/am2315.c       | 4 +---
 drivers/iio/humidity/dht11.c        | 4 +---
 drivers/iio/light/stk3310.c         | 4 +---
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 drivers/iio/pressure/dlhl60d.c      | 4 +---
 drivers/iio/proximity/ping.c        | 4 +---
 drivers/iio/proximity/srf04.c       | 4 +---
 drivers/iio/temperature/mlx90632.c  | 4 +---
 41 files changed, 47 insertions(+), 130 deletions(-)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250822-enomam_logs-f66642957fb3

Best regards,
-- 
Dixit Parmar <dixitparmar19@gmail.com>


