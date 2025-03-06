Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15926C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EIWBk4tJ9DcjCef0B68zkL4TVv6vr+br//UXXBebTY=; b=kmHlAmrxtJJyGXdhi+7abG4TiZ
	tvLoXt6tcYWX14/lYCjIgEXIzUH2Nc7odKDYkswq2tbs6TTLxXgqn+D8rbwfo8C43wKoLNVPjFS0P
	mva/snRQT3boEJIzEQ4ySrBnpmi5uiKE3en2LK1v7mThID1wFus0b86pPdsgifmdTcRH/LcLTRyDw
	uEWWwqLZFC/6nfys9MFnQ0xnBexDMG7vrx2ExhWYG8cE4/VPZUecr7HhmKYTxhCV7fdWc1gH/tXrP
	1max2b1P6AYA65rJ2IjC402w1YZo4WW/eoPH0n3AK2tF1lKL9vAa30A//3T3vYLrINOWQVxqwkX7e
	pW8noxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIKX-0000000CC94-08FJ;
	Thu, 06 Mar 2025 21:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIDK-0000000CAkO-26Me
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2719E5C562F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 20:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989F3C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741294385;
	bh=8EIWBk4tJ9DcjCef0B68zkL4TVv6vr+br//UXXBebTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=APHTg84BNm+76XY0dyuzNBRx0u2sI1vm9wZIimm8V+cO2XEMAFRCfxCu+rEO2L3Qm
	 mvpTBYdCn5GL1Q15EXkthJHdqWucSw4lV8/Alyz95gHWUuhBP5PPYOM8Rxmd3zTluV
	 iQQmQVYMnDpNwNd34gUe4crgyVg2eDmkaLN0kzuD4knRY2Tk0sufBhQ/WWdawKz+5G
	 siXCIETkPU2Niu9CxAUhI52Vjzm6GB8d4XmAWALexEOg9vBVIrOEBsmEkfc6m8yTpU
	 WQVsx3rHzd84XzYN+6FTkOkzKFdCyyXDl0bcABZClPvuCxsEnyIH3UlwGTQFkqPxdd
	 3AyN8e1offIsw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so2071221a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 12:53:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMtVyM6/meDDPse0MvfCRkxL05bWCLU7q6hdNbe0h+ZZfSla9iGY930q8EUjfgQG3KLMPK2uwWkwfShbUnG/Wx@lists.infradead.org
X-Gm-Message-State: AOJu0YzZY0TqcJRH6Fef+495F4ZBl7TsGwZvic5P/uJat/ki2NOfnasn
	8VhbM7kgMsX/w5MFYQue3B93yNRYjv1J0LG0wgGx4crcVF+lxTajlERuknzDTpWI25sKtQxmOmp
	zIkceGPqqvsEgMmYA+OLyZAUUHw==
X-Google-Smtp-Source: AGHT+IH5psFXwVKCyxrdJBjvpX6e1H0zocq3/4I54Esgc8tc7oSOEtw6YqwbDn8nqXPQKSRVO+jSPulH7nXNnGe2JD4=
X-Received: by 2002:a17:907:710f:b0:abf:70af:f33a with SMTP id
 a640c23a62f3a-ac252a88a07mr42095366b.21.1741294384101; Thu, 06 Mar 2025
 12:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
 <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com> <ab483a68-40a8-4b44-ad73-d8a34bd32c69@kernel.org>
In-Reply-To: <ab483a68-40a8-4b44-ad73-d8a34bd32c69@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 14:52:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+95KW-JwA_OZsqQ9htirBUtBE9reJpa5fzeZ8iwYBeOQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpdgrHGl-0Gb__H6h9xuDppF_MhNrX5FMmy6vVAVzcGGn2TGfrvWYVxLpM
Message-ID: <CAL_Jsq+95KW-JwA_OZsqQ9htirBUtBE9reJpa5fzeZ8iwYBeOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom:
 Enforce child props
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125306_626409_76C01D3A 
X-CRM114-Status: GOOD (  14.55  )
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

On Thu, Mar 6, 2025 at 7:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/03/2025 14:39, Rob Herring wrote:
> > Why do we need this? Any child node should have a schema which needs
> > to include mc-peripheral-props.yaml if any properties from it can be
> > used.
>
> From correctness point of view, you are right, we don't need it. However:
>
> 1. Convention was so far to have in every controller. I think this also
> is easier to understand whenever one reads the bindings - clear
> documentation what children on this bus should look like.
>
> 2. To clearly document from where samsung,srom-timing comes in the
> required block:

I could be wrong, but I want to say that's pretty much an exception.
They are usually optional (other than reg). Though I guess we want to
enforce 'reg'...

> https://web.git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/D=
ocumentation/devicetree/bindings/memory-controllers/exynos-srom.yaml?h=3Ddt=
/next#n50
> Otherwise for me it is a bit confusing to require a property which is
> nowhere here defined.

It's a bit weird that non-exynos properties are allowed too, though
that's always the case for these properties.

I'll apply these.

Rob

