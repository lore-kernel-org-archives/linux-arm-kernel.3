Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD85D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=; b=sRsvQKQ9Hcj/Z2VLyqRqLYAy+H
	vYf1h1owers0D5OHB00o2IoZjbPv9JNbzAdSLTNdVZ45pjYLSnZMTd//VIxFWSqwMESg9V+N54Cwb
	BYvcWw0vz9K9ccVlROTQ7FncoUi3H9OYIN9P2N9+kIRfJc1RU9wwYo6XMqZAXaj1h5dCkQfk2Pl0c
	MuROCd47wB4R3Z+YEVDJ4lNcozsi4FlrQ7Q5TWsnuhRDJ0uzxAAB5lY35cLH3oN5a4BhfWre+fUFX
	RBsvVmA+4ifUDvkntl2B5Id/s5PU66gRAoDspheI53Kc/xwQBnhdLq9PRQ5lFQjhNwJWUKt3ViUbk
	cSsw+eTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCpk-0000000BVLN-39yC;
	Thu, 15 Jan 2026 02:11:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCpg-0000000BVK0-0owL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:11:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so17955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768443089; cv=none;
        d=google.com; s=arc-20240605;
        b=Dw6oh/e4J05cuQD9fel7+ZUbxLJSfxP5N3MSOOU0nWWolV8KWPEdKS44QyRo2xKzQH
         WzYVXpo6l5LzfPudsxnljVzHSsIblKyPqgGqA+K/N3qelKWbTvU93d5ngU0rZI29Zb0/
         cLhx5dSzi66iD9j67Sp7Q1jtTyBPLPdwvbNPWBKVvtEEWfGQaCmkVBmMGpLx7Q93slcW
         3N7oKSjjPYOhdAE0TcxRbpYApV7LiGb7yotlOBaK9VoXkFS8q85CErXLZaKpOeYHaMfN
         xt6Aik4ww9xnlI89oC8ZyKCGQ1YdJeF17aeCBi+3aNBtc0yNvKW4EejiXm3B2AIpBoG5
         aLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        fh=C0DljioOEyc1eUTP9InO2B0M3E8xgLc94SGVYO775aU=;
        b=bmO/W8xRx7I46Ep4MyFtVtgFWLzvF/VXb/vTwSNIgx79p4PANAlQHLZOYy2lsgr82j
         LgS5pcZSc7VBX8tnKms4zv/9AscBZE4oYczE2EMZE9CHUTFFHHYy/hNSOVkadbhgz+rG
         WLzrwBk+uKmVYEuBkhu1hXH6uEtGRVxJ+Ey8yktKQd+5fv6gKvRqMGw8yIENrb6GAwfL
         cc7/btdA/BG8rPoZ38DbmyRBarYOi/iJ5TXgZyAfE7Wx0w4cSxEzA3fiq2qc1Z7XWduM
         lqGU4TuQXVzMkjcGlriNXj9mqyZ47iRhtJ2q6vjJ4iZeXqpqW43NUktJV8QiPcZkhSPp
         AlRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768443089; x=1769047889; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        b=UwU8G71tAsOnnDP6MjV9wRsy2x7TRzFPpNGPrHv10EdkSQcbHGjg3LlJ8QHy8F9Wpk
         KyiBVYbZnLaZ9hC7ivFlcJObBmRfY03GUXBRXuZxjWVgo1FQ/cNuVvV3xj+HEiEAM2DI
         us/UZlvDTPfOt6+RGW00DklC2nqXp1eFtsIQpFPsSsdSQJDssdRY9JqLfPkHJ+ruALoI
         Big/6MroZCuKvYsscvXM1C6mIkxUIyEwp0+St+lSM9/7mV0HGzMk9Sdv6W5RL/pA7Ph6
         FN8u6xLbNIpAsgegOmF7+0wM6uX8KGJEaPdtXwimF2uOPRL9r1HGn3PNjBMq4dIlugq2
         VXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443089; x=1769047889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        b=DxwCmTZQSOsEyUA3ZNcfqN4zaEc0z02sV1BKJ5m0Tp+bMalNLxujr7P5WZXnBKIRuP
         E1RZWGHPK/fLe7lx8+ukOOmOd8+53HirQtU9pvRLspAyfMst1DV6gEZO7OInyiBMSjku
         Y6neRCbxnS+UfEwJPKqO8lo7Wqh5mQ4u78qym/GpbV+8DkJSc3lLNGyrHXfgK9PWnHFD
         FvqF7QNWZQiGHpYkcbfzE+AGjyOTezb9ICQ5KlusaMHuqkOQYP/389mC4CpNvsqkWxhm
         wJ/aMvkF7dhNe5uw85MTJPbfjVrgx9eVbZHU+kXAsaRuAIH3TPXo4U8oW5XYalfa6w7V
         FzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0vsswGISnrfjmJ+73WrtB34+K8ZAiGxHXUs0HH/0FlzXTOH9gMA29oNfuAvED9cyA/ucjUPKPLg/7iyM20HlO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsoy3mHvCaWp/hWUSgAV51ekNV98SM/kg8O3ebW8pemLXdBbH1
	BMUUpBJdzgIxFCJ2z4WFpSQFT6IED158594URNcro66a+hEcSePOBX9R4g4FrjwVQudRrYWb1Y4
	sah0OmLsO1WfXiJzVWPDc+kCM8l+dGtKRepOoajhI
