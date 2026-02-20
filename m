Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA41C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMtBjDynAUrdGXb65pAy82w5yT36ShqPLb+7ARA+3p4=; b=3MD1KfyrI+ttrM7W3jjtK/hyoV
	nBacESkWAAYF1Tll2pq+ILZtzpInz6D9QE6hVk5ES649cFJ2o84qBM85Jgk8egTGx0JQRyVxUNS7U
	sTk220gzG8fEXSKAgMiNltOeX9dVLjihj8QD6ydlmo+rJ4vCxEKqVdsP4L4qKrz5L7lMhT7LUDW0W
	5kE0Zahvyq7+AwUYphxsSlBepxIXD9VkwJN64p1K2hxzhA5vSOL9ee4ItL1QjJCxXKIV8c8uJUEmm
	HQPOCZryY5a93SZcQTfzRphcszlBQGkRTfQnkk8ooYyNF6+hwpP3Z1CJGXqlGDL55i7XCFmsg9cma
	pK6SrNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUEY-0000000FMrM-28NO;
	Fri, 20 Feb 2026 17:24:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUEW-0000000FMqt-163I;
	Fri, 20 Feb 2026 17:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771608235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YBCcT81WeOfR/jYm0ED2xKnwL1X6Nflt1qxXhPg6Nt/XV/5NEb0ibRJr4TzshY7mvg1Lve15oDVy6eDl+y912fQUDay4WLqVch+AF75puBK30G3EMwFNxav2mCfgWZQc5ADoU/vR3EeOBMrASyLICK6yXgnie1yl3MDJNCs9vT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771608235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VMtBjDynAUrdGXb65pAy82w5yT36ShqPLb+7ARA+3p4=; 
	b=fBgFi56qATptdpO05qbjDb5ZSnvvwkpOMun0WwiV5r0ErLAKyEBwsqHdcBxIJ14o9C0m+rA7olNxSCgCjHw++s8pFAdbrWMy7TrVT7d9OM4JGCDRp6XaFFlj02pWU3jFmUKX4VhtkuM6MS/P2+EbJaTK1hAP4sO4y+I1DPY6bgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771608235;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=VMtBjDynAUrdGXb65pAy82w5yT36ShqPLb+7ARA+3p4=;
	b=ODn65+XAYumAU3ekou2ZiBT0MogrLVMNvz3Xz+x88kywWuT8wiRY/1WcFOrfxMoA
	Quw6vTLy522rnvZf+Xkx36kGge9dQrvBktkz0F6Hy3LBT30IQdpeBg6Klsi27T4t9oR
	tl5rtHMWll0Q/kBnoT/gd0iHYVAQzuCknui1K5mk=
Received: by mx.zohomail.com with SMTPS id 177160823270486.7919574958737;
	Fri, 20 Feb 2026 09:23:52 -0800 (PST)
Message-ID: <6122f085216c03469bc93f49f3d76b2072c24e71.camel@collabora.com>
Subject: Re: [PATCH] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Cathy Xu <ot_cathy.xu@mediatek.com>, Chaotian Jing	
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Mengqi Zhang <Mengqi.Zhang@mediatek.com>, Wenbin Mei
 <Wenbin.Mei@mediatek.com>, Andy-ld Lu	 <Andy-ld.Lu@mediatek.com>, Yong Mao
 <yong.mao@mediatek.com>
Date: Fri, 20 Feb 2026 18:23:47 +0100
In-Reply-To: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
References: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_092404_368824_FCA2000E 
X-CRM114-Status: GOOD (  13.98  )
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

On Wed, 2026-02-04 at 10:06 +0800, Cathy Xu wrote:
> Disable new_tx/rx and modify related settings helps avoid data
> transmission instability, and better compatibility for mt8189.
>=20
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
> =C2=A0drivers/mmc/host/mtk-sd.c | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 302ac8529c4f..b2680cc054bd 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible
> mt8189_compat =3D {
> =C2=A0	.needs_top_base =3D true,
> =C2=A0	.pad_tune_reg =3D MSDC_PAD_TUNE0,
> =C2=A0	.async_fifo =3D true,
> -	.data_tune =3D true,
> +	.data_tune =3D false,
> =C2=A0	.busy_check =3D true,
> =C2=A0	.stop_clk_fix =3D true,
> -	.stop_dly_sel =3D 1,
> -	.pop_en_cnt =3D 2,
> +	.stop_dly_sel =3D 3,
> +	.pop_en_cnt =3D 8,
> =C2=A0	.enhance_rx =3D true,
> =C2=A0	.support_64g =3D true,
> -	.support_new_tx =3D true,
> -	.support_new_rx =3D true,
> +	.support_new_tx =3D false,
> +	.support_new_rx =3D false,
> =C2=A0	.support_spm_res_release =3D true,
> =C2=A0};
> =C2=A0
I've tested this patch on Genio 720-EVK board that uses MT8391 SoC, a
MT8189 variant.
I did not get issue with these new settings when using this board eMMC
(MSDC0) or microsd (MSDC1). I did not observe issues with previous
settings but as it does not seem to cause regressions,

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Regards,
Louis-Alexis

