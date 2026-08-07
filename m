Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF03C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aee98ZEVCnU/nGC9n5IlQRH4Fbf+7bsHwlgyxI01O/I=; b=HRPGRBZ69uhFrJj967i/v0zySj
	5t77LurjYHRWgy++bmdqn7vrWXWDIvhlq4BUI2v4v/FvyFydAYjZc0Jej/8zzHM6db+eK1/QlOg3T
	TSNPifPAynsT8D1FNaijJMdW+kESsmcu8YqmJNcF3Li6CZMgWLLm5dCCCgmhxye0XjLtXmTZBQXv0
	mvoCVrcfPPibHvPb0xdUM4lSC/Bn3nQkEvFVQwH/CHkBQ+6990dTj17UUDX9JccXpISLRTZzN/AJl
	LZfDAdD5C8uRYFt2/P5eOGi7jFKn6WZkydvyCL0jR2lKCyGDvE/VM/hIv/IN4PyAemI/40etlYxeQ
	gadSJJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfp-00000008SCn-2Aql;
	Fri, 07 Aug 2026 16:43:57 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfk-00000008S5A-0GP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:53 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15dfd34e4cso272261766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121029; x=1786725829; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aee98ZEVCnU/nGC9n5IlQRH4Fbf+7bsHwlgyxI01O/I=;
        b=db1TJx1Ot9zzPO4hno8lDfG3JdH+J8DDKudHAf08mW7ddbNQ+X0pkd44GocARKFihU
         /2hAbBWEilImH1YpmELF02yy6fkUD02UPdxmj0dCDR8G/w0TEuKawNiLVa80JyWNm+Tb
         lAaFPawYWZNjtkSX86rOD9HbB4lungbP6fJCnBl+5hVDUSjhGX6GqCQiCWOK8T2JKG7T
         YkzikFDShebRz6fPXm33r78g7KOybqNS68a14SV3IdPj8+hOsshZ8/sp4nEoq6G2zAeZ
         fH/VL37WOheChC6nQUxJUE56p3CKuL53wK4KMJqszmsPy3wbGFrfL5NfOK+fNA89Qvu7
         8MCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121029; x=1786725829;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aee98ZEVCnU/nGC9n5IlQRH4Fbf+7bsHwlgyxI01O/I=;
        b=Iu/Xl2qsL2BthpuqClKkWyPQl6grShHjgGAMJ9/Hh8VN/b26pePGmE/R3DDN0JDvr5
         /c/f8eu4mMY3VtzmbUZOkvMFHR4ve/ua/cfH0mUkC0mD1JvE+xMskDW/+WuzpMC5JVd/
         oIw+vitMCMhQIwsXsZMukEgny33ZptSjIzwcEYH+Rw6UsuEyD1AhVwIJeDLc8Lse9I3r
         ozbnMs3XdBi4vG139JmQ1FzxDFcjPmFaYJF1V8QyswV6261vjUeNiq7w56SGm7WEMZPz
         MdK6UPi6eL3d3WdHjau4JmsNRQ47k2gkXfG7CxXIsBYi6pRiPrPzAYxtwfR5iw0yfLR5
         Sllw==
X-Forwarded-Encrypted: i=1; AHgh+RofqORPnYbHCRK45IOm/ycTqFkGxXxDpn7R7iA0MOPHWmD+h8P2NWCIUGvAOd5QQkqNRjgdKP2d7By06uUm88lx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/N4RwiBrIEzcoyDyf/FbBwJ0SC/NcHTM59uIhY+IRGWcAWpQQ
	Hnbm3TRiObLNX/x2pzJ4G/daFSWzDoUqr4fHBZ/ZDPcKsli2XVMKjujb6NLxEPJVjX9tLg5kBfE
	yCyhCgAQ62TgxYKVRZ8MNYek2DT23eQ==
