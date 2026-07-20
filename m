Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B848CC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GGquKFUt+ZnnqoeDLaHiVsxrzSqvedgiIipPU3o3GU=; b=0IiTVYaOZQhRzBE2rVpuUduN1c
	gphGMDNPSyFlY4osNJZWSjG9vdJXcVQqg6As71DCNWl2GSM4dneiN0ugu8B7b1cD97oIJJc9axxgI
	FvEyfmdapeq2GfxZ1nZxzYQB0ensJ1Qtz8gEFx3VqtRHOb5Grt8RZXANO59EfPliNHGU1HyePd7fn
	m49U/BaOQZU2XDnNBCqrLx+v12YGXh3CsoRwR6NYrKTsxI2EJaBDs85T2RLDubBr2dW0YiRqC3pxo
	Kr3i5CdQEiXo0wmZgu9lrkJYoiP3S+5l6gbsTuA+sL3T/ml8mYaNFBYpOVud5UpL+olDRRNnSzCYN
	xu5SL4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrad-00000007UxY-2xXr;
	Mon, 20 Jul 2026 17:15:39 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraX-00000007Uoy-2pFz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:35 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so30799545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567731; x=1785172531; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GGquKFUt+ZnnqoeDLaHiVsxrzSqvedgiIipPU3o3GU=;
        b=aPH3vf4TNlErnx3PV4OXlaTSgJ3NyWkT59ANehXw4Hu4AstHv2BZ43hp/fNE/gRngB
         rsPRXnnESj0XelOjMx2eHylHrW66EJVa0YSxGaEgezHrnUT/2f5/jQCvrgXbYCgsf+pk
         nHSusk1wuuOW3i/sdcRWU9I3DzikNPJroNwed/4F7w8j1c7/WjXQ6oXuxXOMZtpVqMoq
         vxyDM09WdhiV0/tzEqfbVp7Rokw7yvsraPWUgXArFTtfTNU1w2vWikFNUwdASpqqdTcg
         a1WejT4DajjFP+FGc1z9pwxWHILP9bn+C+KaG1xrEGd9un1a1Ldr3BkqlLZaZxNTOawr
         KdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567731; x=1785172531;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GGquKFUt+ZnnqoeDLaHiVsxrzSqvedgiIipPU3o3GU=;
        b=C/4oVehNAxUb4oovsbBcY1Pa+Lwiv5LSimtKoRgsXYLg1ulPX4LBEt6zlDkOFZbcpw
         scKUsycWLuwET+vciE9wGq9JHHgn73fd2QBDHlOat0K8/azKA8rQpKsvxib10WXO8wJQ
         YeQasmB2R2FjdGU/N1MvrjNfFwV2Fy5+9S9wucaiv53XhcQgd43uOpLltFBAhmhth883
         6qUI0mrvUbEiBxM/OGFw3i6xOK0tuUpB/xTnLWjMQmttFvWcd0+zVnQ+6edTq8JN5VPo
         DEmNzDz/PiPBau/GNMriQFY3bee5vfNyf6DgfHXty+2SjhwCzWrWEuTHoeUMsKb+BEfo
         Rx9g==
X-Forwarded-Encrypted: i=1; AHgh+RrUs/8d6GQTwV/BLDPcuNZrJBH3wCk7JkDshZ8tjLl7M8kxIIferpJhirFpv/k3O+/AMHvYfWN/6drjCagozzyX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp7swzjXsgDvhfvehPVgVCNbu6gKYQLE/Wb089iWeVGBSNFABH
	bYendGYAAkG2Dl1bGVCZ0iS2hzHsVZQ9xjvE6AD071Ja1BrCwrFHbNzACsdRwTaRIo1QTd6C2Kh
	XLohq9oMprFPGI5a3jTd9jA==
X-Received: from wmor19.prod.google.com ([2002:a05:600c:4593:b0:493:f17d:c775])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f94:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-4954a513ef9mr162325755e9.38.1784567731014;
 Mon, 20 Jul 2026 10:15:31 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:06 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-11-vdonnefort@google.com>
Subject: [PATCH v3 10/17] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101533_731939_84AB08DF 
X-CRM114-Status: GOOD (  12.05  )
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

Integrate the pKVM memory reclaim interface with the host's memory
management subsystem.

This allows the host to automatically recover unused memory fom the
hypervisor's heap allocator when the host is under memory pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d28422f5c3d6..bfbb1266491d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -115,7 +115,7 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
 	return ret;
 }
 
-static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
 {
 	struct kvm_hyp_memcache mc;
 	struct arm_smccc_res res;
@@ -133,7 +133,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
 	return reclaimed;
 }
 
-static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
 {
 	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
 }
@@ -342,8 +342,19 @@ void __init pkvm_selftests(void)
 #endif
 }
 
+static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
+}
+
+static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
+}
+
 static int __init finalize_pkvm(void)
 {
+	struct shrinker *pkvm_shrinker;
 	int ret;
 
 	if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
@@ -359,10 +370,21 @@ static int __init finalize_pkvm(void)
 	kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
 
 	ret = pkvm_drop_host_privileges();
-	if (ret)
+	if (ret) {
 		pr_err("Failed to finalize Hyp protection: %d\n", ret);
+		return ret;
+	}
 
-	return ret;
+	pkvm_shrinker = shrinker_alloc(0, "pkvm");
+	if (pkvm_shrinker) {
+		pkvm_shrinker->count_objects = pkvm_shrinker_count;
+		pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
+		shrinker_register(pkvm_shrinker);
+	} else {
+		kvm_err("Failed to register shrinker for pKVM\n");
+	}
+
+	return 0;
 }
 device_initcall_sync(finalize_pkvm);
 
-- 
2.55.0.229.g6434b31f56-goog


