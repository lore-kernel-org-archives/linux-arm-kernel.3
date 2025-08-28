Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AB3CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 00:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=; b=YlGpBKRxCxC6lKWQUQ1N4F9xrC
	ua/9OYrPTEf4Gow9ZK2NQtTkHj/uA1ikrSxV4KMn7ZTLLtFo6zZCzFQUmeXNZ7Sf4rdJH0ypntsnY
	FcDeQWgIw7c6OYwC1+7DPe/CXdpCoqSTRbDB2VumWzGBxR61jBhtRTmXtpQhMLuvNjzmsrpjswa48
	zviO/jJ7lTgign+syp4X9drp+e8rX0q6TOsSGewGNn1J+XZIlpf4Dp7HnWu3o9gpC0RdKmbovUk7u
	p+8Pfd1cCCA49qyD0o3sL2tdukVEk/usWGppoA7oOzP7ooDNYxOt+yfwaks316RMK3tJwJiYsfvli
	VgzP020w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQBB-0000000HJZf-1HdK;
	Thu, 28 Aug 2025 00:07:49 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5g-0000000HI7V-3hK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-770593ba14fso519150b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 17:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339327; x=1756944127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=;
        b=aLQsNc5VcQyFphTAsJy6ijoKrLolbsComEwb/wy+j+TUUH2UCLbtxQvVHijA+X9Xp+
         PVVKwxorK4sjsqC5dwPx9EH/L6b686s67yzk9H/CRmjJ4sqDWIIEGquWxO+16UKD4EEo
         TKU9sD54SAAn6Zw+dggPgGD5l/zEzZmljzpkTytFYsitAG4NzKtJgzv5zsmV8rlew97t
         eSvqhJsxhBQAOQqWrivKQryeIIiyyZl1Neo8eRPSuG2M5XFvmoBMc/2wku287FbHfx6V
         IMpASm5fUWgpDUDRtngZkcKQErVDjKov2LbHrMBXV7lbjUT0h5H4tgNGusTW9M4XSbYm
         pFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339327; x=1756944127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhbQgqknyAyVeKaXs8kP6grJ1hrwQUkSmJiE25IRpuQ=;
        b=VbeZdsLURaZivUwD21JiU47PsUr9GXPO9kXRb0x95xj0yPuizmF86sieeV/5wVm77X
         PagJW7kgfDcSlwd+0FCKo6yGbgvMvtHWNDjLfzrbAetSuUH03uGx9qCeUAVwiIxvCShg
         SuWauT6iIgsC25Y1g0IbwFdjuDLsCC4dZW7Ba/DYA+g0SagqHjsGL8zCxc3HyTBAstwb
         OwfvKNzcO/aZyeWTBjvvZsEyh5a+0qhtdcIC/cbZuKPuy0TJWwbOYELNIk7DcqSLpdpM
         gm7pXKoYdO8UNWwflZGjn+p3rcymunEJow+uU8Rovbb3Mo+I7poxGOD5x0PRoCQhzSal
         L12A==
X-Forwarded-Encrypted: i=1; AJvYcCV113FSeSSsxxnXwPNh88RNcqIu+aNwzm2WrUGl0eNl/GksvCz/IfNXIBLnmIm++xj4gCGvNc2mAh2RY8PzBKbw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr1EjA06d2sBxipkbp/5qlGQ54sPAHp9uT5TZLSdC4s1tmlP/m
	guG6CEP/L/O/aXdqwELHfJB/Oo7XoVbdYJZIgzDqYbjChqB6zZvsqUQLDMCGy3B3wYxH4Gnhr7b
	eEplbTw==
X-Google-Smtp-Source: AGHT+IFSTSPK462uYm9CJ0EAHOKjQ8TiWstiYBGpgePwdPA6VvAffLDDZpu/ZHt6d1MsFofssMNf6pVc4TI=
X-Received: from pfbdr10.prod.google.com ([2002:a05:6a00:4a8a:b0:772:a5a:298b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b46:b0:76e:885a:c1c9
 with SMTP id d2e1a72fcca58-7702fc24f39mr26347774b3a.27.1756339327187; Wed, 27
 Aug 2025 17:02:07 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:52 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-4-seanjc@google.com>
Subject: [PATCH v2 3/7] Drivers: hv: Disable IRQs only after handling pending
 work before VTL return
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_170208_921892_FFE37A51 
X-CRM114-Status: GOOD (  13.07  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Swap the order of checking for TIF-based work and cancellation, and disable
IRQs only after checking and processing TIF-based work; checking TIF with
IRQs enabled is a-ok, e.g. IRQs and preemption _must_ be enabled before
handling the pending work.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_vtl_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index aa09a76f0eff..4ca13c54c0a0 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -735,16 +735,8 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
-		local_irq_save(irq_flags);
-		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
-			local_irq_restore(irq_flags);
-			preempt_enable();
-			return -EINTR;
-		}
-
 		ti_work = READ_ONCE(current_thread_info()->flags);
 		if (unlikely(ti_work & VTL0_WORK)) {
-			local_irq_restore(irq_flags);
 			preempt_enable();
 			ret = mshv_do_pre_guest_mode_work(ti_work);
 			if (ret)
@@ -753,6 +745,13 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 			continue;
 		}
 
+		local_irq_save(irq_flags);
+		if (READ_ONCE(mshv_vtl_this_run()->cancel)) {
+			local_irq_restore(irq_flags);
+			preempt_enable();
+			return -EINTR;
+		}
+
 		mshv_vtl_return(&mshv_vtl_this_run()->cpu_context);
 		local_irq_restore(irq_flags);
 
-- 
2.51.0.268.g9569e192d0-goog


