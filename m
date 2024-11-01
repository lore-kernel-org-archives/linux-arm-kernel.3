Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3050AE67499
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go4mtHQykmlWp4vclsuDHc2ni+VMGXx/GypLE6dY+gs=; b=f43+7pI0mHB/lP1tMX2y95Qc4u
	6o642H9gwlEGL/THiUSf8cpPpqatRUcNzQsQjVCC+xW/tBcIq7RvmF9XDQBfXTIY8GNOBkMqq4qdd
	1bS9Im1JDn6fOV9GRTIRUzI6XTM5+cbnGaqyKLT9LMV2PiT7EvHE+6FvM2PX102485DqalmUYW/Vm
	BRuo1vGa/dqpyBnC624lQe64R1JCxboS58nPh75ZZDrSNyHSTqCoU/DYcpFoJbe/A4RCniTTPFCxk
	Exo90yZJwEddvMOL7vjFyq3CVu5+YvjPn4M6FLp6tv7suLPyf2GzLS7ttgAsHzsSvMvudIkm9Sjfa
	WLG0+JHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nZ2-00000006Lbe-10uw;
	Fri, 01 Nov 2024 09:03:28 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nXL-00000006LKR-2Mvl;
	Fri, 01 Nov 2024 09:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730451697; x=1730710897;
	bh=Go4mtHQykmlWp4vclsuDHc2ni+VMGXx/GypLE6dY+gs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xIoTN7oF6JOMzCKFMU0XKqfiac9rzToMym+yjvSYUQM75UiJgCZqKOqE4QzMtePz5
	 70Hu4RB4RuOxuFtLZ70VJsMXPuEqQ4miNSXevbpwS3INa5kdj3UTLlhBVD1WwNCMZL
	 o2OTU5OgrjZOSnFPj1YHGrkhNzecnRlmtIXoqPRVvVZgUTZR/RJE8Lyyhj7Ur7AJ3l
	 ogN0G87pGd/XuZhplZJmQiT3pAV2Ye7+3ZzlyrVyezj4p2nys5brfeB13eLWnBd+Hg
	 Hz1ZnINuN16H0aNF95dQX8sc8LpfG+zMuy/rbdscl4hoTjcDL3sxgUOmAmerQZu/+1
	 0TgF839GXHZBQ==
Date: Fri, 01 Nov 2024 09:01:32 +0000
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-apmixedsys: Fix an error handling path in clk_mt6735_apmixed_probe()
Message-ID: <882779be-6d8f-441d-89ea-f8be79ffd3ba@protonmail.com>
In-Reply-To: <89ad840e7a484eaf4727470824acfe0fdc60fcef.1729871146.git.christophe.jaillet@wanadoo.fr>
References: <89ad840e7a484eaf4727470824acfe0fdc60fcef.1729871146.git.christophe.jaillet@wanadoo.fr>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: e77f34d9023207e3b609739a38960c2a439f5ca0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_020143_785182_97F58D95 
X-CRM114-Status: GOOD (  14.24  )
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

On 25/10/2024 6:46 pm, Christophe JAILLET wrote:
> If an error occurs after a successful mtk_alloc_clk_data(),
> mtk_free_clk_data() should be called, as already done in the .remove()
> function.
>=20
> Switch to mtk_devm_alloc_clk_data() in order to fix the memory leak in th=
e
> probe function, and simplify the remove function.
>=20
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main=
 clock and reset drivers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt6735-apmixedsys.c
> index 104722a61dfd..e0949911e8f7 100644
> --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> @@ -88,7 +88,7 @@ static int clk_mt6735_apmixed_probe(struct platform_dev=
ice *pdev)
>   =09if (IS_ERR(base))
>   =09=09return PTR_ERR(base);
>=20
> -=09clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(apmixedsys_plls));
> +=09clk_data =3D mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsy=
s_plls));
>   =09if (!clk_data)
>   =09=09return -ENOMEM;
>   =09platform_set_drvdata(pdev, clk_data);
> @@ -114,7 +114,6 @@ static void clk_mt6735_apmixed_remove(struct platform=
_device *pdev)
>   =09struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pdev);
>=20
>   =09mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls)=
, clk_data);
> -=09mtk_free_clk_data(clk_data);
>   }
>=20
>   static const struct of_device_id of_match_mt6735_apmixedsys[] =3D {
> --
> 2.47.0
>=20

Thanks for the fix!

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>



