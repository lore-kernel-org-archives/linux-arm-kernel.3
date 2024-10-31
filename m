Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA5D767DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuKYisz+WfuMrY46Ard53ju2b4imnRFwr+IipE+GsB0=; b=mmeyT7E9QqUaAFymxMkTsApLDy
	DUdVez7ZuuDP5FB2h3mJnvRzPC7FPC60/H2F4NViO7o8BvXFhjKWAYj7fQYMb3FJsoD2tMXdcUrTW
	MDohcmT+LgVnYGqM/zgfZaBLWxNGG9PRHQtBuIGhBNOR+e3t7I+FZuhZjYQzNIrUyTnS3XGUWTYBB
	/CrsOhwriDHgt2FudRM/gwysgzAOsdrhrUW/cu4aK2NKftPiXTqDRTcMAt7O4JKidVzPH3M4HymTL
	7d2FGJ13c2kdqQnZKO6+nFcZ3ttJ8vHlRuSdvy9mavd5vIZnpteTjkzfJGuHHwXXISfS/+1IhqkcS
	yw5L3c6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XEg-000000041xw-21RS;
	Thu, 31 Oct 2024 15:37:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4z-00000003zIa-3lsj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so8584505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388440; x=1730993240; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuKYisz+WfuMrY46Ard53ju2b4imnRFwr+IipE+GsB0=;
        b=y0S3PnMR3Q0sTWM9oY+2fOfG05Upz1QGMEOmtx09FWiowdfafL3rYnNZdVEICOOpa/
         JdocxWX9MtIA29nOZHCKpbq5MQoVBx3onc98h7Q12pi95qCQcNbzHgO1lnppDyB5jU6K
         4VvFPIDwbQN4lZyK+zgyasJGdApfSFohD5D/DRn+N5XdrxbJ5G2+cOYxAoPQyDqHy9Ge
         bt4cv2XPli8WSC9lTmlDCZl1Gz+KRUiHdYXWsVsK7mV1KKHyn3QAqOONVhYJbk2huCDh
         470PQUP9AFoJl9dlnBFO+A46RNfAH4gOI6k5h263JfCp7LDw7utOnR8dp33XNX/r8LLD
         uncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388440; x=1730993240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuKYisz+WfuMrY46Ard53ju2b4imnRFwr+IipE+GsB0=;
        b=i66xBHtghvCD5daDPIj9K1u4S2c/mct2NbCWeULKjaCdD7R0Jrt5k3K2Dnmtewl5cJ
         ITYPjZMiQH9MHNuzNVlNset7vYdGJ8Eo16nCqQ7i7/0P4e85TdEN9xv86/18s5vxG12O
         VQ3s7BNOLjiakOqDdWAuwwcx/OrdOjNKmdWpRT/nNC6xj8VKrrZDkM2Ii2sJwSj695vQ
         XP7BA5gqjgV9Exv2x0tMuzFYc00S49R9gEKfj6CpPuK5RlpT+cVLoElBPkO0BPqULBoK
         nSbvcAQwQysXdvFqhFNz2SoWi8xaG2fmY/4241bmCuAr6TdOW9VG4u8qivucPjNdTV1z
         Tuqw==
X-Forwarded-Encrypted: i=1; AJvYcCUXzx46Jo0qu96CU3d1dqGd/nTrIirVPGwqUIIoGQS/VBac8H2mlGvpZMIogk43+jKCsNrneQbpJjud4kLdEASo@lists.infradead.org
X-Gm-Message-State: AOJu0YxZsdkr1eE3NJAZnWJIGnu42HaqU1R1dt4RjZ8mCm3PMml3mZW3
	7B7HzsmUJut/dWRnj4Ts7Q6/GjiJk8M/oQkVwI0zip0HY/QQZ0QkJ3m11uBRkdE=
X-Google-Smtp-Source: AGHT+IF6/i3o0ia+iwTXrJkK/PpU7s5AqPYFhPt+pBzmwQ1VaBg1134R2wQ1oOCceXnLNgNRe+dsWA==
X-Received: by 2002:a05:600c:a04:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-431bb8a01dfmr64636815e9.0.1730388439775;
        Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:07 +0100
Subject: [PATCH v2 12/15] iio: light: apds9300: use bool for event state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-12-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
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
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_082721_971940_040101C7 
X-CRM114-Status: GOOD (  11.64  )
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

Since the write_event_config callback now uses a bool for the state
parameter, update apds9300_set_intr_state accordingly and change intr_en
to bool.

Also update apds9300_set_power_state and power_state for consistency.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/apds9300.c b/drivers/iio/light/apds9300.c
index 95861b2a5b2d94011d894959289c5c4f06cc1efe..98bdf8bc298b664aba71d3c38d7f224808e5997d 100644
--- a/drivers/iio/light/apds9300.c
+++ b/drivers/iio/light/apds9300.c
@@ -46,10 +46,10 @@
 struct apds9300_data {
 	struct i2c_client *client;
 	struct mutex mutex;
-	int power_state;
+	bool power_state;
 	int thresh_low;
 	int thresh_hi;
-	int intr_en;
+	bool intr_en;
 };
 
 /* Lux calculation */
@@ -148,7 +148,7 @@ static int apds9300_set_thresh_hi(struct apds9300_data *data, int value)
 	return 0;
 }
 
-static int apds9300_set_intr_state(struct apds9300_data *data, int state)
+static int apds9300_set_intr_state(struct apds9300_data *data, bool state)
 {
 	int ret;
 	u8 cmd;
@@ -169,7 +169,7 @@ static int apds9300_set_intr_state(struct apds9300_data *data, int state)
 	return 0;
 }
 
-static int apds9300_set_power_state(struct apds9300_data *data, int state)
+static int apds9300_set_power_state(struct apds9300_data *data, bool state)
 {
 	int ret;
 	u8 cmd;

-- 
2.47.0


