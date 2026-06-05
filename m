Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93920CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ksbjEziQ/klkTRNLQdAgetuDlG0vybDd4/Easyb/oE=; b=l/ll0FhViZNLsGjCBTN+U3fPbj
	ruMFAk23mtojEYn/raURZWbHr5/S3yuRWV9WWrRC1koXLdcwQdm4I9tfkcmpZkEuqpztdkkIL88aX
	VcoTOqyUbxAAnxGg/N/sMvN8ajNXHYipqiwNx5mAlD3DlH1piQuBSwMMPbz4S8+F2xXHRxgAySKNy
	sAxwbueFnXLjHWNMt2q1A2kVSULz4lgpdjUeVaM0QfziiEh7Ewbsy9qXuDMhYhdAsn2EAVi6lhtk7
	ppBhLbkjP8ERSn3lBKProMDJUTuk/XEXTZnudWUI8Z4dOoKEph8gvFiO3K0gAOdQUEtI0iaGYiOOT
	zm5qP5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWx2-00000000rxQ-0Df7;
	Fri, 05 Jun 2026 15:59:16 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWwy-00000000rwe-27IY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:59:13 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51776b4de37so16589981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 08:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675151; cv=none;
        d=google.com; s=arc-20240605;
        b=WQl+JUGWDrt112p0ETn1HFIVKj7f3fNmlR7Kura2PQY1JOm49Z2YP08PaZZKZ9jQcr
         8BXzzeST8GksUxiCqd6CXGFGvN7aSMs29dRBwuxN1/tI5B0S9KcNd5a4pCorMaLZ4YyM
         OKWN4XO0izn2R36jOJkL2hwjcqWSjhyksMYGLc3qYlOftFdo2ubdBipF60jHWni+pQ5H
         vgZQmsBZD2UOunIFL9H+9/alaJN2RpqfRxmzax1u/ySdoK8XZQu9Y7meOQzYw7GOrF+K
         27HD32zTm18H4g9G0Vgo4+rmnAZGSIrSpqvWJnNB1OHC5tNBlMAFvs+XtGktGA+BZh8o
         8gPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ksbjEziQ/klkTRNLQdAgetuDlG0vybDd4/Easyb/oE=;
        fh=NmR/E10RwRe3f+3MCFGqs/ky7UhQMZ0eBRMJr04hTN0=;
        b=LzMcHwYZH2kfobUyxiL5+Y03cMBv6hdRZFweJaS/oh2MvZenjWRfXdzchTBv3IXMWz
         eVOyx0QUgljEuiA8iQnQFB6pJQALNxvWgJP5MboJyX0q3t8fZFribPgiJ0EHLh41jNiX
         UGWiFw6/E5RpaqQLRw1uJCdw7YP95l+jveitleFz2Ztu//C5dBrOOmbYJqNbJ5+8QqME
         3LAMtQOTVO8udx0pX2+tv/Zg4BW9xQ5aa14/1QSaOP0Ri6+YLBztuLPbuUaPCFPS6IBv
         mhI3rdy1lrUBZZGruDdCMJ4uM1lyenkuqBwajJNXpfOjPgUiOEA13rqSFc+2EwM0zR04
         5ozA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780675151; x=1781279951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ksbjEziQ/klkTRNLQdAgetuDlG0vybDd4/Easyb/oE=;
        b=ra7ZjgBrGgaLAo0PvpfUwP5UqKlGGYjL5Z3Ap5TsPG8KrfCiv4V+qgU8hytTFVTSs9
         zRlerfhAhnYNpZCqMG1YIr+hJ3Bgq97VzDedd7FWAVnyPOUdzzAAKDhG3oZJVDUHQWt+
         gFF2N3gh/4kJial5rjbi6yDdOa/xtiYrgaJA2fpIzwAHMc0juX7s9tDpK9RBr7hmOFoD
         bOXyMg1J5Fp1OLAO60sOp3TVJmsqwgnQKGZffcZrUXq+eDH41WPCclRGA1ku8djliNKG
         tE5xu5Gl43G6+aIQFgp0BEIRj6mrSWg22C8RwSZENI6xs/qcER7UXK4M/zAOYg/CLfhi
         6Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675151; x=1781279951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ksbjEziQ/klkTRNLQdAgetuDlG0vybDd4/Easyb/oE=;
        b=CbJJJxHGP2nqHvwQVhopGy208VJWcc2C26eMJUjD/vDopjDcP3zJDsBCcDIPghsb7t
         0C8NalNSQ3FglTUXn2+WPy7SYkGyLLohh73MSonK+J8SgNGGm9IRAgp/xp2nuURds71N
         39fIM0Zmhtx/h9/Uul2zDL/bm5EpVU6R7+sP8eBKrM/5HyJdlD+kNK47gXzdLuB8MEiV
         R/wkczjdbG74yMf+czypS/RP4H8WT5n7gKWwGH//aX2mmA9xfjaMF17QjZlzvbuL8ipY
         yOEN+OxvBW9LUo90uQjvJuwku+3oZeyDGDPq+g+dJkiOh9aB/AM2J+SAxQU64EyTo40a
         VvcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+APGalEYBryAZIexPg55rELl2XowdpjvYcibwJE9eoGTrLPYG0fl5OWjaYSOS5mUwpadB4tepy565z6rIkCdU+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6c/pKuRe+eZTAfgTMbfHfFctXXyTaRwLBKdbQsMCWFOwfgsJh
	3l9KIPAgZ5UH+TVZWcx2Q0TVCYrbcWavwShj5jhpCzcnLyQo3Px/MVjcBtTPqS0ltKEgMLcwGrN
	rW3un54+Yxm1ULC0KXSy1g88fHc6ybcQ=
