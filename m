Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72740CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0WGrmRhB1PbQdF9zTXmlnmdrKaIQ3QJcD0M000UG+0=; b=j4J6XrAqlNvCag3ABGKRLFxXyg
	oLWghDVptKbDagV5ugYLLSBDePEWoRMvV9xlV29SaaYO81+fV+CaKAKJqFenDnLHtqdd1qvird8yF
	eevraC+wwXaO8t7VqD3J28+9WRxfQe7KMDXc+WQyj6qUXQ2B6LUiQL90RFK9ssAgbrrPLutEK1utV
	vT9xh12b8jXarX1FkULn97HA3zgbQhdhQKTT43yrSr0xZlKvtmXKSh8yRbcMU4X9wJRMrO7F2HP4i
	1YV7Ubri9EBpXsHvJs8rP/JzYgtEnQSvbpk83/O4MSPGezmoIpZ5sSZ+939ynG1xftLmiutdqrWzo
	wdchWuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRB-0000000FdIR-1Hsg;
	Tue, 16 Jun 2026 10:54:33 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR7-0000000FdFB-0BSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45ef0af9517so4156254f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607267; x=1782212067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0WGrmRhB1PbQdF9zTXmlnmdrKaIQ3QJcD0M000UG+0=;
        b=qOmN2TWL23AcM6GV3k1nEClPklYaaBP6UJMDBZWyKDWpjZTc2vl77lXedGikfKfnRB
         NKPdgKGov1e5WUPbvDYWR8dsylfPVvFiOgVaGR1eNI5nr6CZGEazExtdPQRQE+vnLXTO
         5mxNvQ3CIg/Z2IoAhnRb56bRqwJNetCDE3K+REo9xyEdI6XfYx9t1fc0Sd3d+rTYlVvM
         h86VvYfVGpWY39d/VMAvAibNHgy+2lWrS9j4cW6o72Ds1FM65vGxoKeRsudnondcjDOK
         FHQeFA0FS9NvV/8BH95P0VmV3aijFKqaigjd/EGeb6s0PBhbnTEKxmwnJCX6iE71UwLV
         gAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607267; x=1782212067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0WGrmRhB1PbQdF9zTXmlnmdrKaIQ3QJcD0M000UG+0=;
        b=nImxjiqDtCSI6d7uVR2mcE9NOYDNe7ucQTqiqcpUCz5/hU515wuZe0XvY1EJcvvfwX
         qDdNvKfnaNhGz0jnYdSRA5FtMdEF+tc9LQw9tvbdqSYDpRZkbe8ZRfh6uzLN0/ixGz7q
         sQD+c0z7ZeCh14uShFY3ga7nG5CGbF+ZdptV7uT7ws7IKPbZMRuut/ULyfwjgYcRN2O9
         oqEclnklKdtMrUCQMFhQdGCJ1mspX7Cx8CBztwTDzTjffWl6tQ5o6SgWysys5+dEZvkd
         Hk/l5fyM0aE51yMSeYk+hQJfQqEPU2Sgt1J79VIOIa8/wpD9x3d5PEmvafXTDeeQIRgb
         2L1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/3DLkcpz5OiYEV5CR4CC+ubDsgN8ijlBhi8g8wae5OAGnSAyP5HUkEKr9B7Y91hwklw3sGJOrSpLAVZcDBNEXY@lists.infradead.org
X-Gm-Message-State: AOJu0YwLaX+j9m6RTLydYdI+KEck3apkO3JivC4xU+aUSBYBtqyuZd4R
	RTMmugmHMPq8jeiH1oiOscw2PAurdsnuRGtt09YVTVOwNqtwJ0yfF0rBcd9GVAjhrDNttA/CKNB
	VnRkcnbyKxR5txOruUvt4XNEgbsN1Nw==
X-Received: from wrqu16.prod.google.com ([2002:a5d:4690:0:b0:45e:ee20:c6d3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:43d4:10b0:460:5a6f:c0df with SMTP id ffacd0b85a97d-4619f3afb82mr4361777f8f.22.1781607266611;
 Tue, 16 Jun 2026 03:54:26 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:10 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-4-sebastianene@google.com>
Subject: [PATCH v3 2/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
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
X-CRM114-CacheID: sfid-20260616_035429_100954_C19BFBB8 
X-CRM114-Status: GOOD (  12.60  )
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
 arch/arm64/kvm/hyp/nvhe/ffa.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index c723a21006aa..dc7496ec295f 100644
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
@@ -909,6 +907,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, func_id, ctxt, 0);
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+	u32 idx_unused_args = func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2;
+
+	if (ffa_check_unused_args_sbz(ctxt, idx_unused_args)) {
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
@@ -967,6 +987,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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


