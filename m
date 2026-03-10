Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549AFD2D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKVeba1O2GNqI9y6nMRgrPtXZ5F94kglcm0NO/0FYK4=; b=lp1B6aQAcZxrK6HIGdRbngr58s
	w6Q+IcjGQQOY1fhd+dki4qi/v4aiSg+sUAg/7k72UkhnIvSYg4OJRejhp96Ei3HGpmJnPsMEnXeaM
	jsXjyVZzBiDrhoJE3y8sAu4hIslLDJo/8V1vZJ8xov99DTbspOi3TMDJdu4/Q/TSI7f4/OkEn5b/9
	wW23p4l1A2yXJpQ7L36DygWqNO83uSEWoIRWcTg1Lc8gM+2bGIdqar7CK06bu64dgVzTDC9yCT/Iy
	AKGdKdxqE8TGFo38nTzJwx5CSzrCuE+XZn+hkAq/BtwL6sXK9CCN3yFTZ7x41D1a8HrmAzuqJ4oYR
	zwKdEAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXC-00000009WGS-3LzT;
	Tue, 10 Mar 2026 12:50:02 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX3-00000009W64-0l9x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:54 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-439db9da59eso3667681f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146991; x=1773751791; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DKVeba1O2GNqI9y6nMRgrPtXZ5F94kglcm0NO/0FYK4=;
        b=0cd+IdGQUouz8nHRH+dJ11aUNGsBMh2FXsVSPra2VvB7cID6Iy0ozzAxASitdq3nKR
         JxLY8lvi5RNruxv9u93aPqNEA4OL12QTWVbQ2jwDd15iuv6ieBJU1Acbv4Q7sz+1pOUh
         22s+AmJBwGfBSWLKVE9CopSGsKXW96NFKvtDhCZk05ucKhhXgWe4Dvlkb8ExMq3hgr9e
         5Sk9rSbnEH9T9jW/yaT/SIozcdbXazkIeWXLKrJnLHviXEHhae2KpL5d+7yqOpRDMgT5
         x/9nDjI3kxuYYcG0wY2LZ/ujFCHuRpCLwVDcS4LIvxUiK2vR7jARdaSRMLNxg5Y/zPSI
         4Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146991; x=1773751791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKVeba1O2GNqI9y6nMRgrPtXZ5F94kglcm0NO/0FYK4=;
        b=e0MzE3qsP2dm1LGL8H4rRV+9sZaV2M9cJSos+1A76N7b5UV38HcejyFZ2xaW3JD/lx
         yg4v71F1fFLdw2m4EFNFrG6Ysc81xv1W+xmA0CuDrj+ScNzTjU5SmBN/hALwNpNwf7MJ
         KapgBT91Gc+Z8nxz7WGfng1uqPkW2/5gb6ZUaOIwHyXtjHyE04+dGbLFVezNNmkaU637
         VEjClOq/WhPFAFZn2SZ+AtebUIXwrThB0ZX09cyu4/Pfdly2gtfT/0n/Bxi2mZrZh/xw
         pJG89iECHU2lwr1bYZNXE138wY88ytrWXmEhPqtpoSgEISu266OYM9gAfYOx07sTumP7
         dZsg==
X-Forwarded-Encrypted: i=1; AJvYcCUTbWHouN60dHRdCp4WcBaOmSP3n3faZbRXYq2ihuQ9or617YxTdXgyrO4xWjaxvF1iBoE5/hW7T0g7p6Yh+ASF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2FUqMUnvy0gAxvAypb5eTQKLTJJkAtIcmG/6JGZDFw2+NN17J
	yM1bwfdqgRaN4cjGK9upHxC06blVa6CVBIM906MyzEwM+FmpOAySgq9LEQjqdWP/JIbLxi0229j
	4+SJnephThltqMG3l2pATcnnLHYQF4Q==
X-Received: from wrmz10.prod.google.com ([2002:adf:e54a:0:b0:439:b120:9eeb])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:608:b0:439:ad90:389e with SMTP id ffacd0b85a97d-439da8861bdmr24755811f8f.36.1773146990477;
 Tue, 10 Mar 2026 05:49:50 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:26 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-8-sebastianene@google.com>
