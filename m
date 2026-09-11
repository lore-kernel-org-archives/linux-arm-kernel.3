Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3960BC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWgZZmmnOkZYQth1/fyVx8z10swfdBk8thJUjR+LyQM=; b=m9yqVPBL3liHqbkjkECuLGOX5P
	AWFk9Dg739FQXSQIDvVtzc+yE924QNEiMzd6tEp0FZdjYPofqZq11ENeTF3uGfkd6/TTiHbFJIaNG
	E8eKHhOoqfgscDAuR+p4HRtP1g9VzgzIYEJ7xWawzumIqaT3l8nDUfJ0h9nz8SKmOkLxFKepKex4w
	JxMgr4htfh6xMRGHMPht1wLAxwsCt6GJkX5K5AedA6kMY3nB+61IpxIoiqJnf1WU9+yU2dFONTzEx
	3AoOuAQDcXTQaX0LuB2TlNn7DrEsrQhmjMDLrqc6WsVD/0TSjnaYdmM/38q63+LiPGMJEU87X/Vad
	5CD2dekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fQ-0000000GoNl-1Q4y;
	Fri, 11 Sep 2026 13:51:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51f0-0000000GnyQ-08FW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:24 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so7167895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134680; x=1789739480; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWgZZmmnOkZYQth1/fyVx8z10swfdBk8thJUjR+LyQM=;
        b=pLCEVXfZARfRPZ0KrHr2OrqQJc8VoOD3vTwRTaAC8l26bPaw7G5MxLsZD0To+2h4R4
         UTL0A93b0sOpqIR/DnP5BiENfmsr5ozsnYVFgvwS0mT+MpB9KLt8BvvviHeDCMI+jV01
         yXOvOc4dNrz+jiQbnrbCfCgtIC2IBivReOW+vnvsNhiPjsw4E7Jsc1wHXARv2CUnSwJt
         ei+Axrpmpt9sX/ykLrLBwdKWP/7E1GbFbH8NhrznWywF6Qdq7G2wYYj0Jn3AZqJnEFN3
         1Kfw6ZBSKhb5aGvJRHQWgPFx0nw2kZNl44UgjBvYqP04gIFNmfDeWRD5X8EWdtMceyQx
         EIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134680; x=1789739480;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWgZZmmnOkZYQth1/fyVx8z10swfdBk8thJUjR+LyQM=;
        b=OWMp9kWBHji9h75c1J1dlBJk/hsy4gXNQDvv9ZN+T9lpkEMlrrUlX4ex8soNFcrHCd
         Rb/fXNynNIBuw31vUIzG5vls0/yicaRmrr6RkJn+qp3W1vEa+OXTGrIZApUdGRhfLB7S
         FYWjCaaKyJt27vkbwOvh7FVvmUIBm5TP4SS/nrrrO5aEmtwPAc9SNv+yZOad/om7gLW5
         YPOBirQlbo/WwAVRYx4Xah96EHdvkIBgkSK/lBagdcLM3EL9jc3sLw9LqCT+G2NjQnmw
         pQ6Wfg2PxvrCDDLRmi95Ow7DUFPAoLSdY17PJOQgrDYc4oybr4nWyqhLCVrxCOOVFIdm
         q6kg==
X-Forwarded-Encrypted: i=1; AKwUvBxqf6Y0iDibJfW/PgO7pCml6NWF+QDgIheZGfjrELOw84UgKDhYE8zOneEpMK6U+T46RmkVkiHF3YmNPPZIXMmD@lists.infradead.org
X-Gm-Message-State: AFuF++mr6rgzED23GaVNLf/1GVSVcCm7obdLPZEGLWtxdLiwMnrkgkKL
	jP2Gcu+QxumHvTsCcuVM92MSlcTFCepqZ6yXV6qGVi7suFXMxmYHTuGJEaaNAyemVrpS2XwUVID
	w3BciblkPGFBuj7GltwJWJg==
X-Received: from wmoz24.prod.google.com ([2002:a05:600c:798:b0:49e:6060:6da9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5487:b0:49c:fa21:e747 with SMTP id 5b1f17b1804b1-49e619dbc2bmr48299505e9.29.1789134679658;
 Fri, 11 Sep 2026 06:51:19 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:46 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-16-vdonnefort@google.com>
Subject: [PATCH v2 15/22] KVM: arm64: Warn on pKVM guest stage-2 block collapse
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065122_082003_C40FF0F8 
X-CRM114-Status: GOOD (  10.33  )
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

When pKVM is enabled, the host relies on a pkvm_mapping tree that
mirrors the actual hypervisor-owned stage-2. The hypervisor is not
allowed to silently split blocks or collapse page-tables. This should be
treated as a bug.

Therefore, WARN on guest stage-2 page-table collapse which would
otherwise be fatal anyway.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2893183c2056..2e8c241f76c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -226,6 +226,12 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void guest_s2_free_unlinked_table(void *addr, s8 level)
+{
+	/* We should never collapse guest stage-2 tables into blocks */
+	WARN_ON(1);
+}
+
 static void __apply_guest_page(void *va, size_t size,
 			       void (*func)(void *addr, size_t size))
 {
@@ -294,6 +300,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 		.put_page		= guest_s2_put_page,
 		.dcache_clean_inval_poc	= clean_dcache_guest_page,
 		.icache_inval_pou	= invalidate_icache_guest_page,
+		.free_unlinked_table	= guest_s2_free_unlinked_table,
 	};
 
 	guest_lock_component(vm);
-- 
2.55.0.1007.g17ff1f9808-goog


