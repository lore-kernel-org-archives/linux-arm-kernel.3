Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A9606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lo3WAkTY;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j5FoTRMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OCpCPLJE3r6L2HIy1QKUiDL1dFMxS7QTpUCfmL7TFEY=; b=Lo3WAkTYvCdgOy
	ISj1p8s5aHrbgH2Ue/c5+cZxtNiLq14Xkkzgz1k6L+TTTc6Dtk44b3iNNvXBAcu6DKixIoiyJZpL6
	oEDlCsu4KoFqTobiLtBMynW5UBLF9VR7/elCUL1bcO4sgnpVp96C8KIHE3H/op4Dty8h92lF4LahP
	pPq/3vS/mla0wVlgQy/RFiZhEs7howpoMNcb1VUPI5W/XPBsqVj72pTkUu2k029M/2ImwOfYYPI9Z
	41CSNUwvA/KJvsquQTuUl8jYIpYjMw0XXW9D1AjoOFEBx8gVH8WuJe9L0iNgQEREKt5XeKbUO03A6
	ZnyKTRmj1ZcMEuHpvBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDf-0000000BhB1-2yl5;
	Fri, 06 Nov 2026 09:26:47 +0000
Received: from out-247.mta1.migadu.com ([95.215.58.247] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDd-0000000Bh8X-0Pob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:26:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2ux1gTofI8zz3EdkWjLHTNMHqNkCiJdZMae9TBFV5d8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957203; v=1; x=1794562003;
 b=j5FoTRMqWfs8BiZwjp4KBhazjToi5y5m2vbjgvAP0azmQ6fgjQrvt9gObrc5DL7jZy6dO687
 /91eGcqhZ8fuHqPytHunKN7OsdhLv5QL5pNYy31+3e8yS4O/J11o72GqS/thxlvdl6yvCHZDOnj
 d6gNBfXvWxVrFC3E6QLJ6fBk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fc821fc381e2c071;
	Fri, 06 Nov 2026 09:26:43 +0000
X-Mizu-Trace-ID: fc821fc381e2c071
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
Subject: [PATCH 3/3] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Fri,  6 Nov 2026 09:26:25 +0000
Message-ID: <20261106092625.3977163-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106092625.3977163-1-fuad.tabba@linux.dev>
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012645_286318_F29D0A12 
X-CRM114-Status: GOOD (  11.35  )
X-Spam-Score: -2.8 (--)
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5c3ab9d30f6af..bdf7c81e60c76 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -276,7 +276,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3


