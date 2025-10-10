Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEjUw8ln1E5MPoJpwyxeXkeN+E+y0YJpGzUwbKXiAkU=; b=K04rac8yNapCal3Bep/+kzO9N1
	hDNv1++xpuH41b2wfFndA9WFySaes85qdWhAfUq4wo7ylRlfzzgRAQ6t58y4+NJHOFkRx/dlla1C0
	FWdNSS4bGnzX0cb4rmnVJ74/t+lLm2OLzf/rHqgmiGNEsNqArqKq8NhctJ5U7SALsoaEK1gbO9CD8
	Pt2uxdI2EvBO4uFBsMEppKhRNvFLb2hkIkEIkNKSZ+DNREIejOgVTa1vDScA9dng01Om2rZ4ZGSqT
	i4nI6VjOP6SUXGtOg4AT17en6nCXKdil/FS3sUtqcg90pQcTt2EzF6pwLfBgrcqmzsw6tb7Ipsw1M
	Mn8xjgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HFk-000000096SI-1Oss;
	Fri, 10 Oct 2025 17:50:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HFi-000000096RX-41vD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 17:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 102CD6270D;
	Fri, 10 Oct 2025 17:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92498C116C6;
	Fri, 10 Oct 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760118601;
	bh=dMh8GBD4EAIQyzaGwyEd2ZtNzCl7oE20APdIRhgCkgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYSntg7krxRyForxuUI1r3H41ecE3Iq3vwl3eTPg581hTVTOgAfGnum8VXzSmfr4V
	 jSvMhAAxNj/TpSoXZeZHOZ9DVDgiV0ffpEWSqTy/2QTQ5pBgZdjCJBYcuP4SPK1boA
	 FXB32PHfjCXbPgw36axYILpbGouI9kslTYsgBLu39Tpgt4cx0CCo3Gq+T58FduLVzY
	 PULLq5xKcNDSXDwj/41sy8SuiljheHTAyEEaUWn5hT65z8yV8/9IrGRvWL3nhMQlxA
	 /LQrzxJY8z8N21wD2JceFIeuuTW64mbNgM+UovCvMsLtFeVXTVLxCbKq4+iIdw+c0H
	 DjsfedyCQPJ7A==
Date: Fri, 10 Oct 2025 12:49:59 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
Message-ID: <20251010174959.GA502249-robh@kernel.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
 <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
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

On Wed, Oct 08, 2025 at 10:17:48AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a9cc789085e8bc94d44adc9da982b66071d1e79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: power_core
> +      - const: power_mdio
> +      - const: perf_serdes

I would drop power and perf. I don't want to know about the abusing of 
the power-domain binding.

Rob

