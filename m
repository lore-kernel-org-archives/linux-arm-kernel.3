Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0313CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bnvq1QIttg+jEVzyus+aeQRnJPtIx7MHL8/OhLal3DI=; b=TkgjCKlmQ3zJ5aYTIt384W2WnJ
	Gv52lldskps5xUD02NucuQkcGn8kgTryE0A+mCldPpywMYox+cjbIvV3DxaiNV7/Amsc0Ks1h4+Fc
	mS/udmFa7mVf6q8mRQlAMH7bASzIq25z62uZ1w4Ld5AuU0EIyNnRYa+pVDuU4FPFEyN92y7hzUys9
	itSIr4o6gTDlIZT32MYj5he+RhkGZhxWjm3Lub3NosBXQySMfGyoaWcLwycITXLKQ1GvJ5Kdl08at
	vZpeo0gu6PahKnP8IwKrVHwScJ44wN2fShBLn5IJXPHkCEF3+cUAyQUCHKWJCtYDvYPG5GMLGSDiS
	CC5zEEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD9-00000005VtB-3N23;
	Mon, 10 Nov 2025 13:45:35 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD6-00000005VpU-1dnl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:33 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b6d4f19c13cso307082966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782330; x=1763387130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bnvq1QIttg+jEVzyus+aeQRnJPtIx7MHL8/OhLal3DI=;
        b=fbpN0kejoRdToRVB5k2bXQeXfhvAvjQTj+cYr9D3/fFjDNi178RyIczipAAEiqPC1W
         8+3Ub+Cp7qU9SRwIf8pXJefBuPdOGTi8bd6fsT8UMOCK86VaXGNMHSjVXSOirdX/EkhN
         I2bcoD6NmAxpvmZVOi6TPQmdA35/+OmGvMhlPCSV/iky70zHTyivJfyFBnTOYOlN0XWZ
         wySh7px3r06FTuaoi6zXxqneQ12QkpJAWfP3Z/gWkyf3ezuQmHT5sO3Xav77TTviaPER
         PB7BHa5tHll20ItiKHFbVqNOZ1oun79DtxGsZkOpSNnG4vwggEU+LmasG6T3IeviNuxW
         ZNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782330; x=1763387130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bnvq1QIttg+jEVzyus+aeQRnJPtIx7MHL8/OhLal3DI=;
        b=DZhhzG3MMfQ6d+vKWwBE4Tc6chT7DbiC6I+8gCbzZjEK8CByDsM8AQC+PvA6Mw/hgT
         Gc3xzSvGfRS9tEEdgtG5ZACbiWQFH8qVDxsL6qT7M56bW7Rd8CRP0qdLyhdlyBca06bu
         ciHRsOp6gdDLIk6k5P03LNGZBSsH/8HTeazC84NDcxj31j+PKIwhr6/+5cZmlxPcS801
         UqtYuI1lzcZNDk+1ww6t4vlbAFVCPfvmmL4wZFueZYOv9svllH+jM1wymNaZ4OvnVVcq
         /JauVGz5VGXj7bacSxO6RYzhFpFzUoXvtV0CZlcF6UMZ0RLYq2zQluXDMcrAd+AQclEY
         1/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUiioZK2qsc0ciUTXyyxDQzsv3srBZVsQdN/ko8edCAqUIQcTebQwVaN0usvhanoyT7xXlDbPKdwssaS3AHIt4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUowD85/M4G51a4isemJGeFgvEylqwv6DypQgXnEdeoL5AuZd
	whVLQELulWXeYzBbCQETrZJ2sCeIFPaZQ1LDAZmFamVL5ii3Gg/UjnuVAoNj3s4dF4oMAibkkM1
	JlQ==
X-Google-Smtp-Source: AGHT+IHBjjL408OQ3kUNaY91Wy8G4uCCbmn4Vyrmppc2YqMZNLLoI2tXfPCB9UVbKq0+7zW77SJ6n9+EYA==
X-Received: from ejctb24.prod.google.com ([2002:a17:907:8b98:b0:b72:d021:e2de])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2da3:b0:b72:7601:a321
 with SMTP id a640c23a62f3a-b72e05be4f5mr836051366b.57.1762782329966; Mon, 10
 Nov 2025 05:45:29 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:20 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-4-tabba@google.com>
Subject: [PATCH v3 3/8] KVM: arm64: Fix MTE flag initialization for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054532_443194_88F412C8 
X-CRM114-Status: GOOD (  15.72  )
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

The function pkvm_init_features_from_host() initializes guest
features, propagating them from the host. The logic to propagate
KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
has a couple of issues.

First, the check was in the common path, before the divergence for
protected and non-protected VMs. For non-protected VMs, this was
unnecessary, as 'kvm->arch.flags' is completely overwritten by
host_arch_flags immediately after, which already contains the MTE flag.
For protected VMs, this was setting the flag even if the feature is not
allowed.

Second, the check was reading 'host_kvm->arch.flags' instead of using
the local 'host_arch_flags', which is read once from the host flags.

Fix these by moving the MTE flag check inside the protected-VM-only
path, checking if the feature is allowed, and changing it to use the
correct host_arch_flags local variable. This ensures non-protected VMs
get the flag via the bulk copy, and protected VMs get it via an explicit
check.

Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f6f8996c4f97..7e370e31260d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
-		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
-
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
@@ -372,6 +369,11 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
 	}
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE)) {
+		set_bit(KVM_CAP_ARM_MTE, allowed_features);
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
+	}
+
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 }
-- 
2.51.2.1041.gc1ab5b90ca-goog


