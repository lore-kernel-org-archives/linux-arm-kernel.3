Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB46C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=; b=XnSrBPRhzCzkC78UoL2Dh1/GlC
	7rMIR0IcNAPhuuuuiR4PaleWHbbbjQ2qPcTECJGZrIZuQgwJMQvcShYoqGct20Gyiesn31INisIQM
	kf47IEfrXW8seCf695UinqLKg4BCsf0+Nm+Z+1t07iWrOFxKBI/oj5/Bordid8kzBBWze3ihYQBV/
	tdWAFF1zoIDwx0rkxs3/gCZECABbCP8NUx28FrDck3hPV1SS9q4qDPk3hZHaQpCWNK272c7ly0blV
	qnXZ+A+99LoaUJ6YZMKwDhJ8z5jc+SMkJqolkefdw2Br88vQec1dn+ILCs+gS6DU/i9+9sZmrEfS6
	HwX8xHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7y-0000000DCRd-05hj;
	Tue, 01 Sep 2026 19:26:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7v-0000000DCPy-1SRf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:26:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so21497a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290793; x=1788895593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=pLXB9BKsXGvi3UIG3hVhbRPUAtyYHm4RLxmU9dF/j0vC1m8iAte5Lstvg+uuJtY+/F
         85BeSw1MDpXldyQpcUYY13fwptarrX9ZmCJ5L1Ty2B3MdWqjom7Auy71K7MefNDW0cAU
         ttoMamZcfFPMoPaDNgDammyNvjjfKB1Uz2TDxkmUXJXYHLcNUOlQHhgofqXazUEl+HSG
         TGhkOEyhNf5+AEcuHJE6zMQEesl1O2JzSpyxEWgmOYiPhzDJtpC5eW8LwFvPXzVDNAmC
         IV3F7SghGdLRZqIKdbSd3nzag0PvTQ5/c8mDBHWGq7Y8D+KW7tpYDkZGhW+clcta9hlb
         8WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290793; x=1788895593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=BD3Tv9P8CowwhGy8uq+Qhm0aze6zj8ZugsisVZQEQWa66PbV2y8mFClNXf79LD9eLh
         aM+1FPD28rFvNYqUy+TNqgfx//g7Kk9M2tNuVHp23vVMTC1JB/M72q4xUT/uOn+jyd34
         WDlQSI1PVuEYHSNeXDe1vYGEf+ZOSSFEx/Hszzk9abwOUk2hRJfc3u7IRFbXszmlTpKL
         V+jN4A0hVGnNclzfBB6hrsbcrherafqjasY7L5aRQn/Sk62ey1gFG1jh66/8mhXYi0kb
         aPmEFS70pYDAuhuWxTi5K/mWqX//vvp5QlhCMM6fwe3yzPNW3FTUlxQcJAWuDjCdeDua
         KU7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQHmE4LJMsKudbY5EiF4TphIkTLkA5951pGBfqxC+cv45R3VYw6OuEbZ/x666pxT1T+AaHbY9Ld080m5CVFyci@lists.infradead.org
X-Gm-Message-State: AFuF++nuzbbZ0novV6cyWUGPTR0dE3fyiyNcaKQtjoYdMYb38Z8I7eeu
	/urQWjrCEVx3sPyty2pjVviTDzrPJlviL2VJ6NXCmnttzHwqEfi+2p0Y
X-Gm-Gg: AYBFou0fRraH4cp/K8R4Pd/87cCUg9LtOQtO1Nalpb50VF7LXFCP34uPrcVOEmVq2OR
	f9NSdIVYvl7TAoSLDYQJWGKfcbRzDjQ33qD6bZmtmbDgZli/1gPruRtrkjMW5+W0WMBbGhhs9he
	Lrn4U9Alc0nRSNwFD/OyvtIfTlovIOmErOMhswXuTg+rw90RHSFJJ6hgS/RNgpbUF2h6FAz5jAh
	KF4R6+EoOkUZrB6/vrP2y7FW1BWV7xgAnHnp9CWDv6pYP0aaphEnnGlxcLMVL6fPMYWqAZ51uBT
	NiEFwnYnUF3JHjH1JDjcuWYMKW39L+WGZZ5B7uy7OCEPyl0qpMC0O3I909s7ncBLA7kJHdKsudz
	U+PxB6w8FctmOyJbfGgIn9rwcOjVHq+pcv4SKFAIz8necOBPNkgKlH/l8iepqSFBtWv3/4IMw/u
	s3d0jFrpmlnAiYbA7kxM5Fkb1tGyNWZ8IMlJC8gddiWKFiohzvTi+5kqJpbjm8HQ==
X-Received: by 2002:a05:6402:5305:b0:6a6:757d:6311 with SMTP id 4fb4d7f45d1cf-6a68257c1eemr63061a12.9.1788290793582;
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Tue,  1 Sep 2026 21:26:23 +0200
Message-ID: <20260901192625.1497791-2-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_122635_402611_91352473 
X-CRM114-Status: GOOD (  16.01  )
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

__spi_add_device() unconditionally overwrites spi->cs_gpiod[] from
ctlr->cs_gpiods[cs], even if the caller has already set a GPIO
descriptor on the device. This prevents drivers like
serial-multi-instantiate from pre-configuring a GPIO chip select
acquired from ACPI before adding the device.

Skip the overwrite when the device already has a cs_gpiod set for
the given index, allowing callers to preset GPIO chip selects that
aren't described in the controller's cs-gpios property.

This is useful on platforms where the ACPI _DSD cs-gpios property
on the SPI controller is incomplete, but the peripheral's ACPI node
does contain the correct GpioIo resource for its chip select.

Suggested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 07c572e1df..fbfb9a1aa2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -924,7 +924,8 @@ static int __spi_add_device(struct spi_device *spi, struct spi_device *parent)
 	if (ctlr->cs_gpiods) {
 		for (idx = 0; idx < spi->num_chipselect; idx++) {
 			cs = spi_get_chipselect(spi, idx);
-			spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
+			if (!spi_get_csgpiod(spi, idx))
+				spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
 		}
 	}
 
-- 
2.43.0


