Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1029CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=; b=PLESjI3/VMfjS6tnie7WnhX49V
	a/TnmQIES9uCrsSfN4g2vDGl1smaxmAR3pAGCsSzmOx9Mt284kVmNkJV4kUK6Vuh3fp4QhuAY1x0P
	Z7u4Fw4kZUA3Vbs5gjLnIrZJ7AoYHQbVLN8J9EestM4BxStcW39a30hGuuAveehRCwo+OeZGhdpa5
	pcJD6H+vwVlveObAbCpQ+9s8+ovWEoToITxOmfTcg3Zzn2UWfNuUhGsnOtKKju2W9EyCiui72bTzG
	BaBFyMrH9q+s14+U7BkhMsdBx3cY95tG6PRmx7t6TYlN+UfTsKhzM8BFX1IUf7z5Je76wpcwezXqN
	UaCjZ9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3q-00000009h6V-2CuW;
	Sun, 31 May 2026 15:26:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009gda-2t9M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef1198766so1192246f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241168; x=1780845968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=nBD4AtcAP1Yne0RPsFGK4mvw8qIyizsxt6e2ON4JBCqG3XBEVGMVs1JT1vXzyBH8iu
         xEYLAxgBtabqUZykMr2Ys+ot1It2FZ3L1+oBkP9QDCYag2tWHpnEIOG/3L4xERZXyFFl
         GjWVHoz9tfWT7tRSZWk/ltZywwWESEOWLaimH3wzaM1/hOcTHCOm114jd1p1EvtafmkF
         YjdN6UOr8WfvHfKX2h3HwBuTXLYpRkWQhIyi78xXDj67yTJ5YhjYBF1IOUukRtyEu9x4
         8z3Us1zOsyEoG2kqWhhB26FJ+myHAp3nGipeifeCpUGFpKWx3O/A+96dMRtHfVKwzGb2
         sx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241168; x=1780845968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
        b=a0HWxt1JHvIYGmzUoVQ8iDx3lsMMy2KqSbi0aoBGdwRgPnfGJOKBWuAMP9JNBG3/27
         vsfC3UV5WydZhP9tVhA+Q7L+CUyM8Kxy/Avg0VEptj9b8b1VYcMSax1QbQsuwz7dOS/2
         vVTQW1ePulzjYKJqlichCZXJ5s4dC3AbKToBVYkBonqRYa16RSc+LwcwOltMDem7kTv/
         Oh8z3iiEfkKatWHWRwoCbQjU9d6sY+XpzTtaeuCPy67vdaRY9hnhmdH4jTRonfqFCbri
         Nr7wsTQ0WeWwtkjtHLEYgyLy6XGzU7UWct2GwNwgouiZ9Q/iH5DKSX0uJH7U+AY6gzhm
         L7qw==
X-Forwarded-Encrypted: i=1; AFNElJ+ecBz0AHS2cKH8S4Ri9+4bHrjmosaZYDRZc7GwyVY+Ke1quLNG1iyS4QgnKx4sgoaLuQHRy09Z0lt1NR1Mz658@lists.infradead.org
X-Gm-Message-State: AOJu0YyrECPpTLZtrlkjvWNq/krK3RwjuLdMmdJzIpLOH346ffKSIwiH
	u7Zjv3aHNoCnwfdyfWfXGh4kj7t2J35n1Ip7BRf+BHqJ0MJQlfibzp1LEtCobrDS7XE=
X-Gm-Gg: Acq92OF6iPjchHtZKKNCKJz9XjA5daN5vMMSu8b3oAkvgW9KsLYmcq1cfe0/1qsT5SR
	0WeyviuIxzcdIuoG8Ns3qlEKPYLKGD/v2p0P3VDwVN209Fu8kTtQe8N2MSarPmQjfmK0iel0S0d
	2V/mykWTuXfCzokb4OsYGUmA+KvQLTmY3sEJ0tNjNUZ1rHC89anZG5fb2Czys/tkCqLjRzWl8jX
	RrfjIypmUAeTOHRlzLymheR2jy3E6kLVBQ3GmaYsxYfdfrSO1fgKdQ47yVE9VOg7pahdtyEpr9b
	VxSrVHQHA+926I1HtcLQGlLxLam8trN72xQ8uGX35678FegAi5CPcj7b8FCd2PeqwFukL7STsMY
	vWJLiJhfsTWPWYJbcFEm2Z9R0FF1Q/oTKmTiKQQdzH1XQ3z9Iz5hwXL/KfMJImuWYdp5oTXCNbV
	fcTttPuwaasntEY7mHkGiNGkEHDhKlnqr4r/Wtq4d5tA==
X-Received: by 2002:adf:eacc:0:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-45ef1385deamr11155719f8f.22.1780241167790;
        Sun, 31 May 2026 08:26:07 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:07 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:02 +0200
Subject: [PATCH v4 09/11] m68k: stmark2: add mcf5441x DAC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082609_798519_D53A05A9 
X-CRM114-Status: GOOD (  13.23  )
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


