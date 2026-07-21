Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3871FC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z76iw/uyYgGfytOiOZ22580VeGLYiQlgTYWmVZJjXYY=; b=qpjeCR+2V5uGdfMwepV1pwZc3N
	IBNCGBExiWWJJHpeT7YE1Ut2CjLS1gUJW4m0ilCdNH1NXSuDWH56a3cFugpwO3GQ/pu2UtPPKCjGy
	FYwEVNxxzXDa5lPfQaiHiecg76TGkByd8eLBoEix4zotiK9CHApHnM57LuCC5T3aBLk+Sw08964eK
	4s4tIEs5eP8MGw0IMpipBN5b4kflmebo29WFpzIIp+X4mEg7oB+oTtEyn46vQhCqe/pFTLSgJUjMz
	yXKw27VfA7ypHtiMPXBWZYUiWcjSQpKnP3Wdt1tJoMf8tkPLTR4TiShA0JBPMCzoswy8vwQaBrhsv
	ajm6Ha8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6HX-00000008tVM-2k6c;
	Tue, 21 Jul 2026 08:56:55 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6HV-00000008tUK-11cb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:56:54 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-47f529eac88so5670937f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784624210; x=1785229010; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z76iw/uyYgGfytOiOZ22580VeGLYiQlgTYWmVZJjXYY=;
        b=wb8J91ILwFTvnENn2e3hiW+q7ZBcxFuHtINvwOWvI0uyJmMpx1eaygWCMK7K2UM3tg
         VvHKhlI8p24IBlzqvcqqN5PM8QvnuDSUSzpAjoeUm781f1gjKZWg0febqH8HxnapYwKn
         h2offcb5BbhgCP/x2tlolP8nyr8HDMTLIkpb/tj0VA6TrtbNt9hOmMJsKog/6zWu//O0
         wdEyfDEm0GwtE0dsCZOQVpXsuJ/GH8Cz7ITSnBoSioyhAgvdV0svmvIYtYwuEWyaOa5I
         DkthuNIiXFgA7VT2VBaV7rdJnK1fkVgUvXniPdV3RZtuogQhWJ91KTe2kWscaXy2k5dv
         QMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624210; x=1785229010;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z76iw/uyYgGfytOiOZ22580VeGLYiQlgTYWmVZJjXYY=;
        b=AXUox/orcwuiGpB7e1J1/G9xbPjCEXrGVHqttq5UpAGlx+OKsQu73Ye2bVPf98pRNY
         NIXc1oF36dsIGEhK8mBkim32EzQuyJ7WmH4e3Sj7WcaQo2oFSQZa/BcpQ5VLbe9/QV1W
         lawXQVoCXcWp3bIBxEKg4wLaV4JGxCPyKYKJzNLtLd7oCoLMDf81RzQWHGZJ+6rq9RkD
         5cirX8qZwpUGvTpPHG7VmeZJ5SpEAGmRCRcWAzUhvdtj9+YZRnK7osWG2CYxNhEeVPFV
         d8tqPotDG2vfesS17GxB2fFgIa9VpYplDxJD0WglHUN6Npal2AA9nQ5gtLDmkHkn6Si9
         KzSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTq5nYMXw9p1GuplGqc5BbKdfWm6nPb99lXmN1CqdAuIieN8cNwrRYKWJL5IRjVHhK7EUe9LmvZelhQH/CK2Ic@lists.infradead.org
X-Gm-Message-State: AOJu0YyewVr60TCU2IM8Nx6WLIHFUCiu2oEnZzS5eHQAGQeJp8AgoI07
	JOwUBhpNhh3xGz+G3CGUWQD+1H7Je5Qwnj92mvyAnQqLP4CUGO9jhXG11hfCLgR9JOeK0ZmvhM/
	AIeWZirbEwn3G4A==
X-Received: from wrtr5.prod.google.com ([2002:a5d:4e45:0:b0:47f:40f3:b18a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f51:0:b0:47b:5f25:7c59 with SMTP id ffacd0b85a97d-47f6231c5dcmr20981425f8f.38.1784624209952;
 Tue, 21 Jul 2026 01:56:49 -0700 (PDT)
Date: Tue, 21 Jul 2026 08:56:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260721085646.1660673-1-smostafa@google.com>
Subject: [PATCH v2] KVM: arm64: Optimize protected mode and FWB
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_015653_287638_3C6B7A44 
X-CRM114-Status: GOOD (  10.81  )
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

KVM opportunistically enables FWB if supported by the system for guest
VMs, which allows it to elude cache maintenance for data as they are
forced to be cacheable from stage-2.
In that case, __clean_dcache_guest_page() will immediately return.
However in protected mode, before calling __clean_dcache_guest_page()
it loops over the range and fix_map/unmap it, issuing TLB
invalidations, dsb() and isb() unnecessarily.

This can be optimized by returning early if FWB is supported,
kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
functions issue dsb() for the unmap path.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4e329e39a695..049a09be2bbf 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -261,6 +261,13 @@ static void __apply_guest_page(void *va, size_t size,
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
+	/*
+	 * Guest stage-2 uses FWB if available, making it safe to elide CMOs.
+	 * In contrast, the host stage-2 never has FWB enabled.
+	 */
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		return;
+
 	__apply_guest_page(va, size, __clean_dcache_guest_page);
 }
 
-- 
2.55.0.229.g6434b31f56-goog


