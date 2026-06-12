Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B8CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvdJm7zpA9I9WpAA+zqvgzxPINWHDWcn46I9uP7tgtI=; b=dZ2eK0jwPWScNm3xFSRXBzKJ0k
	gQAAAV2mrZZdWHLEf/ikGhLUBPfYQiykXt2i8//En9ne6Khbkymb+Stk7kF4rTXIDQEuDpvGpLLIC
	0HMmHZo429qLqTnrxOzJtJAx5irveFzcq80oajAsNxnmRDtIIyDtCumr8pQdey/rmpAg++hbAMbb9
	EFsVdreIvPXi6gUrE4JxRwzMvn8g84G/9ZrM2H29bMiw5zfa/OjqKwn54uUVkipMe0TX4VF8HkX/o
	IXlQwbO2wDnJM3UuPEiIYOJtubbsUrd2G0t50YmOePTTypzBaOdgar7uKI3sjx8hzwkyRENLgkf8+
	D1GVI0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mj-0000000B3A5-16ZQ;
	Fri, 12 Jun 2026 14:23:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mf-0000000B37I-2oWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:22:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b93debc8so9987655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781274175; x=1781878975; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvdJm7zpA9I9WpAA+zqvgzxPINWHDWcn46I9uP7tgtI=;
        b=kvEGvXOh7v09NbuLZdmDHMXK1g8sGUExuHle9PUkABhMGrbBC/UsZt8tB/yKy228Wc
         1PcqmbNTY33lr7yMI/XVzCK/5dk2OMS55FCKacVdo2OKlREnUes5JihFzsQGgBhTYd4e
         zTxUB25j9NnczuK2q0Gn/x25iRsLHn89faxLH2XXlVb81uukeE+czxMGeQlbeDhPOvB9
         OO/UvU3a699znccmAeIhc9dHPVi88LP/vJFS61Rr6bW7J3hYkXzmC4SBBhwgu6lu4GD/
         TX6OvxyhvzdHKmX02sesKoNdweNejKLRa8y1QqzC4tRR514zRlJJiTIKR28Nc+Mh5h1o
         SfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274175; x=1781878975;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvdJm7zpA9I9WpAA+zqvgzxPINWHDWcn46I9uP7tgtI=;
        b=B2mYOhyN5gK+GlhSj5S001eT3Eql8Gs0zUBBqwUa/uhgyU84BKiyLqBb+apkAdX65i
         Xi5BMUfZW86FJUC6CmzGcJolq1n84b6087nGRMb/id0wVd/5B/Ym8sTkuaLBsa4hNK5W
         5TDz1MBCYPHdPjhpx1AyyWTReFwUdn5hSAMosaAeBwJUgkaPJ1k4DSWPQ1lkBg4HZz3J
         qN+Q3/da8JD+CefD/WcsPmZxj/sYrx8JQLjqVZ0x80W0wOorLy/KJf68O9FwKDhoxlnA
         RV4wWq4ILe160CNve1O4zJxw+uLcQmjJ2ijOjiPJvEJ79D1NfQ3YHG4DOiQHxpMSMkW4
         imbg==
X-Gm-Message-State: AOJu0YyV54mWt6IHIUi9XpFOdcQfhKUa77gyAgPmyhpaYOodiYCIzCas
	GfIPw4ldZcRkrJtA0JZRnX1PaUWBkTvhOtM5Y1te+mfQUzEB47zQucuLt6S11Szow23CHXOG1D+
	I6cM9ZYtnSb24TogIuUT4QA==
X-Received: from wmbg10.prod.google.com ([2002:a05:600c:a40a:b0:490:b555:823e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8494:20b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490ec51003amr29779865e9.29.1781274174882;
 Fri, 12 Jun 2026 07:22:54 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:22:42 +0100
In-Reply-To: <20260612142245.1015744-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612142245.1015744-2-vdonnefort@google.com>
Subject: [PATCH v1 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, qerret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072257_719823_0F4042D3 
X-CRM114-Status: UNSURE (   8.06  )
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
index 06db299c37a8..f0c52667cf52 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -721,9 +721,9 @@ static const hcall_t host_hcall[] = {
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
2.54.0.1136.gdb2ca164c4-goog