X-Gm-Gg: Acq92OF6USy6WA0jPXx/zKD1PVCNBk0rBI/Yku02G7FvmuTWU0qjPzi1oEVAxgrILJj
	UbhCNYOBzI2+cB9ZpZo/l82ujXdP0noA9++jJtuGYZAGR7CKZ4Rb5HF5H6e5Pas1gW/Beqd2Uwt
	ezZ4q03QtUXFZ5tTyr52HjG99hp0bw+90/0Yjhzn5yfVe+p/Hvba8agDu5IEzgretU/yI2HhM8t
	PdrINTyfTI/BhuhQ71omTi/NeKnhqG00NWYnk5kAjSshnDfZy8SOeCe8ELDQKFS+cW4Ume67q0n
	7I8Ypjg5ljTiECkA
X-Received: by 2002:ac8:7d16:0:b0:517:89d0:b8a9 with SMTP id
 d75a77b69052e-51795a872cbmr62478381cf.9.1780675150571; Fri, 05 Jun 2026
 08:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-vop2-clk-rate-check-v2-1-b207cfc427d7@collabora.com>
In-Reply-To: <20260409-vop2-clk-rate-check-v2-1-b207cfc427d7@collabora.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 5 Jun 2026 19:58:59 +0400
X-Gm-Features: AVHnY4Kg55Cpi5Qk79GgU4qugmSkMCPyryYYbHOI9JHnUkY85yTZ0sefHW3lqDA
Message-ID: <CABjd4Yw_HYpjhrgmonB9FmWV00q=r3yvqnFE4TXEHpM1ZgWOhA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] drm/rockchip: vop2: Add clock rate mode check
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_085912_571308_EB7B0A8B 
X-CRM114-Status: GOOD (  27.12  )
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

