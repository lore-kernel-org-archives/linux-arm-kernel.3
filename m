Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1150105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx1mMENe34W3h/Dmv8zZwXc2f8onMUqaIFp3OGsPN+o=; b=hkTPC9FRQT/ECXIKniQ9T0oKPM
	4laYK3Fd+n2Z3e8AbSKSToD7Iq9YwkjvKsDAtSzCAdtFQ162IDPf+zBpbhf5RkzXgQoBHgp14OFkt
	xmFDJyN+lmKl8mIi+UQ1wH+9DrQ15QzOyKctlqsevTvKpeJZ9JhBXQxxguPWqU0N0n+cGWZ8RpxZX
	rGKeMwbOKnzXvJVOUm2N69/95WGg5d3mkK06wGMCxPjoR4yTaVY+YO8iMBk0kFZRWylGbis+3/Vlr
	l/zQFd7nZgW4WaPiBJhk04c1ccBxAzBmFSFyaEjBG3xpLPA5pV9L4XZMPIn2QqtWcpi2wUWFiSj7e
	t1w7tD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRY-0000000HTjO-3Qfl;
	Fri, 13 Mar 2026 10:08:32 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRP-0000000HTbv-2NDz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:24 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:07:39 +0800
Subject: [PATCH 4/7] soc: aspeed: Add eSPI TAFS backend support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-upstream_espi-v1-4-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
In-Reply-To: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <maciej.lawniczak@intel.com>, aspeedyh
	<yh_chung@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=9656;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=/gT8PPPSgtivGqhJGfnX1C479G896inIVlPTIjaL2gM=;
 b=pxfbLJ5IQCgYFbhg75xnoNK6S8Q8zbJPNxdm67mqkgFlS/68AfZMbE0wPvAWUgbB5c4zuFNam
 et7tGN1vxpDA2PCTQqswpq2p1woMCldapD6gBYeT15WXSuBwMFvXtvY
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030823_612021_8AB64781 
X-CRM114-Status: GOOD (  18.85  )
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

eSPI Target Attached Flash Sharing (TAFS) refers to sharing the storage
mounted on eSPI devices to host via eSPI Flash Channel.

Add support for TAFS storage handling by creating a storage read/write
interface conceptually like Logical Unit Number (LUN) for driver to
route storage requests to the specified TAFS backend.

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
 drivers/soc/aspeed/espi/espi_storage.c | 322 +++++++++++++++++++++++++++++++++
 drivers/soc/aspeed/espi/espi_storage.h |  32 ++++
 2 files changed, 354 insertions(+)

