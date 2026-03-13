Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CB7105F78E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJqFW988APya2BfrfV64ztygfjxD6dT0CMZ37m57AJY=; b=N52TE39uovqIugy4Kf/KN8pZ2W
	5N1WVNWSHYYwD6KT9GH0owrtoE7UaBk+QwDOa5oMuwvuJnecunITjhrLHLQbDF3XwMlGLnnnm/Svf
	QR3lMfum+wNfGcUsedHvWfWXzvHWhtXULCQuic2+ty0S7ubKBQG+25LgexUMWVw7EgvQJUbMwbStI
	B+TWNdJi76A/ykhYlFcmOjSa9tbfY39LtzRVJ1E5kLQ76IuFGfRRDLb0Q2Xk6fb8bXDa6bP00AVz2
	bwTbtrQTSVr7r110uGkYJjFoch5QCI0kpmVLb6pTklE5DYSgpF3sabVFdwZLyD2juQZblEb6B1iEq
	nYGTRU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRZ-0000000HTk5-1wbb;
	Fri, 13 Mar 2026 10:08:33 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRS-0000000HTbv-3EJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:27 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:07:41 +0800
Subject: [PATCH 6/7] soc: aspeed: Add sysfs controls for flash backend
 selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-upstream_espi-v1-6-9504428e1f43@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=6770;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=78sBqzD/xgUaZNF42FudqCrohUeibR7beHp9FUjNNAs=;
 b=QGkIR8fhoTHKqHX7qiGYNnqJAwkWw+OA6BoXb4376Fz9jYQGG7DV9cJp65M1QyLvL9AJD+q8M
 11B5HHphtSQDoNhDjDx6Jkwl5ne3yiNzTyotfRqUcwsySxms7ps06WA
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030826_817269_9DA8B250 
X-CRM114-Status: GOOD (  14.06  )
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

add following attributes to select backend storage for eSPI TAFS LUN
interface:
- flash_lun_path: specify path of backend storage for eSPI TAFS to share
  with host.
- flash_lun_readonly: set flash LUN to read-only or read-write mode to
  block host write operations.
- flash_lun_enable: open storage according to flash_lun_path as file for
  eSPI TAFS access.

Example usage:
- Select /dev/mtdblock8 as backend storage for eSPI TAFS LUN interface
  echo /dev/mtdblock8 > \
    /sys/bus/platform/devices/1e6ee000.espi/flash_lun_path
- Set LUN to read-only mode to block host write operations
  echo 1 > /sys/bus/platform/devices/1e6ee000.espi/flash_lun_readonly
- Enable flash LUN for eSPI TAFS access
  echo 1 > /sys/bus/platform/devices/1e6ee000.espi/flash_lun_enable

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
 drivers/soc/aspeed/espi/aspeed-espi.c | 218 ++++++++++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/drivers/soc/aspeed/espi/aspeed-espi.c b/drivers/soc/aspeed/espi/aspeed-espi.c
index 7d58c78ed397..2c8f9641174d 100644
--- a/drivers/soc/aspeed/espi/aspeed-espi.c
+++ b/drivers/soc/aspeed/espi/aspeed-espi.c
@@ -12,12 +12,224 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/kstrtox.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 #include "aspeed-espi.h"
 #include "aspeed-espi-comm.h"
 #include "ast2600-espi.h"
 #include "espi_storage.h"
 
