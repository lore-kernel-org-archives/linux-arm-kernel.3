Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87820C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayuvivxfWK6wLmGHo3e/3r7UFNU/ARSNtwtuFILdC94=; b=YQ3HGOwPbT1KJtMzFmIbbKI6Z+
	gTqOc9x/sSb81YPp4EqAlcsUkY5lgArKDbO/j8OW3upUkBBQbSvKTTKCMmSFqsVEnfd+8Ix1RFWPp
	tOE38szP0pXLPDdknEOOeCEhJXEjAO3pUgiqrmgCUXHvV2w9i8stMOcPlqOCo232Q5Tg0kvVoGGNV
	Kn1GQG5n1REfC9jQVNRK8WWdYc4Iis3FdhJdMEvzUAXXrMozL8cpLb15jvNORG7bhmeJ34E9WlaqT
	duJ/vqf5a37LiBAXnSqd+DwO5GXro7wbUwDUA8hHzy2+A9mbwxpzNu6Y+GngLTMNMAxkZkHVvqlVl
	ZEhGchNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZlU-0000000FsZk-2eP8;
	Sun, 02 Aug 2026 17:14:20 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZlS-0000000FsZN-0iYN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 17:14:19 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c15a5b265so242151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 10:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785690856; cv=none;
        d=google.com; s=arc-20260327;
        b=MA8/nGXZWIxBEPnbQamxr2lGI1I3VOndBvDeJmkqglEi9FwfrBk4HNc9Yk3mUZcOVV
         ZC6hVHcn2f0x59K3otRg+87PcruNuB7gEr41/xsIkFpss4a25uRgnVVQC8GUV5+HEZxS
         Gxd2fmxt7aqKcea1nlNnySxjbLb1cVyvsCWwQycMQawj3nLwpue4RNODnruf2WIj6QjJ
         CpMmu9ZGOU/Tm4ZFcpG9tcWVsyiUISiP+KyAZ94Js11HXKRZdBYXzTpEUrXgnMnH7Omt
         v82bqTnw1i/akqhC8i6hewIslnK4yD0YOpJa6hKCTYk6f0KtreFg9btMvCgY3LnYVRw0
         +DlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ayuvivxfWK6wLmGHo3e/3r7UFNU/ARSNtwtuFILdC94=;
        fh=z2U75upJ0KdpllDnjQuQJx1YoHAGUXyjagsy7i/Zh4A=;
        b=GgTdgcr4wStd1ZZ2mJipy7sAU4G9BhB4HN7rFeYDm71Gs7UCjXta02YTKvwS3WPQLx
         +vjIW53jDNK+IFaV+2/JjzjWR5sAV0dSbaXcXBcPe0UnJm2b+Ws0IvYJfykWiP/1Jide
         GP5W9C9V2QFVuj0wm0aKxSflmLQVAYnbLgKGUJbMm0ta7o4NpREgr/pkY9gN+U1oCjpm
         CVg6zldMN7GoFblwa3viu8aX5ttl593ewvI6DPjcYTiFXDuQ/JhASSycYSGrgEuHP148
         7gJ3+XBvTMEOFBjWgMN4/CD+d1+GNI2lZie4zCpAEB9rtpEyXfqnIsVTiSHUlKD050bk
         TwMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785690856; x=1786295656; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayuvivxfWK6wLmGHo3e/3r7UFNU/ARSNtwtuFILdC94=;
        b=m+hF63qVzxf/kTEIcUvnoMTs09DWIFybFUbxY7K5vSMej7x4PZ3dw+yiWp6gsbNWHB
         Ccn0eXoAnMe5/71c8wTbVjmLJv9HXe2ANyec3TR/TvDTKwPXKmLy329/6DGpP41cL1LT
         5YujH8XE2IJ6T9jB1Q0fY5ESLR4MtvdhuUOlqKXAoYk2kEKNtthE1hocebZWz16SpEIf
         36Hjl0YlTUfaQhypvR2b1jdQormtJETHnVMI9DJnugLnuD5nGKdlymFBl7d6TdoVmlHB
         1OWOMIrxpGmnEYQUazAeD+M+nuPK+Tj2+rtUXzWV6CAKDJdHl8kUFIat8XEmJODHXlWL
         4l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785690856; x=1786295656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ayuvivxfWK6wLmGHo3e/3r7UFNU/ARSNtwtuFILdC94=;
        b=owmD5Y3IbOPeYGpp/hju4dtpxXCWbzMuwQRcnrYxBRO/Wl6pRGnvCVnKDephusUzTP
         AP/QopOM/tu7Nwr3jXLxvViKzHLppFQSKPF+RquNEaxhmw+HUMcGAaIgEtEp3ZPoxIK6
         nxZBf22D2bm1cW2sJpkGRuglaf+Lc+lNTImJYPUeqxKQVxfGX7SnM+wekST87TbDxCH3
         fW37ydfa9UBcfu54RVzIAm3l4tkBoTDL8NE1btFbkGjvDK5U2i59VFUNCyQeQgeM+aA2
         nb09hmHm79PepMAqWuXcvzvamY1K3c9PMOzTgn52GbjIHJGu4KWystK4O1j43xZYUu2p
         S1EQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdF2uRfnmFG1sS8wJ9tic7EQc/iiA7KiuBZc+D37aTYzlZPk7fGbQ+UqVVdjNdOEzSLO1hrEESHNejBSIYuX3y@lists.infradead.org
