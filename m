Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C8FD0055
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 06:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faepIDOVsrKlDsuenkj3kaRDJx3WSLGjGgblO/Yfu1k=; b=QX8nxmPJhPwTgkEjgl39PiU9mT
	O5OXTFPdPqOj3SEmbVg7QuC37i8apYKGoIQGiigU3voLoSox/J6GCgfkCGwf3nPv8NVIQbWiR2Vb7
	0/WjRrzO/QRfnjRit91SubBKJmBuyqt7UxLbNjJ9Kr92ry0jUWASFpgK98JE1phUFUAWc6zjF/jT0
	Q+yQ8tS4Q35tq8MyfFNka+f7tGAvsVGxG9JC9WoyTajAitQWK+N5aI44c6xeXgYvK2Y5T09c0B8TQ
	gDnqhY9NuuD9zu7OsXmwnBcqx3wdVvNK2fvK5t0Q4xdlXE+SgvDVCD0RlNbrcenlC78oQq7tkCsQO
	5DTwxKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwag8-0000000AtGQ-23cu;
	Sun, 01 Mar 2026 06:53:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwag7-0000000AtGJ-1trY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 06:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE0FF600AD
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63665C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772348000;
	bh=uBz5/DsNTkQF53CTWrzktdKlRSarb9rE0O45U+rT51I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hHe0qPKqlA2jRVjg5vABP2Aa6hNExBjEIedvyNDQZXuI7E+qTe5af0cTSaWg6BS5w
	 ssd24632XDM6/aEhP9EXoJ/rM+sMNvu5NLZ8F7aPAg9nCBOYI81O4knii0Qd46Gq6/
	 HYPxI3Ku/dctrl3SUfMZX+8G5fQgWoA6BffzdVMMh0NTn9Z/1+6NIavwQPJQWDmSlz
	 booQh/xG8Szq7fWhYzrIWYyqG8wZxOphFwhbgV5b3mhA98kNIIhb4GSF9pjbnS0+QW
	 toXEgIQK4QvCMMj8OFd1xQ6eGUMIQsvCMN9HsGV5X8W5OYRcwgdrHph+V/75AfFzf+
	 xNld2+Z7uzHug==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so5419338a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 22:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrVB0e/RoeyimugmuT2v6Io9EPoM7qIsFblP+x9aTc308jMuoe0jmImDV+COIhx0laTJsv8brX9Dbagl3+pOyr@lists.infradead.org
X-Gm-Message-State: AOJu0YwMGAMstTiOJnlSZV1DO4DkjTdLtibtnIdwHcboIGCCIXqPrPzN
	UGjyfe63gt3Mr8oQixCw70FJ3FO7bb0jl28EWcTlp1Y+KUPH1J2VypA4nHd9b1OPaFF9kSMhBfo
	lylfhphku69Jw7yx5UKvB7LhSD/LwrqY=
X-Received: by 2002:a05:6402:4493:b0:660:475:93f2 with SMTP id
 4fb4d7f45d1cf-660047594bemr3098193a12.18.1772347998875; Sat, 28 Feb 2026
 22:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20260301015348.1720657-1-sashal@kernel.org>
In-Reply-To: <20260301015348.1720657-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:53:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7CpjDY29zPB60d8Ct2NWRrwGf+tJ52oYCL3fjRPEkEDA@mail.gmail.com>
X-Gm-Features: AaiRm50zfa7_kKX2hukVQSNRYw5_Ic-T65iYr0aa-JHwjvscZiMEXArH3ZD0ets
Message-ID: <CAAhV-H7CpjDY29zPB60d8Ct2NWRrwGf+tJ52oYCL3fjRPEkEDA@mail.gmail.com>
Subject: Re: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to
 100-150MHz" failed to apply to 5.15-stable tree
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

On Sun, Mar 1, 2026 at 9:53=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 5.15-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I have already submit a patch for 5.15 some days ago:
https://lore.kernel.org/loongarch/20260218121310.2545149-1-chenhuacai@loong=
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

