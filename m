Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA1C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJNyvam/TtvWT9CJFPp25i1xg+QAJMyXxSbtCFngQEA=; b=lGs3vj+B/u41CoJhl5whJG4jV4
	mtTdc6jwajqzYNupwgWY0daldmAXPqfDll+V7J8jK6wSmTqEUpGI+XeucLFHRVT2cx/CochV0Ajlr
	PG3uVNJlEyWJWbg8yKm6bTBt+X/RHvm2I7hopY8/Go8qD9uK1NKAZcxl5eLQGCavCE9CxU8QTZ3HA
	bVXpMiMaOICJLGT7d/A//B8Lbc+Nv5pAf8wPBFC4ZN5s/R7r0CFEZpobPamExZHHmmha3zbkxlrLz
	KAX/EUc0kHbxkd6vzWoCNnvDuPt3VDUXJC0r/3tKYut4NTrqiV8YUM7DP+TjEk50PQfzUkR4Ip/v/
	ZKZ5sjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgV-00000005Q5W-1XBu;
	Fri, 28 Aug 2026 09:15:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgT-00000005Q5G-3kbc;
	Fri, 28 Aug 2026 09:15:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A47D6402AB;
	Fri, 28 Aug 2026 09:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D801F000E9;
	Fri, 28 Aug 2026 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908537;
	bh=WJNyvam/TtvWT9CJFPp25i1xg+QAJMyXxSbtCFngQEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwBtwHrplo0MqMZ/i1Jl3lgV8BAaxpSqNtPGwa9HxzmGCvoEvNCJDYv9/MwkNTZk3
	 um08+x2LtBx1MrjuXZE5MwNOe3hxYv1ZvqjIVxX+Iejb6uoRbIGVy4NasZ+QUjx8Vp
	 bK7jC8KjGPn/RmAe0eEdaELgOwyyZsn5qxuJTS0ixU/u/ltD+HKNWBFetDxoWVwm/K
	 67Udx9oJ9MGQRyJ6UT3BMBIRa/b46qFGhgB+ctJLSn/RUJUvYk457JvLNqHNihD+Ln
	 vKWplwD72TgaCNTijybmAyONWP0dQm63z5gxMU2nV//Xv3ENIE40bxMqRzcq2B0GuB
	 fU/t8e/XAQmNg==
Date: Fri, 28 Aug 2026 11:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Pankaj Dev <pankaj.dev@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 9/9] arm64: dts: st: Add USB nodes on stm32mp251
Message-ID: <20260828-blue-caterpillar-from-shambhala-5c5dbb@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-10-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-10-marex@nabladev.com>
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

On Sat, Aug 22, 2026 at 09:46:42AM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB controller and PHY nodes to stm32mp251 DT.
> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
> controller and DWC3 DRD controller nodes.

This looks early unwrapped.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: - Fix up Sob/Cdb lines
>     - Move PHY into syscfg subnode
>     - Turn st,stm32mp25-syscfg into simple-mfd
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Describe OHCI clock as the CMN clock
>     - Fix up Sob/Cdb lines further
> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 65 +++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6e985f115b195..dd2f7ddd9b634 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1746,6 +1746,47 @@ stmmac_axi_config_1: stmmac-axi-config {
>  				};
>  			};
>  
> +			usbh_ohci: usb@482e0000 {
> +				compatible = "generic-ohci";

So probably this answers my previous email about USB binding - you
really should have a specific front compatible. That specific compatible
also would narrow flexible properties, like clocks and reg.

Best regards,
Krzysztof


