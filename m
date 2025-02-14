Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7ACC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shBU7AF8cc3Gg0wYtL5qbOpWyX+VBS6JrNAtiNUzXh4=; b=aZih0fAkR/VSvYUkrNDGRJDLv4
	q9y5ScKX8IF/h5CMwGWAE0Zgf2TIzlZ6yJLuionMaND8NOO9/W0DOZTiYLB/oLkaRi4puXIp/wUNj
	o2uiwN/4okbNJ7x+Wd3oK1IsItJc/DiVn+ITbu0AF8poidDYpzKxewakqmPN2PuYG8JpSpP4ZpQa8
	MNdskOMh0sTPFmdeNwd7QdukfvSxHS5tYKh8w2Q9j/vBI1Z6WvynAA5B814Fw4LjKux7U3SnqTMG4
	xnhpyraWgBBd21sCfxnsU8z32h4WRtCMQdaKsnplegZKBG+3QcHByqn+pGMUFeA8PCMi7vsjSmPrI
	AWQS70Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqDo-0000000DyPS-0SCx;
	Fri, 14 Feb 2025 07:34:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqC3-0000000Dy9N-2aHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 07:33:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12227625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739518378; x=1740123178; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shBU7AF8cc3Gg0wYtL5qbOpWyX+VBS6JrNAtiNUzXh4=;
        b=i4z4xgZBEZMWVDKuqIPk1QA8z0TK+DcSA38t5/X3jCFtPTJx6uNCHQj+nokaian8qH
         Z2xHZbzSWbzI/U83IVvHrWJr4wSNMNPn/TBim70kUDiqW5K9kkqMkezdA9fTdyatLwcO
         CkwsEhxk27BADnkwDD1E5sM3iQQtfxnrKOeVwjhYobpeGawx3kOCOPXKvYEnOwg/kknI
         O0hdUXWu3lWDepd1cDnmebqxSGSciSRJQ7365pghXYglCoyEDrKngocTShCkgNlg5pnM
         kzA2TCYBxWy2I92fNdQ4ujVDTxfLNCM9thadM5Bk/fV2IGsSN34dyfY/GPBy52HoAQnO
         x2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518378; x=1740123178;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shBU7AF8cc3Gg0wYtL5qbOpWyX+VBS6JrNAtiNUzXh4=;
        b=pYtUxX6YPUJAqS0jYvy3ICSa9lVLNC9ZQdXuQdpFZQYFwq5oSZogf6EwO7HfPA9hyZ
         l4ooVbvg0fOcO/wdec4SERSFIQrjECWxyhHvkNZvma0H1r6Dzo3TNmb0qSkElrVT1Kxw
         puOqUrK5E3DnUXWDmKlS74d9PtGcOdCBB1NWw+k8aVWqJWPL2qXs/sgEC3vlUzjQvXQR
         88q1QdGLTyFYUTkT9MLgufHTTeb0mFKI2ht3OkdyXIGDHbbI1KRHzgMcSWygYAeoECV1
         kSllPH5AZsBPPbNZhVwot7mjxuhL7X+wdFxjfs78gtzPOPHUJZK2VGhknGhbtH4/o37Q
         u4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZvcgid6dnCe1lIoRMlwt/8cYIPhifMf/YIcjr0lHmrKG7YwxkYziJUFLfKnrJT0XQdXyNWiNVOtDUgQHFxqc@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ1N784kGEh6QBlrWZyRIohQP9CRiFUM9Kw3j9KvqM/rquBKnb
	YT+IDBQxQAzmo6l5RSiuuLjBIHuoht6sDXBQ/+ZzN1BoAy2S08FiP8DIPnWWQAY=
X-Gm-Gg: ASbGncudKA5k5wRNxuZSLXDwWBpAFyR5YtyvGw0e86syx3v1H/bULhwF9qfxrrz8fzC
	p3uuDbytmXcoIXRX6ib2Fpjco4CxeRWromcJsXaHXsKFijxGZB4CkUx8zPVpSdsnhpLC5FUYN1I
	ypzAC+BQYGJjsLV/xcmslBs1rIzbHB/kIoQwK5deeT3W1aTTHwu7TZeWunckosYtEAQMaXLuYcj
	FMyLyqte6ZYuPk2sBc84zWVRXqa/UcJxjSPZkE5BfN/4knd61kwuxJ5A95myKxW4dS1I8Vwla0M
	5xeG4RaweC2lZhIzqCiUBPSwwFfDaoaxOCDu0aEDAUPYBrmFgQplDcf6GDA8woWQ86Cn7Wc=
X-Google-Smtp-Source: AGHT+IFuIc7UiGCJhgZrFsDUkrGq451Woe/uSGjG7ifl7lmj2MKi1SN0qMavFWZVChA7j+uVL+MrSQ==
X-Received: by 2002:a05:600c:a00e:b0:439:688c:c5d7 with SMTP id 5b1f17b1804b1-439688ccb9cmr14257345e9.14.1739518377759;
        Thu, 13 Feb 2025 23:32:57 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da779sm37914255e9.7.2025.02.13.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 23:32:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 14 Feb 2025 07:32:51 +0000
Subject: [PATCH] spi: s3c64xx: extend description of compatible's
 fifo_depth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKLxrmcC/x3MQQqAIBBA0avErBtQK5OuEi0qx5pNiRMhRHdPW
 r7F/w8IJSaBoXog0c3C51Gg6wrWfT42QvbFYJTplNEtSmSUZrVtzhg4nOgpXjva3vVBK7eQa6D
 EMVHg/I/H6X0/Nv6BHGgAAAA=
To: Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, linux-spi@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739518376; l=1528;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qroXXeauOVL+Iovn6a2A4yrahP1v9fykcfW2iddMnS4=;
 b=pC0wnwQmYJD4VRMIu0mEU35gRvOsR5+nV7P0t6kj2Mi0FELhmNG6Z28A98l1CakNjcGIhYM9U
 cVx5nVDITq7CFuVM5o68gNDX3iuVdvCxa9gdRYs8H2LLzjPOiRybBHF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_233259_663669_14445E1F 
X-CRM114-Status: GOOD (  11.91  )
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

The FIFO depth specified with the compatibles's data is used where all
the instances of the IP define the same FIFO depth. It naturally has
higher precedence than the FIFO depth specified via DT. Specifying FIFO
depth in DT becomes superfluous in this case. Extend comment about
compatible's FIFO depth.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc003..9c47f5741c5f 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -139,7 +139,9 @@ struct s3c64xx_spi_dma_data {
  * struct s3c64xx_spi_port_config - SPI Controller hardware info
  * @fifo_lvl_mask: [DEPRECATED] use @{rx, tx}_fifomask instead.
  * @rx_lvl_offset: [DEPRECATED] use @{rx,tx}_fifomask instead.
- * @fifo_depth: depth of the FIFO.
+ * @fifo_depth: depth of the FIFOs. Used by compatibles where all the instances
+ *              of the IP define the same FIFO depth. It has higher precedence
+ *              than the FIFO depth specified via DT.
  * @rx_fifomask: SPI_STATUS.RX_FIFO_LVL mask. Shifted mask defining the field's
  *               length and position.
  * @tx_fifomask: SPI_STATUS.TX_FIFO_LVL mask. Shifted mask defining the field's

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250214-spi-s3c64xx-fifo-depth-6787f108be83

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


