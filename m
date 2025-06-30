Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32814C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTJWDoX6+dZpqVbCI05HYOZjmWwxTYx7suIMcGN7BKI=; b=ndCrGc8gLVrEsowvPT+kuIyQzG
	x4mhpSp3bzwj9bz1ca5tSx9/VEq12rIHoyGG9kVrZSAwaf4JGwrxXbf/0gjNDduc6ArDWVJFGMGe3
	NqwnLMP2xWsF6B3IG/mx9htslI/6O9vK60ZeTQopbrA+wXzJ1wccV074vXwd4NahbOus7E1Xwyp5N
	i8hwkEO96MyYo6nPN6CdX62dinLKNdH5Fd1nrg4plnEPDHovE6JDbkcBFX5sC9cQZ+cnh14AIbHps
	15lhFyjtkQU8KSLv2wxPsm7JChnLFX/vXjp1gOwmpbLgHJ7sbkzlUOgAGLk66wrwyW5O7zEQZi7pj
	ARjx81Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNKq-00000003e6d-27Zs;
	Mon, 30 Jun 2025 22:50:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWM82-00000003Upm-2907;
	Mon, 30 Jun 2025 21:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BTJWDoX6+dZpqVbCI05HYOZjmWwxTYx7suIMcGN7BKI=; b=kXPOClJk1Kmb/DiiyBtViPQ7s4
	BtvZG0K9yDMyQ4fGAOW0in3ubCmp2jBQZQuvmSkNvuRkZoBH5+Cd9uXGWaJLcrZnzwTlI6ctkPg0E
	MPCtQMCm0MxNBF+z6YN3VNCvT0Y5AP4nvgRmrHCPBIAzCPyr/yGFufXgaB7zRpS5fSshucWqrdNkz
	cTRAN+LkSxuoc10IY9ad5dILrvGnMUn61DobyKVq28TF0PSvch2asNQdHHgXEZLWQArucI5zeklKY
	dl7HGTSabPyPOfaLNFCCXbNHXk2/MWobnlFcqn2HpHbxaBkwOcjzD90tFzh6Nld+AGVo80RkSVSmM
	XfhReTgw==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWM7s-00084a-BS; Mon, 30 Jun 2025 23:33:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rick wertenbroek <rick.wertenbroek@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/4] phy: rockchip-pcie: Enable all four lanes if required
Date: Mon, 30 Jun 2025 23:33:19 +0200
Message-ID: <4006908.X513TT2pbd@diego>
In-Reply-To: <d3e7dc38bd287aa93a5d6bba87bf3c428ae92ca4.1751307390.git.geraldogabriel@gmail.com>
References: <cover.1751307390.git.geraldogabriel@gmail.com>
 <d3e7dc38bd287aa93a5d6bba87bf3c428ae92ca4.1751307390.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_143330_573245_F7E0CFC8 
X-CRM114-Status: GOOD (  17.32  )
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

Am Montag, 30. Juni 2025, 20:22:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Geraldo Nascimento:
> Current code enables only Lane 0 because pwr_cnt will be incremented on
> first call to the function. Let's reorder the enablement code to enable
> all 4 lanes through GRF.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>=20
> Signed-off-by: Valmantas Paliksa <walmis@gmail.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

hmm, if Valmantas is the original author you should probably keep that auth=
orship
  git commit --amend --author=3D"Valmantas Paliksa <walmis@gmail.com>"
should do the trick.

The first signed-off should be from the patch author, then your signed-off
indicates you handling the patch later as part of this series.

[or, if you modified the code of the patch heavily, Co-developed-by could
 also be appropriate]

Heiko

> ---
>  drivers/phy/rockchip/phy-rockchip-pcie.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockc=
hip/phy-rockchip-pcie.c
> index bd44af36c67a..f22ffb41cdc2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -160,6 +160,12 @@ static int rockchip_pcie_phy_power_on(struct phy *ph=
y)
> =20
>  	guard(mutex)(&rk_phy->pcie_mutex);
> =20
> +	regmap_write(rk_phy->reg_base,
> +		     rk_phy->phy_data->pcie_laneoff,
> +		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> +				   PHY_LANE_IDLE_MASK,
> +				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> +
>  	if (rk_phy->pwr_cnt++) {
>  		return 0;
>  	}
> @@ -176,12 +182,6 @@ static int rockchip_pcie_phy_power_on(struct phy *ph=
y)
>  				   PHY_CFG_ADDR_MASK,
>  				   PHY_CFG_ADDR_SHIFT));
> =20
> -	regmap_write(rk_phy->reg_base,
> -		     rk_phy->phy_data->pcie_laneoff,
> -		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
> -				   PHY_LANE_IDLE_MASK,
> -				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> -
>  	/*
>  	 * No documented timeout value for phy operation below,
>  	 * so we make it large enough here. And we use loop-break
>=20





