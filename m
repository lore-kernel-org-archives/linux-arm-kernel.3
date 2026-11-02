Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0LPb87IT;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SubT2QF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PzxpOf9GSU8BWppDC1NmhSxLG0SFtPxkYuGCabdeGqE=; b=0LPb87IT2btn3/22eWnY4F9ht+
	DXj4/nnGO2E3odhogOxsDlAZ0dFgrsBA2lxd2Zo7MwoyNbmjtivdH/AOm3IxFx0wCFfFXASCebhvn
	ULkSvIZ6NpxpU4L5RPtdn2NXcqAw4wQbU3mAj8by78xphC+nGLW30F6cXA1B6rNp96WU91NNDGh44
	FalTDmkQQGCTRvQGVqgE44l68BnPjoECWVeBw1jjMVH6ECA3lclng9yCTcucIcTIprY6iU9VQNLr/
	VNxWQimtqyJS161l99CmsWFACeorYiuO1U1xzClxL8za/pzMkV5uPW3jGOMMK/pntRsCLqhL/38jn
	qmuUhGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywF-00000000O27-1c1d;
	Mon, 02 Nov 2026 20:47:31 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw4-00000000NlH-3QCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:23 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48c4445512dso2824212f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652439; x=1794257239; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzxpOf9GSU8BWppDC1NmhSxLG0SFtPxkYuGCabdeGqE=;
        b=SubT2QF3RM8QxPhFSKh/YOhoG/XkMfFhRBsthKGv+1oRnyVdL6jNiYs4lbvq9oNiiT
         cu7FLxMk0VujDer7Erx6aFARE7NYiWrJpgtG7I6g0PX70t7Vz8Gi9wy5fERNYKJKrnO4
         RAbtLRe0vzr9vys5Krl3ti+a0AyG1ulA1wWOC72qeMXC5NZ+2SiB07AcxtlZ6glTHL0m
         16Da6dbph1Msrpj5DphEFdpEJbYA8jybOLgOjLWbgDSv7xSedGGVMmD9HmOLEVsIuMvX
         JwwbF5wQAthyLrc1Ah69luzW1pe9u7LYweQkX9OchDK3j1a0qP8ak3Ivqiv7NSsVxltp
         sdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652439; x=1794257239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzxpOf9GSU8BWppDC1NmhSxLG0SFtPxkYuGCabdeGqE=;
        b=BrOXoC4ml3c72gqikv4Jx/cbdrtb59Lv92f7PfkQWhPLaCFwZbEaPdlgfaHFET/5av
         ELm+3ZyrTWaa5xxHjG0fnEMiALOwNjBNRgghea0/K8YAmvlIP1kwSKdOjPpyn9rZguBN
         LTZd+dyb3Xe7jaobgg3BjlLPcFh7ruelwGkvHZQJfeq+zuNYxbo4HlG3m7xYyVa9pgXv
         aqL11GtiD7sMmfflmSOduR4nGzDuG60BiZDgd/fieLlzAep7xlQGJbGR9CYm9jZycVn6
         OKCB1drsTHeqwVQ1F9Is8fGZlMvMSFu4uBTIxs4I5v9fLhW9yHUA016H5HRr8i2plGtQ
         TOFQ==
X-Forwarded-Encrypted: i=1; AKwUvBywe/2zYh3sIDtAmicpKTkmgF03I+fY7jbpBg39s10SINKR3x55xOsGK8Xig94zw5QkOrLzmQFc6j+KJ9VfCojJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+eXIYZm6Aq2SYnr+heViRDTqvtvk23/25FclWFNSIT5Xc58l2N
	yI70heuP3ISl0xNXWBWZxPbeKewxRdX+T2GhgtIbk8fvT7Eb65xwXFv5PnnmlU5KNw4RCACYnGz
	7Qwpl+R9fbQo4OvjCPzJZag==
X-Received: from wrri2.prod.google.com ([2002:adf:fc02:0:b0:48d:fd11:11f2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a0a:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48e71a3e74cmr23910206f8f.33.1793652438679;
 Mon, 02 Nov 2026 12:47:18 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:21 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-17-vdonnefort@google.com>
Subject: [PATCH v3 16/23] KVM: arm64: Warn on pKVM guest stage-2 block collapse
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124720_979254_9B420AB5 
X-CRM114-Status: GOOD (  10.91  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When pKVM is enabled, the host relies on a pkvm_mapping tree that
mirrors the actual hypervisor-owned stage-2. The hypervisor is not
allowed to silently split blocks or collapse page-tables. This should be
treated as a bug.

Therefore, WARN on guest stage-2 page-table collapse which would
otherwise be fatal anyway.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 751f76d3ec39..88af0aec1ea9 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -226,6 +226,12 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void guest_s2_free_unlinked_table(void *addr, s8 level)
+{
+	/* We should never collapse guest stage-2 tables into blocks */
+	WARN_ON(1);
+}
+
 static void __apply_guest_page(void *va, size_t size,
 			       void (*func)(void *addr, size_t size))
 {
@@ -294,6 +300,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 		.put_page		= guest_s2_put_page,
 		.dcache_clean_inval_poc	= clean_dcache_guest_page,
 		.icache_inval_pou	= invalidate_icache_guest_page,
+		.free_unlinked_table	= guest_s2_free_unlinked_table,
 	};
 
 	guest_lock_component(vm);
-- 
2.56.0.385.gac671c819a-goog


