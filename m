Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE274C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzz0jXpTSjvajgmP5WETefk5h6QUuCbHINLblfWMNco=; b=HNQz9niQv6sAv4hEdg2t8vQquV
	hEU6iViqo/TyJZfpUDE7NOxzENUTSeXNvpg95pt0lLbIdU02ojYbd0IBlMwvCf2RxXVsGoZhtKQEU
	yCDob3VogVAZ/zdnt76YS53JIZ9t+CijXfAF/lggAJCYHn6+PYCVhpPvBzh0+MFbtWxJo+tKMvcbo
	CqAI12VzDRhmfTtxZKWCxsYMI5X0QZpbyBP45IUdyeK3WHc77AXo84HrmSuSrvkJjmJyZJvSA8Qek
	XK7+dqzHY9xX3ALU4OaLr3Za72BGdPGLk9oRX/7QfGURY2701jBTXLta1k5/gICtZkl9FRKD2vvHn
	E+VwNRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislh-00000006x33-3Wdi;
	Thu, 22 Jan 2026 11:22:29 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visld-00000006wzx-2z5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:26 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b8773bf3ddbso72149266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769080943; x=1769685743; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzz0jXpTSjvajgmP5WETefk5h6QUuCbHINLblfWMNco=;
        b=cbUM1XJuXELxHcptfBXTrcuLYUwq77BXwBMQJ+CSfqbklcTRGoWSIr3CmW8XtR1vqn
         bszNBMaWqO2JYOnF222FosIKNMWqfms2TkRxzD3uomLzoea5JE2JMyylNQeROHvKh3dj
         KlLuhMFsmQP6Bk5pJUh4WcoYVfIkE30do/VHNKx6TuAP1xEAdB7c7Bab+5y+y4cF57nw
         ZxHvvX5PZ8DgfPwW7t5szMcq2P4AiOVafhKMbFKCHXtp2bmDKGVjB7frfLB0gS48dXMB
         FiraD2hXT4yXJrUb+EoMosWYtMRfG0vCKgzz5eDITnTKfPv2/w/K76F7NujjHubdyMQc
         4Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080943; x=1769685743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzz0jXpTSjvajgmP5WETefk5h6QUuCbHINLblfWMNco=;
        b=JkyFjp5/AuB4kIwmZJL0M6SR4Kjs2efIn6WUOTq3KvtyBeyuKZLbGWuwejqSvCci9r
         xX2nZXVQuOJ/En76YDiiWM+QjhzGLoQw5RhcMbN3koGMH6C4mQJQLAVO8P9fxshqEbed
         Cjzjs3zdV1KSGMwGgeDsjN4oJP+TdnrSL+PKfV3KDh/3Lc0ZwlksQtYxjRsPPaZlIfgi
         3hkzplk0vwfybq154Ofid0buhiwb6quwSS/hd++ikYLOHsBYYxeU0GJCI92EGhwszncE
         a93yxqopUTDKJ4rFbFwEZkPuUSvvSg6yIvk9oCO/mqdPpoZx+GBvhN4E/7OIGcPo8W/v
         QLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeuYQGGGZWA80/IaiObJxEzqcbh/NajuS0lFhmJoZ4r5lRR6r/I8Mo4Rlg5gN25Yx2PlWD/1+tvR8W4oM1QhV6@lists.infradead.org
X-Gm-Message-State: AOJu0YxtEmKYd3w+6u2Y6dWGLYUGpQfjs6xZFaz2ECDbhLCAsWHKI3Ce
	GJq3zqf6Kg+ivzZ8xXMlgEjsqCdxCxJKafYiiY+vKvvLHbpfGVqXsqJeU8aVgg/Ywx5XWxnD4UX
	ABg==
X-Received: from edsw3.prod.google.com ([2002:aa7:da43:0:b0:64b:595b:709f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:fe07:b0:b83:1327:920d
 with SMTP id a640c23a62f3a-b880005a0e3mr620986066b.0.1769080942869; Thu, 22
 Jan 2026 03:22:22 -0800 (PST)
Date: Thu, 22 Jan 2026 11:22:18 +0000
In-Reply-To: <20260122112218.531948-1-tabba@google.com>
Mime-Version: 1.0
References: <20260122112218.531948-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122112218.531948-5-tabba@google.com>
Subject: [PATCH v3 4/4] KVM: arm64: Use kvm_has_mte() in pKVM trap initialization
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032225_763612_8F051465 
X-CRM114-Status: GOOD (  13.03  )
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

When initializing HCR traps in protected mode, use kvm_has_mte() to
check for MTE support rather than kvm_has_feat(kvm, ID_AA64PFR1_EL1,
MTE, IMP).

kvm_has_mte() provides a more comprehensive check:
 - kvm_has_feat() only checks if MTE is in the guest's ID register view
   (i.e., what we advertise to the guest)
 - kvm_has_mte() checks both system_supports_mte() AND whether
   KVM_ARCH_FLAG_MTE_ENABLED is set for this VM instance

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8911338961c5..9b933424e70a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -82,7 +82,7 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
 		val &= ~(HCR_AMVOFFEN);
 
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, MTE, IMP)) {
+	if (!kvm_has_mte(kvm)) {
 		val |= HCR_TID5;
 		val &= ~(HCR_DCT | HCR_ATA);
 	}
-- 
2.52.0.457.g6b5491de43-goog


