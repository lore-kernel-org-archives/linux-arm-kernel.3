Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49A2E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iLRVFcvI8PBqaXa13EXF14ab440i5Z61zkbAzzGqTg=; b=0945sp0CeooIZnOWL3KAW8RRwk
	i1Llocl6nFtAUoU1UnQnJZf655wFv31jLa8zWuVBHOb+y9e/dhQpCxumfMYH6emyK8DL0fYNs9teU
	0FGlyCTPIXVlSZv363b+7OfDB3RS/09qhVKKfBiutOxhGCi/ANE7WBNJxH2GYBwvkVnnks1KCPtlh
	MoGvjA/pYsEhuVEWmbliYCfzFXqK2uFDAPcVZpQEJtGSQiyOzbOPo+XQxHhwg+MbGh0wgEBM1hLsb
	2lKR8G1ozj/E6UAYHhAc7etizX8TtDB4JHVUYFrMjXuFf+7K4fIe0O9edtGnR19PhMgwvZmSM4Gl3
	+FclZC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCta-00000006OXY-0dxW;
	Tue, 03 Feb 2026 09:40:30 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCtY-00000006OWy-1YYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:40:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5033b64256dso261241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770111626; cv=none;
        d=google.com; s=arc-20240605;
        b=EkQ9qw8caKYzHgZUfnW+zql5rGN0UCKyoRLHwYapbzH/uuvxlZQ+FJPkNQVG6kzkKe
         bhHTN1PlxqelYBUyQ1qLb8hIeL7u8KUA5EmU7REnjuRjUGI3MVnLn+NFXdidTGRx9QdS
         dXmSz1j2O3XZCtdmhjHi2/zZbwZxUQmCYdBQiouavnafXcV+MPfqvflcZJPlbvVL8zWe
         s9vgMmy6rD1MSFk/LhKkp/abvz4fkSuNAELb8RhzYVd+qgrhuYApur6klvJgKl6SAiE/
         +1gDleCSgCD9ms5YXgMzo59S9sSr1h6HFegIYX7+4NV9cpU3b+L9LDgIpf/fZQeFB2x6
         HOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/iLRVFcvI8PBqaXa13EXF14ab440i5Z61zkbAzzGqTg=;
        fh=cZLPU05fAaAb3oVBzB5r+Z9xnvfrhqh7mjDwRnXr1IU=;
        b=Y/n2PXWP4wX2JFroDwRDsXvoXF3ZS/Tt4Zj3qdE/7tfFOQU6VVaulHuHZtTbx48ATq
         h/aWcJkL/sQbBMOt8SIJdSbFQebKoXlWSzvIr79XgLRGH54CY1pqbsd+CPUjbo0I61ht
         iSwI1jfwg+Y6U8qAvQT5ewoyACtwlmIi8CN2gblxmTCIAML0492iuMXeLrZPRpJdBj2B
         EYPeK3RKA7gmaiujwqF/6bEVCka7cLPYLD0NgUt7yGQEBnS/96FHTqpOBGjCdIIuHAX7
         A92yTqjnYA4dLmy70LWzXYYhVqd5kBBPMmo+g4uLD6nKaW+/ni0JEfJOFx7CGwUEe34M
         dhsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770111626; x=1770716426; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/iLRVFcvI8PBqaXa13EXF14ab440i5Z61zkbAzzGqTg=;
        b=RMyJ4ycLxU6z8U/sVnnqdGRoFKSD6iv85VzmRKu2HhFe5drH0I/nfLAsGosFNWytR4
         p6KDWPqOO+blI8q/EfJxJhziYQx7Zw9jw0cWN9wVEiHTo3S8RIt1xB+UWnmgXCJ8l6oz
         N9tJ2oPuTi2TMO/alRK02EpdxtCb38PLq9e5MQCP/t6zb1ObaCi2J8fxyscoGmNvzZmW
         aV7i7dawxNluUmgZXRmdFw42KT87MAdJaQ5V1n8/qPjdOmNKz+1DfAMpI0vEi/bt/3Av
         1kZ5goIyWzTnG6vdnFLM4QnA/cdBY7JHMKWZ0uyQiueXqaEccvT3UMA0t4xhTHmaYtNY
         4Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111626; x=1770716426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iLRVFcvI8PBqaXa13EXF14ab440i5Z61zkbAzzGqTg=;
        b=GIZmVbTNuAEP3Cm+ca0JzH6jVI32jtFvmc+kX6wWIHFTzXtqqDnovBslRHHuLEEKee
         +iQE8cL3/emEdTixCEM2TtBciAFI5wG7K6bV+6pSYSELWW35Ujgp8Xo6t0zcCSe/ayyo
         gCq9BeXxhLlCUvfpSwfNA3hgBuxSpL3wgDNQelXTrb0rpXRf3LLIAk21QZYDaw5FAtaD
         nYVEGof5K210hBFieFiL/eKJQc7HNkDXe9AsHry5B3ISkuIFVbIjSCdwFX3T416GVQWo
         5jhF+EOqx9PHXhhIEIfjiXZhemO1xtZPsn8NBIjEaMyfdaaOxe+JXMfQStvBMoXcnF98
         TCsg==
