Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73925D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=; b=vm+kFCIOwZqb3doDfwORkJXYIq
	oVNyYuOjpon+9BuOCKmCikmjUoIv3T7c9/dZ+N5Pqj73bbzFBuVmdJEKAhB+X5Ho4EfIpjdfBylmC
	KZ/WhQ3sUb074VA5jcHWE28fwfA0yzQmXpkoFyZQ6ueg1B1n+V9/fdw1XNmjqnxPOMfg/aUYOV6GW
	VNOv7Uf6Pp+qzpJiMMwvfmPYxPpR9OU1HycZaVPBYToR6XjougKDD7sfMgJd5UnrBzakH+PfEVCSn
	dJJlnqmd+n9rqNM+y0gGqy0lr2XwTnmvULDZ1IaoKDTVEwCAE26dG/YMnZxpUu8NnySMlNSB3lr66
	P4PCxIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBDt-00000003c0Z-3Ddn;
	Mon, 29 Dec 2025 11:15:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBDp-00000003bzh-2YrI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 11:15:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so54228165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006929; x=1767611729; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
        b=bNiDQ7G08aAj6j1fGE7jnbyjcf0t5J2RpNm8qcHJaRG1/KTXGmizWZO7lHFsL5qbwR
         tS/yQM0xPrS9MrgpMW1QaDhqAR5Sr4ICnLwyrczfr8uWlFRSjzpdtcTet8BjseSDTRgR
         NDsZq/lwwCurTi0h5IjXYrPDXh1gm7EfasK8j0+m8xWApPfOrAjnd68oMhDeDbzxyDIb
         X7f3o0QVmICdF1lRwj0mF1I62j1ZIjt1MmccCRlhKdEJleAg6ITHCEcburw6iUhD7wgQ
         gF9rCqb1lv29NvRe7+Q2tnWLd+MR+rWBREeQF4TK/wi/GrsE2tFECgdqgEsAAYbh2//Q
         TxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006929; x=1767611729;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpnL12+10WMDZ/zLbFzfXl87AByZQny2Cqko/Ftm7i8=;
        b=chta+wYgm3C1jKwNGC6DgqqgjTcjGmAAbnV8fV6A3ILaEf/SCZjYnm5Q6TAYlzybmc
         bkeHqQ7esGROm4yFPrQrtxPfA/bQ6qpfHZQb6wRDOlg4BFObKjkO40S2zyOCx3A50t03
         AbnEjaQNod05oeX4vRiOL7eeQkGyRUsJOoCm2SU+Qx4U4rKWG61P/EO3BYg9oPna7ph9
         Umj1ZpWVX2jQw1293yg8Azat60mmNdAX1BbLGIN+RpKHt+puyvGWhUwCzE/gnUAF6va/
         WNb8gIOh3tGIAOw4loVuUQRnYMse+vfkMW4wOex+wmmFvwqcYL/UIE34ksTm95YAVrIb
         fmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbLmV6P4IjC26arqEaWAp70LI+Yx8955jkKfqOwiDYsmUhAl8lkaKxJu4+WAHVkWVuv/B+MniRqqWxDmCJngxo@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdN150oGLOFeUC1cZoIUIpbtMsknKp5pE3Ei5Tcg1u8vqivOI
	TpXFJu3TbvznDto9hmu9VthI09ka8pofy4VynxVoUbG5uf+h4FqbfcEN
X-Gm-Gg: AY/fxX5VCA2CcZvYfxw3NjC+fnFMLAwq9of480mcCzwx5uZCXwjBmcl+gejd+UWVGWd
	4/riJM2x8nlSvyxlpikrSfkxAE3/ut8GdlB07esmAcXG5XeJHbTTkQKczVQMYoDDwudv/SC0r2w
	lP/uXHkzMLyKQXaZJ0czNdfDZtJqwqYLb/PgUP3fDLMpvuxLXuuBooZQD7q73laoBbkcWV/3lvu
	JpKBELRTXR87vniOau1yXB0HANDqemi/5hOjFPWSUnPZ65WxIOT8TrmlRO+i1HXbarAigY65TIS
	T2Wr4iJsK3bdy/hd0+zEwakQlmtM3b+ykhIFfeV1moQMUVkBI5/rHAMHSnqF3vhw0BdqWKF21xr
	+eLe1MZG/Pg747NYQx/aRvrf7UuFAt/fk4wuBmstKkqUHI9uz2hBwk3W721WmElCBKygcVFd5j+
	3q477xm8RGFLy9v8FjrE3s73kBs/Ax28er5dbG4bfC/3xlLGXthqCCj19ibzrwvgV5xBOMy5b3K
	9oi5cwEANx+OFB1GvE2
X-Google-Smtp-Source: AGHT+IE40zrhw3F6xmyWQeMWTwedY3Ymb2iFUauvsMIwQ1EpFshoVSZdHlAb9Q9oq8B4HsHTN7T4mA==
X-Received: by 2002:a05:6000:430a:b0:427:854:770 with SMTP id ffacd0b85a97d-4324e50a1c1mr34072551f8f.43.1767006928605;
        Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm62515969f8f.37.2025.12.29.03.15.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:15:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up
 to 3840x2160
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Date: Mon, 29 Dec 2025 15:15:14 +0400
Cc: linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,
 tzimmermann@suse.de,
 tobetter@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9CFD913-A6AD-4078-90C2-C1E46EF5E74D@gmail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_031535_186711_BF9B2EE5 
X-CRM114-Status: GOOD (  25.03  )
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

> On 8 Nov 2025, at 5:42=E2=80=AFpm, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes =
yet.
>=20
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
>=20
> Allow resolutions up to 3840x2160 pixels (including middle steps, such
> as WQHD at 2560x1440 pixels) so they can be used with computer =
monitors
> (using the DMT code-path in the driver).
>=20
> Signed-off-by: Martin Blumenstingl =
<martin.blumenstingl@googlemail.com>

This is not a TB to kernel standards, but it seems not many folk
have ultra-wide monitors so this is as good as it gets:

Tested-by: Khadas forum user with a VIM3 running patched 6.18 :)

=
https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for=
-dell-monitor/26271/8

Christian

> ---
> I'm sending this as RFC as I'm hoping to get some comments on the
> "4Kx2K@60" note from the datasheets.
>=20
> I have tested it myself on a GXL Le Potato board using a computer
> monitor at 2560x1440 pixels.
>=20
> This is the spiritual successor of a patch titled "drm/meson: add
> support for 2560x1440 resolution output" from [0]
>=20
> [0] =
https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshe=
witt@gmail.com/
>=20
>=20
> drivers/gpu/drm/meson/meson_venc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_venc.c =
b/drivers/gpu/drm/meson/meson_venc.c
> index 3bf0d6e4fc30..4abd0c09b442 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct =
drm_display_mode *mode)
>    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
> return MODE_BAD;
>=20
> - if (mode->hdisplay < 400 || mode->hdisplay > 1920)
> + if (mode->hdisplay < 400 || mode->hdisplay > 3840)
> return MODE_BAD_HVALUE;
>=20
> - if (mode->vdisplay < 480 || mode->vdisplay > 1920)
> + if (mode->vdisplay < 480 || mode->vdisplay > 2160)
> return MODE_BAD_VVALUE;
>=20
> return MODE_OK;
> --=20
> 2.51.2
>=20


