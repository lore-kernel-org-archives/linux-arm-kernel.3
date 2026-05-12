Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E04CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPxmplJASoE7i3DAWTstEUF/mwjYvLDna7DGnqxuUrc=; b=dMmKtFV8SOvcDb+QsqLB/i0LAj
	z+3SN8TUh1yjgD0vxepEoUmpHd6nVhvFG/UDoCffdbjKudthOqwSqHFQQ1JliR8LfJLjQqPmPo2Sm
	/y/RLr+s6DromGqjn4xVUEmiUW68rRGC/bIZwWrnI7P8v7G/S7v13vJj5VrUvSWfvC1Mgkl806mym
	TiIj/tEI9CtYTID8V78cJQB9WrWGq1MjzQv+S5Le7B3zF9DtsMDxIvtzd86mMOopw2+Knq6n6A7PR
	VbK/kRsE/t+4LImRx26IBwRjb+NU737SMf9Hiih45ovqLMPotL14waSpDtRDT2dyFYHwoHkDlQk9e
	zVwlz+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpk-00000000bvn-2yG0;
	Tue, 12 May 2026 22:44:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpi-00000000buP-098o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48e69e60063so5386995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625847; x=1779230647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPxmplJASoE7i3DAWTstEUF/mwjYvLDna7DGnqxuUrc=;
        b=bxRVm5N030iw0Xu8tuxMhZEXRlk8birTqitlLDzG7LSHfbreBq4V5WIBqzRbbji+QU
         rKVWGBBFo2DfQM8EQfit066s7xvGAGw7VpbyJhiu8mZMhAjbmRcYdIaDEHxfjqh/qNxm
         cLyOkjsKiQUV800zBpvo49WotQFeWOuGx/yGGAmAo057f/oYwOt/TdVIoO6XiPTZ1ELH
         pY1rX8TMLStYDsPm4bm3ruIv57OEg6qwskPiC+4AzC2dJ39rZdjrGtQkPFSnB0vQqlnd
         V7Y6GoUX/T8TX0zSrNwEXBJSXWQDJAdytRlJahxbdHFuBda6NNm1s7PSPXZDmGonetJA
         wanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625847; x=1779230647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPxmplJASoE7i3DAWTstEUF/mwjYvLDna7DGnqxuUrc=;
        b=TfUxZdpfDcUGF+SRjQbV8DgjPY3PBui4YAWfebQHFCYDgtI2FUcFu68JjqiQZAUZUk
         lIbqL7Coznp2mjNt+uo54ADYK8uCsbh5jNc+jHRlHBjQ6J6JVZVR1OzNRfm2QZZY9tJc
         FTjGoMdeaBXlzm0Rz5X+WJid8ZkTJe+4mIwrKdDb+Fy32fwXMXYDpzN6WtDsRDwzsAv6
         mFNeXbIMmNs5SVvAWpSF6ZFsCI7s2g1WlbdBmc0iV1sEtsZmjvhY1rM9W20UTOTOSfcE
         coOu0RszYYb7WHpcEdhZTo1AwWu8P4R34gv/8g1FGEvvScDcjeWySqY5fUFuxBZeUrZl
         4iHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Zi6W3w9/Yq3p3FIk18SdT1hMXOCohkYlQJoxCivJkR6JvdeYW8AvETEYTDzVcmov2UBytPW9tP2WsLUObRPAO@lists.infradead.org
X-Gm-Message-State: AOJu0YxabMmLo0bxYdWka79TO9B5/RYrx+6m23IBG4IKdszYaQxFRSeu
	KoyRBs38cOhHlsrHFE8r3LzpnHndLbbuMVx5gNlObm9j7eZYVnzZGgJO