X-Forwarded-Encrypted: i=1; AJvYcCWk3oXHZ6Sk4nLQ/x5lZnta/5y63XyOFZ+TAh41iFoUuckWs0aaqTvV8BoipubQsI8mfcfVhx/ht5ueqGA0G9Xg@lists.infradead.org
X-Gm-Message-State: AOJu0YzY52Eazsn1qOP3bVaTcJbqXAFWK2SeCmWdVc3n7ui3/MYTUMYb
	4MALdEkigAkHuI+DU69KgbvYx32qnI4uoyT9cE+CHAcL6fZ6KleZm+stiiWqVa5mpHaLvMA/ktZ
	u7vRNkXvaYblzK5RN3afm2/GN3DZKlMLsLurn5vtX
X-Gm-Gg: AZuq6aJWeQV8UAu5OFHBWhMozkKSJGyZSRScP3/QQ9WfRveXbgF7WR10tt2ha9GrT9g
	nnrzpzzlPTbkfSOiUsIldJmgdaucBrptingBbnk3mvBcvyT8SC5JK+d6E0jScuc5klrBkHYqjmK
	+kFRBqUGzKInv8dXkeNr2q3VmaHaDfyziIX9HUzdvuVQjn/Ffj2Cpe26XTiU4n9O2gNRpjiWk2c
	nfPEPgFMvSg/vqoKqqd4IzX4y6Qh73GfXKUynDL8RzdlC+/xLO2+PNnOTDajtX2KhV0P71Ys68k
	bNVhzPsXuM0ZiHztpXKLu2WUaudk1Gd9iht/
X-Received: by 2002:a05:622a:e:b0:501:4539:c81 with SMTP id
 d75a77b69052e-5060f009ad3mr4642661cf.2.1770111625864; Tue, 03 Feb 2026
 01:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20260202184329.2724080-1-maz@kernel.org> <20260202184329.2724080-13-maz@kernel.org>
In-Reply-To: <20260202184329.2724080-13-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 3 Feb 2026 09:39:49 +0000
X-Gm-Features: AZwV_QgvgYBl296K0duqDRaBXXRaqyX8U8f5zkdPWeOZQX-Dkj3fpYJk1QlQ7I8
Message-ID: <CA+EHjTwvXhzMP7WYQycs5CdPD1u-Ycj32-L1kC2Qvw4nmyempg@mail.gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: arm64: Add RES1_WHEN_E2Hx constraints as
 configuration flags
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014028_458878_9CF3D989 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, 2 Feb 2026 at 18:43, Marc Zyngier <maz@kernel.org> wrote:
>
> "Thanks" to VHE, SCTLR_EL2 radically changes shape depending on the
> value of HCR_EL2.E2H, as a lot of the bits that didn't have much
> meaning with E2H=0 start impacting EL0 with E2H=1.
>
> This has a direct impact on the RESx behaviour of these bits, and
> we need a way to express them.
>
> For this purpose, introduce two new constaints that, when the

nit: constants

> controlling feature is not present, force the field to RES1 depending
> on the value of E2H. Note that RES0 is still implicit,

nit: , -> .
>
> This allows diverging RESx values depending on the value of E2H,
> something that is required by a bunch of SCTLR_EL2 bits.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/config.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 7d133954ae01b..7e8e42c1cee4a 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -26,6 +26,8 @@ struct reg_bits_to_feat_map {
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
>  #define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
> +#define        RES1_WHEN_E2H0  BIT(6)  /* RES1 when E2H=0 and not supported */
> +#define        RES1_WHEN_E2H1  BIT(7)  /* RES1 when E2H=1 and not supported */
>
>         unsigned long   flags;
>
> @@ -1297,10 +1299,14 @@ static struct resx compute_resx_bits(struct kvm *kvm,
>                         match &= !e2h0;
>
>                 if (!match) {
> -                       if (map[i].flags & AS_RES1)
> -                               resx.res1 |= reg_feat_map_bits(&map[i]);
> +                       u64 bits = reg_feat_map_bits(&map[i]);
> +
> +                       if ((map[i].flags & AS_RES1)                    ||
> +                           (e2h0 && (map[i].flags & RES1_WHEN_E2H0))   ||
> +                           (!e2h0 && (map[i].flags & RES1_WHEN_E2H1)))
> +                               resx.res1 |= bits;
>                         else
> -                               resx.res0 |= reg_feat_map_bits(&map[i]);
> +                               resx.res0 |= bits;
>                 }
>         }
>
> --
> 2.47.3
>

