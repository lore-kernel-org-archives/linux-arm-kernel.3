Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB241090233
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=; b=cDwzYw/5moqtR/Z8wKcz6YPADc
	xe1ddUjhSwP/k3yU1gHjvGEXDNN8hsN77J33CNaTjor1nbO+lS95fgG4i3cdG+/OfSAaH5KoRsZ81
	Hv4ExVIYd+wyCCd9iOE53ISm/sqfvX2AiRO0razx3E954H03pE0xIYFxmQQp3XitPYZPrgo+0yMXg
	IBHbzvm2gU7ugyPmYTen0MSc9PpEb+YEq6Rzempa6fegUS+IAMq3msQwUFyO7tBcn8L4KGxevb0Db
	/W0YBcA4dNR6nptZizY3KYTO1F/XtK86VSE8RUkDwBRWspAa4diSSQemdjGsj8ZhzNxPSIv72SYno
	5AMq8JAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EM0-0000000AniJ-1LGY;
	Thu, 19 Mar 2026 14:28:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ELx-0000000AnhR-0i1L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:28:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6652452d94aso2069681a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773930479; cv=none;
        d=google.com; s=arc-20240605;
        b=TG7tUCbdoDQ/zozhUwcg3yFxCrBn6Udh3NGFadwVnp8VsoQACsmTHFRPXEqw3NfeD8
         ZXL9e+o824rruo3pcX5cJzizU5qS5h9Ec+l4oMFdV38/H/l20n3SWWHsTvkWddqjmG1W
         ZO8opCIMXaIj7CDO+y7jw2OAk2jJD3fITU1oXRiDugsohY/6UH2jcdYW9i9GhsWuitwk
         xkuJYvZA1CyeqCGUffJV3aLhPk6YtW/sW5AESSAfnEgD5gEodJnfzmYDwa4WKbcHK3uO
         uq914v/OjWE2dJKofzNhwKSFRJtUOmd10MNhEICzn12y3G3PaZILKnM/fJMwXaBG10yv
         ZfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        fh=G3Q2gtzz7XrvPsnCxx+fZkw5NrVnjp7ib/YGIjcL6AQ=;
        b=HvfzcU5OUMdk7Dt5bWFqv0LG7DvLeKPSq2LHLl5uM7HwN8UYD08hwiL+vgUWV979an
         LjbRlvI9hiV+9htNF+f7sxsfOT1uu844YloyRqfBINQkvHPGM5maHzdRT+XtjpyAXgtM
         9cDj1VRLqYhrYlSD9R82DE1M4+8Hfxl+w+RRt3aWB3MRx6d4uyzYK70ELF6dmYJY46K4
         6lmf8gPipKe6VDqjg9DNnrapbHqtz50L4dkj+Ud/l//2sVCGWP+wDXetSzix2by5mU3h
         5cPGIZJvsuo7tKkhwQmVeV/ktsBTEWEiJifBHcYAe1RYvqyIvKg3JfKAy5gVu3mb/aqR
         jb+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930479; x=1774535279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=TFDjXDupJEBSkW2eDiK9/4IcCmEJ3j1qPAUZv5FhsUa/Ts1zkRVM00UcPje0V8YUYb
         0usQYJMs+kmhbsJGp1Q+Hlx2DrCHhvNyUqMnzFZpELjgMEmlcj/pmVJyi4bavk0BhvjM
         dKLARtxS4vvvWtokKR5X9twLXZOUBCybxQXqcMt+prTyeufY4NWQNU63LPMm4lwiWf/s
         tsWTFMK9d4f2VyDGI2nJVYNHTVKmZG25hnZWHbJXArC9zHZujXig4WKQ62xF9IExO3ag
         MCJJgpNSBwEiJjG1qstKinM1DqqBlQo8S7GcEBoKe3EfNJoeUV+lwb9Zd3NDSH+mITsf
         ZOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930479; x=1774535279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEYdsi/UQnV1ulkUEVFM3uerucLpRLXH0M0xgNStZdI=;
        b=lLWDfIHU7TlsafZa4NTImsBGL+SKzQkVJ8+++VbtVdy7zFUstX0888/Exteo4fZLD6
         xjuAnU9YNrM9AMTM4eFbNyHBxH4lcBkLgTerpvut4tq1FJgZNfrxTE3mSik7A4j5Bnsz
         JCcryzmSPUGDnvOVNXMhuAjbbWnyVKufVokF5P8pUYk4hE+qcqoeXfHoTxpj1DLhE330
         uO3nKcj0C0T+ZuzOMkV/mQOFSRVVU1TyllntFjLKpMBgAq8XjRK132XHxzkBTslRk9nt
         88ENWSUsZU0cAOiVtoU2qzqpCHnpwtdnJw8ysJDlTYDvs2x8QMFTX/m2cc5weyoivGui
         xk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpvukCE29xTht17nN6xIuFuu32alqTUkcwzvvxCbctx9yi58PIdaQ2mYGwb9q6T43wUjAOt/glxyZnIyn1mZJ5@lists.infradead.org
