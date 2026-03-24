Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F886FEC0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWoPOwuwSHWEwP+AulKEamMmUHfmTMMDJl4jnL/FRPc=; b=NJ9MSiYoSq7wsp4J2dVle3xq69
	UiPQ4gzB+gt1timEnFfYxdxGoiHwdB+MkBfD0NB9IzylusK9hpIy4a8eJ1ZFFNKFCyMU2+R0FNPS4
	U5H5CqULwoyqFEfj5haFRtBvT1QYN44ZqAxoySWVbdrKCGLJLfzkmQC5MJXO+4YYzN1F7FCWtWqdW
	ke8WzFX2+wBmznenV6hMX7Hh8ildwkz6dxLqStKYP5YfVAz9p2teb97utJLiSwMmoroGkZ6CTRsgv
	oYsCijhP92TENmXwfGLBHjIzOhNgy87dcrRnaBUwP71n/NOF/kGQLSRNDb6OGap/h0YsktjGEL3C2
	7pRKs8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55YJ-00000001zuI-0cZZ;
	Tue, 24 Mar 2026 17:28:27 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55YG-00000001ztp-48Dl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:28:26 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b97c2e6f6daso912210466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774373302; x=1774978102; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gWoPOwuwSHWEwP+AulKEamMmUHfmTMMDJl4jnL/FRPc=;
        b=Djm0Lw9uGQ7qKzDJcngVofWGfItNW6O37gjZ2zJ4WfWNOx7ulEDiHF6GgjBK4lsTFE
         OdPUxH3x8wWVFauqf+HuNLRJ0JB9x0Xpb8x8WMChS6pJBFf7J4vET9HEUNuigf86il8T
         YlYdPrINGNPhLs7Rmh973MMTo3gSVIOvnWQWN0up5sTHGzYcCN/ZCi1LjWDeWFT/nLAC
         WLHauH0VQfvqY2EO/jyQAVjViFUKpsNphCwadI1G+ebgmTHbchvRKdKGeWnbiPyq+2Jw
         XS0qRtVgB7bAp+s3UObAuHmqPObCRWGXuRXH8PyVTIMYK2WDG1tqlrVAG39R36UNIf5x
         /SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373302; x=1774978102;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWoPOwuwSHWEwP+AulKEamMmUHfmTMMDJl4jnL/FRPc=;
        b=LO48dB8uvDkZlTzGcljMeXjYJ8atpPkpSLtFa7m88p/ETRMGHwUZrnkwJZAvadIBLR
         3302DYI52JenafmknjkfuQG30t8gRgqFZQ7EMATRgYE+j0HKxEvFqwWEz9FD/lX+Qclv
         5NlXkb5GVt5Jq25/+cons58Lcq/i1KLDPBM37UGMi6MVzaIjE+9MKj6Q2zeqmrEJya5r
         tCdTlesRpVWmthq/LnHsLsskXVbqv5UT0DMMrWsjjmbBzrwjVAb1L6rNti6PHYuyJ5tY
         7uFTJGkxSR9VlnGyxs+aePknstuLyPyzCCzSWeULejfW0A3QDdXUaTJQlFvDL/rPxFyG
         LCyg==
X-Forwarded-Encrypted: i=1; AJvYcCXHeT3QRusjCnR8CChwh86fVmaJ5b0QqEOztua4vhDVZQOiaziHOmN3ANNdOEarfIrfCbWtmrkfY2ohUGONEUku@lists.infradead.org
X-Gm-Message-State: AOJu0Yws8/vTllP1yRk9yf6LIdSGRnCeP92dqGM+bkKaPUi7o0KiL+Zq
	61IzfkDvej3MxZLiccOrSw/vVO5ohoEzLiVqZ2dypIIVOkJwMVj7d5pW8Rbcv8syToQa4Toljqu
	c5/qfN0+uqyZlR3qSOATl8w==
X-Received: from ejchq39.prod.google.com ([2002:a17:907:3f27:b0:b98:4a43:a55])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1681:b0:b98:6a8f:78f4 with SMTP id a640c23a62f3a-b9a3f1a0210mr19003366b.17.1774373301993;
 Tue, 24 Mar 2026 10:28:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 17:27:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260324172757.2147153-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: pkvm: Rollback refcount on hyp share/unshare error
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_102825_033017_9F3EDC63 
X-CRM114-Status: UNSURE (   8.16  )
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

If one of the HVC __pkvm_host_share_hyp or __pkvm_host_unshare_hyp fails,
rollback the refcount to ensure the hyp_shared_pfns tracking reflects
the actual sharing status.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5..0fb41d2c8b44 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -493,11 +493,17 @@ static int share_pfn_hyp(u64 pfn)
 		goto unlock;
 	}
 
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
+	if (ret) {
+		kfree(this);
+		goto unlock;
+	}
+
 	this->pfn = pfn;
 	this->count = 1;
 	rb_link_node(&this->node, parent, node);
 	rb_insert_color(&this->node, &hyp_shared_pfns);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
+
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 
@@ -521,9 +527,15 @@ static int unshare_pfn_hyp(u64 pfn)
 	if (this->count)
 		goto unlock;
 
+	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
+	if (ret) {
+		this->count++;
+		goto unlock;
+	}
+
 	rb_erase(&this->node, &hyp_shared_pfns);
 	kfree(this);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
+
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0.1018.g2bb0e51243-goog


