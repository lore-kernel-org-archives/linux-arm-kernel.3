Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB454D0BB7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vx0eUgvgDMYu97caj8Fvwuv1gvofiM1BDQhVIQnSVpg=; b=eJvTTlOlrIb2m4
	hpuEd7j6JTgUZYu2gBMbjPwTgSpKrEUMKkdIdW72BVI/oppENGehqCmR0jbAmzrplzJ6OpnPkQIJv
	Z2E+xXk+xvAB5REGh+fjWw4CVcAjxRa27CPVZIlSbKvGnwWdLhMc+evcfsellRZS4CqP23XOsXRwt
	OipheGe6CI9Wd7cblga5/eJ2KJ3OreebPkv7xKaQbbur+55n+URPaZ1FGnREYeuLrc92cGUuf/reo
	CooJqru2uiOaXKFvFfPRyyTLbYBonENPgxvsH75w5/W4tQO0GlsloWw00rbGv1CV0EMD4ddG8uikU
	plnyaG6vDG6RlFw+eeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tvJ-0000000HPm5-1s9i;
	Thu, 24 Oct 2024 09:14:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tti-0000000HPMl-133Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so470541f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761168; x=1730365968; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vx0eUgvgDMYu97caj8Fvwuv1gvofiM1BDQhVIQnSVpg=;
        b=D5x10FzW7uY3QFgEa7VPhlV+FT9Q3vhM7ipduOoKBlaKwRB/Gtd73CcPQgIbTBcTqd
         0Q8XcuY7JfXw3tjUWM8MWvsT74bnvn8dyO0PfIIWpWTFTGLIGPCkyw4uuBfl3HIFPbZV
         so5KvF7J78a9/nmsCQs/cIVrpK1tZH530IFfU7BpmOyJA+9MnyzBhcmQSH4kYgEyYMrR
         34/Kv7ITBaHv16xGy1kOeHtPP3JPtOQVC0x8L0urWJZGPJzbsg6DDcdanPvCfkVINDCO
         UsGYBjQ7SvhBTNuK7sHfAjSTaaMwiw0IvSBE6dp6llPPca4mrkLQyNIxeM6hPSN7bwCH
         vXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761168; x=1730365968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vx0eUgvgDMYu97caj8Fvwuv1gvofiM1BDQhVIQnSVpg=;
        b=KkmhHkpUGYOBCLcHh/hw3yRf8uoAH8mweIKPuvJJf5QJomqf2m0pnWknkFk/IJI9sA
         kISobPRGKtg5wFg+ytN4LLmmdl+aOqgaVXwGuTkhtduOXhE2z7M0eOxbwktTNnNAiynC
         3pbCKDAfb5wFNTuelz6hzQkfyJRPNPKCuSq+6fzOPs40q9Zfk4xsy9elghO3M7DSwUv7
         9axjkbjQluGQEoPAXlEazpB7vuDnJUm1WJUOzWP5ibWvfNo7yr1xJtRYndWPdiAPBqNE
         /esbeM8O2cjdmRBPOCNyP5Aioyy7RlaE2rrLRhoPyi/0cutmLtN51pbCeDCXIWtVKhdX
         /SWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9lGeXbK/d7jhtInzXDBs2rmSIpiHLCEGj/wroh622dA0ZVtudjUTHU8O4NflEXB/fi+QzjXr4gcQ4rMW2yDfH@lists.infradead.org
X-Gm-Message-State: AOJu0YwieXuCxuPENqS+UnqcJpMBxFwoo/8yF2tLvGcQuaLrXNgW6HvV
	5eXBzz3K3ucV92BxltZIkaTBoumtrJ2RuTUlulRW2mV/JPEHq9AiH+Rl9jfByD0=
X-Google-Smtp-Source: AGHT+IHA45txqMv6fiCd6E+I5xqCrbrjkPK/VXPgue7ugGcgW6QHaUAS7lo3qSSFpDfYjE1RQxWTIA==
X-Received: by 2002:a5d:49c8:0:b0:371:8319:4dcc with SMTP id ffacd0b85a97d-37efcef0d0dmr3531695f8f.2.1729761167762;
        Thu, 24 Oct 2024 02:12:47 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/7] iio: fix write_event_config signature
Date: Thu, 24 Oct 2024 11:11:22 +0200
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADoPGmcC/x2NsQ7CMAwFf6XyjKUmwMKvIIaS2OEtDnJCqVT13
 4kYb7i7nZo4pNFt2sllRUO1AeE0UXotVoSRB1Oc4yXM8cxAZcXGX0cXllWsc6qmKNxQbOkfFw7
 PFPQaNUtWGqm3y3D+m/vjOH4as7IidgAAAA==
X-Change-ID: 20241023-iio-fix-write-event-config-signature-1bc1f52fdedf
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_021250_603239_9D7976B4 
X-CRM114-Status: GOOD (  11.01  )
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

Hello,

This series update the write_event_config callback signature to use
a boolean instead of an int for state variable. iio_ev_state_store
is actually using kstrtobool to check user input, then gives the
converted boolean value to write_event_config.

First, fix the write_event_config callbacks from iio drivers that are
checking state input, or that are converting state to bool. This is
useless code, then update signature.

This patch has been partially written using coccinelle with the
following script:

$ cat iio-bool.cocci
// Options: --all-includes

virtual patch

@c1@
identifier iioinfo;
identifier wecfunc;
@@
 static const struct iio_info iioinfo = {
        ...,
        .write_event_config =
(
 wecfunc
|
 &wecfunc
),
        ...,
 };

