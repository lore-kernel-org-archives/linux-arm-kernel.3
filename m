Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8CCC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRnRzIglH4bre6fymvnhTQIWpGXgBbzyHJfeoNchwKg=; b=WT6GFLyiX3NkfNwpFLHeQ97HRl
	6yIwwo/F2eeOqCv2hbWUzlhL7ti1BMAUCDtpbR9yyc8V3A4Rrp/a/RfUsv1cg+jzSLMfSZXUrYa9Q
	U7KC8lvn1SE6InlObemB0jDHWeCbzN/2kTzXZeaaTQ1Gdp1tzPHVrP20V3+vaeQfYbmJbKbIYivx3
	rJIZkGiAF+vik2VCvMb4533lvVK0HWLApFZMoLqjgLRmS98mY45x6oeo9d86tfiIQsMGOF7/0Az99
	mxo7xpiVGbL84OAtXA3d14rliq4Sqpub7TZuqYNrUU6mHvizLgwtEC6kiVqsMsNtls4KTTwKh8gdP
	mYwkyMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfg-00000008S4D-30BX;
	Fri, 07 Aug 2026 16:43:48 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfc-00000008S0C-3e8P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:45 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4956c1655c3so19491765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121023; x=1786725823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DRnRzIglH4bre6fymvnhTQIWpGXgBbzyHJfeoNchwKg=;
        b=l9cCnVBE87ptb53SSFAfTKU2kMK9wuBY8uIcthurlospYxJrYCRm+gAPpOUjVHBJYo
         hozGGXQpxs0gudUE3+yiNPAQNNgItCSVovT2+PJoDDMSHCnwfrcq9mznh6OUul8nCTeg
         JzlM+eqstvlkSoKwG3NDFR/5tSOEY1EfKClFjlUQOmXrCXEDPDtIRvD3Z8/fk3zy1SI1
         jW9VdoHRK/rMqXna/3UMZn7/GA7YEUmbEIQmPfEq2Y3WbiY19n1OhzZonN3CttEYmVf6
         yLohnxXQdqCHhvtCAiSmbmxelYrFRE0DrZ9dc1klian6m/gtQWDy2sdydlIUpNGQ+1H/
         KvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121023; x=1786725823;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRnRzIglH4bre6fymvnhTQIWpGXgBbzyHJfeoNchwKg=;
        b=Ha4NiaRkSfyyLqzdrUqKYQbv4qdMZWIOXUMXkWBFReoGe3HaIHklSFAdDVaezrf5hB
         vmqs/2Zybz1nP8uLNKsZwSQoqVgiCT+dm40I/iLC+Zp3NYE82PiLqAMVFO39gVgA8yUy
         n2c49nBr1qTkjz/uF5CXzMQUDVEYnttOfc5q2df/B275VSFoZ0k9GXGb6cMh4vuPt/De
         Qwx67QrVqITGgnkSJ8yc0AjfeuPzWAmcRgMLnP4d/84Gb03dv1gDqwU5EKVH6/eL2H7k
         9FMcuAc4biJOq9iYhitmXAUwrzYJCaE+Pzel1zkPsDR8RS1LEhlOVWO6qpPpva9ErfRb
         HTgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4eRL06CCLm8oukC78u+vYdM6rrl2JLhiVsf++HH8jo4TXvXLttWy4m+mq9KWabDvGIdsNgbXqsJS/xdXE5FVy@lists.infradead.org
X-Gm-Message-State: AOJu0YxneEm+vQYY0MAniieMOfeN3FzTw8upcTIGDi77hu7W4LPtz8RZ
	A6omWy+M4jHA9Zq8UkVdd4oQplJN6hd2fUR9KNC8u8Rp0AM99As7RfYSUfRwiKWlAAudMQ/8oT/
	GAMoeEGfFmi3cndIa5dUSuiHve20VIQ==
X-Received: from wmbhu19.prod.google.com ([2002:a05:600c:a293:b0:493:f83f:e304])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c297:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-4994e7d3395mr238197545e9.17.1786121022494;
 Fri, 07 Aug 2026 09:43:42 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:13 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-5-sebastianene@google.com>
Subject: [PATCH v2 03/13] KVM: arm64: Support host MMIO trap handlers for
 unmapped devices
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094344_932028_9ECB46EB 
X-CRM114-Status: GOOD (  19.26  )
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

