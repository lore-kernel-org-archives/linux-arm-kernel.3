Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D56FD0047
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZTvtAwZO1+FpnC4sahu+Ix775HN1BzBQXegWiwPpQw=; b=0oLnN2XycIgDuadVmZYu9IpGdl
	ymAK3m1L2w3qOkJzhaIoMoirpgQMEp1smwUZmsNNlpInKpWCsTOefx2mTbjg8e4rGm0b1tlaSWhhs
	3qaQnbopZPseFAQOYIk6kGPlDNeWdP+2fmH1S9Ch3uVVo1FBHDrJVAcpsQeBYBQv1G7b3S/2+MRb7
	xD8PAfAcyyeOGXB32e2/8jXRSOS4l9KNa8duhAntcFnzaQTwu6QxB+19ArpF5BBemlMGbwjE8O8/r
	Q+5uhrlWfinPvTCMjsy5d4NGS49/sTdkPNXNnwBqLD5Nx93mm5fYvz2/zWyfRv3yZGQOBB5T8trlJ
	P4yHmEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwZqb-0000000ArdX-3jxW;
	Sun, 01 Mar 2026 06:00:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwZqY-0000000ArdP-3zq1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 06:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53F24600AD
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B09C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772344804;
	bh=QKni47SVW9Uu35RdotBA7722dJSKwDszVsr/Cmo+eIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UQ5nOPbvJlle9K2ewrCfaXDlMF3/CnrPh10KwTwRpi2D0LMPy+je0uCUAsvXqqNix
	 lNx1yibvd0/qry8SfG6cxIc92vbq+vTTo2BsKc9Ni21+ueStrli0CqoT2x3vO7wv4z
	 xZJQkCuee+gJYzc0nQQv5BImFGv0K7nVa78wqZ/ybG0/LD5jADhMXHodNnFsDMNM3I
	 qTGGD6i7GgbJVwIk7GAfN/1gtMF1ylZSJ44hKqogooCFEMOVpChR5774HprQPfjnas
	 WMpL/F/d6uJ59bZHAbJdiPXBeJTcH9Vz88oy9mhGxgLFgb0FFQAWDBV82LiWc+ANR3
	 kw+sJEtg4zm3w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65f73225f45so5532813a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 22:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPyB1Bk4AzIjFMAaK5Wd3MzUbTgY93TrIxkGa65pQD1TtWrSyfysmWpzUsDCo+/gDCcTu6dLGl5OAs/yHSKtNv@lists.infradead.org
X-Gm-Message-State: AOJu0YxZst+hX8RXQ5eMXOn7BVU3Mme45ZkZXAXf++lWIFZUlWORJYnR
	3k+kZoYettMdNYA+03EKzI06O2pxC/6OmMYEPNU5nryIfpXwJRhkbFDB0oOgexBgLN8RSAiCf9d
	OVom6y8OhQuQTCzNZDA1dFT2uL1ii+kA=
X-Received: by 2002:a05:6402:42c4:b0:65b:ec2d:e60d with SMTP id
 4fb4d7f45d1cf-65fde2d08c7mr5450438a12.32.1772344802355; Sat, 28 Feb 2026
 22:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20260301012606.1683431-1-sashal@kernel.org>
In-Reply-To: <20260301012606.1683431-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 13:59:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7QMmww2E2yZECuW=La0i3s1nKbbQvpODgPzrPci3f0HQ@mail.gmail.com>
X-Gm-Features: AaiRm50WuaIawTrIMUAzic5HCfeMGfAec2UkDWc3Lhbmb5tQfUpf37UwpYVyxss
Message-ID: <CAAhV-H7QMmww2E2yZECuW=La0i3s1nKbbQvpODgPzrPci3f0HQ@mail.gmail.com>
Subject: Re: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to
 100-150MHz" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
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

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:26=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I have already submit a patch for 6.12 some days ago:
https://lore.kernel.org/loongarch/20260218121219.2545107-1-chenhuacai@loong=
son.cn/T/#u

Huacai

>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From e1aa5ef892fb4fa9014a25e87b64b97347919d37 Mon Sep 17 00:00:00 2001
> From: Huacai Chen <chenhuacai@loongson.cn>
> Date: Tue, 3 Feb 2026 14:29:01 +0800
> Subject: [PATCH] net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
>
> Current clk_csr_i setting of Loongson STMMAC (including LS7A1000/2000
> and LS2K1000/2000/3000) are copy & paste from other drivers. In fact,
> Loongson STMMAC use 125MHz clocks and need 62 freq division to within
> 2.5MHz, meeting most PHY MDC requirement. So fix by setting clk_csr_i
> to 100-150MHz, otherwise some PHYs may link fail.
>
> Cc: stable@vger.kernel.org
> Fixes: 30bba69d7db40e7 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Link: https://patch.msgid.link/20260203062901.2158236-1-chenhuacai@loongs=
on.cn
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 107a7c84ace80..c05e3e7a539cf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -91,8 +91,8 @@ static void loongson_default_data(struct pci_dev *pdev,
>         /* Get bus_id, this can be overwritten later */
>         plat->bus_id =3D pci_dev_id(pdev);
>
> -       /* clk_csr_i =3D 20-35MHz & MDC =3D clk_csr_i/16 */
> -       plat->clk_csr =3D STMMAC_CSR_20_35M;
> +       /* clk_csr_i =3D 100-150MHz & MDC =3D clk_csr_i/62 */
> +       plat->clk_csr =3D STMMAC_CSR_100_150M;
>         plat->core_type =3D DWMAC_CORE_GMAC;
>         plat->force_sf_dma_mode =3D 1;
>
> --
> 2.51.0
>
>
>
>

