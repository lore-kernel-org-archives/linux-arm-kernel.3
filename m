Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85727C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=; b=xPHoXVW3YMvGD7r9EP7aLmq5fj
	4GlaaRRuBhIBvdnbJKRkBGO7j5l7TpoMTaDqy6mQ6LvsU4O2AF40pGej/C3goCXmsIehBYKtHUmz0
	XO+XXIHO8aBCCt1uOwR9sF/sf3bU2ZeMscgRxG09NJKT4yAC53UO/a8JD8mWm1AmSuqeljsTj2BF2
	o37YaJ3nsH9WJ0Rsjaq9bJ3J3DmfR601Gy03eb3nqBc2+iJh5+iW4IPGfuysE/OXIlC5dHggiRnUL
	AluaYZlygiuNXEqKS2XucZRgvR+jZiIm4Wf3UFdlpoGfEgcVYRphxklJRsy6CUxZKrh+dsRLAGcKL
	7BOSL81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujy01-00000000FsB-3aIw;
	Thu, 07 Aug 2025 10:37:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxxX-00000000FX6-0Ufy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:34:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so431470f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754562893; x=1755167693; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
        b=zPcoD4jV7kAnKCCawXY9bskLt+7d+MA1/l5Fzcn8MjV9IprfMVbfPTe7YYdC154wEm
         TkZwsWDD8wVr3csADKsBtx+xt7kwrvnCl8vHqOUH39G6OdBFR57QMZSxo77tLxtjxrK2
         DrGo97DWExCrgAWP6Dr03j99oCg66mJ33sIKPs9BdvNlUNFAmYFzud1KLRv7xo6L4QjD
         dx+NiNQevZp5bli47SHIC/bbsF+qu1U860E5hFPVCWn+HqP4S7+9x3Y1bIG9J0IcmU0B
         b8JS6MaTjk89ttCk1PEMW9td73F9U+bPYKERcfsIpfz8S1KC/OoICQtccAn3XQquSFfM
         crkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754562893; x=1755167693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
        b=uatVJX9S+sLg0HyNZoki1Sij5OdEnsqhUzGs+ZfGQ+P81ytbIAy/fHPEcunUvtApKC
         nWsERwn3sJDhtT41PQWWubu7OD6Yw9uL5MNmMT9mlAJh3DHIqJUbPvJ9O3B7RoBviI3+
         sXSQr3IM8YeDgw7nVq3wIsXrgKB1vsnW8mdYhyZ7GGmpSQmJ44MCSgjkuDUlvxJKE82z
         /Crxwcbd3kPIr+nvTfRAt922jTKjb6mY4uZOsQaGFPbHXl+gfPxx2pmhoa/zxc4OW35/
         E3FZYWTG9b1aHqItaswmFZ3Niyyap5yMPTxUnRAPj1aINSaCH7rrdkuB1u9fqdxnPAnv
         iFKg==
X-Forwarded-Encrypted: i=1; AJvYcCV7E9ZRxw/0ozBYcYeF4y8cS9AkdGfPsdWZtVzLeMqgLnSJew3ULpR8HpKsrG80REUQBIMiIX0MCE1VxwfDekpI@lists.infradead.org
X-Gm-Message-State: AOJu0YxssjAukVFaOlAWXSVBO66hmrqeNnymfRVBkhFVgCSxfe3auwPF
	YTz+5cutYgyy3EMcCLTygtUYgpD8cMBJrGj/LPH+NGN/t42t1HtH5qILD3xmNxJgbuI=
X-Gm-Gg: ASbGncvUSMTro0o+3lUGX1fIFxg7Gt8cNHZLaU/iQwSn/QbHWYNq6tdv7DuRnV9nrM6
	vaEGSp/BllMSZm9ze/zXGA8HIj61rquLxd3K1WAbZVctORPwfBMKVxgZ0zCMxsjSPBL7L/3GuJ/
	h89d6BE8JXZCM6RWSaqBt0gwJ08RhCjBuCmKRzqfxt+mg6+LhjZIoqrq1x5SC/H3TrTlaZ0GrDr
	R1rAsU4To35Oua8VHGf7vf/GjFqNWf8RX2ecU9Ud7le44KhBLZ+dzoppSebu+tqzd3J2rMxfTMs
	u3Umx9DjdjqG9EO9kazqesHFgrnqXF4DpeO0Rj/3R5QnJMJnfh4cRlU0++yRKZa2vAM40JGx9PZ
	AB/fggR/1xhWil6FGbZTP99r/JJw=
X-Google-Smtp-Source: AGHT+IEJZFFSnC6OyV3Ckz3ldGk5h0RG3Okc+NeFrocarUAZUjxcjd1haqhnntbT67+wRuAV6TUqug==
X-Received: by 2002:a05:6000:2f86:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3b8f41a837fmr5055520f8f.2.1754562892893;
        Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8ff860acbsm70000f8f.51.2025.08.07.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Date: Thu, 7 Aug 2025 13:34:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, wens@csie.org,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com,
	samuel@sholland.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Message-ID: <aJSBSLvIeSpvaYpK@stanley.mountain>
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
 <20250314-prophetic-attentive-platypus-3ab214@houat>
 <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_033455_189542_A027FD38 
X-CRM114-Status: GOOD (  29.92  )
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

On Fri, Mar 14, 2025 at 11:00:26AM -0500, Chenyuan Yang wrote:
> HI Maxime.
> 
> Thanks so much for pointing that out!
> 
> How about such a patch?
> 

This patch is corrupted so we can't review it.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index 2dded3b828df..5ad0e90d3e6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
> sunxi_engine *engine,
>   drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>   struct drm_plane_state *plane_state =
>   drm_atomic_get_plane_state(state, plane);
> - struct sun4i_layer_state *layer_state =
> - state_to_sun4i_layer_state(plane_state);
> - struct drm_framebuffer *fb = plane_state->fb;
> + struct sun4i_layer_state *layer_state = NULL;
> + struct drm_framebuffer *fb = NULL;

No need to initialize things like this.  NULL isn't a valid pointer.
This just disables static checker tools from finding uninitialized
variable warnings so all the expense of writing the checker tools is
now wasted.

regards,
dan carpenter

> +
> + if (IS_ERR(plane_state))
> + return PTR_ERR(plane_state);
> +
> + layer_state = state_to_sun4i_layer_state(plane_state);
> + fb = plane_state->fb;
> 
>   if (!sun4i_backend_plane_is_supported(plane_state,
>         &layer_state->uses_frontend))
> -- 
> 
> -Chenyuan
> 
> On Fri, Mar 14, 2025 at 2:17 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > > The function sun4i_backend_atomic_check was dereferencing pointers
> > > returned by drm_atomic_get_plane_state without checking for errors. This
> > > could lead to undefined behavior if the function returns an error pointer.
> > >
> > > This commit adds checks using IS_ERR to ensure that plane_state is
> > > valid before dereferencing them.
> > >
> > > Similar to commit da29abe71e16
> > > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> > >
> > > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > index 2dded3b828df..a8e0e2123764 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
> > >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> > >               struct drm_plane_state *plane_state =
> > >                       drm_atomic_get_plane_state(state, plane);
> > > +
> > > +             if (IS_ERR(plane_state))
> > > +                     return PTR_ERR(plane_state);
> > > +
> >
> > This introduces a build warning. You shouldn't mix declarations and code.
> >
> > Maxime

