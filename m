Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BFC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVQt/Nqqji69kIM5g7rx01djRP/pornxKI6rvofp1o0=; b=ew5nLB16ZKWatpzAgc8EJc8o3o
	OtjM5qxVg4vQ5dPy173AGy1oZCoDkFiYe0cjSR7ua6WL1sDrHuMZZY5xuLCv/fmYtsUbKVyvJEukG
	lhV0UzdW36kVgjLLIFnK+1evxYOvIEuTq/2yTJVfje8mO34PBV+ajWsVx9D/U6ufDvqeY4vYFCdya
	L4Bydqh1S/9Np9MY47KwucpwanMd0n6lLYalqpFE8Fo90nj4UTxBChjJyKDguFrM2BLWqT/uq5cpk
	5c6B/mc24x7jEKX0vOf77KEASjl+wU36suIQAYM8puBn+aJO6JLgEGKYD5h+gIGV8fPUKyV2mOzd2
	PmO6M7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp48N-000000083Jq-1NWR;
	Wed, 29 Jul 2026 13:15:43 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp48J-000000083H2-3cnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:15:42 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-497d3e4460aso1868680b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330938; cv=none;
        d=google.com; s=arc-20260327;
        b=aaXAEifR1Np6id7XB26oW0X97GxNd1qkV2r4e4yVcFp1RKfwIsUNtjBQJ04hVEadeg
         nUsT1ui003mDNpZ4LwpB0/yMguYs3VsQ/VvsZJVL8trC0nWWHcCXnvpF1sVUYpuYok8K
         h16VgR+Qpj/To84+quwbkz+7Pp1buAw/IUwv6xXBHDzvyDmdUGiaMNhsfW4DG6IfdLTo
         z0zo6C2WCu9RoPWvWU9w2Y3mE/T5IYL+FGXlUECZfuapzFEHS7p/HSAfKpQS2NtjKVAi
         +0oEV9KZbsMGf5jr5Bj3tYMlrkFGpP9/LYhD5weE0AIPYbuHi2GZ9lm/cC6lI5wNGlvX
         MOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LVQt/Nqqji69kIM5g7rx01djRP/pornxKI6rvofp1o0=;
        fh=IOFm2Ga1H6sgh153I7h3rkhMNLyDJFX1k3KxST96Y1s=;
        b=s0VeRnhrLeYo4dVGsFGNFLiiMRqGazm0ssUup3m+GLUiAM0bEY/NqCVQvCZRR0qgWM
         xMSF92ceeySAj0qe8d8QARUoGRa0jhKETkFIcNM+Y7NbjaQjp8uCGpXJlAYV7Vi5g1iq
         BGVwteBQqg957Al7N3Q4OXYrakSpVfJjCrphyseh6xO3ar3oBnf3IErjjsI0m/TnegW+
         XiXcN2NfMyClB1jY5JooiqLg1UonldWSzzjsISK+Sig7HpkXCWJOMExEFpwOCo7mDJZa
         zGr1QIGb+bN2VEvw5+HNlpnScLvrl8yYUD8Tof7dB6HGSotjvkkpPJfjpG1Bp/indifY
         9aPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785330938; x=1785935738; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVQt/Nqqji69kIM5g7rx01djRP/pornxKI6rvofp1o0=;
        b=b+CJN6BeeXvI/tJa4VVh+rdAdqg+SOSoANI3sbU/esSONFm2jBZVkcS5zTUf04YiaG
         oJCIuwUSaJBrG2OhSi1joYNIg4FbGb6lF//JSfOTnmLufSsrmBIN9D8lJHwl369ueuYW
         6T4mQcOGcYzafHevCEAi0YyjqR/vb4OEV3gPyNQ9T7CNyJQh1rmhFcSC8WhaQB0N10kJ
         ty3WfvhXXl7bQLGSPB43ej4SOma2NbZ/TAQFc/VWY4syYN4ojqWZp2l8UumtU2ruSyBn
         72yXEj62LIlcesEqwsNbK3LAaI6c0sdBDMtdcE6XrGKqO20LM1DERM7U0xJkRfjj8+SW
         bfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330938; x=1785935738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LVQt/Nqqji69kIM5g7rx01djRP/pornxKI6rvofp1o0=;
        b=fX4ZEvA4J2cPpqb0a6Y1Kx0NjM5LRjKnRj2Wqqjd0Dou1f1ZNB2HPOxARIrTYGIoVh
         gFzy5O8tFQFrKxrKsE+lSH5yCeQurAgNva0VsNMqmqQ7UqmhYpCkAeslzi0S6BrFajY+
         njMAfTGFUV8KFFUb+CdkbqWr7XL+i7WDBXAAzsdXfggHuDgRrskN9eVQNFgsmnYpnM5H
         ciNvG7dflDoTK+zY3dcosPlTSEbu42NFbyUosRK91eYY6oTtUeQBbU/Luwe/2f3KJgbt
         3qtW4gqMfnI6IyUqQk8UbMYDO1dWB4IyblWUBuvl4k6NlMa+8XbpRkMYNk87Gl+73mbk
         XAyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6CjyYwHzwOIP/tBAIm3ax+eI9DeHxeiMgWVn+PMdJ+v88zblMRgfCWntg04+SlGnMe0g9dZ5eP7lRCWqYhXcO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpdt6RbyNKtaSv6Tgnv5lM+0euUqhuP1LtSPo1iCDseu4a1ZH7
	2sAo3rogdO4KGOYblQ4JxxMCmyclQdXA3JS7c3G4++O/6WNbtIfgwjKtyTXR5QnWTV63ht+LGCN
	zrDvpLl91bsKbG0fxdRixQsCXkB+Upfw=
