Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510A8CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=My94Drro5rrGPLIhxRFJZRgDXBcGCfTXRc2R8XZoVko=; b=F8paKWiMik6Mf9eds/cO3n0vaK
	lsGR8Tv39Ve124XHZtK/lvP9ao8kIzYLRiGXffWMkksXNvbg8TDwyIkj3hcSozykzIC6EgI1LZ+fW
	JkpJ2AenmKozlwovMggQK4k0u4CR7tfEmg3d6rr3RfaNILIDFf+2xAnmlxuPo1BuP0vlzFI5hi8Z0
	yL3Fd6pxp55rVUs3yQ7/jT36figT5YOWXq4uQPrVtQWDpLLrvQBjkrn6r7RjAEv4JHD53k4aNjKn8
	NENNpakf8IakZY+Uxz4VZCf1JRDNsJcZt05D7bHm5DqgHWm+FJjijGGgM/nuZdJJZNTvUqyhuSjBg
	J/t+7ciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjtl-000000072So-3lbj;
	Mon, 19 Oct 2026 09:43:17 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjti-000000072Rs-3ZGs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:43:16 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c3f04e0e481so124521566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792402992; x=1793007792; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=My94Drro5rrGPLIhxRFJZRgDXBcGCfTXRc2R8XZoVko=;
        b=JZNVgxlXnO4iaG9xtqVuqxGPcb900T7/2MnfyLSnt78361OzlUiwsETsDgYxHsGGC7
         S7qFQL+LbWBB7ItNyw+Ob2YUjoFD52hKNMpNhfd8Rvz+bO2HAzH+dHGOshNvRKwgXdHr
         z6PCikYfb2WKVqP/xxRXO1HYxJZ3mHtRp0kdFptJ8Yj6UWGBTkVuLoS756FNdjCwfs7L
         /6l5gc39MLKKkrJkApIx2zdaGFyV48qLghPptSCiJWVc0VcAYhG0hxovk/d7qQ01Kaia
         rRjR81wM42W7+xCZrP5kLZkFoXv8nUp6rs5FIh9j9fPr+1NvzvG5PDIm8BH6NKGiGlK/
         iz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402992; x=1793007792;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My94Drro5rrGPLIhxRFJZRgDXBcGCfTXRc2R8XZoVko=;
        b=AwN4UsA7ThaISVSjoSsGQXvU2++i8afdbbh0ibUJh1nh+JgcfX6U+2sxGNBlegvIwE
         pu1J3TAPRxtmbalKRvk9sWZlQS+BeeegIEQTHwxYhJZ4lVTbSYmfpBoBsnpHWJEkYGOn
         kVZ5CpT8S+yaBQokLgB4p2J5xA1WhVjADmBWwALWtkdtbnyYhruJzlpgaWBByYVvBYBu
         i9d26wAjL/757plKvy/HKhKOsNcxVCl1D1Ya5s5TLiUYxmkqo0E+shrF8mGBSTRiqDxX
         2nWavP+A+Of0/OBitx3j+FkmOnwhDSOREHuCWruoqb5mtRjggIz9j9HpemODZVp9mijr
         IlZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaSw1tijgAiU2p8geaFrVdodeeMJxnKPBEvJK9zYDvvB5ZzaT/XmeWbF5WWNlcV4Uage0NV664IUMrqrqVMOw1@lists.infradead.org
X-Gm-Message-State: AFq9FYIRsvFbFSaucuMf0J5+1fyOxlRTcr6xo154zWy/hmiSSv9UOSM8
	5zr7zc5G+WxqMspoI/SVaP/xeR1fWzY0/4ag7bid1aioP+DWH1GmTk1KtuS+pvMb/MSmrafHfcK
	RJ7ImUc+72oyj0F14Ow5JJQ==
X-Received: from ejbwi17.prod.google.com ([2002:a17:906:fd51:b0:c31:6800:d19e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c1e:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c419f11c167mr453728566b.25.1792402992293;
 Mon, 19 Oct 2026 02:43:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:42:58 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019094258.1582756-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Move pkvm_selftests() after all CPUs have
 initialized EL2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_024314_951488_63A8F256 
X-CRM114-Status: GOOD (  14.42  )
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

init_subsystems() installs the hyp vector on all CPUs. By running
pkvm_selftests() in init_hyp_mode(), there's a risk for a migration to a
CPU where the hyp stub is still in place which would fail to run one of
the HVCs necessary for the selftest.

While init_subsystems() is the earliest we can call pkvm_selftests(),
move it to finalize_pkvm() to avoid having to export the selftest
function out of pkvm.c.

Fixes: bd93068340e9 ("KVM: arm64: Add selftests for the pKVM heap allocator")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 1 -
 arch/arm64/kvm/arm.c              | 2 --
 arch/arm64/kvm/pkvm.c             | 4 +++-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index e7562770e7cb..fd042d2b5462 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,7 +17,6 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
-void pkvm_selftests(void);
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index d593ba928093..93eac8959865 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -3109,8 +3109,6 @@ static int __init init_hyp_mode(void)
 			kvm_err("Failed to init hyp memory protection\n");
 			goto out_err;
 		}
-
-		pkvm_selftests();
 	}
 
 	return 0;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 380dfb1db0be..016997288fd2 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -333,7 +333,7 @@ static int __init pkvm_drop_host_privileges(void)
 	return ret;
 }
 
-void __init pkvm_selftests(void)
+static void __init pkvm_selftests(void)
 {
 #ifdef CONFIG_NVHE_EL2_DEBUG
 	int ret = pkvm_call_hyp_req(__pkvm_hyp_alloc_selftest);
@@ -387,6 +387,8 @@ static int __init finalize_pkvm(void)
 	if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
 		return 0;
 
+	pkvm_selftests();
+
 	/*
 	 * Exclude HYP sections from kmemleak so that they don't get peeked
 	 * at, which would end badly once inaccessible.

base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.56.0.176.g3575e65682-goog


