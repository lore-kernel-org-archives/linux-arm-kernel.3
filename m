Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BA4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKrCfY1VHLhMvkhcd76jeSHgip0JtyyrN3VT+vcLICs=; b=XFdxP+jL6i/EQmXYwccQrDXSId
	WGobhQD3bQaQuO8yfZb8MTjckMdTpDE6DmRyFwx3KJcA5DNAoYfg+5sj4gE7kmO+gW6drqpWPMkT5
	IvjbDGYNByM4Ji6KbR5A0oHuFU5FA8DUEZD9qv/2PMrDao881wsxgtiLZPJ6g0+kBuOvV7O0up2E6
	YQvMLAgsgKKSHUF4w2CrkP4jA2/FivV2Xn6f1GxwDdkADPEXZpZ/XObbrfq9iX4G+ukS3CXQFThnx
	z86J3Zi21fzbY/X54R+d5J0vnr2u2KU7fYHOTCsa2AMXOvXfh4UDZv1QuofZLro4bw6AikSGSBKSM
	p87R9D8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDa-00000006VNd-0rTd;
	Sat, 11 Jul 2026 11:50:02 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDX-00000006VMj-2uyi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:50:00 +0000
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso1686360a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770598; x=1784375398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKrCfY1VHLhMvkhcd76jeSHgip0JtyyrN3VT+vcLICs=;
        b=CVMpZFDsrTr6U84K1WNia4Fq684Z9TP/NnmdhvMd//D7r9XtAU85EYw5imfB7wQSCb
         pchAsiaBOV3Fu0+L5qKB8uJ+msk/mIt2zO3FII8AtuQYGLuXvYqvDZm7umlbfrfRqCo2
         lmKNMtEptvM1sGR+NKI0pInXKBKfsCCtO1RHgummUvQg2rw6l3LEJf+z6/3THVN5xKr6
         i2XKOdLdHksABfYw/RdEOMmesmwEZ8ha43T5//QiWNoKrquWWqWmLSf96ullTit1oiXF
         XDAcEt3LbfcvLBlXHqvZAYjYdkjGm0/mlNK7mSIIub0ppoBzuJjsDhYyzqJFy69u77RU
         6H4w==
X-Forwarded-Encrypted: i=1; AHgh+RrzBK37mcF2Tf5JRQS8p20bmRnLbfAXmuL4V1J0fhYg3Upboq/S71CLVLPWgFjWiJvmmYD/UqCmcbJm2xSzbg+y@lists.infradead.org
X-Gm-Message-State: AOJu0YwHmEYDgUj32FUzARITnWWOV3+oLEwfq6b8HmGON8/rfJWSzcEC
	Rg22vR5JqfkqRP1Bm0mAXWdKVh0MEEPxIZqxvfuBTHIcrl9JsAsBb1s=
X-Gm-Gg: AfdE7cncl+F9Ae93n9V7CD/yubuzDAUnt8TD4CX1ZsyCICXttXqWNWfjnFZRY9sMAq1
	UpjE7YAraKzTcJEmTFjGmtg+z7Rcu5GPLMXhEwPBWhPeBKagL/7mJgSX1ipurMypkCCQRR6UfiL
	p3F3kywL59gnOn8swYlqYdOAwMuMus5ZyrgZUqPpwYpPm9VcMq74ytXkyTOHs2213wN8Xi2eP+T
	9tKglTBYIhj6AcTxK2v4EG+nAqjcWVmHV852GUV0Vmu2ZxI9PCQDnM6cZ4IWGVD9SBJx/9CVAPw
	wvVTK3Phr0j2n9yHbQLk8pOuz0gcFiddOflTFpu2+KP0V1GL1a8FF7Or8bU17EXdy42yxnIEbGn
	Dl1VVKxw8uEUqBr6zN+AKhZrUkbdd7/7bkJsFd7Ivh+aIOiqtuCRF/4lgnPfxJn6cjC12ILjths
	tfYSqZuY3YU3q39f8dsA4jJbWNTMtANGa+5DMVDg+k+Gl4Q3Ot3GQ6rVReKpaeRg14BQP9Wy7/E
	FssNuJfiCibLmrqcUjkyOdrdemzXHawWqp8