X-Received: from ejcuc8.prod.google.com ([2002:a17:907:c888:b0:c16:7c0a:26a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:198c:b0:c20:2165:f530 with SMTP id a640c23a62f3a-c2039d52e72mr1393700766b.28.1786121028433;
 Fri, 07 Aug 2026 09:43:48 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:17 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-9-sebastianene@google.com>
Subject: [PATCH v2 07/13] KVM: arm64: Restrict host access to the private ITS tables
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
X-CRM114-CacheID: sfid-20260807_094352_142766_81DF4280 
X-CRM114-Status: GOOD (  21.20  )
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

Make the last level of the tables(DeviceTable, Collection and vPE)
inaccessible to the host by donating them to the hypervisor.
This prevents a compromised host from patching an entry with an
address that it wants to write to and then using an ITS command to
write over the memory content from that address.

When tables are configured with indirect layout, shadow the first
layer by copying it to a separate table, update the gic ITS host
driver to use the copy instead of the original table and share the copy
between the host and the hypervisor. Make the original layer
innaccessible to the host by donating the table memory from the host to
the hypervisor.
This ensures that the pKVM ITS emulation mediates the
configuration written by the driver in the first layer of the table and
sanitizes the entries before writing to the original table programmed
in hardware. The update phase of the original table from the copy will
be done when commands are sent to the ITS.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 161 ++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index e943ab972aa5..1ce2f9d8fcf9 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -237,6 +237,20 @@ static int pkvm_setup_its_shadow_cmdq(struct its_host_state *host_state)
 	return ret;
 }
 
+static void pkvm_teardown_its_shadow_cmdq(struct its_host_state *host_state)
+{
+	u64 i, start_pfn, num_pages = host_state->cmdq_len >> PAGE_SHIFT;
+
+	start_pfn = hyp_virt_to_pfn(host_state->cmd_host_copy);
+	hyp_unpin_shared_mem(host_state->cmd_host_copy,
+			     host_state->cmd_host_copy + host_state->cmdq_len);
+
+	for (i = 0; i < num_pages; i++)
+		WARN_ON(__pkvm_host_unshare_hyp(start_pfn + i));
+
+	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(host_state->cmd_original), num_pages));
+}
+
 static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
 {
 	int i;
@@ -249,6 +263,147 @@ static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
 	return NULL;
 }
 
