Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235BF104BEC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TkgZeRelUotLX6uWoOokmh+4cw4NVRqqCq/SOcEowE=; b=4PXxif4XbQaCSt/mmUE7Bof/kP
	zGOr1KNSQTtUZfyh1Hz932jSK3YObgSi18v06c8cWUfNHnXoIxBorNYf3fLdWIwCkDXdna58jBp3Y
	kOhVySNGNT5LRXDtcgzN2t6MgD6HJ+erZXS/Y9TfqUvbfamSldsUfKmqrBT03w07IM7fgJiDK8fbp
	fprAHWypTVYNJjuiX1q42wWTrIoJOig1QlYiwBeKI4h1zangUZlLN+NZkgBNySwPXq8QbSaEqlTc9
	kg4nfke30ppYUJ2suX58Mbd/BJks64uYzN53dMMBYYMhBrNUMJAioowvvy8V2LNwEYQnXr4UQvEx4
	Fi9uW5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GYx-0000000BNSy-2jZx;
	Wed, 11 Mar 2026 10:13:11 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GYw-0000000BNSe-0Rla
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:13:11 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-509069a7a7fso506161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773223989; cv=none;
        d=google.com; s=arc-20240605;
        b=Y/gW9npbPXF71keEeROLTNrq6gCDOMJBPbYigQ5cnIMvOPd8N5EL+Cb8MxOsg4pqM8
         yvjctNzUtJKy655pbVFmSWxoMXOOLW3+oJSp5fJHpI4uoR4+2RHdV5bdNjlu5k0zlEd9
         ZK9ZWpb5Yr3hHfxUD3s4Ng6oXcnw2+x1kNuC60SBZ9HVOsaiVzvuu9hUazc5z7nwHrJj
         WPESGeO68cJKXaWIz0bpl3xMgMi+vmYF5/t+okvV5X16uGY1k6j1aP3XqiCEv6Cs7T0A
         URPvS3Xz4zRhg9KxMP6qbK51Wgyn0ASGVnDkbiB354f/6Z/Z0VKuTkvBGtdY0FWoYm/f
         mrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9TkgZeRelUotLX6uWoOokmh+4cw4NVRqqCq/SOcEowE=;
        fh=FOZkedw9+RxD97GQqweFUYP9dT1XR6jQWs861/RNWo8=;
        b=EoQ6tZcO1yq+WQKT/a253JdxFPl8tn6QkVxsBxaTGGb405zCaTql1VNZ2j0elX5Rpf
         M3315Z26h2e1RG6qtvGfJf9Q32R4y8OENcYNi5swzs7+VaZ2s2TENDcnsAeJRPvp7c13
         NOQ85tB/90atk6fukmy9+zwTrj5qonp3Inegvsr41mGIVk4JRfhLKogGBBg2NDS5xTrY
         GWJ8AzGHxNicKi3mlGojpyjnYAJw6YEIQxQDi1Q9ZAJawSjP5u1FOesSuOtl/Ol/16h4
         pkYK0F71sY0T+/gRvhlBc8i55x0mUbwrimdg+fQXHPqK9O3AMIhQkl1/BSBOUoEjXQe0
         dX/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773223989; x=1773828789; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9TkgZeRelUotLX6uWoOokmh+4cw4NVRqqCq/SOcEowE=;
        b=Cby384AXR4bq6z5KTvlSnEXnTO7dN80NrwqpMpPs0Wr8sDCZKLY1k0xbev2q/kn2t6
         IUCRdgXaitJeyDEv327KnUpRNud3sXDoj6qV7MFXyNb7FwBoC2ETrv1iVGZE4kkvMDvy
         uLTRnjXr39IrhXopb2DPC3k2aiB7PoDEN3hadr1Ax1N/B8ew/7KI56AM+VNp1AE9blgg
         v/fJVZ6lJY6JAN8oB1FMUdUCHupUx3qxc1A5uK46TWs/RxKUQRqSUIFiKY5WRFC/WBPR
         g4gl806o1n1r1/S2I0Ug83jBKbY1A0mr5XYMgfQZVrvbfmSnZvBfLSIdyCnWbPH/Z12Z
         +J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223989; x=1773828789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TkgZeRelUotLX6uWoOokmh+4cw4NVRqqCq/SOcEowE=;
        b=iIin3Ng3kIFRqdj90efV/Gqu8TwRKiUhK4yexKakCW3bteZ7TNFAg0bGdLcoNVM3x4
         F3aHt8zdiKw2liw1M+w4AzAOVkghn1IJNY5vegr0LC+A4CKGu2ykIRnVxynYJX6tN2aP
         sUdzWHTxdDBWqlBcoIMjdEuwbePrCe/0165QtxxdH0a42tE6CmVO/L47BSBrLxuvD2mi
         bwZPyp7c1lUT60fQefr5tka0+7itncVgzfeMRbTQITkj7rHwteElF01GYsMJP/nvlT88
         5Khm9c0/jkmGFdOnGhohC0HTH8uvBHDSq9e0ylbY7W+3QaCV8nfV0fMQHouVEHrsZyia
         Bhgw==
X-Forwarded-Encrypted: i=1; AJvYcCWryAZZHX91F8s6kSW0r60QUVcu/427eGvt/h9/LweuFJINob+h+ir6LA5MEi8G+gDL2iiYNkzPXZQ9m2uVVwAK@lists.infradead.org
X-Gm-Message-State: AOJu0YyTbWD7dGlBRuQFHuZ/Fj718n9FbtiHnEG5Fu8QYTk3PJQDUuXx
	vG/poukoukyqNDveKO4UhfN9J6nftFJei0Rcuahy6FPXMYcId6jfomCszu6bCUQ2yer8ssAZK7O
	OTNHTY8p2eoY8gJcPYAMPV7iDro1cbwxK0yqtyd7T
