Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3C7CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BeUgYoR/kz4RmvWlSaqpx7UbEQvpm7Z+waUKWX+x6Y=; b=v2yuh2lBwyKAcQ0vOi7Kdnmbw0
	B/3EyTS51LCFA7GefmT7FDxRjy5q3kixsoLc3Nn2ckFnGnnEvr44jkHoAzb3+1hdSUA5ARDukUPma
	6XdSFTnlg94QgZy1e9CNFI9L6A7Z68+o4hJuG0klF4lgjuZZTcUvFIvCwPrY5R8HujXgJzMjvx3Cm
	HLKKhBM4SnjS6mRZF9iHlnIezAG8slWb2E78ISIBPvkp1JJ3W7msmNAQwik8rk0RQ0q3TgWx4KBCj
	A3uCNwZIVVD5NGoXu3KCr/FP6nL9VWQcmD5CUuZT5UZJlf1nJEjtRmffvJyhkT3TBjSYiWcXV4ZT/
	kCZ/q/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipj-00000004zJH-0xll;
	Wed, 20 May 2026 15:27:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipU-00000004z6G-0LuL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48d1bc85bb3so18125455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290846; x=1779895646; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BeUgYoR/kz4RmvWlSaqpx7UbEQvpm7Z+waUKWX+x6Y=;
        b=GRrdpg750TSQegk+3AiUK2Wc3BT14pMEvvSQvEKcC4BEf0TBlZaEY8NoUR5UPKLB2o
         IU+jHJzbhnCgdCZFicjKhph330cSZEdlcrtmtjK1JaQUjMvHdjCveQNUTanFW9soP1dD
         M8oPdSW+3ZSAd+B5TzLKzmSQG7EZywllil2R47OLLrHeJeRQnwpmusTKZKzvK4jf28zh
         GpXBx3nMyBxec752qOKjaeAf93BJ7uSYWPMCUYHlBM3/d1zt3/D+feoFJ2kDjuCWQnSS
         sUl4kRL/uuRhtcJ2deQlkV7Au8gVElcdXCzCsUtClWoid7fVvl+9nNg8hrnGW0cw/E+4
         cZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290846; x=1779895646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BeUgYoR/kz4RmvWlSaqpx7UbEQvpm7Z+waUKWX+x6Y=;
        b=ibBVFtvrXQUv8naog1KOdVt+UO+uU+PaRYl1AabCxuxvcpLmdYaoFlwOY9j2GC6Gbu
         oCMnHR+I0i5PyTbw398b82wPmgih0dkgSVrdSqobq4kuoMFlmmPCjAIlqOVptgV0VuKh
         9whd226J6nOFT291nyG47ivneD7mdrppIW+ochPfHZJgl+jBS8vKX2AlDAdTALHf8cO/
         krS8rF++MMWlXl98C0KNNGMfY9i9WlDwCUHPL3e1RDG3Qn8n3Wns7BFXBa3y6nFY168i
         U2fVMhsT3AI1M0006nVDNjsVnMSQ72RYZ13CUDJ+GaYXDo7qJMT0SnoQDDveEdxctbcR
         rxmA==
X-Gm-Message-State: AOJu0YzVkMLPxzD7KPGb7qPz54g6TQKqUPNA7ksJCFirrr1m+1cc6Dbm
	Raw74J43bBbUF33IO6v1WsLX7KJOfDBi7urezZIwUDsTI6NSxEVxfHBnZGPlcFWacBvhB0ZUQ8h
	/RiJFl0ipmXLd+dPr81JYhw==
X-Received: from wmot15.prod.google.com ([2002:a05:600c:450f:b0:48d:1bc8:5961])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d0:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48fe53774b4mr288092735e9.8.1779290845797;
 Wed, 20 May 2026 08:27:25 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:44 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-12-vdonnefort@google.com>
Subject: [PATCH 11/17] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082728_129919_050D43F4 
X-CRM114-Status: GOOD (  11.32  )
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

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8bb2c7422cc8..34e6fab29210 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2677,6 +2677,18 @@ static void pkvm_hyp_init_ptrauth(void)
 	}
 }
 
+static unsigned long
+pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
+}
+
+static unsigned long
+pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
+}
+
 /* Inits Hyp-mode on all online CPUs */
 static int __init init_hyp_mode(void)
 {
@@ -2823,6 +2835,8 @@ static int __init init_hyp_mode(void)
 	kvm_hyp_init_symbols();
 
 	if (is_protected_kvm_enabled()) {
+		struct shrinker *shrinker;
+
 		if (IS_ENABLED(CONFIG_ARM64_PTR_AUTH_KERNEL) &&
 		    cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH))
 			pkvm_hyp_init_ptrauth();
@@ -2843,6 +2857,16 @@ static int __init init_hyp_mode(void)
 			kvm_err("Failed to init hyp memory protection\n");
 			goto out_err;
 		}
+
+		shrinker = shrinker_alloc(0, "pkvm");
+		if (shrinker) {
+			shrinker->count_objects = pkvm_shrinker_count;
+			shrinker->scan_objects = pkvm_shrinker_scan;
+			shrinker_register(shrinker);
+		} else {
+			kvm_err("Failed to register shrinker for pKVM\n");
+		}
+
 	}
 
 	return 0;
-- 
2.54.0.631.ge1b05301d1-goog


