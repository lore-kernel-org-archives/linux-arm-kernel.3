Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034EC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T65upEdCDY7gEQSF7YmZBvbMiIUrTEJa2opQbxpVZOA=; b=mTYCJpXfnVu9fhGuDyHY6IJYOg
	C4JBcVWsvlh7yjQqTOANXq010MtC2Y1fTFxKRTNcDgFEfmrqesEFw6T9v48HYOffNMuTvI49Ate5p
	X9Umb+RFSS4V0WOmLka0fWTLKOJxtymeNdgRLuM+8jeZ0I9eBPP3+IX3tXyHjCYcqRmh8JGaW92PA
	RTy1edwmyQSYhOmNRKfwJn7pln6fI6eLQFFLxbw35WuNsUkMJMOMHN3+nrbkE9p5wO3/vCxSylWEa
	WKf5glfqdoE3bmMglpvSpmoty7wQMRO7XTfOklnkuo/0/gjPY+nHkEsXw5khNcJKidSSgSRhQHeVy
	b3d3O4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpPI-000000038lC-482m;
	Mon, 07 Jul 2025 17:13:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYokY-000000031fU-1nmC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:31:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2275751a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751905885; x=1752510685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T65upEdCDY7gEQSF7YmZBvbMiIUrTEJa2opQbxpVZOA=;
        b=Tw39JfkQwAOPu0F8P39+lWP8pMZkZzHb7AlDcvcM5lxTFKNLR5sbkWbp1W+1JxOJUb
         3lojYeIk4ScL/7gum9jWo1y+iOeIpwSk5vxpm+IRrn362+BKxENM+S1APyD6JH+YRv0B
         qfK/hlcHkFMfGNIkJpIX6iuG/bF4Ts8/v/qls2rcO0bTBPEyFP+aNOfxO+y1wj3TlWVH
         6eAkNxE9AAK9n+D5W14Qjrcr7PB5ZoaK+A+EMRYQTnyNjbqXwVVnhe4AcP9RqX+vQbOV
         uGSrMUMX2JHK7DnoO+jl/uDCMvxTnXCgapeo56MAfOOFiIDPmmDw2OUPCgsOOLg8x141
         lp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751905885; x=1752510685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T65upEdCDY7gEQSF7YmZBvbMiIUrTEJa2opQbxpVZOA=;
        b=gqttUbbJJJfDFXK1SZKPuEJzOQ/bQViExz/QfT9QTRSpJyVgPCD6EepxwByoveGVn/
         gGn1qZQe39o41q1NqGD3Kk32xOrtlWcSvo3v3GaMoNMKprh5VYhotJWq/Zm6MN9xu/rl
         kNv1HFSNe7Ajb2RgUNj6S92/zS8vbBpLRW8u5hZ3xDEPX3AUdvbJKN4weRoDMh0N8x+E
         a24Vm9zplnt7io0RK2C7BImXAtzGFSihX8OnVXw/ENpMMsH/YNSMcoJjHfvvcJS+NYGa
         NkKEtKb5LC94FUY7SN2TnYp1y1qwwN9sK7WUb3hYi0dPNxZU+MKFUs1mSwtboAxAhReg
         R7fA==
X-Forwarded-Encrypted: i=1; AJvYcCVK3U2rAkAcAyupUDyqA6e+6SBsjaDBMUOoZiAG3HMtpxgJvCo1Pusnn33HFR81/e0rp5lB+MS01+taASJe3hEb@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ6W3XxTbcrd5JDkWj4fguKxaHvGjd/ZnScq/op3cbftkVX4/5
	GJ2ib68uaBv9Xg4vCo4MQSoRP6tyGe7ZvaMAxSdBaJH6O9v99Q6didmJ
X-Gm-Gg: ASbGncuuH3kgXXFJazvCxwpD4Avho1UMnF2RAR5r/4Ipvc/0fZdgyoSCNxZqYyIY7uO
	NJINaUJPdQ7YjeFgfmHTY6RB0uTGYdyR7CigQOKsIrxDcII4c068JrHOHi6rruky7P+WYG9aESR
	KkMRT5XEVe7THfNcBpAzINpSjXO4Pd3vcEhHb0ojnKWERciKLLkRYH4A7uHYT10HdKvNU9G939W
	RrhU8RGrn+nQeAZIWmUwPZkpTulf5iwQkPoEDvT1Hg6OQ1bAFCxMl6/oiSWkpHHGZz+g5vbQ34h
	DB5oo7lwc42B2gKiO1nOH6QyeR2iYn6AqDmvRZ//eisBuQ6wPi0Hu2vOiagUDQ==
X-Google-Smtp-Source: AGHT+IE9LUw0GOAkRdv3EbKLvPJ2vN2Wm1zWt6kB2645lDr4uxnf9kEor2mDWupUMMQ9E1c4bRBisg==
X-Received: by 2002:a05:6a00:2409:b0:749:112:c172 with SMTP id d2e1a72fcca58-74cf6fd8194mr11055113b3a.16.1751905885276;
        Mon, 07 Jul 2025 09:31:25 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f765sm9231493b3a.75.2025.07.07.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:31:24 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:31:22 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org, james.morse@arm.com
Subject: Re: [PATCH 2/2] bitfield: Ensure the return value of
 type##_replace_bits() is checked
Message-ID: <aGv2WoAtxnEgqV4y@yury>
References: <20250703135729.1807517-1-ben.horgan@arm.com>
 <20250703135729.1807517-3-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703135729.1807517-3-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_093126_467198_975FB7AC 
X-CRM114-Status: GOOD (  19.58  )
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

Hi Ben,

On Thu, Jul 03, 2025 at 02:57:29PM +0100, Ben Horgan wrote:
> As type##_replace_bits() has no side effects it is only useful if its
> return value is checked. Add __must_check to enforce this usage. To have
> the bits replaced in-place typep##_replace_bits() can be used instead.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  include/linux/bitfield.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 6d9a53db54b6..39333b80d22b 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -195,8 +195,8 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
>  		__field_overflow();					\
>  	return to((v & field_mask(field)) * field_multiplier(field));	\
>  }									\
> -static __always_inline __##type type##_replace_bits(__##type old,	\
> -					base val, base field)		\
> +static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
> +							base val, base field)	\
>  {									\
>  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
>  }									\

So, would it make sense to mark _encode_bits() and _get_bits() as
__must_check as well? At least from the point of unification, it
would.

How would we move this - with my bitmap-for next or with arm branch?

Thanks,
Yury

