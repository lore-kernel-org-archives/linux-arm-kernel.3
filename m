Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp1qrh2uE1dCCEghnnvrSjtwgId1DtRFpj1taeMf/RI=; b=CHGWo/0Aqzc334Vx9M4kSdYUhd
	8PX+vEqzr4eJe5yg7r+bBnPqB5SL6/uM8qxuRvcYUY1BMtHBI1cLQamSdEXOWxJ0RmfnsU3lvp3Db
	gHo0Aon14sAjwyuN98lLvfcPKynCVX20RFUpImmh93UWSudycPsL7pgltJL5wO1+JPcLZ61bGKMYZ
	c22hoTRyr9et9eCuS59EXr4A/EdsvPFXAH81/pjDW2vuXKcX56W6/OLO9RzPn3DHyR0ONzn7jBIhD
	Dn/cpvWsqu5E7DOa3RGZkZnlr43c9sEj2tq5EBTcEHWZmnTUvdWwNe/UjBQxrnNoneJG+hbxURLS9
	wAEAnWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMNt-0000000EvBx-3tom;
	Wed, 11 Dec 2024 13:04:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMFu-0000000EtgE-1RCn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:55:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso37405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733921752; x=1734526552; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tp1qrh2uE1dCCEghnnvrSjtwgId1DtRFpj1taeMf/RI=;
        b=wjnBqn1y26g8YivGEpsYe2kgsanjQRy5gtMc/G7mXx8D0GL3qxop4/ok1nvUSq8Lcp
         7jORVYf9rEkOytDJyhHKn+jt6eeuHZEREWBwsMdDeO1gGcH+bLLKCTBRD1j2WOi8D5GC
         2l7n1giVp0fogMPEve/bCSLVAFFZn3uyJoxoJ6I8ynh6fNY/NlVkQMrnE+toe8rrhLaC
         tGgx+u35SivTve9utKptA24P4l4MYqrUW7Obj3aON5yhsiqmtv07MJf6u7nKKn6c6Z0Z
         FP7QOrVrkn8n4FsSnJuQsfYYsDQ/8KsHLJ1fgYskL/gEp0SgMUzwdi72s5Dsy5OBJRdD
         lpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921752; x=1734526552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp1qrh2uE1dCCEghnnvrSjtwgId1DtRFpj1taeMf/RI=;
        b=taiqNZLxurqlcd0D2FYlKylMtnJKuIj9r4qtefWEL1lfXlML5pQu4HG99vmky1DxfH
         lKOxgwnvcHY4Q5cPfgePD9bEOMt73Lvn2ub5tOM4CAzfzNqvmryGb/L9UHRLuIHME9WD
         7WjixqQe+bekq/38ZIw8jV9VAAq7eFc+1bJu5/Gt6IrBtTab46FWT1/vlIiLG6qxwWQS
         FQ/BKGgKL1TYwSnX4cIKNU3MGK0YpjhKBfuV6BZgCVLUrmL68LWvSdZloDWJKiHBseuw
         +nWZrrSaOrvBbHZCZXQIheThycL7DkUc4C+zM62a9OxcyKJV8Vny2Xt1uwwEAfaB4Yen
         lPEA==
X-Forwarded-Encrypted: i=1; AJvYcCUMlxAy9yTOhcZPayjopTfgQh20++v0GNJX7P5COYROPPG7oBlNs3igqMxnkgkE2KVFzz+YGLPyeqZuDGuWj6K0@lists.infradead.org
X-Gm-Message-State: AOJu0YzDDgpLbr1a496vsrHJo4YCQgee5FeiXkCCO3GWmvDdx/WGEb9e
	NgDp+mh6XpAWDxVYwiTC8am/15T4PtZSNe/97Pw2cG+8xWufIVsht1VYb3w2S949YCgPw/7lpA5
	wBYLkwjzCLN01zvdOHxUrYEr5RBVZ5iCPxWD6
X-Gm-Gg: ASbGncsf8zr1Bfw5jeh2DYjT7MytYufCxQIaXDgL/07FqdKRmHJAYMWPDgn3N6tCVER
	gFmbxEiD94AZHfWHtCRHlRRV3HrP02KBtMxtGocr4uSA2AlkiBMD1SSs3uwtaWLNA
X-Google-Smtp-Source: AGHT+IF3dIT7fuJS+iL7UWob1CNU5m9rhIXgg1PTuH15dSwzo7oLBkZEFY6Rh4KIzkFLuEKi5aXZccIAjHgUrb//06M=
X-Received: by 2002:a05:600c:2105:b0:434:9fac:3408 with SMTP id
 5b1f17b1804b1-4361c0f4f80mr1205495e9.2.1733921752418; Wed, 11 Dec 2024
 04:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-11-tabba@google.com>
 <Z1mJlF-H5R_-f83I@google.com>
In-Reply-To: <Z1mJlF-H5R_-f83I@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 12:55:15 +0000
Message-ID: <CA+EHjTwDSo3XXxruPQSbJZJ7wNqyFX4fec-SFuYfd2XBqJX_DA@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_045554_385145_4168E881 
X-CRM114-Status: GOOD (  13.58  )
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

On Wed, 11 Dec 2024 at 12:46, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:37 (+0000), Fuad Tabba wrote:
> > -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> > -{
> > -     struct kvm *kvm = vcpu->kvm;
> > -     u64 val = vcpu->arch.cptr_el2;
> > -
> > -     if (!has_hvhe()) {
> > -             val |= CPTR_NVHE_EL2_RES1;
> > -             val &= ~(CPTR_NVHE_EL2_RES0);
> > -     }
> > -
> > -     if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
> > -             val |= CPTR_EL2_TAM;
> > -
> > -     /* SVE can be disabled by userspace even if supported. */
> > -     if (!vcpu_has_sve(vcpu)) {
> > -             if (has_hvhe())
> > -                     val &= ~(CPACR_ELx_ZEN);
> > -             else
> > -                     val |= CPTR_EL2_TZ;
> > -     }
> > -
> > -     /* No SME support in KVM. */
> > -     BUG_ON(kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP));
> > -     if (has_hvhe())
> > -             val &= ~(CPACR_ELx_SMEN);
> > -     else
> > -             val |= CPTR_EL2_TSM;
> > -
> > -     if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP)) {
> > -             if (has_hvhe())
> > -                     val |= CPACR_EL1_TTA;
> > -             else
> > -                     val |= CPTR_EL2_TTA;
> > -     }
> > -
> > -     vcpu->arch.cptr_el2 = val;
> > -}
>
> Mooh, wasn't this function added in this very series? Not a huge deal,
> but is there any way we could consolidate things a bit?

Yes it was, but it was added when I was doing the grouping in Patch
02, without changing the actual trapping, to make that commit easier
to read. If I were to consolidate them then Patch 02 would be changing
more than one thing at the same time, making it (imo) more difficult
to reason about things...

/fuad

