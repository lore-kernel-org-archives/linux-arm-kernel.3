Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5A8C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeVYpUNSyWbGnYXci/m7zUTzHjx11p/EDVKsXzs9OkA=; b=QmTShKqWo9LLJHS0CrzZph2467
	80/HfBZyGrhZHuD8jTKxsQLspe8TPLvwyMlilzw2shYrXeKqrKtNY18nwbyAE8VZzaNMMgFUO5HwZ
	EVreNv1KTaLwRCiknAdNz9Dj6Pmp5trn8djbFm3qcW0QEwxfGuc+B+8nt5EocEVTBkAYjSslmvc80
	jETwBenjoQtcfJBLNUAv8miOTQkprXeWagqmXJfgTiFC4E+Y9v5Nx+Me1QkTR7QN0j05fxyNZ80me
	cwuxuLBWVUW7BlpAeDgRdB0ZzRnWmY5hDZSXHpcF5s3U09/3zCicnOCg94T/xy0uQYqtVGhQ/M5qj
	5qQxcZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLZ-0000000CjhF-2HTV;
	Fri, 31 Jul 2026 14:36:25 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLI-0000000CjXB-2Sdj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:09 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15f4732dfaso111044266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508566; x=1786113366; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeVYpUNSyWbGnYXci/m7zUTzHjx11p/EDVKsXzs9OkA=;
        b=lw3bOZYU/m4pJfSbsM+bTBUs7jsKje1VvwgwjOJk+L9SQQw8OFQC+2g2gbAH5GXBWS
         BUHubitGG2P3ETLDa/8xuiwzZEgIy1T5tZlXzdR4Z6HUCn0OuyEoyQfjLlXf4oOrEE1m
         BMSgSJLOtocvFgETRBb0zu9LG86/DxWqSy2u5T/8pmTutbBCBS9c93bqTcWcEFWJ7NE7
         inU3b0g3kriCyWK6ylDxMjMuwQ+4geblrOd3A/rybdUcmVgx389975c+6Svo1NfmLdIk
         xXR4pmPsvO8HyL/jyNXnPjEN2mP3knKGt9bWgHnFtqMUvDYsnmFUR/3mWuwkP7TeX+8R
         Qhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508566; x=1786113366;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeVYpUNSyWbGnYXci/m7zUTzHjx11p/EDVKsXzs9OkA=;
        b=hNbbpNHO7yd2c9f6wFNsgiAhkS9gO3X0eqrub37dW1Vpv/5krSvKeOiMIU2teWXFav
         AFBpmc2ZtznB4c0bbdm2ShiNe9rcvMmXmR4qHY8zNN1QD7FsVogVEl3RQkDNn2YuL+YD
         0OJiqr3mKfmZmV4izfYzc4esNUU+l3RKtTDj3hkxX9jn3m7y0f3VHaOcAEzr6/6Taphj
         HhpDLaScGbBfp2oAOjaJeA128Wsr7Ot2XGon4UdXUT/TBNHBN9jHoJKuVPGASFAKUq3u
         eKdHybGDpKofbeQilPZal+8tLJ34JCN9ZkQRkKhC0NxclUlxhE740mWtuVQZoGLVdnje
         suiw==
X-Forwarded-Encrypted: i=1; AHgh+RomcMK8X/wDEq41RyftxaS1HKydpQ7tcbhJyB/CXC5m9Bq2HImgs1ee+zZeFNJXqQMEOIA9En1C2GP59/QwHfGH@lists.infradead.org
X-Gm-Message-State: AOJu0YwksSMoEPmXrPwiccLElFDaq1MV/LAHj4ghG440cQwDoZ+1NK8T
	lf1AiJ2wYhl96nlw9+aa3i1/OpuGC5Un0QppNIrodyZAfo92gDsQ6jIW6d/DGwLVRXMVhL4hPyB
	g31UtHFDUrCyg3OQ5/vq7hA==
X-Received: from wmfo11.prod.google.com ([2002:a05:600c:2e0b:b0:495:4a34:c789])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7955:b0:c1c:6e35:aca6 with SMTP id a640c23a62f3a-c1fd2541fabmr142724666b.51.1785508566396;
 Fri, 31 Jul 2026 07:36:06 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:34 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-11-vdonnefort@google.com>
Subject: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073608_648193_06329564 
X-CRM114-Status: GOOD (  11.91  )
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
2.55.0.508.g3f0d502094-goog


