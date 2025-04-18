Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E1BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=; b=m4iMRi0koUq/DR
	3KpMYodrQkZZvfFC6toWtNYiYj6s5TqkgR0SvDt4Swz6RzEez8MbHs5d6Qn1VBYtDZ80WwEOgSjxJ
	w/wiL9oHDvUaavJQgIJLulzkWtCq72Bev2tmA51nDAmA4I69/Co+So5Age0E/XMD7Rhnc0BdBhpX8
	XKMHvceU9cCR6XHiRka0PbSOu9MVboZOOZOf8GDNSFcQW8IInaUaHJZe+3oBOKl4g+ZdhK+McF+Ui
	5NboWsLgWHdC5mRnpwAj19ziNzpi8Tvbguv6tebh+lEynzptKgIfMUcuV2LioVoDSqhuP8QTlNcPp
	3jsTdK8cHFd2KbZKV8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ruE-000000004Na-3PKv;
	Fri, 18 Apr 2025 20:01:46 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsH-000000003sj-25D6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:47 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2d540239367so105909fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006384; x=1745611184; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
        b=QF76chawtiuk/8Becl35ObtzOC+3ruWfRuDgfNyczYW6HYfaEzDSm72h0LY+vblIB3
         4HT9DnAqbF196ER+S6U2h3Ihnr8xRNLzj5WAp2lteKPF9qtHNH5DOxkAjrWzUi6mPJDW
         GXGkC9U8xfhfQzoBvR1xUDDQlCu2yGxA/zJ/UcIyc5x1G42BSa7+0NyjZxrIbQM2CpTd
         BtlbtAHnLVi/vw+m/Kgs20usSvRh+5lnjj74DPOY9MvwVbQoT6X5XZ3xi9i/nKIlQeqp
         RI+fWFsHDgWsjY92Ig7fPuVms1sKopIUfKeIdVrX/kL/oHIpiZTGC3ngDiNWOkH5byHK
         4NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006384; x=1745611184;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
        b=R9XibB3cRbbgkcbFUw66fEm2ktl49toBGA7HJK0zkUbqkr03c65iYWjPq3JN1rM4ha
         Ojp7JhrHEXoRbUahB6RQgKhu3UTypeedGK65v8WB/k4TK9OcVY4Npn8qONAw4huxX57v
         7JDSp0itWI5VIe0RzDTaXwHIhAl88L+TN61Vghx/82peRxCybTtoUBrzoYDj3Tw/I/3P
         1Q5tkeYon/QYN1dz6VORILN/be/95CNsckLOui5np7P8wLQOH2JO7N3KMN6ewTgYLtnF
         DNHZIRtvF7lqrqH1kiEyX0x1TuXZ28XiMSTZiLLZ7uYvYXLkHQT3Xx4q720KhM3N+KH/
         P8rw==
X-Forwarded-Encrypted: i=1; AJvYcCXjJTNOxFIzJtZIXK/Xl3GqhQ1R2jgxQOn3uZgHxh3vQsIlIVMED3mrnnxKeYw3WWcgZRfXHqiZoECsAxJzkh7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwAiAFmaTLZ7g3SjygUmGUkXIpr0QFwAPEgZL/ChvSo1tk2LMuz
	d107Iv0JRTLlVU6pz5z7Oh0dKq9hFhqCtsG1zmXX3YvbyTwspxvJKH5PDrtm9T8=
X-Gm-Gg: ASbGnctOonFmY7opaQkrtCQzWS0TAiB1cD1UU2thd+udScZ3mLWUwU2+NWQzj5VuYak
	LfxvzJTXO3JJx6Oqdm1k8jqcqGeQoqLusmj08gG8OXPEhSpIHaezJwVZ74CfOHTm2mUAiCQjwB4
	69L612udoSX8UCjgnI1DIXMUP1kcjwIW/+ee1CZtxFZdOVCcUwomT2pmLveoo34t4jOznkpy1Lt
	2wzPIF7VZ+mfb94wtCbmUBAD6FR+FmIUgLGwN81YTa0u0/sz64AIpLkSMys5ku19SAwUQZF87ae
	OHcmT1tRtuXtAK+kMdNc/CniYiJD2ydRICPfgq8CwBFQQ9it1MhupMK7QA==