X-Gm-Gg: ATEYQzwKAcwqVk7OAHnMzZ1aJz9TY2MQdzABWTp+YnXbHTwTdtPbJ/Pkqkfpmw4Ia5X
	tBt0hGsC8huezRdjtjdsVPjpYBQfuYMJKRxRLOl5MoP/LO0AMT2Fjww13AGNPBIzRZig02JXk7e
	M0QsVVozXMdMMH4/5wlB7banJ2FPe9lLRHTrIPoHyrethbf8oUIn7Osn0Ow/pKgAzUyQHQVdtSu
	bFsA2IvfcBuyIfBisMZnOzCtZo+W44Fml2Q5nJ/1y9wlplz5g8GReeCqCRuyRwQCyOe6cg0MRO6
	edUei6m6scv0T3lDH3Fc9Ll0uMwuZx5cIZiVlA==
X-Received: by 2002:ac8:598f:0:b0:506:9852:75ec with SMTP id
 d75a77b69052e-50939a0b6d8mr9160861cf.9.1773223988258; Wed, 11 Mar 2026
 03:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-17-will@kernel.org>
In-Reply-To: <20260305144351.17071-17-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:12:31 +0000
X-Gm-Features: AaiRm51aS31a_T0ouebXqMpmAi9skAmUrSnNLq5fU1cJFuBu21k0UjxGpqvwTDw
Message-ID: <CA+EHjTxwfCDoRmV+17iYkyaY4bxVLK-ikiuvwPP=vLyttOUGBw@mail.gmail.com>
Subject: Re: [PATCH v3 16/36] KVM: arm64: Factor out pKVM host exception
 injection logic
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031310_160338_0DD73F3E 
X-CRM114-Status: GOOD (  21.39  )
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

On Thu, 5 Mar 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
>
> inject_undef64() open-codes the logic to inject an exception into the
> pKVM host. In preparation for reusing this logic to inject a data abort
> on an unhandled stage-2 fault from the host, factor out the meat and
> potatoes of the function into a new inject_host_exception() function
> which takes the ESR as a parameter.
>
> Cc: Fuad Tabba <tabba@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 49 ++++++++++++++----------------
>  1 file changed, 23 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 7294c94f9296..adfc0bc15398 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -705,43 +705,40 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
>         kvm_skip_host_instr();
>  }
>
> -/*
> - * Inject an Undefined Instruction exception into the host.
> - *
> - * This is open-coded to allow control over PSTATE construction without
> - * complicating the generic exception entry helpers.
> - */
> -static void inject_undef64(void)
> +static void inject_host_exception(u64 esr)
>  {
> -       u64 spsr_mask, vbar, sctlr, old_spsr, new_spsr, esr, offset;
> +       u64 sctlr, spsr_el1, spsr_el2, exc_offset = except_type_sync;
> +       const u64 spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT |
> +                             PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
>
> -       spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
> +       exc_offset += CURRENT_EL_SP_ELx_VECTOR;
> +
> +       spsr_el1 = spsr_el2 = read_sysreg_el2(SYS_SPSR);
> +       spsr_el2 &= spsr_mask;
> +       spsr_el2 |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> +                   PSR_MODE_EL1h;
>
> -       vbar = read_sysreg_el1(SYS_VBAR);
>         sctlr = read_sysreg_el1(SYS_SCTLR);
> -       old_spsr = read_sysreg_el2(SYS_SPSR);
> -
> -       new_spsr = old_spsr & spsr_mask;
> -       new_spsr |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
> -       new_spsr |= PSR_MODE_EL1h;
> -
>         if (!(sctlr & SCTLR_EL1_SPAN))
> -               new_spsr |= PSR_PAN_BIT;
> +               spsr_el2 |= PSR_PAN_BIT;
>
>         if (sctlr & SCTLR_ELx_DSSBS)
> -               new_spsr |= PSR_SSBS_BIT;
> +               spsr_el2 |= PSR_SSBS_BIT;
>
>         if (system_supports_mte())
> -               new_spsr |= PSR_TCO_BIT;
> -
> -       esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
> -       offset = CURRENT_EL_SP_ELx_VECTOR + except_type_sync;
> +               spsr_el2 |= PSR_TCO_BIT;
>
>         write_sysreg_el1(esr, SYS_ESR);
>         write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> -       write_sysreg_el1(old_spsr, SYS_SPSR);
> -       write_sysreg_el2(vbar + offset, SYS_ELR);
> -       write_sysreg_el2(new_spsr, SYS_SPSR);
> +       write_sysreg_el1(spsr_el1, SYS_SPSR);
> +       write_sysreg_el2(read_sysreg_el1(SYS_VBAR) + exc_offset, SYS_ELR);
> +       write_sysreg_el2(spsr_el2, SYS_SPSR);
> +}
> +
> +static void inject_host_undef64(void)
> +{
> +       inject_host_exception((ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) |
> +                              ESR_ELx_IL);
>  }
>
>  static bool handle_host_mte(u64 esr)
> @@ -764,7 +761,7 @@ static bool handle_host_mte(u64 esr)
>                 return false;
>         }
>
> -       inject_undef64();
> +       inject_host_undef64();
>         return true;
>  }
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

