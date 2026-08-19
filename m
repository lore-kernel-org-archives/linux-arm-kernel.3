Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1546C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=; b=xH1bPmajUrjR0Z9IzTyLtJKNEj
	TWTmqbc0spZpHbXS73FQQSpjbC6xL01YLDBAPzKAUuShXLwbV5YIpXUFBI8M0e+/qV6woZmrv+SMC
	mNjTF9G/ba+kw2bCSTvUQUjBQSOA4xXc/+FleGKhFFdrElPmYK3IrzKl865gc9A1xQuwZIDwDNl+8
	wMRFl5YEHGSYqRhxNr46UrvsFtvmoArgY6xec7bUkBGLQcjv+Q+eu6hMAvTc2a4DuFxzp8kS8x8AI
	JNniPfcuFnsmUyahjSUX0/mJKcqL9HWLYXNPXDWVBmcD38McI0HQ5263L9LouIzhcqLg51Ufz3afT
	vuAG6b3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfld-00000009nUf-0OWG;
	Wed, 19 Aug 2026 12:51:41 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfla-00000009nUL-1vBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 12:51:39 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso225378241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 05:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787143896; cv=none;
        d=google.com; s=arc-20260327;
        b=BYjdA9bFrGiCcGgRoAGpeaTICeAcVLF5tvUAN3hbkDl6WiRPCdtOUtZDiWS+LaDsk9
         +PClEAUzKQm6m5n//Z5nQiDj598c0eKoYmK/6yZdGOCt20zaPn1seBB4aVOinATnPa+S
         7BJuWal47CRfvIJF4D7VDVfPNLufu5V2XA+6H9WoHior1ikW9fLoU+eu+5fsXixAn5z/
         HQ9YPRqw9XZHi7NCCkz2aHhZHRnYuLEuSpZ2nrZQOWm/tnHWgbCc3wjD6zhL6KVAawmo
         wzKqWMULiDP86sZO+62XJjCE8zsI14j6QH2gI4F4tjkarMbsFae326lyHdejMfeWPkLy
         E/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        fh=feSqjtMDylFUWHZNOJeHr8GYxhwHvQnYB8bYksAhFRw=;
        b=RsOSTOaUYjiFrtBzK9ETEZ3yuwfxxuPDSP+9Z3ytNUxQiH8WuiOtKVckH9IFxsR3Cy
         L0DnIHFjCmTqthRKIFPSaqFqo6yBSFixXaKfMe8TWWFBGFsk6yJTDr587vm3E5a1sqfQ
         juwHvEm9DMH1PFNXpaoOwqA21vqX7PgLxq5qjcxs/6zFXY5L9NGZJzkXn92N5yksUsyQ
         YtuocQkMZujo1stiIbENlTHm3yus1X9kOxtFf2yELwPCEHc5CbbVcLXczOKn4OyHbHkd
         fdHjz7+UFEFPV2jcN/pyQWUi7e8Nl4rCTzrA5VDHjnrUde4z1uOQFeXk7g9JWqaF4EKu
         KROw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787143896; x=1787748696; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        b=CZL4UUZ65pbfe6XX+cHU69uzNIPqPL6XBzdj8yJVLWJHFZ8c8S+oAZPz8EO/imPCGB
         HRj9rbo2IZ1FND5hr+VCtFJnEHKn2J9Er1DwZMl0YxGHXIQyTcRfRq9S9/ctspJmRVR7
         qX1cQWjmUe0nwLB6aLDgpAE7c8cFEWWnW5b/hTK9RM+aTMDAcoWYRn+3deI46QXrNC0N
         xWXqu+Mjx/sH7bYVGyk4Mbex3GrDeBD3u0c/yt/0LvMTAeF6H4jo/sIOHKP2qfzO7Yu7
         jPDaxxmqE6tNqfCEBdPODICHx4C8lQww7wvtkV94k/fwgXPwp/c90TmT/EET4AMvzTLX
         /OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143896; x=1787748696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b89xWKguxhb5kJiAHzj3EgRzZ5QR0sQtBsj6gohCrzw=;
        b=OtvnG5vmtQIV3lA9V0gQYU8O8Uqf5ckJP6fJZAbsnHI+nSoZy9eprdwGsbVUlpYDGf
         0w+0mwXbH4pTXb937n1xnLX4WXLstlKHJ/ktjFrPvrLW1e9ONttWImXjHEQ54hwUGTP/
         a5q2C0D2qqx23VG22tg6D2QqfeEbojwd/qyqUgYMl1QJio9eL71gLXzTb8kQJ3VMy82Z
         NGXyOqiGmFyqlOL5DWvUGOsDqo6kSKCaKMLH+BpuXuxEiH1xM1kPHjA2jRQp7tfT9+0k
         EL7BuFTmeDJw/uxu9waT71mn/duT9pzd3J6ZgGOcyfrTIE98/JoOyRpGvf9Avy4/Z1oh
         53vA==
