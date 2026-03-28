Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98B810F3DD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 05:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOJ9iIsuZvHL5cyLqdAmY9/F0c2z+tYW7wmPGa32F7A=; b=cbjSILYT79UgNZWkEfbOJgoPx+
	XwKtSwyXwg6M6wuLpdoZWGvqU/YcaO4yws468gToq9Z+IgwxtsDYZ310s/MkLWllhjhn5fMnA5MYn
	qFcndyUUVR/jQsQTMRsep8S/GmRclpqTcGvuUAZJMQwb6c5sMq/Y6VffbUBWh3l291xo3i67EPjpD
	mWXbC7/mENQX+r+YxlgGJ0J3sqkHHbSgw/jHL2QkyoNPVkI8eZ+yhpS8xkpCcAI/2mxo6OWnENzi7
	MUoJ3dYMwBZTDiSp364X0RDzE/GttO9uGrzY5zSxJ8mqC98Zs1/VEPub5nhS5nj/wwIC+3+ZEyGec
	i0YoUr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MHU-00000008atj-3mwF;
	Sat, 28 Mar 2026 05:32:20 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MHR-00000008at0-0LvS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 05:32:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774675932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zOJ9iIsuZvHL5cyLqdAmY9/F0c2z+tYW7wmPGa32F7A=;
	b=LiNvA6Gv9B9EL4M01WVY9OIl4HG+G7cPdHPvRKnlGleR/TB3rZQ3i3HILU6oWbDiumeg2q
	LFs98nuOGnPNP8afIRjenAYkQQAagYf8kpOdxwbTk1NJZk3oNlYk5VzL+iBneaoCBJ1Dj0
	iyFmCK/OGLBW5mqJVrYyqbFVZF2oazI=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] KVM: arm64: ptdump: Initialize parser_state before pgtable walk
Date: Sat, 28 Mar 2026 13:31:55 +0800
Message-ID: <20260328053155.12219-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_223217_555535_D6182C77 
X-CRM114-Status: GOOD (  10.67  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

If we go through the "need a bigger buffer" path in seq_read_iter(), which
is likely to happen as we're dumping page tables, we will pass the
populated-by-last-run st::parser_state to
kvm_pgtable_walk()/kvm_ptdump_visitor(). As a result, the output of
stage2_page_tables on my box looks like

0x0000000240000000-0x0000000000000000   17179869175G 1
0x0000000000000000-0x0000000000200000           2M 2   R   px ux  AF BLK
0x0000000000200000-0x0000000040000000        1022M 2
0x0000000040000000-0x0000000040200000           2M 2   R W PXNUXN AF BLK
[...]

Fix it by always initializing st::parser_state before starting a new
pgtable walk.

Besides, remove st::range as it's not used by note_page(); remove the
explicit initialization of parser_state::start_address as it will be
initialized in note_page() anyway.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/ptdump.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 6a8836207a79..5dfd526c6dc9 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -22,7 +22,6 @@ struct kvm_ptdump_guest_state {
 	struct ptdump_pg_state	parser_state;
 	struct addr_marker	ipa_marker[MARKERS_LEN];
 	struct ptdump_pg_level	level[KVM_PGTABLE_MAX_LEVELS];
-	struct ptdump_range	range[MARKERS_LEN];
 };
 
 static const struct ptdump_prot_bits stage2_pte_bits[] = {
@@ -131,16 +130,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm *kvm)
 
 	st->ipa_marker[0].name		= "Guest IPA";
 	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
-	st->range[0].end		= BIT(pgtable->ia_bits);
-
 	st->kvm				= kvm;
-	st->parser_state = (struct ptdump_pg_state) {
-		.marker		= &st->ipa_marker[0],
-		.level		= -1,
-		.pg_level	= &st->level[0],
-		.ptdump.range	= &st->range[0],
-		.start_address	= 0,
-	};
 
 	return st;
 }
@@ -151,14 +141,18 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 	struct kvm_ptdump_guest_state *st = m->private;
 	struct kvm *kvm = st->kvm;
 	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
-	struct ptdump_pg_state *parser_state = &st->parser_state;
 	struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
 		.cb	= kvm_ptdump_visitor,
-		.arg	= parser_state,
+		.arg	= &st->parser_state,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 	};
 
-	parser_state->seq = m;
+	st->parser_state = (struct ptdump_pg_state) {
+		.marker		= &st->ipa_marker[0],
+		.level		= -1,
+		.pg_level	= &st->level[0],
+		.seq		= m,
+	};
 
 	write_lock(&kvm->mmu_lock);
 	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
-- 
2.53.0