diff --git a/drivers/soc/aspeed/espi/espi_storage.c b/drivers/soc/aspeed/espi/espi_storage.c
new file mode 100644
index 000000000000..71038e9bdd52
--- /dev/null
+++ b/drivers/soc/aspeed/espi/espi_storage.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * eSPI TAFS back storage interface
+ */
+
+#include <linux/blkdev.h>
+#include <linux/errno.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "espi_storage.h"
+
+/*
+ * aspeed_espi_lun: use an existing block device or file as backend storage for eSPI flash channel.
+ *
+ * Typical path:
+ *   host <-> eSPI bus <-> eSPI slave protocol
+ *        <-> aspeed_espi_lun_*() helpers
+ *        <-> backend block device (e.g., /dev/mmcblk0p3)
+ */
+
+int aspeed_espi_lun_open(struct aspeed_espi_lun *lun, const char *path,
+			 bool initially_ro, bool cdrom)
+{
+	unsigned int blksize, blkbits;
+	loff_t size, num_sectors;
+	struct inode *inode;
+	struct file *filp;
+	int ro;
+	int rc;
+
+	filp = NULL;
+	ro = initially_ro;
+
+	if (!lun || !path) {
+		pr_err("espi_lun_open: invalid args lun=%p path=%p\n", lun,
+		       path);
+		return -EINVAL;
+	}
+
+	pr_info("espi_lun_open: path=%s ro=%d cdrom=%d\n", path, ro, cdrom);
+
+	/* Try R/W first, fallback to R/O if failed */
+	if (!ro) {
+		filp = filp_open(path, O_RDWR | O_LARGEFILE, 0);
+		if (PTR_ERR(filp) == -EROFS || PTR_ERR(filp) == -EACCES) {
+			pr_err("espi_lun_open: open rw failed rc=%ld, back to ro\n",
+			       PTR_ERR(filp));
+			ro = 1;
+		}
+	}
+
+	if (ro) {
+		filp = filp_open(path, O_RDONLY | O_LARGEFILE, 0);
+		if (IS_ERR_OR_NULL(filp)) {
+			rc = filp ? PTR_ERR(filp) : -ENODEV;
+			pr_err("espi_lun_open: open ro failed rc=%d\n", rc);
+			return rc;
+		}
+		pr_info("espi_lun_open: open ro ok filp=%p\n", filp);
+	}
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		ro = 1;
+
+	pr_info("espi_lun_open: filp=%p f_inode=%p f_mode=0x%x\n", filp,
+		filp ? filp->f_inode : NULL, filp ? filp->f_mode : 0);
+
+	inode = filp->f_mapping->host;
+
+	pr_info("espi_lun_open: inode=%p mode=0%o\n", inode,
+		inode ? inode->i_mode : 0);
+	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode)) {
+		rc = -EINVAL;
+		goto out_put;
+	}
+
+	if (!(filp->f_mode & FMODE_CAN_READ)) {
+		rc = -EACCES;
+		goto out_put;
+	}
+	if (!(filp->f_mode & FMODE_CAN_WRITE))
+		ro = true;
+
+	size = i_size_read(inode);
+	if (size < 0) {
+		pr_info("unable to find file size: %s\n", path);
+		rc = (int)size;
+		goto out_put;
+	}
+
+	pr_info("espi_lun_open: size=%lld\n", size);
+
+	if (cdrom) {
+		blksize = 2048;
+		blkbits = 11;
+	} else if (S_ISBLK(inode->i_mode)) {
+		blksize = bdev_logical_block_size(I_BDEV(inode));
+		pr_info("espi_lun_open: blksize=%d\n", blksize);
+		blkbits = blksize_bits(blksize);
+		pr_info("espi_lun_open: bdev=%d\n", blkbits);
+	} else {
+		blksize = 512;
+		blkbits = 9;
+	}
+
+	pr_info("espi_lun_open: blksize=%u blkbits=%u\n", blksize, blkbits);
+	num_sectors = size >> blkbits;
+	if (num_sectors < 1) {
+		pr_info("file too small: %s\n", path);
+		rc = -ETOOSMALL;
+		goto out_put;
+	}
+
+	lun->blksize = blksize;
+	lun->blkbits = blkbits;
+	lun->ro = ro;
+	lun->filp = filp;
+	lun->file_length = size;
+	lun->num_sectors = num_sectors;
+
+	lun->cdrom = cdrom;
+
+	return 0;
+
+out_put:
+	fput(filp);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_open);
+
+void aspeed_espi_lun_close(struct aspeed_espi_lun *lun)
+{
+	if (!lun)
+		return;
+
+	if (lun->filp) {
+		fput(lun->filp);
+		lun->filp = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_close);
+
+int aspeed_espi_lun_rw(struct aspeed_espi_lun *lun, bool write, sector_t sector,
+		       unsigned int nsect, void *buf)
+{
+	ssize_t done;
+	loff_t pos;
+	size_t len;
+
+	if (!lun || !lun->filp || !buf)
+		return -EINVAL;
+
+	if (write && lun->ro)
+		return -EROFS;
+
+	if (sector >= lun->num_sectors || nsect > lun->num_sectors - sector)
+		return -EINVAL;
+
+	pos = (loff_t)sector << lun->blkbits;
+	len = (size_t)nsect << lun->blkbits;
+
+	if (write)
+		done = kernel_write(lun->filp, buf, len, &pos);
+	else
+		done = kernel_read(lun->filp, buf, len, &pos);
+
+	if (done != len)
+		return done < 0 ? (int)done : -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_rw);
+
+int aspeed_espi_lun_read(struct aspeed_espi_lun *lun, sector_t sector,
+			 unsigned int nsect, void *buf)
+{
+	return aspeed_espi_lun_rw(lun, false, sector, nsect, buf);
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_read);
+
+int aspeed_espi_lun_write(struct aspeed_espi_lun *lun, sector_t sector,
+			  unsigned int nsect, void *buf)
+{
+	return aspeed_espi_lun_rw(lun, true, sector, nsect, buf);
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_write);
+
+/*
+ * Byte-granular R/W, for eSPI protocol handler use:
+ *  - addr/len are in bytes, allowing arbitrary unaligned access
+ *  - internally handles sector alignment and RMW
+ */
+int aspeed_espi_lun_rw_bytes(struct aspeed_espi_lun *lun, bool write, u32 addr,
+			     u32 len, u8 *buf)
+{
+	u32 blk_mask;
+	u32 blksize;
+	u8 *bounce;
+	u32 done;
+	int rc;
+
+	done = 0;
+	rc = 0;
+
+	if (!lun || !lun->filp || !buf)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	if (write && lun->ro)
+		return -EROFS;
+
+	blksize = lun->blksize;
+	blk_mask = blksize - 1;
+
+	bounce = kmalloc(blksize, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	while (done < len) {
+		u32 cur_addr = addr + done;
+		u32 off_in_blk = cur_addr & blk_mask;
+		sector_t sector = cur_addr >> lun->blkbits;
+		u32 bytes_this;
+		u8 *p = buf + done;
+
+		/* Process up to the end of this sector */
+		bytes_this = blksize - off_in_blk;
+		if (bytes_this > (len - done))
+			bytes_this = len - done;
+
+		if (!off_in_blk && bytes_this == blksize) {
+			/* Fully aligned sector, use sector API directly */
+			if (write)
+				rc = aspeed_espi_lun_write(lun, sector, 1, p);
+			else
+				rc = aspeed_espi_lun_read(lun, sector, 1, p);
+		} else {
+			/* partial sector: read one sector first, then overwrite/extract part */
+			rc = aspeed_espi_lun_read(lun, sector, 1, bounce);
+			if (rc)
+				break;
+
+			if (write) {
+				memcpy(bounce + off_in_blk, p, bytes_this);
+				rc = aspeed_espi_lun_write(lun, sector, 1,
+							   bounce);
+			} else {
+				memcpy(p, bounce + off_in_blk, bytes_this);
+			}
+		}
+
+		if (rc)
+			break;
+
+		done += bytes_this;
+	}
+
+	kfree(bounce);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_rw_bytes);
+
+/*
+ * Erase: specify range in bytes, implemented as writing 0xFF pattern.
+ * For eSPI ERASE command use.
+ */
+int aspeed_espi_lun_erase_bytes(struct aspeed_espi_lun *lun, u32 addr, u32 len)
+{
+	u8 *pattern;
+	u32 chunk;
+	u32 done;
+	int rc;
+
+	done = 0;
+	rc = 0;
+
+	if (!lun || !lun->filp)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	if (lun->ro)
+		return -EROFS;
+
+	chunk = lun->blksize;
+	if (chunk > len)
+		chunk = len;
+
+	pattern = kmalloc(chunk, GFP_KERNEL);
+	if (!pattern)
+		return -ENOMEM;
+
+	while (done < len) {
+		u32 this_len = len - done;
+
+		if (this_len > chunk)
+			this_len = chunk;
+
+		memset(pattern, 0xff, this_len);
+
+		rc = aspeed_espi_lun_rw_bytes(lun, true, addr + done, this_len,
+					      pattern);
+		if (rc)
+			break;
+
+		done += this_len;
+	}
+
+	kfree(pattern);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(aspeed_espi_lun_erase_bytes);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ASPEED eSPI slave storage backend helpers");
+MODULE_AUTHOR("ASPEED");
diff --git a/drivers/soc/aspeed/espi/espi_storage.h b/drivers/soc/aspeed/espi/espi_storage.h
new file mode 100644
index 000000000000..f0711328b03e
--- /dev/null
+++ b/drivers/soc/aspeed/espi/espi_storage.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ASPEED_ESPI_STORAGE_H
+#define ASPEED_ESPI_STORAGE_H
+
+#include <linux/fs.h>
+#include <linux/types.h>
+
+struct aspeed_espi_lun {
+	struct file	*filp;
+	loff_t		 file_length;
+	loff_t		 num_sectors;
+	unsigned int	 blksize;
+	unsigned int	 blkbits;
+	bool		 ro;
+	bool		 cdrom;
+};
+
+int aspeed_espi_lun_open(struct aspeed_espi_lun *lun, const char *path,
+			 bool initially_ro, bool cdrom);
+void aspeed_espi_lun_close(struct aspeed_espi_lun *lun);
+int aspeed_espi_lun_rw(struct aspeed_espi_lun *lun, bool write,
+		       sector_t sector, unsigned int nsect, void *buf);
+int aspeed_espi_lun_read(struct aspeed_espi_lun *lun, sector_t sector,
+			 unsigned int nsect, void *buf);
+int aspeed_espi_lun_write(struct aspeed_espi_lun *lun, sector_t sector,
+			  unsigned int nsect, void *buf);
+int aspeed_espi_lun_rw_bytes(struct aspeed_espi_lun *lun, bool write,
+			     u32 addr, u32 len, u8 *buf);
+int aspeed_espi_lun_erase_bytes(struct aspeed_espi_lun *lun,
+				u32 addr, u32 len);
+
+#endif /* _ASPEED_ESPI_STORAGE_H_ */

-- 
2.34.1


