Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133F3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP/t3tmqr6JMO2GSBV0+LLksYt7zR4DhEc5XGpybdow=; b=TBzrlX4PqiOJXvw0RsBscQqVM4
	9WeAU5sWBTuii46O0FIfe4DVGKxR9vViZdu0PqsYhwr0A9IN8kv9/A7/srJ4XdzYT5arLtG8fQeAV
	2vqS2lNWtD+byh8wcSjuxruUK35XCuaUSKlhZTqiWAFL/1TN73Pv2t3QMi3s0fpSfME17yTz3zgQ9
	zomw1x7AcxrYBZfOD2BhFm3IcbGyy77aaIU0sJS+jRT89vkdQIvIYsgHBaFFsVeGVdttc5qc7ZHx+
	ETRpDAPxX6Ue0KZZA9wUzq7Y5heB4XJ3jNvhObIPn2E/+Moqo+lMM0RuPxmmrL9z/y+De4c8fOWKx
	L3NUdOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5VB-00000000qdZ-047l;
	Mon, 03 Mar 2025 13:06:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Tb-00000000qQo-0AdU;
	Mon, 03 Mar 2025 13:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6959C5C5885;
	Mon,  3 Mar 2025 13:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B19C4CEEC;
	Mon,  3 Mar 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007093;
	bh=Kc67sUpClxemt8Xxy2aFwoflyMsGfUhh3kfftx68WzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YDRHU65A1Zoh3hw1p3HsOJsSkqBvhXSHfah9Wlq5+a88AV942SLRoCzZy0pmV6NXf
	 Qu7+Iac3vuoEI7P/cuKNYGcVIEqg3Rp1KpCKtdDnkDqhwdisDWSRtAeIa468AbqBT2
	 48epWenhmUO9x3U1IjuiI1eJxV5x5CKAWo8hqcux0/VFCdgciN9DY6QMcsZEfsOGB9
	 Wx7NYPSdS/UDjgCcdsw4fwQPDfEbbBRCe7Nr5BZH0o2AbckyTQhxBeIJHSNVHgGFE0
	 k94UiVDiMOmX2TLm5hsXZnk4OsBX5zV21tYr6zL2Mlbx6AdB/GrQsAwMqj3FbxSUgm
	 0/MeS2k4ccSgQ==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fea795bafeso6521438a91.1;
        Mon, 03 Mar 2025 05:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkh7rlJhCMQxxN5pVfUeOLHGWCSJCTEeSdgXxEgL6YgVDLngquFZ7f+oLdPpzdUAoLoQ5z3wWnNVnoDKowbtCo@lists.infradead.org, AJvYcCWswgQM7EWhC13vEMj+mvsaW49quuYuoOkIz8kpj5D/STfSV5eFNI9l63dEWFkTZsFojxnbz/9jTB2oe4IbmDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMugHllrUban1YuvtNUyeZMGarLb3eDBFhzhHKGUQdrpK/PrVo
	+MD968xfX0E55ReQwVZmR1gSJ3sNmq1CW6jOKt8klZjWK/J3maHhO7KvkYCOWnPb2dCSBnF0+OA
	NLgHsPVup+fg4xQkk0Ds8Bjt2GA==
X-Google-Smtp-Source: AGHT+IH02/n0X6E1gCWCCjIwiDiMBCCog908/wSy8glvpxrUWG7zl9UbjAuOmobw7eTHtsiFGSu1wTms11iI4ft0D/Q=
X-Received: by 2002:a17:90a:d408:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-2fea12683b9mr27834691a91.2.1741007093217; Mon, 03 Mar 2025
 05:04:53 -0800 (PST)
MIME-Version: 1.0
References: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
In-Reply-To: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:05:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Ka-RD1=XmaAuEjrhkQMQQ7Mg+rgXaNe8ka-VGeRZ4JQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoCI49gG24ADeeYR9aiQBSlqnUG9YwDaVyfJzTrVZzFPkF3TWLMSnf3T2w
Message-ID: <CAAOTY__Ka-RD1=XmaAuEjrhkQMQQ7Mg+rgXaNe8ka-VGeRZ4JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: drm_err => dev_err in HPD path to avoid
 NULL ptr
To: Douglas Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_050455_189558_B445A136 
X-CRM114-Status: GOOD (  25.70  )
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

Hi, Douglas:

Douglas Anderson <dianders@chromium.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:43=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The function mtk_dp_wait_hpd_asserted() may be called before the
> `mtk_dp->drm_dev` pointer is assigned in mtk_dp_bridge_attach().
> Specifically it can be called via this callpath:
>  - mtk_edp_wait_hpd_asserted
>  - [panel probe]
>  - dp_aux_ep_probe
>
> Using "drm" level prints anywhere in this callpath causes a NULL
> pointer dereference. Change the error message directly in
> mtk_dp_wait_hpd_asserted() to dev_err() to avoid this. Also change the
> error messages in mtk_dp_parse_capabilities(), which is called by
> mtk_dp_wait_hpd_asserted().
>
> While touching these prints, also add the error code to them to make
> future debugging easier.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 7eacba9a083b ("drm/mediatek: dp: Add .wait_hpd_asserted() for AUX =
bus")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Unfortunately, I have only been able to compile-time test this code. I
> hit the NULL pointer dereference on a device that's nowhere near
> upstream and it was running (sigh) a heavily modified copy of this
> code where the eDP stuff has been forked out of DP. Specifically, you
> can see <https://crrev.com/c/6073744>. It's pretty easy to understand
> that the same problem affects both codebases though, so I'm posting
> this "blind" in the hopes to at least fix upstream.
>
> I'll also note that the fact that mtk_edp_wait_hpd_asserted() calls
> mtk_dp_parse_capabilities() feels weird/wrong to me based on other eDP
> code I've worked on, but I've only barely looked at the Mediatek
> driver and perhaps others have already debated this. In any case,
> that's not directly related to this patch.
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 0687672f0e52..ccd104d8851f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1763,7 +1763,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp =
*mtk_dp)
>
>         ret =3D drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
>         if (ret < 1) {
> -               drm_err(mtk_dp->drm_dev, "Read mstm cap failed\n");
> +               dev_err(mtk_dp->dev, "Read mstm cap failed: %zd\n", ret);
>                 return ret =3D=3D 0 ? -EIO : ret;
>         }
>
> @@ -1773,7 +1773,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp =
*mtk_dp)
>                                         DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0=
,
>                                         &val);
>                 if (ret < 1) {
> -                       drm_err(mtk_dp->drm_dev, "Read irq vector failed\=
n");
> +                       dev_err(mtk_dp->dev, "Read irq vector failed: %zd=
\n", ret);
>                         return ret =3D=3D 0 ? -EIO : ret;
>                 }
>
> @@ -2056,7 +2056,7 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp_a=
ux *mtk_aux, unsigned long wa
>
>         ret =3D mtk_dp_parse_capabilities(mtk_dp);
>         if (ret) {
> -               drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> +               dev_err(mtk_dp->dev, "Can't parse capabilities: %d\n", re=
t);
>                 return ret;
>         }
>
> --
> 2.48.0.rc2.279.g1de40edade-goog
>