X-Gm-Message-State: AOJu0YwOO+4NMEtFS1oJFaHkqf15159MbLlidD98/3c5G+ebr5KpDwxQ
	AzLyQPXWxlioGPzJWP3YhFzJTJsL/mBbsiM6AOP68UQWZui2lMIMwgd6j/jArje67iJSpOPy5Kv
	lYSfbV/Gdp5THa3G2jg8YUYfjnI4fj1NE4yy3BZl1
X-Gm-Gg: AR+sD11xkRTRGqRUO/SG00+7fRUwvSz5gBLNozU/3KGlgezMDmVmBAOpJucseYBtsyw
	rXjlclZEwp5wG24L281vOZwpg+1wH0utYhi6z0aHXalsu1xeume/OmVovq6NS46RxRp/KfGHMrS
	tMFhNpPkddiI91IW6giQD1PuQ2If1dDlMv+GNw/mQ001AF+CE3E8eOb05qaAzcmtqbVz3lFExc+
	I7/MmTcl8qrPQheMnpsjAOA15AeOjdAx6ESDsnDeojSpRxqsJpJUpum4JsPVx/qGAd0ITI1tF9r
	I2YET+lpm01Z6i+Sdtmzt6XWaRep1oWiFi/hEa3ehcez
X-Received: by 2002:a05:622a:306:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-52b598d2377mr25182951cf.2.1785690855240; Sun, 02 Aug 2026
 10:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org> <20260731-kvm-arm64-idreg-final-v1-2-3de2a5616dc6@kernel.org>
In-Reply-To: <20260731-kvm-arm64-idreg-final-v1-2-3de2a5616dc6@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 2 Aug 2026 18:13:38 +0100
X-Gm-Features: AUfX_mwoTQF8U_Aj2r-8-_EcZtVNirbPZIAEGO6l1nd6I3aMRbsfn0JxvhrYexY
Message-ID: <CA+EHjTxoAwkUJ1Tyu5700hZBFtc1HpCt14-8Gh2O5qA_NpnaFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Block ID register changes after we rely
 on the values
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_101418_248020_88F9A7A9 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Mark,

On Fri, 31 Jul 2026 at 21:46, Mark Brown <broonie@kernel.org> wrote:
...
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 958d7ef78785..3b423db56d3c 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2427,9 +2427,10 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>
>         /*
>          * Once the VM has started the ID registers are immutable. Reject any
> -        * write that does not match the final register value.
> +        * write that does not match the final register value once we have
> +        * got far enough into first running the VM to use the values.
>          */
> -       if (kvm_vm_has_ran_once(vcpu->kvm)) {
> +       if (vcpu_id_regs_final(vcpu)) {
>                 if (val != read_id_reg(vcpu, rd))
>                         ret = -EBUSY;
...
> @@ -5811,6 +5812,8 @@ static int kvm_vm_finalize_sys_regs(struct kvm *kvm)
>                 kvm_vgic_finalize_idregs(kvm);
>         }
>
> +       set_bit(KVM_ARCH_FLAG_ID_REGS_FINAL, &kvm->arch.flags);
> +
>         return 0;
>  }
>

The flag fixes this. One consistency point: set_id_reg() and
set_imp_id_reg() now gate on the new flag, but
kvm_vm_finalize_sys_regs() still returns early on
kvm_vm_has_ran_once(), and so does the KVM_BUG_ON() in
kvm_set_vm_id_reg(). Could both move to kvm_id_regs_final(), so one
predicate expresses the invariant? If so I think they would need to
move together, since on a retried first run kvm_vm_finalize_sys_regs()
re-runs and re-writes the ID regs via kvm_set_vm_id_reg(), so
switching only the BUG_ON would trip it.

Separately, would a selftest for that failed-run path be worth adding,
checking that KVM_SET_ONE_REG on an ID reg and KVM_CREATE_DEVICE both
return -EBUSY?

Cheers,
/fuad

