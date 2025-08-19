Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0CACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVz3Y9VpnYE4PVj2+x4ppZYRh/7u9Tfs4/CSD5zsJnw=; b=RMFj0nSHeKpbSSjZcqbu91etD4
	OrRy1SE9Qjx5nc3Wza7+bNDcyJWuMPwCGeLxv8LeVpKF38q1cS6lIIdCaxK0mb9QFjykaczeoez7I
	fRFLnzlgy2L3uPfj9Bh58n0UVSeGUogOoqbpyWaZv4ok9D5GZfvuGc1r5SPgffuPPUq1LXbTYv5Ay
	9699ZuXweygu3b0BWxEoFjpvqwLQ01W9EY9HWDFxxt/TgHVOLZ0fjYJ79uju2gMgincjhCb184Kx8
	optjjhT88IOi+Ig/dUhXpJIZiou9VGJ9qRVSxd8Pov8NUJHkDIryV1RMan/SLCl0wDwBHSFG0Bq7y
	bRaTMaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVUV-0000000Bovq-0RXE;
	Tue, 19 Aug 2025 23:11:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFn-0000000BfO6-0fsF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0bd6a9so25329205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640345; x=1756245145; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVz3Y9VpnYE4PVj2+x4ppZYRh/7u9Tfs4/CSD5zsJnw=;
        b=3w7x+D47ZATUILwkn0SYxd8dazH14KX/zfqAJc9YMIbiQfnU1SD1PCSjKqjphojo4Q
         1CpwNk1TNF2QpgzKwRu4YQuLQ+plwNNdGnyFArMHe1YjQIOy2RDOoUa/3+WuFmdN9pyw
         7/qWxNH+yoXsU3l3uMQ9GgVAN0omHwQvnhpF4fpGeHfCWtmA7lpnAQDpLcfXZdhgPsf9
         8tdKa9iu/zGFO8nVzjDxdGaAB2980zD9CuyFyFp+sts8FsEfZrfnqCUQ3sNQf67qtzrx
         0JMVbZh/MFrJPgWcfGoPon31TtWAwNJziNHz0NQcNWSzvTsp0rKvd1k/txux2NLArT0V
         Z/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640345; x=1756245145;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vVz3Y9VpnYE4PVj2+x4ppZYRh/7u9Tfs4/CSD5zsJnw=;
        b=OfCbPyWRsx2NFEUwN/jQrnzYMQDrMYjIZGwfLaKfa5JMCnJFiTPqQ+Vo2Cn6MWjNJo
         8CGWZaDoPJLRT7Fic7PhRhuv8+dYJQecjvhxMU2VYVdKWXDTQbWbL8/LupuWkaP8oGKL
         REfSe1vVCkwT4/UQzv2BLOHuqTBf1kQrxBNEJQbvXry+vZt40iPXunheqzBn3B7dn949
         t+QVMtNYThu8xvKHkEm1eelIRUUMVsWMqqFKa0WQmHEOpo3E2GkCpFUn1Q9VlIKtrej7
         RKn1K/oJbZ3ApfolF4MK5R8ruzEjc8FQFmSGxi31+6b+0Ae5hYRC82zIrtXK1AuqCbe7
         zepw==
X-Forwarded-Encrypted: i=1; AJvYcCW5TsrvQpffMYP8+YzpbWk6xOSUY/79fkwhNNZU+6hAfflHf8VzxArJLL7gRSqtOagmdC1S6dOyeQt+CA81FKIP@lists.infradead.org
X-Gm-Message-State: AOJu0YyRC6Y/LkMQKsqAUhQpNz3lwrxdGdyoZYXccNJEw8vR9Pm6JMH2
	EZqI0NvjqyeRx2AP7aaWeLqHY+/8Y+duLaFbJeQ5LAzUeNWJRxLIzetDmBjlkig6938Jty7oafZ
	8igzJvUHNmGUg3A==
