Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8722C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IenpiuM5JsmgqLGPzCFWXP8UT6+FeKulhYM9DPJHH0=; b=asGb/rDGPNWtvO
	xtciGowRWlmBZGM6bpWNfB3OHWQqVvluffHqQNPSWaJikKYQMje5/6b/MIib1WYRiSlBNYeNr9Yht
	4jIZT7KqgNd6fPcti++UctlTDzXYp8tvmpyVuAetAAdZhWaA9kZ4iWB/FOm+9V+5MUkegVMQnpsw2
	wLjo7Ik9gqzeNY1w3A7+LaLLhCS29O1xHkfcbeQ1/IlVIF9apnCMbIL56hffPoiXQozWqc27miHlv
	5yJbJ5FOIL1iWRQLsDd0+fv4PI8FMB6FCiHoiJJt09lJVqq2DQJP6JkQ1tbyeeE3vWnAxBl9SgA/Y
	wFjkcTZOGSbUss3jXeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw3z-00000000AeS-0jVj;
	Mon, 03 Aug 2026 17:02:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw3y-00000000AeH-1SKQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:02:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE21D43B5E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39F91F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776573;
	bh=1IenpiuM5JsmgqLGPzCFWXP8UT6+FeKulhYM9DPJHH0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FTdXnF8GFLny3L584AQMMgX2xFs2nxONoFzoXYXqVfCFkjBOgeX8Mr/iTQ9uusC3r
	 Zgj3u3iA940U7/5dptUgEJR63P/Yb+TVqM0phvTk3cTLIEbBs8bljGub28r+RCUbwV
	 EkLQsjUHId9GqE8Ku9EU/+GjtYNYBPmPynBYLHs6WTRfmevunezT+XRbZ3MebOQf4D
	 A1opir9RT91tIzWOrZQK3fkhpuO0gNdIyUr0JBq/dYWEi3HFFM6TFM6/OwO4DVKTz3
	 mLsIEks8ez6oRODt/3GYbQ7+hrOxNVzwB6uV85OQDVjhcYsXBLauovRXM7ewba5Wcz
	 qmp169nCj/83Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso18202701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxQc81KskYbVyvVu6HIVq8qi0hY4l9L4clsq+K9Q/CkGyhATcTZPATpiGKH/WEBnc3ZLmswdWw4mCKkAcI4zR+@lists.infradead.org
X-Gm-Message-State: AOJu0YwRc0Ij7XoPXlmhLlSecW6m6zpoQAg/JJ4AW6KepPLHNRYS1nLN
	6Kf2SOAnKa3lqMw4Ng0MslOJyNkAjlz2p2cOXkzdctsLpZt4P3IaDISFwHWfzCvDUkapS6VLHpc
	tGE02OysTIqbmQ9P2fSLxZVwMS23LyZc=
X-Received: by 2002:a05:651c:a110:10b0:39d:9eac:8ec with SMTP id
 38308e7fff4ca-39f863feedamr15152501fa.25.1785776572170; Mon, 03 Aug 2026
 10:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:02:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v66yVbzTSu6sb4ryuD-djcH+vaCtamuhtY=xnq93_ZvKog@mail.gmail.com>
X-Gm-Features: AUfX_mxnJXn_HowfQijlCXTBUd6N7zXjEPoDoAqA1n9Cl_6r3aRntgABVyXhcqU
Message-ID: <CAGb2v66yVbzTSu6sb4ryuD-djcH+vaCtamuhtY=xnq93_ZvKog@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/sun4i: crtc: Propagate layer initialization error
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> sun4i_crtc_init() returns plain NULL when layer initialization fails,
> while all its other error paths return an error pointer. The only
> caller, sun4i_tcon_bind(), checks the result with IS_ERR() and happily
> continues with tcon->crtc set to NULL. sun4i_rgb_init() and
> sun4i_lvds_init() then dereference it in drm_crtc_mask(), which
> oopses.
>
> Return the error pointer instead.
>
> Fixes: dcd215801b02 ("drm/sun4i: Drop primary layer pointer from sun4i_dr=
v")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index c2f7f69baf75..3fa1f4fda0f0 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -208,7 +208,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device =
*drm,
>         planes =3D sunxi_engine_layers_init(drm, engine);
>         if (IS_ERR(planes)) {
>                 dev_err(drm->dev, "Couldn't create the planes\n");
> -               return NULL;
> +               return ERR_CAST(planes);
>         }
>
>         /* find primary and cursor planes for drm_crtc_init_with_planes *=
/
> --
> 2.43.0
>
>

