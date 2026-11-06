Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F937606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sfVHvICH;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i3/tDBnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NXsN+Nc9LKkQyfTr7a6I9Wtbd+7FU/tueUh4Tb5MxuY=; b=sfVHvICHxKeZbW
	tI4tISnzoPF36eMtH26p447s7AJloo6p73x77vpQWsjhpkKQlo3F98gf8AVh8BQ42ItRoN6vyKQOL
	XUGU29ZJVZ8n+0ZHenxPkxOBZYUQ0VXYZ/jlwSQGu88dtVk8GQfQThzZvyu/c3EbNZN9uSzXmO0ns
	lNF5mZnOdZ+yLTpMYyi5KqWbr5IL90xR0KLMXbBZjFSlC4gjEc01SAfQLo3ipL6jArndOaanibNID
	eDKEi6dlTmyN9C0mkFTtMKb04mcJXGOUX+DMWlzR3X41+gSplWtpjSvRH0JPYbF743NJWMDcS8DcP
	/eZOFKndHFP/L0hEti8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDb-0000000Bh8V-2bOP;
	Fri, 06 Nov 2026 09:26:43 +0000
Received: from out-241.mta1.migadu.com ([95.215.58.241] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGDY-0000000Bh6V-3h9s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:26:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=33+ek2IPCN0Ato3CURA0jrCZQOA/qb2gBvVhEO3MB8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957199; v=1; x=1794561999;
 b=i3/tDBnlGNxNPWwu5rd8XpQQwRAE6Sk3vxGISe//z8j4dZZXbGhBHySVUUJaHrx3LV0T2O6d
 ZLVns5Th1Bb39N3qE9CWneNRCn7oM1XYHHubjuWknV75eH1oMcjnBG3eHfy7AScEB1GFjy9al6P
 TIG0UoRhcI/S3IaMzuEK5gpw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cf7aeb392c53fa65;
	Fri, 06 Nov 2026 09:26:38 +0000
X-Mizu-Trace-ID: cf7aeb392c53fa65
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
Subject: [PATCH 2/3] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Fri,  6 Nov 2026 09:26:24 +0000
Message-ID: <20261106092625.3977163-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106092625.3977163-1-fuad.tabba@linux.dev>
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012641_065923_CADF0C11 
X-CRM114-Status: GOOD (  11.98  )
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. The pages added to the pool are zeroed, but an ITT freed back
to it goes to the next device as the previous one left it. MAPD is then
UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
zeros" (IHI 0069H.b, 5.3.10).

Zero the ITT when it comes from the pool.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5613c52adf88e..5c3ab9d30f6af 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -267,8 +267,10 @@ static void *itt_alloc_pool(int node, int size)
 
 	do {
 		addr = gen_pool_alloc(itt_pool, size);
-		if (addr)
+		if (addr) {
+			memset((void *)addr, 0, size);
 			break;
+		}
 
 		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
 		if (!page)
-- 
2.47.3


