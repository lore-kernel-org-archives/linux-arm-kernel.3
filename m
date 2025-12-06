Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E8ED3ABC2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=; b=vphx29QfuaALamaM+LTFfDoSS0
	axh+z7h4/72/laTPkYAfij8ZknPSbaYyZpe6xCIj2FSVYpD5y4dZSx8crHUgxr9AwDkuZkta7TSD6
	zy84fjR14VlViILQtEnleizWD5C9sx6lDSivCMSyH5Lfnwximz/fAR06NqnnNLl1izQy8TvEPwsrt
	+KdrzitPGS4FakFrwYLmOY/Nz3YTrJle+VsJhwNbsZ1PCF1/gL90C+zDWidSvpCJI14gofYvzP4pF
	r22/IZQkxwTy8ahXLIpXpOnWlf7IQ1HzSk2TVhcVRA/+vdlf4iAEHHHbQ7onnNGRX9FA5ySQGEdXN
	fq5bASHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg20-0000000AIne-0m6t;
	Sat, 06 Dec 2025 00:20:12 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0a-0000000AFyX-28j3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:45 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29da1ea0b97so53775775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980322; x=1765585122; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=;
        b=tdmL7xKhjLhTZVduKKDyjxC2Rkv4DCSprkYlytrxOrN9MDh+owlmiuk20D54TzPqKu
         bIS3iuZzzooRFJ4fayglAo35iNwj231izzXheNcUQP+v0EtxKVYag0Kn2/CyiLgyP9m7
         q8hz+PqdKCAzSsft3DTlZ8v98+TSKtHaerCzUpUhxTQUQ8hrHzNhuliIYGbxh6DCimF2
         5vTanPGfLwHwyBlFkL5azpgddGv2+V++NJNsmKdgkJojaVVHqeMN42yV4+M4VYXi/nHi
         AQbBwJyJcKpGYi4taQihlD/Uj6LdMsgGylzi9kVVu37K+7kfASPPHTwC72ksf9s+G8j9
         9Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980322; x=1765585122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=;
        b=uxfkTux3giPbFTTX1DatwLPaPJyXUkT1uNrromL3C9j/tszDgdOTOQQ5nfXai9IbJP
         S7xM1pc3CWkoYZ4aNcM+RLV7wO0mHdBDa2q9Ikl1boZGFceCLxPR73xWsmIJOkQMTZ/t
         31jPm0M+dgQv+hGiQgQWstiCqGUjq8er1/nKB7bwq+mOiAKKsHRhlh2+RHsUWNbLQUju
         i1OA7gQymwRk0AoYAaz9shWhln7JLPrX+eHerVXwMIboe42Zdk8VW/kEQruKgGDnymUM
         gUuHR4fHm7Lb0spE8WPq7a2riKR1OWi0Utf3bDoB50lQBykGAi+KUDBAoKSTa+Jx1z+v
         TbTA==
X-Gm-Message-State: AOJu0YwhY8Fm2pC47pWEAshzZxBPL1MK9q33MgU3MMkvO/dDJABsSoq9
	TLHwALT3/9Z5JGE8yGRBPTs5fjCNo4EvORKRDfqE93XuPyaTptvn40kgf22WqzYsSP860BB5cFB
	qnXcIgw==
X-Google-Smtp-Source: AGHT+IED91Xjb0+dxO7/M2E0zHU6IQhei8lnafvXM15EOvowaasBkt+pNEKc95Jh7HmLdvF7r/s8Wu6xUzQ=
X-Received: from plbky13.prod.google.com ([2002:a17:902:f98d:b0:29d:5afa:2c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48f:b0:295:62d:5004
 with SMTP id d9443c01a7336-29df5695ff4mr7109145ad.26.1764980321808; Fri, 05
 Dec 2025 16:18:41 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:13 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-38-seanjc@google.com>
Subject: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from VMCS's
 auto-load list
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161844_607507_5768E276 
X-CRM114-Status: GOOD (  12.29  )
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

Add a helper to remove an MSR from an auto-{load,store} list to dedup the
msr_autoload code, and in anticipation of adding similar functionality for
msr_autostore.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 52bcb817cc15..a51f66d1b201 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1040,9 +1040,22 @@ static int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
 	return -ENOENT;
 }
 
+static void vmx_remove_auto_msr(struct vmx_msrs *m, u32 msr,
+				unsigned long vmcs_count_field)
+{
+	int i;
+
+	i = vmx_find_loadstore_msr_slot(m, msr);
+	if (i < 0)
+		return;
+
+	--m->nr;
+	m->val[i] = m->val[m->nr];
+	vmcs_write32(vmcs_count_field, m->nr);
+}
+
 static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
 {
-	int i;
 	struct msr_autoload *m = &vmx->msr_autoload;
 
 	switch (msr) {
@@ -1063,21 +1076,9 @@ static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
 		}
 		break;
 	}
-	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (i < 0)
-		goto skip_guest;
-	--m->guest.nr;
-	m->guest.val[i] = m->guest.val[m->guest.nr];
-	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 
-skip_guest:
-	i = vmx_find_loadstore_msr_slot(&m->host, msr);
-	if (i < 0)
-		return;
-
-	--m->host.nr;
-	m->host.val[i] = m->host.val[m->host.nr];
-	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
+	vmx_remove_auto_msr(&m->guest, msr, VM_ENTRY_MSR_LOAD_COUNT);
+	vmx_remove_auto_msr(&m->host, msr, VM_EXIT_MSR_LOAD_COUNT);
 }
 
 static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
-- 
2.52.0.223.gf5cc29aaa4-goog


