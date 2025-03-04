Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31562C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ygttRTKf7i4hHwUkxbYRbNGqV7dr+gxLZlkMmtHeME=; b=PloMIGTIYBCURdIqVOgPOdRs7H
	f5eg6N0r0mDIMDdkwd/40PuwTYRh74ZqsL4ysvVqy5crsOCvMQce9GMdRoXG49jTFzicov8iW7zD5
	riFgL0Njn/Zs2K3np7X+wCgL7PGk4ROQKPcTSxd88kCc40G0HPPIrrCpsDLgktKfUb0Hl82E4dUd9
	mHi+Q7VjkeJwvE/tlVzp24f8S/3/he1gUFdEpwQVmisTkWvwWSkoi/afFvLMqaDM7Im3jhkPHzTw1
	jkuU/BbE8sjSanwxBfoX8xNrXbNa5DFaDY2CfglO9HO1jiu+DrsLxjzN+RFocbdwIiI7aOWKa0sr8
	x2V7SR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTPm-000000051eC-2ns6;
	Tue, 04 Mar 2025 14:38:34 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTOC-000000051Po-3TAS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:36:57 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-472098e6e75so214401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741099016; x=1741703816; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ygttRTKf7i4hHwUkxbYRbNGqV7dr+gxLZlkMmtHeME=;
        b=v1kkKRLn1vt/IguuvWU1KNAs0GK+9TPXAHlQM8y6uxVII5aHfgl3jfc6uMheMKdSCO
         dkT0J7Ng+tBCrueZqq7d1KEZME0aV811/uQnXTYueQL8ocZrWLxL756DUQHKvdpZsxuZ
         JrJh5331ZQWSCbDQD3ZQbO5+cdtsiMdUBtCktP0IvbCk5CcURSONLnUqyhdDYJJpVdBj
         UvC48QpCFvaDvzYhJBrPK+3GMe+e4uBcLBMMPKV1JzfCbJUn03up/0ZcymWTi+Rm5OV4
         xx9LfKJA4d6qiGeBN9sHExhldp8wFbE5DSToEz7yC6donlFF4Dz7kHz8BCyg+TZ7YAfj
         ICPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099016; x=1741703816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ygttRTKf7i4hHwUkxbYRbNGqV7dr+gxLZlkMmtHeME=;
        b=t51C7IveGEWIkm44zl4lv0H+L1UJWTVJX5JGQ0/jyGIMgPndj1ezooFv4sAaRYxNo+
         O8FYgiTH4D7vTqArBLZSjEmgOWuXBc7j5pKbVm8+l227kjgYnhh08p4bR5aChy35DGOl
         daYRDhdub3uEO40hN/iE5lNT66niLk48rYLRLN54ITpyUbwASRV3PsAxo1iOkXrId94F
         eaAi3wP3+5ZTaALWHYrDusj6sBK6lvT3SvV20wsKm8lG5J3BhFqYi3tvQxE5jpSMROhG
         PyZ+9P2d3Z4pcJZDUMKwyFtEwQrUrgvoOgACp6/LkfDRwQ6gl96adB5mCEXpQAOufAlt
         TUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyrNiM3OsMmLA1X2QngP16wiYsqGYV2H56JCleg/0axlh8NnEamd0RzYkHir/3RC/SbjHrtiF14Al6N0AvyGS@lists.infradead.org
X-Gm-Message-State: AOJu0YyXHalTJpryTK4MwIu+HOJWoVo8Q7H3CWUy8KYAYdRsddhfHZbh
	t3v/gm+/lgE2d/yGTG/T6bFJQASphQ+Eq0Foy88UysVVKjtxdz5j2f6UK3VlQQEd7RVp7JGYvcI
	7TRZnXcd5Yasie37itxeFojiX4Q0ziu3PgNEt
X-Gm-Gg: ASbGncs04oxuLEv7dDP4i1/ZAHSvGXRsJqLzkTj61txaDLD5smURKFb0eNwhTRnWxpo
	ei/LjVSdtu1Sf3v0sxmfpu8u7VKjAmlCiUlTIMyKPus9ji5Znd1ENIYbEFG7NC677bRNqrF+G7o
	JTU2pqwvjxpVCUwYhcp6VRQmTzx3Ut9WPazoiQXMfrq5hBiTdLRQaBOEU=
X-Google-Smtp-Source: AGHT+IFeNCEP0siRwcGFMhDyxTwUgN/q4ESl7wZnSThP1BZE2VnPVYxln59ocl0tbMWx93FWKB2s5IMnvCUEO374htw=
X-Received: by 2002:ac8:7e86:0:b0:471:939c:a304 with SMTP id
 d75a77b69052e-474fc4f486bmr4445741cf.8.1741099015479; Tue, 04 Mar 2025
 06:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20250210184150.2145093-1-maz@kernel.org> <20250210184150.2145093-4-maz@kernel.org>
