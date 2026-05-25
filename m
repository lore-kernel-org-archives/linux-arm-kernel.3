Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87301CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=; b=BMb8CZUrYS9u5P
	sMxG/gRNiZBWUD6nxMOqQ0qes98F2F4DToBgonisoKRVMeD+Dp5C9UlGmb5edd2gTVWPiXLbgeuyP
	HY+e4wOr4HP4qbNgW7s82nqm9/1JO+cE5Z+UHdTivhCm3F9V5dbj94sRKvpprGRRxbdIqeOFFDTMf
	Nr/ZavwDG05g7pixVJ8fUiLc2X6bJHBA9dVDwbr3xrSHPROdyIIncYsF2mMfFeFnT3rwPBUNmrFCQ
	MwS6CT12vlThi7EMFVqmz+nCjZLWv3pa2VlnkG3NIpNAOiVSiNfnvBMQb7ceYmQLhx6T/iaPC39Po
	u867GXuJklHx91PfzIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIG-0000000G1i4-3lF7;
	Mon, 25 May 2026 01:39:48 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIE-0000000G1h1-1ilE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:48 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4856d563d4fso937681b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673185; x=1780277985; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
        b=TZaTHNWleSu7VpYfRbezL5OPlVgALPCdzQzNkHU54XWFAAfzvfue1SjQF/aWQok7qM
         0NtojgJMhvckc6XIv6d6gNh8AC8GaMiwWTPgG5sa0wO6qf9rQ4zaSmrGWGqBzdnoZGX/
         VjFU+meB8+7Ao5wmWhC75zeUsm826QuGXfMSRMt5tsqxyA5GDFRhDxnXHnvyxSw46OC4
         lRII0um8Z4SaEvxD/CtbBKIC4/+c/oH+1y1v0o/+kaBgQRtCBIFVZzvAk40OklQ2S0ta
         GlTRWA5o/l7HZWTDSPk0CtEL+NV5GS2O0nECfAh3wlPvp3tRNNqMg3dvEwwxjTJYvwKE
         V+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673185; x=1780277985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
        b=Qfj/rrtnAYu7bvlcp46r5zfAeq/VnzWuXf0RVzbbsKbecwa+0XllBkfEP5bZoePgr1
         JRNoXArhXujUqodTwbTZAcKBMMrFYYAUuj/V8Iml/ajdP4hT3dEXT+YIY3gR3n6pJlAx
         uOnd461YGYFt3Tp/GcrcLVinBsMrWOqRSaI4KbXKe0A+kwEDLEL3FICEblZ1PxUWgPs0
         qJZ5b+WXB5z8CNWnVKaSFoaviAou3q/1ktIm9QKsc5k0y1WWy7F7D+GjXocItxa0Xgh0
         JhiHb9tOZBZ044PqCOmq5vst+Kwvqh8un11SkrEJ8madFBN11Di0vJcNSMVMB+7qDcl+
         16Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8yn9pXCzAAFRnhcaOXpv3uy0V6eLAR+n/dzejP5xRmpJYUuij1jNCEsVYx0XJAR2ad2kdm2gd++w5UlUx0pirg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49gcs0rCzWwAcoSDmW79Pfk+ehJrlQcmO2++I4cU1VaIhqMOH
	qhKnVNZdiut0yRTNhFnnGTRVet4Xzl8lqO4qKIaH3zpCRi3jpJ3T/KUMO9pgtNg6Ano=
X-Gm-Gg: Acq92OEAnvYGmg9FSqlj3bgMeLbbsdTzfjHCp12QMJl5HCjEwDqWEehGhKQtWwgmQR2
	iJiGfG6+5ZE3yHUxE+Z+EJ/ggEcQ+orUBQTlQSDtfRBo+msgARJAaF+AHtM1YXokZUivF+AwbLM
	9/RR39HqOOM+dD1jbeNUlD2F7Qau4cpN+6FyQPdCCnHfiecBU2tQerEZtcU9ApUSjWjjCXdBloJ
	dhFuVqcN21V1l4kRNnf5KuUipitOKZbLvNc9OImdyt7JBTbojEfad9zy2TuqvU3g29omagwqrPX
	v/zEdNVBSyScQRcBQpiCMzIRpx1hQRVGoCQk0w574uLLrmT+VzEBC4BwbBYsySZ9i9GTlds/dGb
	F0HSVc8Hk6ujyJxsbC5TQ1wJtavFaq8NO5t/apFN668h9JrLCFVfwvDr1/9sAlqS6Ov3JVwJGFF
	xnIEhuEupg1KRJWauCFS5wmt2ur78yFFhvzvPzTs0=
X-Received: by 2002:a05:6808:6d91:b0:482:6617:d48c with SMTP id 5614622812f47-4854a3fa3ecmr7151437b6e.25.1779673184828;
        Sun, 24 May 2026 18:39:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 0/9] iio: timestamp declaration cleanup
Date: Sun, 24 May 2026 20:38:32 -0500
Message-Id: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhOEwFdeQ/Doq2DjAFK2kIkh
 LsLeACXL3n//QUiB+EIt2yBwJNE8f0G+pSBa0z/YpTnxqCVztWFChTxmKTjmEw3oGvZ9OOAxFz
 qWpVkCgXbdghcy+foPqofx9G+2aU9thuNxOTDfBxPtHv/PiZChTnV9qpKR+SKuzVzKzbw2fkOq
 nVdvxzXaOTPAAAA
X-Change-ID: 20260517-iio-timestamp-cleanup-1ee82f081a70
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SuM+0HC7hGWwJTXikbJW5wAJ2RsorksevrifGcg2M1E=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gdwg4bNuqtGlue/M8kGDelpLpEt8ocyZess
 h3XIm/Xy7KJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoHQAKCRDCzCAB/wGP
 wCjwB/0d574jaJgFsVylSeUV+cUbUscg33m5FcKKHwaNx155nm1c9St0Sx1qnegu8MScNk7qlwA
 IZrN6rt/OLuCilqv0tZ+d1G6OCOddqTXnSLNEqVwi2QcSqspOnK3p8s4LEmU2hfDTma2HoLK07a
 8uSQMkAKzKpihnbPSkv3DYVtXrwxkJS+s07b+b5m6RHgvNbI9hkAvvuSQ7yMGTv4bIiqSAjKf3W
 qEkUeE59f1oEoAAMCxzXop6HfJqY98nUdiw/+3H4Fiyw4fLZjpNQio3yNnqF29RH6WhY9cmozex
 MpuyplJC3Mf1xx9foHj3P6/L2IeIXEPXOysM7TmEc4r56XXQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183946_464949_BCB768BF 
X-CRM114-Status: GOOD (  11.67  )
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

While looking around the code, I noticed that there are a lot of places
were we are manually filling all of the fields of an IIO timestamp.

This is error-prone (as seen in the first patch) and more verbose than
it needs to be.

Thanks to Andy's patch, we can just make the macro a compound literal
so it can be used directly in assignments and initializers.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Include Andy's compound literal patch.
- Drop explicity compound literal in later patches.
- Link to v1: https://patch.msgid.link/20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com

---
Andy Shevchenko (1):
      iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be compound literal

David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/ad7606.c                              |  2 +-
 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/max11410.c                            |  2 +-
 drivers/iio/adc/stm32-adc.c                           | 10 +---------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 include/linux/iio/iio.h                               |  6 +++---
 12 files changed, 17 insertions(+), 82 deletions(-)
---
base-commit: e1a29334a9c043defe7a9363fa76d399d3fdfbec
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>


