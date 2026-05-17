Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA46CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=; b=PYRVUW9bFjqM2W
	Zsda/sotaLTgSKVXFkb0ikXd28TgZRJocEsjMa1QzOabuNysY8wEv8/LNOZtigx25LXuqbGxNUbpP
	fAdqD8xZfl/KdGIxERsJz3f2XqC1EVy8knI9dxhjBMsXiIBBWfaHHCwzl5WfR1XRhr19qG0I8HhXE
	eK7F0XlLGjPNEHxCECFD3vjCY2R27vQ+DKs1ECQkuNjp+UvOhmTg9XJNWPFRKOAo7QmrpMA+iz7I5
	PzEJLAg3LYaTHsyao+rDSFE9NgnEOROZfqMHvvbbI4qYXyhFXwoSBnYJrI3ugXFGuOyZ/WLmGtm00
	IBd1JJMNvNRjkcnnferw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4J-0000000DCOX-2K31;
	Sun, 17 May 2026 18:18:27 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4G-0000000DCNl-0KLH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:26 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-69489b43d66so218325eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041902; x=1779646702; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
        b=fJOvRDPvLr77OaMAOQUs/MYz6k0inA0QNbxXIfXzeDO4JY7+LD8gGXmqYcwUXpHfeX
         ZY6YEEBJ7npId6h//hrYBiGFwtE5E71p2pKH8ju2ukjzbT11SVis7xczMBH5hW4AoveL
         69qF2hNe8lXPgLFBjPJ2Ym51hLCwSxnuGVe1g5EiAt7i5+FN4Ew2hz0HrzbfzGzCMZJ1
         sn0/Qfb21n+xsCcCKRkOT3XSdWRu5m17G5iTIR2cGyJY9Ob0yaYB5GCJw7/Vdk/g5Ojv
         2n5WE1DFZiwY3zJrtNSSRn75uicBWW0lKzhT0+ZW4vhYbsNZFkN3WQOzhSZr70KZwKuw
         f+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041902; x=1779646702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
        b=ayEeXrxxauzcwqiTDA59lwjXCO+Y78awPdZopgrSRhte2+iCs9Mg88gG/I9XcatzvH
         4n53t3HFufxeX6xtvE6EU3QMXN0HTcj3Sv382Imb+RZQA1hzvnvFLVcAyrBOmyUoPL7H
         nfjSoyNLAEOZfuFHoXl0FlL8oNralU99ZQqSK5XSfYdcRTvXWztcwbk5CE7PmiaEY8O3
         yCiIy74d2X5WIUcmzLF48dO/sySkZEeRNyqXyr9tHkKSnhUJyniJaENvosEco4Sbea2B
         O3jFZ+HnjNq4FmEdLSg4dZ5w9DSfaSfPg/FtCyAS6qzZbYVGPqwRYDibKEwFGVZhUXOb
         N/Ow==
X-Forwarded-Encrypted: i=1; AFNElJ9ibp+AR3FvWShYEgw93DntMjy9vMSBa238NoX5VD2yLfcR0hkVaTUFudG8EaezVao9a5rxEggRKvKYbLRAi1/7@lists.infradead.org
X-Gm-Message-State: AOJu0YzjxWcvDUYDOptwLj65HQrAVtM4hOloRe5AxyO1I8feMn1BzTeS
	KmSX4SuvB8UbdwCzaJt2W6oOYbm52OA5AVAyy3QOpj69+y3OJ8nc9Z1KYeGYKvdgSpciHhRdc5A
	Ux3g5mPQ=
X-Gm-Gg: Acq92OH7mvZBHVmoNMgLCSh+vMxyh4rwIzIVFTxBZ8flqSVvDMucq8tv9/2t8dfeRtk
	tw8bYeuWiLkfQx4D0wqL56pwq1123m11qoOmqkX71n0Nc0p2uftfFGjw3aYYbHfuhuGTUJf+Kt/
	NVpBNSaAbK+xxDJ4Rd3Nf4VC1KEiEp86yc8lJMB7ubiAJcEvD/ywsgWL85DGBa4Llg6GYxjakc4
	57n4gOTyoVzK6IpfwEnYwY9j5smFzTmuAEdInwzuSAy2irBGgRRPWwM00ueYdzFrurAT+Fic8BO
	/lCekxDp2mf13LkBrQTjKnyYG59dAvehWUSLwpcwKamMpoB5aGh7c2Rtx8LybuhqnhvZ1qsT22x
	BNE8aiC6+VW3ayyXkbdI0Vdh8d+6AZBl06BCgqTka05m6JUchJFzReEDgVfz2VIQbnxij35ps1i
	j3EUR4OxZLjiL0ro2IyHIUCP0bULhZbOfDvYit/WRoVeRCnbPm
X-Received: by 2002:a05:6820:2210:b0:69b:8ff9:f582 with SMTP id 006d021491bc7-69c942ea069mr8317738eaf.14.1779041902495;
        Sun, 17 May 2026 11:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/8] iio: timestamp declaration cleanup
Date: Sun, 17 May 2026 13:17:17 -0500
Message-Id: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWXcgCdgWryJdxPhXR2waMqkIp
 Xc31uW3eG8jRRYonZuNMt6issQK2zYUHj7ewXKrJmdcZ062Z5GFi8zQ4ufE4QUf18QWGNxkBut
 7Q7VNGZN8ju9l/FvX6xOh/Ga071+ddszSeQAAAA==
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
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MZIBkvx/lDO1bwCjTF68CpPH6+1oeby0gOD1GNgDaLg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgYvvz5e3v6t+m0Wx/sHGclkR4moFXIFRNL5j
 Yark2JG+RuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGLwAKCRDCzCAB/wGP
 wL2YCACJAC5NP41M0YnHAqSNkQZmeewP7XoDQMe6oGaErE+EeI/S4A/ytTbQDa6svMIA/r63BzZ
 uDS7S/8nbyVhwAsCra78MomRhRpjuZ+CbozTwamJHbIqHsw0MgU+tot4UZveWPlRLBNr/RMimSu
 QnGbYsInSPtIo8f0cQY458S6vcMkqGQwNoqfx4d8AZ+pX1FdO6axfFyMhOR4i05M/eh1uwCel1n
 RYmEHw/N6RX/1kq9CLVRQ1/l+m2rp+VYZ43fGdfmWrwXmgvAVNflkkSZqSs4vKkrk6UR3TxF1UR
 V8aTbiassPuhHkFYW2x/L5AvCqT5pn3gp5r/sgESNDAnSEyT
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111824_264497_4465AB05 
X-CRM114-Status: GOOD (  10.89  )
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

I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
macro for doing a struct assignment. This does require a cast, which
makes it a bit more verbose, but we were already doing that in to
drivers, so I went with it anyway.

If we want to consider alternatives, we could make a iio helper function
or macro like the first and second patches did.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/stm32-adc.c                           | 10 ++--------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 9 files changed, 13 insertions(+), 76 deletions(-)
---
base-commit: 8678fb54958893818ddeccd05fea560a4e1fc759
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>


