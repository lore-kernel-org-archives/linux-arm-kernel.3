Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEDED0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPO7uddPmJGeRvDQ4DDNm675wgeGPQg+TX6wZtIY7Fc=; b=PE4Wz9xBHhXSNqQPcpx2ADuLMl
	FVgfAoZv8zF07hPABYnMWQlEK6xv3zs7RWr4bAqi68vpuUE1bffenuEXfblMxxg6w1gJIMtu2hodf
	/my8RrKczIDlpXar6IgHTxdfgsqglzpOXpDoxhZZdYMQ0lM3ozreTxilZ56C/3/N6KuQVP+19V4ip
	LwX9jK3yXR7tabxHI8aP+R22XhVmwfLtb622Wg1Co7nk4Xs7IIkCz6FgHC6/IHrR/0ZOcbl7uhf6J
	zJPY9vDdxWY/Su0jy+8V+eR1rwgo3LJ+LqVce3k7E86n77xNRbXzDZQYF7Bc/yVA/lKMOkcGcadnP
	W/tt/BBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u1S-0000000HQsl-3rt4;
	Thu, 24 Oct 2024 09:20:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ttl-0000000HPOQ-2JUe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:12:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d495d217bso554250f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761172; x=1730365972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPO7uddPmJGeRvDQ4DDNm675wgeGPQg+TX6wZtIY7Fc=;
        b=YypSoFHKmFIpj8dsnHyd8v7i+3vsDy9lzTWWirjY5tbyldjT40SP2d00OvwgHjIKK3
         D86npQK5XNgc0WUsl7nFKUdDuFwvVr2VM4kUu1GZQWwpyGn/tjdNcOpc5LX7D6uVm89R
         1LjU0/f9jsj2795mRkoqIOIfe5fZKsvo0n/MvLM0zmZHYvZyhpE+Kdj4j+2OsrZbIzKe
         d0EsCXjWRR0KqzZaGbSfxtZliiCuUcmliBNehiQ7+fpeh1SDgtrBrleUBWFgctuG6SN7
         DurMGIepH0zzaRr9td7jDlocZnGJsc4nO8SYD824Q1WBfVT0llQ3NCCKIVjoTTaiOvsB
         cEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761172; x=1730365972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPO7uddPmJGeRvDQ4DDNm675wgeGPQg+TX6wZtIY7Fc=;
        b=RGhwTa8NdDc1Wfmm1S1yN5qg51Xo3h/P95PCtSavBusX+efyFN/KNMlWMhq45dkl6D
         /FKbpunXa2hcuwrSYZrT+RzSyY/0UR2zR3a1tknT8VTxLkT0nknw903uMkYuRK4q2GW/
         j6/z6CPGona2gV9Qx82yeOmloKAX8qn3TqG24Wo8LNI6zyt7bSXiPr0oTNz5wV3nrjD+
         OG/7EQwdX8SLkeq4CNXAOSLZHUj/zGzr1ibxDvAUveLNxbbs2hDIVJAGtYR8l8qjMgb7
         4S4cm0WdCjiij6gUZhvO8KoBU6JOjN7KWvKJBqXKbKiORdP8dDn/zRZiU+y8cAo523vQ
         HXDg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ta0ckwgmzFs4wXWESvo7LiWcSHad/B9CNNFEK9x1wjby+nzISi4n2nQZFWdEjp8aDAjkzAwDWv3AvjZBO5fQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkADzzMWkXnECWNFFL8IiXwxT3/nkTFPwa3hm0/uqJUl4hENiA
	+/xdWcJ2kStjv64ic8X/nCRuI6WmEPO767O0a7C7B9GQuPrmyJ4Er0AY4hzz+jY=
X-Google-Smtp-Source: AGHT+IGaN73d/bgLeVCGlsGNxd+TOv2AHPR97BWrXwTr3MwJBwZ4zF+VJDI71VQ8iFHk0s2jf5QZwA==
X-Received: by 2002:a5d:438d:0:b0:37d:5042:c8de with SMTP id ffacd0b85a97d-37efcf06011mr4293964f8f.22.1729761171775;
        Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:26 +0200
Subject: [PATCH 4/7] iio: light: veml6030: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-4-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
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
X-CRM114-CacheID: sfid-20241024_021253_636537_375A728F 
X-CRM114-Status: GOOD (  10.12  )
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
 drivers/iio/light/veml6030.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index d6f3b104b0e6be8e095a1ad9f20acb81ce492630..95751c1015909cd80543a559673f435d1a168f68 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -826,9 +826,6 @@ static int veml6030_write_interrupt_config(struct iio_dev *indio_dev,
 	int ret;
 	struct veml6030_data *data = iio_priv(indio_dev);
 
-	if (state < 0 || state > 1)
-		return -EINVAL;
-
 	ret = veml6030_als_shut_down(data);
 	if (ret < 0) {
 		dev_err(&data->client->dev,

-- 
2.47.0


