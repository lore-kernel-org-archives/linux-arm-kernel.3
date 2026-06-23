Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC95CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGR+TN4xuVGCrc6fFlK/aC8+eZFM94myNXts5JflryA=; b=A8lIIocwqyPX7r8jUYSNCQDGq+
	dPTw6Su/ePWmkbeWE30sQZlPn1zBUQx8z0C/M0cQM/mQLz8bEIlX7akH5u8iHYvf4KGz1qPCaBLCn
	ERNk8qwqgji+MX05v48BgAl1LzZiwKSGnlOiBFrvYfO/ij3FwcE3bm3Nm/9G3OdGuYz/jY3ShktCW
	ZQ7KN/ydjzEmcdH8GsNA+S6X0yJDiDR7DpypUtzi9d4tDoaAWsqlfal5u7b64PR13Uhu3r9H72cY7
	wxPOG2GQ3CY485u0tO3ZvFYcS6oALyBJW4WZacKdcOvNemXh1YB/up8FIND3fqN0OHem4QVSRuNBH
	SS9RH/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhx-00000006D8i-0ILX;
	Tue, 23 Jun 2026 11:54:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhr-00000006D4V-0qzB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:20 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-461c8319c73so4256495f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215657; x=1782820457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGR+TN4xuVGCrc6fFlK/aC8+eZFM94myNXts5JflryA=;
        b=DXIbwciM+c/Y/CgwCL767XRWwxQmqgb3FftOOIhIui8W4ElzWBfAYdsqN4TKGsgOha
         IryzGKUl+Lf7UiCaE+KvoQYZ99A2nuqkU3+a2eH2M0kh5rsmbdITEsc9TYQhYOxwCVki
         oW0fVMdl0dzYfho6/2Kc5WDhmMvvBENRMMqbZt/6pgbjuYKVXNdvbL6K/buaS6GyOizH
         42ODiuB8RxWuhqFv0qE+qIhoEfbFV+4blz0EkDTPYsdetpgZH3xPokK8jGOjOF2kwWpK
         KRufwXSaa9qNBIr4UqXuDRo9pXzTRAKk0PjEyL1p8wNHy+Bw96/xf+uOzrGhOzcGIFjk
         r7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215657; x=1782820457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGR+TN4xuVGCrc6fFlK/aC8+eZFM94myNXts5JflryA=;
        b=LPmhUorAiJeLmQHnzvP2Efx0S6J5ScqK/OG+yATEVruaZ/vOkD4U4FjGVplT5THg/J
         +OfJAqDQjFIKYpyakLcodh6eOWVFnslHl7AWKYmuPAObNWLEvwiAg4pJTKmGdPeumRyR
         eRC49cUaVYRwpJi34qGib9GqYgU38SYQj9h76VAcGpgrGzm0TuMrl6dA1B5rH+42IO0F
         sFf4KYrXq8h4EsLEmeKqhwyPjOKZ77x335S0c8phd7V3s1POo0mnMP0KF+MTShp0JcoX
         pOdxtWHZqIR7XJIW6MTvnRQrPT4dRT5Lw+o1S18DLK5snvFmwnfF8m84trHgovBgPy6k
         8V1w==
X-Forwarded-Encrypted: i=1; AHgh+RoOuJ/AkoQs0OfGtw3ZYuJJUYtmAOHTsNY6Mj9i9pMyL1B2p4pKgs1SQJ9e9CPVkgM7wrLw0uWSCAna1FmzKgCp@lists.infradead.org
X-Gm-Message-State: AOJu0YyWw/2Tg9WYFxaWix2tfqJH7VOQ+RIU/g3TgDTK3dNJkwRO9t6Q
	lYXiGiKuciS/QdwKoR3GU4BGSigTdobie1mKowvm8R44c7HkvDu99frKw2P5yznRiFpAoLWPZcu
	jy0KkFznm5OG6yy0S8ZAP82xjPUhLWA==
X-Received: from wrsx9.prod.google.com ([2002:adf:ffc9:0:b0:449:2f8e:2b32])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1448:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-46506385549mr31804863f8f.7.1782215656453;
 Tue, 23 Jun 2026 04:54:16 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:52 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-6-sebastianene@google.com>
Subject: [PATCH v5 5/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260623_045419_258833_A8960B13 
X-CRM114-Status: GOOD (  13.20  )
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

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and enforce MBZ/SBZ fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 4b9e2b6b7143..b30dfc192d09 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -717,7 +718,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -977,6 +977,32 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
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
@@ -1050,6 +1076,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.786.g65d90a0328-goog


