Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B853FC5AC81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 05:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNkdOQcC2ETToC90VfwFI80Jg9M/yh183B14tDW5Vmo=; b=Q/r5jK98bpimo8X5QFkrxYgKdp
	+YsfuSK6dnd2Qd+dzfJw7tRQHCDRSlHoM/9lieR5NXwPIoABV/nYw+BL/apflLkxLJgbMt02u/Dal
	qps5HY/ASvXcw7tucQmJGQmUkgNxBIs0kZqmL2H3lOD9pRIeMN2pzU5c1N3NizBlkqwK5MYSJ1CmO
	1sQss5RZDVzqNoHEA624GKOjt696kywDSPKZq/tDYeINILhDPqBI+arKld+mQXOPDFd5ai0whARYq
	djaMhU0Gx6eKpcHCPKP1UCgL3f/eMCzarGLEZjv0jVF2eVKsjRtbDfoqpfANdUFPeLylNDKVHlAq2
	+GuHTazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDFe-0000000782W-1qYD;
	Fri, 07 Aug 2026 05:36:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDFc-0000000782Q-1U1v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 05:36:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83DA7600B1;
	Fri,  7 Aug 2026 05:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDAA1F000E9;
	Fri,  7 Aug 2026 05:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786080971;
	bh=kNkdOQcC2ETToC90VfwFI80Jg9M/yh183B14tDW5Vmo=;
	h=From:To:Cc:Subject:Date;
	b=JulXg+KG1FRQKQrSmKoNSJIVYeGcDT4ofxR3TE1zp5uJhq56kCSz2Q4PgWpKwnOsk
	 /fpRwRBOlBl5AYNUltHWiAOP/HE7TZGoA39d9s0OTUd6FhoN2iVEz2Ei0a6qdv2oU0
	 /ec5i0k2TGlxOvvefy/5lMMpqy6hrdhdgOYW7E9JVsY7pYV4IlW6FQqYug2cOYitsb
	 g+yA8Ucvlu4lHIWhxx5SVOeWB24xcOPH6vTdse80e8jFUCkPEeCq6zK7fOYBi0Ukot
	 wKHxlcdLh4H+fVXHoqYETlY73apRDs00z9cu1oicMRSx+ZHmrW4PZLd04Vizopev/h
	 VB3T3xOraMOTA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: fsl: qe: Fix sparse warnings in GPIO
Date: Fri,  7 Aug 2026 07:35:52 +0200
Message-ID: <6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5703; i=chleroy@kernel.org; h=from:subject:message-id; bh=1woWX/X91UmwPsG4AqjMQzLoWo4AhbpQz9HxDwH39vY=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSV5u1SfhATN3ultMOUTYX/96r+crp2+PbEGca1/k3Sd 1amlReJdZSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJbLNkZNhmsGmaostPwYxt J1Ysf+naG+zPde0Rq8jetUYfzasmnBFm+MO13Ly/JVfq5F3PG4/7LJ0c7xh+SxIVltuYpnbxsNE KIyYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

A C=2 build on mpc83xx_defconfig provides following warnings:

  drivers/soc/fsl/qe/gpio.c:44:34: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:44:34:    expected restricted __be32 [usertype] cpdata
  drivers/soc/fsl/qe/gpio.c:44:34:    got unsigned int [usertype] cpdata
  drivers/soc/fsl/qe/gpio.c:45:34: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:45:34:    expected restricted __be32 [usertype] cpdir1
  drivers/soc/fsl/qe/gpio.c:45:34:    got unsigned int
  drivers/soc/fsl/qe/gpio.c:46:34: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:46:34:    expected restricted __be32 [usertype] cpdir2
  drivers/soc/fsl/qe/gpio.c:46:34:    got unsigned int
  drivers/soc/fsl/qe/gpio.c:47:34: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:47:34:    expected restricted __be32 [usertype] cppar1
  drivers/soc/fsl/qe/gpio.c:47:34:    got unsigned int
  drivers/soc/fsl/qe/gpio.c:48:34: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:48:34:    expected restricted __be32 [usertype] cppar2
  drivers/soc/fsl/qe/gpio.c:48:34:    got unsigned int
  drivers/soc/fsl/qe/gpio.c:49:33: warning: incorrect type in assignment (different base types)
  drivers/soc/fsl/qe/gpio.c:49:33:    expected restricted __be32 [usertype] cpodr
  drivers/soc/fsl/qe/gpio.c:49:33:    got unsigned int
  drivers/soc/fsl/qe/gpio.c:297:17: warning: restricted __be32 degrades to integer
  drivers/soc/fsl/qe/gpio.c:299:17: warning: restricted __be32 degrades to integer
  drivers/soc/fsl/qe/gpio.c:302:17: warning: restricted __be32 degrades to integer
  drivers/soc/fsl/qe/gpio.c:304:17: warning: restricted __be32 degrades to integer
  drivers/soc/fsl/qe/gpio.c:308:18: warning: restricted __be32 degrades to integer
  drivers/soc/fsl/qe/gpio.c:314:9: warning: restricted __be32 degrades to integer

