Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B63C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVHCPBxikyr6bz94T8wXYfnynt+o8o3vwTA2lD3uomo=; b=v7V83Sl/hVpHZQtd2dUHOEjx9C
	xIdKIu+1kd4qnBPd7zZfCRfUTSipna3OqK1RyOPffSKdQKsjiKy5jz/ZSHtb2nkh4PAG/YpurOfug
	3tXCdpj31RohRknL8mpM6t10HNeqCSI6ihA1g1gD2a6HsNdivOwjwghVSC03Aifzf2wcBqXf8PlrI
	XOUTt7tHatEdgF8zwAey39GTtxlTGXlA8rJ9liS0DzCsEgQ6mTCr3Py01SQXNgdKObBazPinOHFj4
	W4InBYOsem9BpWaO9YYy+0vqpGtagYJj5i93KIvy4L8YdC8xaJh4sOXQYTFM7BjnVMLlOVFmqT3sE
	Ot2K2UyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt39y-0000000Dzb3-49EL;
	Fri, 14 Mar 2025 11:25:02 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt33p-0000000Dycy-2SAF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:18:42 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-39134c762ebso892065f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741951119; x=1742555919; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVHCPBxikyr6bz94T8wXYfnynt+o8o3vwTA2lD3uomo=;
        b=PrdCGMDlbDWh1p9ipoMDZ8EDnGh6+QQRl9mDFez7QpQyW4mc/SWx2rCznoLZlwJp5g
         EEB3dmkHwknCikDgYldjJIyiRtee1R2BYxkVGxR03GCMcf2iSGqJvWbnFgt8jqM+IQ/t
         ViQpPPC/kLhavBHkLV3/q4j64cY3cDuVip9SV/nhuULQiB/lupZMdmyeFH8KRkJeqW+A
         g2exWX3pyTbPVFkfw0KJ+UnXrG3lvOF7H9cAzk5BKvL6E1ExI15/7eV3tjFjO1Us4CUP
         +tHdxdXB2qkRQsOuA8atYqej/pO+QwmgqDUTuBU2SPZb+N0f1S4KJIfvd8Jno5/imWok
         Ku8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951119; x=1742555919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVHCPBxikyr6bz94T8wXYfnynt+o8o3vwTA2lD3uomo=;
        b=OjDiWw59MGS0C2i6Td9IEkltB5iHTxuCANC4nJWGOVAbv6yrozMVvnAVH0ivU2TP12
         xXYFjYcqG8G1NAOvFFE6FVl3jlsq2t0WQEIj80BwvMvDpx4KsfZVJb1Q6aFqW8CmiOFV
         NjgXp43RVaFd22Mzx6Tuvh0FH9nrJVFbGUnFYoDRDe4bXCJaAHb6t8nr9ZppGPqCfJLh
         W6ggFLZz7FGybx7DkzcpH4HIU/XK6wXrnBJLLWhdveFNdljk/kcdqxlJzsNSQNOxP3Vm
         gvQoyWizDyGh/tUfJGeBrsBOMh1aKkWBN0cJ1dsEf4T6KBL4Pa1sftroFB8eFBbMWVU5
         Wq1g==
X-Forwarded-Encrypted: i=1; AJvYcCVrehDYTbFSptqB5lTZArMKJv0RoJTPV4H4gUZVDCcj7QgTrNps92Vq12rykziKAjuM/oscWAjRzd3wuqayKNY/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8JCch9yihMDoCkjMORe+UODOP713dXHip4hI4Q+pwq+wMe+7H
	t2CvF4BpFx3hX/1/8jArR8DP07P/fZaSTjwAjq+hE1U8x0Z5fAK0fExcnpxJDPXjd+3xznNpfg=
	=
X-Google-Smtp-Source: AGHT+IFH3SuJ1uC+yXMAZ9jkckywHcWe5WA9zfg61vMBkH7bJ1po2Sm1vehb5nwh9MKJnjPHma3sjh1qZQ==
X-Received: from wmrs15.prod.google.com ([2002:a05:600c:384f:b0:43d:c77:3fd8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:59af:0:b0:390:f6aa:4e80
 with SMTP id ffacd0b85a97d-397200ac22fmr2439040f8f.53.1741951119711; Fri, 14
 Mar 2025 04:18:39 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:18:30 +0000
In-Reply-To: <20250314111832.4137161-1-tabba@google.com>
Mime-Version: 1.0
References: <20250314111832.4137161-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250314111832.4137161-3-tabba@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041841_623012_4681FAE1 
X-CRM114-Status: GOOD (  12.48  )
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

Initialize and set the traps controlled by the HCRX_EL2 in pKVM.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..6efb9bf56180 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -166,8 +166,13 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	pkvm_vcpu_reset_hcr(vcpu);
 
-	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu))) {
+		struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+
+		/* Trust the host for non-protected vcpu features. */
+		vcpu->arch.hcrx_el2 = host_vcpu->arch.hcrx_el2;
 		return 0;
+	}
 
 	ret = pkvm_check_pvm_cpu_features(vcpu);
 	if (ret)
@@ -175,6 +180,7 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	pvm_init_traps_hcr(vcpu);
 	pvm_init_traps_mdcr(vcpu);
+	vcpu_set_hcrx(vcpu);
 
 	return 0;
 }
-- 
2.49.0.rc1.451.g8f38331e32-goog


