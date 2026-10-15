Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B1CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrxfajdvFmJtNiWzGN9eypZ6XVjairWUkY35gVPYWFY=; b=OSumOi+NTEbAzf3gUKz1c9XEmb
	LTeNgbf1CuAoXne/aaPJ3Q7Fl+nihAe+aYHu1gMgGd6LKenYPIryMVoDCCPJk6P19lWJ57vQT9Ymu
	TjIzjqSmvXK74m6vsCgLPyrRbOppV0FB1IeugD2bFVKbb8LfQaxNnTu/HUnBm81jGbqTLKfDqm8yT
	N3JQYaGS6CqhoMwPq4YBmmEYirxfWBTzoSxfaor99yeYywPgsccjyQKg5quszjHeeAb2M5Jf3iIZh
	8LyngPOgNFzp6NkgiYG9PltN1nallPc2Gz8byBFUHfppY35W20XrtqjZypvrZwunc54KAcoSCfT2e
	LLjGtBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGmZ-0000000H8xS-2hvP;
	Thu, 15 Oct 2026 08:25:47 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGmW-0000000H8vi-1uGN;
	Thu, 15 Oct 2026 08:25:46 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 13CB7202012;
	Thu, 15 Oct 2026 10:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792052741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrxfajdvFmJtNiWzGN9eypZ6XVjairWUkY35gVPYWFY=;
	b=fjAlKxqUKEH8jDMC0qtq5+KAH4+tBauqPTL5mgqFtf1eXTbMOYh493KztS3VNdSIxr6Gpm
	3OyLym75xe3LmZzhue3ZISgGsWRTdl56TTUB3l/bN5pxSjSObR3Bgb1XV0CCH6ZlsqZxdl
	Q1vqqEy5saF0FFbI9guNa+CkUj3k5fzmt10wXmwsgx8CZuGVv/7kurXmnv6iUP3i04koZ7
	pA10xsAN69Csf2p8PQwOLHHjpJMgvnf7TlulDBR+ROUR2yCzFifogTk3+V/S1MVbDhv3cd
	XTyfKHfG9HVAaZJuHkoHGQuB2DxHMtD/2F78oz/T1AV5hZPsteEffP/E6zpmNQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792052741; a=rsa-sha256;
	cv=none;
	b=CT0ayXFWM58Zj9nkLOzhw5fsBgfii9zgnV38JiL/MHcgu5b5GUN0Rb1KK+3920Ffnk4ePs
	eGJ50jkBCLreOItbCaO5qIfjkh13Jexqo16kWXkxKpEYq0Ft2C5AhTLZGly3pqS3YtB9fc
	vh4QFalCX2LZphi/XPdpZf/kPF86gfJLkuKuBo29Q3xawIYH/1p+fe299+F3GjsUISVoLd
	1EeQqsqE6R4AG9HsQhnap03Q06m0oiDdCbBax24eRfTlsVCrzBCYxxwn/DlJmL566O6Cky
	YXHVNryQonz2XWWog+Il/YcKBBJELPnHOApCghSdFR87nMLoAcq8ShPYJaIB4w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792052741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrxfajdvFmJtNiWzGN9eypZ6XVjairWUkY35gVPYWFY=;
	b=VHChhYmOypm0trb/T3G7ioVgQB3Gk+9RkxCOM9hSbJmABlyKnlJMMyZLA286oOH02dFZiM
	MAsPWPd2+Et6AaLPnrNWgnZqHb5Ohsdk5U9avr5zPYn6GJxjHxxmN2+dbpeO7CA4tFVF8l
	Y70B0Ol3E/3iBb4CjXW8Xje6tITRAsonYInrkW9ZRcMmJX1LGj0iIca/LBkG0K2rMzp7pp
	ch7IR3aTtYf8GiVhCFrT6Ldw6m3Lzr5nJ4m1/PBcopUBYeHHmmbJQ29/rgURvxl+KLfVyv
	TxUUA7+qW9x0jA9rnDvti6tAfSG+bAhx6v3kqD3qbjN3gj50L+iLTFt5GjK+fA==
Message-ID: <20cc437c1e95aca578ac814c2e0f4f0f3ddd71d4.camel@pengutronix.de>
Subject: Re: [PATCH v6 09/10] PCI: dw-rockchip: Add system PM support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Lorenzo Pieralisi	
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko
 Stuebner	 <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Shawn Lin	
 <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 15 Oct 2026 10:25:40 +0200
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-9-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
	 <20260908-rockchip-pcie-system-suspend-v6-9-fbabcca9921b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_012544_797424_85908954 
X-CRM114-Status: GOOD (  19.56  )
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

On Di, 2026-09-08 at 16:51 +0200, Sebastian Reichel wrote:
> Add system PM support for Rockchip PCIe Designware Controllers.
>=20
> I've tested this on the Rockchip RK3576 EVB1, the Radxa ROCK 4D
> and the ArmSom Sige5 boards.
>=20
> While I haven't experienced any issues, most of my tests have been done
> without any devices attached (i.e. default board without any extras), so
> there _might_ still be some problems. As system suspend does not work at
> all right now, I think it makes sense to get at least the basic
> configurations working as soon as possible as it will allow us to catch
> regressions by enabling system suspend in CI systems like KernelCI.
>=20
> Co-developed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 100 ++++++++++++++++++++=
++++++
>  1 file changed, 100 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/=
controller/dwc/pcie-dw-rockchip.c
> index 47d9cab909bc..e675918ba184 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -120,6 +120,7 @@ struct rockchip_pcie {
[...]
> +static int rockchip_pcie_resume(struct device *dev)
> +{
> +	struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> +	struct dw_pcie *pci =3D &rockchip->pci;
> +	int ret;
> +
> +	if (rockchip->data->mode =3D=3D DW_PCIE_EP_TYPE) {
> +		dev_err(dev, "resume is not supported in EP mode\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret =3D clk_bulk_prepare_enable(rockchip->clk_cnt, rockchip->clks);
> +	if (ret) {
> +		dev_err(dev, "clock init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rockchip->vpcie3v3) {
> +		ret =3D regulator_enable(rockchip->vpcie3v3);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
> +
> +	ret =3D rockchip_pcie_phy_init(rockchip);
> +	if (ret) {
> +		dev_err(dev, "phy init failed: %d\n", ret);
> +		goto err_disable_regulator;
> +	}
> +
> +	reset_control_deassert(rockchip->rst);

Missing error handling. This is inconsistent with the existing calls in
rockchip_pcie_probe() and rockchip_pcie_rc_reset_root_port().

regards
Philipp

