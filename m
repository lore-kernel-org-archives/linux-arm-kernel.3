Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F9FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiT706MC/v/5WfOS1GqIiRFWN/xkPeYitBY7QIGoTso=; b=GFnv9o2GcH1C0z8dH/aw3TMnPe
	j1KKXkLuxMEw10dZwEezjhdvRN6ckWEnv/D5a15e8m26rLYeS6+f+XaS+6pr78bd7/XzYLySBt9i/
	Q55SFiTsxOq4z6+VG5WgWigeLomyd6hpM/lsFSr8t/npqOt6NxksXmNVB5jG2JJ0Htd9DRdLOE/5E
	Z/DDd+TmKJVpGfwPY+z71jYUWryQhVVkSaj2RcOy1CmTCpE8Nxf7M97/poMHQCKcfO3OwHyU4/DVB
	xPwXslZdEHpXpXPnzuRC5I5vI94yQLFIk5XsZbKW0TilHI5Igb0niYK3RfDzjUFJHQkDe0a0ggMAQ
	2YqXKNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO04Y-0000000HaPh-1OCM;
	Wed, 18 Dec 2024 19:51:06 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzv7-0000000HYM5-3lxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:23 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa691c09772so41066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550880; x=1735155680; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiT706MC/v/5WfOS1GqIiRFWN/xkPeYitBY7QIGoTso=;
        b=N1Cf8BC7kBbR5qpP00+HVI+QZH58To9/YGJWbDLjM8T+el+71E+pkA61E6uOhD09hD
         45IwOxhPROjF3z5Eqzdl2Q08QI3wnr2p2LoVwm0jCdOMzi9PR19YirzFtWHa0nE/wlbf
         cfSnHKlWk/m+i/yqtczZNLpZfF0k1AVOAKmFK1teLbbqAVSCFzHE6zx3rGHarvyOR9G3
         Qx8Ji2ZUJFu/FEvLPL8GeHNZvP8ogGUsDDRM0hPDhYExBupWfUzdlTspD7IKURpDwP9+
         POdDlVRj4CdGobnbvQxOhTZv/Eo6JMifyGnvg+Wol1jTt0QPV6R6TKFvY4KzHOH+nhj3
         uXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550880; x=1735155680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiT706MC/v/5WfOS1GqIiRFWN/xkPeYitBY7QIGoTso=;
        b=DiVVArwOqNZRgQzdEKb65UNkLfhlV3enLdiJtJp6PZtpktID/j3Idrc8KJM/Aa4K/3
         Vp8PYRIFnAnbH55EeG+LJGgUs7S+nItN3XxLlWsFRK1CkZ3jgjgyD2bfG2EYFuV2W6Lk
         xorVvtULTwKRT+NeanwjOVpPFi5G2aBzvwoTUt8rQs7gi0SPuUWmzz3NQ5VOZ1caVjA1
         KHWwK9Foub3MNQ7vmMR29VzDw9q3DBb6blvj8sfnLo0Fn5OsLPnrtHRj2EuKe2Ai+lf8
         TMGeKhkEQUkZ+9ICVS5AOmeAdcAi0GpvwkQ1Y5lt+GXTGR2mdaUACdQwTOdUICdv2vio
         qo3g==
X-Forwarded-Encrypted: i=1; AJvYcCU6GgDVcxrm+YapAmRl+/7wnlFYOgqTw7Hc5XX5p05kJ+Ykl3NuAAH9MOPDY8w++N74wHq1nsMT6T7Xs3zPGMll@lists.infradead.org
X-Gm-Message-State: AOJu0YzPvYk1eY2GmgA69I1geMPfXmID8FQOR+Qu4Rf6XIxiawpqgocJ
	V9iGRR2Grq2PiyIxJ4qlu1wOxHrhbHUFAamvsmu7j2Igsd+2vjSWMe7nAevuBEGdXSAvg5JiBkP
	DkcGHbQ==
X-Google-Smtp-Source: AGHT+IFWzxNIIarybqKCC1vLUo+KqgKX+4fV6W/RAvufSsLnQ/TfrAjnGZxwfp1b7qx032X10zEJNqov2L7r
X-Received: from ejctz5.prod.google.com ([2002:a17:907:c785:b0:aab:9ac0:2adc])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7ba2:b0:aab:76bd:5f8e
 with SMTP id a640c23a62f3a-aac07b905fdmr61154666b.53.1734550880082; Wed, 18
 Dec 2024 11:41:20 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:49 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-9-qperret@google.com>
Subject: [PATCH v4 08/18] KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114121_933735_8E8441BB 
X-CRM114-Status: GOOD (  11.42  )
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

In preparation for accessing pkvm_hyp_vm structures at EL2 in a context
where we can't always expect a vCPU to be loaded (e.g. MMU notifiers),
introduce get/put helpers to get temporary references to hyp VMs from
any context.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 24a9a8330d19..f361d8b91930 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -70,4 +70,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 071993c16de8..d46a02e24e4a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -327,6 +327,26 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm;
+
+	hyp_spin_lock(&vm_table_lock);
+	hyp_vm = get_vm_by_handle(handle);
+	if (hyp_vm)
+		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+
+	return hyp_vm;
+}
+
+void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
+{
+	hyp_spin_lock(&vm_table_lock);
+	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	hyp_spin_unlock(&vm_table_lock);
+}
+
 static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
 {
 	struct kvm *kvm = &hyp_vm->kvm;
-- 
2.47.1.613.gc27f4b7a9f-goog