Subject: [PATCH 07/14] KVM: arm64: Restrict host access to the ITS tables
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054953_249554_615C1C12 
X-CRM114-Status: GOOD (  15.28  )
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

Setup shadow structures for ITS indirect tables held in
the GITS_BASER<n> registers.
Make the last level of the Device Table and vPE Table
inacessible to the host.
In a direct layout configuration, donate the table to
the hypervisor since the software is not expected to
program them directly.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 143 ++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 4a3ccc90a1a9..865a5d6353ed 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -141,6 +141,145 @@ static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
 	return NULL;
 }
 
+static int pkvm_host_unmap_last_level(void *shadow, size_t num_pages, u32 psz)
+{
+	u64 *table = shadow;
+	int ret, i, end = (num_pages << PAGE_SHIFT) / sizeof(table);
+	phys_addr_t table_addr;
+
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
+	for (i = i - 1; i >= 0; i--)
+		__pkvm_host_unshare_hyp(start_pfn + i);
+	return ret;
+}
+
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
+static void pkvm_host_map_last_level(void *shadow, size_t num_pages, u32 psz)
+{
+	u64 *table;
+	int i, end = (num_pages << PAGE_SHIFT) / sizeof(table);
+	phys_addr_t table_addr;
+
+	for (i = 0; i < end; i++) {
+		if (!(table[i] & GITS_BASER_VALID))
+			continue;
+
+		table_addr = table[i] & ~GITS_BASER_VALID;
+		WARN_ON(__pkvm_hyp_donate_host(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT));
+	}
+}
+
+static int pkvm_setup_its_shadow_baser(struct its_shadow_tables *shadow)
+{
+	int i, ret;
+	u64 baser_val, num_pages, type;
+	void *base, *host_base;
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		baser_val = shadow->tables[i].val;
+		if (!(baser_val & GITS_BASER_VALID))
+			continue;
+
+		base = kern_hyp_va(shadow->tables[i].base);
+		num_pages = (1 << shadow->tables[i].order);
+
+		ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(base), num_pages);
+		if (ret)
+			goto err_donate;
+
+		if (baser_val & GITS_BASER_INDIRECT) {
+			host_base = kern_hyp_va(shadow->tables[i].shadow);
+			ret = pkvm_share_shadow_table(host_base, num_pages);
+			if (ret)
+				goto err_with_donation;
+
+			type = GITS_BASER_TYPE(baser_val);
+			if (type == GITS_BASER_TYPE_COLLECTION)
+				continue;
+
+			ret = pkvm_host_unmap_last_level(base, num_pages,
+							 shadow->tables[i].psz);
+			if (ret)
+				goto err_with_share;
+		}
+	}
+
+	return 0;
+err_with_share:
+	pkvm_unshare_shadow_table(host_base, num_pages);
+err_with_donation:
+	__pkvm_hyp_donate_host(hyp_virt_to_pfn(base), num_pages);
+err_donate:
+	for (i = i - 1; i >= 0; i--) {
+		baser_val = shadow->tables[i].val;
+		if (!(baser_val & GITS_BASER_VALID))
+			continue;
+
+		base = kern_hyp_va(shadow->tables[i].base);
+		num_pages = (1 << shadow->tables[i].order);
+
+		WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(base), num_pages));
+		if (baser_val & GITS_BASER_INDIRECT) {
+			host_base = kern_hyp_va(shadow->tables[i].shadow);
+			pkvm_unshare_shadow_table(host_base, num_pages);
+
+			type = GITS_BASER_TYPE(baser_val);
+			if (type == GITS_BASER_TYPE_COLLECTION)
+				continue;
+
+			pkvm_host_map_last_level(base, num_pages, shadow->tables[i].psz);
+		}
+	}
+
+	return ret;
+}
+
 static int pkvm_setup_its_shadow_cmdq(struct its_shadow_tables *shadow)
 {
 	int ret, i, num_pages;
@@ -205,6 +344,10 @@ int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *host_priv_state,
 	if (ret)
 		goto err_with_shadow;
 
+	ret = pkvm_setup_its_shadow_baser(shadow);
+	if (ret)
+		goto err_with_shadow;
+
 	its_reg->priv = priv_state;
 
 	hyp_spin_lock_init(&priv_state->its_lock);
-- 
2.53.0.473.g4a7958ca14-goog


