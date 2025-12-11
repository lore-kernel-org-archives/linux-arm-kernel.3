Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBFCD41D6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMKKApEFn5c8w14X+9lJPDLyCyjEvXThCatdwXgudow=; b=tZK80zNAvVLoRz7a2qEC08TvcX
	dIl+8nQtKHRIVNGni72eSGTkux5OwPYQzU7rE0QNq9E69PejTHgohc0K7+0dqG+ZaiOC+foi24UsN
	KubQLu0SgMrKHKMpghb7FHihRuR0XbcD+ykiAyc3Ah0OMMvLBfg6n8iG2XZV9DBStL8I59cuYzII3
	kLVqZO1Jq0h3gYh+JTuqPpyITTAZsXcJhMI+NMzB2Mn7hHTALDBlARQRo/zTqp+fzHIxQG7k6a+Al
	tqPrpO4gjuUEordPbhM/MA5mzctMRydasMZzs2C9hOxHVuQcglp2EsZvl1wc2omsofxEa/IJ9a2qi
	51hxk6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGu-0000000H1CR-3P5H;
	Thu, 11 Dec 2025 17:16:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGs-0000000H1Ag-2Vnu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:16:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso1755255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473365; x=1766078165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMKKApEFn5c8w14X+9lJPDLyCyjEvXThCatdwXgudow=;
        b=tG3l1AAiCv2QJbPGFqqNaSYNltmk9HqhSXcRdqiAXE3W2c0Z9RX1VC4V4DqYwtSa0n
         9Xb+EVLtHv3Vto/hrgVvtfC5YLFcVTX4qcXeLImkA/hoCgzIZBccdntN+GVS6BKzTJF6
         9Ub5ugrFY/Wz+241rVvg2VFUyfMuodQ9oC0hYhIs2ajiJwDH1a1wYTU2dWn+Ht73uxoz
         WgozIt9nHVLj73knqnmPdMFzMyl/2V5gdXyMBRoEBCi1doS0b4+sug3kjNxo+8aWYQnj
         6i7u/Y2cW37tauJbgJV8klZwbfSH+iSWBGoJ8oy9I/CnlezRTy5f33cIpb/9rrJ3rzWm
         5log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473365; x=1766078165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UMKKApEFn5c8w14X+9lJPDLyCyjEvXThCatdwXgudow=;
        b=H5n0m/gyxDMWgHoHuQR1JAi7OWaUV1YI/sPOFnHxHJpYLXP6i15h00pr0jFRqLxIT9
         2sQEv2ITZwwEvi28AsxieKBAcd3xlqEwV7YfD3zzcYZeBkfPOBmT2kLywG+wVK0U+Y3L
         PNZ7QCrknQJniFNS3XewOlaUw1YbFLowCKUDOvc+FQ9rAjvZdOQrJoGT6ZF3MWUpOSrU
         Ci+Xf9gYptQvicBeeQq9fsbX5L5kaadBWFeysgVSoYsNFHFQ6mErxDateEz7jO4VySx5
         AtZTqbrla+OkiiZVubTGQGXVsHTrmO9/GQTxif45QVHklAQDXmmO0ZwyfRBRZyGbsvix
         vLUA==
X-Forwarded-Encrypted: i=1; AJvYcCXlKenm69Az3V3ayI1hCVdw6Nl3Q45X3iXcpHxNVM+NGwhJWnMI6CrRggqx2W5OBwTDDPhsqRgJ5PeHB0wnjgsE@lists.infradead.org
X-Gm-Message-State: AOJu0YwcXhTH6c8UPHjHb0htB7iUgPS3oaxhXScZmLnX43fSkO90Xpyf
	JGnT8Jsp1vAxQI1EcdTx8eNttmdP+SHKOTEEXk5q7ApMHKT06OiiFSMDiE6VYbN43w0=
