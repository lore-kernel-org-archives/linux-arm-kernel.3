Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 04:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=; b=SSFFQuQY33kMISMeoXbKM3cs+X
	IrbBRJAJAwlD2zGIhFjLA3bNdi2sI4b2ZGp6GssZzL5bvmgZvJdUNXuREySPyY6NkLwFb51+GO1pB
	p2H8cCXunJp5HhPWH8kV1Nip2tWkeLVN9FfRWSoIEosF10lfBD5ooiNVJlnKWmTPqcfe5Yv082k0E
	3V40uE+ZyoPJwZOWjfFYWxQ18KNwBQQr77JTisOTNJLLz9SFzVWdte/I3oQiM85RwGcsWc7GxDgYI
	l/8ECgMtH6TRljuIWc9bhl5GbBHo6iwDB1ll+D2k9fnPKXBUsHwFb4vUN22AUvkguTjpnJZFRo4/7
	1+Sb60Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQe4n-0000000Cgr6-0Frw;
	Sat, 23 May 2026 04:35:05 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQe4k-0000000CgqU-1TF5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 04:35:03 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-69d69fcdb44so1842255eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 21:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779510901; cv=none;
        d=google.com; s=arc-20240605;
        b=BtdpaQyfsLjs5e/hIdWDUaC4TnzQc+TQNbypMioA/66Mgh/YOZKd6WqAM4/zfN8Dvf
         VuIok9aLTiANCdKLwFN1gwZXuKtiK/EFN28lfAEfj+qLm+y/L6Tg6Y/G47Fp/sOxec4i
         OGO8iiiqbY6zvGpjyCl6n0uND4LBjBBmVM0yVGk+wzEG5VzPXj4Ds6CwyFhNtu6XFqaS
         yAVs9u/taKc3O2LwXWbopZMY3ki6v7YuOpr3QnDFn9TfYmGZW9plFd1zavis13eQooOH
         0iOWBkdG+X+2yat/RhXYQJFotxwKTjibQMsK/vgZEhGbJ0cdvdmOT+6EQrvXjVYGnCoM
         gFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        fh=nNg4k+VDRCmQSSGz26dODjMeoPvF3E4u++CUBpn+bBo=;
        b=S4STPZYktoFuL+5CJvdyCDnvovbKubtM8A3XQ8A1j0Z7NuskhtAndzwIAMNnt8cprT
         zfc8S/Kh3LtuVlJbqH6SK651HEFYblz5bYgYFgTy+l4W4YJF53DY7ha6BgkO60DTtU+X
         6enyr6RilzuPQ+xuhYGL5KmFq9R2IeTJYQcj4brWzu6R+9yBzUjuQtFCX/TrR1NuQ8Qp
         sNB4i4PK5pkieug7GLhEaOCVUUKlOMDnrs3bV0fjpSc7ptRcOTaPZHsqNZ/Dp9cvKHch
         30y/pUgUnwQ9PlB4lPYMG+U5XF7T43eKlydiPo3e+KUkGrUM3V/0dkm7f5Byebh1aAZI
         Gexg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779510901; x=1780115701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=YfG5j9Lh+0hWkO+spv51wN4ObJ8HkbloKZffMbnEgOC/nYRJJFbYxhoV3aFXuYX08c
         5uS6xXyX6N4hK01J2fZm81sI0cGrCR8gUO6oKjD+HMnusx9nfuNkiECSZEwel2M7cX11
         HR0pcg4qlosOCfjCyDzFueBa+QB0M0C3L1qGwqmH8pY8rhSEz/HUF1rpOHxhoaYqcVNU
         NeosDWodKfzLAP0MIEfCFJ0eMOCbgpeJU0P0IoU+C+FvokI+UuI57CMsKxHE6vrZEwdV
         DaAPqpoUI0FzFvN8cOaaEgx0utYGQ3Z6sxelOUFwiTo8NLNXK3VPyKq+52jIQ8Frc5nu
         4iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779510901; x=1780115701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=G7ysc+j4hPCV1YR1tPzfrbF982tpFpjWD2nQ+8nd3AfbiGR2yAyZI39pFHQJBRUsRC
         zdS47YJc2BLgokt+glxZ0olAdmTQWJAVpkkFLnxgFhJZZD/qRQDXvqrb0IZOr+JU54d/
         z7pfsOHLmQ1GrWE3jZ3UEYRqm2OC2bQaGyWBO6rJfuvpEgsGyPeEl+LVe4rGFo4GqDdm
         b21C6IPm++GYiPF6kD1oq1tzI3PYmS0wCDSGRt9dfYrRM4key8QL+OA2bYu7an/CW/zR
         zLquIdAsGJCQmwqCRyEt/RB8QBRpJAIYNy6ZcEd9fPdZ4tMzeKyGTE5a+RDlHtLSWjtf
         isrw==
