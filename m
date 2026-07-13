Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C052C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/6Rgs0pEVXuCQ34qkmx8XbjWDlltbPvKllHS0/Tt4A=; b=PI7fNK4Q5QWFVDwFIAAz/fhwe8
	M5OkLaCQUyLk6QkDbDG/dt9P3h8NDPimsqzh0HKjOoALfzCZPyd3HEOO6u0sWbGyQgufw/3MXjOQ3
	eIF1wvoukdOp9Bv1rrClT+ZcWouxVU5TeQZsittcNvVqi+H8LAV8m3mVWTKSsCRjpav+iSVQCkJqB
	377rCb2K5wLKeD2bXEizez4lTJgRDrB6LxhfNKlQ+kb5nAZbz+SAlGHgu067Da4YjDnmbB85camj9
	sh64JhZtbtHLsBuktnQ4RnB57mhxzSV+AtJo1wUnO1OnWfh2bDWAsCl63wU0ACzs8Yh7L/bQa6sz9
	HfcrRZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pz-00000008CJ8-2kcZ;
	Mon, 13 Jul 2026 06:08:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pr-00000008CGe-2MqD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:08:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1433505b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 23:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922891; x=1784527691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/6Rgs0pEVXuCQ34qkmx8XbjWDlltbPvKllHS0/Tt4A=;
        b=Z7npzmWs12qwJbB4L07L/IKxQmBPV8/71wD/1+bEXyFCV4ui7w48mZx9YXFdFdq6LZ
         5jxZnRXCg18fxZKxeOd6gxyY0fz7qbjEQO7Y84Z+uWFBGfn3zcb3n4aYQYZs4UynR2J/
         /D1nkpTOIjWmUUIvz2cTY4fQ+8k+1Hf1i5mMuqAZqZ7+VPOSwzfd1lPJcxTfcjjY/YdC
         +zCmIJmOVcVZcHqEQTv2oHCZ93169224+uFnTxcZjKZkQT0iTsydVyoRw/PsYwOQRuz0
         TqVSQ13ruTAp1JzrVzceY5MZhWw5VcG8hL1in4gDDW4Zeb20W6366G1to1ZrI0Nwg+vm
         kQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922891; x=1784527691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/6Rgs0pEVXuCQ34qkmx8XbjWDlltbPvKllHS0/Tt4A=;
        b=XSgdld2H7yoqW+v9z0F2KDdEERbYfed4TWYjFW74S2ObHyI5uERLaQdhhYcV5/3D5X
         21XkwhtmBOFeOJC8mk0cfYF+5f6EO35tslHUjWVz+Phi2k06dynh7F4Ihp9v4OsR9hSp
         m/I7J5XXh/AzjE9P729opx0WBbdFdoA0LqKeSGlwZ9i400fDYxbQiv71MNece7ZckpQ0
         99sKQur8vOqD5UGIyGvVzV3mfYYHAzx4uRb3bfbA3y4z5AxCQPW40RU5T3XG69ESI8RU
         Ol0Jt50WbhKrJOaEH1saIcWrDCVAZJdcOWECQMQLt/VMN5mSkuio3c3YeUBKjCjCxuL8
         SLwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxlUVisLsd3I95fLLW987xrv1l8CV/hIHT2WA0MBGywrEKXVUSyaF5GPpjLfH7pvrr2vWY8Oh7DJUOj1l0KrDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw13XPksmIJaJuyL/ba4s5qw797ucj28PKkrPAytA9vCETfI/j3
	72WEThjl/85tLkf9evBpAtd26FK2ESg34F26bKNFr48PpLJMUszq52xM
X-Gm-Gg: AfdE7cl0bPamfsi0PhGlVGmveX5MkwAnk3Acji6yPUio+a52Drf6TZZgldIHtnGB1Em
	0Lb1/dF1hqsFQfCpU7F0lUjPpRWRzw3l4qy/v+Pkr5AVldfIBoPibs7VBOCuLd9vu74c5fgTJvv
	ZJopLPtSKJusEbwg56GHy1a/ThaTmi7r05T+PpYzi8X0IMyv4f5+OlDCB/meggm/yRp1ObPidAZ
	d6eDkHBXt0az/2Md716nRqpSlmOQyVC3q7IpD0EcAl+i5QTkAP3mB83bkasSKxCEZNEKaNRxQ5I
	0XAoLb9Z2tCPckvkWxoc8uF6QjaPB+7pPyC+0rhh6M/gsgbaxXHfBbD339C4PCKjMfDdZcASfVh
	9ADakQQifHvoTL1gY8nmChQxMc1+PnoxnjrpyOKU6AuZuaFVNCMCNcBYxBfr8rAGnMJMSj35Rn9
	ko7u37EvLiEdTO
