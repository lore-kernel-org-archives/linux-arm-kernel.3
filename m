Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30717C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1y15ggPmlTmYTk4lxrzQIM3LojUkZqNoouqh7PA76Q=; b=zKtkxXBJc+Ri+TfogMLLPFwyCL
	9DkFzk6OPfC1jOE1n2cIlO+ichUQLbXKqOyyavBzimEgAps8KA6JpGjdP8y+G7NntWCjdE/dXL2MN
	s3QstSPa4yA14P+qO4hYnyeQ04EwJmUQnaojMpkH64ovnZTOXEJovKirpyIzEWCnbNuNfecEPjs91
	iFalFqeQ8HpHjuN35Tk9Z6Rgel1rm0g8+yY/OWKLJ1dg9G4cBrsLERgKwjdgDJZRn3JdlWdCPPJ2U
	3TrQj3TgSAVmN5PXiyJDNH6FrqPWetAKGUQsamG4E012MBsaBRUngzTBZ8KpRHYkN2WoMl46dBmgH
	kJTe8nXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIx4-0000000CFpK-2h5S;
	Tue, 06 May 2025 14:07:18 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGas-0000000BlW5-1tcz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746531371; x=1746790571;
	bh=n1y15ggPmlTmYTk4lxrzQIM3LojUkZqNoouqh7PA76Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=K3vCZy14k5jbFdGrLIREvPiswYrJrBnEHX8fn/aYLHBKObUzVtGecYIujWl0h9zbW
	 oNmSe4HmWO2TVucjFEeP5a/h5aujbtLvRIy1JSG8V3UCNmQd0Z50+rP6tXYQYdWc9Y
	 Ej+W3F3SylUmnLEkAOAJgxGHl8doy/fVJDIGLMax79XnSiGOrYT3udLiPaVJ8XSYpL
	 iyqmddgcFm5y7zuRhI3XGNp43vx7R61/L7W/xKbv8SNUtrxtpsBMeLpvUKtY7Got9V
	 HpPza4rZcl4j361eGtKVf0ZJLR0AUo0XDHBAxOIzBY8M809lUxpIiAS5HV4wIdtsfj
	 IH4AS4Fh6hlNA==
Date: Tue, 06 May 2025 11:36:04 +0000
To: Niklas Cassel <cassel@kernel.org>
From: Laszlo Fiat <laszlo.fiat@proton.me>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: dw-rockchip: Replace PERST sleep time with proper macro
Message-ID: <1reFy5Nwl2unAMz8eiJ8N2AJFavSwlPAjjrp8lv7ySl52ZYWZxTnpOfcTyejxHGfWDKFZdp0sKdIrs2v6QQqeEo0xm2hMPSFO_7j2WMOjo0=@proton.me>
In-Reply-To: <20250506073934.433176-9-cassel@kernel.org>
References: <20250506073934.433176-6-cassel@kernel.org> <20250506073934.433176-9-cassel@kernel.org>
Feedback-ID: 130963441:user:proton
X-Pm-Message-ID: 6be6925127c1ae6a773b742a8e5f443190ea74d1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_043614_639013_AE8BC111 
X-CRM114-Status: GOOD (  14.20  )
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


On Tuesday, May 6th, 2025 at 9:39 AM, Niklas Cassel <cassel@kernel.org> wro=
te:

> Replace the PERST sleep time with the proper macro (PCIE_T_PVPERL_MS).
> No functional change.
>=20
> Signed-off-by: Niklas Cassel cassel@kernel.org
>=20
> ---
> drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/=
controller/dwc/pcie-dw-rockchip.c
> index 6a7ec3545a7f..0baf9da3ac1c 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -225,7 +225,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *p=
ci)
> * We need more extra time as before, rather than setting just
> * 100us as we don't know how long should the device need to reset.
> */
> - msleep(100);
> + msleep(PCIE_T_PVPERL_MS);
> gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
>=20
>=20
> return 0;
> --
> 2.49.0

Tested-by: Laszlo Fiat <laszlo.fiat@proton.me>

