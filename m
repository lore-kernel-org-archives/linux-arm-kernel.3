Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD0606D834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fIvKORtt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rRn/ijYe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O8RkL6vjgz7s3PYbOIeBih+CTzkMDKhpUQb62pbipoc=; b=fIvKORttl50j3Y
	7cE05AeZaVp/joNeLhoFpDMSzKrQWsfDqQGdtbPL4zDv/P7s2eZrQwd/wvB1OQJ48An6ZvFQ5FRsq
	S549aJ63NI255LTWMSbSgcTStOqXaF7MeYBxFvrrTHitOedZZBtoCdUPdnr4kuCIbbyQbHSBobyKB
	6hKmYv3fH5YrkPV703nBRCidJ5X3eedUpWJG8Y85Ey5dCVW1i4vUJwqsjcYkS5U5A2Sf3RfLyIKUZ
	diuLp+ZxYSaroGH0cpin83B5Z8WpzVj082HFAf4m5zDz4AOfpWwsu0jR+AFjkzDAtxz/X+Lid7e1A
	iP/zV9dN4cYpsRYqHFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeW-0000000CFOv-05KZ;
	Fri, 06 Nov 2026 12:02:40 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeT-0000000CFMy-2mVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:02:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yNefybntTG1L/O8byYfqw9hjpQSNkaHxLxwAmXPvo5I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966555; v=1; x=1794571355;
 b=rRn/ijYeof31L17BBvUIqQ9rbsyPv42zcI1vz8cUu7CveTCLbsnCVzkUy/OM2OGxBYGlcl1s
 94jDEKAKDK6fxwuTz86sjZ5vngbBnNSGKvN/iFitbMbRakivL6+fbxF3iwW8Sf1tCfTRITu+FWY
 JmrTiEy8DPVJI3vHAcTg3cQg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4c246dde72db0327;
	Fri, 06 Nov 2026 12:02:35 +0000
X-Mizu-Trace-ID: 4c246dde72db0327
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	lpieralisi@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	tabba@google.com
Subject: [PATCH 2/3] irqchip/gic-v3-its: Order table zeroing before the GIC can see it
Date: Fri,  6 Nov 2026 12:02:20 +0000
Message-ID: <20261106120221.347309-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040237_846003_856EEE9B 
X-CRM114-Status: GOOD (  12.81  )
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

The ITS driver allocates the GIC's tables as zeroed pages. It exposes
the ITS tables and the vPE tables with a single store: a relaxed
GITS_BASER or GICR_VPROPBASER write with Valid set, the relaxed
GITS_CTLR write that enables the ITS, or a valid level-1 entry for a
level-2 page. However, on a coherent table the zeroing isn't ordered
before that store, so the GIC can read the page's previous contents as
table entries (UNPREDICTABLE: IHI 0069H.b 5.2.1, and GICR_VPROPBASER.Z
in 12.11). A level-2 page is published at runtime, while the GIC may be
walking the same level-1 table for other IDs.

Add a dma_wmb() at the end of its_alloc_pages_node(). It orders the
zeroing before later stores to memory and to MMIO alike.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    herd7 -model aarch64.cat, the ITS modelled as an observer PE that
    reads a published entry (e), then through it the zeroed page (p):
    with no barrier the stale read is Sometimes, with dma_wmb()'s
    DMB OSHST it is Never.
    
    AArch64 MP+dmb.st+addr-its-l1
    {
    0:X0=p; 0:X1=e; 0:X2=0; 0:X3=1;
    1:X1=e; 1:X0=p;
    p=1;
    }
     P0          | P1                ;
     STR X2,[X0] | LDR X4,[X1]       ;
     DMB OSHST   |                   ;
     STR X3,[X1] | EOR X5,X4,X4      ;
                 | LDR X6,[X0,X5]    ;
    exists (1:X4=1 /\ 1:X6=1)
    
    The model puts both PEs in one Inner Shareable domain, so it does
    not separate ISH from OSH. OSH reaches the GIC whichever domain it
    is in: DDI0487 B2.10.1.1 says Outer Shareable "applies across both
    the Inner Shareable and the Outer Shareable shareability domains".
    
    The register publishes (GITS_BASER, GITS_CTLR, GICR_VPROPBASER) are
    the writel() case: the same DMB OSHST ahead of a Device write.

 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index de1f1b1f26623..badc3843d90ca 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -234,6 +234,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	/* Order the zeroing before any store that exposes the page to the GIC */
+	dma_wmb();
+
 	return page;
 }
 
-- 
2.47.3


