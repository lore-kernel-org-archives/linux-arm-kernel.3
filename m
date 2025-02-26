Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D567AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn7NkfdNisHNgNHd+oe9siIm1ilJ5hL+n/oLHca/4xQ=; b=s5vq+z/1XECW2h6kemtzSOfqCT
	rgsCn6mEYKpcun32+0edVNKyrgXmSWI3nqlllqeAMKcMbdTviWxV5AGZQH9lrHgImxAxZEql3GQwE
	ba2j8R5INMs58Eygigfg6bxKn6/HlOwE1IrhHn9N2sEdLoYmPkqoT5CHzv4EA6thc3iN+4j5FJUsM
	gqIf5itlbYnyezcrDxvi7R+AOC+QOjoFZ2igWLVH6rcMNOM2PwylOIxeHeaOiGoGTY87uc7KS3HlJ
	Xbks8vBmL4pzkVO6FbdkggFxQdDfbxWiZ2HVKUDLW2Ew1J8qk+5udcDq6fqe9DLNrltGlKZ5HWCy7
	TE6OQE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPPF-00000005XLf-3r8y;
	Wed, 26 Feb 2025 21:57:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPH6-00000005WMk-0cMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:49:05 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-38f4cce15c8so74714f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606542; x=1741211342; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nn7NkfdNisHNgNHd+oe9siIm1ilJ5hL+n/oLHca/4xQ=;
        b=wq8+BIG8FcuOEZrBzgBKXO0okJ/UPaqnadvClhIKBk93z6nlnZyFc+MxVj0ASuadHG
         JOeyRHjBHrVjDxWreSxRjGETNEKeT1As+C5xxNQdMCIzuntz9+7v30uUrYXoH7ihIMZ3
         GVpkUTgWsPYaEniMXOYj77upnPx/BRQ+HXEbcOoTG+4YruJtrlrWIQ1yRKXFx9fkvn/J
         ysXeMEh0enHqsG+/2F8284FyKBresdXqk8m4U+jKyPO7MBdbIInyCOsFQ8tBqrCX2NnU
         Enh4Q2IjJzbbjoskxzmyWjT3bcNUc3Z85ztpPwCLERc2e8nnJV9Kynb6aepaeoG1zmTI
         +Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606542; x=1741211342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn7NkfdNisHNgNHd+oe9siIm1ilJ5hL+n/oLHca/4xQ=;
        b=G9dLwoBEWZgbFFuTAVhwZsL8OU18L0K6YqcWCcfmodOFGdtknPE9OwMorIRwBbdqyW
         NB1U0GN12XX5riXHuq6iORaMWo7DnxEEzOT8k8MfxWWroA5ZnHE3Y5HOkGXiNULx+IuC
         Lw0axdlhqjD5AqQLWOjt5SpW9NoTaLnyYS+yMyqeeH/KlEOeye7UxAUjHiR9swgS7Uf4
         Oti3r/6ShcaClDKovu7XuSKgF1MHDDWubRhFgJ3w/Aqz781Tzp4E8kigo/3OK1BDRoRN
         Jf5c3vyd74MtS2FRqMk5rkGuP2xwL7yFbOgoOu87DdiZaOdAJ7DEC5jIE/tcoFIBZE9c
         9Jlg==
X-Forwarded-Encrypted: i=1; AJvYcCXknTbgpoEUTHmjHqw+VoOy6cAlZVfQIhJlpPVBT7hLbFLsnEHnRgcuMv+8QWAOuwMK6yJikuzlGZ027yJxlc91@lists.infradead.org
X-Gm-Message-State: AOJu0YxnsVZ3rjHmHxdQJ2930nXVSC1f2y6v/7wycECRfmPL6iRt3RCK
	a+L7FeOMyfyZutg3rOA1ViloEU2ARzwLFDCbUFN4SEONmYxeTFT4x0GgAvMq287BUGSz90azMGm
	WVhhgHNLfXsGj5WIX5AOKBduJzQ==
X-Google-Smtp-Source: AGHT+IHCoOc2i86YMCnuvttEGcDUZYoM+8yWhiEKuZWCun/eyz4ldBIl5B6mMe4Xqk2ObldseXeE2fv9uBC+67uQ47I=
X-Received: from wmbgw7.prod.google.com ([2002:a05:600c:8507:b0:439:4293:c575])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3111:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43ab0f31010mr85525335e9.11.1740606542287;
 Wed, 26 Feb 2025 13:49:02 -0800 (PST)
Date: Wed, 26 Feb 2025 21:48:52 +0000
In-Reply-To: <20250226214853.3267057-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250226214853.3267057-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226214853.3267057-3-sebastianene@google.com>
Subject: [PATCH 2/3] KVM: arm64: Map the hypervisor FF-A buffers on ffa init
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134904_186345_20E5A303 
X-CRM114-Status: GOOD (  20.60  )
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
never be called and move the definition of the
ffa_to_linux_error map in the header where it should belong to.
Prevent the host from using FF-A if the hypervisor could not
map its own buffers with Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c     | 46 ++++++++++++-------------------
 drivers/firmware/arm_ffa/driver.c | 24 ----------------
 include/linux/arm_ffa.h           | 24 ++++++++++++++++
 3 files changed, 41 insertions(+), 53 deletions(-)

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
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15..b02b80f3dfe8 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -61,30 +61,6 @@
 
 static ffa_fn *invoke_ffa_fn;
 
-static const int ffa_linux_errmap[] = {
-	/* better than switch case as long as return value is continuous */
-	0,		/* FFA_RET_SUCCESS */
-	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
-	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
-	-ENOMEM,	/* FFA_RET_NO_MEMORY */
-	-EBUSY,		/* FFA_RET_BUSY */
-	-EINTR,		/* FFA_RET_INTERRUPTED */
-	-EACCES,	/* FFA_RET_DENIED */
-	-EAGAIN,	/* FFA_RET_RETRY */
-	-ECANCELED,	/* FFA_RET_ABORTED */
-	-ENODATA,	/* FFA_RET_NO_DATA */
-	-EAGAIN,	/* FFA_RET_NOT_READY */
-};
-
-static inline int ffa_to_linux_errno(int errno)
-{
-	int err_idx = -errno;
-
-	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
-		return ffa_linux_errmap[err_idx];
-	return -EINVAL;
-}
-
 struct ffa_pcpu_irq {
 	struct ffa_drv_info *info;
 };
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f659..850577edadbc 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -475,4 +475,28 @@ struct ffa_ops {
 	const struct ffa_notifier_ops *notifier_ops;
 };
 
+static const int ffa_linux_errmap[] = {
+	/* better than switch case as long as return value is continuous */
+	0,		/* FFA_RET_SUCCESS */
+	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
+	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
+	-ENOMEM,	/* FFA_RET_NO_MEMORY */
+	-EBUSY,		/* FFA_RET_BUSY */
+	-EINTR,		/* FFA_RET_INTERRUPTED */
+	-EACCES,	/* FFA_RET_DENIED */
+	-EAGAIN,	/* FFA_RET_RETRY */
+	-ECANCELED,	/* FFA_RET_ABORTED */
+	-ENODATA,	/* FFA_RET_NO_DATA */
+	-EAGAIN,	/* FFA_RET_NOT_READY */
+};
+
+static inline int ffa_to_linux_errno(int errno)
+{
+	int err_idx = -errno;
+
+	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
+		return ffa_linux_errmap[err_idx];
+	return -EINVAL;
+}
+
 #endif /* _LINUX_ARM_FFA_H */
-- 
2.48.1.658.g4767266eb4-goog