+static ssize_t flash_lun_path_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	ssize_t rc;
+
+	espi = dev_get_drvdata(dev);
+
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	mutex_lock(&flash->lun_mtx);
+	rc = scnprintf(buf, PAGE_SIZE, "%s\n", flash->lun_path);
+	mutex_unlock(&flash->lun_mtx);
+
+	return rc;
+}
+
+static ssize_t flash_lun_path_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	char tmp[ASPEED_ESPI_LUN_PATH_MAX];
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	size_t len;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	len = strnlen(buf, count);
+	if (len && buf[len - 1] == '\n')
+		len--;
+
+	if (len >= sizeof(tmp))
+		return -ENAMETOOLONG;
+
+	memcpy(tmp, buf, len);
+	tmp[len] = '\0';
+
+	mutex_lock(&flash->lun_mtx);
+	if (flash->lun && flash->lun->filp) {
+		mutex_unlock(&flash->lun_mtx);
+		return -EBUSY;
+	}
+
+	strscpy(flash->lun_path, tmp, sizeof(flash->lun_path));
+	dev_info(dev, "flash lun path set to %s\n", flash->lun_path);
+	mutex_unlock(&flash->lun_mtx);
+
+	return count;
+}
+
+static ssize_t flash_lun_readonly_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	ssize_t rc;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	mutex_lock(&flash->lun_mtx);
+	rc = scnprintf(buf, PAGE_SIZE, "%u\n", flash->lun_ro);
+	mutex_unlock(&flash->lun_mtx);
+
+	return rc;
+}
+
+static ssize_t flash_lun_readonly_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	bool ro;
+	int rc;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	rc = kstrtobool(buf, &ro);
+	if (rc)
+		return rc;
+
+	mutex_lock(&flash->lun_mtx);
+	if (flash->lun && flash->lun->filp) {
+		mutex_unlock(&flash->lun_mtx);
+		return -EBUSY;
+	}
+
+	flash->lun_ro = ro;
+	dev_info(dev, "flash lun readonly set to %u\n", flash->lun_ro);
+	mutex_unlock(&flash->lun_mtx);
+
+	return count;
+}
+
+static ssize_t flash_lun_enable_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	bool enabled;
+	ssize_t rc;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	mutex_lock(&flash->lun_mtx);
+	enabled = flash->lun && flash->lun->filp;
+	mutex_unlock(&flash->lun_mtx);
+
+	rc = scnprintf(buf, PAGE_SIZE, "%u\n", enabled);
+	return rc;
+}
+
+static ssize_t flash_lun_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct aspeed_espi_flash *flash;
+	struct aspeed_espi *espi;
+	bool enable;
+	int rc = 0;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	flash = &espi->flash;
+
+	rc = kstrtobool(buf, &enable);
+	if (rc)
+		return rc;
+
+	mutex_lock(&flash->lun_mtx);
+	if (!flash->lun) {
+		flash->lun = devm_kzalloc(dev, sizeof(*flash->lun), GFP_KERNEL);
+		if (!flash->lun) {
+			rc = -ENOMEM;
+			goto out_unlock;
+		}
+	}
+
+	if (enable) {
+		if (flash->lun->filp)
+			goto out_unlock;
+		if (!flash->lun_path[0]) {
+			rc = -EINVAL;
+			goto out_unlock;
+		}
+
+		dev_info(dev, "flash lun enable: path=%s ro=%u\n",
+			 flash->lun_path, flash->lun_ro);
+		mutex_lock(&flash->tx_mtx);
+		rc = aspeed_espi_lun_open(flash->lun, flash->lun_path,
+					  flash->lun_ro, false);
+		mutex_unlock(&flash->tx_mtx);
+	} else {
+		if (!flash->lun->filp)
+			goto out_unlock;
+
+		dev_info(dev, "flash lun disable\n");
+		mutex_lock(&flash->tx_mtx);
+		aspeed_espi_lun_close(flash->lun);
+		mutex_unlock(&flash->tx_mtx);
+	}
+
+out_unlock:
+	mutex_unlock(&flash->lun_mtx);
+	if (rc) {
+		dev_err(dev, "flash lun enable=%u failed: %d\n", enable, rc);
+		return rc;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(flash_lun_path);
+static DEVICE_ATTR_RW(flash_lun_readonly);
+static DEVICE_ATTR_RW(flash_lun_enable);
+
+static struct attribute *aspeed_espi_flash_attrs[] = {
+	&dev_attr_flash_lun_path.attr,
+	&dev_attr_flash_lun_readonly.attr,
+	&dev_attr_flash_lun_enable.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_espi_flash_attr_group = {
+	.attrs = aspeed_espi_flash_attrs,
+};
 
 struct aspeed_espi_ops {
 	void (*espi_pre_init)(struct aspeed_espi *espi);
@@ -336,6 +548,12 @@ static int aspeed_espi_probe(struct platform_device *pdev)
 		goto err_remove_perif;
 	}
 
+	rc = devm_device_add_group(dev, &aspeed_espi_flash_attr_group);
+	if (rc) {
+		dev_err(dev, "cannot add flash LUN sysfs group, rc=%d\n", rc);
+		goto err_remove_flash;
+	}
+
 	rc = devm_request_irq(dev, espi->irq, espi->ops->espi_isr, 0,
 			      dev_name(dev), espi);
 	if (rc) {

-- 
2.34.1


