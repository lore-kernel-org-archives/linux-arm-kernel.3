Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D496CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNOGLSnwE1t6HIl67zIcI4mTCSe3nqPHRh9GxNxgyWw=; b=d0hHioOcrYALbN6HXwcqJ4joUi
	zv2ZyseF03n9LqJk9bKKJjb++AGi2h8b6UDGZjiWVajyGRQX5MPr2GxLqjJKLdMfCae8rju9kfQBG
	KQ4MXIafKcwNJSh8/CtTubu2C/DmK+uFBGbxszGm++zvSU74TscViGv0wsXW7Rq3bnNBt5Xx1yVrB
	a+FQFRhCR6p0++rbbImnXPoYBZzeBh1XkBB1ovz4Gg6eOJYszZM0+POk5pdvkOpONezHiBHuoiM+5
	LtEFcmZeMZoKJfpUEYSWgQjm2TdtoDwnj2EltJAZrcrhrFCu1N7UMA4OsAnuiwCJGYyVYXAzJ5kN5
	QWiaKG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPV-00000007Coq-1F6m;
	Fri, 01 May 2026 14:00:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPS-00000007Cna-3u4B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:00:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488ba840146so15997005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644001; x=1778248801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNOGLSnwE1t6HIl67zIcI4mTCSe3nqPHRh9GxNxgyWw=;
        b=cVM3X4C0E6MQXnxLudmSWDkyilQc9Upnd3MLy6TG5/UWE3IB1vWVjVItRoekYo57qY
         ws+N+jRHTikyP2mgvoO24q3rQfJLGHzJ6hz1Mf+bDICbhr5nlDkrr2k+itNM0zlODHDn
         h4//V1nx+QCWkO+KxJ/mOj1V/bYyQftx41y6SAqlEBxgbcoL37MxGbh2IsXqWZqBpDDi
         LM4ZQdk79SEy9rvGG6UJCasuyReQXd0dOjRzZ7zpnLwdgDPx6HkEzYGcUEVLWInMX8P8
         x2/+T4TqGRmwrZDOFNoBMVLE0l8XTjTPGo93xlj7t7I5cC77zcswS3Mb8do/h2hNQFbn
         S66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644001; x=1778248801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNOGLSnwE1t6HIl67zIcI4mTCSe3nqPHRh9GxNxgyWw=;
        b=lCQpzG1Y8HOc3mFD/h10j1EboH+JXOabTV5tk6rYg1smSqJyCJCH9AwOOYHGCTolYh
         zu7tAgEiWf8/r0g/oBhQbc4N0pADB/VWHUBEEjoPVdLe5hRCXZmtTHxwL9yw0KsxaIzr
         yvJO2JKBaA4SgBWDNtZx9DtJwRT20LYFTxMpNOrY4YzyQy95tsUweZxdk47tFo0x0qUG
         3R/YOdIe+cvmQbFv9q1F1LphPW4g95/9+lWlh+7Aq2RYn7oRqWXMo2p7YKl7KpQjxPAD
         /8LDXHtodDS1xISrPclTultHExFGp1hs1vqpT1v7ZD3MDDoFShniz038U+S94qU3J4j5
         wtsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c0kvfY+299PPUbJLTYuuZK5T0sZAo/U7heaxHoevVr5hZ0yy+CKbQGKPj3ag5nY/vRsrimm+LJvLuAp/7+CGp@lists.infradead.org
X-Gm-Message-State: AOJu0YykgnM1XASD3j6IS7DHyvt+GLMHE1TpZJruhGuZrsQxmxwPqLtP
	Lz1ysGt/3QdkbSjg1wBV9oj2wb26hdDdJ/ZYeijVMSEvr/qI2mHZEpy/
X-Gm-Gg: AeBDieuYPMKs8rQVbuUzqDfG8UNNn2pXi7fdUNpODhnAfb8sm4b2CbKxyLYDfMUTeGG
	fB0tFDQqmS+KVZx2nkwv1/ZMRB2UaLIlfxTN2WXtufXmInufGC3N0a7f15qdV3CohMPRL16mOxU
	yZt/Y8BLd6RuQwmfS9YUAi4Vm2lpcG9ju3Bz9qd1TTAP8W35OCrox/YHHU56JmQ+rx/leruIQIP
	Hg4mMFcjRukaqE02s3rSU57yLzlW0m16uIJdVXzQBlpFrTzasAyUobnlJGa10pzvDhgtL2gWzCo
	miT2d+u5QsgFTtqTdPDM97MR/MKpPESIlt8c9RurXObt7n72KRSeTm2nWSTc3EIR5m7XqYU1InR
	B3nYEjONa7GqzCHSvyqRKEgmxmvkWamCBeaFk1Jj4LnNO/Nnw2w7uJ+Ej5ka+PLQRP4JS/u7sDJ
	LT8y/GP1jkq3Ct6xqolNdF8YUqZuybNtKHmxK6ijpv8NiMBoVY67QL+e2YvDtNyegPzBhi7Yy8C
	9AA
X-Received: by 2002:a05:600c:4ed0:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a84451fc2mr106947765e9.17.1777644000526;
        Fri, 01 May 2026 07:00:00 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:59:59 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 0/3] spi: imx: Three fixes for the i.MX SPI driver
Date: Fri,  1 May 2026 13:59:48 +0000
Message-Id: <20260501135951.2416527-1-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070002_975483_35AE9F12 
X-CRM114-Status: GOOD (  11.05  )
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

Hi All,

This series independent fixes found in the i.MX SPI driver.

These are:

1/3 fixes a precedence bug in spi_imx_dma_max_wml_find() that makes
    the watermark-finding logic effectively dead code. The function
    currently always returns wml = 1 because of how the !-operator
    binds to the modulo expression.

2/3 fixes a missing return on the package-1 failure path in
    spi_imx_dma_data_prepare(). The error path frees the
    dma_data array and the package-0 buffers, then falls through
    to "return 0" - the caller proceeds with a freed pointer.

3/3 makes spi_imx_setupxfer() propagate the prepare_transfer()
    return value. Currently a -EINVAL from mx51_ecspi_prepare_transfer
    (e.g. on a word_delay overflow) is silently swallowed and the
    transfer proceeds with a partially-configured controller.

Regards,

John Madieu (3):
  spi: imx: Fix precedence bug in spi_imx_dma_max_wml_find()
  spi: imx: Fix UAF on package-1 prepare failure in
    spi_imx_dma_data_prepare()
  spi: imx: Propagate prepare_transfer() error from spi_imx_setupxfer()

 drivers/spi/spi-imx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1


