Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC144D767EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfayXnl3KgVE68uldd/53FtSQhtptu319uaFu0iSbt8=; b=pyfTL10hOpkEI0+pFbvc2vI9SF
	b0yjt4g6iBXiJgBgDxwNjOb55sbxmJ1qUvhEJn5v0h/pogTdnoCWsfA0kjlF8P5J4r24YPgSLvZrk
	pJ+2H8RDPswUraIL1DaOEaqXIQd7L1Dd+P1MhP+61+yO+yMOmcUWBGUVJWPEapHlXzr1NlDPdYwne
	eUH3r97EtWkf59k7tYilOdy//B03JQcBA6dpwf/CxBlc8IsKUFSjwNqm3XNrXoj0fjMkxEwrO4doc
	JARbvNU8zeUXJbFQsicIZQwAXgpFJaWXPog5G7pFxh3KP6tndorHhRsenFmbMALFYGRL2bYRFkJeb
	GHiuMAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YXl-00000004HKO-0fkN;
	Thu, 31 Oct 2024 17:01:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4r-00000003zFL-1VkJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1350726e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388431; x=1730993231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfayXnl3KgVE68uldd/53FtSQhtptu319uaFu0iSbt8=;
        b=J9LNiMDfHaIIPIku+5T5dtljZavF08EN7oyz2fewKpTeKBFRhfbLrH4IlJ3EzaWGw+
         Jssf1qzgaQKK40MQ/uwqFMV+xfsP6hDj5u1i5g14iGmiVNkm+31d7fumx2/EiwuaqNo+
         IPC+BAo/UBvn9NmR7wbQz7Amjr46C+veVy5kbPbQKSTkttCyj4kKWZk+aQNyV9bx8ZTM
         PrVIfnPaLhmuzmMlzrn47OveyKz3GZK4Ku1liyLx8Y0rz+/BXp5AD5ON+qiyzOjMuiK4
         WOl/IG++h+JdpmYChaCRrs9bpm5XcgFb0oiGPQdRq07dkj6moxIvpzCdWH8BQMa3mKHI
         GVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388431; x=1730993231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfayXnl3KgVE68uldd/53FtSQhtptu319uaFu0iSbt8=;
        b=jj2MvwzqKc1iNqp17vKYvsrn2LJGfUeo5yxoB+0Fv18w+OOzUSAPn16YS8PmdqbQxD
         0GJCIh8GNNzIMSTfPXfpFyzBIrJiPKCb7/mvdXu9pBKJ+t5gF/AujrS8rmaIW+mh/nqf
         yoe0Hmf2W2V0qaCnJmSyxdlZqQjI0fjTqg0LDVqUS3WLebA/YlxRj2ytCZSFPCHwxAoC
         LndyxC4dgStraJD1BdnA46TdTU5pKH3l6suwH9H1+jbMNDCOd6hZM3I7ud/de9Z3SuVb
         o9CK+RYZla7NkER9NwNHFsmZ5cMVh0XpHosr3XhDmkdhqFcRjYzXpdNcLjzdt+kTP+ll
         JIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD1V491AfZ+Fbzok/8zB3v/jCTwV5OBPkHGPGHuvJWvnwRVBmHGXM3I6LVOGzQCL/xa4jSLdnJk8+3A9vROyYw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn+uH8UmSt2VQAo96Fa8TB4CrdGcTUOMjtvpC0STKC+wv5WoxH
	oduAbZb/Fch87NHaarDkfiMjoCXHTe3HT0vtnY5Ipf6xmbBOAbM+SGyxdw0L7oQ=
X-Google-Smtp-Source: AGHT+IGh99tSGgSkk7UO/iFz05CAdTlnzxIFxRiRB1z7ObMWAVrMO/9RIhKBJVpF/cTnncS5M8FTQA==
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53b348c8978mr10449686e87.13.1730388430582;
        Thu, 31 Oct 2024 08:27:10 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:10 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:26:58 +0100
Subject: [PATCH v2 03/15] iio: light: tsl2772: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-3-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082713_503935_7CE613C5 
X-CRM114-Status: GOOD (  12.15  )
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

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/tsl2772.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index cab468a82b616a23394977da1d8822d29d8941d3..26082f239c4c3aeabfe73ed100d6e885f5266329 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -1086,9 +1086,9 @@ static int tsl2772_write_interrupt_config(struct iio_dev *indio_dev,
 	struct tsl2772_chip *chip = iio_priv(indio_dev);
 
 	if (chan->type == IIO_INTENSITY)
-		chip->settings.als_interrupt_en = val ? true : false;
+		chip->settings.als_interrupt_en = val;
 	else
-		chip->settings.prox_interrupt_en = val ? true : false;
+		chip->settings.prox_interrupt_en = val;
 
 	return tsl2772_invoke_change(indio_dev);
 }

-- 
2.47.0


