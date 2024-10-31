Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2350DD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YCxmOEeimQsWbxSuJOXydqCcdjHVKIXSn+X4nwfNto=; b=BvMd/10zQ71xwKmZleRnJyQd7+
	0hPru9TdJGN7ruuBOUIDjy+jvr9KjctjgxxebVONSzB0ZoVhw0JezrjWtrkOKt41uRZlInj42VepL
	WeM6aAznCNT3CGWhMFnm9qHeK0vOBec1XlTYAHFhM7nHOwefB32V3h/F0Tghy8D83pdZQJNFuHA1Z
	U2q8S6iQfziJ4ZGV9ksAoSO3bZDnbaCA4MUebW1SOM6Ah0LUVZU79MDzcOiQV1xa7mTMFqbt5aJ1W
	nRA1z7Qk3/hy68nGUEVLHN9NK1NJcMDOXgYWyTFbYdST7gQ2Fv47+Cxr4jVBRnxOh7QpJRkfnxbzZ
	Jb4OSkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XHy-000000042ZD-2Dfa;
	Thu, 31 Oct 2024 15:40:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X51-00000003zJM-1Roa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43169902057so8739645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388442; x=1730993242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YCxmOEeimQsWbxSuJOXydqCcdjHVKIXSn+X4nwfNto=;
        b=GzOb6qsipR+WCKT5UsRrvmVbhwF3gwrnnveWaSQZCGliYfWQNCdjVM4jXJFSLlmyqi
         GraNaHmtuxXy+QxoruTpyJJwd/Bu2c5JgdnMjW+DpHS1SQqk0nOMRNgu30pvUxiudzfO
         Ttypu7HTxvSUVC1OIAl1mUMjrfEpl0WIfCp/xWg7b05F++tUQm7WEPcWaPTtuXCD2Ci8
         N2EN7+4levTsSBMWKKm4c4OawrxCmwlkWxxQosVhXr7tz1tZWeKqIdMKDfrUmQ2pfL4D
         mp6uvid8vYfXaOXiNSEMfXBuwPtMI9T063ee53cvFeSvWYivc5KjayF6OR1Fa9TKyCMJ
         ckKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388442; x=1730993242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YCxmOEeimQsWbxSuJOXydqCcdjHVKIXSn+X4nwfNto=;
        b=xM7AeEt8Kfdbk2lkYeF2lGQO/wX2DGIALfhiz2PyCBljuVhTgrM5yakCup1Tl21bWI
         NAcS+nTGiSBez++A34nE+xSfTLrs30/WJNF10yeAlV2lWjBkyEQ8P8O4Ls7MO2M4lAVo
         rmX61Y2CA/JlZKOpACBulKXe0yFY7QR8V94ltryeYFhpAhMqi868jLTjnCcfPBmNPCLT
         Q+CQ/RREplzHdbb/qj/oIiLJef9Ns/x/+MBpDPyYhLHDo9cUc8synJQQ5cFN1rZFafm+
         UW0ULBZm0WsflYaTdlEBucuP3dyj5LIM4xuBpRLLl6iO6GDQ7qnxzPrLEDncQfdX70xn
         uRSw==
X-Forwarded-Encrypted: i=1; AJvYcCV4IL3ighK3xzSYJ9rL0Euw3IQfjMfBXzJNZQ8NIDPSbsmTJHdif/y3K3SJAOML83D4ItI85iDuSrez2BKwXm4g@lists.infradead.org
X-Gm-Message-State: AOJu0YzoWTeV3/AaZzwbn8BdKvOlBsFd7PgsKKBesu+UGumknmDrQ00V
	1AIJ1wys41VDswnzXWDdAL1GuhIZdgzmwRAi3gM+LSQ82eyTT6K1h1awiITt1uo=
X-Google-Smtp-Source: AGHT+IGGmHVzwn16NX5EZfe8eqBf1qzHN/yW4gKwcafvrQsBbKKrxU9ApLBrOxE39bgUdtUYNo0xBQ==
X-Received: by 2002:a05:600c:354e:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-431bb9de8a9mr66687935e9.30.1730388441668;
        Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:09 +0100
Subject: [PATCH v2 14/15] iio: light: apds9960: convert als_int and pxs_int
 to bool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-14-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082723_476903_367E8C73 
X-CRM114-Status: GOOD (  12.09  )
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
parameter, update type of als_int and pxs_int to bool.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index a7f0cc99f236685900f89fbc48de3be0e9a40704..7b3da88885693c488807da459ceaa1cbb3881bcd 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -133,8 +133,8 @@ struct apds9960_data {
 	struct regmap_field *reg_enable_pxs;
 
 	/* state */
-	int als_int;
-	int pxs_int;
+	bool als_int;
+	bool pxs_int;
 	int gesture_mode_running;
 
 	/* gain values */

-- 
2.47.0


