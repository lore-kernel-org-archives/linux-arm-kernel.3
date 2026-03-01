Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB69FD0055
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 06:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBkDg61vZtxvU0Yc1WqUfv7iJi1lTFb+bu8N0vy8big=; b=2CsJ4xDwoSqMrrSCw+5sE/kqUw
	mE7FoWr+QtHunh3OOUlmLTRfhQLS5c4+1FqIfNZczOU3wNyB91cS1iIQz30yMT0v3QRVy1vtlDeHA
	s65HjFhM8BPMEx4adr1C/LTYBXljbEkU0bChvnp7qp3F72uKhDXCFDlzJ3Jpum8xl/DCgD59h/nRL
	r+aZZJdMF5fYqFZ6sh5DDrLpjSraw2qU+TPqX6MVF1Og9vojf8F/fjJ+kmRUVYgdc6dgH66Vxq6a2
	QXVK6WhjrsHnYaNoZk2+H3lUbljuwU9MHUInoG1UWkoVb54gj7wlHFPrPvBKRRqFe7oxaXlqWC4Jj
	uWfrbDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwaRh-0000000Asjd-3BPS;
	Sun, 01 Mar 2026 06:38:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwaRf-0000000AsjX-3PgM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 06:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9265E600AD
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BDAC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Mar 2026 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347105;
	bh=88o1axfZfrS6umlnTLtfz3bDCQajM1uVbt0V0dlisqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eh7RsHVp1g/Z1qcHgubqF6DXl8bQjKKE7PbYqa8WF7bj1cN24BrlV9NMRJIpT8Fzn
	 rdo5YlnHfNjL6nbaP1dTgIxaLlwRZyqtQUEUE7hdWT3kdBxt4t5uq0FLvZoa/oGc7p
	 RrMZZl+PDUmcKc3WdgxiPswLqci5+Wm7CwRtvibqtGHkldmNvf+7dAXNrDJQRBfH63
	 M2urp4A+n3Z+EBpgHzuvCCpED0ckoJ4DQTG/0plIw9ShtjUPy2MmzZlJ3HlfsAH4Yr
	 6C6WpVBClxE88MAnquoZi1hPM1/sDrE7hOZIlfOvXyHKq0V7TKRxL7JOB13+kCvHvU
	 Oxbes9npHG/ag==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so5411232a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 22:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVN1kjxUxwuehcriYXyI4tcXjOASZo55NAO/2XxXFGVLtpB4PexhqAsgABNW6PzI62KKx1O/vszyNHujoTttdo@lists.infradead.org
X-Gm-Message-State: AOJu0Yymt6MaJ7bBfW4mYN/9fBg5CZxEsqsSN3gEOrYgjCWS0VXosShw
	K8huVgtKrHKyBIvAldkbgEve4C3dChKV4OXRVdi6w9eyDo+jJ7C7gyyckSuPmOsO5GlWKg8Iawh
	yV4Y4llhpW+AzvTL5JFNwMWC2yn5fftE=
X-Received: by 2002:a05:6402:26c9:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65fdd6be020mr4850268a12.6.1772347103783; Sat, 28 Feb 2026
 22:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260301013640.1696690-1-sashal@kernel.org>
In-Reply-To: <20260301013640.1696690-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:38:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qU7GSJRMPm3253dRB97mvhKOH6m_GGjA4b-itDz384A@mail.gmail.com>
X-Gm-Features: AaiRm53sz9DVhIh-5fus-ezv4_hsXvql4TrfiX1Xpwrvt367E5_JQhQdXVmr2Oc
Message-ID: <CAAhV-H4qU7GSJRMPm3253dRB97mvhKOH6m_GGjA4b-itDz384A@mail.gmail.com>
Subject: Re: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to
 100-150MHz" failed to apply to 6.6-stable tree
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

On Sun, Mar 1, 2026 at 9:36=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.6-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I have already submit a patch for 6.6 some days ago:
https://lore.kernel.org/loongarch/20260218121242.2545128-1-chenhuacai@loong=
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

