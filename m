Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C03CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCWWMFDSN/kOWR8DlFD6me9GCJ5creIxlg4thZxsX2U=; b=gldWuaDBEgz4yI11aKY26kOLEo
	/jxrXyvkIH4HjbzpHnYz7Po1pGgnoAfX9eU4NVW6P50RZL6u8GxKUlcHN8cJKuT6BodNY0vfXU3s9
	lpgxZ8+L4JpLBaJ4MKrILgX+llzR6aSjSlQKdV3jjxNi6C7YhlDcxCJDSRztsP5VYDIvDNkX49lvQ
	ERfRQ61rJ3sk9e9AyDq15yeb5I1kcA7eW5XIGzWKqnIMjMczbZLHFxU/LH2WpGtWWALLi6U4fpJoR
	em7OcinS3FchVIt9NdMQLATQGQot35d0382XwrFML2VecPA0iGZlGWf566uhtZgaFXXYs6yej2Upi
	mfN9ZOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7N-00000001J3I-27se;
	Wed, 06 May 2026 15:24:57 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7L-00000001Ix8-0UW6;
	Wed, 06 May 2026 15:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qC
	WWMFDSN/kOWR8DlFD6me9GCJ5creIxlg4thZxsX2U=; b=hllE0yxFT8/hsbJuSi
	2R7v+UgjAVdFGNBZ5Vp9+HdWrR3NGVK2rjNvfG10npkPNWUV1nU7v7Fh406x5nQk
	YjPykxbwcybUus+apz8TalWSYNz8gDgz/tSxlf/8ZfwLCpzYpGohHZtzV23NGo5F
	mHgKLs2cp4Krvtp6/Bgu2LBdo=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S3;
	Wed, 06 May 2026 23:24:10 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
Date: Wed,  6 May 2026 23:23:39 +0800
Message-Id: <20260506152346.166056-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15uw48KF43tFWkXr4kXrb_yoW8Xw45pa
	93CF10kr48XFy3Xws3Ja43WFyYvan3Kay7GrZ7G347KFy7J3W3tF40g3y3Wrnaqrs5Zr13
	Jw15Kw17CF4YkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pif-BAUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBq2Wmn7XRo4wQAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082455_731307_9A62FE8F 
X-CRM114-Status: GOOD (  11.14  )
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

PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
Port supporting Link speeds greater than 5.0 GT/s, software must wait a
minimum of 100 ms after Link training completes before sending any
Configuration Request.

Introduce a static inline helper pcie_wait_after_link_train() that checks
the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses
the existing PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.

This allows multiple host controller drivers to share the same mandatory
delay without duplicating the logic.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a..a8705a2a2d85 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -60,6 +60,19 @@ struct pcie_tlp_log;
  */
 #define PCIE_RESET_CONFIG_WAIT_MS	100
 
+/**
+ * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
+ * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
+ *
+ * Must be called after Link training completes and before the first
+ * Configuration Request is sent.
+ */
+static inline void pcie_wait_after_link_train(int max_link_speed)
+{
+	if (max_link_speed > 2)
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+}
+
 /* Parameters for the waiting for link up routine */
 #define PCIE_LINK_WAIT_MAX_RETRIES	10
 #define PCIE_LINK_WAIT_SLEEP_MS		90
-- 
2.34.1


