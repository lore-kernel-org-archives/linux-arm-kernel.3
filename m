Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DAE9A04F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW93bZ55Q9noPPJwsWjiJPwE2eVOkwSBRs3GyIo3O5s=; b=t714wVra6xUcwJu+Xha2mbr1p7
	+R0BHw7Yd5agSEZXqcv/E8u3kTwbzAiP93oZBNyJN6UO+4BeclxSA9PRCQliTS0CT0CLlRjwC4hYJ
	z8vD/1clkjxCeoK9qKxEcy5UuyEZ/xPjePe4xL5l/3NqTCrarxx0esmyiVyTcl4XHQzVIFhTNFd2y
	EmMhGiHIjptHegpEpeIXIyMAIoqQgxOQoMs02wuxhiYr08Us4rqfLjE75Hhc7DPgLOKfCxAIxlSq7
	6Mn8bjSkba7gesWzbjPZ1GFXYQomHPLmm211kOh7AfeBRV+Namus652jC3ZdFuWwuOZHak0rD+wVM
	CQf1P8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyP-00000009uBW-1i7G;
	Wed, 18 Feb 2026 13:52:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyM-00000009u9H-25PC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A15E6185E;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A584C19424;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422729;
	bh=OzMg1Hi4/8VmDJXStqfMwWgmBNW4HuWjLq4C/QxlQD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QszJY6id0HLRpEvQvHeK74fP0Wape38lmqGan0XqggOUTLKhaVGNpNTk52i1H+92O
	 3J7mpXmG5Di4NLx+UyTXaD6Lpmgo+qUd1RRmykK9mvBTD8GXLROwSoeM3p79UOqQli
	 YT2IO/q0nc2ocVoDzIGr9b008v3D39I+rRWHciP2sH03rBnN3MJIr3l4IcGz4nGrhH
	 1TWLRhxQBbJIKULPX6GYy1nyD9d+f3fwalSOSh2Ub7sjmpnh/RRUu/TPoFyU6gDr4K
	 XNJXrFw92FGpL33R3naGrhfYTURQ7t412s/AmeF8L8ThwbfnL3VIuFz4OoDD6tmTO+
	 Tpug0WeC5V4YQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyJ-0000000Bu02-1u1c;
	Wed, 18 Feb 2026 13:52:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] fsl_mc: Switch over to per-device platform MSI
Date: Wed, 18 Feb 2026 13:52:01 +0000
Message-ID: <20260218135203.2267907-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Obtain the msi-parent irqdomain instead of the fsl_mc domain,
which magically engages the per-device infrastructure.

Additionally, simplify the overly complicated error handling.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/dprc-driver.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-driver.c
index c63a7e688db6a..8ee5fb3c2d416 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -620,9 +620,8 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 {
 	struct device *parent_dev = mc_dev->dev.parent;
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_dev);
-	struct irq_domain *mc_msi_domain;
+	struct irq_domain *mc_msi_domain = NULL;
 	bool mc_io_created = false;
-	bool msi_domain_set = false;
 	bool uapi_created = false;
 	u16 major_ver, minor_ver;
 	size_t region_size;
@@ -663,14 +662,12 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 		uapi_created = true;
 	}
 
-	mc_msi_domain = fsl_mc_find_msi_domain(&mc_dev->dev);
-	if (!mc_msi_domain) {
+	mc_msi_domain = fsl_mc_get_msi_parent(&mc_dev->dev);
+	if (!mc_msi_domain)
 		dev_warn(&mc_dev->dev,
 			 "WARNING: MC bus without interrupt support\n");
-	} else {
+	else
 		dev_set_msi_domain(&mc_dev->dev, mc_msi_domain);
-		msi_domain_set = true;
-	}
 
 	error = dprc_open(mc_dev->mc_io, 0, mc_dev->obj_desc.id,
 			  &mc_dev->mc_handle);
@@ -710,8 +707,7 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 	(void)dprc_close(mc_dev->mc_io, 0, mc_dev->mc_handle);
 
 error_cleanup_msi_domain:
-	if (msi_domain_set)
-		dev_set_msi_domain(&mc_dev->dev, NULL);
+	dev_set_msi_domain(&mc_dev->dev, NULL);
 
 	if (mc_io_created) {
 		fsl_destroy_mc_io(mc_dev->mc_io);
-- 
2.47.3