In-Reply-To: <20250210184150.2145093-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Mar 2025 14:36:19 +0000
X-Gm-Features: AQ5f1Jo68p3yb9_4_jDKr_EIPn09Ol_E9D3YE9a_TVB0qWSEdbu-YNoM1obqL94
Message-ID: <CA+EHjTwkX+sy1wuS8LvGM+=m_S-h-=xUUXOyMapnoLiHt0XpOw@mail.gmail.com>
Subject: Re: [PATCH 03/18] KVM: arm64: Handle trapping of FEAT_LS64* instructions
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_063656_864167_3D7EDE74 
X-CRM114-Status: GOOD (  24.81  )
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

Hi Marc,

On Mon, 10 Feb 2025 at 18:42, Marc Zyngier <maz@kernel.org> wrote:
>
> We generally don't expect FEAT_LS64* instructions to trap, unless
> they are trapped by a guest hypervisor.
>
> Otherwise, this is just the guest playing tricks on us by using
> an instruction that isn't advertised, which we handle with a well
> deserved UNDEF.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/handle_exit.c | 64 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 512d152233ff2..4f8354bf7dc5f 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -294,6 +294,69 @@ static int handle_svc(struct kvm_vcpu *vcpu)
>         return 1;
>  }
>
> +static int handle_ls64b(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm *kvm = vcpu->kvm;
> +       u64 esr = kvm_vcpu_get_esr(vcpu);
> +       u64 iss = ESR_ELx_ISS(esr);
> +       bool allowed;
> +
> +       switch (iss) {
> +       case ESR_ELx_ISS_ST64BV:
> +               allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V);
> +               break;
> +       case ESR_ELx_ISS_ST64BV0:
> +               allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
> +               break;
> +       case ESR_ELx_ISS_LDST64B:
> +               allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
> +               break;
> +       default:
> +               /* Clearly, we're missing something. */
> +               goto unknown_trap;
> +       }
> +
> +       if (!allowed)
> +               goto undef;
> +
> +       if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
> +               u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
> +               bool fwd;
> +
> +               switch (iss) {
> +               case ESR_ELx_ISS_ST64BV:
> +                       fwd = !(hcrx & HCRX_EL2_EnASR);
> +                       break;
> +               case ESR_ELx_ISS_ST64BV0:
> +                       fwd = !(hcrx & HCRX_EL2_EnAS0);
> +                       break;
> +               case ESR_ELx_ISS_LDST64B:
> +                       fwd = !(hcrx & HCRX_EL2_EnALS);
> +                       break;
> +               default:
> +                       /* We don't expect to be here */
> +                       fwd = false;
> +               }
> +
> +               if (fwd) {
> +                       kvm_inject_nested_sync(vcpu, esr);
> +                       return 1;
> +               }
> +       }
> +
> +unknown_trap:
> +       /*
> +        * If we land here, something must be very wrong, because we
> +        * have no idea why we trapped at all. Warn and undef as a
> +        * fallback.
> +        */
> +       WARN_ON(1);

nit: should this be WARN_ONCE() instead?

> +
> +undef:
> +       kvm_inject_undefined(vcpu);
> +       return 1;
> +}

I'm wondering if this can be simplified by having one switch()
statement that toggles both allowed and fwd (or maybe even only fwd),
and then inject depending on that, e.g.,

+static int handle_ls64b(struct kvm_vcpu *vcpu)
+{
+    struct kvm *kvm = vcpu->kvm;
+    bool is_nv = vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
+    u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
+    u64 esr = kvm_vcpu_get_esr(vcpu);
+    u64 iss = ESR_ELx_ISS(esr);
+    bool fwd = false;
+
+    switch (iss) {
+    case ESR_ELx_ISS_ST64BV:
+         fwd = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V) &&
+                   !(hcrx & HCRX_EL2_EnASR)
+         break;
...
+    default:
+        WARN_ONCE(1);
+ }
+
+    if (is_nv && fwd) {
+        kvm_inject_nested_sync(vcpu, esr);
+    else
+        kvm_inject_undefined(vcpu);
+
+    return 1;
+}

I think this has the same effect as the code above.

Cheers,
/fuad



> +
>  static exit_handle_fn arm_exit_handlers[] = {
>         [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
>         [ESR_ELx_EC_WFx]        = kvm_handle_wfx,
> @@ -303,6 +366,7 @@ static exit_handle_fn arm_exit_handlers[] = {
>         [ESR_ELx_EC_CP14_LS]    = kvm_handle_cp14_load_store,
>         [ESR_ELx_EC_CP10_ID]    = kvm_handle_cp10_id,
>         [ESR_ELx_EC_CP14_64]    = kvm_handle_cp14_64,
> +       [ESR_ELx_EC_LS64B]      = handle_ls64b,
>         [ESR_ELx_EC_HVC32]      = handle_hvc,
>         [ESR_ELx_EC_SMC32]      = handle_smc,
>         [ESR_ELx_EC_HVC64]      = handle_hvc,
> --
> 2.39.2
>

