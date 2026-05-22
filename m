Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDA9CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=; b=dzw8QGzvlWtgGWsdTXmMkwgaLY
	qupnU/k60A9mO44Yg2pd8dgTxn/e3S/TB9AbgcvnJoG8YZy50OCPXSwdnZdrDXMqGGSX7cg4tCXmz
	7hMNyI1wLkExkPgVpnie6Zhdfh/q+6vcrKLSNONt5vXXDRuezvYPNB17o0nFIyDvon8pJN3tJ2x/o
	JrL8ut9yGr1YBy8rZlyPMP/nHcx0T2/KWPhexZPhdCHMKSGj6CvwBINa0/8TDmHs7nPw/AM9n7kGJ
	n6a+f1Bq9lMIL28tVoPICNDHtME1cuMu23CkM9RcujnwvmUOFXaRSchliF9bLouISezhnoIVV9mkh
	lpn0Th0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJe-0000000BxPj-1kgw;
	Fri, 22 May 2026 21:21:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ9-0000000BwxO-3CeY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4903fd19957so17752955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484886; x=1780089686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=NcBc6FRqtNWqoAsgTfq18oiHXcxyU2NGNWT2UEd7k4i9s0RZoCQV9DHl1JjoxUVamk
         U7vpEGd3gsbtwNUIKSEF3enWIRgigxwsMb5D/DFSldY6KYvakdOGaiMlAPS6ZKd+W+XQ
         nkStyEaHqxsZakSqf55yxlb8gFyfgaJO+K6wuSRNRR/rLHKqjOjtjkbbfz1Du+/Ck6Ob
         10XoSiTDae4QfJCgxS9HPG8cfSHWCnnqnnyfnuxP1NOfyUF5ZUUXKRUgPq2p3zUfM/gu
         8IKxdIlgYPBpggVrJ0cwPuAY181yIp1AaHmybtADhG1fXYRqE0e1B8cafh+i56E+9oSN
         vOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484886; x=1780089686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=DnBO0rT2v8S1lJ94dJPjF2s0bbG/Ld4ojHlvabtDgozbbDVyZD7H8o/JEQCytpeelG
         dJA2ZKyhSMZDdTH332INW4ZP7BSg4y0jICo+IwATEcsZHhfxZ9vJXiXpW3S7nB9zD4Y0
         4YQwKcj5iA0imqZo5zYE1wON81gCQ1/b4Hu0umgX9x9NKWxvLt9set6l6w8WxiHN8Tu9
         w4KgnFWOM31U9UiJQ9XN5DHjMs8Ns3yWMEjQ5gb/SPeAGM0kD1avnKvA6a/p2GUxHJ1+
         6UaIKbLPQuHXl3xAnCQ/MhSNf8Vne+6TTrQtCWbGT8Ki3jTTaR70bU4GwPbJ4zNOc1Uz
         km8A==
X-Forwarded-Encrypted: i=1; AFNElJ8TVaZoPdoJtvc2aeTLfXw+IPVCHGmzFG4Hw4cByuZdINB5IySmMGiHqdRFSKunlBpYjO5Xl/n75SBSNxPkn+qy@lists.infradead.org
X-Gm-Message-State: AOJu0YwxVWEH9aaqYV17VNZ+sx0w5QZ+G1NJuguL7FpuMn+l4cm3YTFC
	aai1nPwFgyrA6nLQ3DFzZYgaEEdt1iSclDH4hzQZKKeEtiga6ygOMsyrgYC9jQbxGok=
X-Gm-Gg: Acq92OFfRZQkZhek7ndpQ84w/u1OPNntDaAajbqkCfJmTJCoDwuC6XemXBXHNFW/308
	qB5vmS+VpmGY2CIzVHCzNaKNtCqNmaSD7YaFmzIzvjvIJO8IfWuB7qQ7Z2Xj2VIltbk0kqIjuoY
	8VUFp8/Lj3S6nlyLhtzOkaK10W2F/lCeigtH3WN/iw87dTu3n49Mq/Dd1dUkLBvNAl8GyvleBK/
	nORlzGIFHb+HVikb4GLmBTDhasL6Ueqa1ZizeVAgkbbUy9xj8USCpoVDYxAAvN4GFYI8leklu9m
	zCX54mENSeLuWugbBr2baM8/ZlX4JlMieew6n4N32kjoTtlpQeNHPKyxWHd+56TmNyzoxrU7+QZ
	/ze4binDcs/Y1OepFy6nO3CnN9VhOJw/QdamFLO9CM8XmMJimPtqkE08AIQ/C/oPCSTyt8cPqjs
	9Sy0PS7lwoitdHZHNNFSccJyCN2necsn/aiHzgVjHp+zheyS5JPUI1
X-Received: by 2002:a05:600c:474d:b0:490:467e:a3d7 with SMTP id 5b1f17b1804b1-490467ea4a4mr57405925e9.30.1779484886067;
        Fri, 22 May 2026 14:21:26 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:25 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:37 +0200
Subject: [PATCH v3 09/11] m68k: stmark2: add mcf5441x DAC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-9-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142127_831194_CA82A8CD 
X-CRM114-Status: GOOD (  13.14  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
---
 arch/m68k/coldfire/stmark2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 536252ccb87e..d3be4b2953fd 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -83,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = 1,
+	.resource = &dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0


