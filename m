Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F789C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/gVhnU14M/p0ZMwZg/RsV196bE2QM0dbYtkR3fkmAc=; b=v17JDodix2tUyRe09SOwtFSeSs
	DQMsF8trSmu981R5RAQJn+2PR6oOgWSmiBV3p3GO6K9e7RodJOeaygqOdRE8N+DlZ1BLTw1rxwmQj
	0iti5C/ScSlFcxxAWfJv18mtvw5I9Yu0BW7JGHLoW8g7sL1C409zShxgJyqu4f5DJaK5I1tWrbB2g
	xZsXKPnhRNAbz7HhPJGgoDHhZay5f97OG6Fh+LO+eqYGjxnqoHJEJMXe2ew5l4d/CoH8unk2pmVvf
	3Ihuoc4oPlJT206PjzVNmmSRjYkef/7O8a6wkHT/LeaNWVnrXXI9FYUnlABY+P4pPZ0zFERG6EnNE
	x2LOvwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGG2-0000000CFl2-1VZn;
	Tue, 02 Jun 2026 03:57:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGG0-0000000CFkh-0ViN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:57:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so1027952a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780372655; x=1780977455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/gVhnU14M/p0ZMwZg/RsV196bE2QM0dbYtkR3fkmAc=;
        b=FYRKmBrGKm8KyivRVN8oBMvcrx2UHy0/wFS+QS7XcSHx1M/B4ThM2bSiYrPEqLDp82
         oagshqxX241i3WvltoPEbrvm0ALPL0WU1ZISV77FGgrj6wh36Hw4JK+jjpHv1nTwvjtv
         VLu3RmXqE8oDFs7Q0dp5hZwxG/ZPxo3bbLCjyrVo3O7t+RVdbra0VJaD6fEHuscyiGLh
         IsBw3HQ4IVAssSPJtOor7R+konYzOR/MKJxtkwlDpj8kSgB1T/icXoa9dD87cGasf6P2
         RMbjE4qLZvPjm18NtYs+wf7W6+9edm452aMYvphSEfX6mDvPfxo/AQUnLIB2RQ2BPeU5
         XGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372655; x=1780977455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gVhnU14M/p0ZMwZg/RsV196bE2QM0dbYtkR3fkmAc=;
        b=eh6JQdV4x1LKjCfc339gtpR7p1tC0KJkICvgjuZhG+MCgu5y3etUBwvHOOJGLZnp54
         cELNEFYepxnIo4epaX/39Vv+F8aymeLk9MU2HDFABdsY7flLr0lT1tr1J/HQV/ybIaDm
         G9FnF4p2bY3rr3VZ2Tmg7Rk2NM9pA4JnW7AoRuCXsmnRVU5Ff029cYji0xy6SqfJva56
         YPOW+R6dQxIcPNLZVl4X5wdHmOy7Q06BHJwGv/c1PQBE2Y/KK+usYEYXtmQgXtj3H2+0
         rPI29L9/N74UgaZ9RdK7Xxf/PzrPP3de51p/jBAiagBSsvhiQCdUka1yjYz2zILfl08k
         FH8Q==
X-Forwarded-Encrypted: i=1; AFNElJ84ZozXgjqfcJrN0oeQeo6mxDN7ULK8AxAR1ZJqDEtyXF9DxtatunV6aVJ49ndop6C/E26QDZQf9t4IAyHrg5Xz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2spAhovwRlYVTk2t+JX95AvFp6atKBdDLYw4HxVapsimbKQYK
	7qH6IiNcrnzLJ5Gbi63AvjQx/mA50JYhmAhURtYZ7JITzxZqbeYHDXUV
X-Gm-Gg: Acq92OES+UL080lWp85Gikwt7Tq3RwLfN8g+HkkIJtAL2/BTPQF1iDTh3GfitG2XqDv
	mxNiCVtBV5BtnP66IuaROee2aGaCwEMFhTzmAs056pZDY/7CdzeyV4aD+1f64bh7Zi5Fj+4dsZ2
	/pG6fP2IEH79UVRf4X7hnp88mKpmVGmQCes7DjSdJbB/6xGAql0ZSKZ1utaeKoww8FxWfooOPEO
	0jmK4HI3xlaMDSaUpTXhCLzXgUPV2fzE6JyiEAo4/V+rLo0II/s/jo8wjJYsU3SV6bIogxKwJCD
	oWRTaMe8GegpvaolLlQxLFQYARzYYyfYPVXlR2iRB/waBjAZSLFSFiCjAYLmWFWLrlEnVMKftlw
	0300nP2rGeHgNQu5sHJC2WXlJUXzn+pe46YhBgF0E6kMpHvhzKZaHy8R0QztQo9H3rxoSr5jJ2Y
	NK2eAxUPlT+pIR7VhdDNfvRtGc/xr0X+Q/V+trk+Aqz7jER0AEFk7hThsdqaoejwegrngd+WgAJ
	NGQWqQTMHaidatYzsHgO4r9zAWjgtooUOSx+s2c6A5X/g==
