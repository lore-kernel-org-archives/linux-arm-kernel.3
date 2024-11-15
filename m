Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70463D68BDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7BXM9uHlPL6jMEU0OEeFrxwAP6qySqgpEWYWoYZaXg=; b=ZaDmKJj7WzxyFudj+bzRDGhKoh
	ceTlyqp2xo24xQe4w6zdFMulEf++ugsb+lZoylVT+t5hVBlS0Dz6y7MqLVPoEssdJB1ype4MTMugw
	6+vnCGm4qugx2M5SRgJ1PENi1s8pLkWPYEXYJ7XMZlPZ3sQJT8h67PinsKr/ct+sOj4uC0PAzb39U
	o0Tdp9vvglL68EX1R+hgwf3WACxT3XPTJsr54dKHAotDac731Gveb7meFVK9ktE+ezbmH+yXLcaH5
	HlqkH1YopE8vlqSN7v1sjJWuoe/oDQY9N/4o3YiS3A8Sc8W0ITDBVDMQTXsnsE7kozNdyb15GFGld
	ceg8aaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4P6-00000004KEL-2WZe;
	Fri, 15 Nov 2024 22:03:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4O9-00000004K0o-2X2D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 22:02:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38221306992so31524f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1731708119; x=1732312919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7BXM9uHlPL6jMEU0OEeFrxwAP6qySqgpEWYWoYZaXg=;
        b=NBrRAHu67dt6oUEN8ZSibyeIkcjhVnXP7sY62FUv9OqfT5wTZ0mmTsEFOzcntSl2M9
         v/vSrGRnyfXCez8hIZqEKnBatpWNXnOgX+dCQhUUHnk99hS81o0wreXw6tLkgDCcZrTT
         ojGewDl4Nyp5zbjLdiFBv8SwKflmaojAgZRw6ixTzHJzf/ZIOzL7DHSMRIkU1BGmCGVH
         LmrzOrLl98mEW0Rj/Rc058G+3KgBFSH3jrme9ykGDN8mPxsHts0Ixu4xXgRocjNSvN/7
         JambIFqOD0ZYqYssfCRwZYIOOxKD1YKyjnj/iONpwqu1kJ5oc0iCFiTNLfsXSojZd+w3
         ZT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731708119; x=1732312919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7BXM9uHlPL6jMEU0OEeFrxwAP6qySqgpEWYWoYZaXg=;
        b=azlYZdwSu5+qQQyjY9GBdc/147JirVXZfaqabRU8Bc3BoGFYEMsq2T/aCtnHw4exiY
         5d8Oas/P2aWE4tF1+QqkLUWkJdfdvCZMDStrruQbEOOj358BwLUhOTwutZze6IMMgtk3
         TCxt2wW/gDm8Fk73Hx2XZ2a8tLA5tXRPfk5j6iBWQ2CyU+QH20mH25NCCczawvf0/O3+
         UxKGwOOQ1MP0IOGXrRBxolnpIpWDu/7rzsbxNpcPE+fwfwhf9AqxtFFjoAgtfM+Gah0M
         z9b2Oy6HiOvwj0KTbR4iM7h3YahCdzG35eZv2cm3k7fA8lxX/U2VAXQo5LCIsq0A43NK
         0h7A==
X-Forwarded-Encrypted: i=1; AJvYcCXTp0wXMZgyakHah2R9MIF3931cCOSgJTQ8aBqVMIt7Vjvdtwrt20vm3/l10Trqj2xNxCoArjIVx2ltxttoleqj@lists.infradead.org
X-Gm-Message-State: AOJu0YzngpRnTogXCcL7tcD9oGOW5iqxHn9MdYikxWxUiok2Yg9+fovC
	S5LAvmN1DigNyadG5pkDLpH2Nvt/cICrmw9fnRxpi8A71sNwlJUILJuvq7jOUtI=
X-Google-Smtp-Source: AGHT+IGjkzoAQXFxARiQrL8p/xLqSrw6wqKEEJ3PXcTvMHBD/NA7oyekerT58FzZoi2a9uv8ptBRRg==
X-Received: by 2002:a5d:6d83:0:b0:382:2e9e:d68c with SMTP id ffacd0b85a97d-3822e9eda85mr2141749f8f.38.1731708119172;
        Fri, 15 Nov 2024 14:01:59 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1b94:c354:f504:96f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm5470537f8f.5.2024.11.15.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 14:01:58 -0800 (PST)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi-imx: prevent overflow when estimating transfer time
Date: Fri, 15 Nov 2024 23:02:02 +0100
Message-ID: <20241115220202.31086-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_140201_912421_EE7EC6E1 
X-CRM114-Status: GOOD (  13.08  )
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

The words delay is computed by multiplying two unsigned ints
and by adding up the result to a u64 variable.

The multiplication, however, is performed with 32bit math
thus losing data when the actual result is larger than UINT32_MAX.

Fix the operation by casting the first operand to u64, thus forcing
the multiplication to be performed with 64bit math.

This fixes 1 OVERFLOW_BEFORE_WIDEN issue reported by Coverity
Report: CID 1601859:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)

Cc: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/spi/spi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 0b6b0151b3a3..eeb7d082c247 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1685,7 +1685,7 @@ static unsigned int spi_imx_transfer_estimate_time_us(struct spi_transfer *trans
 		words = DIV_ROUND_UP(transfer->len * BITS_PER_BYTE, transfer->bits_per_word);
 		word_delay_us = DIV_ROUND_CLOSEST(spi_delay_to_ns(&transfer->word_delay, transfer),
 						  NSEC_PER_USEC);
-		result += words * word_delay_us;
+		result += (u64)words * word_delay_us;
 	}
 
 	return min(result, U32_MAX);
-- 
2.45.2


