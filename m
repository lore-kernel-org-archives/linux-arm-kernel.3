Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85CDCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYQM2I+r8judSPngvWcWEJb9im+ycy9cxj2LUpGCt2I=; b=LRvDNyNQl2p2oef68WIZgJv617
	Jj3FXrZbXGQAxEeTTZbeFdilcr98iaZpVXmzLQVfH2Ys16+n4wkoe4Lr9Yht4+tZpwr8LCTkoNnno
	BL4727V5fNJqPMtfJyJHK+KEJlHUwmrlH6guuaHoWd08uxUdf2Ujcuv96VgczdnGckiA0HdT/2OB0
	/WOk5K7QvB6U5R4+nTdq/6aCABHARYrM+DUl7Xa/0mCWXZyoltK26RKxqDWQj0mOgHh7igYqEV+rg
	f6wjbhOVm0wM3c+ggQuJqmEd9pDBn7Ngx8ZE0ovtyvx08RH2PwfjeNCVEbSbBsKRaROCPJmkPmMro
	Fh1XLqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Er-00000005qnh-1JuT;
	Fri, 09 Oct 2026 08:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6El-00000005qk2-3NJo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 08:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kYQM2I+r8judSPngvWcWEJb9im+ycy9cxj2LUpGCt2I=; b=CZeHm3VU/tFFUPWlxRF45f5xZE
	lN2jZJSWA+iUA3pxIQ44wwIQKshyzAKWy48BSKMT97o+xPAwpq6GXyNHV00di+D6QYNtUj+GrTHvt
	myKfYxT67QDDJHVd54XqYdEr7C9a2rrgfQBBl9HuE5AgQcrSgR0q6CZTmVcL+Z9AxMwbvOQoYMLT0
	P9U77hF+HVDkC+rNb4c8YSBiixn+KEZLgTgyQ0FkgMrVYJOuO8wkO+Kz6liPLuqDPsTD/vKokT5s0
	+WYyV/h5xObQj0l6hpCnqzUdgNvzTUt9nd4TRlvfdoLGyuj9b78BwzOIoRRZ+o4yV7w10Ojni55Si
	0C2+PrNA==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF6Ei-0000000B2fk-1qtJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:45:54 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so44911835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791535549; x=1792140349; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYQM2I+r8judSPngvWcWEJb9im+ycy9cxj2LUpGCt2I=;
        b=uMicN0pvuwoXFcYF13scAz5Prv7s4x3p+nYhZ6xNVRQ8Qw2UxOF7swOlt3RTjIxGOC
         H7oOzbTkxBXBCuVusyX8pzrc8bCCJcfgo08daz5qVJpBlVTVS85nEliBXOLDuKhmoHLz
         uO7YqGf4GHzQNz4EwMreNrimLHNmEuu35kzO5G/PIeFmThHFxtAH4w/n5rJ27GqaVBRi
         gSrbz+idaZRPXnpuvp9ORH93SLjbzclR+f85GNJbsVC1cV+XrZeBH2RVuCYtWsPFsfLD
         veE9zaGHDBjWp4Js2h0NW6cUl38//IVLX4Skh4ZCF4fvq1fLGwylLyv0Lxaii3HjxNrp
         mI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535549; x=1792140349;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYQM2I+r8judSPngvWcWEJb9im+ycy9cxj2LUpGCt2I=;
        b=vAEjfoA1uoVblDTEHgNThM5Bczrk3jNv49kLdsttuRrU1GJSvOcxaCgl1fKGzkNFzq
         GsYPIZ7aEJfo2TVA8DlS/470Je0G/XGbua0wvEwtExaEew1wjoBf7AbhEW4xj1YprF4e
         BXeDGI7WWAMfTeLcs5zbdfe+sJehb7B35lTmIPvM5OP+XnnDtPrcVDrk64NrJLjeniH6
         4Vo+72guE9cDXkDkNZ9gLIFDhEcSx5+FaXJoI0QWpjYDEz+TjYGkY4ELkq+qicElKpNB
         0xtBZYE5H3MkcV/wIzOluJNXwo/znBaIH0XEJYbsKILDIDqk+G9r9sGL168cawEMQkjM
         JzTA==
X-Forwarded-Encrypted: i=1; AKwUvBxY1TKxWUaSIFkC5uxhTLRmhnNp29hTAoX34M6GLSAHmlmPZ5j8nV/3pZBl2XJwftoLlrK1f+RU36MDeR/eby5s@lists.infradead.org
X-Gm-Message-State: AFuF++kMneQ7LH4wA7Ubna7Q2K18HtH8J8usuY/VkJn7oiwyVnCJq1zs
	YV5kLjM0IzRIJiUwUauegjQ4LLpsI0PHIxOWN8oi8VlcdI4NMICupjweVzVDs539vbHbIQhp3NF
	mT5bjgwL5b/jJv0/CAz7vAQ==
X-Received: from wmdv21.prod.google.com ([2002:a05:600c:12d5:b0:4a1:7101:895d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecb:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a18e4adcd0mr22678935e9.15.1791535549080;
 Fri, 09 Oct 2026 01:45:49 -0700 (PDT)
Date: Fri,  9 Oct 2026 09:45:29 +0100
In-Reply-To: <20261009084529.462577-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009084529.462577-4-vdonnefort@google.com>
Subject: [PATCH v1 3/3] KVM: arm64: Add host_hvc hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_094552_792589_E7B8C897 
X-CRM114-Status: GOOD (  11.29  )
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

Add a host_hvc hypervisor trace event to log host HVC call IDs and
return values.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index c1239d78c8f9..a37ba9db1cc7 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -60,6 +60,19 @@ HYP_EVENT(selftest,
 	RE_PRINTK("id=%llu", __entry->id)
 );
 
+HYP_EVENT(host_hvc,
+	HE_PROTO(u8 id, u64 ret),
+	HE_STRUCT(
+		he_field(u8, id)
+		he_field(u64, ret)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+		__entry->ret = ret;
+	),
+	HE_PRINTK("id=%u ret=0x%llx", __entry->id, __entry->ret)
+);
+
 HYP_EVENT(guest_hvc,
 	HE_PROTO(u32 id, u64 val, u8 handled),
 	HE_STRUCT(
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 76d08c503dc0..579615e3b2dd 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -996,6 +996,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
 	hfn(host_ctxt);
 
+	trace_host_hvc(id, cpu_reg(host_ctxt, 1));
+
 	return;
 inval:
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
-- 
2.56.0.385.gd3acb90ef8-goog