The problem is the 'struct qe_pio_reg' embedded in 'struct qe_gpio_chip'
to save register values. As the values are read with ioread32be(), they
are now in CPU byte order and can't be stored as-is in a __be32 object.

Replace 'struct qe_pio_reg saved_regs' by individual u32 fields.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608051952.ADkLIB86-lkp@intel.com/
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/gpio.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5cd59cfbf22f..8e210f8a3b6c 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -32,8 +32,13 @@ struct qe_gpio_chip {
 	/* shadowed data register to clear/set bits safely */
 	u32 cpdata;
 
-	/* saved_regs used to restore dedicated functions */
-	struct qe_pio_regs saved_regs;
+	/* saved regs used to restore dedicated functions */
+	u32 saved_cpodr;
+	u32 saved_cpdata;
+	u32 saved_cpdir1;
+	u32 saved_cpdir2;
+	u32 saved_cppar1;
+	u32 saved_cppar2;
 };
 
 static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
@@ -41,12 +46,12 @@ static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
 	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 
 	qe_gc->cpdata = ioread32be(&regs->cpdata);
-	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
-	qe_gc->saved_regs.cpdir1 = ioread32be(&regs->cpdir1);
-	qe_gc->saved_regs.cpdir2 = ioread32be(&regs->cpdir2);
-	qe_gc->saved_regs.cppar1 = ioread32be(&regs->cppar1);
-	qe_gc->saved_regs.cppar2 = ioread32be(&regs->cppar2);
-	qe_gc->saved_regs.cpodr = ioread32be(&regs->cpodr);
+	qe_gc->saved_cpdata = qe_gc->cpdata;
+	qe_gc->saved_cpdir1 = ioread32be(&regs->cpdir1);
+	qe_gc->saved_cpdir2 = ioread32be(&regs->cpdir2);
+	qe_gc->saved_cppar1 = ioread32be(&regs->cppar1);
+	qe_gc->saved_cppar2 = ioread32be(&regs->cppar2);
+	qe_gc->saved_cpodr = ioread32be(&regs->cpodr);
 }
 
 static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
@@ -284,7 +289,6 @@ void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 {
 	struct qe_gpio_chip *qe_gc = qe_pin->controller;
 	struct qe_pio_regs __iomem *regs = qe_gc->regs;
-	struct qe_pio_regs *sregs = &qe_gc->saved_regs;
 	int pin = qe_pin->num;
 	u32 mask1 = 1 << (QE_PIO_PINS - (pin + 1));
 	u32 mask2 = 0x3 << (QE_PIO_PINS - (pin % (QE_PIO_PINS / 2) + 1) * 2);
@@ -294,24 +298,20 @@ void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
 	if (second_reg) {
-		qe_clrsetbits_be32(&regs->cpdir2, mask2,
-				   sregs->cpdir2 & mask2);
-		qe_clrsetbits_be32(&regs->cppar2, mask2,
-				   sregs->cppar2 & mask2);
+		qe_clrsetbits_be32(&regs->cpdir2, mask2, qe_gc->saved_cpdir2 & mask2);
+		qe_clrsetbits_be32(&regs->cppar2, mask2, qe_gc->saved_cppar2 & mask2);
 	} else {
-		qe_clrsetbits_be32(&regs->cpdir1, mask2,
-				   sregs->cpdir1 & mask2);
-		qe_clrsetbits_be32(&regs->cppar1, mask2,
-				   sregs->cppar1 & mask2);
+		qe_clrsetbits_be32(&regs->cpdir1, mask2, qe_gc->saved_cpdir1 & mask2);
+		qe_clrsetbits_be32(&regs->cppar1, mask2, qe_gc->saved_cppar1 & mask2);
 	}
 
-	if (sregs->cpdata & mask1)
+	if (qe_gc->saved_cpdata & mask1)
 		qe_gc->cpdata |= mask1;
 	else
 		qe_gc->cpdata &= ~mask1;
 
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
-	qe_clrsetbits_be32(&regs->cpodr, mask1, sregs->cpodr & mask1);
+	qe_clrsetbits_be32(&regs->cpodr, mask1, qe_gc->saved_cpodr & mask1);
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 }
 EXPORT_SYMBOL(qe_pin_set_dedicated);
-- 
2.54.0


