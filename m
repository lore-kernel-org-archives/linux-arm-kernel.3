Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8394FEEF56
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IonLYcja0I5exy5BxsdqIigBkSbpN4xU4h1v8o9suB0=; b=EWCrva+1aiKAH6gUZW4TTcfr5W
	3bGuii462hHMsuwZjZsLJmbGW4i7PBNCOG78hcnjRhscfthBuE/NrV7rco9dLQkzJet54DNFl7joo
	dIi6tIhgzsS5j3kfBqzaXpohi/IsTaEXi4yCekSGqv3Ufcru6myEH2SNUjkDqmVh11VfJWTuGpfv/
	BdEdjDva98CibyWLXSyidO3vwoqV1CoBVZWFQLSvqY84G+9zRUIKB6IHETOCmjSxm8oyo7fmufSpa
	2H3ov/0KLPoxXbNh+xwnEUSERiRk0I38oYi0q6h6GEFqXH+5KrQZoWdhc0L3KHX6VXHiNnfonRtaV
	rkEbXdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7x1-00000006fYE-2MD1;
	Tue, 07 Apr 2026 15:02:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7wz-00000006fXX-1gRT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:02:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so8650938a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 08:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775574163; cv=none;
        d=google.com; s=arc-20240605;
        b=CKJZ7SR+ILRglzoq98GOOoC5GEeE3xjIWHyLQpduPiSAYpkNmTgp0auLdKC43n/T/t
         vVkNQ6cbfLPEJbNiOfRD5jDzxCA9ykgCM//mT6rZNz4GOM9P/yFx8G5y6fcApj698X3/
         0o8wZ2COj1Xs4AEvsLNHFtT9gB4qegebJ8phetgZoSzpo117w5z7obgLmAMMgSod001v
         xWrT4wwvbfzWT8ZEQG0W87v8UG6Aca30JMQh81JeOCMDXAYSkz50lK/vCa027BBbYMcw
         5hVtjyDlPEitIM3cmt0aLGAL/RgJPZjPCAubP/yJRP3bCeaLSuI2QOZP/9x1oYwjkj8T
         sQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IonLYcja0I5exy5BxsdqIigBkSbpN4xU4h1v8o9suB0=;
        fh=PfqdgDD4l3m9yYRvVTP7fLBQqW9sY8V9cLKo3nWWjEw=;
        b=KJgUzET2yA6DqOzMdls2E6eMQuScSFQUoYa6xkv+a+XDA1OqxgW7xz30lUL0QZ69qu
         BzJfu3rYenPQ0RfqYiFEbOsN96PtIGlzEk2LdFU1aiq6KoAljlJOvqbsLmJ2l+B3p7fv
         Ox2a6QkmdwXhvgWIb3B25zTUe03NISD0Bzl5/fBmHHFzM6Bn6JHkBKjIDOcz7QJFyE89
         Lpn7QHvYTpZnbM23RCw1W32zWuT9efPPe4WRugL/b7gBhfREixkqUgZs/lrcMEDXG1FC
         jshZoXt2U1k76RbBOLizAH7OM94F2g91srylAqunhOPADEG0a1L+iTVYA7qKUpXbaEC4
         4Cng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1775574163; x=1776178963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IonLYcja0I5exy5BxsdqIigBkSbpN4xU4h1v8o9suB0=;
        b=ZO6oeqACmU0Oy6/MRpdEcj8WxDnhEo3G7CwG495kU6kJJmdtYC4YgxCGRn5pIZq52G
         xXy8ZSSGDS3Nx3kP9EQ8Ly3uT/5zpRdKeLZQ1oWT2wahf0AWfg4hsRUmMt2UcUOYMoQN
         InkNNrjnHniZ9KloP9iT1c5Vt3Atnvjd7B8brqy0INzISryZqIhVdNyf2WVBBtp3n6lT
         E+8JB5b0ZnVnrMW1wfU9CodCfgZpcCuv7I8eQLxK8L/vMy50xrjCHV76T0Kf2wvkJyCt
         AQghdu2sbhhl5sBlO4E7jA96CANVuyv/Jpciu61TCUKTfn+sgj/v5DKRnGfXe5qqH8e6
         F3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574163; x=1776178963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IonLYcja0I5exy5BxsdqIigBkSbpN4xU4h1v8o9suB0=;
        b=nxbABqXvDfkPpV0xszSSmwrhGY9TRVgcEVHFOBfO4S6wMCNYDEhIJZR4iKj68bk6NI
         goafTQfDx8YO/HXkuyfmpPhYZRtIFMIKjyu7CGoGI1r/4RlT7f54Rs3Vy6pUw+HsOArC
         ZqxS6o7bDPMbTNz8DucTiTOkq31HLIW7XGZyNi7iRTo2bDwmpbaC5XAeCjSSXInazmVL
         QMqmft3EnfLjfGrLLLc78dogbaCpEhiyFthesB6Q+Leys2hBEW2RL5buJ6HhuvN0gJFc
         4z079r5m+nbzIMRJgII/H/2DXb7ualcnUsE7IWYItV4EDzsj7XiHIsD/tV0kw5ppqv/N
         2YTg==
