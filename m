Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACCED2FEC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOQZvYTAv//pcJPda837MTWpR+PvpurRjquFigTQ1OA=; b=Y3MQmjTCW26eCbpR9Ybd2hVXxV
	kmSzFe5bY2B6Xt9DMonX4366Ar8nO7i/vB9bYoW0W1xeLIaprDODqib/6T3lZ/2MaJ8WfVcocyqpk
	qtG6HS5Rn1qMPZXyJWepfXekSpUdjxfT1ze/hiU9H0KW6PFxWwhZA4WMBaYD0EuvmsfdrFKO2VNCA
	Ja8TAooOlUWg1YYB37bcJ3wdS0kJO2t5xvibP3dA2vFeVC7JNSoGpMQYpplkTmbE5y2/tECgS1YsD
	aMngii5hAhvA7Us/DSr95A+SL6ybZspttrssnaj74JrCnMdttDkDYbiwgqAMQvCU8piAF3M1N9n1M
	hLnvMbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLf-0000000ElVi-23F1;
	Tue, 27 Jan 2026 17:59:31 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLY-0000000ElTU-34oD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:59:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5014b5d8551so17371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536763; cv=none;
        d=google.com; s=arc-20240605;
        b=ezf7cfCp9sfTHZZBbJgEGimKi+PCICuTJ2uLEytdn8G91M9Gv1LcP3L3u8pCmHE6nh
         uBhMWy7nRd1L4T2jhuIgDfvhsJoNYmEhWgZ5lLJNZs5Ze8oQxIxOdn6PBJJfqphWyPYx
         VTxx9H49Q/fgZh924YR57i0y+aBRWHkmHZd2lQ8xPTCGEfl9vm+gGabi+NKp9N9C5ere
         1C4wJ1VqTAHmpCN8t+L8HzPMsvZBLQrP5aFiIbrKRrDUirfWrzo40zmhwxbeNdPSinVQ
         kNAe15Q6Sbja/VWB3teyHYhSFxkvwJC1sXC3VtWb3awpEKy1B0Jg6Y/SUShlQPOa+5+7
         7oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UOQZvYTAv//pcJPda837MTWpR+PvpurRjquFigTQ1OA=;
        fh=gU2YjBjQpx3oTyv5Et2Sczi6pAnh4roCvYqhxXN+YgY=;
        b=SVMbUNrfkA5D1jlKoSK4zERLfiI9I/kNNp1JSRZwsiCBm3wQzMoIBhRmu/mGiswqk7
         0LEZ2+cSx95y0yRrmvJMasiXdOdMf5DGIisGI/GRAqYL/y7Ob60IRnTRqp8F0OLPYkiS
         cwMX511r9Rm1T1YZF5fVt2SmtUEdaxS0dTQWhT4EQpzRrR1gz2KiAE9dC6q6tdX5t5KI
         B+xwHAzztkSLMtmW0CgfUAkTA1suFhIuRk1pLmaeeYCWzMD7fyiA5fVA7eEDkA8mrZGb
         xgMHlK68sraVmGlKPYi4kiyT2Bu0nkSK1jweKvVpoT++RWjvF0vbTBa10IdCQYaaC0DP
         OrSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769536763; x=1770141563; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOQZvYTAv//pcJPda837MTWpR+PvpurRjquFigTQ1OA=;
        b=stCfKHXYWCodVpyTK356/bAi0l2OOgjE5Pt8KYFSPTkw5VxxaFh+PpyA16GtMlCx9E
         FY/k18Qx8g/vUeKuOiZrfDqClBPdHNQ0WdmrDWfih7gCkR6REOe+/kYZzYM6g6Nr1LuU
         46Km+hcYNz2xjz+ogqPe3u7hM5YL7ughWOUWOYjLmP4WK9hmOJ6OOSV/Ir7ssAMrOwwj
         nleCcznksn5h9DdjRg51XrudYqPDPDD0tbfWC81j3pzKOrtyqitlOB4qF7XB5dNFkC8C
         qjA5afcMAmFZHfELuGLq9ospBHPZ+5wF1ok+NUMR0OgIkGABfRMdKH/nZc4y/xGqgTY5
         GREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769536763; x=1770141563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOQZvYTAv//pcJPda837MTWpR+PvpurRjquFigTQ1OA=;
        b=qDUkVGmsgE+YRYSCwEbgf3mBgN+yM38u7a8seuY/fllYrf/Va40C4Z23BoqFmWY/g5
         pq4BuclPkwfE/qQyzfCboP7Eis8P4orU8ec3EL0GQIyFkWeY8/NvKJC6qb9A07evl/kz
         k0ltceuoE+ORf9ar//SclwWCcpmV2hD1puFwKPxsHZhDTnJv44tSqKayhqs2zsNzqfQA
         m8lM8FHw6DjBFJL8cnCAXoZHYK3NgNY23dE/0k4smtF4CYqxlXlu2KES0sKhz4RdwAnq
         0mNHfXjeU1VeP+zI8U1fp8ssFaCv2qX+OrMz+88pA69M6ItQwJ2N7dEWqDNo42kwcKSi
         luPA==
