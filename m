Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60746C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pO2+KcPdaCxq3dy8Vxk1F9NqAdOG0WVzqKgbcyEAuc=; b=ef+6JL5/L0PMc/j14nhHx5C0ZY
	wHQbp+9x+kcjXQDZEd5lLZYgR3cKeaOg8/0Vk2mISSLgTi7rFaMdDaW5HQb5SD7Bv/JpYZCe92scc
	a+Zo7PRGFlbAiG9gtftR33YKM+pugzw5IKWHRJMhUhbgng6ZVioGv3PU3iA5UBb+5MeB3WidADMPf
	9jkNMIUFyEEqwqmvDt/kQkR1Ugpi4qjbuiJeHfUhekNq0A7AuoAeMJVLpOYYEdwtBOmHt2Df5mKVI
	fjwN70Ril8Mnb7cE7JWfChzjcqDo8zCXa5LtvKZuXoazdkkXDTkmTM9g+R73fLtR+eKICEZIHbOzz
	v7yNsOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZF-0000000BCvS-0iNQ;
	Tue, 01 Sep 2026 08:10:05 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZD-0000000BCpo-1iJZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:04 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-493fa6e28a7so30456385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250201; x=1788855001; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pO2+KcPdaCxq3dy8Vxk1F9NqAdOG0WVzqKgbcyEAuc=;
        b=TJUUZ+5viVR+IMSIqRSWwh8NEvM/K5TuSm6jTgwU0iC72hOjTTO73yuVTn4/DBlW6l
         CtMjpo3EOqT3RCE0RxsfSKd0zB1fHDWjxcZgQtIwV2O0uq/7MPZ/CUTB9kqkD6Z+Y0nI
         pbVeFdR1ESWx2/o+gc8h+kDudELnBB1dwoxknJjtXUcOcvuOa0UnNXwfkEid53mi53ZB
         3jHuFHwsIh0yt0SAntPiOELWWnvoTZYu5Dx+vL6EjlBhnqMz+fmPF+UZqJjcgRR2DXh3
         FJfbYcC47ijnl5ew5BjeYTzAm+/xxOWCC0jakCBawO2aOsMZuYEG9KLrXeDRwBVoYL+f
         dxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250201; x=1788855001;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pO2+KcPdaCxq3dy8Vxk1F9NqAdOG0WVzqKgbcyEAuc=;
        b=Q6qLyZCNeJDB+u40/nLLBZGvMw8JNtBvzDxi47rRLvxBJxNmKye1EkEzai5/MDj2Ol
         z+gTgbpm63XsM09tTByWSIuX5ucFp4DbNZGS6lY/yowZ3Oa+r5Fdjwohm+yGgg2I3IkI
         45eLTSsoR1ihLvYSIbXE7K0UIB9Fd5XP4tDdtl7QwvxcxgOKHc0gZY1jFXHcRLHfOAv0
         H5yuHNWvhsrEaJkuT6G9iB6GEpfKc9UlVI/ZTiCaHaM+6H8rJvas/Xn/yJlylbDwtnBF
         76M4qCPtr2IfVCvTUGcX+elmsJAHUA2ya2gx053wTA4anrRIcPLOdKEEteCODHwxjQz3
         JY5w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5e9Ax/ZPC3OaeYRBiPWjclaicfljk2xhVlNeGjL4exr7lq0n7210AnG/W3RhhExt75IbvtbHB84Ry9JgrnTCz@lists.infradead.org
X-Gm-Message-State: AFuF++nv6gs2TAdIgylmSUtdoF3gyw2IVYHG8xxotFk+6nAMm6+JVAaZ
	fy2MfkaM0ovFcDQHQ2+mzTGZeV+ngzMWikKdGhEr+GSIktY/xmnLGJCnrtV+FBt9cEMJ6f49U9P
	RpZ/XWjD3wq5jkeIkyZLKOQ==
X-Received: from wmbh6.prod.google.com ([2002:a05:600c:a106:b0:49b:8bd3:6b1e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr548776525e9.10.1788250200510;
 Tue, 01 Sep 2026 01:10:00 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:33 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-11-vdonnefort@google.com>
Subject: [PATCH v5 10/18] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011003_473666_2390D271 
X-CRM114-Status: GOOD (  14.50  )
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

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 366bbd5c854b..976fa65522fe 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -19,6 +19,7 @@
 
 enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
+	NR_PKVM_TOPUP_HYP_IDS,
 	PKVM_TOPUP_HYP_ALLOC_SELFTEST,
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 7821f2592eba..ea96744f41fb 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -133,7 +133,7 @@ static unsigned long __pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long tar
 	return reclaimed;
 }
 
-static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
 {
 	unsigned long reclaimed = 0;
 
@@ -154,7 +154,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
 	return reclaimed;
 }
 
-static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
 {
 	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
 }
@@ -360,8 +360,39 @@ void __init pkvm_selftests(void)
 #endif
 }
 
+static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	unsigned long reclaimable = 0;
+	int id;
+
+	for (id = 0; id < NR_PKVM_TOPUP_HYP_IDS; id++)
+		reclaimable += pkvm_hyp_reclaimable(id);
+
+	return reclaimable ?: SHRINK_EMPTY;
+}
+
+static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	unsigned long reclaimed = 0;
+	int id;
+
+	sc->nr_scanned = 0;
+
+	for (id = 0; id < NR_PKVM_TOPUP_HYP_IDS; id++) {
+		unsigned long r = pkvm_hyp_reclaim(id, sc->nr_to_scan - sc->nr_scanned);
+
+		reclaimed += r;
+		sc->nr_scanned += r;
+		if (sc->nr_scanned >= sc->nr_to_scan)
+			break;
+	}
+
+	return reclaimed ?: SHRINK_STOP;
+}
+
 static int __init finalize_pkvm(void)
 {
+	struct shrinker *pkvm_shrinker;
 	int ret;
 
 	if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
@@ -377,10 +408,21 @@ static int __init finalize_pkvm(void)
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
2.55.0.897.gb25b4bd76c-goog


