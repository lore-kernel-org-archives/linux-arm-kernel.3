Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8d9PRXbwhD4fBsWJqohHv1LB8RxeSMbMMS911Xj2ZU=; b=aOyu7U/7XgoJraskHegEvceqH2
	75khM9+E8EtnUgAdSjNiE/AY4sUCRL3VjpxKeG9Fpjjw2AZez3YXhhkftAgI+enciCrUG07bKPUcx
	23GXxzcr50mRra/U7uCIXhx91cpG8uyrRbfQkR7BdGjDZbqnno0oykZn3GBhTzEopoAsLYzoyE/gv
	Mc/p/FxFW4JjZrlOxpIu74G1i4QnBdpn2XcHTdF4vKTZbedOkuY/lUC3eE6VGGIhuCBSaqIvtYMM5
	6lcoKq6EAhF1c+0YYU4feXWZkL4jJK8DuXfPXd4Bnj/cI0NTFr9+N5zt160JWDhFYApfdzHeTLu78
	NKjrI5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL1x-0000000EQYV-2N1Y;
	Wed, 10 Sep 2025 13:38:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwL1w-0000000EQY0-0k0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:38:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E7E601FA;
	Wed, 10 Sep 2025 13:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CFEC4CEF0;
	Wed, 10 Sep 2025 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511514;
	bh=a040r4eM2yhSWfXdg58fzda5OZ7oGB0lS6HGqRV+5gQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HPtWYkdOO487YPncRRA10m+CcLPt0C/2M4I2IfM/F1LoV9p4Y8+e3F53OFIrEtm5A
	 uM2We3Zb9Gnr9/gicHy/kKJ1gBkfBDyaUfEmxugkONkn0XFDdSUwvULqtP4PcFjW15
	 7d3NweIe78LkdubkgleqTHGnGCtw11S+/vR4d5YB/OaoRBjsApNJNHG15ZOtU6NT2d
	 Le/7x0gAo5DMzMNtgyh/vhIZzcVVGpEgKwgSDfSJyoPmUDQuzi4fseAda+XHDC4Bpq
	 zy4ylspGlOINlNJLyaSHpAxAVtj2oijUQSOcHMSE44GPKzQlygoDVhLjt9+nxwPOv6
	 dLcaeOUn5K4pQ==
Date: Wed, 10 Sep 2025 08:38:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 devicetree@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, 
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
Message-Id: <175751081352.3667912.274641295097354228.robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
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


On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 105 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


