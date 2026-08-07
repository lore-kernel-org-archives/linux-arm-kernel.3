Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B3C5AC9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGF2g3bOrwS0bBAJ3Ttr3oRulWgqFoQx+8Dbjow6I58=; b=cbvrX5oZIVmqw4ONe5XnUuBzv7
	AkzyVVwPJcXGNSAZLERDDgphNX2+v5kFQvbtMryzO0DFtpHA/FgW6T3K2LY+mQPrjeMNbxSX1zKDT
	BjvHLbjs+afSsI/1s2nVJEGPPjpYVtpHjyCh2u/UBvEgv+bWOVcBrhEIWGP/BBYh6Gz/riQ3V2tg2
	FAb1nZGnc1bKYMkRmo9M71MKDjEvsJNlsfa4qUcfFUH4t2XuigT494LU7TCIfi68aFxRsGwUccUqH
	9gyins4wFovI7cFNaOTijo7lYqQ2ttTqW1+JyvbTi/wkDk7XPJzzNkA/gDuo8oZGF+6k1zLO/5DoQ
	jp6gkr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfp-00000008SD6-2bVg;
	Fri, 07 Aug 2026 16:43:57 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfk-00000008S63-2Ng5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:53 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-47fecbb553bso2804968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121030; x=1786725830; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGF2g3bOrwS0bBAJ3Ttr3oRulWgqFoQx+8Dbjow6I58=;
        b=pKRY9TXi5qjDi14esOTBAo7UxLM7jpTieWZ9MX//jJwkAIIouMgMMIjUFNzB9kCjOI
         V/jdRJfT3gM3ls1nqHR185E+6i5L2XaU4vnCmzZh1E+zg4H4/zpPw7KEFxkFyzOeM1IZ
         KUnV9b5Mvh4wylmtfz1USKtb2OfDdSXka//gwzzV6TkpiG9GzYQFherwogjLm5oZkGlA
         d9/woCu6JzI1FUdl+Rd3or7HsqqwAxNhLi7YEqVoqW/cjSIjbcekg08NvifsyOQUn0Na
         86bEB1cz+YhazZPXAx3SWlGhIc5OI4PxFY61VOBZVBrwajmkZhx/UO8zuciujYzsgCeW
         +1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121030; x=1786725830;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGF2g3bOrwS0bBAJ3Ttr3oRulWgqFoQx+8Dbjow6I58=;
        b=JEKyjOMf+PIWBngHezp9qEs2N4YyVtakCAcyh0ZamG/prDof7V0rodpVcd/X2HL3iA
         3HaWZaAaUzgsuCYrJUfNZ5EAACHyR/p6kW6GsjMkwhTceRPysmv52RdxgPTQYgHccCi1
         EvHVkhnD5zt56qkwJ+ahZd9Eqg/92iOjSLu0AoZ2JRkIP/xlaJCIQQJ1ylIl4Y+8gDs5
         7pZP6R90P7SSi7E5nOGH+QVS93t6oZuTjr31qpziyfqxGXbbEcB1hJS7NaKOEQP1p1MS
         wWvEfPY11MRHzpX+2eQdkEUzki6t+k331gSwTeml0a1I4rdBwSdXRgAHvjoXUHz5tTYa
         TLJg==
X-Forwarded-Encrypted: i=1; AHgh+RqcsGUCqpxT8RRH+ok6AH39Qam/NP1tBNaloyq9TP97/O549hmXr12XvbpBVvK0lVUVf9DB5Phb7FYn8zUinarJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BayyM+o2tuy3a67Zm7DGRyz1rZqB2BSHZ7MwHQPzs/uN9Ac0
	ejxyHNGjWO/VWR6TCfo+AxVc6djnc0jQs4/gz2kL4+Ew9oDhMx1J+6+GKGYoRar4ML3ozWh7Adu
	X+OeiOi0uNjW/H1+x9D0PyqF8phH1rA==
X-Received: from wrsn11.prod.google.com ([2002:a5d:484b:0:b0:46f:b032:2830])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2501:b0:47f:6bdf:b13a with SMTP id ffacd0b85a97d-47fec523c73mr37443105f8f.18.1786121029869;
 Fri, 07 Aug 2026 09:43:49 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:18 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-10-sebastianene@google.com>
Subject: [PATCH v2 08/13] KVM: arm64: Trap & emulate the ITS MAPD command
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094352_654218_19E57857 
X-CRM114-Status: GOOD (  30.19  )
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

Parse the MAPD command and extract the ITT address to sanitize it. When
the command has the valid bit set, share and pin the memory that holds
the ITT table with the hypervisor to prevent it from being given to
someone else (eg. a VM). Use the pinning as a mechanism to get a grip
to the page and to prevent other users of the pKVM API from sharing or
donating the page for something else.
This is to prevent a a situation where a page is given to someone else
and then a MAPTI command is used to create an ITE entry in that page.

