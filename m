Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58119C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=; b=UzpUy4ADP2wzp3jaVZvwvMUO/c
	FnZHe5zhSdmkkdlNBX8LAuh6PXd7BhoNaHVxkTEySnCWmXXxu6TwzocVdlHZQByLQ9TQuWgceqFfC
	L1xh3xH0knCCnWSL8lFHJRjvjr3dzGtwFsVrex6sxfklr9YsobyOlgE4MooJz6ELpUQ7JHfpB90Np
	9zBrh5j1Ie6zCMFQi3E0BOargReHfrvMMuPuaQqXmLCwOJKec1VSRGWjXjn9NGVkpYmH1xhl0VOD7
	w4e+YFMh+EuQTwVx6jrErME9XcTmKD+1iPHpGiZTrmV2yi5zbVePajPoLx92qFrtgXcniEc6A5WnN
	YVLVhEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVQ-000000001rY-1Z5l;
	Wed, 08 Jul 2026 16:52:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVN-000000001qo-2SP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:52:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b27c7451so972805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529532; x=1784134332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=Sm16j4SJxzVJ4DKn2AxXzDE8v9IOF7+IaB6MweHZAPpV/NPPJomOY1FUvkHYq9uHLv
         ST4SmJHOmKPJnKV2cvCnyRVBEcsNF6SehWfP39xqzw/hPqQMjLYhGEUi8CwnXXIfghJz
         07RbxEoGfifUrY8+fg+IpgEOQRVKaLDdE7ZG43HajXpi01tcOgjOT0PpdZ6FRSTKB5ms
         zqgMKSnKaUXgG43U7ZyYcG8vwYwfTLnc3wMqxAfbYGq6GnfoM8gF+m8UtxnWLiJ4yiiT
         c3XRep2na56U4H1zrcdRq7zIcbk2bV9zmCOR53oWL/bWuoBYJFV4uLg8HcRxI8zmoM5Q
         qo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529532; x=1784134332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=o+tca56axDPALfS8ot3gwoIOmi5VY+qVMWTshS6Kt688DC4gRNThbfORSQe4orn9XF
         qUGl+q5LE2b2ighbkxH5OKiID8pxf97cYAqvqCmejbtqnA6ERvjKh886FYd5W57rH0SS
         +XmWhRGkcGCc5y1NfVc2V4iQTr2EB3Ez0loEzDdKFtvnZedfjNdtB0S7xcKffapZS/Ah
         ao6GDsVicTPhvRJ7e8Jx6Fx1tfLPrElLTi0BootGedyk7Tjuvae1K2JIRcLyERAxQB8s
         /JJCkgPGHqdaFg5Lh7bFd1Dry+1YWbICTzInvKSaCFZCkv1uPP/TrFUQMxK/hRmKv1nE
         tFng==
X-Forwarded-Encrypted: i=1; AHgh+Rr55elGjSNC8sXlZtfiZtd0+LqZ7qwvCKhvG1/7h+R47ZYLmuEX0s5NS4hm6jzT3rqziW3oBt5VpLjNi9uY2d4c@lists.infradead.org
X-Gm-Message-State: AOJu0YzMYkwRHSNWXvNluUmypAO4YbmwzWKsahGiO6+jCQEUiE5HxEwU
	6G0jsUVxa+sNVm6Ez8oyMJIc66uQevVCw55CAzS3sNWawVZUeG0/4kt7fUb5bc5rI6I=
X-Gm-Gg: AfdE7clvnriq/YowlMUC9adJNrRjMFcp78by57AhcuoAtFt7pmv4KCNhrhSJhqH1wI5
	L8Gc/uV1udhM1v9N6XPGD20+FXYTPirAH6pHiu5YEtffh/Fn8NLLcYF4mODf9eyXE7p5V26okj+
	R2HJw5dZB/BvFVm6fTIrZPSxrrVkNju5tuB/CbDpPwHCSUiX/Yq/sjlygQwQwJPs/w/vYvV+Jww
	QbnoByrcGliSHXMJ1DNsuSuw9J9JAfUAqtyCdj9QZqjcxbnWUyFKZHSk7bcPI79d7/JyoFgTbAl
	SnIyF3IDUYeSg8t5LYHVkt4AVwgYbRrWnCiXSefbOBPnRCs/whgzs+A+pTWmDPUAptW98zpkx/M
	Fbv+RTmsOgr24kP+ILNXMzRoOfrdWL3r9hcx4Xf/wIKCbUg6EJRm4EqNzHZjEM1AnFcOBWOC0et
	X9l1bEMZO0QMmD8kJD89XvEWXDjefFjmHPvvfIdfeear7jFCkBGQrl8uxULWeJ2fnuxvJ0NIkax
	vUrhlxHazNN+PMBL/+2GsLwHIqiLiEe1AuBH64Qwow=
X-Received: by 2002:a5d:5885:0:b0:46f:8561:fe60 with SMTP id ffacd0b85a97d-47de9a0e419mr9448965f8f.17.1783529531534;
        Wed, 08 Jul 2026 09:52:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:10 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
Date: Wed,  8 Jul 2026 18:51:08 +0200
Message-ID: <20260708165201.624271-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095213_647652_9A407292 
X-CRM114-Status: GOOD (  12.00  )
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

Allow controller variants to provide a custom initialization callback
through their capability data.

This prepares the driver for variants which require a different hardware
initialization sequence without adding SoC checks to the common path.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/atmel-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index aaf7f4c46b22..62ea84d234d0 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -256,8 +256,11 @@ static const struct atmel_qspi_pcal pcal[ATMEL_QSPI_PCAL_ARRAY_SIZE] = {
 	{200000000, 7},
 };
 
+struct atmel_qspi;
+
 struct atmel_qspi_caps {
 	u32 max_speed_hz;
+	int (*init)(struct atmel_qspi *aq);
 	bool has_qspick;
 	bool has_gclk;
 	bool has_ricr;
@@ -1156,6 +1159,9 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 	/* The controller can communicate with a single peripheral device (target). */
 	aq->target_max_speed_hz = spi->max_speed_hz;
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	return atmel_qspi_sama7g5_init(aq);
 }
 
@@ -1570,6 +1576,9 @@ static int __maybe_unused atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	if (aq->caps->has_gclk)
 		return atmel_qspi_sama7g5_init(aq);
 
-- 
2.55.0