X-Gm-Gg: Acq92OHYaAexQFdYIq3OrMxOvHdH0moe+bOSgnFI989FkqXejoETn2Vxafv3ttqQRpm
	vDxOZKokONEXRcNHw+3T5un1E+1IRxhq9UZAQNJLSsQHOxgECkL4EEgNEyYLwxPp6EjsCkU91j7
	Nvs+mZIgoN0y00Af/xyg0Xx4R92KgATn4ouGZGzAnnfq2/38hjkCqK3fy8ykAQJOlhx2Vu+K0jJ
	LZf5oNTtgdrAe/GyY073Pqpe6puqEoYlqQzEnRsZYvunjz7eiTmvY6PNM6tmrQjsmDOxEz78HDL
	W11vcJQUJxYHkqzJ57fRXjIBXLEVdsVioGZkWhObpcqi/Q114LVIljnL0q0+jLl2irQU9hy/Bol
	UNe4IFeKmTY3Kmjvb07cmw5bvv1jQSbw0p/01UHWOgms4apCTgyxECtJtGecAGzOeCMJgsGIR7z
	A/6a7+oxgj9y6j9gzrusVG3FMDkafK/7/hotDX64r07YacY9Duwc86lBcWwjIneHc=
X-Received: by 2002:a05:600c:c4b7:b0:48a:6848:527 with SMTP id 5b1f17b1804b1-48fc9a4e9f5mr4178665e9.7.1778625847438;
        Tue, 12 May 2026 15:44:07 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:07 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 00/12] crypto: atmel - refactor common i2c support and add SHA256 ahash support
Date: Tue, 12 May 2026 22:43:37 +0000
Message-Id: <20260512224349.64621-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154410_095789_0DF5D30E 
X-CRM114-Status: GOOD (  11.58  )
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

This series restructures the Atmel secure element drivers around a
shared atmel-i2c core and adds SHA256 ahash support for ATSHA204A and
ECC based devices.

The existing drivers duplicated substantial parts of the transport,
RNG, EEPROM and device management logic. This series consolidates the
common functionality into the shared i2c core and converts the client
drivers to capability based allocation.

The series also introduces per-device timing configuration through
match data, moves sanity checks and RNG handling into the core driver,
updates workqueue handling and cleans up internal constants and helper
definitions.

The final patch adds SHA256 ahash support using the hardware SHA engine
provided by the devices.

ATSHA204A devices require software-side SHA256 padding according to
FIPS 180-4, while newer ECC devices provide a dedicated SHA final
command and perform padding internally in hardware.

Supporting the SHA engine also requires changes to the command
transport path. SHA operations must execute as a strict uninterrupted
sequence consisting of SHA INIT, one or more SHA COMPUTE commands and,
for ECC devices, a terminating SHA FINAL command. The device loses its
internal SHA state if it enters sleep mode or if unrelated commands
are interleaved during the transaction.

To satisfy these hardware requirements, the send/receive path is split
into a low-level transfer helper and a higher-level wrapper managing
wakeup, sleep and locking. SHA operations keep the device awake and
hold the i2c lock for the full duration of the hashing transaction.

The series has been tested on ATSHA204A and ATECC508A devices.
Tests are ongoing/pending on ATECC608A and ATECC608B.
---
Lothar Rubusch (12):
  crypto: atmel - introduce shared I2C client management
  crypto: atmel - move capability-based client allocation into i2c core
  crypto: atmel - remove obsolete CONFIG_OF guard
  crypto: atmel - add per-device timing and match-data driven
    configuration
  crypto: atmel - move RNG support into common i2c core
  crypto: atmel - move EEPROM access support into common i2c core
  crypto: atmel - expose CONFIG zone through sysfs
  crypto: atmel - move device sanity check to core driver
  crypto: atmel - check client data in remove callbacks
  crypto: atmel - update workqueue flags and add flush on exit
  crypto: atmel - refactor and localize driver constants
  crypto: atmel - add SHA256 ahash support

 drivers/crypto/atmel-ecc.c     | 252 +++++++-----
 drivers/crypto/atmel-i2c.c     | 679 +++++++++++++++++++++++++++++----
 drivers/crypto/atmel-i2c.h     | 180 +++++----
 drivers/crypto/atmel-sha204a.c | 284 +++++++-------
 4 files changed, 1010 insertions(+), 385 deletions(-)

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

base-commit: f7dd32c5179d7755de18e21d5674b08f9e5cb180
-- 
2.53.0


