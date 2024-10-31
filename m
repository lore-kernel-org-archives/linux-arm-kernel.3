Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3016FD767E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0WwNTu1vlvbHuN9HbKDO0xkQz2gUitr+1C+jlofiLKI=; b=J4+Zls9AbOO8Ll
	lINoxYX6V2AGUjf0UmPf6TnHvFjqKi+YdiNsOOjp2YJGKTXu4qb/Bb22vHtD0QEQgZNGJbIcbSB4S
	cie2IZxDG2x2sBS1g0T5O0QB9w14DAcNNvmX/AOcytg+5rowJU6x/zQOb4xd9lDRcLj1OOGtZO7tL
	ExPdgdLmMjDgjQrIOw5fcuC7p+F1C1lpIirzUs59w99P4GvuGj6E29Hvc1G6MOJ+6eu6c4YlcClsd
	4Glfto4cco26BtEuf4IV7vAP7mJngfRZggiMg7gVLWSlm0nmvNuZL1cMlPxhCHS5HL2vkw/cGFoi4
	SvEquZTRZ+XYSp30J32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YXj-00000004HJl-3nhy;
	Thu, 31 Oct 2024 17:01:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4o-00000003zEk-1HG3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so774726f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388428; x=1730993228; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0WwNTu1vlvbHuN9HbKDO0xkQz2gUitr+1C+jlofiLKI=;
        b=Isg7E7jGNw2mDOGRptAs4/SSC94J7N83tp+j4+idnRDgjdCn6iJyEme/XOlXW0jpu+
         jeJfkuOK8fu4234yGGLzcBXHpTNSpOB9lWrbR0MtviEmc6pNs4SdCDZ6LI0leDeljUxm
         0gEVP4YI8ghLjloiFbaP32fQYuVr20NP3SGz3KBvqjDSAXQYiERrFGsYKurfE8qbVn/u
         ur/WcgmG+aWIOyMys0iZwt8/QDJ4hne24OwMWD3RqReaHrL29k2WHht/YBAtTnbQPsUB
         zUNZhJKrEd2/RjessFogS+gm8p/b0yDx2yU8gsvj/y3tnFSOhceVIlXeWbz/0J7VblET
         9L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388428; x=1730993228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WwNTu1vlvbHuN9HbKDO0xkQz2gUitr+1C+jlofiLKI=;
        b=SVdVKEwgni/c0AYklIUQ1Q6kj6WkdjrgN7gKbiQq9ULebfC6f+lTPjcCQ4fuVqT12q
         Lgs1YhN3HsGYHNHJHAJBKY0whMT/MXmct+VIfkB+yOv3xo/yOfjkP4cUNdMevAbZzUM9
         JPxDBrU6tOZi3KO5hjGDGc4W6CTiThsEz4E/w6VftJ/flWArTrYWSNNzgnJASvhYDc61
         NsWr3QSmIayBayDWAKHxUQXwb/n+rD0QLRClDDy4DEvTv0Pi/sncEwzgUKgdOD6s4x5t
         Nl0Gm9y1ekgrVc+SMKaEsueO0ghl5bH7/ehCPWejlju+JRegUByDJbfrkPO/15NRVLI0
         Uo2w==
X-Forwarded-Encrypted: i=1; AJvYcCV23bMt4SWlF9akMUzOGQZDjBoqR6k8kroR1jMu+HFob/rxh7/pXrRw6qJsxmD2Zgj9+qV/iKLpLPmXEJ63FcuS@lists.infradead.org
X-Gm-Message-State: AOJu0YwaCKRDTUd9q37Vy6wdfwNUWRM4YPqPhlubOTlwWKVP+isy+f0W
	UYSLIZf2p0m+93bUh2ly908owHnJ4vXFegzlZYc0wOKKSqB7Xie7hd5AhWZNhcU=
X-Google-Smtp-Source: AGHT+IFb1d7/9RTsGMROhFf+wqRTbx7hjNdlDFSlqM1RaxGhrI/oNHTEKXbi327qzy4zNRL3SmwMYg==
X-Received: by 2002:a05:6000:1888:b0:37d:50e1:a2c1 with SMTP id ffacd0b85a97d-381bea1bf05mr3054559f8f.46.1730388427847;
        Thu, 31 Oct 2024 08:27:07 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:07 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 00/15] iio: fix write_event_config signature
Date: Thu, 31 Oct 2024 16:26:55 +0100
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+hI2cC/43PwQ7CIAyA4VcxnK0BtsXoyfcwOwwoWxMFBYYuy
 95dnHr3+Ddpv3RmEQNhZMfNzAJmiuRdCbndMD10rkcgU5pJLmvBZQVEHiw94REoIWBGl0B7Z6m
 HSL3r0hgQhNLCNtIaNJaVU7eAZWdlzm3pgWLyYVrVLN7TH1D/B2QBHPZGHrDpKqE4P6luupAKu
 NP+ytrlgwa8j+Wl9JWX5QVpKE728AAAAA==
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
X-CRM114-CacheID: sfid-20241031_082710_651006_E8E3DD92 
X-CRM114-Status: GOOD (  14.92  )
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
Changes in v2:
- removed commits that were already applied
- added new commits to fix comments from Jonathan Cameron: cleanup code
  in few callbacks to update driver internal function signature to also use
  bool for state and update the driver internal state variable to bool.