X-Forwarded-Encrypted: i=1; AJvYcCWoSB7OZtv1QPzHUEs1291Umfz8wNGGhcBsVBioh275fD7QRzJlAf0IWBdNiHIG9+q3D+j7jP/Lnup3OjjueUrH@lists.infradead.org
X-Gm-Message-State: AOJu0YzIHmiiNPGIT2UZcO+dFkkN7+2lX7CjDgKATFAdiXZJZAAMcICe
	jh+WwPFFnRd+r+zrPlnZRhe3bnskY/UOzVNKZ1X8rVoB2YASrb2JJ6W5GQ2ksDBZ3hk9Q8/PJ43
	8m0TiXa0WsvRXTRg/sP6BvcnUAOos/oXQrUvTxojg
X-Gm-Gg: AZuq6aJCypPv7iQlxwzTQgSAFWskVlKjEUwPjz0YgcngENMJqy1T+PvGtZlG35bj7aJ
	o1ncRKBl1+Oi7WgIetq0ALplTCBg52TueOajnG9EvFPfLY9zR0niXSkZ5LODUWsem00hGNUVlv/
	G9CR1Ln8TScv5UxwmLzoNpQCUe9J5Xa3o1cw0Lo/VtnMe9uMk0KZRfJFMwuH7P3ZoeBkQg50+ZS
	9406mEAMrpEXVzm5+/LQV6xgo9yKgxOf1oKsXbw+rQHI0M/SvDjINiO5ZDXFVOTWYN1Q/Oo
X-Received: by 2002:ac8:5acd:0:b0:4ed:ff77:1a85 with SMTP id
 d75a77b69052e-5032f523d2cmr9890351cf.17.1769536763293; Tue, 27 Jan 2026
 09:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-8-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-8-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 17:58:46 +0000
X-Gm-Features: AZwV_QhifucCrTaCB27apGhiPavJg-rm3JFwqkfMUM-JyXvNsgDNJJ3r6uYLx6U
Message-ID: <CA+EHjTzk_0n+Z3+WmHz0no+dJAcAxCtJgQFFs9hHG4WAw0rX=A@mail.gmail.com>
Subject: Re: [PATCH 07/20] KVM: arm64: Allow RES1 bits to be inferred from configuration
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_095928_533980_D19B317A 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> So far, when a bit field is tied to an unsupported feature, we set
> it as RES0. This is almost forrect, but there are a few exceptions
> where the bits become RES1.

You need to correct forrect :)

> Add a AS_RES1 qualifier that instruct the RESx computing code to
> simply do that.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 8d152605999ba..6a4674fabf865 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -24,6 +24,7 @@ struct reg_bits_to_feat_map {
>  #define        CALL_FUNC       BIT(1)  /* Needs to evaluate tons of crap */
>  #define        FIXED_VALUE     BIT(2)  /* RAZ/WI or RAO/WI in KVM */
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
> +#define        AS_RES1         BIT(4)  /* RES1 when not supported */
>
>         unsigned long   flags;
>
> @@ -1316,8 +1317,12 @@ struct resx __compute_fixed_bits(struct kvm *kvm,
>                 else
>                         match = idreg_feat_match(kvm, &map[i]);
>
> -               if (!match || (map[i].flags & FIXED_VALUE))
> -                       resx.res0 |= reg_feat_map_bits(&map[i]);
> +               if (!match || (map[i].flags & FIXED_VALUE)) {
> +                       if (map[i].flags & AS_RES1)
> +                               resx.res1 |= reg_feat_map_bits(&map[i]);
> +                       else
> +                               resx.res0 |= reg_feat_map_bits(&map[i]);
> +               }

checkpatch is complaining about whitespaces here. I can't blame it.

With those fixed, looks good to me.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>         }
>
>         return resx;



> --
> 2.47.3
>