X-Gm-Message-State: AOJu0YyPQFAhTqBgLgWibXheSMtN0yTXqmShPh3CgOn/rFmI4J0zLxjM
	3pNa8lsZr75rUKsK2D2ykF3sWnC8BkHGDPmO7VXT9/8pN0T881dzKHNBxkIthYI8vBJ1JRBkJSa
	L7P38/HPwBZZiC+UynFeZL7cKQgC1t4g=
X-Gm-Gg: ATEYQzwu2oS2wGC6Fd2aYzp3k7eleE1zmGz+VNgkj+xQjUqjTOwVJ5j3QW9/jLZ0vc+
	0GMagzsomL4479kQlbzQqdIg47iouHwhLN3EbqsVS4kw+v7bYVHIIUW1k3ifZMK337NyDmVR8pK
	QORWdLw6YI/G+VzeGORg7O1u/C9JxOEqvH2z1B94BAa7ZNYcZp7sQhSlJLVF4DT3KQc3TezaEop
	VB+UzzgvN6NEgQOhAX/CYgSzEQSibtQv3UgXYw2xgGVd/s+6o84TBc8lfeAQD3i+jsv2hwQhGqf
	AYxf6BZhIQ==
X-Received: by 2002:a17:906:ee83:b0:b96:db93:5d0e with SMTP id
 a640c23a62f3a-b97f4ab7799mr545864466b.41.1773930478856; Thu, 19 Mar 2026
 07:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 19 Mar 2026 09:27:47 -0500
X-Gm-Features: AaiRm52wQD6uRKulnt1Y_ioaRFL-b1bqEKDLHZMA0LYwV13CAWHAV79Bf5laR-o
Message-ID: <CAFTtA3O74BTJz8d87CJFQpa8Sub_ouKyyAB8cTXUxd=BnUzS7Q@mail.gmail.com>
Subject: Re: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072801_221847_F5D5C3A0 
X-CRM114-Status: GOOD (  21.92  )
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

On Mon, Mar 2, 2026 at 6:27=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to a kernel-internal header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>  arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h |  2 --
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/aux=
vec.h
> new file mode 100644
> index 000000000000..fb4233445276
> --- /dev/null
> +++ b/arch/riscv/include/asm/auxvec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_AUXVEC_H
> +#define _ASM_RISCV_AUXVEC_H
> +
> +/* entries in ARCH_DLINFO */
> +#define AT_VECTOR_SIZE_ARCH    10
> +
> +#endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/ua=
pi/asm/auxvec.h
> index 95050ebe9ad0..0a725f2aa2e7 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -33,8 +33,6 @@
>  #define AT_L3_CACHESIZE                46
>  #define AT_L3_CACHEGEOMETRY    47
>
> -/* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH    10
>  #define AT_MINSIGSTKSZ         51
>
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