X-Received: by 2002:a05:6300:614a:b0:3b4:65ad:b417 with SMTP id adf61e73a8af0-3b465add073mr6923450637.45.1780372655144;
        Mon, 01 Jun 2026 20:57:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b00d64sm11576668b3a.10.2026.06.01.20.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:57:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	chleroy@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Subject: [PATCH] char: xilinx_hwicap: replace in_be32/out_be32 with ioread32be/iowrite32be
Date: Mon,  1 Jun 2026 20:57:17 -0700
Message-ID: <20260602035717.623208-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_205736_173063_A95BEBC2 
X-CRM114-Status: GOOD (  15.32  )
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

Mechanical conversion of the ppc4xx-specific accessors to the generic
portable helpers.

As a result, COMPILE_TEST is added for extra compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/char/Kconfig                     |  2 +-
 drivers/char/xilinx_hwicap/buffer_icap.c | 16 +++++------
 drivers/char/xilinx_hwicap/fifo_icap.c   | 34 +++++++++++-------------
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 9865227af167..b892bcf28af4 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -201,7 +201,7 @@ source "drivers/char/hw_random/Kconfig"
 
 config XILINX_HWICAP
 	tristate "Xilinx HWICAP Support"
-	depends on MICROBLAZE
+	depends on MICROBLAZE || COMPILE_TEST
 	help
 	  This option enables support for Xilinx Internal Configuration
 	  Access Port (ICAP) driver.  The ICAP is used on Xilinx Virtex
diff --git a/drivers/char/xilinx_hwicap/buffer_icap.c b/drivers/char/xilinx_hwicap/buffer_icap.c
index 35981cae1afa..24e73f1502c2 100644
--- a/drivers/char/xilinx_hwicap/buffer_icap.c
+++ b/drivers/char/xilinx_hwicap/buffer_icap.c
@@ -87,7 +87,7 @@
  **/
 u32 buffer_icap_get_status(struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_STATUS_REG_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_STATUS_REG_OFFSET);
 }
 
 /**
@@ -101,7 +101,7 @@ u32 buffer_icap_get_status(struct hwicap_drvdata *drvdata)
 static inline u32 buffer_icap_get_bram(void __iomem *base_address,
 		u32 offset)
 {
-	return in_be32(base_address + (offset << 2));
+	return ioread32be(base_address + (offset << 2));
 }
 
 /**
@@ -114,7 +114,7 @@ static inline u32 buffer_icap_get_bram(void __iomem *base_address,
  **/
 static inline bool buffer_icap_busy(void __iomem *base_address)
 {
-	u32 status = in_be32(base_address + XHI_STATUS_REG_OFFSET);
+	u32 status = ioread32be(base_address + XHI_STATUS_REG_OFFSET);
 	return (status & 1) == XHI_NOT_FINISHED;
 }
 
@@ -129,7 +129,7 @@ static inline bool buffer_icap_busy(void __iomem *base_address)
 static inline void buffer_icap_set_size(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_SIZE_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_SIZE_REG_OFFSET);
 }
 
 /**
@@ -143,7 +143,7 @@ static inline void buffer_icap_set_size(void __iomem *base_address,
 static inline void buffer_icap_set_offset(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_BRAM_OFFSET_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_BRAM_OFFSET_REG_OFFSET);
 }
 
 /**
@@ -159,7 +159,7 @@ static inline void buffer_icap_set_offset(void __iomem *base_address,
 static inline void buffer_icap_set_rnc(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_RNC_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_RNC_REG_OFFSET);
 }
 
 /**
@@ -174,7 +174,7 @@ static inline void buffer_icap_set_rnc(void __iomem *base_address,
 static inline void buffer_icap_set_bram(void __iomem *base_address,
 		u32 offset, u32 data)
 {
-	out_be32(base_address + (offset << 2), data);
+	iowrite32be(data, base_address + (offset << 2));
 }
 
 /**
@@ -255,7 +255,7 @@ static int buffer_icap_device_write(struct hwicap_drvdata *drvdata,
  **/
 void buffer_icap_reset(struct hwicap_drvdata *drvdata)
 {
-    out_be32(drvdata->base_address + XHI_STATUS_REG_OFFSET, 0xFEFE);
+    iowrite32be(0xFEFE, drvdata->base_address + XHI_STATUS_REG_OFFSET);
 }
 
 /**
diff --git a/drivers/char/xilinx_hwicap/fifo_icap.c b/drivers/char/xilinx_hwicap/fifo_icap.c
index 7bd786fa1be8..928ee4ca3012 100644
--- a/drivers/char/xilinx_hwicap/fifo_icap.c
+++ b/drivers/char/xilinx_hwicap/fifo_icap.c
@@ -94,7 +94,7 @@ static inline void fifo_icap_fifo_write(struct hwicap_drvdata *drvdata,
 		u32 data)
 {
 	dev_dbg(drvdata->dev, "fifo_write: %x\n", data);
-	out_be32(drvdata->base_address + XHI_WF_OFFSET, data);
+	iowrite32be(data, drvdata->base_address + XHI_WF_OFFSET);
 }
 
 /**
@@ -107,7 +107,7 @@ static inline void fifo_icap_fifo_write(struct hwicap_drvdata *drvdata,
  **/
 static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
 {
-	u32 data = in_be32(drvdata->base_address + XHI_RF_OFFSET);
+	u32 data = ioread32be(drvdata->base_address + XHI_RF_OFFSET);
 	dev_dbg(drvdata->dev, "fifo_read: %x\n", data);
 	return data;
 }
