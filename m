Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913BFC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hce1wCI+iJiN9AXNLgcvauNehWwU2rw17tT7g22I8ig=; b=N+mr0ABegJbjXV/l1pS1vhAjgd
	E/scpPHIOdT/7ThVSfV7OyU9B9XmcI95+BYKORz2sQIe65jiogvxT97tbSSVjlEx7/pEggJ4aYPlb
	aKoqrO11Whr5UxEv6CLDkVeoYXuOMPrwJ06Xq4q9scKGJxknTJ8iNWn7LllzleoiyEk0gdPmQAi8r
	OKiaOjrU1iLeZaNZG2WUsUycluj5pG7gBSeI2BU0BvaTQBF/7T71rz4sFIADp2iQVwNY3felQxYSE
	YI40mPH8NCg2VZAs8t71qJhCZEcOu/X8Pf3zES09frwxpIncm74SXZsRAerbQmeH7SYDBknsj4bys
	HzrsHYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjm2-00000008cmO-0d2F;
	Thu, 27 Feb 2025 19:42:23 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniSR-00000008JDC-09rq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:18:04 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-390e27150dbso1039726f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740680280; x=1741285080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hce1wCI+iJiN9AXNLgcvauNehWwU2rw17tT7g22I8ig=;
        b=X4pjO/F1nGJ4Y4cMWqG5Z78FgHWCDMObH7a8YjjJUQBKPBZ/uk8+UDQnz5gJjCqqD6
         /Y2m1V1lyUwKN/tZeNiR7FaC/VlOklIyOaprEk4SEtrPaomVWvxEprtlVgFzjnYllOsW
         dTzxWsD+UtH9o+F6y2TqCDpkAI8wAx/wQ1v+15XqsL1mxO/+XZW1fKDH8mr8/KcxJyNa
         ucDQhBYP9x26AhEvWUMn1TNsgIWnFwZdhnm/zNZYLjmt4QCe4Ftsca0T9jpgNQXQsIb9
         OQSAycAUgy9nl3DRUyA0OfObNKL1RYZiswDEABR6BnoK0KtgYRR2PqaqeUl4GsbI8x4s
         Xulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740680280; x=1741285080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hce1wCI+iJiN9AXNLgcvauNehWwU2rw17tT7g22I8ig=;
        b=DXWxXTLo9LyFeWFYT2TMcNCYdsWzAij0FfFf1tOwjeac8iUp6U+WZtfJSLm7fp1jZ1
         C9vfD+n5XpHYidNGOdp1DYYyuuMuJmZAh14Coo/LnyvjCEUXzBRu9B8ZKzv3UcGDv2K4
         TKxdGM2JtE1PcxucMClHw8HbzgiRKKFTba7+YM5puIrWF1ZINPxyjkHnNHNWNJMLjU3F
         DApXIBPmNL4NM+n0oMdBdqJQhZ7qjNoha53As/hZ+g1C+NP5zECsjXrQtW6al80BuI7Z
         Hylevjm6luEkXEIRWZKT4Ay1oHk114qujf4sqzwVYbg/TkKzYGIqtZHaKA2OWtdDbc18
         qS7g==
X-Forwarded-Encrypted: i=1; AJvYcCUkOvHrYtqMk7mg5e52C0+NP64t2g1d3hos6mkJbxXMNojKyUHSnKYTOuZP/IRZV9AywY1AF+JKHp9rrNVNspm8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Dhwcw6mYiBVPqpowP/+omS5fmpHnQwQJc04eF6RIZ2ZBwxtg
	/hU9MMcvITWOPCHsuKGz/7gtApB9xdqtpfYDZl8GWJu8/qQgQ+cv4tH5tExA8YTKsthobKIITwf
	EmjW1elu7VYVLmAUBPkYL9jap7w==
