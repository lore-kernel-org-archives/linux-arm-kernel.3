Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A661C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAzLQ3gzA+KnrCzUsFBoGBhVOWJwQaHovl8NoBHBi/Q=; b=uZYjzhzVXy8EYre0c2lLpTbBTw
	J+xTFxRyxzsI4Rmocnttd6bJArkhO+Rl8KwMmtQzs4xOm5PMTl81poif25Tx+kYViCf9f7spFgAGO
	l4D7r40WgrAIrzD0l2KMP9mpRugHgaAvrFkpcUlM7Eu6ixtT8MXZplrrxTpOkiARm/bekj94kR6z5
	aqq993XN/Rjr9cFNFYgMnFSmtsjYWcZ4nZ4Crh0AaCv1W2Opr4kkAEZbJyPpbkIDJBeFOpfYjbHms
	lY3fIP0lg5xUbL9wRYWCLlqzUv0c++tsEeGxrTCk16koV07god22AlGgRJyAQFpnQhH4s6wcMtNYS
	XY0jdG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAG-0000000GYhA-3btT;
	Wed, 08 Jul 2026 07:57:52 +0000
Received: from mail-lf1-x14a.google.com ([2a00:1450:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAB-0000000GYdO-1PXB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:57:48 +0000
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-5aeb711dff7so267316e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783497465; x=1784102265; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAzLQ3gzA+KnrCzUsFBoGBhVOWJwQaHovl8NoBHBi/Q=;
        b=khsxoAEmhVPKcYb3iarHzPzgZL5KFFdIrwuCPl+2TI0tdTUqYwUGOil/C8gKNkq9Ib
         moZFtGJsB3t4Vxkda/f6Wdk8oFSlETb0AVHv93imO4Ce7WG5LlJwqLuLUuuR5Vwpf81H
         Bp6vr/jQLG69YfswVe54mjA7O2MQ105xxzoV9NZ3ecM0DMvkwaesNeL/cXfVeJWBeg1b
         8IjHL+kkOQOxz2tapQeGdWtJvNmkpBYg3dEIo++Dwas0hp96/yFYVAg4xv8WzEHGIkY4
         PqjxBIlC6h8RYxKObgWC7S1bnf8/RK9w3sOxqDC2xwqqH90KH/HYRjkTsZcmhenjNYF1
         MGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497465; x=1784102265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAzLQ3gzA+KnrCzUsFBoGBhVOWJwQaHovl8NoBHBi/Q=;
        b=Z2Sw1fVdU22NVAQ/Y4xae4eXS2VeC/80oSlv04qha4zkckaekVWbAGpohupvi2ub43
         UM+HT9927SJupRaBJ05g820UG+GKXwFtKM8RNcwammybFrubaA9VLtyyZ+wmR77nC9iq
         xAfh+iYrpah8FUpq6VdhHnZ9JmUR8xzLzrZ/ZN+W4NxuknLCu821j/OgCXm1RjnT6b6n
         fW2OSFmxnvc5HdyIKi5OyiRDoPsE9Ftoqa9PjOKTrDC7A8MSpidSY6qJxvVlTJ9Y7Hfs
         qgFues21lGcSU5nIm01q5QACQhsSxqTgiPzXcwQJNLpcHbSfI9DGwSmT/GkUkX7DNMFy
         4mEQ==
X-Gm-Message-State: AOJu0YzNQPFrjtZKw7u2RybCo9C4YiJS++L2L+IwrOg4s6vwkN7YLMF7
	LUimFz5CDfFQZ2wOmmINlsLboCZ1NJG/r4cDJX4llOTIS/pfonQ6rBmmx4sMMr3nplpnQ0/SUBv
	8Q+MekKG2L2cVdAtLR9Fnow==
X-Received: from ljic3-n1.prod.google.com ([2002:a05:651c:2343:10b0:39a:fb7d:982d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6512:3b20:b0:5ae:bb35:c956 with SMTP id 2adb3069b0e04-5b011497d66mr431084e87.56.1783497464617;
 Wed, 08 Jul 2026 00:57:44 -0700 (PDT)
Date: Wed,  8 Jul 2026 08:54:32 +0100
In-Reply-To: <20260708075435.47419-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260708075435.47419-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708075435.47419-2-vdonnefort@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	linux-trace-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_005747_409943_A37318CD 
X-CRM114-Status: UNSURE (   8.61  )
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

The hypervisor tracing for pKVM relies on the __pkvm_host_share_hyp and
__pkvm_host_unshare_hyp HVCs. In order to start tracing as early as
possible, allow those two HVCs before the host is deprivileged.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..fb049c40d04f 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -89,12 +89,12 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
 	/* Hypercalls that are available only when pKVM has finalised. */
-	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
-	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f4..361dbfe2e832 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -740,9 +740,9 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
-
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
+
 	HANDLE_FUNC(__pkvm_host_donate_guest),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
-- 
2.55.0.795.g602f6c329a-goog


