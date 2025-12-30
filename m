Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5205FEE021D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHWb2ZZ7v489cGB1FpvgLqgAaRckUfevrpxMAW1XsWw=; b=0qeVe2v94QTK+ntkKyZOm0Dglr
	mt7IWWC+buvbRHRG5p2D65AbWXDQ4g7JzKqHT5JWVqjR1+pWqoYtdqLQlV8UD/iY6Ihv3oqe/gT8j
	a9EXN1OwHzk9WJl2Bz5mSCOc9wjgfBna8nYb5SghbkotvtszVOEmiYWa7AnfShzsqQ2W3ioFSJhHM
	eAi89r9ucJRDGJwUJLv91XtzkbxndCl2cPC5OrGyT9zr3/NRMB9PK8qSCHO5kbxKdGItwRJuTbVcU
	4/CZ3nfbXievywFJh3mcI6N0OuxDyU6JPJGUk34KzderF2VhTlJStgYSZg8OoCkdxWOS1psq3h3VQ
	RbBehBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vac6S-000000051R2-0qIC;
	Tue, 30 Dec 2025 15:57:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vac6P-000000051QJ-2YnO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 15:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFE2A4448D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D80C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767110260;
	bh=zh6mBgSOrt9tzEGqC0za+HqZ/ttkBYTg50tlq2YNmSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T0Vq5wXkGPdGuSO2YfwZMSOEwMv+qedU3ywXJgMIMsOopw6ZUiqB9Eug7tHBhvAVM
	 gnoPwy0Go8jzVHUBmB1u6lwUJtZKkK+mORpDiK7Z6t02cs7ZQ+5iWYGD32C0umlrJb
	 qlPc/3oLX77CkcHhIB+fcGGnkY0objYA7KydvhTbvFey6JzISvnGneNbpnJe3BxImh
	 h25pDFCfv8b30yDY0WichIWn4T6MWj9y8lGfMnrd9ZmZ4ud5eOZG3jUIeA7VRfWPXL
	 I/xlntV7sh7eBMw3iIa3+HCS9dfSrJdlHFNujOrO5KLT0EQRsOvY6IdwrYZW1ZGhVe
	 MofI+G8hs8kOQ==
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo11296887b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 07:57:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1V9og/y9xHz/n5MqFasGB2Gz11aQ1efn8l2CJ6AQu6IHvTmEj5fg/X4NwMXyzyznZ4QDCyOH0Q6czYUvqX0Xa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1L/5Iqn6jZH43xA5f9EsQea4TPnpy5p7UI55vr1qgVTomrOfW
	OLVJDkQpM+RWsVDdAXsM8GY0OerNrxsDnYw33J+sHlNQDWm1k5cQlWi/mtUR60g6NWSXMZ2x85R
	7Ggd4Afee6Auvr0+l5hkYe/Mw/9dhdw==
X-Google-Smtp-Source: AGHT+IGoOHPt7cDLeWjkImsE/YX0CuwqHg64AhqpqyyOP3mNUQdT/3C8tuv+frASMbSBZnov+wrWqGW7SZUPvqCnXCU=
X-Received: by 2002:a05:7023:a8a:b0:11b:9386:a3be with SMTP id
 a92af1059eb24-121722e9eb4mr36996810c88.41.1767110260180; Tue, 30 Dec 2025
 07:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com> <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
In-Reply-To: <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:57:28 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-vwFnSOS8gqVvyxJm_0vC8BPUkAhbnkenOxRgt=DBhjQ@mail.gmail.com>
X-Gm-Features: AQt7F2o_y1wIjXQ-QvVw0G4W9d6Zeoklqz0e5t81TSkz1ztRqUD1HZt7mqVQoZI
Message-ID: <CAAOTY_-vwFnSOS8gqVvyxJm_0vC8BPUkAhbnkenOxRgt=DBhjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on
 timeout cases
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_075741_692489_D2D42212 
X-CRM114-Status: GOOD (  19.07  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B412=E6=9C=885=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:22=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> During a read or write transfer, the mtk_hdmi_ddc_v2 driver polls the
> DDC_I2C_IN_PROG bit of HPD_DDC_STATUS register to check if the transfer
> completes but do no particular action if a timeout is reached. It could
> lead the next transfer attempts to fail because the faulty transfer was
> not aborted. So, add in both low level read and write functions a abort
> action by writing the DDC_CTRL register with the ABORT_XFER command
> value.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_ddc_v2.c
> index b844e2c10f28060baef64bd36c5464758b08e162..6ae7cbba8cb6dacf46c2f7ab7=
4a2d7446d698b69 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> @@ -96,6 +96,11 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u1=
6 addr_id,
>                                        !(val & DDC_I2C_IN_PROG), 500, 100=
0);
>         if (ret) {
>                 dev_err(ddc->dev, "DDC I2C write timeout\n");
> +
> +               /* Abort transfer if it is still in progress */
> +               regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
> +                                  FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT=
_XFER));
> +
>                 return ret;
>         }
>
> @@ -179,6 +184,11 @@ static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *d=
dc, u16 uc_dev,
>                                                500 * (temp_length + 5));
>                 if (ret) {
>                         dev_err(ddc->dev, "Timeout waiting for DDC I2C\n"=
);
> +
> +                       /* Abort transfer if it is still in progress */
> +                       regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_=
CMD,
> +                                          FIELD_PREP(DDC_CTRL_CMD, DDC_C=
MD_ABORT_XFER));
> +
>                         return ret;
>                 }
>
>
> --
> 2.52.0
>