X-Received: by 2002:a17:90b:1644:b0:387:e0db:bc2d with SMTP id 98e67ed59e1d1-38dc7ba5a7emr2604450a91.35.1783770598497;
        Sat, 11 Jul 2026 04:49:58 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm3957570a91.1.2026.07.11.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:49:58 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Shih-Yuan Lee <fourdollars@debian.org>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Input/SPI: fixes for MacBook8,1 DMA timeout, UAF, and NULL pointer dereference
Date: Sat, 11 Jul 2026 19:49:34 +0800
Message-Id: <20260711114937.16670-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711055247.5412-1-fourdollars@debian.org>
References: <20260711055247.5412-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_044959_738434_B25E7FBB 
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

Hi Dmitry, Mark, and the linux-input/linux-spi community,

This patch series addresses a long-standing DMA initialization timeout on the 
early 2015 12" MacBook (MacBook8,1) on any boot (including cold boot), as well 
as two pre-existing, high-severity UAF/NULL-pointer bugs in the applespi driver.

Changes in v4:
  - Reverted the runtime `can_dma` callback override from `applespi.c` to avoid 
    architectural layering violation, data races (TOCTOU) with concurrent SPI 
    transfers, and execute-after-free vulnerability upon module unload.
  - Moved the DMI quirk forcing PIO mode for MacBook8,1 to the host PCI glue 
    driver (spi-pxa2xx-pci.c) where LPSS setup occurs.
  - Formatted the DMI match using a structured `pxa2xx_spi_pci_dmi_table` and 
    helper function `pxa2xx_spi_pci_can_dma()`.
  - Added a `force_pio` module parameter in spi-pxa2xx-pci.c to allow other 
    users to manually force PIO mode for debugging.

Changes in v3:
  - Added a `force_pio` module parameter to applespi to allow users to manually 
    disable DMA for SPI transfers.
  - Resolved the execute-after-free vulnerability by unconditionally restoring 
    the original can_dma callback (even if NULL) in the driver remove path.
  - Fixed the probe timing issue by applying the can_dma override at the very 
    beginning of applespi_probe() so that all early initialization transfers 
    safely use PIO mode, and properly restoring it in all probe error paths.
  - Documented the Bugzilla link in the commit message of Patch 1.

Changes in v2:
  - Fixed an unbind/remove execute-after-free vulnerability by storing and 
    restoring the host controller's original can_dma callback in applespi_probe() 
    and applespi_remove().
  - Split the fixes into a 3-patch logical series.

Patch 1 fixes a pre-existing UAF vulnerability in the driver unbind path by 
explicitly calling cancel_work_sync() on the asynchronous registration worker 
work struct before devres frees the driver private data.

Patch 2 fixes a pre-existing race condition in the debugfs interface where 
userspace could open the tp_dim file before the asynchronous worker has 
finished initializing applespi->touchpad_input_dev, leading to a NULL 
pointer dereference. We resolve this using smp_load_acquire() and checking 
for NULL.

Patch 3 introduces a structured DMI quirk and a `force_pio` module parameter 
in spi-pxa2xx-pci.c to disable DMA on MacBook8,1. This forces the controller 
to use the rock-solid PIO mode from the very beginning.

Best regards,
Shih-Yuan Lee

Shih-Yuan Lee (3):
  Input: applespi - cancel pending work on driver remove
  Input: applespi - fix NULL pointer dereference in tp_dim open
  spi: pxa2xx: disable DMA for Apple MacBook8,1

 drivers/input/keyboard/applespi.c | 10 +++++++++-
 drivers/spi/spi-pxa2xx-pci.c      | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.39.5


