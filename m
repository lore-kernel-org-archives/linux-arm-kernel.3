Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D31C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=; b=EzgO6UBSplvaeMXSh6hIN9dOds
	CJkr+YoxEke7lFUU+mcaPKdVZ2hKYYOW86LvIMKQYWDse75CHPc2irDCmw4THADiYXFdKrkAEeuax
	yymbt3qex0G3rYeQE9NEwF1/pLvkzaHj2z72R+3VJkUk6QhT01nQOcw/QsWBk/5lDCbq1Zwccp3zU
	WCfwtVt9E34wY6o6iwDuQsQMbGo73aXGdoRrBN1KyDrUqEssNxwFC+Eq24p54nR1mqX1tXeYiKnI5
	RZRHz5xSfS8M0AGZEjrt/FS2SDoXaWKkF6VlrAezwJihdKhabQXD4X16WqqZy6E12wnrmn/EH1Puu
	MukgHTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5CC-0000000Cw9g-0Gdo;
	Fri, 28 Mar 2025 08:36:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5AR-0000000Cvtd-0sV7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 08:34:20 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5992520a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150858; x=1743755658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=KWJKbKAVaXwEdBUGLlml39HoQO2nfNuWtzwSN6tZeSBVYjWne7K7w86ecVOsFSRTEI
         KEk0YO2J8KPpq8wrvGAmMi/6CIQZi5xznFWAtWxUy/HVxMvy4ioOyLyhDEX7KSB163Yc
         pvnwz1oirT7BsclJ34lG3TCRI0ApV2ALfRM3LMxGr0BvIiOhEhg3QeHA1A9aIdZsiFFu
         ol4aKN9QQ1PUVcrE+q075W9E8juSjU30GQSpehTcffeBiKU6wKOcIaZDp8caxIliPp2F
         UK+xsGNndK6M8WG+T7iIosy+Q+71RDgRpHKsVWsxoU5/DYFNb9YJvUB+SMNiSrBOrm7v
         SdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150858; x=1743755658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=HhX+GB/4v7mzmBlqV5frVQPadEGARuyX4eCGyDdcBoLop7XazIqVKIYeeWCcfBpsve
         V+vfQdN68VMnRkdx+Jp+nXC99f9NENuTyTUJFTBsVElpUdq6cJKIKWperm1yXX/PT6x2
         ht/NCHwvcMSRgRyYpwNcTaPqHc0l0HYpQJX29irqjam32BApXEgquZv0Dhnk0Lba7wJR
         LSbXWmWV17PzrfgdK182CyA9ay6BOs5n1CbzcXXavb2xArpYXrk93Jk1odhjbfiGI73G
         pLOdmWvvwgffrZ3Cphy0+wNUGSvHsDXAyW0wvg75AzkNbseianz56/oyZ5L4sAowLl98
         QC1A==
X-Forwarded-Encrypted: i=1; AJvYcCXDF54FXS+CuraDrmmGvxk5Jdwh+hCFjZTuxmO6gbLSJxxp8JecUCBHppuJWtxq5wQt8sAKhgLhbACXmbGA2he4@lists.infradead.org
X-Gm-Message-State: AOJu0YwUBsQ//Ot2F1hGMsX1y7LH9W7UkvZ//BMNeZstshv8AKofJUqF
	8VBWo15xRsEtLcAuZej1QCkeL3JMY5W2OSRaP6jO72UN/ASgROsR+FwdZR/1E2U3jgQ2sQHu6Xw
	OXXdjEUf6cL3EKOPXa6H6z18YGLI=
X-Gm-Gg: ASbGnctrQjnBaD3l8qYL+XnQO/WkKc/ARMG5mfOcNQzcorLHdyJFo3mgtSy4zAlOn9L
	g3lN7wjSKu8UEQ/QMJErv6bj1fyfGReB6grghcwY3R/TPWK57MRuvIpFZ2Iq1ItdTGKV/6EE6RM
	ZFGr9augrOut1HoFSUUOYnEQs=
X-Google-Smtp-Source: AGHT+IF11wwSuNqF7pUfzisNp2o2JHE+e/bTTG2jQulsEtYEXB9Y+0sNfCMi43CBuG1cp6jFC1ouNOKlmRa2RqKP3SE=
X-Received: by 2002:a17:90b:2f07:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-3051c889b0dmr3132648a91.7.1743150857908; Fri, 28 Mar 2025
 01:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 28 Mar 2025 10:35:44 +0200
X-Gm-Features: AQ5f1JpmDTleDRGa2oBcGXFZnflEOzTPa-iL5lCB0QpwZJnUePwDVEuepPhFb_8
Message-ID: <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_013419_248270_22F747A5 
X-CRM114-Status: GOOD (  19.44  )
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

On Mon, Feb 10, 2025 at 11:02=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Introduce `imx8mq_plat_data` along with enable/disable callback operation=
s
> to facilitate support for new chips. No functional changes.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - none
> change from v1 to v2
> - remove internal review tags
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-=
------
>  1 file changed, 46 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e824..b5eae56d92f49 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -62,6 +62,8 @@
>  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
>  #define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
>
> +struct csi_state;
> +
>  enum {
>         ST_POWERED      =3D 1,
>         ST_STREAMING    =3D 2,
> @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  #define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
>
> -#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> -#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> -#define        GPR_CSI2_1_HSEL                 BIT(10)
> -#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> -#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> +struct imx8mq_plat_data {
> +       const char *name;
> +       int (*enable)(struct csi_state *state, u32 hs_settle);
> +       void (*disable)(struct csi_state *state);
> +};
>
>  /*
>   * The send level configures the number of entries that must accumulate =
in
> @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  struct csi_state {
>         struct device *dev;
> +       const struct imx8mq_plat_data *pdata;
>         void __iomem *regs;
>         struct clk_bulk_data clks[CSI2_NUM_CLKS];
>         struct reset_control *rst;
> @@ -137,6 +140,35 @@ struct csi2_pix_format {
>         u8 width;
>  };
>
> +/* ---------------------------------------------------------------------=
--------

I would drop this line. It doesn't make code easier to read.
> + * i.MX8MQ GPR
> + */

Just say: /* i.MX8MQ GPR */

This pattern happens in a lot of places.

