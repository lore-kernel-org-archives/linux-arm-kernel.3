Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB0CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HynPX1bYuHPedGhayckv3uSerJnSLgHUWuE3kdOkpaY=; b=trI0UUaFxy44X9cja72GjwnY21
	Szy3amia/9wFbokThUE1ZEi79mDwe79/fBPfp2B9mKEsN9kpOLK4mOth1hZbu4JoP65ob7fEeEZuG
	7WXM8nFuGNkOzPnrropLOPK6n473K93reVTHjyg07zmjqZAdz7SEM+JLVmySgsvjSO7hmRkLrMcAQ
	gaqOlvRkWRw/2rt70Kht9YHZPwNd9knv3MgytDoOd9j9UmZu11XjJfYt1isdRztpOXEgW8tXcrLEj
	zrN46xx+4eyzAktDi0CBn8dXqNJeN5mRQB7J5bRCALBqYR9ADBmkOY/Tn40CkelvB/VehCx0P0s3Q
	CVVl/tQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRB-0000000FdIu-1zNm;
	Tue, 16 Jun 2026 10:54:33 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR8-0000000FdFu-237G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:31 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-becd1c46294so403899866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607268; x=1782212068; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HynPX1bYuHPedGhayckv3uSerJnSLgHUWuE3kdOkpaY=;
        b=q8WC/pctR6IofR26TTLwj7juhbqWDiMrSnto8VAM1O+fzEu7FTreVwL0mNLlErcyba
         HEUhYLz3OIIoZ0fgOh2fk6arIJUGJUo4CuSbuPeUA6CE6sFaL1UGyFVpuF9HmL7gEXG7
         XpX5laNGqOqwVuA6O+Z1rICSZWgutFKRKGs91WVS6eKyYbhKr/4LYx/y0FsOJNHoQK/v
         ClAbZDilAdd5K8Ug45+2FvxJcqhX/R2tN+cgRmDDqwk9pCdUd9gQNc5CCglKoU0OdOas
         QAMmR5TqfN0aH7rO3N9SLHUuU07ATmsyWvUC1J5yxSEAXLAo+ntuhlyl2Bgb3K914lSp
         7jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607268; x=1782212068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HynPX1bYuHPedGhayckv3uSerJnSLgHUWuE3kdOkpaY=;
        b=V+FvXaqzw8ef7RGPSgbYix5009gTUvgm1ZuHddt+TIFA920dU844OZaUp4VCyOKTiD
         IPW6xgSMHrIe0nJ9r2i1NpzKBYpHF0cnh0EnR8zqwZn8/Svo4Gy2HaxtCzPir91YhTLg
         qTdJl+YZQH5shZjqXijBFafTr6Fu+twDlhNJxBoWBsBynGBbuaFK52GFejHQzfTBImns
         gZc60PBQxZMCa8Sfv4ZhYWhzQY71xKVbvLrU+yV6DcYJl32Wzx/m5JT0ttpmmAhCrWUy
         mB6Mx1H6HgdfYqMajk0EAVUksQHQ0whZ/5hRjNrI8fWre+RaCEQcFPZ1e4FKlhw3peiH
         +byQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ep+cHPJ3seyRLDimWcbSzLZUuqToHLxQ/9MXmarE5UXoVkzZsvw3+ZdpCbXscQ1k2XcOcqDhhRd523NoSGZXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrZwILIkd4XZcZWbLmmTs+QQJLVIrlfBJMCwZLO+20ImWZobVF
	Wqu1+gbksQezqfNiWHtEGuz6X/rI4Cw/bLQRvlMLRZxvhyApMPoFwLBt5W5WDD0LfFJQ/YPp4Wi
	w1vU3Mk0r3jEVWB+FZoFPDrzPGGqfOg==
X-Received: from ejbgh12.prod.google.com ([2002:a17:906:e08c:b0:beb:4d35:6d00])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c78b:b0:bcb:8b03:9fc2 with SMTP id a640c23a62f3a-c04148ad606mr213039566b.15.1781607267865;
 Tue, 16 Jun 2026 03:54:27 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:11 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-5-sebastianene@google.com>
Subject: [PATCH v3 2/7] KVM: arm64: Support FFA_NOTIFICATION_BITMAP_DESTROY in
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
X-CRM114-CacheID: sfid-20260616_035430_532949_397D6F0F 
X-CRM114-Status: GOOD (  10.62  )
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

Allow FF-A notification bitmap destruction messages to be forwarded to
Trustzone from the host.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index b1e5f9ee86ef..49a43c38a931 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -688,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -876,10 +875,12 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 				struct kvm_cpu_context *ctxt)
 {
+	DECLARE_REG(u32, func_id, ctxt, 0);
 	DECLARE_REG(u32, vmid, ctxt, 1);
 	struct arm_smccc_1_2_regs *args;
+	u32 idx_unused_args = func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2;
 
-	if (ffa_check_unused_args_sbz(ctxt, 3)) {
+	if (ffa_check_unused_args_sbz(ctxt, idx_unused_args)) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
 	}
@@ -952,6 +953,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
 	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
 	}
-- 
2.54.0.1099.g489fc7bff1-goog


