Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AED3C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsFIN1Au3Dl4zaCmP13PW3DAgvYNBzVpKCYeyT5lYGI=; b=Cffyxmc76xBGtdT5QBIvHIltvM
	U6nQksqmFMEJ8cf0/9IeWhp3j+IelSOHSix4c4KfDnovn4o/WhmRRxddw2iOhbwsEQP6UIMR33zbB
	M91qw91c0ZoJERZ9FM9K7LlgT56+zGtoMqc293G18BHIbyFy/7vgRujaZTnlOon2mt4G6D9L6zz2g
	U1zrSKKx1j23RCizUAwBwSwcrvGTaEhiqvpZw6G5iitNj2JnkdGHXZYade79mDQtg7e8EM08Voowj
	3cgaFAUGXYWRI3vWDldbYoX69gu5NuhBYhU8a/BihpH/iHeXijyfriLw8qYJcPKp6Yq749P4BxgiC
	fQ8oY0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlw9-0000000Gc3n-1uyc;
	Wed, 06 Aug 2025 21:44:41 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHa-0000000GH9l-0igB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:43 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f32271a1fso373547a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510321; x=1755115121; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RsFIN1Au3Dl4zaCmP13PW3DAgvYNBzVpKCYeyT5lYGI=;
        b=134A3540Y54YRO2QeSPBU28X3oLiAbgWQhdoyCyE7OmblfFjfJqJm/5ocjl7tC7xxP
         a4zEhh7ZMgIpojyvvU/G7MNEU94aSeqbF3zGIdqW19uH5LloZtompxdMTNF6gb7SXuBn
         2vdaxiE5Pwr3gcUV98eyU+bQueDt4N617AGENDMMCumGqrCRgbhykmB0C+EDB/Pr7q88
         ebUUPxJ8CFj5m3Tr9+1EUznFMRY8HOSt0gnM9ParT2od4iektiHsLRE2BtnM2Nr9k0A6
         i6lO/RaTQ+WhpkGY+GJ2cAFYtdzQQDe6s8AbLAsGFMhtE+Dp6LzOGBKSXy20EIFTUb0R
         9w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510321; x=1755115121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsFIN1Au3Dl4zaCmP13PW3DAgvYNBzVpKCYeyT5lYGI=;
        b=FRGjrjLZ9uiuCeHM5r8Q+YvpzbhxS8bI6XMV/QShkAgKt9878ZAZNQb0m4tbXWvL9z
         i76nSLECVMdaL6nWbs+IHP6IIn4Hls0c7lwTXQiKijD+0WstG1ZlrfBQu1LkaqUAqvjr
         URUPO+ht/Of+3zKnt6r4Aobj28lV/JPBTyvYqF90uUjb/oSybwYWcyZPJcHKi48ZNRZi
         I8NLr0SrByMMjrSXIXnJx40BJidaukRGsfUWzd81KS8ZnP0TcprfYx7yR5avonyrBbYi
         3Oe8OP9XfQWoXi0LR6YLBrI0DDHhctVkyCYJGzejLpEIoBWvaNGtZZxdqkpowN0KPVro
         vYsw==
X-Gm-Message-State: AOJu0Ywyhr8TjmCEjI5ZjVrT7bEgSnAVgPBkb0UEv6t/XTBs3akGdqSp
	ylvXv7yAJqH9ae0Uv9KsR4GFVTKQaTG3pZd+KDaUaTElCBosQYRKhtyaJ1bV9bZOFzbP88EnSXs
	yudJgMQ==
X-Google-Smtp-Source: AGHT+IFbNifUFnJxYDSjClZPGiWnx/CS0ykT/Hb3U03iCPY3aeaisiXn0lmHgRNeXCjIQ2AkJAWL4xb8X68=
X-Received: from pjqh12.prod.google.com ([2002:a17:90a:a88c:b0:311:d79d:e432])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c07:b0:313:aefa:b08
 with SMTP id 98e67ed59e1d1-32175622f9emr956977a91.16.1754510321187; Wed, 06
 Aug 2025 12:58:41 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:02 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-41-seanjc@google.com>
Subject: [PATCH v5 40/44] KVM: nVMX: Add macros to simplify nested MSR
 interception setting
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125842_209850_E3E17B7E 
X-CRM114-Status: GOOD (  11.07  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Add macros nested_vmx_merge_msr_bitmaps_xxx() to simplify nested MSR
interception setting. No function change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index db2fd4eedc90..47f1f0c7d3a7 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -614,6 +614,19 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 						   msr_bitmap_l0, msr);
 }
 
+#define nested_vmx_merge_msr_bitmaps(msr, type)	\
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1,	\
+					 msr_bitmap_l0, msr, type)
+
+#define nested_vmx_merge_msr_bitmaps_read(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_R)
+
+#define nested_vmx_merge_msr_bitmaps_write(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_W)
+
+#define nested_vmx_merge_msr_bitmaps_rw(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -697,23 +710,13 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	 * other runtime changes to vmcs01's bitmap, e.g. dynamic pass-through.
 	 */
 #ifdef CONFIG_X86_64
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_FS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_GS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_FS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_GS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_KERNEL_GS_BASE);
 #endif
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_PRED_CMD, MSR_TYPE_W);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_SPEC_CTRL);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_PRED_CMD);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_FLUSH_CMD);
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_APERF, MSR_TYPE_R);
-- 
2.50.1.565.gc32cd1483b-goog