X-Google-Smtp-Source: AGHT+IE7z3JoHU46VhERaG2rUhWS+WRB2JYInik0I1QmJUrgMcHdJZz9Xytw3QMikJfteQ5I/RRwqWO+5o1F0Q==
X-Received: from wmbem12.prod.google.com ([2002:a05:600c:820c:b0:458:c0cd:291c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0c:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-45b4798a7bdmr3379925e9.7.1755640344849;
 Tue, 19 Aug 2025 14:52:24 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:30 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-3-smostafa@google.com>
Subject: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145227_202555_5E76D3B3 
X-CRM114-Status: GOOD (  18.95  )
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

Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
drivers can use that to protect the MMIO of IOMMU.
The initial attempt to implement this was to have a new flag to
"___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
it was quite intrusive for host/hyp to check/set page state to make it
aware of MMIO and to encode the state in the page table in that case.
Which is called in paths that can be sensitive to performance (FFA, VMs..)

As donating MMIO is very rare, and we don=E2=80=99t need to encode the full=
 state,
it=E2=80=99s reasonable to have a separate function to do this.
It will init the host s2 page table with an invalid leaf with the owner ID
to prevent the host from mapping the page on faults.

Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
stage-2 PTEs, as this can be triggered from recycle logic under memory
pressure. There is no code relying on this, as all ownership changes is
done via kvm_pgtable_stage2_set_owner()

For error path in IOMMU drivers, add a function to donate MMIO back
from hyp to host.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 64 +++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c                  |  9 +--
 3 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm=
/hyp/include/nvhe/mem_protect.h
index 52d7ee91e18c..98e173da0f9b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot p=
rot);
+int __pkvm_host_donate_hyp_mmio(u64 pfn);
+int __pkvm_hyp_donate_host_mmio(u64 pfn);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 861e448183fd..c9a15ef6b18d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enu=
m kvm_pgtable_prot prot)
 	return ret;
 }
=20
+int __pkvm_host_donate_hyp_mmio(u64 pfn)
+{
+	u64 phys =3D hyp_pfn_to_phys(pfn);
+	void *virt =3D __hyp_va(phys);
+	int ret;
+	kvm_pte_t pte;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
+	if (ret)
+		goto unlock;
+
+	if (pte && !kvm_pte_valid(pte)) {
+		ret =3D -EPERM;
+		goto unlock;
+	}
+
+	ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
+	if (ret)
+		goto unlock;
+	if (pte) {
+		ret =3D -EBUSY;
+		goto unlock;
+	}
+
+	ret =3D pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVI=
CE);
+	if (ret)
+		goto unlock;
+	/*
+	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
+	 * - host aborts: host_stage2_adjust_range() would fail for invalid non z=
ero PTEs.
+	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would cal=
l
+	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid pte=
s (counted).
+	 * - other MMIO donation: Would fail as we check that the PTE is valid or=
 empty.
+	 */
+	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys=
,
+				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(u64 pfn)
+{
+	u64 phys =3D hyp_pfn_to_phys(pfn);
+	u64 virt =3D (u64)__hyp_va(phys);
+	size_t size =3D PAGE_SIZE;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) !=3D size);
+	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys=
,
+				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
+	hyp_unlock_component();
+	host_unlock_component();
+
+	return 0;
+}
+
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 {
 	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..ba06b0c21d5a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgta=
ble_visit_ctx *ctx,
 	kvm_pte_t *childp =3D NULL;
 	bool need_flush =3D false;
=20
-	if (!kvm_pte_valid(ctx->old)) {
-		if (stage2_pte_is_counted(ctx->old)) {
-			kvm_clear_pte(ctx->ptep);
-			mm_ops->put_page(ctx->ptep);
-		}
-		return 0;
-	}
+	if (!kvm_pte_valid(ctx->old))
+		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
=20
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp =3D kvm_pte_follow(ctx->old, mm_ops);
--=20
2.51.0.rc1.167.g924127e9c0-goog


