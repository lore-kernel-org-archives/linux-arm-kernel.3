Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD657C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnLI7TEbgPq4uvBO5xH2GP7XBad6KtOS6WYu+5UVOJ0=; b=hsUwwTBFQDUqWE96376b+UC89X
	yXQNEflPCnBETTZ57J338MYU6YjirqoPP1dwC+vgkONyqXrIccYGwLzJu9QQk+j4DuIj8/ZWzRM3h
	0pGaT0wyxkZAc6qFu6uY1ao4N6X0Qm9uxfqOQT60eOjqfkMMj4hQ7vzUcvdvFmozmr1kQiqyF73Q4
	dQUzUuz9wfyOth25OWah4kNAWSNfygZ97NA1CtHE8EGSLiAs8U7gbGq4NGT7GP8SCpxgJ3qmYnczQ
	mpdpmnDWhvr7CrWgD1cT4QGI0kTPS+dWrte8omUO5Z8Qz9f0buIWJXpHA6KYPS4DBq7c5+nEDMORv
	SXUAj9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOux7-00000006H8m-1dYu;
	Tue, 10 Jun 2025 09:07:29 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOurJ-00000006GHc-1EQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749546089; x=1781082089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rnLI7TEbgPq4uvBO5xH2GP7XBad6KtOS6WYu+5UVOJ0=;
  b=g09+G9Ye6hezL/buG/GiPt2ev78Zr81zuLFb5ZwiXJQ/ehZzpKhUea31
   09pXmHtg6kyEgkxc4bLoWt1h4UUNpWXCyacKijJMOCLnIGu8YQnZBn7Bp
   9/4oDEpveTLcwquO2TOIuu1g3UI1yc+kQ4rhXcf2nFA5wa2t3j4axJcR1
   qBuodcAer+7fdcf/tDZAk9+2qZgR8b9M2jjUxrflE9sM28cIreWVehugj
   hY8XgIDHQ2KOfbQiN4cKyROHk/e5H3JosllAULqvpG5bboDygNUkExkST
   dPsiCf61Y3kvlQtgGTxnHIKpjBPZmdrO331pKOaWAwG6hyVJrNIQi7wdd
   w==;
X-CSE-ConnectionGUID: qsLaku8rQHWS/0zt8iU8WA==
X-CSE-MsgGUID: 9oC+BWqpTBmF+rrgHY2/jw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44539639"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 11:01:26 +0200
X-CheckPoint: {6847F466-48-28ACC837-DD1065DB}
X-MAIL-CPID: D24F495A4208874E3BDE2DAAB3DC2DE9_2
X-Control-Analysis: str=0001.0A006377.6847F46F.0022,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997BF166475;
	Tue, 10 Jun 2025 11:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749546082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnLI7TEbgPq4uvBO5xH2GP7XBad6KtOS6WYu+5UVOJ0=;
	b=EVMgaWV79PJusbQbTNgGwIDCOI7bvZmFxG8Zaj5vg7cxW1O0j00284tOZCJ8AtR7LXT0Po
	yLdoBz5u3ahQOX+O5GiaXtIRidZdVh5kTRJ9yJJlVrIjHTdDjVXMCXGpcCDIoCpOIiNYd0
	mP9SfHZPYIxZXPZSLMKt2cHb6w9xDbFH/G9QHaZYSSLFvk9oJgIWs+f6cIjv9PmSAbWWtT
	qSwlw3HGCMjvWo+TJeTVRFmsxvUgGFuran1BJQGE/fOFAAgd4TAJ3XDp/zSYzcS5qkZquG
	rdYmpbTZp/BqXaUC7eCWydnNUrhzTuIzRPamdJA7EMUdt7nhxx4rX0M9Q96Ybg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] media: imx-mipi-csis: Initial support for multiple output
 channels
Date: Tue, 10 Jun 2025 11:01:20 +0200
Message-ID: <2230307.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_020129_833413_D3D61088 
X-CRM114-Status: GOOD (  13.18  )
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

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:40 CEST schrieb Laurent Pinchart:
> Some CSIS instances feature more than one output channel. Parse the
> number of channels from the device tree, and update register dumps and
> event counters accordingly. Support for routing virtual channels and
> data types to output channels through the subdev internal routing API
> will come later.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 224 ++++++++++++++-------
>  1 file changed, 146 insertions(+), 78 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index 080e40837463..4cc358d93187 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -98,12 +98,12 @@
>  #define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
>  #define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)

As a side note: I just noticed Bits 28-31 are only defined on i.MX7. They
are reserved on i.MX8M (Mini, Nano, Plus).

> -#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
> -#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> +#define MIPI_CSIS_INT_SRC_FRAME_START(n)	BIT((n) + 24)
> +#define MIPI_CSIS_INT_SRC_FRAME_END(n)		BIT((n) + 20)
>  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
> -#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((n) + 12)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((n) + 8)
> +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)		BIT((n) + 4)

Similar here. Only i.MX7 has the bits for CH1, CH2 and CH3 defined.

>  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
>  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
>  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> @@ -205,23 +205,23 @@
>  /* Debug control register */
>  #define MIPI_CSIS_DBG_CTRL			0xc0
>  #define MIPI_CSIS_DBG_INTR_MSK			0xc4
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
> -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
> -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT		BIT(25)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE		BIT(24)
> +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)	BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)		BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)		BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)	BIT((n) + 0)
>  #define MIPI_CSIS_DBG_INTR_SRC			0xc8
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
> -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
> -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT		BIT(25)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE		BIT(24)
> +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)	BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)		BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)		BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)	BIT((n) + 0)

Out of curiosity: Where do these bits come from? I can't find them in RM.

Best regards,
Alexander

> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



