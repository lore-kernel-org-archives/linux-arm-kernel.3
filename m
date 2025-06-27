Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13B6C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=; b=ESPZrUbmYTmPoHkjhc0ib5XyLy
	WSce0dqRKpeTZhpghgSdzbTfh6zoyrfeMSYeA8cXBhxGahPaognOnogwwj0z3/WL57HvgKyyyquMt
	lImG7FS/QK0kOXYHGGvwYy43VReFmshB1gnWCYNIiJiI+7LuWm0rxNYVxsNxo0hbWXkT5mKq5q1jg
	XfJ5RIYWW4ieoxf3lJ9LQJR3hPejzMterjBUhDxKAB18TrdbbQtX1ky3XV2y0sOx98KFeJ0MaXk3d
	1nry/ZxKWb/RErH6EYoCmPfUcYXHP/r/AokQ5iuybnqir8Ktf+MEdTcjn5D3YJCLpMBP2irF8VP1i
	MmGTqO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Qq-0000000EWGr-2FSV;
	Fri, 27 Jun 2025 11:39:48 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7OH-0000000EVol-3MOp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:37:11 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a463so1318802f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751024227; x=1751629027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
        b=YhAgFBRlLNHuDvU9qWgaFZKGmBUrZWXDkC1BAaQUh+uynDeaLmP5xdWQvr2t5sLcGw
         kndp/cXwYIu3RtGusFP5DIYsoEOIE99RBnRFbXWLV+YTFEJ9HOBYxsvNlbXIy8YRtPq7
         tjafcENKUjcUh7tbQcMYWpIOP06/2hbfPlygAy3rwhTNpYHcbhHsE6pLGBxvxRrEEDDP
         CarpIF2z+NCQRXSIDkBVTz55SRQcVaJYrSqSTVlO6xqrzbkT76c9JGRhdJSmGFOjQuzj
         Xh/4+Zj3sTfKp225tFfMdZp99HUkNTCidhuSDVyPQRX7BPLwnefnRxRTDVaPy3fDCXKs
         GO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024227; x=1751629027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
        b=fXIW+w1xfDbv+W/f4HylDLiS6n7QySdHI4mM8P4jRfCL+RnG1MB9H1+48vohWrDs4f
         L7ylPeYLwYk5ZcrZ4Srz12XH7xKzQ7jVAsUw2jUj7gpd38oDxJWuNhH6txbnseZBQeH4
         IzFu0Km7VhHfULI5mBr0Q1C6/JZg2Y7PNlw4SpbuR2D5InTORTLrow1bGu+YvBJRV54r
         oyNhq9STl//KYitJ8qIndNZR0R7ympNWycYfT7713NjTRWqp2G6jHiZYmSwTk2yD4hmy
         USsudSo5L2TJRI5u4fffuRkSalaJ6Qq/88HAJ+dj/bjquBhmxnpr4e5E7CtISHVlNKrr
         mdqg==
X-Forwarded-Encrypted: i=1; AJvYcCWEccWsKR6v/m0xzoCznXCRE6QkLmYqU9q1O3G8fr3tbdErCD4dDZOpbaCfMWzaO9bgglu22DUMXfGDVO+btOp2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9PPhnvSrkVPg+RtTd4o07/NP7KZ3vz1aUgTC3195nfX1gUGYD
	iL55Q1CpQYuSxs0Cn5B9I1x7HLf7m5g7k6O/nYC6B0ixp203YItnEfNg0+dCnDNFtvihUrbG6R3
	ZfX1ccR1tmyZLihtD6pzq42Zc4iCMh7adfZrsmggn
X-Gm-Gg: ASbGncuqecTC4TLtKOsxbHIGncGZHEXlrwnfGoEWFYOKozvRYauIeGY7KdyzUXmVbSG
	7y753fvD0YCkADQcZzZKmNNrfzdNgOOftRJAq0xQtWdMK6fXY6rIN32ll4KfpUvzqQTM2ziYwDH
	m/W05hvoYJzNjWD7JV+RTCX1R2H0GojpFymEmQg8orct9Q
X-Google-Smtp-Source: AGHT+IHhQwveHXquBiq2OL5jFul3X4Iqrm3gaTcQksYUbptvQShoEH4ZnoLoGPXB5w2cgF2SU8OAzk3Y3AeFtNlDlKs=
X-Received: by 2002:adf:e18c:0:b0:3a6:d95e:f39d with SMTP id
 ffacd0b85a97d-3a97fcd2910mr2337836f8f.4.1751024226841; Fri, 27 Jun 2025
 04:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Jun 2025 13:36:40 +0200
X-Gm-Features: Ac12FXzCmQBarxz6DrTB7aiRsIFjDy1zyR5MJjJQhJ3mD38Fryft7yJAf_t0jpw
Message-ID: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_043709_840909_F75DE8AA 
X-CRM114-Status: GOOD (  24.53  )
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

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
>
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c=
5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 d=
ivide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Not to block this change, but I think this really ought to be fixed in
the compiler. We should not have to do this kind of thing to divide by
10.

>  drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index dd55b1cb764d..82acecd505d3 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,24 @@ struct DecFifo {
>      len: usize,
>  }
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.
> +#[cfg(target_arch =3D "arm")]
> +fn div10(val: u64) -> u64
> +{

Please run rustfmt on your patch.

> +    let val_h =3D val >> 32;
> +    let val_l =3D val & 0xFFFFFFFF;
> +    let b_h: u64 =3D 0x66666666;
> +    let b_l: u64 =3D 0x66666667;
> +
> +    let tmp1 =3D val_h * b_l + ((val_l * b_l) >> 32);
> +    let tmp2 =3D val_l * b_h + (tmp1 & 0xffffffff);
> +    let tmp3 =3D val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +    tmp3 >> 2
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk =3D data;
> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] =3D (chunk % 10) as u8;
> -            chunk /=3D 10;
> +            if cfg!(target_arch =3D "arm") {
> +                chunk =3D div10(chunk);
> +            } else {
> +                chunk /=3D 10;
> +            }

I would get rid of this conditional and declare another div10 function
that just does input/10 on other arches.

Alice

