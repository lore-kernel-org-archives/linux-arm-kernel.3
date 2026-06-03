Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE09CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YM3OgQYUM4wpN2ATYj7S7HcuVfmqgGkKpiwqvbUC2NY=; b=J1Th74wmFLwv9oavaKuRN6d9se
	a0VOhNEJxD9mEuDcRLcAQpaLZSH/TdxKOnJzrzKtWkUYV7SfN3R+k1cIG6xBwznKSoPWdzuUj7+2S
	XKhEVSERzKu+J+EJQ+gaNtZUoy9p4kKObtPQjbsjssG2XOuWXVahY72nUJI+TmlUqBo3pDIViEtJ4
	ZkRhPM+Fl5bG17gcEQ7/6KodSgQ9tsFnA03arf3TtCQvm3WyMReUlmpcsXEYR3qTIKt02GcCe66Ee
	eFZwH41u8w6dQw10EGELPxpBZC48u+CypQDvRwbTdgAc89qf8h+BmphIk5CQD7HXoYNvxk1AMJ8HI
	Fg6T5hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjNX-0000000Es6P-0WoY;
	Wed, 03 Jun 2026 11:03:19 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjNV-0000000Es5s-1gVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:03:18 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef616db45so3172295f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780484595; x=1781089395; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YM3OgQYUM4wpN2ATYj7S7HcuVfmqgGkKpiwqvbUC2NY=;
        b=qwNvfaO1oey3kxnlGHPVrKOqtDU6U34T99/TTCmwty4YmAsYER+6HrYjKa6ovVatvs
         ch0LKGDiWtID82YEMywOhS97K6aEGEAVOQ6BL/G327rqaLskZ2S5ps2enX9c7ttMlbUr
         n+zJxX3GqrvUTISVP+6aTGgRe/dRMn2TdVTMD8HhUS4suTzfbT9xg4xHftDrPJEy4hB+
         aaN3+pWpEkBDtGIUiPkbplmCdgKysM4YYYd7V4zIPbJPdSKG7MCyyP/80w+3iIuU9RLn
         e+qss2kaIJEJu3OyAQfAzr181D6cUdIVU1xaBMQzUiLQcK4lbL7+WoW3WvKdS9NV8GDo
         xZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484595; x=1781089395;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YM3OgQYUM4wpN2ATYj7S7HcuVfmqgGkKpiwqvbUC2NY=;
        b=PinyX8yivInhZ+NLvZxuI2He4uqonVkZD/MSO00FegHjBKRmqEq3GAuOzyVCJwJtO6
         xouawxpE1elW8DRhvypwR+Z1K5cMpbR/DkKYO680zyWlyau6IzCrqcC0JCLt6gqKJEQB
         U5jF/rqDovuYQK6Vx5aM8fQl18JGYKUohNCJKE/WPAzg9tXshYXTVgZ8J1tXo51FJu7G
         OBHsS0TR51HMRvFXhx+72ZScP0ER6guuRifS0gkCEZ0bJEcoEkjqv0K7Q+1uDUZpYklN
         ROEtWyeHap1brFvcb2mBLsEWgi+3jKiWfRFRT0CR6BTS9Uz+/B2G99RtvrhAOR2qm9TS
         fHoQ==
X-Gm-Message-State: AOJu0YwLddDdNCwJCLR92Y0mHk4tcjPrZ0FGnK0KP08gQQgrQdnvTyiQ
	RDUlQiwm4a3nYKcYti2EEz968JoGr0C5hZGD39zKlLtvjpIGRWwt9UxI8Aj8GG7wNkXcQ0cRNQL
	LaDvndbI6cKHi3lnX0lV2vA==
X-Received: from wryf10.prod.google.com ([2002:a05:6000:1a8a:b0:449:a64d:86c9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4bc7:0:b0:45e:f266:f4c4 with SMTP id ffacd0b85a97d-460218433c0mr3010157f8f.29.1780484594559;
 Wed, 03 Jun 2026 04:03:14 -0700 (PDT)
Date: Wed,  3 Jun 2026 12:03:12 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260603110312.2909844-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Set a linux errno on SMCCC error in kvm_call_hyp_nvhe()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040317_448857_BB42A517 
X-CRM114-Status: GOOD (  11.38  )
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

If the HVC called in kvm_call_hyp_nvhe() fails with an SMCCC error code,
we WARN. However, the returned value isn't initialized and the caller
might get garbage or 0 which is likely to be interpreted as success.

Set a default -EPERM error value, ensuring all callers get the message
when SMCCC calls fail.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

---

I have encountered this issue while working on a follow-up contribution to the
hypervisor tracing. In that case it completely crashed the kernel because
IS_ERR() failed on that res.a1 value.

Now, if it makes that function more robust, I do not believe it is fixing any
existing bug which is why I haven't added a "Fixes:" tag. 

In case we want to stick one, here it is:

Fixes: 054698316d87 ("KVM: arm64: nVHE: Migrate hyp interface to SMCCC")

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a49042bfa801..6b8fd494792c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1273,13 +1273,14 @@ void kvm_arm_resume_guest(struct kvm *kvm);
 #define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
 
 #ifndef __KVM_NVHE_HYPERVISOR__
-#define kvm_call_hyp_nvhe(f, ...)						\
+#define kvm_call_hyp_nvhe(f, ...)					\
 	({								\
 		struct arm_smccc_res res;				\
 									\
 		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
 				  ##__VA_ARGS__, &res);			\
-		WARN_ON(res.a0 != SMCCC_RET_SUCCESS);			\
+		if (WARN_ON(res.a0 != SMCCC_RET_SUCCESS))		\
+			res.a1 = -EPERM;				\
 									\
 		res.a1;							\
 	})

base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
-- 
2.54.0.1032.g2f8565e1d1-goog


