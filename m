Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296F2C36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Zcknjsg98vVf6dTb1ZsO8CFc3N2naS1xrzqUpUsa2w=; b=h0jGMjO3nNIQ0TxRpweulb79op
	Uo7uDYACub1ixsqBxusckEyikwhyB5IiBfJ+Uu4V2xNUrM4Xkeyqvhl4J2n8/s/BUIgaV9utQNkvk
	zVE03Ey+Ii1li0Wvs0lbmhpfkub8Fl3HS6ambXfSNDy+EYNAx8jQpItAsCaTf5Y1SmE/oDElkWYqY
	vyX82C3Ttip1ZBDJNOzR4q0G3BCan16pJBJpeRTLt+4xJTHQ8dJqFxaUILtKHxbxj+wmvmC8uWC4a
	kmRigPS4j6584exng7onqz2/exrZU+FfdNcyRdC+DluVTudZESCig+s2DC4ZKrxLfS30IOoJRcTHs
	56pC1JMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBHw-0000000Di8o-0ENl;
	Fri, 28 Mar 2025 15:06:28 +0000
Received: from out-16.pe-a.jellyfish.systems ([198.54.127.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAZh-0000000DZqB-0gqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 14:20:46 +0000
Received: from prod-lbout-phx.jellyfish.systems (new-01-3.privateemail.com [66.29.159.56])
	by pe-a.jellyfish.systems (Postfix) with ESMTPA id 4ZPN3b5FRYz4wb6;
	Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
Received: from MTA-10-1.privateemail.com (unknown [10.50.14.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 4ZPN3b4M3hz2Sd0W;
	Fri, 28 Mar 2025 10:20:43 -0400 (EDT)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
	by mta-10.privateemail.com (Postfix) with ESMTP id 4ZPN3b2cFrz3hhVG;
	Fri, 28 Mar 2025 10:20:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=framepointer.org;
	s=default; t=1743171643;
	bh=hFqHqKV+KeZawAy1aS1MAjdhzYhHV8EspKvPassTmhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mIOVfjN5eG8XbGFfWVIZgnAcnec3Vh+Fy84/9xQnW7U+BLy/ywNpN6suyLAqyX8BA
	 2YxQ5ykvFOa/zLWYgT4Hz522N6l0nPUU1R6G/+j4HoXI/F7fdMwAbCv5FyTHpOjcs+
	 ArRLxZirG3Rdb1lhjqtG2Y3vpoVugxpSVFbvA0hoO5bonMbHLH/KAYDg8aTuR1Ad8K
	 Wb4qa474SoBQAQ6Z5rW9wjliQJy94u8aawIQwWuVrudNgxLXj/ZZ0uhZchv4zH8fMh
	 0e2KRZXlFsQByva9qAsoKYiz6kPBGyVJEc1r0uLHg+55YVfcYUsy/TZBSl5BKVi+HD
	 PCULFNVCLJUOg==
Received: from 65YTFL3.secure.tethers.com (unknown [152.44.190.141])
	by mta-10.privateemail.com (Postfix) with ESMTPA;
	Fri, 28 Mar 2025 10:20:26 -0400 (EDT)
From: Sam Winchenbach <sam.winchenbach@framepointer.org>
To: linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	hao.wu@intel.com,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michal.simek@amd.com,
	linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sam.winchenbach@framepointer.org,
	Sam Winchenbach <swinchenbach@arka.org>
Subject: [PATCH 2/2] fpga: zynq-fpga: Allow ICAP enable on probe
Date: Fri, 28 Mar 2025 10:19:44 -0400
Message-ID: <20250328141944.119504-2-sam.winchenbach@framepointer.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
References: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072045_223746_BC04C1FA 
X-CRM114-Status: GOOD (  14.87  )
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

From: Sam Winchenbach <swinchenbach@arka.org>

Adds an option to enable the ICAP interface when driver is probed. This
is useful when the fabric is loaded as part of the first or second stage
of the boot process and contains an IP core that requires access to the
ICAP interface, such as Soft Error Mitigation (SEM) core.

Signed-off-by: Sam Winchenbach <swinchenbach@arka.org>
---
 drivers/fpga/zynq-fpga.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/zynq-fpga.c b/drivers/fpga/zynq-fpga.c
index f7e08f7ea9ef3..4a53a429d659f 100644
--- a/drivers/fpga/zynq-fpga.c
+++ b/drivers/fpga/zynq-fpga.c
@@ -20,6 +20,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/string.h>
 #include <linux/scatterlist.h>
@@ -482,8 +483,7 @@ static int zynq_fpga_ops_write(struct fpga_manager *mgr, struct sg_table *sgt)
 	return err;
 }
 
-static int zynq_fpga_ops_write_complete(struct fpga_manager *mgr,
-					struct fpga_image_info *info)
+static int zynq_fpga_enable_icap(struct fpga_manager *mgr)
 {
 	struct zynq_fpga_priv *priv = mgr->priv;
 	int err;
@@ -504,6 +504,18 @@ static int zynq_fpga_ops_write_complete(struct fpga_manager *mgr,
 
 	clk_disable(priv->clk);
 
+	return err;
+}
+
+static int zynq_fpga_ops_write_complete(struct fpga_manager *mgr,
+					struct fpga_image_info *info)
+{
+	struct zynq_fpga_priv *priv = mgr->priv;
+	int err;
+	u32 intr_status;
+
+	err = zynq_fpga_enable_icap(mgr);
+
 	if (err)
 		return err;
 
@@ -615,6 +627,16 @@ static int zynq_fpga_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mgr);
 
+	if (device_property_read_bool(dev, "enable-icap-on-load")) {
+		err = zynq_fpga_enable_icap(mgr);
+		if (err) {
+			dev_err(dev, "unable to enable ICAP interface\n");
+			fpga_mgr_unregister(mgr);
+			clk_unprepare(priv->clk);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.49.0


