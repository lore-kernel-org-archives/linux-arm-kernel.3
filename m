Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D9A606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKwoqK/z;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TjAx56T7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L806xsiGlwO13TAwrjN8i31kZe6YvPSlLcIj0vmc54w=; b=kKwoqK/zyeE1OA
	wo5j62WT+FseweTC4fRcQWZzTsb2/y779DwCXquSbfB1Difj7XoBwFLcaBdO2aDb0NzleU2FLyugm
	MYYV9FMNg88zyz/2SbgDNuk7Y2SLRneS4tLCSOmlXiKJtdSn0C5aaq9kReWLIoeBDrSaJd/dHtn02
	w3Wss2vdNP5Ta5mPyI7tS5ii/Ujd4EKnlBW8x9GSLE/aOIO6yLgmM0O8hFGq4d29eg3Y5nOfngQ/q
	k1ZWV5Khix/V4J68LI1nRUmWlEu4fG1hvsrvk1vZc5YZp0h6Blyu3zm6mtoeSestk+w+uCftPeEOa
	PYkK5JMRkzcA1jm25Rvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg6-0000000GXwm-1N8N;
	Mon, 02 Nov 2026 13:02:22 +0000
Received: from out-92.mta0.migadu.com ([2001:41d0:1004:224b::5c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg3-0000000GXt5-1QwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:02:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CBH6n7O8BP/HoFkIHe06UxiI77aEmPLQp99OnnXWeHY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624533; v=1; x=1794229333;
 b=TjAx56T7pLXnuPa7R0RTirXIC9JVUa5pjHj0na8JD9eN/L8lGgpXvIVDx7vbE6wuCeX0Y67r
 sBTcJ3ODe9528XLhf/EkggfVJdLTpxNiFFdd6bRU4CH+fJi1wqTGNmOIfrg0grgZwfayhAi+dop
 b2gxLjHpwWRzIAKodRKg0Am0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a4c58a5f30d34fbb;
	Mon, 02 Nov 2026 13:02:13 +0000
X-Mizu-Trace-ID: a4c58a5f30d34fbb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] irqchip/gic-v3-its: Compute the wait target under the ITS lock
Date: Mon,  2 Nov 2026 13:01:25 +0000
Message-ID: <20261102130133.3684226-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050219_522326_B6A2B8BC 
X-CRM114-Status: GOOD (  14.06  )
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

its_wait_for_range_completion() converts the posted command pointer into
a queue offset against its->cmd_base, after the caller has dropped
its->lock. That's fine while cmd_base never changes, but the protected
KVM takeover in a later patch switches cmd_base to a copy of the queue
under the lock, and a wait racing with it would compute its target
against the wrong base.

Compute the offset in its_post_commands(), under the lock, and pass it
to the wait instead of the pointer.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 8cc1bd8e7835b..f06da58cccf3d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1144,13 +1144,13 @@ static struct its_cmd_block *its_allocate_entry(struct its_node *its)
 	return cmd;
 }
 
-static struct its_cmd_block *its_post_commands(struct its_node *its)
+static u64 its_post_commands(struct its_node *its)
 {
 	u64 wr = its_cmd_ptr_to_offset(its, its->cmd_write);
 
 	writel_relaxed(wr, its->base + GITS_CWRITER);
 
-	return its->cmd_write;
+	return wr;
 }
 
 static void its_flush_cmd(struct its_node *its, struct its_cmd_block *cmd)
@@ -1167,13 +1167,12 @@ static void its_flush_cmd(struct its_node *its, struct its_cmd_block *cmd)
 
 static int its_wait_for_range_completion(struct its_node *its,
 					 u64	prev_idx,
-					 struct its_cmd_block *to)
+					 u64	to_idx)
 {
-	u64 rd_idx, to_idx, linear_idx;
+	u64 rd_idx, linear_idx;
 	u32 count = 1000000;	/* 1s! */
 
 	/* Linearize to_idx if the command set has wrapped around */
-	to_idx = its_cmd_ptr_to_offset(its, to);
 	if (to_idx < prev_idx)
 		to_idx += ITS_CMD_QUEUE_SZ;
 
@@ -1216,10 +1215,10 @@ void name(struct its_node *its,						\
 	  buildtype builder,						\
 	  struct its_cmd_desc *desc)					\
 {									\
-	struct its_cmd_block *cmd, *sync_cmd, *next_cmd;		\
+	struct its_cmd_block *cmd, *sync_cmd;				\
 	synctype *sync_obj;						\
 	unsigned long flags;						\
-	u64 rd_idx;							\
+	u64 rd_idx, wr_idx;						\
 									\
 	raw_spin_lock_irqsave(&its->lock, flags);			\
 									\
@@ -1242,10 +1241,10 @@ void name(struct its_node *its,						\
 									\
 post:									\
 	rd_idx = readl_relaxed(its->base + GITS_CREADR);		\
-	next_cmd = its_post_commands(its);				\
+	wr_idx = its_post_commands(its);				\
 	raw_spin_unlock_irqrestore(&its->lock, flags);			\
 									\
-	if (its_wait_for_range_completion(its, rd_idx, next_cmd))	\
+	if (its_wait_for_range_completion(its, rd_idx, wr_idx))		\
 		pr_err_ratelimited("ITS cmd %ps failed\n", builder);	\
 }
 
-- 
2.47.3


