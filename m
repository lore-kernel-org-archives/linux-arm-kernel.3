Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE749CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hizbOWzAp2GvHnkKmoXoB4flLKn0ZG1pSO3As3FJvhg=; b=i7j1NJahzPEkIAWdwueRkMXtHj
	FS9Wgs6uf3D/QE7jODPPoqMWoxR6veEAo2vhWuq54FyUcpb6yE6CrxEL0jydjNLApnxn8GD+M0Lgq
	oejWFcg08sl/fo60LrfTWyBlsiD8tJjpiJeWvQRU60YV+SR5oH2ZDfuQY68vboJlX3DA6v8aA/p+R
	fkTiHJPIps7GMHy3qsMA3dn/Yle5W4l+Pyvh0BHu0tSR0XFcHukoG0n/jbeqUdTbWXLCFPZPLOUP+
	ctZAsGMwJ+UFb7NJUsLURaSiskAUNKra6/GOnUQYVhfel/bFPFrvjQYNNM3KSgNQX6HdyIjn5xyMb
	LIyqm07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbTh-000000096W7-0fNU;
	Thu, 11 Jun 2026 09:13:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbTe-000000096VC-1oFL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:13:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423f52af13so5387847b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781169209; x=1781774009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hizbOWzAp2GvHnkKmoXoB4flLKn0ZG1pSO3As3FJvhg=;
        b=cPQlU3uUQsM0Epxr6LugMsb4aeAmsYHsEZmd+1xSnlXV6+0XrhYEj2ROGQ2soeshe6
         pfqNOt3yBJPRIeiO+/SnbIbwyasEHgphC/dQiJmxOaKqi/raqUGmAI6Ahdlwio0cb8IT
         G3aWTg9onsbWPfLo/XvH+AUtmb8iP4h5KJgPPbq2uAHxc+U4vsfFL7/ten4FsaYi5bWR
         W/l1purygoSUO9qUcan8ZioEl0qHJeyYK/rwSmly3+yJc1TSa2z8AtZ5Z0pVjNtKcPMU
         z1JVscTvFLuhVN+ZtJ+Z7eWDiWHeoMtkI9n62aIb99Ut8s2iLnxLziMG1o4/narTnfxI
         HJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169209; x=1781774009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizbOWzAp2GvHnkKmoXoB4flLKn0ZG1pSO3As3FJvhg=;
        b=gHItWKYGxpKTCbevHB7tNFDs3Chxf68svWAoQTxXtIwc2iutY0YNhDG5h7lbJxkJV6
         bESkKPiS1EIedOQOPG4b1zaNFaB0F0pAlJ1dIaONtSlw6lAdeInA16N6HLqkvJFghAxo
         o6OwftIMzzrz5eYyKZMEL7ZLmX6DEuX1DzF7We+72IiBfzp0YqkS6EjrgVsKVbNrww2S
         JklAF1Nc1kL5lZVwgz2e3k1LiYcWIV8jc8M9tzNmqL2+P8gORIkUHg9uVuTizgTRAURz
         Wq6Eo6STZR8Gc8ns9gGe+yDjynxE+kKvSwXyypGczP81LN8HkuIQoErNaIey9WP5hUrt
         teeQ==
X-Gm-Message-State: AOJu0YzuxdMQu7hiLcTxiRFKb0fYtfG6JDRjr0TVQUIGV8ufidRrBfDe
	bsYERnVJKcY/xESXvhAdyFqgJrxeerKsUSSj10KXR/X+wjFlmsvnXp1k
X-Gm-Gg: Acq92OE2DU10SeUjXuOlxiWVfXaoy2bxwc6GOtg3g41/IrIUPD7qMOYcJ1FMKb7an1H
	dO03MgVxKdY691LhZ0hCawAGW4eU0+vgmQfOX3mntgPvX292Je7ie+CozH55DII5u2zfX9PCxES
	DhBwjWgyizymSVLjbgziurLR3NvlBksszm8tyVSm5WRJGm+6lh52V5wYGwnY0OsC6SiwwbGAu1Z
	EZz9NGZjWXGKJ+nSpS9b6eXNDiHph24PKDZu9/AoGqstZv8Pa13Kw7NHi0vZ2IzhJ8n+R07Pzs8
	78Gy6x8tGQH672bh3eicvbEst3B5QTaB5Ci+7XHNGPpGHqigwX6yGVIbU+isB6eyTaBHau92hbx
	BzNjNZX4LQ08DDArVq6wVcLpC067P6IWw1R8FuC3HOeotuhbXWHlhqvJAcgMImh7RLrslXFTmRu
	Z62nbIeE1h5LRrsWrVZHKUfgK+NBCTighdOV/9oNBySJkqxfGWtRjAUQG/x7xo/mZloqmKNJL2V
	UppLLlzIF/sPkYJMDEujJ+p
X-Received: by 2002:a05:6a00:4512:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-84336bde6aamr2276246b3a.46.1781169208999;
        Thu, 11 Jun 2026 02:13:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84338319d4esm1417446b3a.51.2026.06.11.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:13:28 -0700 (PDT)
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
Subject: [PATCH v3 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Thu, 11 Jun 2026 17:12:44 +0800
Message-Id: <20260611091246.2070485-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_021330_494402_7009F6FC 
X-CRM114-Status: GOOD (  12.78  )
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

Add devicetree binding and SPI controller driver support for the
Nuvoton MA35D1 Quad SPI controller.

The MA35D1 QSPI controller supports SPI memory devices such as SPI NOR
and SPI NAND flashes in single, dual and quad I/O modes. This initial
driver implements a conservative PIO-based transfer path and spi-mem
operation support.

Changes in v3:
- Fixed DCO mismatch by using a consistent author and Signed-off-by
  address.
- Added spi_controller_mem_caps and set per_op_freq for spi-mem
  operations.
- Added SPI_CS_HIGH to controller mode_bits.
- Added a short delay after requesting FIFO reset before polling reset
  completion.
- Documented that the MA35D1 QSPI controller pushes one RX FIFO entry for
  each TX word in single, dual-output and quad-output modes, so TX-only
  transfers intentionally drain and discard RX data.
- Added missing linux/delay.h include for udelay().
- Cleaned up unused register bit definitions.

Changes in v2:
- Updated patch subject lines to match SPI subsystem style.
- Added commit message to the dt-bindings patch.
- Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
- Expanded Kconfig help text.
- Converted the driver file header to // comments.
- Added reset control handling to the driver.
- Added resets property to the binding.
- Added num-cs constraint to the binding.
- Dropped the flash child node from the binding example.
- Used op->max_freq for spi-mem operations.
- Split low-level CS register handling from the SPI core .set_cs()
  callback.
- Handled SPI_CS_HIGH explicitly for the spi-mem direct CS path.
- Fixed spi-mem opcode transfer to use a u8 buffer.
- Limited spi-mem command opcode length to one byte.
- Forced spi-mem operations to 8-bit word size.
- Avoided driving bidirectional data pins during dummy cycles.
- Drained RX FIFO during TX-only transfers.
- Rejected invalid chip-select numbers instead of mapping them to SS1.
- Rejected unsupported dual/quad full-duplex generic SPI transfers.
- Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  62 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 633 ++++++++++++++++++
 4 files changed, 706 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1