X-Forwarded-Encrypted: i=1; AFNElJ+c6tddBYSFswxe2bb8WsNefFRZiJI6+T/kJ3tFkU0y/stPP9oiMdolgtjxfclhEwYAXLEQkcS0dtb3qqXGXtLQ@lists.infradead.org
X-Gm-Message-State: AOJu0YylSCFkfe+p8Nosxsqxqs1JFCxbr7Mae7bsAnnRrkwbMuMLPem+
	y4sCPWET/CCSJ7fZjxd5RprP7MEQDlYd8ShH3LumZRhpjaHYq8VfWQzaCvkGCt5jeyA4jrYUIig
	LH8618i+/W0w2zWdsqG3XM/N1+2on2D0=
X-Gm-Gg: Acq92OHEgbBvuvi4OccCQ9Qw0li5mQV/Wbbg9hcNwK7iSEA37Wqm977lIveL/d+ZywJ
	c0z8o8OjzzlZ08Dxcnk44OkQF6/AnmwHUV6jq+vShxhmIAbc7r2C5NslCw7e/lYvaDxiPXbE6gV
	FUFrniLUlzUw6htiKaPtNp93fPx+h4Hkj/PLOhiiVJ06g8Jd0xVxtgEubZNj6g4Dx5jb0aTqN05
	lIXKx7heMvu/8TAetqe/65Z9UiG+LGgt3HExReeWbIZOadJ6XbqyVDuqzqJ3rsrOQJxZ2kMvU2K
	Y+HwG2J6BjsaYkGlGCjnB//eyR1YaMlQKZvLo2g7aM6Qhvky6b2x1Vbc2PhHV1E1dw==
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id
 006d021491bc7-69d7ed3ddb2mr3655129eaf.58.1779510900956; Fri, 22 May 2026
 21:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-17-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-17-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 08:04:50 +0330
X-Gm-Features: AVHnY4JvnA7ojDWW97GlknLev-z2MRzqG6cGTuP_DqdsaaWX-ot3wdOD3pLiTkg
Message-ID: <CAMxPZkgODpNgaFAnaQQNum79VQyt9nV7LpEk6WZqpcqnKgUiGw@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_213502_405008_A3F8B5B6 
X-CRM114-Status: GOOD (  19.71  )
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

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> This implements the enum_framesizes operation, which reports support for
> even sizes.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 372b9331bd6d..e638ec32c7cd 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *f=
ile, void *priv,
>         return 0;
>  }
>
> +static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh=
,
> +                                            struct v4l2_frmsizeenum *frm=
size)
> +{
> +       if (frmsize->index)
> +               return -EINVAL;
> +
> +       if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
> +               return -EINVAL;
> +
> +       frmsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +       frmsize->stepwise.min_width =3D SUN6I_ISP_CAPTURE_WIDTH_MIN;
> +       frmsize->stepwise.max_width =3D SUN6I_ISP_CAPTURE_WIDTH_MAX;
> +       frmsize->stepwise.min_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MIN;
> +       frmsize->stepwise.max_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MAX;
> +       frmsize->stepwise.step_width =3D 2;
> +       frmsize->stepwise.step_height =3D 2;
> +
> +       return 0;
> +}
> +
>  static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
>                                    struct v4l2_format *format)
>  {
> @@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_=
ioctl_ops =3D {
>         .vidioc_s_fmt_vid_cap           =3D sun6i_isp_capture_s_fmt,
>         .vidioc_try_fmt_vid_cap         =3D sun6i_isp_capture_try_fmt,
>
> +       .vidioc_enum_framesizes         =3D sun6i_isp_capture_enum_frames=
izes,
> +
>         .vidioc_enum_input              =3D sun6i_isp_capture_enum_input,
>         .vidioc_g_input                 =3D sun6i_isp_capture_g_input,
>         .vidioc_s_input                 =3D sun6i_isp_capture_s_input,
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the ov5647 camera setup.

The enum_framesizes implementation behaves as expected and reports the
supported even frame sizes correctly.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