X-Gm-Gg: AY/fxX4z+FNODiZDtUXnBNFgd/fY6ySIwXMo4R7uC6oMhWdjKGTR8BLqUVU/cUu7v94
	VE8EzJCQjMAvn/8Xzo9GG82purimjYKYNtwLIQ+5tBx0V5L8cktoHwhMTIJlfM4UTnhJ1wczDL7
	Yld8zrheZgOXmRdTJl9zsWW/ml9qlrSf1GzEB62RqBmuiwplZ3yVQS+bgwe+YZoEfdDi2XeZOuq
	Pufb/adU3K+rQCuYtpK8A9O9UCzgTgx+bmXdV0M/5FNVz5Mo02z8ZOwxK3oNPyYo3cm5ghwjVHt
	KIMZHT9qXVtkhMBlDyzM4Olo2K+mPtJeaXSKjpYT09XdiZsmhQEIB8QIb0F2OjX2bthu5yJDeI7
	HwOzqjOeYCFNxRR+Ws/saNu5XMDIaQVB9zmenGqv5I7Im/HMtHKrk3rMdlt5Skx4ZNsMm81l1wa
	zw9X9OwKQzUTQHqi2QJgJbrNdb4Uwk2q4dyk8xxYp+THQXC+PAMoHU9eQSZWq6cr1rrtD6X+r+x
	zc=
X-Google-Smtp-Source: AGHT+IHR5wjI76zu9sSNjB/TR53h9qMqGGV22PiW6Sdd0Ha2DeU4S6wSatCpyfSEE7httE0vZDzqrQ==
X-Received: by 2002:a7b:c8c8:0:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47a89ecc772mr21399785e9.11.1765473363525;
        Thu, 11 Dec 2025 09:16:03 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89da4756sm47522465e9.6.2025.12.11.09.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: op-tee@lists.trustedfirmware.org,
	linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/17] efi: stmm: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:03 +0100
Message-ID: <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qEDk8mMFP/XEe464QAjK/gPzKwVOi+IAVX6mgf9QBHw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwrs/+p/EDhPyVo0hsuMP6NMvstZvfqWF6GI tijtgKig1OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8KwAKCRCPgPtYfRL+ TsBoB/wNEFSwNDkrKKSZy5aBqOoPmgOHHGWeulZsknyP3eoMH8etCfP7O5OsQJHFzYBTbcaeW6u ullpwQB4VirhqNZF9P+gKDCKywT9I9jIWFaS7dkKKzEQ1YCt0H4nGxR094WM6gq4PAUWPdnjGzY LC1E95XggFZrSmDz+c4c61Ifzcg7EpDMDlkoaDDSz8D5QHMKZG/uGMMQAujC5kP8C0yREbR+diO ZGXnzGlKJr+qOIIXYrnvnZLxZJFd8X9AaDf16BFDO7erlIo8VpODXbUJkxIT3/VgPeZx3SWUTql a9O+gvtyLIm9AgLef3J5+UoIw4BpKfDQAJByZVX6gOhes9a2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091606_650447_A76E64BF 
X-CRM114-Status: GOOD (  13.50  )
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

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index 5903811858b6..7b04dd649629 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -520,8 +520,9 @@ static void tee_stmm_restore_efivars_generic_ops(void)
 	efivars_generic_ops_register();
 }
 
-static int tee_stmm_efi_probe(struct device *dev)
+static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
 {
+	struct device *dev = &tee_dev->dev;
 	struct tee_ioctl_open_session_arg sess_arg;
 	efi_status_t ret;
 	int rc;
@@ -571,21 +572,19 @@ static int tee_stmm_efi_probe(struct device *dev)
 	return 0;
 }
 
-static int tee_stmm_efi_remove(struct device *dev)
+static void tee_stmm_efi_remove(struct tee_client_device *dev)
 {
 	tee_stmm_restore_efivars_generic_ops();
-
-	return 0;
 }
 
 MODULE_DEVICE_TABLE(tee, tee_stmm_efi_id_table);
 
 static struct tee_client_driver tee_stmm_efi_driver = {
 	.id_table	= tee_stmm_efi_id_table,
+	.probe		= tee_stmm_efi_probe,
+	.remove		= tee_stmm_efi_remove,
 	.driver		= {
 		.name		= "tee-stmm-efi",
-		.probe		= tee_stmm_efi_probe,
-		.remove		= tee_stmm_efi_remove,
 	},
 };
 
-- 
2.47.3