Hook a handler to the host mem abort so that the hypervisor can
intercept host accesses to unmapped memory regions.
When a Stage-2 fault occurs on a registered device region, the
hypervisor will look if there is any registered function that
can handle the access. On the back of this, mediate host accesses
to devices and emulate them in pKVM.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Bart=C5=82omiej Grzesik <bgrzesik@google.com>
---
 arch/arm64/include/asm/kvm_arm.h      |  2 ++
 arch/arm64/include/asm/kvm_pkvm.h     |  4 +++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 49 +++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c       |  3 ++
 4 files changed, 58 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_=
arm.h
index 3f9233b5a130..6360c90f9855 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -304,6 +304,8 @@
=20
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
+#define FAR_MASK	GENMASK_ULL(11, 0)
+
 /*
  * We have
  *	PAR	[PA_Shift - 1	: 12] =3D PA	[PA_Shift - 1 : 12]
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm=
_pkvm.h
index ab26bec079d6..0a471564be00 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -20,9 +20,13 @@
 /* The maximum number of hypervisor protected regions from the host */
 #define PKVM_PROTECTED_REGS_NUM	8
=20
+struct pkvm_protected_reg;
+typedef void(pkvm_emulate_handler)(struct pkvm_protected_reg *region, u64 =
offset,
+				   bool write, u64 *reg, u8 reg_size);
 struct pkvm_protected_reg {
 	u64 pfn;
 	u64 nr_pages;
+	pkvm_emulate_handler *cb;
 };
=20
 extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 500c18c2fd48..7e978e0c44b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -14,6 +14,7 @@
 #include <asm/stage2_pgtable.h>
=20
 #include <hyp/fault.h>
+#include <hyp/adjust_pc.h>
=20
 #include <nvhe/arm-smccc.h>
 #include <nvhe/gfp.h>
@@ -752,6 +753,50 @@ static void host_inject_mem_abort(struct kvm_cpu_conte=
xt *host_ctxt)
 	inject_host_exception(esr);
 }
=20
+static bool handle_host_mmio_trap(struct kvm_cpu_context *host_ctxt, u64 e=
sr, u64 addr)
+{
+	u64 offset, reg_value =3D 0, start, end;
+	u8 reg_size, reg_index;
+	bool write;
+	int i;
+
+	for (i =3D 0; i < num_protected_reg; i++) {
+		if (!pkvm_protected_regs[i].pfn || !pkvm_protected_regs[i].nr_pages ||
+		    !pkvm_protected_regs[i].cb)
+			continue;
+
+		start =3D PFN_PHYS(pkvm_protected_regs[i].pfn);
+		end =3D start + PFN_PHYS(pkvm_protected_regs[i].nr_pages);
+		reg_size =3D BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
+
+		if (start > addr || addr + reg_size > end)
+			continue;
+
+		reg_index =3D (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
+		write =3D (esr & ESR_ELx_WNR) =3D=3D ESR_ELx_WNR;
+		offset =3D addr - start;
+
+		if (write && reg_index !=3D 31)
+			reg_value =3D host_ctxt->regs.regs[reg_index];
+
+		pkvm_protected_regs[i].cb(&pkvm_protected_regs[i], offset, write,
+					  &reg_value, reg_size);
+
+		if (!write && reg_index !=3D 31)
+			host_ctxt->regs.regs[reg_index] =3D reg_value;
+
+		kvm_skip_host_instr();
+		return true;
+	}
+
+	return false;
+}
+
+static bool is_dabt(u64 esr)
+{
+	return (ESR_ELx_EC(esr) =3D=3D ESR_ELx_EC_DABT_LOW) && (esr & ESR_ELx_ISV=
);
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -774,6 +819,10 @@ void handle_host_mem_abort(struct kvm_cpu_context *hos=
t_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr =3D FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
=20
+	if (is_dabt(esr) && !addr_is_memory(addr) &&
+	    handle_host_mmio_trap(host_ctxt, esr, addr | (fault.far_el2 & FAR_MAS=
K)))
+		return;
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setu=
p.c
index 64c0290da888..4395595b7f7e 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -294,6 +294,9 @@ static int donate_protected_mmio_regions(void)
 						  pkvm_protected_regs[i].nr_pages << PAGE_SHIFT);
 		if (ret)
 			goto err_setup;
+
+		if (pkvm_protected_regs[i].cb)
+			pkvm_protected_regs[i].cb =3D kern_hyp_va(pkvm_protected_regs[i].cb);
 	}
=20
 	return 0;
--=20
2.55.0.654.g21b8a5bc05-goog


