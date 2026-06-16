Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0E8CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDCvszfTGrfPrRQcbamAtNu8DMm5bIYeuf9FwhpYcNM=; b=TAoyJNUD7PoqvP2tnKvCnEQhGC
	2N+XREzEGOvIPA3Rxzl4sGOSmYCtqs0IXDfVnCzR/+XiT9lzZCSpb4unc4AZwkavfglLEQPh7tnn9
	8S+aUXfbeVD7W2pHgfuYfFxeXnngKJZkxehG5gqrWJYwh7f5Hq+Lokmqy0oYB7t6nOKSVnRnME3bs
	z8G78A7ccU4ucInrEVtxLxVSJ1KRfHV6Shr0wfBpjrzA4jjIwJDzygNjHu4Cm2K20rYiu1w1pCcHg
	AdyAHXkl54u1D+fQVm8bfECxP/RaPOyXwB/98ZXfhgTimpNc435JmQmwsKpIo2JzKN03j6HBDDrYv
	xB8niQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvZ-0000000G28o-32MC;
	Tue, 16 Jun 2026 15:42:13 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvW-0000000G25h-1T1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:11 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490afe64f26so21804935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624528; x=1782229328; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDCvszfTGrfPrRQcbamAtNu8DMm5bIYeuf9FwhpYcNM=;
        b=EboxpoCtv5CfcSZmr+4GViv7oLTQ4k9giShMPGNwCQpMgQt6fePplGVvJu9B5/IxgL
         6xepaCEqFUjPfWgTH26gIbh3qg0Shy75rYQOpXpMJuUeSgUvmZiUEMm43pG+Hz/mx0aF
         FfJvtuKJAu3DLPMeRefFXEdgqquVvn3DpOIy1u+dj0VXRuWn9G7bIx+F2KVEHf+zMedo
         lipWx7VA4uFKhvt3kluwRz05pEGgTv0bELtAoURL1CIa5H9Lh0EiJ1PI+RQyTxSen8uk
         wCyQuzzQFOTf3F02mNY4MmVkVy03MZxons2futk6xbozu9sKELZMdJP49fmX3x0M1YZN
         xURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624528; x=1782229328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDCvszfTGrfPrRQcbamAtNu8DMm5bIYeuf9FwhpYcNM=;
        b=p3kFJyRFPFjDnv+VALYcca+hV4IjpbGRZ5Ji609ofipYEmtHB15o7a29LHU1EmX+VT
         6uYa7jEqOibqdu+FvrxUse41AmJ/TwBTyGq6fRMvaow6QfbiIAWBGYPo3nOjAHpEYMPQ
         Y1E+Pdm1AKLAn+BbbCGJQqV/yYRB12ai5j1X/T+TLMC4rBlaN8Q/3mgbKYe9O9eZ+KJ7
         vyuby3mKS0KTs/9k+bRVPuatYWZN8KRxR1OxrZKt6K8DsIREOlY3gxknXOTIHbIOUP/F
         4cxZOgTvMTfpV/jAJ5ACLQk2x9mCFjBNaHHK+pO7OhBWYP+5coXGMqls5PNqrCDTFWXB
         QdWA==
X-Forwarded-Encrypted: i=1; AFNElJ9EAyqwHH8iZzYPquZEpEEuTeLlUBuMvBlvyyRDF3tYHijLhrTJjtE304e5gysN/D8R1bw1XE3fJqYf1tx5T40O@lists.infradead.org
X-Gm-Message-State: AOJu0YwumZIDuwef6Ejli0+yfmeL6uE1WkQt0WoAe0TUz13tFtic47vn
	k9hnyAzv+4uOzs2cn2dzQ8M9Uw0JFkmqTMFG37QlSzG4Jf3BZPajB3/SGXZTXCoogvFPvgGCK2a
	deSZQy0HXD39KGbcRSMtPK7K3/iYjxw==
X-Received: from wmpt39.prod.google.com ([2002:a05:600c:32a7:b0:490:b8a9:c86])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5248:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-492332d2c22mr2868755e9.6.1781624527303;
 Tue, 16 Jun 2026 08:42:07 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:44 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-3-sebastianene@google.com>
Subject: [PATCH v4 2/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_084210_409891_2E18A886 
X-CRM114-Status: GOOD (  11.93  )
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

Allow FF-A notification bitmap messages to be forwarded to
Trustzone from the host kernel driver enforce checking for
SBZ fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index c64c704f22f8..a72f6d4b62f0 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -713,8 +713,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -909,6 +907,27 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, func_id, ctxt, 0);
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (vmid != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -967,6 +986,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+		do_ffa_notif_bitmap(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1136.gdb2ca164c4-goog


