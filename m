Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF07CEE4983
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPxRQVMusVzv4/Tc365sITOUHWPp/oT1iQzYjU831vM=; b=OfwVGxseIPWZUMjJQ3EQZPXzdX
	VXfnwkSf0Fl3m3STcPIP7UmJmX3eGbsEjbSOGbZtYz1u096s38aBJW/Yq+ulD8B8/dD07e7JBtO5L
	59dogSRSFudLDwZqUifxv6LHPSjSKkgRTo8PYFXpg+As3WhvYxHWTKHvOrfQH2NiPXeVpS3OKpMal
	JGOWECvaM/9607ncr5EMB7c9QkO6B28R/jwEzOAKc6Ni85Z1fLRTGtY3/Xf2gvwbBzjRHQB0irPcc
	di1zWxyzB04jghMPWYPZ2YhyLZibbQrm8wkTvPFAYK5FgiMngDMCbJgTQCdERb1SZr/iMXMLW77UV
	NQ3QQ0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacBD-000000051yl-1Sa9;
	Tue, 30 Dec 2025 16:02:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacBB-000000051yB-2ScL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 16:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA9476001A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 16:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB0C19424
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767110556;
	bh=NPjKWZl3F/C880fbiKsWDsk5945qOlkdDUPRyzC1bPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V8q7DRalR5bNPPzar/zJLOqMms5IjWqEa+TBjQmw4Ef28iVjl38SviVgtZhYnTc8x
	 ulQdWujbEBRUQnt1jI0TeTExNHeDTTy+wcEVsAeDIy5SZS6aQLRf2o36RQlURiGrbV
	 G/FbA9lgPp/6u74gf6koTqtk+UDigrNB3dRayVyj2r1kidzH/POJ6BpGWbjefXlc2A
	 j2zVoWVEL1kRmpWCENftcHR/Jv7oV214vT4XJWynCMGHU6XITZUajmMSuk9gowcsip
	 0RNJ0R3KgolhwSF9v3bI/kwW0642HnYFremxlPBoa02G61T3et7CWbBnWTM5rte0yO
	 xNopqqLLoeUWQ==
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0833b5aeeso137229355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 08:02:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLuDjS07FIREmu2mk13jV55ZHzzyX/XiRRxY64F8qks2GoZNDwqH06T3ZHa9RsVB5glu9gvzR2EudK8FnSyJDN@lists.infradead.org
X-Gm-Message-State: AOJu0YyGFYFk8PiVKmH0uLPJ4ujAcGW/NPEvwBo0U50F+Z6be+/Jm6di
	OmxT/IWsYi46QXMeyT1zzoWv3VoWZD9ulYjXbMyWE/wU8LEwBHTgqYYsppNN8/ab1fKpJhix9W3
	SjUKnR6pnOFHHcdv8gr3o7gl3OAwwxg==
X-Google-Smtp-Source: AGHT+IGMRaWsic/nhXDJIveL+x/Tq2M1SLeDqyHEFNdrIO50jJyYZjA3Nj8+8iOTAWqgGBD2zKZFF0+L0wOakRVsZ7I=
X-Received: by 2002:a05:7022:2526:b0:11b:9386:826a with SMTP id
 a92af1059eb24-1217230352bmr33765799c88.47.1767110555798; Tue, 30 Dec 2025
 08:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com> <20251205-mtk-hdmi-ddc-v2-fixes-v1-2-260dd0d320f4@collabora.com>