- few minor fixes along the way on different driver
- Link to v1: https://lore.kernel.org/r/20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com

---
Julien Stephan (15):
      iio: light: ltr390: simplify code in write_event_config callback
      iio: proximity: hx9023s: simplify code in write_event_config callback
      iio: light: tsl2772: simplify code in write_event_config callback
      iio: proximity: irsd200: simplify code in write_event_config callback
      iio: proximity: sx9500: simplify code in write_event_config callback
      iio: light: adux1020: write_event_config: use local variable for interrupt value
      iio: fix write_event_config signature
      iio: accel: mma9551: use bool for event state
      iio: accel: sca3000: use bool for event state
      iio: imu: bmi323: use bool for event state
      iio: imu: st_lsm6dsx: use bool for event state
      iio: light: apds9300: use bool for event state
      iio: light: apds9306: simplifies if branch in apds9306_write_event_config
      iio: light: apds9960: convert als_int and pxs_int to bool
      iio: light: apds9960: remove useless return

 drivers/iio/accel/adxl367.c                    |  2 +-
 drivers/iio/accel/adxl372.c                    |  2 +-
 drivers/iio/accel/adxl380.c                    |  2 +-
 drivers/iio/accel/bma400_core.c                |  2 +-
 drivers/iio/accel/bmc150-accel-core.c          |  2 +-
 drivers/iio/accel/fxls8962af-core.c            |  2 +-
 drivers/iio/accel/kxcjk-1013.c                 |  2 +-
 drivers/iio/accel/mma8452.c                    |  2 +-
 drivers/iio/accel/mma9551.c                    |  8 ++++----
 drivers/iio/accel/mma9553.c                    |  3 ++-
 drivers/iio/accel/sca3000.c                    |  6 +++---
 drivers/iio/adc/ad7091r-base.c                 |  3 ++-
 drivers/iio/adc/ad7291.c                       |  2 +-
 drivers/iio/adc/ad799x.c                       |  2 +-
 drivers/iio/adc/hi8435.c                       |  2 +-
 drivers/iio/adc/max1363.c                      |  2 +-
 drivers/iio/adc/pac1921.c                      |  3 ++-
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
 drivers/iio/imu/bmi323/bmi323_core.c           | 10 +++++-----
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c     |  2 +-
 drivers/iio/imu/kmx61.c                        |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c   |  4 ++--
 drivers/iio/light/adux1020.c                   | 11 ++++++-----
 drivers/iio/light/apds9300.c                   | 10 +++++-----
 drivers/iio/light/apds9306.c                   |  7 ++-----
 drivers/iio/light/apds9960.c                   |  8 +++-----
 drivers/iio/light/bh1745.c                     |  2 +-
 drivers/iio/light/cm36651.c                    |  2 +-
 drivers/iio/light/gp2ap002.c                   |  2 +-
 drivers/iio/light/gp2ap020a00f.c               |  2 +-
 drivers/iio/light/iqs621-als.c                 |  2 +-
 drivers/iio/light/ltr390.c                     |  7 ++-----
 drivers/iio/light/ltr501.c                     |  2 +-
 drivers/iio/light/max44009.c                   |  2 +-
 drivers/iio/light/opt3001.c                    |  2 +-
 drivers/iio/light/stk3310.c                    |  2 +-
 drivers/iio/light/tcs3472.c                    |  2 +-
 drivers/iio/light/tsl2563.c                    |  2 +-
 drivers/iio/light/tsl2591.c                    |  2 +-
 drivers/iio/light/tsl2772.c                    |  6 +++---
 drivers/iio/light/us5182d.c                    |  2 +-
 drivers/iio/light/vcnl4000.c                   |  5 +++--
 drivers/iio/light/veml6030.c                   |  2 +-
 drivers/iio/position/iqs624-pos.c              |  2 +-
 drivers/iio/proximity/aw96103.c                |  2 +-
 drivers/iio/proximity/cros_ec_mkbp_proximity.c |  2 +-
 drivers/iio/proximity/hx9023s.c                |  4 ++--
 drivers/iio/proximity/irsd200.c                |  5 +++--
 drivers/iio/proximity/sx9500.c                 |  6 +++---
 drivers/iio/proximity/sx_common.c              |  2 +-
 drivers/iio/proximity/sx_common.h              |  2 +-
 drivers/iio/proximity/vcnl3020.c               |  2 +-
 drivers/iio/temperature/mcp9600.c              |  2 +-
 drivers/iio/temperature/tmp007.c               |  2 +-
 include/linux/iio/iio.h                        |  2 +-
 65 files changed, 100 insertions(+), 102 deletions(-)
---
base-commit: ce2785a44e784240e3dbb142942c9d88c2cac3d0
change-id: 20241023-iio-fix-write-event-config-signature-1bc1f52fdedf

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


