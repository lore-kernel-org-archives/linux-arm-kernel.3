Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E45EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmEFD0EBHHCbQjRU4Ho1kLwGkicc5ODUkU4+n5Gkins=; b=mh+8bm1m9PRZ1cZlmltIoa1s5V
	T5+g3Mly18GcCdiWOoL/ODCFY6NrDNTEFpl55i/47fqyzmnXj52Q/PPLqNEfl7YW3qu8Ln9Cqgn8i
	7yfZIKiBgoftnjBTURZYyiZiRWIosHdoLKKgIKJIqI05eLkO6NjmX9kfFwVeqBMxlFbfk7h9z6Kin
	bKtaTZy2TqEto0F3GU0xcOZUmpZgU3hpqlBLgnHzQjn31hOvdJmYScvnaGHA4KaRMZLszAHXeT4ly
	OkyTNHBYe/mjAfSeLK1Uwhol4WYBveA/HsfkO2e5VahpV1KVxwr5lufKozHdWQTRnLt7jdAfeN+Fo
	+grbehxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzOM-00000000TIy-0nif;
	Thu, 07 Aug 2025 12:06:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzJS-00000000SoZ-3zFs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:01:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-459e0f54c88so4720655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754568096; x=1755172896; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MmEFD0EBHHCbQjRU4Ho1kLwGkicc5ODUkU4+n5Gkins=;
        b=Eu4uqcgdTs+WkGyx8/lbqLtNeJ7hKei+h0gFsylOiEK07VMWipSgKcHFM2S0Ixm/6L
         G3VxfhHmXlRD/5h2+2Om7qJgYv+mCgrVuZl2IZAHtMKlQCFOIJF0Vq0Mo77svHMTw9dP
         BxdQaY1iwCEip3OgSa9mQAgc8upgTX6YDmsWbQRGmbo95VfM/SWXE8XotcrHJAbZsblJ
         uHb5nK550dE5pzNCEWM5Czkef+HML3XGe4fhkdUR3lcDgh8KtIFuv26iYXYNDxSoiyCU
         MroLusSjaJIOcWiOyIw5Zs5wL6QHXO2MuSVKVgx4irn5JH0pQpsTz5HyAZAcRjqQ/utM
         4cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568096; x=1755172896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmEFD0EBHHCbQjRU4Ho1kLwGkicc5ODUkU4+n5Gkins=;
        b=BmGQJ46tHD7TochoSTLOBHQAxD1cqVjVQC1XQrd80KASthOKB4Hatz5i1VW4MoqxBz
         sJBN9q81DEFFbUvlPb5GgLju2bNBFznnGVJ9f8WcKJHlugWatzvlM5c7+sQQgDEHJCY3
         0BImWXdYeAWtuTwmDXZNBu4NfQm2bnoSkTKnqF0ZmFejBD0FO/DYgSt01YfO/XzneFS7
         3bERJR0a4VVq/kWMyMeEtQG39QL0gMMKnrB9bCmaNpb1NcujjwR4QQBTJAtReX9zhCF+
         jTq9p/zt82ZdSzQpfyAkOSHW8e+s9u9KWuirOKHik+H41bbEVA7WBDE+nVPDbnbN+/VT
         iNjA==
X-Forwarded-Encrypted: i=1; AJvYcCXQt0Sc6bYSpt6sZc8QstYIhOBBRmyF8VvjN10hHAezg8cdTv7nk5+jjE7fQcT8xZzxm7+VLT3X0KfFTEwgFZ5C@lists.infradead.org
X-Gm-Message-State: AOJu0YxyijoqxQNaRSU6Sf04H/a+FWiUbGJaF4sbS2KboE1lBKMdi2TC
	LeZgmLUJ2JlkQ2ozUOkuuX7DdQLSL3xermCpdTtH4Qn4+6Rd4gpufrR6CpEKYjVEhIOlic3Zvkz
	PjQ==
X-Google-Smtp-Source: AGHT+IEmpiZ2nf55Jh9uJTfBQmAxp4UNraapK34c6dr71U4u9eBljMgOdK7u/bo0AUdVstmW33UDMvX8rQ==
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:459:da33:b20c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f46:b0:458:d289:3e26
 with SMTP id 5b1f17b1804b1-459ede86e31mr32019695e9.2.1754568096496; Thu, 07
 Aug 2025 05:01:36 -0700 (PDT)
Date: Thu,  7 Aug 2025 13:01:32 +0100
In-Reply-To: <20250807120133.871892-1-tabba@google.com>
Mime-Version: 1.0
References: <20250807120133.871892-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250807120133.871892-3-tabba@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Sync protected guest VBAR_EL1 on injecting
 an undef exception
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_050138_987631_473F4D59 
X-CRM114-Status: GOOD (  12.54  )
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

In pKVM, a race condition can occur if a guest updates its VBAR_EL1
register and, before a vCPU exit synchronizes this change, the
hypervisor needs to inject an undefined exception into a protected
guest.

In this scenario, the vCPU still holds the stale VBAR_EL1 value from
before the guest's update. When pKVM injects the exception, it ends up
using the stale value.

Explicitly read the live value of VBAR_EL1 from the guest and update the
vCPU value immediately before pending the exception. This ensures the
vCPU's value is the same as the guest's and that the exception will be
handled at the correct address upon resuming the guest.

Reported-by: Keir Fraser <keirf@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index bbd60013cf9e..71d2fc97f004 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -253,6 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
+	__vcpu_assign_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 
-- 
2.50.1.565.gc32cd1483b-goog


