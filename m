Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDAEE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjNu/dO08RmQiP600SqvVFmOniITWS6O4VWIh3tf+Sg=; b=4vl5oD0BNRg0bt/4c/7H8qybYG
	F6Ss0RDFJnONhL5JKXWyRV4xLKV7nYk9pimw3iYys5zxAAyor0bpPxySGhCWL5MsgRrhwfcCxAXVE
	0Enkby7cINZZRO0B0cE2r3sP+g0HTCUsuYosAAHMzDVMVD9A15RKFF05pVAWYMf5K2QOOaryT0OPp
	tzrtOf0bJn5KEExmZtomEn9hyGzqVMNqCPOd/yhMlSAQHwukFGqtdefaL12BLnloh3eGrO6V6JqmR
	UQJHaybUGhDaNuZKX+6jH/3VDj54P/NUqMSOlmaiCyWPxor1KUOm7jTmJWZoRjuKABSjbFU2uBwhx
	4Ud3iQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRba-0000000DsFB-0Dll;
	Wed, 25 Dec 2024 13:39:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRaM-0000000Ds22-39y7;
	Wed, 25 Dec 2024 13:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0018CA40449;
	Wed, 25 Dec 2024 13:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A974C4CECD;
	Wed, 25 Dec 2024 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735133881;
	bh=3vp4CKpd8ESTDsu6bu1UxWJdXeo8s2CdWgw9zFnQGyk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rXWfY6Ph5u9D6yUzFeU1G7WfxI5ZgDNOXUI1gEun9GVsBSpOIlLEbXgTWWpTEK+Ua
	 1Y5HgQClzhapskwF9tP2ytrHrrpIL+D4sSRKP/oKFZ2l/FTdFdiZcJ92hoiHlLqv+B
	 N+QI2+l46xGzTQxy7HIzz2kdBAQsaZYMc6lfA76hfFrT+peWdoJJkGgnOkhVShoX8V
	 +yT7sjumnB+Prl5eDAG71AcJKdM51gJaKD6bJv1byazGg7FQN4whRjZTVWIscmWZNv
	 WHfqUep5haiNm7XxAy9wbqKqR2hzrjC2gLnWuJtxIxOjLjPupOa2gZnBSr6E5eGMxs
	 twMobvsVMBE2w==
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so6329554a91.1;
        Wed, 25 Dec 2024 05:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9Xuy0kgUH8Q+Wyf0AOkNK1opvEPzfqWuzdKIdbJSh9R3lG/OOwfp0GSGPhKllLF2KRyYdhAZf9i4XpghhHxXv@lists.infradead.org, AJvYcCWrU5oQe+o9S3+Z7th/OFOZAZC4pdBp+RqVNPLGbFjuEr1vcDzgDX29bfXUAZJELV/fULB5FBtz83kmBcpldgc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh5IPLoBOUJXPErU5fYFYB54CbkuzcdRtmvNsjvF2gas1Ce0RB
	ipm+hY/WX451Pp1KSCbDCCci8YI9lzg2PdyWdWXhjr+PRIUpzrxjgPDtuNQDA54PbWahkF1rvfW
	+5HtnuVvGR+/NWrdFl3uyaDmtEQ==
X-Google-Smtp-Source: AGHT+IFnZi1NtQQv9dj8a3jgcoYTjJpfp/YWEkT5/4IPrfik/YKvJdKHM45+WkcKaOEyw9dWlTYx69mcNgYit5wx2V0=
X-Received: by 2002:a17:90b:2cc7:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2f452debcdamr32176458a91.5.1735133881217; Wed, 25 Dec 2024
 05:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20241128023733.16294-1-liankun.yang@mediatek.com>
In-Reply-To: <20241128023733.16294-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:38:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0cw+OEi7bq4QLdRE1JuLVRevgH6Rj7stT1H=RpD9dKQ@mail.gmail.com>
Message-ID: <CAAOTY_-0cw+OEi7bq4QLdRE1JuLVRevgH6Rj7stT1H=RpD9dKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/mediatek: dp: Add sdp path reset
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
	mac.shen@mediatek.com, peng.liu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_053802_929167_1CC5BB35 
X-CRM114-Status: GOOD (  21.34  )
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=88=
28=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> When using type-c to type-c to connect to the monitor,
> the sound plays normally. If you unplug the type-c and
> connect the type-c to hdmi dongle to the monitor, there will be noise.
>
> By capturing the audio data, it is found that
> the data position is messy, and there is no error in the data.
>
> Through experiments, it can be restored by resetting the SDP path
> when unplugging it.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> Changes in V4:
> - Fix align to the right of '('.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240925064854.=
23065-1-liankun.yang@mediatek.com/
>
> Changes in V3:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.=
22785-1-liankun.yang@mediatek.com/
>
> Changes in V2:
> - Fix build error.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.=
23728-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 1cc916b16471..4f4233bd83f7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1135,6 +1135,18 @@ static void mtk_dp_digital_sw_reset(struct mtk_dp =
*mtk_dp)
>                            0, DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0);
>  }
>
> +static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
> +{
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +                          SDP_RESET_SW_DP_ENC0_P0,
> +                          SDP_RESET_SW_DP_ENC0_P0);
> +
> +       /* Wait for sdp path reset to complete */
> +       usleep_range(1000, 5000);
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +                          0, SDP_RESET_SW_DP_ENC0_P0);
> +}
> +
>  static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
>  {
>         mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
> @@ -2397,6 +2409,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm=
_bridge *bridge,
>                            DP_PWR_STATE_BANDGAP_TPLL,
>                            DP_PWR_STATE_MASK);
>
> +       /* SDP path reset sw*/
> +       mtk_dp_sdp_path_reset(mtk_dp);
> +
>         /* Ensure the sink is muted */
>         msleep(20);
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 709b79480693..8ad7a9cc259e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -86,6 +86,7 @@
>  #define MTK_DP_ENC0_P0_3004                    0x3004
>  #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK               BIT(8)
>  #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0           BIT(9)
> +#define SDP_RESET_SW_DP_ENC0_P0                                BIT(13)
>  #define MTK_DP_ENC0_P0_3010                    0x3010
>  #define HTOTAL_SW_DP_ENC0_P0_MASK                      GENMASK(15, 0)
>  #define MTK_DP_ENC0_P0_3014                    0x3014
> --
> 2.45.2
>

