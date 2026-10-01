Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCEACA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c/fiBbMlGw0oVqJMPaaFFl/1eV2TqjZPhEUkeKiNefM=; b=086EcvNgNy8PfQ8skSybl6KihW
	a/Ye4EFDx2ha3YUyd88VpjY97ojvHdAof39lTXVQqp7IZHU3guIJMOh/cjupEiMZyUzIvdTYqLVBg
	xMh8ffCVckl5wpGqAb+mvnVaSmbCtwzlBK5n29Yg1p/tR+7hCrBKymNg+zgWwVBnvjwdwI2P2Brnw
	XS+JgS3RNjCCBZScBj84PCVNdD0vMZnKJof5BwbFCaE383N7Pg/sdqPkiRhfzEIlEvVb2nUQtOgJq
	lHJPMcCQS0pq7RIBsHAT7oQVDEjEKTTsL5KgLP6EJ+gHyi5kL6j5K02dYmToqrxW6SyphxjbykjRe
	8vLcxO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGgA-00000009DPO-1baY;
	Thu, 01 Oct 2026 13:18:30 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGg7-00000009DOl-1HPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:18:28 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so3898135a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860706; x=1791465506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/fiBbMlGw0oVqJMPaaFFl/1eV2TqjZPhEUkeKiNefM=;
        b=slWl3kMFnJuwn699KXud1STosEKBzVWKUJqFEVSFVzjqN4JX6Z/wdFQyXPzEltt81p
         fqK1wfN+UkADEVJoEXZ1qGBp5R+6pdK5HVZiTL6yvHPf8BRbYmqVy2DpNHPUYByRBOZT
         Re1PWMQCugX/9A5ADBB4YquXkR/bDNGiim82oqMA4dxRSSrLjE8hTYSmh/+cW0vz8sBB
         Z7VEgwDkcU2SmxmBtmv2oaksQs7fWr2C9sTt8MZufnjZbPyOO3aD2oyWeNIWEplbBVnn
         w+AOi2+CZl99R9dpqGAuBonUyJndZPDclXnfUNZb69F4sb9p0R8CPLz3+Xtw6mTW6rvw
         dG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860706; x=1791465506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/fiBbMlGw0oVqJMPaaFFl/1eV2TqjZPhEUkeKiNefM=;
        b=km5Z+eJqdayqRjBCcmQUZrpmtSdVPZDR5COnfHiURZohYLB5vDHN9AAJrGypnVeX5h
         /0hinbUQRNc2Ag4UIWzp4KpZ2aAB1MvLGsOIBiZXpkNcQpyVRTYZqCHWGwoGazy0uB1T
         aME8NPQ144S6VB00tgz8ifNsoWaBsoPUo2f91mQevSuv/OI3bYHJLj2j0bF/D1rc5ioo
         YBnJuX6eKZXK1A2l+elldgGsfRbOXjUMGX0vEwIDjUoCvhEZITZHpZv7tygUksGMvRtS
         uTLj2GUbv7NRJu3Zlxln6zu/oqteZ3YPy5k6+1f8YfBluTSHQZaScsyRXSY1FjfQw4Yv
         PufA==
X-Gm-Message-State: AFq9FYJ6qIhdS9+JULNzeZb9mziw8dqnxle9PhlshtwQYZsaTQYJql6Z
	GTcaP9g10j739lnLvMvV4sFf3Q4t1EmMOx2B486ZEr8gitoPdEvjvcdtjHNCRA==
X-Gm-Gg: AYBFou0/01Mg5k3ErmFMMKF5iKwKvEUA6QJQXbRmech3HMDQ0Lv4joaWign9mBkhoIL
	ecbnniCeI7600OdgEItq89Ie6G6+0y+mfX1kn4fL+jAy5P5cHVtSqVxdziRQ4Gs62cyRF7DufZE
	iTcEFA4e5T4NYnCynYUwv5x/QcPmtK9uN2nKHv7aJaZ5dJQg0zanK53YdxIaFT9jN2Znd53LYkx
	Tjom7DOACjnjsVpixQ+/PTHiQKKREbQwPKOFm6qWBYRmVHdKL2U4+ivWYkWXHL0dIAf4tf0Aa38
	kYPewXyZU+nNDRE1O/0Bj6OxmKnGued+9cEAgVNSa4cvWiM1JEW35yZlmaNkSK5tuLjx46gOqwW
	WTXVNX2+YCTtmb8ZlrtlbS6f7Cf0g5frpeLl3c3Tp8dbY4yBqV9be6dtj3TKmVClmQFi+414YIS
	fQ0N7eJYQKqh0O8A7Gneh42IFYWml5lRkxvA1A7wWqcNEs1M6tiwmbzCOF0EO1ezWObL2rGM7of
	nW0WevpqTljCIPs/kb0JMf1Yfn6h5J+mP/f1+scgrNMyX6AcqFDTNBbEEfg
X-Received: by 2002:a17:90a:b90:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3a4d5c0f852mr2590568a91.65.1790860705807;
        Thu, 01 Oct 2026 06:18:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:24 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 0/3] spi: Add Nuvoton MA35D1 SPI controller support
Date: Thu,  1 Oct 2026 21:18:15 +0800
Message-Id: <20261001131818.110028-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061827_346734_28454EFE 
X-CRM114-Status: GOOD (  15.07  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds support for the SPI controller found on the Nuvoton
MA35D1 SoC.

The MA35D1 provides separate SPI and QSPI controller IPs. They expose
the same Devicetree-visible resources and provide up to two native chip
selects, so the existing MA35D1 QSPI binding is extended to also cover
the SPI controller.

The SPI driver supports host mode using polling-based PIO transfers,
SPI modes 0 through 3, 8 to 32 bits per word, LSB-first transfers, native
chip selects and GPIO chip selects. The PIO path also honors per-word
delays requested through struct spi_transfer.

The existing MA35D1 QSPI driver is updated separately to support GPIO
chip selects through the SPI core. SPI-mem operations for devices using
GPIO chip selects fall back to the regular SPI transfer path, while
native chip selects continue to use the controller's SSCTL register.

This series is based on the current broonie/spi.git for-7.4 branch and
therefore includes the already applied MA35D1 QSPI reset handling and DTR
follow-up fixes.

Changes in v2:
- Extend the existing MA35D1 QSPI binding to also cover the SPI
  controller.
- Add GPIO chip-select support to the MA35D1 QSPI driver and allow
  cs-gpios in the shared binding.
- Remove the unnecessary SSCTL spinlock from the SPI driver.
- Cache the controller clock rate instead of querying it for every
  transfer.
- Rely on the SPI core for transfer defaults and validation.
- Avoid disabling and re-enabling the controller when the transfer
  configuration has not changed.
- Add per-word delay handling to the SPI PIO transfer path.
- Add system sleep support using the SPI core suspend/resume helpers.
- Rebase on the current broonie/spi.git for-7.4 branch.

Based on:
  broonie/spi.git for-7.4
  93914f171867 ("Add enhance SPI DMA support for JHB100 SFC")

Chi-Wen Weng (3):
  spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
  spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
  spi: ma35d1-qspi: Add GPIO chip select support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  41 +-
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 |  39 +-
 drivers/spi/spi-ma35d1.c                      | 716 ++++++++++++++++++
 5 files changed, 799 insertions(+), 9 deletions(-)
 create mode 100644 drivers/spi/spi-ma35d1.c


base-commit: 93914f1718676aec13ccd3787642c8b05e2b8309
-- 
2.25.1


