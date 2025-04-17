Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA8C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6kZCUyOGMeKdwk9Rr6GjPnU39uDn4efBFP4mrDY4n8=; b=f1CjayM6pxS0GL1lzZe+98Izbd
	EtyMKFkndUb2ovagDYXjMV1JY/TmC2D8G3FDvLAgxvvGkP8xTRp5SiMBr8JEsF5g/qVITAL7qElFN
	lCRiY2OenUIssrtPU2SzPS2U1Om7PL1B2Kvq5zRLinjDh0bGjAVDFdlU4dmokDVHmZfBr0OIfQYct
	xBCI84obO8SgBarwJ6i2y5+iuaiy/ZkcI5+n5wCvHRrX/PnoMA6jlxIbv7JFQKB++gmsk47F44Wfi
	bI6h5gabVe5DV414/g0ZZKANxFyP/pZ+DUUD4qmYMiWxIKsHJihtk8JxefXpryA3Nh3nr4ituGTDb
	qKsH+9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5E0g-0000000BQpU-2Lfp;
	Thu, 17 Apr 2025 01:25:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Dsl-0000000BPa9-3gfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 01:17:37 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ad51f427054so134799a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 18:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744852654; x=1745457454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6kZCUyOGMeKdwk9Rr6GjPnU39uDn4efBFP4mrDY4n8=;
        b=UpoKj+Y+T0skL49Adi+z2nqe6ZhOJHmaJAsAZqooYGb+4pRwnZSydAh53glpegUAd6
         Ctjjsvn4PrL2L8+cUoZSAZqktHbE9NgSR0zf7tsS/B9uqa+9+wJ8cpbkJOp5bdhHSS2L
         ubuXlyOa/SxQZUYmI1Pjg6K8cX6X/U5GmIdB8qJ1mzcWJG2SIMALx9YUpeoDn5w65kAk
         JXrDlrFwrZa4q1Wg/HQcW0kFrBY5Z/HHZmNCIZjIisIFcsAtURq3HTLoHKSRmaSw2WND
         MXFNr9SbhfAVXzschrDRKncEkyQsEugP7V0hXJgJcPuTd/6JprWX4khKNNMRWcbuD87o
         GgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744852654; x=1745457454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6kZCUyOGMeKdwk9Rr6GjPnU39uDn4efBFP4mrDY4n8=;
        b=aTShTNz8lcoCdZ5/EwGUisymFcqlQ6aSyMsSebjoEZ8fFgpsqHDtQk/X1GEuaFjTv3
         XC9wiGBawiVyKEryGB6SHafpapKwkQwhBib6qB8kkwxZCqrioQJRT7eJawF4Fi+a1VF4
         MlpBzFyLLIbvmH9/uYDmlyzqJ47OBqw0nFxXzkDMdRxjMTs8w4fWg25fxq/vmfvPqMPb
         HBB8SV7OSRUCxVBwBpbsTgjII0+/ZTWRSKpB4hEaVttKiRaD9+fcwNXp8Pf9cXsG3O94
         Sr9npx/dgtE83G2Q9zWYqWfj6DWVuZ/kCWspA6i4q9NH7d8skYXWd+0lcR+L0LafAlAx
         zXWA==
X-Forwarded-Encrypted: i=1; AJvYcCVEb7GoFhZFL9ID8Z8Q0wOPGnBoEnK2qQHlEt6DvaSqM4uSsJKEg62//d/o74WMs7IuAVK3H54kzBKvcsvhQu9g@lists.infradead.org
X-Gm-Message-State: AOJu0YztY+fPw+SvGpSIIPHHLpBv+PBFZ7t91hx1DP0eiTvRR3hhzXoN
	k9Cu7LxFLclKMYPXUiHC+kUzlYuWHHVxv3tfegAAbY69+44MzJvI
X-Gm-Gg: ASbGncuKLcS5XJQ69qOW7j7/oJEZR7yTHiWYzGYQUbuPwKIVdiYIWgw0B1YLU+ylPUG
	mo/6iQPcy5DxlL+D4QkMdX630pM5Q0SIU8iQaJNRNLPtTZSsx3yp/p33ZlgfTh3egM4LaYNmtNn
	GfmMJcXe28TdCsv+w4nG/eNY2+FvhkJNpF0Lh2SB5EPitqjuiH0voZUHrt/jMtmqsm3jAzsJbrZ
	28CYMz/WJ5VlJZIwoctj1WdgON8jLoIZN68LzKVQ+XinV2zro9IwOnn3Z1wSWaGPO+7k/bVlHtj
	TCJG5ilVM7ii64sSW1+vAPR6h0aXDlHtyNbXE3PHcnStMREfPWg0xHPjlFy4m6+zleArNmpsMTH
	S+dfQ
X-Google-Smtp-Source: AGHT+IFdCxEx27NH3yIHMAmLL3SGYxxHjyXgNtoivLisYP2O66x59yWDou7m+l9nKLM43nZ0EotW4Q==
X-Received: by 2002:a17:902:f60f:b0:221:85:f384 with SMTP id d9443c01a7336-22c358db3demr62326835ad.16.1744852654324;
        Wed, 16 Apr 2025 18:17:34 -0700 (PDT)
Received: from delphinus (p4007-ipbfpfx02osakakita.osaka.ocn.ne.jp. [60.40.45.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086104dfd8sm2365860a91.0.2025.04.16.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:17:33 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>
Subject: [PATCH] spi: spi-imx: Add check for spi_imx_setupxfer()
Date: Thu, 17 Apr 2025 10:16:05 +0900
Message-ID: <20250417011700.14436-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_181735_919797_7F115F46 
X-CRM114-Status: GOOD (  12.73  )
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

Add check for the return value of spi_imx_setupxfer().
spi_imx->rx and spi_imx->tx function pointer can be NULL when
spi_imx_setupxfer() return error, and make NULL pointer dereference.

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
 Call trace:
  0x0
  spi_imx_pio_transfer+0x50/0xd8
  spi_imx_transfer_one+0x18c/0x858
  spi_transfer_one_message+0x43c/0x790
  __spi_pump_transfer_message+0x238/0x5d4
  __spi_sync+0x2b0/0x454
  spi_write_then_read+0x11c/0x200

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
---
 drivers/spi/spi-imx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 832d6e9009eb..c93d80a4d734 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1695,9 +1695,12 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
 				struct spi_device *spi,
 				struct spi_transfer *transfer)
 {
+	int ret;
 	struct spi_imx_data *spi_imx = spi_controller_get_devdata(spi->controller);
 
-	spi_imx_setupxfer(spi, transfer);
+	ret = spi_imx_setupxfer(spi, transfer);
+	if (ret < 0)
+		return ret;
 	transfer->effective_speed_hz = spi_imx->spi_bus_clk;
 
 	/* flush rxfifo before transfer */
-- 
2.47.2


