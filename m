Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399DEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuT8+oUGsBynEgnzcW+tCpFVQN9FB8Rfc7b2wdhbmiU=; b=fjuvJrXSB9dgZpVcnG2aFiQXsj
	QHCJSRSoUZus7cT5b1AveC6kwiJDsh82CbD11ywnl9KCdgWLYCcH2Jh8ovYLWsUFCWrwXSQrNpmi4
	5zc8Gj8PUP382dNccTAA7ZImFfwGspiOkq7kxD0/NfgSOtvI0h5WO+UcT/R1ChfUbirm14h7i82SQ
	8rzMsbaNbZm4n1NLdEwYmCWO25mTiwrNbPvNmJpfvCOu05FXA7mWo05IGyOQJuzAPiVOOwsg+ll+A
	1bNi/cjEwaH74xC/1HKubnXYGUJUGznkA56c7VHs2vp0xhXVi4TvTrTfbee/nmp+EZuNBlBrorX/+
	J4cfP5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW2w-0000000E4j3-0mZR;
	Fri, 07 Mar 2025 11:39:18 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVyB-0000000E42k-1Hgz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:34:24 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-438e180821aso7693235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741347261; x=1741952061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QuT8+oUGsBynEgnzcW+tCpFVQN9FB8Rfc7b2wdhbmiU=;
        b=ccN9jAXrfFncWC1V64yoLzWqncGsZb0NDH51HDnCOMzjqQu8K4tvi88A0bPUijhzfm
         R1H8bVtzShA9n2uI/nFXWstCxoMUxk+QiMmmjp3goRBtA/uWlSbNwggaO4vJ7KAKeYK4
         hkKESa4BDoLc/C0FWoadFryg3aej56v3BCnoOS6HSpibw16S4aRsI+XaXbdona4JOklA
         CIk3YS34DmkWh6ZDRkjYdG/GJc+8w//Ul+7bJzuHeYv28fpQpMHYcBdXNBk0917JK3Lq
         rX8PV9qGbgCFdf2ArTXfsAEW2ilQ+JbUQ/AXnP3WA1e8+v3WohG1TfY0dCHHNVJAmH/Z
         6XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347261; x=1741952061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuT8+oUGsBynEgnzcW+tCpFVQN9FB8Rfc7b2wdhbmiU=;
        b=ooQ1SPJ6dps6eiT2AF67GL/M4AhHs5yXQXIh9W854MDkKRVRT3Hx/kPZA7iR2W00aG
         o7YbXcAYYhvMii21yXwJQs5kfwbcumxtZCs8IADRKC9VDCRowbpjTm2BMwueI/BeywtG
         MW4VcqFhbDPFSmKk+/LVUKhzWFlPUmAUJVlNgp/dAB/QqVNL8WwGDLEJ0SZ1oTEOVepe
         7D4WPuYsLMx+P3TOuFgI0m2mpLQO9DxiXdQ2Kvi7YivsPCwawKlvY4jV22qMxFRPfvAR
         U3qCMM3HVhHwUAB3Lxl3ILymmf1k3xx/24h55KcTegU+O3Uw8iOtzCiGxM4cXbtzYFjj
         IAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjw375eTzjEiMUdkpTk0dOhoZr82F2PketwwYF8vE8bZ8Q4F/BTeY6+vk+0lTfgxzIRNGdFAjJ8FUEtTizKkoj@lists.infradead.org
X-Gm-Message-State: AOJu0YxvPfVIPn9ZYEWwzvv50F1xBg+AYFlmfd6tBFEpcMBj1VtErHK1
	ZqwP70xE5bE2tIpE3d/RujcCr+EygeXSqNcisNVVZYNYD0NUsxcTMvj47HMtC7ZiFzY/Q1bNyQg
	Q5Z0YB3ZPGfTsZRi9cw==
X-Google-Smtp-Source: AGHT+IE5ohZTOn+0c6BjasjJlIh0P0Oc4mdAIR1nvzh8MTc0ThPVpUeGzQhz5Qwx85rHnQz0WNel/HDvkjZrlgFj
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:439:64f9:d801])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d01:b0:439:84d3:f7ee with SMTP id 5b1f17b1804b1-43c64db0d9cmr17578165e9.24.1741347261332;
 Fri, 07 Mar 2025 03:34:21 -0800 (PST)
Date: Fri,  7 Mar 2025 11:34:10 +0000
In-Reply-To: <20250307113411.469018-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250307113411.469018-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250307113411.469018-3-vdonnefort@google.com>
Subject: [PATCH v3 2/3] KVM: arm64: Distinct pKVM teardown memcache for stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033423_344751_35F9728F 
X-CRM114-Status: UNSURE (   9.56  )
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

In order to account for memory dedicated to the stage-2 page-tables, use
a separated memcache when tearing down the VM.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 12691ae23d4c..ace3969e8106 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -246,6 +246,7 @@ typedef unsigned int pkvm_handle_t;
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
+	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool enabled;
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..15f8d5315959 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -678,7 +678,7 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 
 int __pkvm_teardown_vm(pkvm_handle_t handle)
 {
-	struct kvm_hyp_memcache *mc;
+	struct kvm_hyp_memcache *mc, *stage2_mc;
 	struct pkvm_hyp_vm *hyp_vm;
 	struct kvm *host_kvm;
 	unsigned int idx;
@@ -706,7 +706,8 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
-	reclaim_guest_pages(hyp_vm, mc);
+	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
+	reclaim_guest_pages(hyp_vm, stage2_mc);
 	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->nr_vcpus);
 
 	/* Push the metadata pages to the teardown memcache */
@@ -717,7 +718,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 		while (vcpu_mc->nr_pages) {
 			void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
 
-			push_hyp_memcache(mc, addr, hyp_virt_to_phys);
+			push_hyp_memcache(stage2_mc, addr, hyp_virt_to_phys);
 			unmap_donated_memory_noclear(addr, PAGE_SIZE);
 		}
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..19921ca407c6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,6 +111,7 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 
 	host_kvm->arch.pkvm.handle = 0;
 	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
+	free_hyp_memcache(&host_kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 /*
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


