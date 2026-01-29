Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEFBD73E81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCjRmeNlyKGhmHNcoMiPz9wOGxIE7UrMLqkSTeQIzDw=; b=InFiwt+g88WPxYj75EekfaZiHR
	wgygLkX1ycUeZoB/FL0Jjfh3ISYj/XjzewPOcHYau2jnFLbqXYL8I3/Y/Jxt32cNgBCwVLQcofLOH
	S4Kl5TiclLywkunMPue94+c0n0FXJ2s9bCKNz3hVKD+BJe7iMR4SStGpUD/aFYUvJ1qVkVYOM0izd
	GPLAiXuFOwrl8tpzsC3XL0qGg+s/yMnEpvKzWbt1WfBNiS8zNYw9TWeGZz0YFa0gFuZJc+jBIf7+W
	geU6aRYmceot72qmZD9GeLu7fLHTsKxfvAQ1kiyFhJ1eC7FVi1nfhLFhkQbGiFu29tctJNO47FM5K
	Hs7L0vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVuw-00000000RWJ-3914;
	Thu, 29 Jan 2026 17:34:54 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVuu-00000000RVj-2vjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:34:53 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5014b5d8551so2341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 09:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769708091; cv=none;
        d=google.com; s=arc-20240605;
        b=KUqqAiqqo1oTcweV6WKVL92kEaMp+sX5ltuB+uDzufrQM0IRnqLDgZxLePxUES0mlR
         VKJbuvS7YUrkDZxij4gGHtededpAwvUfgzRTyCtm8YGxzspTC8ed3iPNww4dnxkiMelU
         s0l9/okOGwLQg8sWGQ20jnuB7359eIwDXoKbGYuEERICHTSzh5kKFRH4R9mlrCO1azjh
         0kuB6Pz8ZsaWxKSmQ7fkqIbCACBEyDTVJhvrxQoi/bhOwSRNkzwLr4KnEQBEzgOyH2IR
         rz0N4YbTOt0X6yJNhtwxJRxrSlB0RyZI2ZiMfOR9S0/ig1/0rqjWdDtJAUUe3eBnfQuX
         O+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OCjRmeNlyKGhmHNcoMiPz9wOGxIE7UrMLqkSTeQIzDw=;
        fh=nMyrYbYXDQ02MysCSnDpOSmB3P8smN+admK7OxawqiI=;
        b=B1FWsa/ukv2qi594bCsA0HzI0MQBhKE+0p6BNrxnqRjBa0mpn7uOnFF5i3DJmWTpda
         Y7ZoNNMqY184Qqpw4y6OGWawR/+8cJN2rlG1EAbDwbo9WD70LKEriiwxxK3aLyeKkRsj
         kN3Re3dY1SfD5n4cgP22TQT0EKtkuGrMADS8CWkpGz8L9vsdaC/RLbw+/vWQcPvDWeqJ
         h5+P7LmhnI49Z4BKIkhag/3XfVEMEfZfNW8QXgmjnDLevgAGX9D6jXm6sZvU2iM4cW5S
         6WtKcX2Aw6He5XqyPWC1JM9FvN37gu0+Cyw1vT9uW96Mik2OisrRfzIDrDbyu2NPxXl/
         bTdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769708091; x=1770312891; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCjRmeNlyKGhmHNcoMiPz9wOGxIE7UrMLqkSTeQIzDw=;
        b=X7xHOaf58sqGkMSCDHqyNgaUqlUSCRwh8yUAsyopkPWTinKOgd2pX/CtVrBzKckOQg
         EYSyXSndheYB0pgVoKAfMsM6EU1NvbwJf1/lhp9B6zsALeBW4e6NaUuPHuEBgsoitJ61
         6dSNxkxBTTajy5FhXbptbpUAcZ61qr9Zs/+wIfCzKsZtb10ibabgZ4QyP22BdJMTmkMv
         RFHWDxjzWl9meeUsTt5OAI72ycqOnuoOfG/r4Lp74DnQgtTcuUhmBEcRdvIWHtc+lpEk
         5rqO+3yNIcFhmNRWGexY4Z+sCJVfl5xe/ZG8zXJ9/ojLZFpM6SSW8LQeSu86yVqN/W71
         zSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708091; x=1770312891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCjRmeNlyKGhmHNcoMiPz9wOGxIE7UrMLqkSTeQIzDw=;
        b=lRWXHfWtpo2nRIiykqLV74weNqBYplpoRxTmrU6yTCKR3M23T1dR7ONP6aRC32Q/i9
         0ThoghJNPhcSG4dkOQKNsgBJIyxg6BBk7mYN8pd1DVSjR9FS4uDwIjNz+Kz5KKymskfu
         y4FzpNP+o10JD+7k/QhtF8pzxw8mBa1NeuOw6IMt6FCVNnT2Bs1lzZ/TaGEXzEtSTQhr
         TePW6Q19Z/UAPk3iHjNlr+Whms9Tkp4AnHlf+i+3GVgr9+sWjqWUuVVGEoJevTcDOBNE
         dt5AW9zayHXHfa6vvxsVOJ6XUtw9KqVHmSObaKLYUYbnCiMdZJN/sMMbNuy8J+iQJQ9U
         E9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGhbGwQdafwY5Pbj6MChshOV307ohBjoPiNOYYnAbOrR0G9iJdgQL/sLO8puSi8oA9dwENGy5YLGuQMLwovDG@lists.infradead.org