X-Forwarded-Encrypted: i=1; AJvYcCVGErfOTymq4sRDcbI76qmpAD3hkzCMl9tg+CSZu5cXwiWxmZqtHAx4AdcivtckLfG/Xb7WLdaNsQA6EW7S54Ms@lists.infradead.org
X-Gm-Message-State: AOJu0YwPO+zI1zl4sFMz/spUxLsz2b1kklUCeyaNBUEyH7WTd1D00uh0
	Bppop7kPNvIxlDpSf6WsySw+Dh9a3fpJ4Vcjl5lDqTUXgxArIWy3fq9r2dNnOFYqRJ7kYy3fF7P
	cwptL26Tj5O6Y7eoQvYCGMbnrajSq7Xw9dwtDgb4pFg==
X-Gm-Gg: AeBDieup77UfgofsBJRg/QSkpBuntemqgyS4slmfsankefq86M2IbV0L9RRQvOSMMwg
	AUY1cAH0xUMAQ9yzVA9I2p89WW6YGJXG2E9xo02tLZRYf9YSiaIfyYYTYUw5CZ9QNmRPZsUzmWg
	QuChy9/FfDN7X9SMcFblGKKIfh7eK2ER8Ph3tCVJyXoL2BZZ6oey3lcwgbXK1r1fbKiHNjpBrNg
	rr+ETuPwfi/dcQLlQQeIn4jA1VjdRTKpC4v9lbiVNp0hZeRTUiaZ+WsbLLDd8tMRttum87fSP8+
	cHruvi8Ivc3IsSZ32eYr8dyKCZ6lK4OAmleTZw==
X-Received: by 2002:a05:6402:430f:b0:66e:c7e3:55bc with SMTP id
 4fb4d7f45d1cf-66ec7e357d9mr4752610a12.23.1775574162894; Tue, 07 Apr 2026
 08:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260405114231.264761-1-wsw9603@163.com>
In-Reply-To: <20260405114231.264761-1-wsw9603@163.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 7 Apr 2026 11:02:06 -0400
X-Gm-Features: AQROBzCcGPf1ySVvrW87TazNskfJ2TiM9vxgw4woHsEvXNkApHwiXxb5fPxMhzM
Message-ID: <CA+CK2bA4wr-DtkCrx2A2TjsPr7WR_GH2D1FVNAk-Qyu9Jnv9zw@mail.gmail.com>
Subject: Re: [PATCH] arm64: kexec: Remove duplicate allocation for trans_pgd
To: Wang Wensheng <wsw9603@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mrigendra.chaubey@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_080245_456654_C31BCD41 
X-CRM114-Status: GOOD (  15.65  )
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

On Sun, Apr 5, 2026 at 7:44=E2=80=AFAM Wang Wensheng <wsw9603@163.com> wrot=
e:
>
> trans_pgd would be allocated in trans_pgd_create_copy(), so remove the
> duplicate allocation before calling trans_pgd_create_copy().
>
> Fixes: 3744b5280e67 ("arm64: kexec: install a copy of the linear-map")
> Signed-off-by: Wang Wensheng <wsw9603@163.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thanks,
Pasha

> ---
>  arch/arm64/kernel/machine_kexec.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machin=
e_kexec.c
> index 239c16e3d02f..c5693a32e49b 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -129,9 +129,6 @@ int machine_kexec_post_load(struct kimage *kimage)
>         }
>
>         /* Create a copy of the linear map */
> -       trans_pgd =3D kexec_page_alloc(kimage);
> -       if (!trans_pgd)
> -               return -ENOMEM;
>         rc =3D trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE=
_END);
>         if (rc)
>                 return rc;
> --
> 2.43.0
>

