Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124AEC79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyEq9qa7TDQIzBWJq5aVUtj/juytXvj0ykbdRsaUi5E=; b=p73zDd1A9elDCH9usyOA9EUNdw
	i63U6rgiL/1omTvYWUHnKgGGYaQljN2uRxuoBip1Brs09VfJcr/+O2GTG8BUFI0Yxaw5PDqB+HJel
	1aCWV4cwMJehxgA2ps3kfJtzM8sDYsecv4CeGr3VrQ52K8aHPdG4hG1mXssPGSfSCv0Nwkpf9LPLp
	ute7I7tZkLDiwKTD/x2pjkE+Mnb7DThHFCHC5/Uisxfn/mibkO+bVQv74JtlsItRWPzVW9CphticN
	VuXEAAFnkQCajdiGiQ94WNWU9e5BIk7zzSvpfHhQ1meN8BivaPIGpEllW232sPFQjevxX7ZVmZhCe
	47mlmfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoER-0000000Bo8v-3lRR;
	Mon, 05 Jan 2026 17:19:03 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoEP-0000000Bo7V-1ZHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:19:02 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b79e7112398so27276866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767633537; x=1768238337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyEq9qa7TDQIzBWJq5aVUtj/juytXvj0ykbdRsaUi5E=;
        b=CqFaxefakUQgZQn6LDfOJk+lFGitXTkywNZkltoQNF0z9/CEdNt6myO+TMYd61kBvP
         h963Ge6SD4h/oAFD8XYlTVPI9WOXYEuoXq8UB8IloUphdc8PizNxVUL0opO9vFiG3BF7
         ENnFs0v1Pt06huVQn7GCWZvFNdhXdTUelwo0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767633537; x=1768238337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyEq9qa7TDQIzBWJq5aVUtj/juytXvj0ykbdRsaUi5E=;
        b=WOaGlUxYvksNfHDDRwEGE7tu6+CQp9AWcBd/vrU71KQBg13x99SaeQsuxqZteqkQzQ
         aF1lRH9yOHOo2yv15PnLC4/Tf9yJrRMJZ//eS27RXREyyniCHJVUs6VMD+0ajtwVn6ef
         RRLd8vP7Ns8OCnbnOhuVA3EuY7yMukaCTsLsw447RqWuifOZHnJLAhhclHOsXby2wf+o
         o2NMkzfwImEfK2hKncFDLjKrPt6GvowyNAe77HPsBjXtR6Ic+vJt6ot03ALgFyQlKAPB
         5VKlhb6viTPGERsrpOtUfHlszqyv637hGNXWwPZNwRQysAt17PjbVGYA5L7DTT/KQ7oL
         H0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWFVm402bhzNHRknnoAQKg7ts+tPCuzZ3DFayg/aVYf1rN+F+s35h/QiWCGHgXqpxzH/v2yeblzFrgwsnhgUuZI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4RSfou+C5wJWmcLFF+8KzxzuoNoP4LI8K8QD4TV6DZ9uX53Y7
	F2EjUPBP0JTYuQTr6561zJRhO4m17V5vR5rXH+B7PvoUvRmOhl2ex0ie/nqFVlxtYCixkuIGTID
	o4Nuri7Wk
X-Gm-Gg: AY/fxX5GRBLpwIfcJg50PTVM8aupLeDeV7+dD7k2VpU8h0RZ38PHqVlG59+XAXuWclu
	l0nkyfrgPMqF5Q/xCAf3eF/iPSnxozBM5vGHn4Gqi1oIz5dhJGmhvdPLET3Tf2fL+cPs/Nj2Bdl
	KHQehGwFWQewDMNvHinzCvfzHScbFZZtkDDmlFWgucWyj/TW7vwQh95xIob96UmZ+HRKi4Mox6d
	/3zpX1RSM10kb02IHF/j0FMn9YTgonNpGBw6wAY2Q3FJb2/a/XMgLJsUL5XASFbPvk8JI1Xzw9J
	aEgGE7pXrQrCKAffBRcbeykDkHhTGeTTZ5tBr++nRsh6I8fC6Gw/dYnZ7Q1soAe9s7XtzZ1vFdh
	vEMpcCt1/SexccN7Gxx5fJOSnQU8r+nbdtntRuQDB0RPkmwWrl0Ffxh7B0PBXgZbULiVpRxfYu1
	7nJOyVoG749JPk+HWlr+In6a9w0ijBs1iKIKsdijgFSEmHEtrIUA==