Implement shadow table updates for the first level of the indirect
tables when a MAPD command is issued. Compare the host view of the table
for the entry identified by the deviceId with the original table at the
same index and check if the valid bit is changed. If it didn't change,
don't update the original table. If it changed, verify if the new entry
has the valid bit set and donate the level2 table from the host to the
hypervisor (with the address of the table used from the new entry).
If the new entry has the valid bit cleared, donate the level2 table
from the hypervisor to the host with the address of the table extracted
from the original table managed by the hypervisor.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 240 +++++++++++++++++++++++++-
 1 file changed, 238 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 1ce2f9d8fcf9..071a08d3602d 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -54,6 +54,11 @@ struct its_handler {
 	.read = (read_cb),				\
 }
 
+struct dte_entry {
+	u32	device_id;
+	u64	itt_pfn;
+};
+
 struct its_priv_state {
 	/* The location of the ITS in the hypervisor VA */
 	void __iomem	*base;
@@ -66,6 +71,9 @@ struct its_priv_state {
 	hyp_spinlock_t	its_lock;
 
 	struct its_host_state	*host_state;
+	u16			empty_entry;
+	u16			num_tracked_entries;
+	struct dte_entry	tracked_entries[];
 };
 
 #define GITS_CWRITER_RETRY	BIT_ULL(0)
@@ -110,11 +118,236 @@ static int submit_single_cmd(struct its_priv_state *its, bool retry)
 	return 0;
 }
 
