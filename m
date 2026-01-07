Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E4BCD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOdTqCgbentjtLweVnPWK7fZIKtBydrzwGFFKr7sHsw=; b=5B/NqROwLwyi8pjQoDjSxXeRAt
	MXYWbqzhmrT+IMZzJ+NB/F0hVFTpBF4eOhLT1b0vzglPF2rDoBM1Bdb2ZoSxBfjFrPk6m6fEI5ZZ1
	zfY/Pwxb4VTpEQM1nyYotw88MRvvHgDPQe/xJTKLZqpvnlF9GfPfx54fw2ieq5RkfQ0OCqtVn9D7s
	c6gjKleC45O1fG+ysXu/lg/NjbmdYbxfefV83UFlbR+IwjAIRg4+P9Lv/q5xcYeprl0iD/rGcW92x
	3EvpHh0qJCJMlETsP3No7MNYmrpnGz4CIOWtsfTpP2zCSXTtE8qlGl+Nlei2+Gzop10BPTWfAhVfS
	YUGyo70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR7c-0000000EkSQ-1lVb;
	Wed, 07 Jan 2026 10:50:36 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR7Y-0000000EkRL-3wBC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:50:34 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ee243b98caso268581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 02:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767783032; cv=none;
        d=google.com; s=arc-20240605;
        b=G4F8IOKIAB+a42AKVxlw3CLBWAWof3BluZQ9dOuAUepDkO2jXVVvMpziAw/xySCpIj
         oH28ORpqFd+j109flwxA22mA6BYcGvuH29tZJKSyrdQR4OtEAfgbx+lPthLLrW9Luq1W
         WUqmGICAzihCTysLa6xn1+2yP/I19xSFTRQjI3lvQ27XMFgw4ZtpYSzLPyD0xyxYbDuG
         tJ4fg7OTtGQtK2q0NkTf5VPs2x4E6IBX3zn6ubLWzOakzEPWqqVQk2VpVenhMYMVKehg
         fJeoNTP0K8FtB9/xjVby9aV5ftJqgyBMtZaD3R9CNj5nTHm5RUuytQWdaOgGA1sI3MKd
         8F0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zOdTqCgbentjtLweVnPWK7fZIKtBydrzwGFFKr7sHsw=;
        fh=XJZxpkM38ITBrReLoyczsP4zkSBtHqoBEqpIKT7eg0I=;
        b=NCBbYxgThug141Ux1GFE94xdc/AwkySKMruQDNzidrOl5sd1SKAm3Y4uqIyoTVa/yW
         Der/Sir8qqMdBvKkiseQlTn2opRZM3HWS/4ntaNFfVBYjvQavrpW2F7jWUshhisRvb7b
         z5keg5z8e0E+kt63Tfkr+hHqMRqTUiYOpKcE5LNn/8cym8VG8f+dAvA8WmSkiU1l1McO
         g1kSwBwEw0BStpo1RIl1F6nOLPv5YJ2ViI1vx8GnLvzPpz6zgZbLL61kVYEj0N3m6Zt8
         Z9ohzt1H0T0kkg3YJqHfK+SlQg8M0QbJXmqBJTnZ6NgSlhZEMQQpzuHjUlVG+NisRZ9g
         S/IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767783031; x=1768387831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zOdTqCgbentjtLweVnPWK7fZIKtBydrzwGFFKr7sHsw=;
        b=OixH1vs8ah4YwXgqn/k3gvl729ZWSV7RKveyJqO2gbHPZw6XVDDwyG0DsKYvhLyBm3
         RSo6Ni9sDCmn+Earo4McLdwcr0lb3JtZQXVZz/baxs+fZ5Jbo2QDIteKxFbIzKtMsXz4
         OInzBBgjGsEap1J1tz7sHNkNipkv/hjKKjjn3UcFuU7EbJYC9bomJbiufH53PnjeireC
         Bw0JA1OWiEXCrTkvceme5PFlEemHBXgv5mVyatgZAu97lJQDId27sxaEfXCWhf6FCJh0
         nsUiPAZQklT4ZPd6aecTatXedtqXpbQq8n3miPz77+uHTBqJ+bGXZnwl81u8HnMhIQQl
         pbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767783031; x=1768387831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOdTqCgbentjtLweVnPWK7fZIKtBydrzwGFFKr7sHsw=;
        b=uZmkQvRPjjEypsNUsrDQWhZMudQW7NTEqjMnJE1OwZGyTdHV10xGW37UeWEWDb9xNq
         ki93qbU7F23cFPtningUENZnq0d4H6DqJXjRTVv/WqfVOTZIxyef8z085Nf4RZgrFhia
         E5BaJ9w8GILv5YOSly7NfrXjFe05caQBIn3y+1Ai9k9nnYF1LTFKVlPgZaAME8HAAd6u
         MU7ZFlIn0M3GRQyfdVKs5rdlqRZ3YDIP6pmnGdeOC6vYPK44su7Gs6RJ6AflLGP8y6Nt
         f5d6QtXUvASVvowaZODeAWQQH+h222HxCTjXb8Va4/gRf32hw1aIv1vHpSiW6hXAhp8o
         WalA==
