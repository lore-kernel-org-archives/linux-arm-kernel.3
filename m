Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2682D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQxEAbikG832i9VGoZJgFYk9AEf9LJDD4S/9KzYjDMo=; b=OH+FdQRU83LzNYmBmNAsoRyjTb
	tf3oAHS3kgwL93Cm47b4nV8FwqfDs1fFeQRVRTm50SpLkFLCWr4iXYnJE1zEDupIZldyh8p9qwsCl
	F+yQ5Pd7KYmX7hOdTYeoXf+qI/SreEFqlGexDYI9f2bNin28Y8BqwNJwv1Uz9TLu57JRuN4Vf5TSD
	K0pF4EVGhQDAPHuqwx0idcWPrHi+axYHJvyPEdQqcNpndGSJRuMrSet+W+uPCDQzRf3C4gciV4pzP
	TwXGNPIFjGNZ46HVv+h1WXHEtfH0rYZ2KPp0fOK02zBNwm0Mzf6alUfkcHUt6bBMJe1/El8wttPMo
	NBMVNpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XGI-0000000428c-3Jx5;
	Thu, 31 Oct 2024 15:39:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X50-00000003zJ0-1Zrj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so9620745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388441; x=1730993241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQxEAbikG832i9VGoZJgFYk9AEf9LJDD4S/9KzYjDMo=;
        b=tBpw9IYIMdm2F0hw677o/90CratfyhIqX1ZfShSUDOLb4o670hO0weiORK4J1jtJ1Q
         3xwS4eZPQlFds5qR1HK12AOkqgPK55CBIJl3XCRxS3EttotOPkgS3LDrRBcxFtOvBO96
         YxaLT0714+mTyUk1bJAkf33JlHzE/rDY+gfE1wTjWKPBvZ/C9Uo+4+kgzZgds2dVTv88
         RKfSgoY1kC2bRSILZVuzuzsoR+KMMu4IlHrIk0dLzfo4L5lMsEuEzQIQumamhNmt5XOA
         DrwbzkXznSAWP3pZWb//qwysxQauBzBKXUNPvwlqwmTOwr7z7Pu1Gn9bRYx2OBrlivl3
         WjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388441; x=1730993241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQxEAbikG832i9VGoZJgFYk9AEf9LJDD4S/9KzYjDMo=;
        b=v0VXfN1dfV3V4+KWN1VWPzFZ5kEZTHB/XQ794jkXNS3pWTTRs51KkPL88khgVpvUkd
         m4iX8ATAaCATuqx6O4ceJbKhWu2sE3DNfUJtasA6MNyowugibw5LVlxrGiDieyBRi5rS
         +tqA0/He6kkhAry0ezUnWQ1EMh0aS9HnSy6UkI9CnhGotYpScad2gXa13JfyAO/90A6r
         UD3blGOuSnZDIuC5H1S2SyuN4Wy8kWkrgZUflovWnNEsxTbxvNzgrnuh3S+B03HSeT/F
         WFQKM8p4iJpQzLcmnN7htRPBPUcIRqlo3LliK0ibbM1uEcXfqZIicCsXT4Dyye6Ix9vS
         +n2A==
X-Forwarded-Encrypted: i=1; AJvYcCVtOLDqoHzsC315QEv2JPyMpn9tln9dE56O0psCv0nvNpOjPkHVXZMiDr+xCgZ5LyLPVNIQJONjxAbs6IIMtL2o@lists.infradead.org
X-Gm-Message-State: AOJu0YxBuPv0jipYZjZ2yJ8nTij9xn1WJJLtgk+N3T6SYt/2MFZzjU3J
	7iwJdAcK/0nxolNh+mFRPjR7a0srOlbBD1chf4LYRQxRcpEGSMzqG0KKzYqFq/U=
X-Google-Smtp-Source: AGHT+IGjIoWlwinfZhKBEIrRl3MA4S88J1QJFbpNcM59olLwoOacmA/yBDxxHNOfzvA4r4tdWOJ2fw==
X-Received: by 2002:a7b:c848:0:b0:431:53db:3d29 with SMTP id 5b1f17b1804b1-4327b7019f5mr37167515e9.18.1730388440670;
        Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:08 +0100
Subject: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082722_459388_89E32613 
X-CRM114-Status: GOOD (  10.01  )
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

Simplifies the regmap_wite if branch in apds9306_write_event_config.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9306.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
 		}
 	}
 	case IIO_EV_TYPE_THRESH_ADAPTIVE:
-		if (state)
-			return regmap_field_write(rf->int_thresh_var_en, 1);
-		else
-			return regmap_field_write(rf->int_thresh_var_en, 0);
+		return regmap_field_write(rf->int_thresh_var_en, state);
 	default:
 		return -EINVAL;
 	}

-- 
2.47.0