+static int get_num_itt_pages(struct its_priv_state *its, u8 num_bits)
+{
+	u64 gits_typer, nr_ites;
+	size_t sz;
+
+	gits_typer = readq_relaxed(its->base + GITS_TYPER);
+	if (num_bits > FIELD_GET(GITS_TYPER_IDBITS, gits_typer))
+		return -EINVAL;
+
+	nr_ites = BIT_ULL(num_bits + 1);
+	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, gits_typer) + 1);
+	sz = max(sz, ITS_ITT_ALIGN) + ITS_ITT_ALIGN - 1;
+
+	return PAGE_ALIGN(sz) >> PAGE_SHIFT;
+}
+
+static struct its_baser *get_table_from_snapshot(struct its_host_state *host, u64 baser_type)
+{
+	int i;
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		if (GITS_BASER_TYPE(host->tables[i].val) == baser_type)
+			return &host->tables[i];
+	}
+
+	return NULL;
+}
+
+static int check_table_update(struct its_priv_state *its, u32 device_id, u64 type, bool rollback)
+{
+	struct its_baser *table = get_table_from_snapshot(its->host_state, type);
+	size_t lvl2_entry_sz, lvl1_table_sz, num_lvl2_entries, num_lvl1_entries;
+	u64 *snapshot_table, *original_table;
+	u64 prev_entry, new_entry;
+	u32 new_entry_index;
+	int ret;
+
+	if (!table)
+		return -EINVAL;
+
+	/* We only do shadow udates for the first level of indirect tables */
+	if (!(table->val & GITS_BASER_INDIRECT))
+		return 0;
+
+	lvl2_entry_sz = GITS_BASER_ENTRY_SIZE(table->val);
+	num_lvl2_entries = table->psz / lvl2_entry_sz;
+
+	lvl1_table_sz = (1 << table->order) << PAGE_SHIFT;
+	num_lvl1_entries = lvl1_table_sz / sizeof(u64);
+
+	new_entry_index = device_id / num_lvl2_entries;
+	if (new_entry_index >= num_lvl1_entries)
+		return -ENOSPC;
+
+	snapshot_table = kern_hyp_va(table->base_snapshot);
+	original_table = kern_hyp_va(table->base);
+
+	/*
+	 * Look at the host table copy and if the entry hasn't changed the valid
+	 * bit compared to the original table used by the hardwre, don't update anything.
+	 */
+	new_entry = snapshot_table[new_entry_index];
+	prev_entry = original_table[new_entry_index];
+	if (!((new_entry ^ prev_entry) & GITS_BASER_VALID))
+		return 0;
+
+	/*
+	 * The host can play nasty tricks with read-modify-write after a
+	 * rollback is triggered but we still hold on to the original tables
+	 * which are hyp managed and we don't give back any other page to the
+	 * host.
+	 */
+	if (rollback)
+		new_entry = new_entry ^ GITS_BASER_VALID;
+
+	if (new_entry & GITS_BASER_VALID)
+		ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(new_entry & PHYS_MASK),
+					     table->psz >> PAGE_SHIFT);
+	else
+		ret = __pkvm_hyp_donate_host(hyp_phys_to_pfn(prev_entry & PHYS_MASK),
+					     table->psz >> PAGE_SHIFT);
+	if (ret)
+		return ret;
+
+	original_table[new_entry_index] = new_entry;
+	return 0;
+}
+
+static int track_pfn_add(struct its_priv_state *its, u32 device_id, u64 pfn)
+{
+	void *virt = hyp_phys_to_virt(hyp_pfn_to_phys(pfn));
+	struct dte_entry *entries = &its->tracked_entries[0];
+	bool pfn_shared = false;
+	int ret;
+	int i;
+
+	for (i = 0; i < its->num_tracked_entries; i++) {
+		if (entries[i].itt_pfn == pfn) {
+			if (entries[i].device_id != device_id) {
+				pfn_shared = true;
+				break;
+			} else {
+				return hyp_pin_shared_mem(virt, virt + PAGE_SIZE);
+			}
+		}
+	}
+
+	if (its->empty_entry >= its->num_tracked_entries)
+		return -ENOSPC;
+
+	if (!pfn_shared) {
+		ret = __pkvm_host_share_hyp(pfn);
+		if (ret)
+			return ret;
+	}
+
+	ret = hyp_pin_shared_mem(virt, virt + PAGE_SIZE);
+	if (ret) {
+		__pkvm_host_unshare_hyp(pfn);
+		return ret;
+	}
+
+	entries[its->empty_entry].itt_pfn = pfn;
+	entries[its->empty_entry].device_id = device_id;
+
+	for (i = 0; i < its->num_tracked_entries; i++) {
+		if (!entries[i].itt_pfn && !entries[i].device_id)
+			break;
+	}
+	its->empty_entry = i;
+	return 0;
+}
+
+static int track_pfn_remove(struct its_priv_state *its, u32 device_id, u64 pfn)
+{
+	void *virt = hyp_phys_to_virt(hyp_pfn_to_phys(pfn));
+	struct dte_entry *entries = &its->tracked_entries[0];
+	int ret;
+	int i;
+
+	for (i = 0; i < its->num_tracked_entries; i++) {
+		if (entries[i].itt_pfn != pfn || entries[i].device_id != device_id)
+			continue;
+
+		/* To decrement the refcount, first try to unshare it */
+		ret = __pkvm_host_unshare_hyp(pfn);
+		if (ret == -EBUSY) {
+			hyp_unpin_shared_mem(virt, virt + PAGE_SIZE);
+			ret = __pkvm_host_unshare_hyp(pfn);
+			if (ret == -EBUSY)
+				return 0;
+
+			WARN_ON(ret);
+		}
+
+		memset(&entries[i], 0, sizeof(struct dte_entry));
+		its->empty_entry = i;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int track_pfn(struct its_priv_state *its, u32 device_id, u64 pfn, int num_pages,
+		     bool remove)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < num_pages; i++) {
+		if (remove)
+			ret = track_pfn_remove(its, device_id, pfn + i);
+		else
+			ret = track_pfn_add(its, device_id, pfn + i);
+
+		if (ret)
+			goto err_track_pfn;
+	}
+
+	return 0;
+err_track_pfn:
+	for (i = i - 1; i >= 0; i--) {
+		if (remove)
+			WARN_ON(track_pfn_add(its, device_id, pfn + i));
+		else
+			WARN_ON(track_pfn_remove(its, device_id, pfn + i));
+	}
+	return ret;
+}
+
+static int process_its_mapd(struct its_priv_state *its, struct its_cmd_block *cmd, bool rollback)
+{
+	phys_addr_t itt_addr = cmd->raw_cmd[2] & GENMASK(51, 8);
+	bool remove = !(cmd->raw_cmd[2] & BIT(63));
+	u8 size = cmd->raw_cmd[1] & GENMASK(4, 0);
+	u32 device_id = cmd->raw_cmd[0] >> 32;
+	int num_pages, ret;
+	u64 itt_pfn;
+
+	if (rollback)
+		remove = !remove;
+
+	itt_pfn = hyp_phys_to_pfn(itt_addr);
+	num_pages = get_num_itt_pages(its, size);
+	if (num_pages < 0)
+		return num_pages;
+
+	ret = check_table_update(its, device_id, GITS_BASER_TYPE_DEVICE, rollback);
+	if (ret)
+		return ret;
+
+	return track_pfn(its, device_id, itt_pfn, num_pages, remove);
+}
+
 static int process_cmd(struct its_priv_state *its, struct its_cmd_block *cmd,
 		       bool rollback)
 {
-	/* Passthrough everything for now */
-	return 0;
+	u8 req_type = cmd->raw_cmd[0] & GENMASK_ULL(7, 0);
+	int ret = 0;
+
+	switch (req_type) {
+	case GITS_CMD_MAPD:
+		ret = process_its_mapd(its, cmd, rollback);
+		break;
+	default:
+		/* Passthrough everything for now */
+		break;
+	}
+
+	return ret;
 }
 
 static void cwriter_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
@@ -459,6 +692,9 @@ int pkvm_its_emulate_setup(phys_addr_t dev_addr, struct its_host_state *host_sta
 	priv_state->base = (void __iomem *)__hyp_va(dev_addr);
 	priv_state->cmd_original = host_state->cmd_original;
 	priv_state->cmd_host_copy = host_state->cmd_host_copy;
+	priv_state->empty_entry = 0;
+	priv_state->num_tracked_entries = ((priv_num_pages << PAGE_SHIFT) -
+		offsetof(struct its_priv_state, tracked_entries)) / sizeof(struct dte_entry);
 
 	priv_state->cmd_offset = readq_relaxed(priv_state->base + GITS_CREADR) &
 		GITS_CREADR_OFFSET;
-- 
2.55.0.654.g21b8a5bc05-goog