X-Google-Smtp-Source: AGHT+IE1JV++hrIuNq9D0jBDQ/Srd/Ed37K3O3K1ORXsYIsyBfKxhQg+AMkCv8MVywxJHp/QiJCrhA==
X-Received: by 2002:a05:6871:d80a:b0:29f:97af:a1a0 with SMTP id 586e51a60fabf-2d526e52d74mr2078884fac.24.1745006383679;
        Fri, 18 Apr 2025 12:59:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/10] iio: prefer aligned_s64 timestamp (round 1)
Date: Fri, 18 Apr 2025 14:58:19 -0500
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyuAmgC/x2NUQqDMBAFryL73YUoiUivUkoJ+tQHNUpWpCDev
 Wk/B4aZUwyZMLlXp2QcNK6pQH2rpJ9jmqAcCkvjmuB83Sm56pYxImt8c0oYXtZ63bnA9rhsOgK
 tRx+Cd0FK5ifz8188ntf1BWOJoylyAAAA
X-Change-ID: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UBqn5bW8JlebHL48mzy3xeZcYGQz9C2ibThs3AwnfeA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7iX3vVh6HbKghORnQaUNUs3qmv+Z7Wgd/GA
 jKkcJhJyz+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu4gAKCRDCzCAB/wGP
 wNK7B/oD9hYWgmMum8g2S3GqXecVvn47S0oXLC6LbK6795AZQkuclOHHYnzART6dICtWW+OsbU/
 53u8n5rr4nLwY1M0qnPWJjrh/SQnett1Z58YOW+zbajkwDAVxnnkb+PA6KC1QdLPRHlwr78+tFY
 RiBokIVauO+51eK8ktGUgxF75cdFs9iIPKi3d46uRh7RrpMzgC+vpVOH32B6m6UUY0L3S+EU9tj
 FIpn2YwXXei8wmFT15vzNiZ8YB3xvPCwILzuirKOJ0aY7WZTBA2hx3G/2FixxUc9vWOrcquoKy6
 IEo4Q3X5jLyvWmhxPiUfP7nxQqNqrrTNO4DD+B+TRc3Lv7Fp
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125945_697847_449FFFA7 
X-CRM114-Status: GOOD (  12.10  )
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

While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
I found it very time-consuming to check the correctness of the buffers
passed to that function when they used an array with extra room at the
end for a timestamp. And we still managed find a few that were wrongly
sized or not properly aligned despite several efforts in the past to
audit these for correctness already.

Even though these ones look to be correct, it will still be easier for
future readers of the code if we follow the pattern of using a struct
with the array and timestamp instead.

For example, it is much easier to see that:

struct {
	__be32 data[3];
	aligned_s64 timestamp;
} buffer;

Is an array of 3 32-bit, big-endian raw values plus an aligned 64-bit
timestamp than:

/*
 * 3 words for actual data, 1 word for padding for correct alignment
 * of timestamp and 2 words for actual timestamp.
 */
__be32 buffer[6] __aligned(8);

There are plenty more drivers where we could make similar changes, but
this is enough for one week of reviews.

---
David Lechner (10):
      iio: accel: sca3300: use struct with aligned_s64 timestamp
      iio: adc: at91-sama5d2_adc: use struct with aligned_s64 timestamp
      iio: adc: hx711: use struct with aligned_s64 timestamp
      iio: adc: mxs-lradc-adc: use struct with aligned_s64 timestamp
      iio: adc: stm32-adc: use struct with aligned_s64 timestamp
      iio: adc: ti-adc0832: use struct with aligned_s64 timestamp
      iio: adc: ti-adc12138: use struct with aligned_s64 timestamp
      iio: adc: ti-ads124s08: use struct with aligned_s64 timestamp
      iio: adc: ti-ads8688: use struct with aligned_s64 timestamp
      iio: chemical: atlas-sensor: use struct with aligned_s64 timestamp

 drivers/iio/accel/sca3300.c         | 18 ++++++------------
 drivers/iio/adc/at91-sama5d2_adc.c  | 25 ++++++++++---------------
 drivers/iio/adc/hx711.c             | 11 +++++++----
 drivers/iio/adc/mxs-lradc-adc.c     | 13 ++++++++-----
 drivers/iio/adc/stm32-adc.c         | 12 ++++++++----
 drivers/iio/adc/ti-adc0832.c        | 15 +++++++--------
 drivers/iio/adc/ti-adc12138.c       | 12 ++++++++----
 drivers/iio/adc/ti-ads124s08.c      | 18 +++++++-----------
 drivers/iio/adc/ti-ads8688.c        | 12 ++++++++----
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 10 files changed, 76 insertions(+), 71 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


