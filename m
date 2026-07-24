Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7323AC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=; b=FdU4TIOH80q1Ni5Q8lUbsG66ag
	L5ZYjbHiEZNoH1/MKOt67l57Gaw81cuzhAarXQngce4gB2Dj9HIzxC5MxMPJNJ8ruKN5MTYsZTWK8
	n6iIMZXaKeUco05zcI+ImCqGn9XqayX/wJz3bSnbLAlUnRRpoY4kFyfFB2Dp9fLSECV+SMGjeneVa
	Om/8Vgzo0XpHCLThkUx4gueNPxgzfKGVmnb2nTfzwe5w/CZwayH6duTYEK3fu2BEbXSvT05Birxxo
	thVA2inWXncSeZE4DKaGYtpCirFMB1kq7OSeuA4o+scj0i1+aChskZQ7iSPKtNNNykWrG1yDEE7MJ
	d+9VkdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBgS-0000000FtCQ-0eEC;
	Fri, 24 Jul 2026 08:55:08 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBgP-0000000FtC5-1JJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:55:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-39c83acb86eso1527991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883302; cv=none;
        d=google.com; s=arc-20260327;
        b=HIclq40BnpiQNxTCLh848qr1z/Q5rX4ULxYRWaIuktUXL8fHNmDpHi7VDhj52KB+IU
         bSzPj/6GlrGQOecow8uBoz+/2bHdW+/raR+QA2iUXDQLhIHg5jO+9IqbXENS/KnBjfkj
         yY7ddndUaXDCqWQ8fmw0/9J4tuOyP17LVDOVueI4zGiXfECOXlpvngdLqnCICbLuhTwC
         wRnt8Ruv7vv+mT4ap4PaA1f3RWJVJoyknYSSkSUe8avpHYlBltlSfUoKU77weheaZhjF
         PY5yNzO8zW2XhHuuh8prpwdX4LeYJdWJS05Xyt/XqWPOppNeLtx+mtg+yHnJYXBE1Nvz
         E0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        fh=WtV71yuKSNqyitJkpBWJdkPe3I1Y2uZoE97bDGmZhGI=;
        b=jZMwM9xEyZKPvb+lDkze1agEwlzcYVIT8osBeKETRP5sOy6zQuqYj/OIyOt975raQg
         xemIm3VsFYyXIq/SwvbUvdXF45j1lqHg35yowTrgZA7rJNBtuuQaKTA69Ycs0KiXvETq
         JHCaIFqdDklzK+vQzgcO5iDQISiUj/BejloXZEnxooElEG957gE50Pwlhxs6SPwwlJAF
         5XwXTfhjXQrCFeCmBTjU4NSbq3sMwKapGhjv+UkPF6SYxbluBoMctp5ZgXUs7JapM9md
         9Raq8Lmrl9lZjop4B6fXs4JGvekkJJPk13IIl4s4g4oAoaORedvMFEQj+KCc45GrATht
         oTSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883302; x=1785488102; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        b=lRkOXMpruqZMe4TI2JVVwL/NfLSwzvFrPnXHJr8kPNMKap1DpR+cdD5SOhHZ7M3ga5
         kDkunxxHNew2RAnqmwOdKP8a/dKUab6hHRazYu9knk/k96UN57foNLez1D332dX9MZIB
         0osTpZwWXhGlM1/5t/zug4BCtimdHSn1u4Gbo+luUegyd44f2+EsFCDnW0WMWfFt31qI
         3u9Ue7ZnI3cwxmyobYRBqlYfdqhV66zT+RgpVudHFQE1gOsxI6aK1KU8pb5AwCxBQqqY
         NdT7+qQJMqcj9mR7le4eIxp8tPwjnw/Gg5S3qR6D7/eEXYdwnWHTYLs+DAxBi/RYnAJo
         8oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883302; x=1785488102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFrOy65FoYuppM1zoWnZJGXtJnANYQloEST8OS/KYvE=;
        b=kFXqf83MfN4qg4G2TlhvT+Fha+x1q8ztj64d1rGDGmh3pZG6cc9SR2beDcnXnKrW8u
         hGhljEUU0NoeGRn4YCGmgIyT0df1c2382qwr2yaFR3RSi4mTqK1gdAVmalqhjxDsGTm+
         ZnIy7kViyI66ya0gr0nAtvatb3AQn6LlOaGS0l1otHR87D87ueNtPfakDgOr56DdkRZo
         PI4Cal+OL0poxMQTLUGmGzUoTC1OK4z449P9h1JMXxq8SNGfbIXrH3O3A56XYvLENr/9
         0V/xoN5DT6okg7ZfCHWwUCf+5e7wjS+sQa/k+p3Y9cxxQD/3pDj1LUnRcWenjpzuWzsw
         Mepw==
X-Forwarded-Encrypted: i=1; AHgh+RrIixPOEq/Rvxo6fvPRK3tN6Bi5nG8alDcWmb4KngI0fVxDfWwuPlwzwXPwju57jlCtUZSEuEinSX2xBQFbzuIR@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWLWsHAsz5nvtf9XsrRGcI46+N1r9GXOIMJPD6vcGi7j/TnVE
	JD1BjPq8T79RrfRlzcOLUA1bAdKlgS96NAqSlT/kS/ScnH14/kHJahaoZr+++SFEcyt7JyTVcTY
	Fi6+P6weRc4w+sXKFX5rEOR+M5VCZh8k=
X-Gm-Gg: AR+sD12/4ZmQMBEZOoPnUKTkCmIJQcetoLwFyTBlQp23NyCPed5DPh7owiDYAWIBLmB
	4oZQ+RyLDhdyyZs+hnD3qL232ZKAB8Ca0DZBHdXQGvyfLRTN8keYabi49WZTksNPEkAJX4ahoCx
	O/u2yvr0F96QbpBLET/unZop2LWcXI9xL6gmkQcsATD3j8akATypn7r5HDXRfSdTrFbYvXlg7nd
	SgktIE8y/IwrNQkojwRry9GRUID8HiI7cdXahKfPTOojHAgrdcPb/g5vZExR00=
X-Received: by 2002:ac2:48af:0:b0:5b0:1b0a:2370 with SMTP id
 2adb3069b0e04-5b2b2f5b400mr800803e87.2.1784883302128; Fri, 24 Jul 2026
 01:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com> <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
In-Reply-To: <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 24 Jul 2026 16:56:49 +0800
X-Gm-Features: AUfX_myGJyR17GFm4lH9fHgfV6_QVr-OCcsB4jX5TsUhw01m7QG3sqAtjNzOTlw
Message-ID: <CAF7HswOR3bTB0QpSe0R1HH8efFaQHqDj_8s_L=-Bxd2wgGH32Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_015505_375640_82D4CFF1 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Andrew,
On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> Apologies for the delay in getting to this series.
No worries at all about the delay.
>
> On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> > Summary:
> > Add linux device tree entry related to Meta(Facebook) ventura2.
> > specific devices connected to BMC(AST2600) SoC.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> >
> ...
> > Kyle Hsieh (2):
> >       dt-bindings: arm: aspeed: add Meta ventura2 board
> >       ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
>
> The two changes don't apply cleanly against bmc/linux.git
> aspeed/arm/dt. Can you please rebase them so that they do?
Understood. I will rebase the series.
I have also fixed the 'mixed-indent-chars' formatting issues flagged
by `dt-check-style` and addressed the DT schema binding warnings.
I will include all of these updates and send out next version shortly.
>
> Andrew

Thanks,
Kyle