X-Gm-Message-State: AOJu0YxeOaGB9JsGBOefyvGktlFNYkMqa8phlnhYymGWiXNe65cY2hSy
	w1fDFM38TSoJgK+eez+8ZTmdOAooLfEqqjp8NE5jHDmHPX9flPt/MurjEBV58YQvldqsnDxIPhy
	GaMkXTUkMEDtFxPbE9WB6OnYsLypCwgQkQCUP46/S
X-Gm-Gg: AY/fxX59A0fL2cTxb2NO+Rcw/lqZDJVC6GNCRJHWvbP4WirrMn2NEn6z1+4SUCwg0Q9
	QZYue6739BxDuvmZnqVbFBV9bIbZ+QRdSs9l/CDRohQNeUkMSIZl0uINY4WOz53js1JgbrjKK1/
	l00zCaQ9eJg2vXDEtnjd/YG0cOw4hVoQKHm0hFfXS4f8jkIow9v8+THSQh24B26UcBfToNVRTH4
	pKfJy++VrLzj0FtqZbki7sLW+SkRZ8rf9x0lV2LK9/Ij0Ea/zMq/tpdCBQaR6tz3nVWsRCBclX2
	kWGfi79vEgYi6cfvDLAoa7cF
X-Google-Smtp-Source: AGHT+IEe90KKT6Is3Q//ET89+VgQGSKhvBCLlRu+JqIYYHLh4Bb9dxSb6fKrazIySvaw1r4vpRWvk1XNficw4nqj1JM=
X-Received: by 2002:a05:622a:209:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4ffb3fbd166mr9425051cf.19.1767783031452; Wed, 07 Jan 2026
 02:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20260106173707.3292074-1-mark.rutland@arm.com> <20260106173707.3292074-4-mark.rutland@arm.com>
In-Reply-To: <20260106173707.3292074-4-mark.rutland@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 10:49:55 +0000
X-Gm-Features: AQt7F2pKAPPHBCOYW941AWJblwtEnJyF8jzMQ_QYvclZLTFjIyYDXEVB9OYfq6g
Message-ID: <CA+EHjTzPtxySO=iyEduqbisN+KCqwGfK=BnXaEQeAARh_0ydUQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Remove ISB after writing FPEXC32_EL2
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_025032_987454_4240244B 
X-CRM114-Status: GOOD (  19.74  )
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

On Tue, 6 Jan 2026 at 17:37, Mark Rutland <mark.rutland@arm.com> wrote:
>
> The value of FPEX32_EL2 has no effect on execution in AArch64 state, and
> consequently there's no need for an ISB after writing to it in the hyp
> code (which executes in AArch64 state). When performing an exception
> return to AArch32 state, the exception return will provide the necessary
> context synchronization event.
>
> Remove the redundant ISB.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks!
/fuad

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 8dce3da85da35..91aa1862349cb 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -59,10 +59,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
>          * If FP/ASIMD is not implemented, FPEXC is UNDEFINED and any access to
>          * it will cause an exception.
>          */
> -       if (vcpu_el1_is_32bit(vcpu) && system_supports_fpsimd()) {
> +       if (vcpu_el1_is_32bit(vcpu) && system_supports_fpsimd())
>                 write_sysreg(1 << 30, fpexc32_el2);
> -               isb();
> -       }
>  }
>
>  static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
> --
> 2.30.2
>

