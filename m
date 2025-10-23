Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF060CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvvOoDKgotkg7bQO5ROLVrbK9DViP/ZxtCVVSt+B39I=; b=gct4NN/WpRajZMmIxVLU1pTvmM
	QH4/YSbpjpS5tW2uXGzF2Kbt+exIXTHlNrW/Jxmv23ap32mhDsSm5K/uiZ/SA2J6u2oyw4SkMTl68
	HNzBtLvNsYlYQb8/iv/yV7vjDYvl9cWv0sLooKYtkcjqjuA7FswrrrPtKaLpPP8xSeegYRq2mdPFT
	vgbX7pHpNEKh2M06E1hi4QR42B6FTo24cvl5aXgiBuH3li8ayDSJdpRzCimJV2v6EnUhISxYokKqy
	WXZfiR9uiN07hR4qP939rfkaM8CHsL82kBPs30SLnsRPHCgitGb/O/ksH7E8NxXTkZAsMiwhzQMDw
	ot++gh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvjZ-00000006TUC-47T1;
	Thu, 23 Oct 2025 13:52:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvjU-00000006TQa-0j6A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:52:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBEAB4ADF2;
	Thu, 23 Oct 2025 13:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D25C4CEE7;
	Thu, 23 Oct 2025 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761227519;
	bh=+aURh5XSJ5XQcVDuus3rnZXEl2bPZX3zTBjzeKoakHc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C3vN6tmz64b32YiU9KV5tcYgLyT2HBEnKpNNHF1bUG79/0r/UxyZzaTZHd+DSxhYb
	 bnZ8+IOrq/XlexDq8QYPlYVvvTDM0I4A3gHCWG4x0K8j/VLjb3p6gPwuKRB7+iV/yf
	 CWExmGwSxFcFflbAE3puyOAVVZ+p35ABydHDGmZ2JTa/Y7UJonoQv2nGns4lM25HmJ
	 pN8Gjv9czNRcNl84nWIM3UUZjee9iO+9xq3HBH8PFXp3TR9AvWvHvosHEjsk6ZHMpI
	 /EDKLgoRHTFg0riEEFjQyZunPG5Kjvysegx6dICinCYL+uDxvk8qsfu531rjTG3iaP
	 JdXjNHCcx/ssg==
Date: Thu, 23 Oct 2025 08:51:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
References: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
Message-Id: <176122700723.2723267.1526103667842275891.robh@kernel.org>
Subject: Re: [PATCH 0/2] dts: imx: cleanup warning cause by fsl,mpl3115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_065200_270993_5A6FF92A 
X-CRM114-Status: GOOD (  15.73  )
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


On Wed, 22 Oct 2025 16:43:20 -0400, Frank Li wrote:
> After commit f11e4374b(dt-bindings: iio: pressure: add binding for mpl3115 )
> vdd-supply and vddio-supply is required properties.
> 
> thread:
> https://lore.kernel.org/imx/0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com/T/#t
> not prefer change both to optional. So update dts to fix CHECK_DTB
> warnings for both ARM and ARM64 platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (2):
>       arm64: dts: imx8: add vdd-supply and vddio-supply for fsl,mpl3115
>       ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115
> 
>  arch/arm/boot/dts/nxp/imx/imx53-ppd.dts         | 2 ++
>  arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi    | 3 ++-
>  arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi     | 4 ++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dts | 2 ++
>  arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts  | 2 ++
>  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 ++
>  arch/arm/boot/dts/nxp/imx/imx7s-warp.dts        | 9 +++++++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts    | 9 +++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts   | 9 +++++++++
>  9 files changed, 41 insertions(+), 1 deletion(-)
> ---
> base-commit: c31b21db1c04ba719c3889a57873f0f7eff54670
> change-id: 20251022-fsl-mpl3115-3bb541a56122
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit c31b21db1c04ba719c3889a57873f0f7eff54670 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc1-10-gc35cf4fe4b85 (exact match)
 Base: tags/v6.18-rc1-10-gc35cf4fe4b85 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com:

arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx7d-sdb.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx7d-sdb-sht11.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: mpl3115@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
arch/arm/boot/dts/nxp/imx/imx53-ppd.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply', 'vddio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml






