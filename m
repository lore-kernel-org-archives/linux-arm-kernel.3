Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E92E6F063
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wMhrMczaTdzgw/2Epo64A6mnsiiunjOSoKZrxh5anZM=; b=T8JXVgY9zHrxT1AmegoDRlVUk2
	+CdaAIe+EuBJWqHY08iCmRItggPRZPvM/ZQQulVRFuWJod0TiCDdj88r7ZX2oluv3MoDZIwjDB+Dx
	NCpOccv/YMkpnQiDMJROWcT5IIQ7QSDjgU/VjS0ItdXLNe70Yfq/lL2u5Aio2fd7/H5HPPmpohHk0
	ydGrX9IpHpJI+fYoFcbIm22Zm6lwvYuTyEWzBU3tEsprxCrHu0EOPxFtZ3xC28JCii3LIjyH3R03A
	IrQiv9KcHu2RlzNtrKZKnAqfGKM/RWoA44eX2cPJJwZCRwPetYx54cxqijFsYZl61++wj/TXJ88QP
	XhE+btxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwmS-0000000EeGr-0OH1;
	Tue, 23 Dec 2025 07:26:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwmO-0000000EeGI-2EiH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 07:26:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43569C1AE1A;
	Tue, 23 Dec 2025 07:25:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3455960716;
	Tue, 23 Dec 2025 07:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C0A10AB08CD;
	Tue, 23 Dec 2025 08:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766474756; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wMhrMczaTdzgw/2Epo64A6mnsiiunjOSoKZrxh5anZM=;
	b=Mm7ULY/wGVXC8lzdvFLJBUjxYi5ImbP9zti3LmFFHF6jMWuC356Os15s/ubUvZWtGuqTU4
	/PSYzTOSIKwmTWY1AlGe5x2orL2N2XvE3jDDo+d/HxSp/v6FntCLbnZxk+ZlxXTaWPqW4M
	gjvsD2CSDbd2entK3EqdF567JWx/Ki1SVQpVKiRzg1yU5vXG72yXEMcEkVk65lb/3LC4H3
	gfYagEhJ+pIr5dtoWte/abNO2sXXxOiibhFaXiZ9TdVzl5MtbFtptlGFvLhnNQWA9WRSHa
	it+yftasZINrncpy9Q/fJQeNn+Yv3xO25rAGgZMvskNjXA/8O+XaKcCclPfT7A==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Christophe Leroy <chleroy@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	Roy Pledge <roy.pledge@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
Date: Tue, 23 Dec 2025 08:25:49 +0100
Message-ID: <20251223072549.397625-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_232600_927443_0BDFEE48 
X-CRM114-Status: GOOD (  15.68  )
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

When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
fq_table[fq->idx] state and freeing/allocating from the pool and
WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.

Indeed, we can have:
         Thread A                             Thread B
    qman_destroy_fq()                    qman_create_fq()
      qman_release_fqid()
        qman_shutdown_fq()
        gen_pool_free()
           -- At this point, the fqid is available again --
                                           qman_alloc_fqid()
           -- so, we can get the just-freed fqid in thread B --
                                           fq->fqid = fqid;
                                           fq->idx = fqid * 2;
                                           WARN_ON(fq_table[fq->idx]);
                                           fq_table[fq->idx] = fq;
     fq_table[fq->idx] = NULL;

And adding some logs between qman_release_fqid() and
fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.

To prevent that, ensure that fq_table[fq->idx] is set to NULL before
gen_pool_free() is called by using smp_wmb().

Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

NB: I'm not 100% sure of the need of a barrier here, since even without
it, the WARN_ON() wasn't triggered any more.

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 6b392b3ad4b1..39a3e7aab6ff 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
 
 void qman_destroy_fq(struct qman_fq *fq)
 {
+	int leaked;
+
 	/*
 	 * We don't need to lock the FQ as it is a pre-condition that the FQ be
 	 * quiesced. Instead, run some checks.
@@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
 	switch (fq->state) {
 	case qman_fq_state_parked:
 	case qman_fq_state_oos:
-		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
-			qman_release_fqid(fq->fqid);
+		/*
+		 * There's a race condition here on releasing the fqid,
+		 * setting the fq_table to NULL, and freeing the fqid.
+		 * To prevent it, this order should be respected:
+		 */
+		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
+			leaked = qman_shutdown_fq(fq->fqid);
+			if (leaked)
+				pr_debug("FQID %d leaked\n", fq->fqid);
+		}
 
 		DPAA_ASSERT(fq_table[fq->idx]);
 		fq_table[fq->idx] = NULL;
+
+		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
+			/*
+			 * fq_table[fq->idx] should be set to null before
+			 * freeing fq->fqid otherwise it could by allocated by
+			 * qman_alloc_fqid() while still being !NULL
+			 */
+			smp_wmb();
+			gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
+		}
 		return;
 	default:
 		break;

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.47.3


