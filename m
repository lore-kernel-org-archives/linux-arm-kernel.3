Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B903CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS4Tc9DEF1sakhdO+oEzT9jcpMtmCqHU665RCgQbU7E=; b=HWlz8QJeB3O9oMl6mkTdG3a0Tb
	Da3q02gbc6ufZMzWgZMSYdMEW+xHs/HfvlFwz937KQJwM4SjY7w5tA34oNNLClyJ/VKw51rX0CEE4
	8Wavak+2GxIQYuTtpmiFlA4z1K4dvBwHu6vadVjrcI1FfijHgl9vljt+rAKVCMeBspyo6FhkqZbje
	TYHfoOele0jlBdbr+sh9toUyvQgAiLZriVlJc4kVkM7a9zAzJCqBdqQS9rbg5l3RKMF63an7Gq4Fl
	wdKjtMHvacfu8JRtITl1Yj3A1MktApOBP2RTm24RjoozFt0kLeMmvvoY6BW1RM2RG4fW/QrwbF3Kh
	Sxcqalvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhn-00000006D3G-2ob9;
	Tue, 23 Jun 2026 11:54:15 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhk-00000006D1y-3BwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso37088965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215650; x=1782820450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QS4Tc9DEF1sakhdO+oEzT9jcpMtmCqHU665RCgQbU7E=;
        b=sZILm/NEFV8cXpsC6Ce/qOPST78HqcgAGkoeQDqrvvyt6ZSOGXEhr+xLbnfvr2Y4Fv
         omerUWvR0Eadp48kc9r90gwfIUiCEADHOfyE+LHXWsYASVIpXnZiLKVs9b0N96vI+ovN
         ybcI4iYJixRFRBfvOhWBP+C195kD70I7DBeL36qx+YDoBgz+D4EG5jG4NzuaGz+ZUY3U
         oDYZ05pyKOlE7B3P5Crk8+PnDUx8rrLDI0hMwWOgSLOJ6wsK6VFZkqNmfMi8Ez99Z7m0
         9CfPRcawATq2iA9BHtkHFpna2tNzG/i0s/Dly/kk3US7bA8fE4nhxbF5F0m/L60yeDbY
         PXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215650; x=1782820450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QS4Tc9DEF1sakhdO+oEzT9jcpMtmCqHU665RCgQbU7E=;
        b=omYhSeO20nBBLhUJyx8XBPERgyV97HHyCy51PtTTfjwlRVc6pJGVBXiIuC6r72htLO
         c3olZaENsp4HCg/AD35S3uwZkQcrP+hnImzZ1RSc5ZB9b6bnoITqds0+R0wbuR9ZKLxp
         YY7qhL/5uzd2nRi9hqtrnzS+a8vWj0nYJQs/OFmO2+4H4gaiqqgX4Ewc5d+bQay8PodT
         Gnch8TTx2NTLPkn2AK7Z9YceajmBEfbKoDRQrUIt6CORntrnOqB3XdCEQ8ET9x12Dpp+
         JPOyqcls0yOI2iEI8iL6xRFBgZAHKKfp8W4DtCVbn1G4fjhZM/T6EZ1roVSN4/+W6+9a
         YYMg==
X-Forwarded-Encrypted: i=1; AFNElJ+GFS6G72tmsPk83c82M72QXDsMpSrdyxv30ALNtMsdbBdojbLSp2LHovYwwPxFf3at7QtEdBQKoel91TeklNH1@lists.infradead.org
X-Gm-Message-State: AOJu0YxVl3F38uSneYRz2rTVsnA3VwQByTQlCg3vsK1VyEKNevZLZY5X
	T8uiDaZtEtZQ/fj2F4aUeqvCj9/B9GAJ6mFBn3tcWjUaYp3uSe7fTmjov1IDcjEZyzWzrKCuKTm
	lyLA9s2bSZNggESAxkanIiB05452k4A==
X-Received: from wmpo6.prod.google.com ([2002:a05:600c:3386:b0:490:9d65:494e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6309:b0:490:b645:3213 with SMTP id 5b1f17b1804b1-4925b3ac32fmr36891085e9.19.1782215650250;
 Tue, 23 Jun 2026 04:54:10 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:49 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-3-sebastianene@google.com>
Subject: [PATCH v5 2/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
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
X-CRM114-CacheID: sfid-20260623_045412_819494_FED374A3 
X-CRM114-Status: GOOD (  11.80  )
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
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 78bb043b33ee..cc10f48915fa 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -715,8 +715,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -911,6 +909,27 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
@@ -974,6 +993,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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
2.55.0.rc0.786.g65d90a0328-goog