On Fri, Apr 10, 2026 at 2:37=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> The display might offer modes, which exceed the maximum clock rate of a
> video output. This usually happens for displays that offer refresh rates
> above 60 Hz. This results in no picture (or a broken one) being displayed
> without manual intervention. Fix this by teaching the driver about the
> maximum achievable clock rates for each video port.
>
> The information about the maximum clock rates for each video channel and
> the tip about multiple pixels being processed per clock were provided by
> Andy Yan and roughly checked against the information available in the
> datasheet (which specifies limits like "2560x1600@60Hz with 10-bit"
> instead of a specific pixel rate).
>
> For the video ports supporting a 600 MHz input clock, there is some
> logic to handle up to 4 pixels in parallel when needed resulting in
> the extra multiplier.
>
> Suggested-by: Andy Yan <andy.yan@rock-chips.com>
> Link: https://lore.kernel.org/linux-rockchip/1528d788.186b.19d08ed974c.Co=
remail.andyshrk@163.com/
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> I've kept the RFC tag, as I'm not sure about the 4x parallel pixel
> processing. IIUIC all of the video ports with a maximum of 600 MHz
> input clock support it, considering they can go to 4K @ 120Hz,
> which is above 1.2GHz while Andy mentioned a max. support clock rate
> of 600 MHz.
> ---
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20260217-vop2-clk-rate-check-v1-1=
-989b569119ba@collabora.com
> - based on v7.0-rc7
> - rename max_clock_rate into max_pixel_clock_rate to distinguish from
>   input clock
> - update max clock rates to the numbers provided by Andy Yan with
>   extra 4x multiplier for 4K 120Hz VPs
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  3 +++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 ++++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index a195f5c819a2..35a0edda5375 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1434,6 +1434,9 @@ static enum drm_mode_status vop2_crtc_mode_valid(st=
ruct drm_crtc *crtc,
>         if (mode->hdisplay > vp->data->max_output.width)
>                 return MODE_BAD_HVALUE;
>
> +       if (mode->clock > vp->data->max_pixel_clock_rate / 1000)
> +               return MODE_CLOCK_HIGH;
> +
>         return MODE_OK;
>  }
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.h
> index 9124191899ba..fd46913f3346 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -225,6 +225,7 @@ struct vop2_video_port_data {
>         u16 gamma_lut_len;
>         u16 cubic_lut_len;
>         struct vop_rect max_output;
> +       u32 max_pixel_clock_rate;
>         const u8 pre_scan_max_dly[4];
>         unsigned int offset;
>         /**
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/d=
rm/rockchip/rockchip_vop2_reg.c
> index f3950e8476a7..6ae3d506c476 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -559,18 +559,21 @@ static const struct vop2_video_port_data rk3568_vop=
_video_ports[] =3D {
>                 .gamma_lut_len =3D 1024,
>                 .cubic_lut_len =3D 9 * 9 * 9,
>                 .max_output =3D { 4096, 2304 },
> +               .max_pixel_clock_rate =3D 600000000U,
>                 .pre_scan_max_dly =3D { 69, 53, 53, 42 },
>                 .offset =3D 0xc00,
>         }, {
>                 .id =3D 1,
>                 .gamma_lut_len =3D 1024,
>                 .max_output =3D { 2048, 1536 },
> +               .max_pixel_clock_rate =3D 200000000U,
>                 .pre_scan_max_dly =3D { 40, 40, 40, 40 },
>                 .offset =3D 0xd00,
>         }, {
>                 .id =3D 2,
>                 .gamma_lut_len =3D 1024,
>                 .max_output =3D { 1920, 1080 },
> +               .max_pixel_clock_rate =3D 150000000U,
>                 .pre_scan_max_dly =3D { 40, 40, 40, 40 },
>                 .offset =3D 0xe00,
>         },
> @@ -775,6 +778,7 @@ static const struct vop2_video_port_data rk3576_vop_v=
ideo_ports[] =3D {
>                 .gamma_lut_len =3D 1024,
>                 .cubic_lut_len =3D 9 * 9 * 9, /* 9x9x9 */
>                 .max_output =3D { 4096, 2304 },
> +               .max_pixel_clock_rate =3D 600000000U * 4,

Hi Sebastian,

I've tested it on a bunch of different displays with RK3576 while also
giving VP0 an unlimited PLL to work with (and also expanding its rates
table for each of the displays' EDID preferred pixel clocks), and I'm
pretty sure this should be * 2 here, rather than * 4. That would also
align with ".pixel_rate =3D 2" just below.

In its current form, some of the advanced displays with 240 Hz modes
by default choose modes leading to visual artifacts indicative of
overclocking strain of the graphics pipeline.

The rest look plausible, so with that change please feel free to include:

Tested-by: Alexey Charkov <alchark@flipper.net> # RK3576

Best regards,
Alexey