X-Google-Smtp-Source: AGHT+IGYSr+SyyjqO/QoiTHKQUvqMWqYf2pzFua5F5K0lCyt1YmbLAvcSntfuwIiJudct4+4HQVhXw==
X-Received: by 2002:a17:907:934c:b0:b74:983b:4056 with SMTP id a640c23a62f3a-b8426a4ea77mr47997066b.8.1767633537523;
        Mon, 05 Jan 2026 09:18:57 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84265abfd5sm47461966b.2.2026.01.05.09.18.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 09:18:56 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso37343f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjFCWdjhhaIHCbTzRrWNtZM2q1rf18GuNq+sN6MdSNVn5nCi967RZHcqfj6oue03dNwS/BQRtaLxzk3zfKIAgj@lists.infradead.org
X-Received: by 2002:a05:6000:2209:b0:432:b951:e9ff with SMTP id
 ffacd0b85a97d-432bca50942mr736622f8f.53.1767633535813; Mon, 05 Jan 2026
 09:18:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com> <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
In-Reply-To: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 09:18:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V4Q7MxsHJivfaO6JD5uW0Dqa4K1OsYmmerdsw5Apjkcw@mail.gmail.com>
X-Gm-Features: AQt7F2pluFldn98dXmv9Vd4lrpkG1uNZNZvh3TeVxvGJlWd-_jEbDvtmnHtLVpg
Message-ID: <CAD=FV=V4Q7MxsHJivfaO6JD5uW0Dqa4K1OsYmmerdsw5Apjkcw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_091901_421014_9392AD62 
X-CRM114-Status: GOOD (  20.83  )
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

Hi,

On Tue, Dec 30, 2025 at 9:20=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b894890ad..dd53ccc209ce 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 =3D=
 {
>         },
>  };
>
> +static const struct drm_display_mode friendlyarm_hd702e_mode =3D {
> +       .clock          =3D 67185,
> +       .hdisplay       =3D 800,
> +       .hsync_start    =3D 800 + 20,
> +       .hsync_end      =3D 800 + 20 + 24,
> +       .htotal         =3D 800 + 20 + 24 + 20,
> +       .vdisplay       =3D 1280,
> +       .vsync_start    =3D 1280 + 4,
> +       .vsync_end      =3D 1280 + 4 + 8,
> +       .vtotal         =3D 1280 + 4 + 8 + 4,
> +       .flags          =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc friendlyarm_hd702e =3D {
> +       .modes =3D &friendlyarm_hd702e_mode,
> +       .num_modes =3D 1,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width  =3D 94,
> +               .height =3D 151,
> +       },
> +};
> +
>  static const struct drm_display_mode innolux_n116bca_ea1_mode =3D {
>         .clock =3D 76420,
>         .hdisplay =3D 1366,
> @@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>         }, {
>                 .compatible =3D "boe,nv140fhmn49",
>                 .data =3D &boe_nv140fhmn49,
> +       }, {
> +               .compatible =3D "friendlyarm,hd702e",
> +               .data =3D &friendlyarm_hd702e,

Do you actually need this? I notice that in the DTS patch you've got
things under the DP AUX bus, which should enable you to use the
generic "edp-panel" compatible string assuming the EDID is populated
properly and there are no problems with power sequencing. IMO the only
reasons we should be adding new entries to "platform_of_match" these
days is if we need to work with some legacy eDP controller that can't
be updated to handle the DP AUX BUS or we've got a controller with a
bogus EDID...

-Doug