In-Reply-To: <20251205-mtk-hdmi-ddc-v2-fixes-v1-2-260dd0d320f4@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 16:02:23 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-zPCQJLXwejQnjk-G9dK2x1yEG-Cukgb6XXG-+abdb3g@mail.gmail.com>
X-Gm-Features: AQt7F2pwq4tenmqmtGjSeHsx0uThcKmsmR0giEFXsToJfZyMmhpUO49pQTrpv5U
Message-ID: <CAAOTY_-zPCQJLXwejQnjk-G9dK2x1yEG-Cukgb6XXG-+abdb3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: mtk_hdmi_ddc_v2: Fix multi-byte writes
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
> Currently, the mtk_hdmi_ddc_v2 driver sends a i2c message by calling
> the mtk_ddc_wr_one function for each byte of the payload to setup
> SI2C_CTRL and DDC_CTRL registers, and perform a sequential write
> transfer of one byte at a time to the target device. This leads to
> incorrect transfers as the target address (at least) is also sent each
> time.
>
> So, rename mtk_ddc_wr_one function to mtk_ddcm_write_hdmi to match the
> read function name (mtk_ddcm_read_hdmi) and modify its behaviour to
> send all payload data in a single sequential write transfer by filling
> the transfer fifo first then starting the transfer with a size equal to
> the payload size and not one anymore.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 48 ++++++++++++++----------=
------
>  1 file changed, 23 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_ddc_v2.c
> index 6ae7cbba8cb6dacf46c2f7ab74a2d7446d698b69..d937219fdb7ee0ed6a4ac25e9=
50f69f90ff431a3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> @@ -66,11 +66,19 @@ static int mtk_ddc_check_and_rise_low_bus(struct mtk_=
hdmi_ddc *ddc)
>         return 0;
>  }
>
> -static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
> -                         u16 offset_id, u8 *wr_data)
> +static int mtk_ddcm_write_hdmi(struct mtk_hdmi_ddc *ddc, u16 addr_id,
> +                              u16 offset_id, u16 data_cnt, u8 *wr_data)
>  {
>         u32 val;
> -       int ret;
> +       int ret, i;
> +
> +       /* Don't allow transfer with a size over than the transfer fifo s=
ize
> +        * (16 byte)
> +        */
> +       if (data_cnt > 16) {
> +               dev_err(ddc->dev, "Invalid DDCM write request\n");
> +               return -EINVAL;
> +       }
>
>         /* If down, rise bus for write operation */
>         mtk_ddc_check_and_rise_low_bus(ddc);
> @@ -78,16 +86,21 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u=
16 addr_id,
>         regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
>                            FIELD_PREP(HPD_DDC_DELAY_CNT, DDC2_DLY_CNT));
>
> +       /* In case there is no payload data, just do a single write for t=
he
> +        * address only
> +        */
>         if (wr_data) {
> -               regmap_write(ddc->regs, SI2C_CTRL,
> -                            FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
> -                            FIELD_PREP(SI2C_WDATA, *wr_data) |
> -                            SI2C_WR);
> +               /* Fill transfer fifo with payload data */
> +               for (i =3D 0; i < data_cnt; i++) {
> +                       regmap_write(ddc->regs, SI2C_CTRL,
> +                                    FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ=
) |
> +                                    FIELD_PREP(SI2C_WDATA, wr_data[i]) |
> +                                    SI2C_WR);
> +               }
>         }
> -
>         regmap_write(ddc->regs, DDC_CTRL,
>                      FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_WRITE) |
> -                    FIELD_PREP(DDC_CTRL_DIN_CNT, wr_data =3D=3D NULL ? 0=
 : 1) |
> +                    FIELD_PREP(DDC_CTRL_DIN_CNT, wr_data =3D=3D NULL ? 0=
 : data_cnt) |
>                      FIELD_PREP(DDC_CTRL_OFFSET, offset_id) |
>                      FIELD_PREP(DDC_CTRL_ADDR, addr_id));
>         usleep_range(1000, 1250);
> @@ -260,24 +273,9 @@ static int mtk_hdmi_fg_ddc_data_read(struct mtk_hdmi=
_ddc *ddc, u16 b_dev,
>  static int mtk_hdmi_ddc_fg_data_write(struct mtk_hdmi_ddc *ddc, u16 b_de=
v,
>                                       u8 data_addr, u16 data_cnt, u8 *pr_=
data)
>  {
> -       int i, ret;
> -
>         regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
> -       /*
> -        * In case there is no payload data, just do a single write for t=
he
> -        * address only
> -        */
> -       if (data_cnt =3D=3D 0)
> -               return mtk_ddc_wr_one(ddc, b_dev, data_addr, NULL);
> -
> -       i =3D 0;
> -       do {
> -               ret =3D mtk_ddc_wr_one(ddc, b_dev, data_addr + i, pr_data=
 + i);
> -               if (ret)
> -                       return ret;
> -       } while (++i < data_cnt);
>
> -       return 0;
> +       return mtk_ddcm_write_hdmi(ddc, b_dev, data_addr, data_cnt, pr_da=
ta);
>  }
>
>  static int mtk_hdmi_ddc_v2_xfer(struct i2c_adapter *adapter, struct i2c_=
msg *msgs, int num)
>
> --
> 2.52.0
>