X-Gm-Message-State: AOJu0YzkQwi0s/lVN0IPllPwk7gKmgcqgYT0gz13dSOPvOnin7ly+GFk
	GaJMW0fknHrJT1N0nGeuHa/P39S8i7A1AwGrKw89MRti1c5RC/2Ybyit3AF9x61cCAnrrmKyzkM
	PoFEiguicj8HXX3oWfoB46Ol49SP/5sYXH+F6mdYK2jBGAo1/+zseGZc9
X-Gm-Gg: AZuq6aKwjq8k3CYqBnSbZ6zkPhSNCAqoYRRip6jRdVASVa/fbTHyTqO36c1nRLKatWN
	XZuy/BFHvaVdb2Euh13p02pBIXcCCmpw9ocvXX0GUa9+hDmYVaq0Gn6mNXSfvdk5l09TkHcxSM0
	y68M2LsHsSsKdwIu8ymroOs6SX1yQXEREPJQD+C9ZzDoiUBTH9O0R/L59PK2dhqJP09IXxQGvsI
	QbE+/l9oSBXRRRjb9FZ5KBkVNJlEUMMriAcFJGTlxt083I1EdWFbbJvujqKRfSjgEslg2UV
X-Received: by 2002:ac8:5dc7:0:b0:4ed:ff77:1a85 with SMTP id
 d75a77b69052e-504310c6a76mr11415131cf.17.1769708090725; Thu, 29 Jan 2026
 09:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-17-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-17-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 17:34:13 +0000
X-Gm-Features: AZwV_QiTE6QZNIoj8DOQzS5LJpafanXH_brsaCuAk8_cVjfPbm_tEiXo0cJUCrM
Message-ID: <CA+EHjTxS-TVNzFdENTa3F3V1Z5+grxx7x5MO1YJGrZJEY+kUaQ@mail.gmail.com>
Subject: Re: [PATCH 16/20] KVM: arm64: Simplify handling of full register
 invalid constraint
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093452_745655_F3EAF43C 
X-CRM114-Status: GOOD (  19.15  )
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
> Now that we embed the RESx bits in the register description, it becomes
> easier to deal with registers that are simply not valid, as their
> existence is not satisfied by the configuration (SCTLR2_ELx without
> FEAT_SCTLR2, for example). Such registers essentially become RES0 for
> any bit that wasn't already advertised as RESx.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/config.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 28e534f2850ea..0c037742215ac 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1332,7 +1332,7 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
>                                  const struct reg_feat_map_desc *r,
>                                  unsigned long require, unsigned long exclude)
>  {
> -       struct resx resx, tmp;
> +       struct resx resx;
>
>         resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>                                  require, exclude);
> @@ -1342,11 +1342,14 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
>                 resx.res1 |= r->feat_map.masks->res1;
>         }
>
> -       tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
> -
> -       resx.res0 |= tmp.res0;
> -       resx.res0 |= ~reg_feat_map_bits(&r->feat_map);
> -       resx.res1 |= tmp.res1;
> +       /*
> +        * If the register itself was not valid, all the non-RESx bits are
> +        * now considered RES0 (this matches the behaviour of registers such
> +        * as SCTLR2 and TCR2). Weed out any potential (though unlikely)
> +        * overlap with RES1 bits coming from the previous computation.
> +        */
> +       resx.res0 |= compute_resx_bits(kvm, &r->feat_map, 1, require, exclude).res0;
> +       resx.res1 &= ~resx.res0;
>
>         return resx;
>  }
> --
> 2.47.3
>