X-Forwarded-Encrypted: i=1; AHgh+RpfobanOSzg+Mef6wqGdDFuOIFsM9kCCshzabijEdLoZTdrIcGvbr02SU/y+GAex9oBvzeus01OBUiakD8ds7QN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy85fyJdKhDy8T9CDmDjuft9S7j90AJ6FoXs2jn/Q7rKZEHnzva
	+tNkxYUrg3F4N78gyu3dLdjydyJ7a0D6jJfa12XfSCEgTXTL7Uu4Ea113ag//gtx8VB1VVnNFt4
	0NgBa3DL+xMVaNOS64r66TIpj5fZ1Xpg=
X-Gm-Gg: AR+sD13kwI5izJemT07DnATP49zWIZW67nUfNlzVS/CLim/kq5oKuLksYd0kkJjqNnd
	SzRaM8PWVgN4e0zMH3YMZUOaooPuaQH3IYZKxTuXJs3SHFrP8eL/j0KNgIbn1511eC61QbTAqHO
	OfD4bcqLQqsUuJBBvsMCh2pkzYUkFQTaIz8fLXOzkxgKpChjmrb/KZ9AODUw2jfycOtRVgPhftM
	Icd4pnOKt2l+TEiJ+eCA3kKMIWZ5xi3SPeJElpQpyf1E+efjZyipmTSxf8G+zpL8E3AVMc9itBW
	VcKaH+buCCHrfrFI1A548SPuO7NeF1R3avxZRhp86JVu1uoILLOiL5HXhc+TacDeW/cMJTSnsBE
	=
X-Received: by 2002:a05:6102:e0c:b0:778:5369:763d with SMTP id
 ada2fe7eead31-778536977cfmr777017137.1.1787143896490; Wed, 19 Aug 2026
 05:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260705110221.153481-1-mdshahid03@gmail.com>
In-Reply-To: <20260705110221.153481-1-mdshahid03@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 21:50:57 +0900
X-Gm-Features: AcwNN1WZpgbj7Xmht22CXRTxKba8QfE40w5PRb6wQWHMVVHwKvxFfX4oKRnrA9U
Message-ID: <CAAQKjZMKWDqbq+onK9JHejecie0Nh33WQ+rUBa=_0pc50FZU1w@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc()
 and copy_from_user()
To: mdshahid03@gmail.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_055138_531740_DF290068 
X-CRM114-Status: GOOD (  18.59  )
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

Sorry for being late.

2026=EB=85=84 7=EC=9B=94 5=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 8:02, <m=
dshahid03@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> Use memdup_user() to replace the open-coded kmalloc() and
> copy_from_user() sequence.
>
> This simplifies the code while preserving the existing behavior.
>
> This issue was reported by memdup_user.cocci.
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/e=
xynos/exynos_drm_vidi.c
> index 67bbf9b8bc0e..183671de711e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -273,14 +273,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev=
, void *data,
>
>                 size =3D (hdr.extensions + 1) * EDID_LENGTH;
>
> -               edid_buf =3D kmalloc(size, GFP_KERNEL);
> -               if (!edid_buf)
> -                       return -ENOMEM;
> -
> -               if (copy_from_user(edid_buf, edid_userptr, size)) {
> -                       kfree(edid_buf);
> -                       return -EFAULT;
> -               }
> +               edid_buf =3D memdup_user(edid_userptr, size);
> +               if (IS_ERR(edid_buf))
> +                       return PTR_ERR(edid_buf);

exynos_drm_vidi.c does not include <linux/string.h>, where
memdup_user() is declared. It only builds today because the header is
pulled in transitively. You would add the include explicitly.

This is a trivial thing so I can handle it.

 Merged. Thanks,
Inki Dae

>
>                 drm_edid =3D drm_edid_alloc(edid_buf, size);
>                 kfree(edid_buf);
> --
> 2.43.0
>
>