X-Google-Smtp-Source: AGHT+IFKf38sjXhANJwnxVv0t8bQO3XXUn605hIGPZLim6GWv0LFywIR25WQ1XrK1YmlUszpJyRh8MP2vxl9ngqoV7c=
X-Received: from wrbgz3.prod.google.com ([2002:a05:6000:4803:b0:38f:4458:9c7c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2108:b0:38f:2289:90f1 with SMTP id ffacd0b85a97d-390ec7d20a4mr172276f8f.29.1740680280768;
 Thu, 27 Feb 2025 10:18:00 -0800 (PST)
Date: Thu, 27 Feb 2025 18:17:48 +0000
In-Reply-To: <20250227181750.3606372-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250227181750.3606372-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227181750.3606372-4-sebastianene@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Map the hypervisor FF-A buffers on ffa init
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_101803_074523_6D13BC2A 
X-CRM114-Status: GOOD (  16.51  )
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

Map the hypervisor's buffers irrespective to the host and return
a linux error code from the FF-A error code on failure. Remove
the unmap ff-a buffers calls from the hypervisor as it will
never be called.
Prevent the host from using FF-A directly with Trustzone
if the hypervisor could not map its own buffers.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 6df6131f1107..861f24de97cb 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -69,6 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
 static struct kvm_ffa_buffers host_buffers;
 static u32 hyp_ffa_version;
 static bool has_version_negotiated;
+static bool has_ffa_supported;
 static DEFINE_HYP_SPINLOCK(version_lock);
 
 static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
@@ -111,30 +112,18 @@ static bool is_ffa_call(u64 func_id)
 	       ARM_SMCCC_FUNC_NUM(func_id) <= FFA_MAX_FUNC_NUM;
 }
 
-static int ffa_map_hyp_buffers(u64 ffa_page_count)
+static int ffa_map_hyp_buffers(void)
 {
 	struct arm_smccc_res res;
 
 	arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
 			  hyp_virt_to_phys(hyp_buffers.tx),
 			  hyp_virt_to_phys(hyp_buffers.rx),
-			  ffa_page_count,
+			  KVM_FFA_MBOX_NR_PAGES,
 			  0, 0, 0, 0,
 			  &res);
 
-	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
-}
-
-static int ffa_unmap_hyp_buffers(void)
-{
-	struct arm_smccc_res res;
-
-	arm_smccc_1_1_smc(FFA_RXTX_UNMAP,
-			  HOST_FFA_ID,
-			  0, 0, 0, 0, 0, 0,
-			  &res);
-
-	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
+	return res.a0 == FFA_SUCCESS ? 0 : ffa_to_linux_errno(res.a2);
 }
 
 static void ffa_mem_frag_tx(struct arm_smccc_res *res, u32 handle_lo,
@@ -213,18 +202,10 @@ static void do_ffa_rxtx_map(struct arm_smccc_res *res,
 		goto out_unlock;
 	}
 
-	/*
-	 * Map our hypervisor buffers into the SPMD before mapping and
-	 * pinning the host buffers in our own address space.
-	 */
-	ret = ffa_map_hyp_buffers(npages);
-	if (ret)
-		goto out_unlock;
-
 	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx));
 	if (ret) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto err_unmap;
+		goto out_unlock;
 	}
 
 	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(rx));
@@ -262,8 +243,6 @@ static void do_ffa_rxtx_map(struct arm_smccc_res *res,
 	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(rx));
 err_unshare_tx:
 	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx));
-err_unmap:
-	ffa_unmap_hyp_buffers();
 	goto out_unlock;
 }
 
@@ -291,9 +270,6 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_res *res,
 	hyp_unpin_shared_mem(host_buffers.rx, host_buffers.rx + 1);
 	WARN_ON(__pkvm_host_unshare_hyp(hyp_virt_to_pfn(host_buffers.rx)));
 	host_buffers.rx = NULL;
-
-	ffa_unmap_hyp_buffers();
-
 out_unlock:
 	hyp_spin_unlock(&host_buffers.lock);
 out:
@@ -809,6 +785,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	if (!is_ffa_call(func_id))
 		return false;
 
+	if (!has_ffa_supported) {
+		ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
+		goto out_handled;
+	}
+
 	if (!has_version_negotiated && func_id != FFA_VERSION) {
 		ffa_to_smccc_error(&res, FFA_RET_INVALID_PARAMETERS);
 		goto out_handled;
@@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
 {
 	struct arm_smccc_res res;
 	void *tx, *rx;
+	int ret;
 
 	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
 		return 0;
@@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
 		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
 	};
 
+	/* Map our hypervisor buffers into the SPMD */
+	ret = ffa_map_hyp_buffers();
+	if (ret)
+		return ret;
+
+	has_ffa_supported = true;
 	return 0;
 }
-- 
2.48.1.711.g2feabab25a-goog


