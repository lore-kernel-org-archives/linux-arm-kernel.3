Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C88EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=; b=e6YKwDPG0y6gxO31IoLPiVOuIg
	HChkKSw8QCKVqNA4DFQSazcYhFRroC+GoHi3WpBAJMyVZsGrUEQe2tSeahKPl/kVKLGwp6n0/+lbO
	zFCoxznVjqIkUYzS4GNWE42FvqK5wsEQ5PDNOUqZCkYX82HGb/nhySuqmeBTXC5p7yXuHkDdGk0pc
	JFIn6GEfQXAb1scBu9AnUmqgeHsYFSidwjMl5ylphJOf4BLx/2pqfYB4EuDiSvhYpf8Q3fwgGD3We
	TrnI42IcGb3rJYrzDI2txohejWN7nsrold2UdTkenlaK7zq4DwKSaIcbAOnenYCfXhlQr8iUVIrLL
	J5SgY94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvEz-00000005n0m-1Tr8;
	Wed, 02 Apr 2025 10:22:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvC7-00000005mMI-2u9X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:19:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11457087a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743589179; x=1744193979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=JZiB/afUjeL65J4X1qi3B2yEy0ycN3JeUWQGJ7joDzVsDy9HBLPmpp4G84GmUJVNC9
         s6OjPilNArnBIbMnx3Zeo7kPq+PLqK44JdC9clo8Z0PMPH8rHmFe5i7YPfrTreoXsgjD
         yeDgCZmZsjHBnjEVQAH0RuwdbfJjw0EDdo7R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589179; x=1744193979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=kvB1gqc4gcWNmfhEO6hRS2FGi9WhDxM4v6psu+S06axNEp/qINO8lQKiwPG5zowJ/5
         AO3nb2nX3PH9lmHPyKFU2+Qy2WG1snjuhqowcx2ebWj6fFizCWkQuC5i2Emt8IXLT3Jd
         4xUwypc9eaTsNYo5hyvp7V3RCsqKgWdwBBD94z3tA18udd377AA004iVN6Wn4kjKF1NG
         EBB1PyNJJVdNspbdlQR6VqcOLUFj9Znkh1iyTfKez3Ek6Ap+FFcXzytb3XDTKoqMStMw
         USB8eu7nEeJ87xezbe3mWrMwLnNvWZyVlOE50A2aj8/7ksmUC1tK9csXZeMymfL3eWdm
         8ocw==
X-Forwarded-Encrypted: i=1; AJvYcCUCgFboinGtE+r3+3kMpolBCwpL4jwng3tac25IR2I8IYMUUPmFITJoww+W7iBIzjlIzdIhVW0HPdwmV4lRffYx@lists.infradead.org
X-Gm-Message-State: AOJu0YzXHEZSC3T1Hprx8gITqLdrVSFMd7ZJggVhcR92ugX9C0jlvC7w
	cHN5Qj2Tjhky1vZwna29fNJX4bGn4PKD1nwVLYIb8tMJEOyTl9kL72qxzgFhAUecBonm8UgBpiW
	THX2N1LKoQcktTv9oURsNfv4+WiIthFjiSqxH
X-Gm-Gg: ASbGnctb5qdZpr3YvKk5r0lHytDyxfmKCVA16Bmc0R+L36pjfwWNla39uBa8RCrIn6i
	UJY1jGkTcDw6JxlJAaczs+V/HcJjXyyzGhRcFUl3vXTRPsq6OLpbdQS9o2OuQFkXnXZgC5PCbl/
	GcXYXeXCMXL2S1SrKes5quw8+5W30krHZURNRuLx8I5OqN+UMP1Nux
X-Google-Smtp-Source: AGHT+IFc/gdat5Dr87A+81uJRFZWgnUw8FjScnpjhEXBVgVwotYa3CxXqBYBb5s66JTrRULG7QmLlhlnerHeo7QspTI=
X-Received: by 2002:a17:90b:3b50:b0:301:1bce:c258 with SMTP id
 98e67ed59e1d1-3053215e7femr19031005a91.22.1743589179070; Wed, 02 Apr 2025
 03:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:19:24 +0800
X-Gm-Features: AQ5f1Jr24z9TQrfYXn99ssRwXfkIHJUxBLD8IHIrUHUVmb0Bwvezsgoy_EISkMk
Message-ID: <CAGXv+5H1aww6Adf=EKCkpC8oCkdRLEHP5_fwtfU1BzEsnyi7NA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys
 components on err
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_031939_728665_C8875F65 
X-CRM114-Status: GOOD (  25.78  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When calling component_bind_all(), if a component that is included
> in the list fails, all of those that have been successfully bound
> will be unbound, but this driver has two components lists for two
> actual devices, as in, each mmsys instance has its own components
> list.
>
> In case mmsys0 (or actually vdosys0) is able to bind all of its
> components, but the secondary one fails, all of the components of
> the first are kept bound, while the ones of mmsys1/vdosys1 are
> correctly cleaned up.
>
> This is not right because, in case of a failure, the components
> are re-bound for all of the mmsys/vdosys instances without caring
> about the ones that were previously left in a bound state.
>
> Fix that by calling component_unbind_all() on all of the previous
> component masters that succeeded binding all subdevices when any
> of the other masters errors out.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Makes sense.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6b31df587507..2d6562b29755 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
> -               if (ret)
> +               if (ret) {
> +                       while (--i >=3D 0)
> +                               component_unbind_all(private->all_drm_pri=
vate[i]->dev, drm);
>                         return ret;
> +               }
>         }
>
>         /*
> --
> 2.48.1
>