X-Received: by 2002:a05:6a00:1d90:b0:848:6e2d:2709 with SMTP id d2e1a72fcca58-848898b7899mr6796412b3a.56.1783922890607;
        Sun, 12 Jul 2026 23:08:10 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3c16d1adsm771795b3a.38.2026.07.12.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:08:10 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 2/2] spi: axiado: fix kernel-doc comments
Date: Mon, 13 Jul 2026 06:08:07 +0000
Message-ID: <20260713060807.7-3-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713060807.7-1-bbnpreetsingh@gmail.com>
References: <20260713060807.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230811_604813_2122975B 
X-CRM114-Status: GOOD (  17.96  )
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

Running kernel-doc -Wall on the driver reports 7 warnings, all present
since the driver was added in commit e75a6b00ad79 ("spi: axiado: Add
driver for Axiado SPI DB controller"). Two are in spi-axiado.c and
also show up in W=1 builds of drivers/spi:

  Warning: drivers/spi/spi-axiado.c:226 expecting prototype for
  ax_spi_get_rx_byte(). Prototype was for ax_spi_get_rx_byte_for_irq()
  instead
  Warning: drivers/spi/spi-axiado.c:248 This comment starts with
  '/**', but isn't a kernel-doc comment. Refer to
  Documentation/doc-guide/kernel-doc.rst

The other five are for struct ax_spi in spi-axiado.h, seen when
kernel-doc is invoked on the header directly (headers are not scanned
by the build-time kernel-doc checks):

  Warning: drivers/spi/spi-axiado.h:130 Excess struct member 'rxbuf'
  description in 'ax_spi'
  Warning: drivers/spi/spi-axiado.h:130 Excess struct member 'txbuf'
  description in 'ax_spi'
  Warning: drivers/spi/spi-axiado.h:130 struct member 'clk_rate' not
  described in 'ax_spi'
  Warning: drivers/spi/spi-axiado.h:130 struct member 'rx_buf' not
  described in 'ax_spi'
  Warning: drivers/spi/spi-axiado.h:130 struct member 'tx_buf' not
  described in 'ax_spi'

Fix the three underlying defects:

 - The comment on ax_spi_get_rx_byte_for_irq() carries the name of
   ax_spi_get_rx_byte(), from which it was evidently copied when the
   IRQ variant was split out; fix the function name.

 - The comment on ax_spi_process_rx_and_finalize() is opened with the
   kernel-doc /** marker but has no identifier line; turn it into
   proper kernel-doc (identifier line, @ctlr, Return:) since it
   already describes the behavior and the return value.

 - The struct ax_spi comment documents @txbuf and @rxbuf while the
   members are named tx_buf and rx_buf, and does not document
   clk_rate; fix the member names and describe clk_rate.

No functional change.

Assisted-by: Claude:claude-fable-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/spi/spi-axiado.c | 8 ++++++--
 drivers/spi/spi-axiado.h | 5 +++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index c4bc7a50d6c9..25561aa9f76f 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -213,7 +213,7 @@ static void ax_spi_fill_tx_fifo(struct ax_spi *xspi)
 }
 
 /**
- * ax_spi_get_rx_byte - Gets a byte from the RX FIFO buffer
+ * ax_spi_get_rx_byte_for_irq - Gets a byte from the RX FIFO buffer
  * @xspi: Controller private data (struct ax_spi *)
  *
  * This function handles the logic of extracting bytes from the 32-bit RX FIFO.
@@ -246,9 +246,13 @@ static u8 ax_spi_get_rx_byte_for_irq(struct ax_spi *xspi)
 }
 
 /**
+ * ax_spi_process_rx_and_finalize - Process RX bytes and check for completion
+ * @ctlr:	Pointer to spi_controller structure
+ *
  * Helper function to process received bytes and check for transfer completion.
  * This avoids code duplication and centralizes the completion logic.
- * Returns true if the transfer was finalized.
+ *
+ * Return: true if the transfer was finalized.
  */
 static bool ax_spi_process_rx_and_finalize(struct spi_controller *ctlr)
 {
diff --git a/drivers/spi/spi-axiado.h b/drivers/spi/spi-axiado.h
index 6cf0e5bf5879..d24d31c3a446 100644
--- a/drivers/spi/spi-axiado.h
+++ b/drivers/spi/spi-axiado.h
@@ -98,9 +98,10 @@
  * @regs:					Virtual address of the SPI controller registers
  * @ref_clk:					Pointer to the peripheral clock
  * @pclk:					Pointer to the APB clock
+ * @clk_rate:					Reference clock rate in Hz
  * @speed_hz:					Current SPI bus clock speed in Hz
- * @txbuf:					Pointer	to the TX buffer
- * @rxbuf:					Pointer to the RX buffer
+ * @tx_buf:					Pointer	to the TX buffer
+ * @rx_buf:					Pointer to the RX buffer
  * @tx_bytes:					Number of bytes left to transfer
  * @rx_bytes:					Number of bytes requested
  * @tx_fifo_depth:				Depth of the TX FIFO
-- 
2.43.0


