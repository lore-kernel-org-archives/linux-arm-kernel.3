Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FF4C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE31nzfth1xSiv4SpJbernGDn70udUYeE1+kOTlla6M=; b=qb3EZxGdWlxLpX1s19RTfWv6Mr
	b02cxtrek/K02RsjM97O4b1MpWznRq8LjXFjj5yX1R88Z90WMhvPDoqUm3TpEZxwrgBw3LZlGGy7F
	KUt8pb5im74hiJdFKXAtyGLIOkG4i3SRLtKBPwKW0lxu7H1AiVS6RwHcksD7r/izDTScnQxWxYiLP
	ff8N8RxzWBc56A+qO1y/QUtX631YqZ6bpQx9aBbtmvEt8dtJoe+JnSWcLCsZQgb5A+d+EpsivSA35
	baPuF2ymTr1oraxavmlZf+qxFQPy8yzUTeen00Pkhn7rJpOOYyFbfNb8EjSSJ9AI3oxAqPawHHhFZ
	JcMyUMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyaf-00000008eAk-3TtU;
	Wed, 02 Jul 2025 14:37:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxQc-00000008RGI-2Nnf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F295E61126;
	Wed,  2 Jul 2025 13:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062A1C4CEEF;
	Wed,  2 Jul 2025 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462589;
	bh=ls4BL36XpqMPgnaxs3/5LeyK2gWf65Q7J7Cm9qsCR0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeDxSl+xNClQVxv20D4Rit498gd6NsuBF07Q3IsZYTmNyOmfwCeCXuIhM3VckYOSZ
	 Cvwcrd9Dz5Y2jRUqKEJyePhP3BQMbH2G77Ad1/1srRM9IfYoroheUkfoNLtmlbxgSe
	 dLkvkoQd6MM+o74wfUBnQn93oa5RSHv0QtnYYZOTUAnxJ3AyiM6Bw6O7GPSROEczno
	 rQBRLC6/NaMxPoJr/50Y08r8plR7Rp1AucGzZw3NXlwLcMIAwLsJfNa7/gh3dt1Em0
	 qhghTqlW+40+Bmp8ifRogASz3K4AQRDHTm6/YpJy4Eqk3UsOKk5O1karwhlFxv53fx
	 kAUaXBY3Xqg/A==
Date: Wed, 2 Jul 2025 18:52:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 10/10] arm64: dts: imx95: Add msi-map for pci-ep
 device
Message-ID: <qk62dx7jxtcs5xhzy6bbyxnao6gmcnstgb4rmlk3ccoxqxdvlf@nulfy4ryaudg>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-10-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-10-77362eaa48fa@nxp.com>
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

On Mon, Jun 09, 2025 at 12:34:22PM GMT, Frank Li wrote:
> Add msi-map for pci-ep device.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> change from v14 to v16
> - none
> 
> change from v13 to v14
> - new patch
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 632631a291122..c59d11eb7a581 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1797,6 +1797,7 @@ pcie1_ep: pcie-ep@4c380000 {
>  			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
>  			assigned-clock-parents = <0>, <0>,
>  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			msi-map = <0x0 &its 0x98 0x1>;
>  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  			status = "disabled";
>  		};
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

