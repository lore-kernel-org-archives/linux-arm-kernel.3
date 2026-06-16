Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7B8CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MtrJN4EcerjeE6DHF17eBGjvGBuj7lWJfYdNgKlqOo=; b=InMkz0dV74bQL3Zr3sgGwVgWPK
	QyQ+wm5D4Ze1yxcwlHEvf5hLBdRQt4wrRm2i6uvbZshtxYI4iQnvrJK1v23+qiOK2e86OGB/PD6Ii
	GMAYptXYHVF4u/LEsj6jWNWLFJxY9W4BHiEwY2Fg5hoe+yvCJaLN57VgJu+jPP8PLJJoCrb33BdzS
	zMo8J4u+fQI7klukSFykMOXz4QWzukJpO8LDsLQKSGV0lfuscwivh+WdywhbMWIqs8B3t9r6t1B6f
	Dw+GdodRjR306AtahUc10wTaLa+kALUtwKC8psldLSrEC5zWdIesXHzsoisb5V0kM8cIB9aDyxK20
	C4E+ygPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRB-0000000FdIC-0jYF;
	Tue, 16 Jun 2026 10:54:33 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR6-0000000FdF7-1BKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so38195675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607266; x=1782212066; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1MtrJN4EcerjeE6DHF17eBGjvGBuj7lWJfYdNgKlqOo=;
        b=Ry+uTSTNAowsP6P8T/nfyftSIV60yvfFvSApBQ06aoJQLz2Sd7hCMnXLxwdZEvyzPU
         NauRbH+KCd1G0dMWAoxEH14UzQbLVSUZRlsO6D1ybZ9TRBTbObKMXiJ+Yh0IU3GHZfBb
         KPZZ4TIOoRM9kiiqX9lXMZojHRAwMtuEGJTBHDHqa38w4yuYv5mh8DcWXZGDCLjsKuty
         HDFFpNO2eqEvxa99L2L+cdLxwJN1kGpsFLbewBbavtD6ZZwWOlIliGnm2sEJsrHbDPpg
         iWLXjRdwiCC9WQ9fLvUBUJdof7KHptW5GJgkPQkpe0dlPGH4xBB/TgRZ1IqrrIT6G8i6
         4+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607266; x=1782212066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MtrJN4EcerjeE6DHF17eBGjvGBuj7lWJfYdNgKlqOo=;
        b=rwciXOC371VDD1rWseBDTacIYAR+PQYT3IJpexD4SnaaoF+uh0rAkiLbeatBfag2Mt
         ZJRV0hD3kKW/VShsMSNWoZNRxM1pbN02TeLVhl8/+w8LOmeBy8YLmmGTqFU34js6Wic3
         m7qRTDwQ8Irv/h432+RtLMWYdlxi260vvIkZ50wL3FaqTeXuvB3ybMbZ6xuqyrMuDOgT
         xPKEPxkMABXBVMg+JqhgAqATG3LIF+YOuRrd3fUHC1puxPwMw7yToMGMNWd0OlLTJz9c
         thPnQbC4l+KDedVzLxY54SBfCLKWpTCYhRWC3Bn/ntnwjIXOmUGefuPBW3xsa2+aurmK
         CruA==
X-Forwarded-Encrypted: i=1; AFNElJ9dcCY/Tt4cWeNpJjP0jyTvI74Thd6rDOjcITz/mkHYDIrSQWbXv8OS+C2UgMoZ78wcGwQeThVhOYr2o454Ba64@lists.infradead.org
X-Gm-Message-State: AOJu0YwXCbS7XCOH3Hxon10+1JvVa8BVTc7Gtojj/ykVCmPULWFRS5Jy
	E81hYtHhuyLiOKiKf/pDJVAD8u6HERhAGSruoHWtrdSRlVTl1LZ9Iw1TubKpiyfwWjaeFN5DzsM
	2EO9S9Q6TzkUvvpf3ip8h+tsnWczkuA==
X-Received: from wmjv24.prod.google.com ([2002:a7b:cb58:0:b0:490:aeab:32d1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e48:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-4922005e235mr182587895e9.7.1781607265338;
 Tue, 16 Jun 2026 03:54:25 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:09 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-3-sebastianene@google.com>
Subject: [PATCH v3 1/7] KVM: arm64: Support FFA_NOTIFICATION_BITMAP_CREATE in
 host handler
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
X-CRM114-CacheID: sfid-20260616_035428_381165_4A0752CC 
X-CRM114-Status: GOOD (  12.64  )
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

Allow FF-A notification bitmap creation messages to be forwarded to
Trustzone from the host and introduce a helper to check for SBZ
register fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..b1e5f9ee86ef 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	int reg;
+
+	for (reg = first_reg; reg < 17; reg++) {
+		if (cpu_reg(ctxt, reg))
+			return true;
+	}
+
+	return false;
+}
+
 static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
 {
 	*res = (struct arm_smccc_1_2_regs) {
@@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
@@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 3)) {
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
@@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+		do_ffa_notif_bitmap(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1099.g489fc7bff1-goog


