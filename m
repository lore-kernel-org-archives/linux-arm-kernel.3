Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A7FF53D80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0JuPFNs4DpwbGKwjvMOJ2DY/fNaxhc2eTovF8AJup0=; b=t7YN5kXsjaPMbz0GvGwBhen3tx
	vukpdW1aGH8W6SV3MWKifav0Dga1XW4nmFFfVpSeGIVYifbiRpDwLQZKnEwrTUdbXBcvsjVH25Q8w
	CIS4XcRwxtk7ovpqiTS0yPx/k1TEhKqWk86pI8k7h/qkbe8UtDVT272VSTM8Di2kNKigfHgVKSsCo
	NEM5ZmRdDWidHyrwFQJl7XUdlQe7cbGMtQXPZfG13pAnMnM7AoPq5z9NLyEEv8fvE1Tb0KIcwqNhL
	6A4Dksk3v++s96W/RcqY1YISGXNpFNRHhKa0RWbyHi93sM2BK9cudoTgwRORYRQ1LT0T0rx1w+VMO
	7qYYA/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br7-00000004ZzW-2ZNa;
	Mon, 16 Mar 2026 17:35:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqy-00000004ZsP-0fPk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B0JuPFNs4DpwbGKwjvMOJ2DY/fNaxhc2eTovF8AJup0=; b=jZZbqFAIpshD/b7dAzA6qeNScB
	Ztbgpz+YXwAnnJBd52gt31YsvVwV43IlX4SSboz+yO+g0M4mDzmnzPrVcrTe0MntwYLlMH5KvMpA8
	3uZ2iyvkSJurZ7mMTgtopfBy+MgclvjwJnFMvQ603Llg9tg/sil76hfPw2/c1o0wPayhl5lCZFSz2
	uStSxcAptCKdKjF7hQf1nfZ9o+0kmfwRc1HpDMzFHXqbmXzmIe0yeMRaJfjq3AESlhF9ufEvjsQl/
	CHsRve0Rgxm0pdZBISwZi8yyYIczpd9TNzFezMT5oMq5gXsNYhmwNIYI3h7Kn6BKnBwnKbZXhKrRt
	St5kwlGQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqv-00000007Lu3-1Eyp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48378df3469so36948285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682540; x=1774287340; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B0JuPFNs4DpwbGKwjvMOJ2DY/fNaxhc2eTovF8AJup0=;
        b=kw++052twEpw+/jyXA1kpJZsHd3vUX0qeC4BtLHGalBWu3EqNYIj4Y2P7FDX262Kd2
         Qo9dFpckUGoNJ9UMfQdjL5iXLrQ3I09f8j0xts27yuHn5Rf6iqe8/oGQ1rtiqULSz3y6
         XBK4vAN1GpB3OwWHjWf1itNeqOkz4tXWeEdoHv0UHDJlfJa2igDQJplP/MrKeTEiSAuF
         emDj1Pn7O/gucqTNpOHcwLZT48e+5niZDUhEHwr1qAQ2Edi757sIPe0I3AGT1OdLh5HX
         C3V7I1hLWCEF3c1LMuZK3Vlms0SggYOGfV2ZrvRJec2UPvCWN4Icy+i66ZoYf4xnH62F
         tDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682540; x=1774287340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0JuPFNs4DpwbGKwjvMOJ2DY/fNaxhc2eTovF8AJup0=;
        b=ltwQ9awJTFKDnsKgKjIzTyfmrOJlE2maY4mwBU6i0O9DNHHm8zILokGYOH4JbsIq+s
         HgctbT4/YsKgIqxYnO/pFkGFRM4cG1mY725q2Ysei/WJrhYFYFlw22CabpDAQtryKMOh
         QPSbjUD5v2s8Pa4HBa+fJqCf1Iw2i4A50sGEdoZ3yyv7eLhcV7vv1rJiYSpnqXT6+Wfs
         W6/yzVwTOu/D331XbY4VxDlyvxT/yiQN/+p1CzQyN8+955T1FyPaMXDMD18H6hCNX7vG
         KsicpJmENx8vpL1PPegjXVjN5XFa9wh5oXGnY3W4rw2GvZAvi3OKIJOJee2zk8EsGY6G
         dT2A==
X-Forwarded-Encrypted: i=1; AJvYcCUMOeFoJqyn02jJ+ggHntXCTVenCB+/QjNXnTI3cizFafbuFUjumQ0d7uaU4e45Pnflphx6SKwaZORWDoE7KaAa@lists.infradead.org
X-Gm-Message-State: AOJu0YzpplTqRousd3B1J87H6Gm2YV6aFeFiiKnrOWdvSlbU8uJVCLxR
	wi2tbGZuhQMscfYf3NT5EIZH0YgAOmjG0AF9bH3yzyT+nOyjxpqxFNCRs1SIov/Li1DVwoVpUY+
	nBA==
X-Received: from wmbfl19.prod.google.com ([2002:a05:600c:b93:b0:483:27fd:cf2b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e1a:b0:485:3428:774c
 with SMTP id 5b1f17b1804b1-4856eab522emr8252635e9.4.1773682539787; Mon, 16
 Mar 2026 10:35:39 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:31 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-10-456875a2c6db@google.com>
Subject: [PATCH 10/10] KVM: arm64: Use guard(mutex) in pkvm.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173541_388789_5AB71BB1 
X-CRM114-Status: UNSURE (   9.62  )
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

Migrate manual mutex_lock() and mutex_unlock() calls managing
kvm->arch.config_lock to use the guard(mutex) macro.

This eliminates manual unlock calls on early return paths, ensuring
the mutex is safely released during early pKVM host-side VM initialization.

Change-Id: I902ab100f2deb4de7d6fbf0340d4aec30cf49e56
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..4a4a9d0699c8 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -190,33 +190,28 @@ bool pkvm_hyp_vm_is_created(struct kvm *kvm)
 
 int pkvm_create_hyp_vm(struct kvm *kvm)
 {
-	int ret = 0;
+	guard(mutex)(&kvm->arch.config_lock);
 
-	mutex_lock(&kvm->arch.config_lock);
 	if (!pkvm_hyp_vm_is_created(kvm))
-		ret = __pkvm_create_hyp_vm(kvm);
-	mutex_unlock(&kvm->arch.config_lock);
+		return __pkvm_create_hyp_vm(kvm);
 
-	return ret;
+	return 0;
 }
 
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 {
-	int ret = 0;
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
 
-	mutex_lock(&vcpu->kvm->arch.config_lock);
 	if (!vcpu_get_flag(vcpu, VCPU_PKVM_FINALIZED))
-		ret = __pkvm_create_hyp_vcpu(vcpu);
-	mutex_unlock(&vcpu->kvm->arch.config_lock);
+		return __pkvm_create_hyp_vcpu(vcpu);
 
-	return ret;
+	return 0;
 }
 
 void pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	mutex_lock(&kvm->arch.config_lock);
+	guard(mutex)(&kvm->arch.config_lock);
 	__pkvm_destroy_hyp_vm(kvm);
-	mutex_unlock(&kvm->arch.config_lock);
 }
 
 int pkvm_init_host_vm(struct kvm *kvm)

-- 
2.53.0.851.ga537e3e6e9-goog


