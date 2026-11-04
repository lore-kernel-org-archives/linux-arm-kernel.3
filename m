Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B6860A3828
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0uOuWvwQ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nTRRIPr/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qfvio25cdXXS1J1fIZqL5jA3i+NA1ppNqoJBEYXQEA4=; b=0uOuWvwQXZ7awL
	R3gkABMioE+SX8aETt7/Mt9g+z+PsDGutHqWeOp9VoJl1wRE90xZjx586bIIEeWmchZ7O3kUEUpPD
	4YiT/GWGwpWbB4KLddMLmN6+SeNQDpj5XviRCXUPr4SMnX/V7BX+C7nN0Y6vhe+cECPTIJFP7o3az
	W+yWr2QlbPdCHq3w6cndK2AsnAxqNB2BywWPaI2+xSi9ILu2KaN7z48CnJuwXrVxiyKZoluOKiKLn
	8yYVeheTBv5VpeElRWC9GVOBsNdNqYc9AM1L/cgHWTjFtqaXQmZP0NhXRXuP/GMUDTytf5JC5xSUR
	mD7jYK413JdWW+HJJc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf6L-00000006Guh-3cyP;
	Wed, 04 Nov 2026 17:48:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf6A-00000006GgS-3bec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:48:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F1D41BB0;
	Wed,  4 Nov 2026 09:48:31 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098CA3F673;
	Wed,  4 Nov 2026 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814514; bh=Id1g8MWz/JqcFn8xOCbYiIJXp1f20zUGkCEjpJhFp4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nTRRIPr/r432V+L/3ury9XzvpvELtc5YkaMsZ+uy/ruNyJ53xSonfP1ErvFV4gIm5
	 as4/S72BBKQBhxfECSDh/A6HXN9tn7fjTEx5aGE+QpX5tS20pmOk9GxJtBSLTn4Kp6
	 /oBVbxgJhs6l+x5QEaCSgi2556D6b5jDo4fnU3UU=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:02 +0000
Subject: [PATCH v2 08/10] irqchip/gic-v5: Invalidate ITS device cache
 before freeing ITT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-host_gicv5_fixes-v2-8-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094834_958097_8CA90DC7 
X-CRM114-Status: GOOD (  13.09  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A cached device table entry can still reference the ITT after its
memory is freed via kfree(), even if the DTE has been marked as
invalid. Once the memory has been released, it could be reallocated,
and it would be unfortunate for the hardware to interpret this as a
valid ITT.

Invalidate the device cache and wait for completion before freeing the
ITT during device teardown.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 8628de326f28d..4de07bbdc4923 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev)
 {
 	__le64 *dte;
+	int ret;
 
 	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
 
@@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	/* Zero everything - make it clear that this is an invalid entry */
 	its_write_table_entry(its, dte, 0);
 
+	ret = gicv5_its_device_cache_inv(its, its_dev);
 	gicv5_its_free_itt(its_dev);
 
-	return gicv5_its_device_cache_inv(its, its_dev);
+	return ret;
 }
 
 /*

-- 
2.34.1


