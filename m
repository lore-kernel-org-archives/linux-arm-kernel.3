Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A324ACA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSnohHHBpGGpGTNKjTwOu2NqWIBpAQaNGLki6PGnCsg=; b=GoFG97QJcCunmeTU3z4slQ3Tr4
	CVObo5A3UprVh9Oqj+n8KaLa3wK0vwd3tlrqHwkGnRIo6sjor4ycxgI5Kt0+89pI+I4i9zbltly/o
	3PWwDGXhVniHtkuq0jfABQ3+/oLZDbhF0GZnWKOp+ENX2717+UqJk4LErT75vfnYs1QjFiYEkcuQm
	LkjlDR0ZQG69lx6QvSLxh5wCslepbxveCe3TwaP8zb7qTws6VRmtnStYPbIN4lLXJ1AYVoRR1RqsX
	jKgoy5E4MF6J0mq5X4IuiXL7vE/kNUwxuXs9dcthxtjDGNNprqDweV5973D/wUkORA/kFI5HbCNyU
	jici79Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Em-00000005qkr-0ktj;
	Fri, 09 Oct 2026 08:45:56 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Ef-00000005qg8-3VQn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:45:51 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48c69bdeaacso3033420f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791535548; x=1792140348; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSnohHHBpGGpGTNKjTwOu2NqWIBpAQaNGLki6PGnCsg=;
        b=EGPp0vaS7uMPGLfw+J2nLsnjyZ2IFMG2P6cEuPTZA34/H3eNh/jgN8ZUtUxwXL90j5
         LFM435wtzvVAvjblETITBjxbE8d3MPFuPIxCmdTgDZ8RBB88RMEm4KzdaakLavIlXdNT
         l5OM9Y9QQWnmdGQhOxQI+/4BLu/SqP8NX7FlyBog8hFaUaLxMt8rasoK2/Hpusu83AlP
         ykbdJYhmvq2bHOPSB2sQ+luM4+kon99/3om2CmB9wS9745Oi9O2YszG19nshMp+UfbDG
         bz3FtzUOkKAN2IueTr6weNdRI4MjvACMCM3faUiAKSczmRPHyJczILXx5jDi5sgq50Z8
         bAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535548; x=1792140348;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSnohHHBpGGpGTNKjTwOu2NqWIBpAQaNGLki6PGnCsg=;
        b=LLtcM9Dy2+MrCXCvIfgVwGMQ4CXbpiaTUB6WhcGCqbZthI8ZdjzAQbag1TTtVM8Q2p
         uTKliJEzP/remRxCt0rIZJIdZPLDmsv4Tuv2gYJbpHzqp/mB5H9L0tvGrjK5MQb8tIX9
         KT3rDL++/HT3gQzj8bMsdNl1rkny/24kXgaYbHtJxZ6oZxSC/+FVZy5Al3H01oFMUncP
         gl1yOCo0yTVxhzhqm1kNLUTXu3lxYh+8vyfbNB2zyvM8xvT7thqRHU6rgVLKwBsB/J52
         BL1yAX6y+jMrJ5bOVEhqlIEiii/zqrYnnvWaOyGIvezSvhNRfbWXTXFDyPG7q7BtT/zO
         Dr4A==
X-Forwarded-Encrypted: i=1; AKwUvByK1whOPOrVU8X75o8uDShLW9oVFHYDLMguygEB3T7/3lg7xKaeU+RF5IbqFEj0qhEROaOc9jH4V2I3DMgZTvyB@lists.infradead.org
X-Gm-Message-State: AFuF++lLhMAzUAPkhCByC5/JEIXajpaId7pIMN03L9cXkYEewBYZ0ZZr
	x+/C8gJqHjVMBXIAw5BadMQC5mM/rcEpAqWQyZYOlU9qkSPQpiyakwiGSpH8BTiuc6kQXEabjyM
	4iKgLvj7AtHHRNwH9irUzig==
X-Received: from wmbev15.prod.google.com ([2002:a05:600c:800f:b0:4a1:7481:171e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190a:b0:4a1:746e:589a with SMTP id 5b1f17b1804b1-4a18e4aea54mr22105455e9.18.1791535547899;
 Fri, 09 Oct 2026 01:45:47 -0700 (PDT)
Date: Fri,  9 Oct 2026 09:45:28 +0100
In-Reply-To: <20261009084529.462577-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009084529.462577-3-vdonnefort@google.com>
Subject: [PATCH v1 2/3] KVM: arm64: Add guest_hvc hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_014549_891766_4E097ADC 
X-CRM114-Status: GOOD (  12.49  )
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

Add a guest_hvc hypervisor trace event to log protected VM HVC call IDs,
return values, and whether the call was handled by the hypervisor.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 16 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  7 ++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 96985c93a15e..c1239d78c8f9 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -59,4 +59,20 @@ HYP_EVENT(selftest,
 	),
 	RE_PRINTK("id=%llu", __entry->id)
 );
+
+HYP_EVENT(guest_hvc,
+	HE_PROTO(u32 id, u64 val, u8 handled),
+	HE_STRUCT(
+		he_field(u8, handled)
+		he_field(u32, id)
+		he_field(u64, val)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+		__entry->val = val;
+		__entry->handled = handled;
+	),
+	HE_PRINTK("id=0x%x val=0x%llx handled=%u",
+		  __entry->id, __entry->val, __entry->handled)
+);
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6290c4b62659..0deed0622677 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_hypevents.h>
 
 #include <nvhe/mem_protect.h>
 #include <nvhe/memory.h>
@@ -1142,9 +1143,10 @@ static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
 bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
+	u32 fn = smccc_get_function(vcpu);
 	bool handled = true;
 
-	switch (smccc_get_function(vcpu)) {
+	switch (fn) {
 	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
@@ -1183,5 +1185,8 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 
 	if (handled)
 		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
+
+	trace_guest_hvc(fn, val[0], handled);
+
 	return handled;
 }
-- 
2.56.0.385.gd3acb90ef8-goog