@@ -120,7 +120,7 @@ static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
 static inline void fifo_icap_set_read_size(struct hwicap_drvdata *drvdata,
 		u32 data)
 {
-	out_be32(drvdata->base_address + XHI_SZ_OFFSET, data);
+	iowrite32be(data, drvdata->base_address + XHI_SZ_OFFSET);
 }
 
 /**
@@ -129,7 +129,7 @@ static inline void fifo_icap_set_read_size(struct hwicap_drvdata *drvdata,
  **/
 static inline void fifo_icap_start_config(struct hwicap_drvdata *drvdata)
 {
-	out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_WRITE_MASK);
+	iowrite32be(XHI_CR_WRITE_MASK, drvdata->base_address + XHI_CR_OFFSET);
 	dev_dbg(drvdata->dev, "configuration started\n");
 }
 
@@ -139,7 +139,7 @@ static inline void fifo_icap_start_config(struct hwicap_drvdata *drvdata)
  **/
 static inline void fifo_icap_start_readback(struct hwicap_drvdata *drvdata)
 {
-	out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_READ_MASK);
+	iowrite32be(XHI_CR_READ_MASK, drvdata->base_address + XHI_CR_OFFSET);
 	dev_dbg(drvdata->dev, "readback started\n");
 }
 
@@ -163,7 +163,7 @@ static inline void fifo_icap_start_readback(struct hwicap_drvdata *drvdata)
  **/
 u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
 {
-	u32 status = in_be32(drvdata->base_address + XHI_SR_OFFSET);
+	u32 status = ioread32be(drvdata->base_address + XHI_SR_OFFSET);
 	dev_dbg(drvdata->dev, "Getting status = %x\n", status);
 	return status;
 }
@@ -177,7 +177,7 @@ u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
  **/
 static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
 {
-	u32 status = in_be32(drvdata->base_address + XHI_SR_OFFSET);
+	u32 status = ioread32be(drvdata->base_address + XHI_SR_OFFSET);
 	return (status & XHI_SR_DONE_MASK) ? 0 : 1;
 }
 
@@ -190,7 +190,7 @@ static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
 static inline u32 fifo_icap_write_fifo_vacancy(
 		struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_WFV_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_WFV_OFFSET);
 }
 
 /**
@@ -202,7 +202,7 @@ static inline u32 fifo_icap_write_fifo_vacancy(
 static inline u32 fifo_icap_read_fifo_occupancy(
 		struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_RFO_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_RFO_OFFSET);
 }
 
 /**
@@ -372,13 +372,11 @@ void fifo_icap_reset(struct hwicap_drvdata *drvdata)
 	 * Reset the device by setting/clearing the RESET bit in the
 	 * Control Register.
 	 */
-	reg_data = in_be32(drvdata->base_address + XHI_CR_OFFSET);
+	reg_data = ioread32be(drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data | XHI_CR_SW_RESET_MASK);
+	iowrite32be(reg_data | XHI_CR_SW_RESET_MASK, drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data & (~XHI_CR_SW_RESET_MASK));
+	iowrite32be(reg_data & (~XHI_CR_SW_RESET_MASK), drvdata->base_address + XHI_CR_OFFSET);
 
 }
 
@@ -393,12 +391,10 @@ void fifo_icap_flush_fifo(struct hwicap_drvdata *drvdata)
 	 * Flush the FIFO by setting/clearing the FIFO Clear bit in the
 	 * Control Register.
 	 */
-	reg_data = in_be32(drvdata->base_address + XHI_CR_OFFSET);
+	reg_data = ioread32be(drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data | XHI_CR_FIFO_CLR_MASK);
+	iowrite32be(reg_data | XHI_CR_FIFO_CLR_MASK, drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data & (~XHI_CR_FIFO_CLR_MASK));
+	iowrite32be(reg_data & (~XHI_CR_FIFO_CLR_MASK), drvdata->base_address + XHI_CR_OFFSET);
 }
 
-- 
2.54.0


