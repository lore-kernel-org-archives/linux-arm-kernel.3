Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+mzQ7pZ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sx5qLwyY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2iWpqd+QS7T4MloSrivjtj4sFwlrSEPUjkTDrb1eK64=; b=4+mzQ7pZsVYS7N
	fYImcO7mfbkKe9w9QAs6IpFQttlW87TUT/z7LJ5kOy0tyeBIFVOJLJfMhZVQGJ0XkrxK3uhfc1F7H
	v/7yq4ru6g7ln3xJ5GKeRbzesiwZf3l4LF+1PQceLgfrt+og27UCgIoFQUIR2wwD9AwzfllpYmcyq
	WZhZP7jJgWuq2WCDimVpywnePy7aJFSFtOXhntW/NvcohuQYcrUEUN3VwIa7x8sQ/uoUkPNj5Jglw
	I7Y5kYMSwS7segj31B/x2+qRcVrTQxA+knPYa97XuC9BFJRhirDLIAKTtZY1a/PzQWxA2iNzCNPGt
	OEuWruehO6euHdxxLKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDX-0000000Bh6d-2Dd3;
	Fri, 06 Nov 2026 09:26:39 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDU-0000000Bh52-3Iy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:26:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NCQXkL7nkRFAaY5Ahowq8NQ+CbyBoVtiWI3JXXlAYIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957194; v=1; x=1794561994;
 b=Sx5qLwyYP8NxWYgQK9zl3XPuEr9fkQQ+oQmdO3hCYj41+mNzsJDRY5Kr+BcRhGCUP6zsMIHx
 FYiNduvWtdKnXg8kJqTTZbKqaL1IE/z8p4rimb/rapt7s9d78rhbYoeqXS7RSK0y3OurTd4MJ0i
 nVGkT3vXrhkqgYUSq4/CDQ/o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id efb7fa6828913f60;
	Fri, 06 Nov 2026 09:26:34 +0000
X-Mizu-Trace-ID: efb7fa6828913f60
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
Date: Fri,  6 Nov 2026 09:26:23 +0000
Message-ID: <20261106092625.3977163-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106092625.3977163-1-fuad.tabba@linux.dev>
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012636_981728_CE667B75 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -2.1 (--)
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

Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
dropped the ALIGN() of the ITT address in MAPD, on the premise that the
ITT pool returns 256-byte aligned blocks. However, the pool's minimum
allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
granule is a single byte. An ITT whose size is not a multiple of 256
leaves the next one misaligned, MAPD drops the low bits of its address,
and that device's ITEs land on the previous device's ITT. QEMU's
emulated ITS has 12-byte ITEs, so two devices with 32 vectors each are
enough to hit it.

Create the pool with a granule of ITS_ITT_ALIGN.

Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084f..5613c52adf88e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5849,7 +5849,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 	bool has_v4_1 = false;
 	int err;
 
-	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
+	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
 	if (!itt_pool)
 		return -ENOMEM;
 
-- 
2.47.3


