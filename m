Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248E2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXxxLdb7XheOy75RFTu6qpzQ1CR6/qzHUiLBzTJbIfo=; b=Hc77uevl1vbKMVpWHio/SAMIkk
	5yms6EgvwC6t3xRlOHyoHE0WLCx/4pRdwXE0sdtM7Ohx7HJwRwDn89Cn7FgUsFpWE6bgLyi6JBzNp
	VanzxoP6yBVZYiXbUVLMSz9i2l++O9Pupwr/bwXSJUnFOS4bhhC2T54HpnpaoHP09zzp1o7IkAe9/
	9poJjh0K6IgnO9gWA087jOX/zEfra8piyu6h6AsVJvGMIdAyKERNEaLiOCXGcNqKfhnmr3I5gg+eX
	igdqt5oQcwWi9c9BdOuCAanMePgS39Tr6zsKOSyBP+IIV4MGhR1LzNEYJJomZ04daRqxVRRcZei3i
	AVCWZmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhO-0000000H4a7-2Rms;
	Fri, 07 Nov 2025 10:28:06 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhM-0000000H4Yj-0V0o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:28:05 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762511271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXxxLdb7XheOy75RFTu6qpzQ1CR6/qzHUiLBzTJbIfo=;
	b=LTXY4niJ2Q4v9blFZDDIDMhmT6YuANss37XVrUPjaWkBRYbGPvukGIrKWMjfMtjCz9X4y2
	D0icX131qTv+kScD53gosbMyEh9nKGD7IdwIhnbkx9kmiVcrc3fXJVV8w0StZO3YlSuV6u
	N0fDkWwwzBQPhuNam3hUStygGtLEykiDTBETx/DGwquha8F2AIUK55iJQQjrfXkvH8ri19
	JWvm9c3kuu8nOS8c0V9jSfOMNKS9NziiYCuireCSED3VE6TV87pkiPaoZ/tU7QArHk1qe1
	UkRkKnx8n4UE05b8wzlOpUbvsSK+LAJmaMEErMTaPXGlZ7HCyBphXEv2Ab2MQw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 11:27:45 +0100
Message-Id: <DE2E3LND1O81.25N3JM01890FT@cknow-tech.com>
Cc: "Bjorn Helgaas" <helgaas@kernel.org>,
 <linux-rockchip@lists.infradead.org>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Johan Jonker" <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com> <20251103181038.GA1814635@bhelgaas> <aQrKtFT0ldc70gKj@geday> <DE0N4LA8MOJD.236O12UZ3I3C4@cknow-tech.com> <aQu_-JDy7qqeviUm@geday>
In-Reply-To: <aQu_-JDy7qqeviUm@geday>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_022804_316020_70852002 
X-CRM114-Status: GOOD (  15.96  )
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

Hi Geraldo,

On Wed Nov 5, 2025 at 10:22 PM CET, Geraldo Nascimento wrote:
> On Wed, Nov 05, 2025 at 10:06:53AM +0100, Diederik de Haas wrote:
>> I have a Samsung PM981 (without the 'a') and AFAICT it works fine.
>> I had noticed that the PERST# (pinctrl) was missing, but 'ep-gpios'
>> was/is new to me and I hadn't had time to research that properly yet.
>> Good to see you already found it yourself :-)
>
> Would you mind testing the following DT change to make sure your PM981
> continues to work fine?

I just learned the the PCIe system on rk3399 is indeed different from
the systems where I use it with (rk3568 & rk3588). And 'ep-gpios' is
only used with rk3399 based devices (in the Rockchip dts tree), which
explains why I hadn't seen that before.
Which in turn means I can't test your proposed change.

I guess I was triggered by RFC patch 2 which said 'a known quirky
device' while my Samsung PM981's are working fine ... but with DW based
IP. You did specify in your cover letter the connection with Rockchip
PCI IP, which apparently can make a (lot of?) difference.
Me finding the PERST# pinctrl in a few minutes and we finding
improvements in RockPro64's PCI 'config' recently, indicated to me that
a new look into the dts definition may be warranted, before changing
``drivers/pci/controller/pcie-rockchip-host.c`` for everyone.

Cheers,
  Diederik

> Thank you,
> Geraldo Nascimento
>
> ---
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> index aa70776e898a..b3d19dce539f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> @@ -383,7 +383,7 @@ &pcie_phy {
>  };
> =20
>  &pcie0 {
> -	ep-gpios =3D <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +	ep-gpios =3D <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_SINGLE_ENDED)>;
>  	num-lanes =3D <4>;
>  	pinctrl-0 =3D <&pcie_clkreqnb_cpm>;
>  	pinctrl-names =3D "default";


