Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A538CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ogMG6FWLsaZmD+0hvaGeTXwDkULMhtfZspxWbbrsJg=; b=wePJf01ZG7pNSu1fGaVTxQ1ZHH
	pwh41LBXIe2MmGlp4dFdGyNVBLBOC04HYVyDD0bmH+xetlKUDOv6Po94BVzVLStmyzBZREJYbFSlC
	l1OLeMybR3TF2+0iPfCJL3wKWEKK1ZajChIxPJhNSIiD8hhgQUfEcRu/dEei9iKC2o+MEkJl3iIUb
	kMrlhslddQe6sQNa0LHkQqsajmWXDDgYGNfqKQ7r51GE4NCDLUv0TBz29YvAM6bOnHxKJEypcgZYu
	EGUHJv6hlm7Tn19ff9fCi0ykdwwbYa3XbQvr3bi/V4ur+rkFRJToKFx9vggk89VQOwKKlSjHPEU8Y
	ht8pA9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmd-00000009NNC-3SWf;
	Thu, 01 Oct 2026 14:29:16 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmb-00000009NFl-07Lp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:14 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso12510185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864950; x=1791469750; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ogMG6FWLsaZmD+0hvaGeTXwDkULMhtfZspxWbbrsJg=;
        b=kaPXmQS+26GynZzhnJgYpes2GuAlwGfDvPZ65pAAC9p6KCHCL88F+gfYWs1QqBCMCJ
         D50PY9BBN99SzJT65C5zO8Oh6buT2TDwHjF36XHPJPApxP4dQMriLsFHwcUOVJilkPid
         sGCvdaIWnUp1qKsQfoCONedfhWIoGZpewZOxMjwdXKa27TxIqCEv8cuLS/58PJdUnfD0
         urTnh0RRf3JkdrZ2WhStPf8me9pa/Cok7e4+xGQ68YKv2g5Lb5E7MJBt1wF9g5mHnV+x
         tIT12HJEHQ8Aliog/OOQpGpkTySEHzsJ5ADxPfEwSJ+Jsss4iqQKZh6kypZ7r1R5CdJB
         Mphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864950; x=1791469750;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ogMG6FWLsaZmD+0hvaGeTXwDkULMhtfZspxWbbrsJg=;
        b=lY/XW7ZokIq0QfR4Lp+BCDWqdg+Bu3CVY3Qy4fQNYcBtEvy3Pt7FucFwJVfDc8rJ48
         1OgGiaMAu7/WjYQRRCAaeN0l0lLTphc0g08lAvX/X1PUevMKEf11y4hLt+d7c06ViHrj
         Pl9kkHsrDS+SuuMQPIWjSE9P3WWWBQs6HXtRf/mjs4AiKUaCAVTd073PaNLLlmESFofy
         3rV7c9TexmIkifmXkC03tTfZcSZI+jc98TFm+oPu9UOP4D0htsVbYYyZMfOz6dA/FadX
         EA30bznZRoKTAa7KcelVI0Cv+OUgwMmueGcIicl2ROTYgSdfr6k5SCxaWHIMU6t3wzbu
         fJqg==
X-Forwarded-Encrypted: i=1; AKwUvBzzJ0MNHsEQMXrUcXeZL+OTztcN+qEzTcAWenTo7v0fwLovqvGz/LqcPAMYjg67m+N0NpjbdXr2QozmXzTKK+RE@lists.infradead.org
X-Gm-Message-State: AFuF++ngwi/R29M4hJYyA5NrOleNq9j0XKxRRLwi9w4Uyee/NTP6kyD/
	d3arMtMReOUBZf1MjYYhXKviBGITuK3LHyKtUBBusIXez6aGGjnHNlopTIwpSBmMvpJ27iqH47Z
	/kNL1Jw4xw+x6M1aJjME43w==
X-Received: from wmmi15.prod.google.com ([2002:a05:600c:400f:b0:4a0:1b62:1284])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b10:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a01b1290f0mr82799725e9.25.1790864949407;
 Thu, 01 Oct 2026 07:29:09 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:41 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-11-vdonnefort@google.com>
Subject: [PATCH v6 10/18] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072913_103209_BACA9D32 
X-CRM114-Status: GOOD (  16.65  )
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
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hcall.h |  1 +
 arch/arm64/kvm/pkvm.c              | 50 +++++++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 8a6c2506fdeb..9f09eb11193f 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -24,6 +24,7 @@ typedef u16 pkvm_handle_t;
 
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
2.56.0.rc1.315.gc6ed9934b7-goog


