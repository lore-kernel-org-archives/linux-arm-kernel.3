Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E3BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sYF+IPMMTtiBvXoV91buZ043kNZOFVmYpJkmN8vaeo=; b=CsGVkyhsntj6inczxzWeb1eVNs
	APQpU/4a6Z3auCl3wJ9gaMqvfAVLNfP4q2bkv8KPTpOcQQwVxSASQy/KIrcl0Bzjx/gFlPY3H8AFj
	Y0ElsjgKoD3fbNnWoS9Kdv4j/YC8KLPQU6h2Z6BQjBsI99OLSwui7jDLRaHdPFwusoyPpvR+li/DD
	IBX+E5K92m7kr6/7kBmYWdfjCvrHzjb3RZ7k3P9u8AyFfYE66FqHaZjY2iUq6Jt85op4owQj+WoYs
	BZR2ijt6r44KjeDYxTTS49JNfKemG/itWXx8JL7LW/L8mok79xb0g7F6ax2mKcqRUM42OiQacZvti
	JqNgB2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SdJ-00000003kRX-0oy2;
	Wed, 08 Oct 2025 11:47:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SdH-00000003kRB-2rWh;
	Wed, 08 Oct 2025 11:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE86B61F78;
	Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E298C4CEF4;
	Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759924018;
	bh=EpgdIB0VrKXe9RLfKIuBV1GtRp2U7rWH3b+xzvj9yP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCzS4wjPaNIks2gCKdcMpv8VZn0+DC3oGMu5Xuc1IAFbayT/Zunyil8BUnXVQPK2k
	 cq2mahgAuhQm7tTS9+Dic9luY8FzKII1afm0ECrLZPMoH8g4KPS/SX2Y3AHBQrF+EV
	 480TertJsVvSXOg5DJELQJm3nEU58BJkZCHa74RYpww6eGpiNyEL8eSC7sko5sCEk8
	 4gUxdA4dcdUv2+8suVKSDmhFGFfVgqrrT/j9Bmyp81nHucWbQ4i4UxKwdMIrguMcE/
	 fdqnHoF4nob3i0NeixW8Pw49Zt0wtsFBrd8sqHM/GROYz6psDkJXVHLawtCAvJaemV
	 GCCBPFi7R3YKQ==
Date: Wed, 8 Oct 2025 06:46:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>, Li Jun <jun.li@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <175992401654.3284722.6085529297622918555.robh@kernel.org>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
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


On Tue, 30 Sep 2025 19:17:21 +0200, Neil Armstrong wrote:
> The ports definition currently defined in the usb-switch.yaml
> fits standards devices which are either recipient of altmode
> muxing and orientation switching events or an element of the
> USB Super Speed data lanes.
> 
> This doesn't necessarely fit combo PHYs like the Qualcomm
> USB3/DP Combo which has a different ports representation.
> 
> Move the ports definition to a separate usb-switch-ports.yaml
> and reference it next to the usb-switch.yaml, except for
> the Qualcomm USB3/DP Combo PHY bindings.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>  .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>  .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>  .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>  .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>  11 files changed, 81 insertions(+), 54 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


