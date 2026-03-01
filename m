Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C565FD0055
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVGsXvoV9StiwJoHN3Pbd7IjrBXT0gROrT2DlxKt0HU=; b=U5Cj+rFj0X5OtD7I7s+NihItQP
	eA3yaHq5mQCkcQITH4W0XpA4BA/NeI0jokJYn9ehNi7x0Oh9Zfuz0/ax8YY88ZDvF8u9ZSaxyEml1
	USAXaDwJDjgXMgjJ3dF/hdRKHt1bXMeUmSyW8YYHaL5ncr/1vJRunUDZ48RNeEV6JhiZD+bnGCnW1
	DtdxW394yuhRkiEgcwR9ImK/OSZrYcrP7sEJAG8nDSNqc1oO6pQZ0ngOy5GEwUFoMRKZo6nLZgPWl
	fp0s0gjRpspJoTlVRfm/a7cmhwl7ZO5lUx8YCbg6E3KvrD3gJWahuVSnbbs+JAAnmJLtnhNAmKkEA
	1dGDP3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwaZX-0000000At1n-2zE8;
	Sun, 01 Mar 2026 06:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwaZV-0000000At1Q-2sCG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 06:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52FF640A39
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7F3C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347591;
	bh=c7yt7t1C7IKL+PTpcaEB7MdzhrMReQnLePjLzslok6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Smg8NnrELaPtnPQPrQHongBwDTvCU9ZD3AeAZ11USkiZjL87XgAkTGwZRlBjsmvAL
	 x8Ys5TRnpkAe7NCGnBr+zFJ4b+7gZhFTF7lz37kP+sXXAfRzTX4o/+AS7jcbUPVgL+
	 bY1D732eG3r6l/AyciB7d1y4ZbD7JaxAq3ymY8jU8PYRC9/7at4/BIgAMfHO65rmeh
	 pw1FIW3rrfGgGomcKF3wFah5AQQHhYtffa316hVhCkulpzcrUCf8BluChJC1gsyOpg
	 MZxwHoEMFPUIg48ejALTN+FtrRDI8YMSaBMUdvfvsgYFuueNALqb1o2F14YLRyQAhO
	 Xd8xDonEt249g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so6110490a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 22:46:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiYbKoRH9yPyEKsS9snVG8/co0/NRYSjqX3db32bzFVKBXTcXusrn5hF1c1B2ze/0M6pA8LyrZDh35WP1XdVgR@lists.infradead.org
X-Gm-Message-State: AOJu0YzaVQ+Sv3jv49QUlDiA2Wth5x5edBvsZU+tTWfrz0BWCaxxfav5
	m8pf1TWCEZyKd36W1q34d2WqE7widPPe6LuKezPXburkZy7dnW8Ru+hxAHDFjQAw/ebImR+RZ1V
	jvlbn6PYphLK2GuizkeGsYAv6X10P0jk=
X-Received: by 2002:a05:6402:f23:b0:65f:730d:8026 with SMTP id
 4fb4d7f45d1cf-65fdd6d76efmr3466140a12.9.1772347589719; Sat, 28 Feb 2026
 22:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20260301014529.1708098-1-sashal@kernel.org>
In-Reply-To: <20260301014529.1708098-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:46:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cxVAG3QKSDaUg-M-AYGMCVBqvUqnps52paScPMYO8Qg@mail.gmail.com>
X-Gm-Features: AaiRm507T7L922KCkjo9JPTmLoki11dW6Wc7eq38sLI5dzSAZfHwtLRzBf0YCu0
Message-ID: <CAAhV-H7cxVAG3QKSDaUg-M-AYGMCVBqvUqnps52paScPMYO8Qg@mail.gmail.com>
Subject: Re: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to
 100-150MHz" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_224633_775616_D845D02F 
X-CRM114-Status: GOOD (  22.93  )
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

On Sun, Mar 1, 2026 at 9:45=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I have already submit a patch for 6.1 some days ago:
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

