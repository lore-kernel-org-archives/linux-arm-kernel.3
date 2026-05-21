Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE6CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8+gJYyIyK3axLW34gTWDjC1SWf3crUEw1rSRechVWc=; b=o5W06rXUm5Vwd0Uy9U/Y81+9Ls
	nNlCJacB25C9RPrtpzud5Bv/zNBXQZTZhEPjtVoC54tggSFvgMvpc5feLcchNDhwZKwkTLT2FtglS
	/I17hI1xfCU/jLkcIx3KVp9Vi4ceDL/aHWaPWUiQYeU+8rXMeT6Rp81QNqTwgTwdf00AiQHDlJCo6
	unkWuFF4JZGgSq7I/YyFKu1ggHsUeTfCwRgtV6nV8uvAuUmX9pLQuQVf3R90fWpOdVuF2Qo6J3MRz
	rsdgI9AIOhCUQ7E2DiRzFu1MspMChebOUKl/GDZDf529MkBOMvPgwYcIgcEMTlCPNUt512S/npesF
	lcwAccyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWn-000000075YW-1fLR;
	Thu, 21 May 2026 08:13:13 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWj-000000075V4-0yii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:13:10 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45b7ff2140eso5067782f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779351187; x=1779955987; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8+gJYyIyK3axLW34gTWDjC1SWf3crUEw1rSRechVWc=;
        b=WUgQ0zzqcMsjyQfuMax9/7bw7uT0+vT5iWEBam3FLm9gO7fOMcZXLkarUezDv1p7Us
         Yqb1YJcKSa/Tycjpy8HOq/9aHPmxqkJqWHzXhaA9I3jPuqJaG7vGY9bUY5xOa8ohiTvM
         ZFT7jBos48af1Kp0QUCiPQXhTr0pC2iL4MLu5wJvMYUdkEiuSulQFyaXkf5V0q3RGdbW
         G+2o/34WG3FvwUxG00twfMqOviKzzu/Uj88EYNmcJYiyae8EQz+rpgbk+gvQ8Dwjj69j
         EcknlJ5UPqm5D4NMlDtcQL4tlGWbI/6AoXku2Ggih0o/19vuEaj/TtmdTrAml8ZkVZtj
         7UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351187; x=1779955987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8+gJYyIyK3axLW34gTWDjC1SWf3crUEw1rSRechVWc=;
        b=CSLDldIJAFkd23hggyEXLcTA00aOtYoi35lGSrCD7CmkIOgXxyQw0fqhJ02wi9w+cp
         ICxII6m2hn1jS27mum01kHAu5hI/l49yWXIGLpJXMc2vwpSJPdagfjJcBPVL5MWPAeGk
         lIOMc1BU5XcYbvvJWzX40tt8e637J94rkx/2bKhfZ/ggOew0AkbfdEe1XdcB+5SuOqRe
         AQL/b8ynXD/mOY15hzUxtgGFjDmGFvsjKUZk4gtIniwLqrfBCYkw7SKjpRMith4LEAGR
         6IuYMBUjNqr2NCcgMtRqPPqn/aANgubrIsqJrJRc6KeYz0zD0vuo2YzAdNYgEwc1lgY4
         f/nw==
X-Gm-Message-State: AOJu0Yzwf48hYviW7GZvOlyhiEiXJMe3xtMBND0ENqjEuWljzhAolqS7
	d9uHsYhyHMTt8s5ZafWqZ6GZRxMPoms9edHmlZ3q3ocbODhWdsvhnkPAg0Q/yuMolOyV6boQ62z
	UyCPduR3NBvkrJPmZHgn4Uw==
X-Received: from wrpb17.prod.google.com ([2002:adf:f251:0:b0:44c:f0d4:a61c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2582:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-45ea416bbebmr2906383f8f.42.1779351186950;
 Thu, 21 May 2026 01:13:06 -0700 (PDT)
Date: Thu, 21 May 2026 09:12:50 +0100
In-Reply-To: <20260521081250.655226-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521081250.655226-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521081250.655226-3-vdonnefort@google.com>
Subject: [PATCH 2/2] KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate_host
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_011309_291802_CC918E3E 
X-CRM114-Status: GOOD (  10.99  )
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

A previous bug in __pkvm_init_vm error path showed that the hypervisor
could leak refcounted pages, (i.e. losing access to a page while its
refcount is still elevated). This poses a threat to the pKVM state
machine.

Address this by introducing a fail-safe in n __pkvm_hyp_donate_host.
Transitions are not a hot path so added security is worth the extra
check.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 1e17973f24bb..dd168879431f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -856,6 +856,16 @@ static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_pa
 	return 0;
 }
 
+static int __hyp_check_page_count_range(phys_addr_t phys, u64 size)
+{
+	for_each_hyp_page(page, phys, size) {
+		if (page->refcount)
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
 static bool guest_pte_is_poisoned(kvm_pte_t pte)
 {
 	if (kvm_pte_valid(pte))
@@ -1054,7 +1064,6 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 int __pkvm_host_unshare_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 virt = (u64)__hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -1067,10 +1076,9 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	if (ret)
 		goto unlock;
-	if (hyp_page_count((void *)virt)) {
-		ret = -EBUSY;
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
 		goto unlock;
-	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
@@ -1133,6 +1141,10 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	if (ret)
 		goto unlock;
 
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
+		goto unlock;
+
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
-- 
2.54.0.746.g67dd491aae-goog