X-Gm-Gg: AY/fxX5pPzwZEcvtnPhicExAUlmAqXoWpjfTFmLuBc4tcqauUHQhSjJ2GV2sM2pY2td
	1u2gYsJf+EruX8mvoJstSv4kbeuyOyipldhEnBbX3XM/vPUX6Sm3Uki+y3emCP+0DQbpGAyMtiT
	ikGw20sitY9RvbvymrZT8yYJi1QDZNM90Qc/pSVgnu7kuC5c7toDhuFclneutm1wLfOmmoNuQdz
	wYcMAtdqHVVmL7HBYj+8BWEp/C35rYi4dfvQtbwYwubYDFqnT0PfH8TnYsVK1eAca1p4t//Fj0C
	E/rTj/+7DcxY7R/IOYfsduA=
X-Received: by 2002:a05:600c:19ce:b0:47d:6b82:d954 with SMTP id
 5b1f17b1804b1-47ff94e9861mr213485e9.5.1768443089055; Wed, 14 Jan 2026
 18:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20260114145243.3458315-1-lucaswei@google.com> <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
In-Reply-To: <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
From: Lucas Wei <lucaswei@google.com>
Date: Thu, 15 Jan 2026 10:11:12 +0800
X-Gm-Features: AZwV_QjxHuOYFBK_XIX3hZH91ksqeZtJ2lgVboIBtf45I2RCXUJSUGcAgkAQ8Vg
Message-ID: <CAPTxkvRXmVB9MbPX2vkyhAnLDyJX7YviekOH=y3EcS_1e796Zg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com, stable@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robin.murphy@arm.com, 
	maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_181132_259829_C6186827 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Randy,

> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 8cb3b575a031..5c0ab6bfd44a 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
> >       return (ctr_real != sys) && (ctr_raw != sys);
> >  }
> >
> > +#ifdef CONFIG_ARM64_ERRATUM_4311569
> > +static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
> > +static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
> > +{
> > +     static_branch_enable(&arm_si_l1_workaround_4311569);
> > +     pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
> > +
> > +     return 0;
> > +}
> > +early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
> > +
>
> It looks like all other errata don't use early_param() -- are they auto-detected?
> Could this one be auto-detected?

Sadly, this can't be auto-detected...

In my v2 patches, thanks Marc and Will for pointing this question out
and we don't have a reliable way to detect
errata in runtime because Linux generally doesn't need to worry about the SLC.

Robin also proposes a few feasible ways(SMCCC, top-level SoC/platform
compatible or kernel cmdline) to
enable this workaround. But, I think it would be more straightforward
to let the admin to enable this workaround via cmdline.

> > +/*
> > + * We have some earlier use cases to call cache maintenance operation functions, for example,
> > + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
> > + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
> > + * safe to have the workaround off by default.
>
> But it's not off by default...

I think it's off by default.
Would you point me to where the workaround was enabled without cmdline?

Thanks.

 - Lucas

