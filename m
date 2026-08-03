Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9202C55197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iEAKLbto2A4V8SjNltJfT6Zw37CtGlO8SJPT3maqDw=; b=MhdTugTLri9roUpGI+GxBXQshE
	l/pqYgrfwwe8pzIkURW8mylZB+1KIFp//mYPwTwJvwtFU88HUg/FAi+N0wHaPXE3WiSh71eGVbDXp
	drHMe+SwAik91aI1MOyFDTP9QeMOiO4ODOeNLbk7NAScszu95UN68ZRy1hEPSDxn6evYyFRA/h7iJ
	Qq1fBuYHB+dAtCSek8mmatnflbFgz6M8PNM8bZbjOGA+vlncsq4jPDvVIAs8uwY3EqdDCpmcuZzwI
	ccWJCyLRGiPfeTmRNRRSwcFElavXpQhAV76QN7SkMg1NA4G64/vLjnO/tjnZMATdpTFAsDLpXF2q7
	NB9H044Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdN-0000000GmpW-0YDL;
	Mon, 03 Aug 2026 10:11:01 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdL-0000000Gmmw-059m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:00 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso18395325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751856; x=1786356656; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iEAKLbto2A4V8SjNltJfT6Zw37CtGlO8SJPT3maqDw=;
        b=iYc3uPYPcbB0tiAYUD2XiulKldpl+tCvGJSD8H1fE2iNkZ024zf/1nbbq/IUY+O7gP
         1HmJ/bwgqosMMj3O/XE5qdbNKaFsqStbbqFI66JiUxk0IlUz9xCPTrDkZiJYK5pn2dZR
         EGc8Qeee+etSTh3PVHGnAaFFiFAzexMu9cmWth3ENuooNG3lgTqLd6bxUiaAFKus/O4k
         mVlNXi0wvAMroaqYUJeKREe4UBpUiR+JeHeQ6Hdf6Fwv5H+IoKNaqKNuT3nytVj6jEAZ
         GxJANZeltOnLeJTOioCQkrM6evDzjskTYbVhzaqvBfv6ykLrNOhgpvcqxXST6MpmP3a3
         aSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751856; x=1786356656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iEAKLbto2A4V8SjNltJfT6Zw37CtGlO8SJPT3maqDw=;
        b=Jmvdwchr6Pm9fhZkmymgbJ3rLbQMnx0xxYEpexVm8mGx+VKxzF3AjGz9Cyv5iaLdSd
         1YTx0HXYE9m55nQOHxUfsICjtJ/CDxlHPA4XrDRL83TLmS415V/mwi2O3g1cl2xdtOvT
         CRX3SHwQ7Xpm7JUDjPlCbVHgEhQspa6NoO6bfUHpbzGxJJarZR1thAWJIOfzMIeqQPMY
         eDL/WwM498ksYzHPxUMfKUCmiBsAFIeRliEfI1SARAMHMGoZNN53okKVM6KEpqvt7ELO
         gim2/xl5+3YXBUa9+F5/Vw0dVs1HctDhU6lNp8C83cgENyGxeFM98ACI+u92NtwNX/JX
         Fs8A==
X-Forwarded-Encrypted: i=1; AHgh+RqI4tFgazYnWJqeurRXbvvUXcRzchNTG4+xS08fNkbZQwvENexpftOWY8PcseLpze63aprhRZAcjQvnXPWlVd9T@lists.infradead.org
X-Gm-Message-State: AOJu0YzxdE6MHJ7znxRp0880ryq40MLeRTS4HSXXWCnUxDGyoZcnZzLH
	+MaqvDiaf/aN2+sVKaFQSDX0EX955gd5yjOLDjr/duYcrA7eDwzUtABjkPHS5StQYEWJIMEk+2e
	yeeWNqFNTH5Qx5MgfPtK+KA==
X-Received: from wmga12.prod.google.com ([2002:a05:600c:2d4c:b0:493:bba5:775a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f92:b0:495:7293:4fe2 with SMTP id 5b1f17b1804b1-4980c67af48mr151317035e9.17.1785751856061;
 Mon, 03 Aug 2026 03:10:56 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:47 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-4-vdonnefort@google.com>
Subject: [PATCH 03/20] KVM: arm64: Allow block-level stage-2 annotation
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031059_074084_1002F462 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

On host to guest donation, pKVM annotates the host stage-2 invalid
entries with the GFN. Now that the host stage-2 preserves annotations on
block split, we can allow these annotations at block-level. This enables
safe support for guest stage-2 huge mappings.

Allowing block-level annotations also reduces stage-2 fragmentation when
unmapping a huge region, and reduces host stage-2 memory usage by
avoiding the allocation of intermediate page tables.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0ca157ecee64..c4ebae0544d4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -947,9 +947,6 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
-	if (data->annotation)
-		return true;
-
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -1178,7 +1175,6 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	struct stage2_map_data map_data = {
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
-		.force_pte	= true,
 		.annotation	= true,
 		.pte_annot	= pte_annot |
 				  FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, type),
-- 
2.55.0.508.g3f0d502094-goog