+static void pkvm_unshare_shadow_table(void *shadow, u64 nr_pages)
+{
+	u64 i, start_pfn = hyp_virt_to_pfn(shadow);
+
+	hyp_unpin_shared_mem(shadow, shadow + (nr_pages << PAGE_SHIFT));
+
+	for (i = 0; i < nr_pages; i++)
+		WARN_ON(__pkvm_host_unshare_hyp(start_pfn + i));
+}
+
+static int pkvm_host_unmap_last_level(void *shadow, size_t num_pages, u32 psz)
+{
+	phys_addr_t table_addr;
+	u64 *table = shadow;
+	int i, end;
+	int ret;
+
+	end = (num_pages << PAGE_SHIFT) / sizeof(*table);
+	for (i = 0; i < end; i++) {
+		if (!(table[i] & GITS_BASER_VALID))
+			continue;
+
+		table_addr = table[i] & PHYS_MASK;
+		ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);
+		if (ret)
+			goto err_donate;
+	}
+
+	return 0;
+err_donate:
+	for (i = i - 1; i >= 0; i--) {
+		if (!(table[i] & GITS_BASER_VALID))
+			continue;
+
+		table_addr = table[i] & PHYS_MASK;
+		__pkvm_hyp_donate_host(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);
+	}
+	return ret;
+}
+
+static int pkvm_share_shadow_table(void *shadow, u64 nr_pages)
+{
+	u64 i, ret, start_pfn = hyp_virt_to_pfn(shadow);
+
+	for (i = 0; i < nr_pages; i++) {
+		ret = __pkvm_host_share_hyp(start_pfn + i);
+		if (ret)
+			goto unshare;
+	}
+
+	ret = hyp_pin_shared_mem(shadow, shadow + (nr_pages << PAGE_SHIFT));
+	if (ret)
+		goto unshare;
+
+	return ret;
+unshare:
+	while (i--)
+		__pkvm_host_unshare_hyp(start_pfn + i);
+	return ret;
+}
+
+static void pkvm_host_map_last_level(void *shadow, size_t num_pages, u32 psz)
+{
+	u64 *table = shadow;
+	int i, end = (num_pages << PAGE_SHIFT) / sizeof(*table);
+	phys_addr_t table_addr;
+
+	for (i = 0; i < end; i++) {
+		if (!(table[i] & GITS_BASER_VALID))
+			continue;
+
+		table_addr = table[i] & PHYS_MASK;
+		WARN_ON(__pkvm_hyp_donate_host(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT));
+	}
+}
+
+static int pkvm_setup_its_shadow_baser(struct its_host_state *host_state)
+{
+	u64 baser_val, num_pages;
+	void *original_table, *snapshot_table;
+	int ret;
+	int i;
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		baser_val = host_state->tables[i].val;
+		if (!(baser_val & GITS_BASER_VALID))
+			continue;
+
+		original_table = kern_hyp_va(host_state->tables[i].base);
+		num_pages = (1 << host_state->tables[i].order);
+
+		ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(original_table), num_pages);
+		if (ret)
+			goto err_donate;
+
+		if (baser_val & GITS_BASER_INDIRECT) {
+			if (!host_state->tables[i].base_snapshot) {
+				ret = -EINVAL;
+				goto err_with_donation;
+			}
+
+			snapshot_table = kern_hyp_va(host_state->tables[i].base_snapshot);
+			ret = pkvm_share_shadow_table(snapshot_table, num_pages);
+			if (ret)
+				goto err_with_donation;
+
+			ret = pkvm_host_unmap_last_level(original_table, num_pages,
+							 host_state->tables[i].psz);
+			if (ret)
+				goto err_with_share;
+		}
+	}
+
+	return 0;
+err_with_share:
+	pkvm_unshare_shadow_table(snapshot_table, num_pages);
+err_with_donation:
+	__pkvm_hyp_donate_host(hyp_virt_to_pfn(original_table), num_pages);
+err_donate:
+	for (i = i - 1; i >= 0; i--) {
+		baser_val = host_state->tables[i].val;
+		if (!(baser_val & GITS_BASER_VALID))
+			continue;
+
+		original_table = kern_hyp_va(host_state->tables[i].base);
+		num_pages = (1 << host_state->tables[i].order);
+
+		if (baser_val & GITS_BASER_INDIRECT) {
+			snapshot_table = kern_hyp_va(host_state->tables[i].base_snapshot);
+			pkvm_unshare_shadow_table(snapshot_table, num_pages);
+
+			pkvm_host_map_last_level(original_table, num_pages,
+						 host_state->tables[i].psz);
+		}
+
+		WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(original_table), num_pages));
+	}
+
+	return ret;
+}
+
 DEFINE_HYP_SPINLOCK(its_setup_lock);
 
 int pkvm_its_emulate_setup(phys_addr_t dev_addr, struct its_host_state *host_state, void *priv,
@@ -294,6 +449,10 @@ int pkvm_its_emulate_setup(phys_addr_t dev_addr, struct its_host_state *host_sta
 	if (ret)
 		goto err_with_host_state;
 
+	ret = pkvm_setup_its_shadow_baser(host_state);
+	if (ret)
+		goto err_with_shadow_cmdq;
+
 	hyp_spin_lock_init(&priv_state->its_lock);
 
 	priv_state->host_state = host_state;
@@ -312,6 +471,8 @@ int pkvm_its_emulate_setup(phys_addr_t dev_addr, struct its_host_state *host_sta
 	hyp_spin_unlock(&its_setup_lock);
 
 	return 0;
+err_with_shadow_cmdq:
+	pkvm_teardown_its_shadow_cmdq(host_state);
 err_with_host_state:
 	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(host_state), 1));
 err_with_priv:
-- 
2.55.0.654.g21b8a5bc05-goog