X-Gm-Gg: AR+sD13IH0ODn156uBBgo5L6uzP7CyZ6v2zVOwURCRZyYbiD4WbKjslIhzIYXxpFu5C
	I4nO7Vnvrjz38TjQhHg2wnqvjKg5Yv7sn6Cqg3lPe+T32b49VRrdDk6nEcz/ncDxKJ3GvhOEbRc
	sTCRgOoVxZGFuQI4ejq+0cneDruUlKG/FIV3LhcCFvXlsN/L2pMoupY8pH5sFt68HA/K66dne2O
	Siw2M2l7eOIL8acTE2Pq8KKE+fhomxZDPQS3Ga+gXymsGFEVeFol3U53DU0Sjf3vrNMxGR7mNe7
	O0lvL7of5o3aVcIyQvcMDe7odWRTfNKEfhwj34SC+kks7Ql2coqL7YLaNvis3PpChjydArQcTxw
	=
X-Received: by 2002:a05:6808:f8c:b0:491:c51e:189c with SMTP id
 5614622812f47-4ad733d5965mr922440b6e.24.1785330938411; Wed, 29 Jul 2026
 06:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
 <20260721181729.305137-1-devnexen@gmail.com> <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 29 Jul 2026 14:15:27 +0100
X-Gm-Features: AUfX_mz1TodIEmggv-n_OH9oyqAzpZyOfg5h99XrwfHGTz1FfzI2tlKVX0hemHU
Message-ID: <CA+XhMqzVk2K=NCjsBCvRnfCShizf7vTSB1e3jfadXUxOdbpTLg@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Barry Song <baohua@kernel.org>
Cc: jiangwenxiaomi@gmail.com, dev.jain@arm.com, david@kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_061539_903661_E1E0500F 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

>
> Could we do the same here?
>
> +       if (!IS_ALIGNED(PFN_PHYS(pfn), size) || size < CONT_PTE_SIZE)
> +               return PAGE_SIZE;

Thanks for looking.

I don't think it carries over. 8xx tries two candidate sizes, so a failed
alignment test falls back to the smaller one, whereas here we would
return PAGE_SIZE and lose CONT_PTE over most of the span.

My concern was misplaced anyway, sorry. [addr, end) is always a single
contiguous run here, and addr and PFN_PHYS(pfn) are already
CONT_PTE_SIZE aligned, so every 16-entry group in the batch is naturally
aligned. No extra check needed, the patch looks fine as is.

Cheers.