@@
identifier c1.wecfunc;
identifier indio_dev, chan, type, dir, state;
@@
 int wecfunc(struct iio_dev *indio_dev, const struct iio_chan_spec *chan, enum iio_event_type type, enum iio_event_direction dir,
-int
+bool
 state) {
  ...
 }

make coccicheck MODE=patch COCCI=iio-bool.cocci M=drivers/iio

Unfortunately, this script didn't match all files:
* all write_event_config callbacks using iio_device_claim_direct_scoped
  were not detected and not patched.
* all files that do not assign and declare the write_event_config
  callback in the same file.

iio.h was also manually updated.

The patch was build tested using allmodconfig config.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (7):
      iio: light: bh1745: simplify code in write_event_config callback
      iio: light: ltr390: simplify code in write_event_config callback
      iio: light: ltr501: simplify code in write_event_config callback
      iio: light: veml6030: simplify code in write_event_config callback
      iio: imu: inv_mpu6050: simplify code in write_event_config callback
      iio: light: stk3310: simplify code in write_event_config callback
      iio: fix write_event_config signature

 drivers/iio/accel/adxl367.c                    |  2 +-
 drivers/iio/accel/adxl372.c                    |  2 +-
 drivers/iio/accel/adxl380.c                    |  2 +-
 drivers/iio/accel/bma400_core.c                |  2 +-
 drivers/iio/accel/bmc150-accel-core.c          |  2 +-
 drivers/iio/accel/fxls8962af-core.c            |  2 +-
 drivers/iio/accel/kxcjk-1013.c                 |  2 +-
 drivers/iio/accel/mma8452.c                    |  2 +-
 drivers/iio/accel/mma9551.c                    |  2 +-
 drivers/iio/accel/mma9553.c                    |  3 +-
 drivers/iio/accel/sca3000.c                    |  2 +-
 drivers/iio/adc/ad7091r-base.c                 |  3 +-
 drivers/iio/adc/ad7291.c                       |  2 +-
 drivers/iio/adc/ad799x.c                       |  2 +-
 drivers/iio/adc/hi8435.c                       |  2 +-
 drivers/iio/adc/max1363.c                      |  2 +-
 drivers/iio/adc/pac1921.c                      |  3 +-
 drivers/iio/adc/palmas_gpadc.c                 |  2 +-
 drivers/iio/adc/ti-ads1015.c                   |  2 +-
 drivers/iio/adc/xilinx-ams.c                   |  2 +-
 drivers/iio/adc/xilinx-xadc-events.c           |  2 +-
 drivers/iio/adc/xilinx-xadc.h                  |  2 +-
 drivers/iio/cdc/ad7150.c                       |  2 +-
 drivers/iio/dac/ad5421.c                       |  2 +-
 drivers/iio/dac/ad8460.c                       |  2 +-
 drivers/iio/dummy/iio_simple_dummy.h           |  2 +-
 drivers/iio/dummy/iio_simple_dummy_events.c    |  2 +-
 drivers/iio/gyro/bmg160_core.c                 |  2 +-
 drivers/iio/imu/bmi323/bmi323_core.c           |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c     |  9 ++---
 drivers/iio/imu/kmx61.c                        |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c   |  2 +-
 drivers/iio/light/adux1020.c                   |  3 +-
 drivers/iio/light/apds9300.c                   |  2 +-
 drivers/iio/light/apds9306.c                   |  2 +-
 drivers/iio/light/apds9960.c                   |  4 +--
 drivers/iio/light/bh1745.c                     | 50 ++++++++++++--------------
 drivers/iio/light/cm36651.c                    |  2 +-
 drivers/iio/light/gp2ap002.c                   |  2 +-
 drivers/iio/light/gp2ap020a00f.c               |  2 +-
 drivers/iio/light/iqs621-als.c                 |  2 +-
 drivers/iio/light/ltr390.c                     |  5 +--
 drivers/iio/light/ltr501.c                     |  6 +---
 drivers/iio/light/max44009.c                   |  2 +-
 drivers/iio/light/opt3001.c                    |  2 +-
 drivers/iio/light/stk3310.c                    |  5 +--
 drivers/iio/light/tcs3472.c                    |  2 +-
 drivers/iio/light/tsl2563.c                    |  2 +-
 drivers/iio/light/tsl2591.c                    |  2 +-
 drivers/iio/light/tsl2772.c                    |  2 +-
 drivers/iio/light/us5182d.c                    |  2 +-
 drivers/iio/light/vcnl4000.c                   |  5 +--
 drivers/iio/light/veml6030.c                   |  5 +--
 drivers/iio/position/iqs624-pos.c              |  2 +-
 drivers/iio/proximity/aw96103.c                |  2 +-
 drivers/iio/proximity/cros_ec_mkbp_proximity.c |  2 +-
 drivers/iio/proximity/hx9023s.c                |  2 +-
 drivers/iio/proximity/irsd200.c                |  3 +-
 drivers/iio/proximity/sx9500.c                 |  2 +-
 drivers/iio/proximity/sx_common.c              |  2 +-
 drivers/iio/proximity/sx_common.h              |  2 +-
 drivers/iio/proximity/vcnl3020.c               |  2 +-
 drivers/iio/temperature/mcp9600.c              |  2 +-
 drivers/iio/temperature/tmp007.c               |  2 +-
 include/linux/iio/iio.h                        |  2 +-
 65 files changed, 96 insertions(+), 112 deletions(-)
---
base-commit: 9090ececac9ff1e22fb7e042f3c886990a8fb090
change-id: 20241023-iio-fix-write-event-config-signature-1bc1f52fdedf

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


