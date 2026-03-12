Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF8105A591
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=; b=GbowJvnS/W/R4YVyqa1F4TwNE+
	ESuMlYTGqnkqwUA7CjtZmLCCyeMQ3X5hokRORkj3Z3xTuC1D5lSwoCkZC6VontJnbaQcFauWkV+sw
	Xjej66wCqf6WU+VuS30mzbQS7YcUeqUfRcl2wwpIVeDUgcWef1u4dwOKnkHgiOyE7J82uSHYyD+dm
	DhBjLjT/J97KLaaz3gs9ctD7noWY64NSN2GA6zIIRvlMqchrR9iwlUCF8lmdKsiaWc5/wO9WzQ6f/
	fUacUby7VytMvAd0QmlOhp4yKWkmIkv3eR7AFmD3MVKW4Gaf1dPi2wHHD9WCijoKJX4N8OQikWzHW
	dKrb00pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fXx-0000000E502-1HdI;
	Thu, 12 Mar 2026 12:53:50 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fXu-0000000E4yu-3eCf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:53:48 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4043b27ddeaso637493fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773320025; x=1773924825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=PqKx9b8gCq1X4S5smoMl8y9rJhMPkJWPaAbrXVvWDmsnPs4tUnMako8OB+pUeId1eE
         7hVu8O6udJf/FOiFcNn6OdZCI8Th2KAKOAL5GscD75vh8H7wtOEo0rmv2MdsnaurOhb9
         kJr22L1Nxjw8UCfTn82G0B0lz8su5MWy68nURKKpNkryEhavSRp+MTJqzxHdUYOqp8WE
         XvVwwrsBIgu9NwNkHo1j+RBY1dRr3WOuV8f0ixBnXPZQFboAsPsITPzw2++37PjR1uqN
         zzuiW3E932+orTLSpT8roXMh5IpJW+LAIZ/IqDzSWKjrUCHMD9gImWCgOWF1yi+2sCJM
         wFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320025; x=1773924825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky7U0hmCeNi6OyUrf2MxogfDAlaxZWXxIQIvc2Y9k8Y=;
        b=MaZVwyReJmq7bhGjh72LjA1fgRWeBeQHYWc6fOaB+LnELy3ginW7R1cHJjeWW5coSi
         kMmf+XGj+HIK2wD7luueQ97+UkJHDBJj/6cPGqJWzDufTV4RgPXWuZXJn+7vOcNza6jS
         qvKt1AysIvSteAf9b6gEgTDr0ezY+l81ccUf4YRsH4GO+qGa9h/peidb7ynMk/mBaU0g
         tpOFjp1ZkT3aO6WursqYdWHXwgtVN65Mc/jggYVmko9iJDYCxLJrP72Vw3NLl4qD9BSZ
         FyGbglwyeU5J17HE/z5i89+6PYsMnjycIE0wf8ctYa6F6SGugZE6s5PVUicBKKEomFVC
         lxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX4Pofo/rqXb3t2wZRZN7OGjwMEyXCVSjOzxuqzzN8bri5F4pGPNx1FJRO81mLGWQstjjI8kzQyjmR6/ZEJTp8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ovrbj7uze1/LhHjQ5OC6W+mPd24vpIrQ0SqhwMsML2Wreu/S
	blFWSasfFWlUoyCfeglAvCqH8PErZ5dBAP+I/XSR6qIMCW09fAhQf3PUabOeWmjQyHA=
X-Gm-Gg: ATEYQzzqiEPftXolEYcYbyQnolqlGAHGLYulEOw/MlnAtHdR7UFNgX1yQpGdSKwEnFR
	PcxTDlQqZTDxxtIGgA9UyK7gnTwS92ZOqFouf0oNg7Ye9fpmsdDp+/jy1YLEFQ78klEl3DVpP39
	Yh+znOjc96EIIZ98wKvaOqzor36qryJmnbWsKbduuB91fO2Rp0pdmpwiM4HoNHzZfQGU0XrBNg7
	hftvDEozrfdwfTKRB0170ZjB9G4P1uPL6q8bmaKXrokNaoSXWIjmHans1LQvKf2IKvQaVz+eQse
	lDP5QrZaeL3koFvB1tsnyyPiPgpYH+Fh7cPgsUdwyQrYbbieJ6cCr7RKYMTfRMfzhx/Xd75zGYQ
	zlhNx175c3JZLyIhS6KH1zLz93h6MeseSkCPc15ngLXwOUewPXduh+pf8QYM5vZ9kkU4kV21naC
	WiTO2JZBYrDmG8kO9BTbwJ4r2M5R93iQRR887zqQE=
X-Received: by 2002:a05:6870:649f:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-4177c6f1d08mr3392540fac.7.1773320024820;
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41791432d87sm3765785fac.1.2026.03.12.05.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 05:53:44 -0700 (PDT)
Message-ID: <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com>
Date: Thu, 12 Mar 2026 07:53:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
 glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260225081412.76502-15-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_055346_952055_BADCE7BA 
X-CRM114-Status: GOOD (  17.66  )
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

Hi Baoquan,

On 2026-02-25 2:14 AM, Baoquan He wrote:
> And also remove the relevant description in dev-tools/kasan.rst
> which is hw_tags specificially.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>  Documentation/dev-tools/kasan.rst               | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..e0115fad9e60 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2899,6 +2899,10 @@ Kernel parameters
>  	js=		[HW,JOY] Analog joystick
>  			See Documentation/input/joydev/joystick.rst.
>  
> +	kasan=		[KNL] controls whether KASAN is enabled.
> +			Format: off | on
> +			default: on
> +
>  	kasan_multi_shot
>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>  			report on every invalid memory access. Without this
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..eaae83fcb5e4 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
>  disabling KASAN altogether or controlling its features:

The sentence above is now incorrect as well. I would recommend documenting the
parameter earlier in the "Boot parameters" section instead of removing it from
this document entirely.

Regards,
Samuel

>  
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> -
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of
>    execution (default: ``sync``).


