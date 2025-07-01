Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCFDC83039
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HZw+NZFn0z78alxsBajICV+b3eL/ANUfQi4waGgRYU=; b=5EGIjeR6Xjp7LhT2FlCvYMXGf8
	r3oL4l6zy40xOo9Gw/K2qYvizTV9IxMpnjF+Yez2dA43Hy2oNrQx/RzF4Lg0jDIkS4NoFb+DrtDx9
	yZltZyRTqbnfNrd/oIwwhOq3O7pD1fKCN1tzBGKtxbMNeuz514v7FOEuGCZm6rQD6HleBQkgeqTWm
	FPt7gBaInFNM31pI99DUdwLz+ZOES4QN23RkdnrlBGKWW1A80mcqJbWnLdvWwyL8tcnEXbOqoj2Bf
	+6xAliMWwsDpVGV2yb9MOfTg4V+RAwZ/q97t94zC0FYY2EQVwNpuZjQkSdjwsAZ7G/zWhAihcMB2q
	9VHec4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj6-00000004TeE-2H3i;
	Tue, 01 Jul 2025 08:52:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWGB-00000004P0s-32aM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE480A51F15;
	Tue,  1 Jul 2025 08:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E83C4CEEE;
	Tue,  1 Jul 2025 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358154;
	bh=aNmVXBFvp+oOEwr66jDZuE77bJXKpgGM030ZO2mjHy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/G7wm6C5AuMjrIvU4l39LHdafufPMXKLFxveG+LYZ99NKTbODQNImWRM306pWtam
	 DdLaG2J7kCW5+Us5nXz9wyEvdv2xbMOSSNcSH4VucS5nOtkD98X9spEnuXaqcdXTav
	 yM3CN1ESPqtqULUdevukehKMs3JZNkBUP1khMeOFh2sdiHsaeYMGAM80/oTdot7dUU
	 QOvhxGVO3ZikHM5ioNc/afb3NMjaL8K6WpJkkEgqHF2z4d12Ap5oaTjWGNwvSrOXNq
	 3eFMUX6H5LZzE8jUrZ0x1kBI/2L2lv34dwEmhzjpE/zeZeNaWOkxhm0IuUHueqdgG9
	 YgPN4oxr7n0nA==
Date: Tue, 1 Jul 2025 10:22:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com
Subject: Re: [PATCH v2 5/8] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
Message-ID: <20250701-optimistic-esoteric-swallow-d93fc6@krzk-bin>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-5-8d392f65102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-5-8d392f65102a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012235_902903_9CE6DA1B 
X-CRM114-Status: GOOD (  20.79  )
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

On Fri, Jun 27, 2025 at 08:09:21PM +0800, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
> devices.
> 
> Add the compatible "qcom,ipq5424-nsscc" support based on the current
> IPQ9574 NSS clock controller DT binding file. ICC clocks are always
> provided by the NSS clock controller of IPQ9574 and IPQ5424, so add
> interconnect-cells as required DT property.
> 
> Also add master/slave ids for IPQ5424 networking interfaces, which is
> used by nss-ipq5424 driver for providing interconnect services using
> icc-clk framework.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 70 +++++++++++++++++++---
>  include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 ++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 ++++
>  include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 ++++++++++++++
>  4 files changed, 186 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> index 17252b6ea3be..0029a148a397 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>  
>  maintainers:
>    - Bjorn Andersson <andersson@kernel.org>
> @@ -12,21 +12,29 @@ maintainers:
>  
>  description: |
>    Qualcomm networking sub system clock control module provides the clocks,
> -  resets on IPQ9574
> +  resets on IPQ9574 and IPQ5424
>  
> -  See also::
> +  See also:
> +    include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>      include/dt-bindings/clock/qcom,ipq9574-nsscc.h
> +    include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>      include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>  
>  properties:
>    compatible:
> -    const: qcom,ipq9574-nsscc
> +    enum:
> +      - qcom,ipq5424-nsscc
> +      - qcom,ipq9574-nsscc
>  
>    clocks:
>      items:
>        - description: Board XO source
> -      - description: CMN_PLL NSS 1200MHz (Bias PLL cc) clock source
> -      - description: CMN_PLL PPE 353MHz (Bias PLL ubi nc) clock source
> +      - description: CMN_PLL NSS (Bias PLL cc) clock source. This clock rate
> +          can vary for different IPQ SoCs. For example, it is 1200 MHz on the
> +          IPQ9574 and 300 MHz on the IPQ5424.
> +      - description: CMN_PLL PPE (Bias PLL ubi nc) clock source. The clock
> +          rate can vary for different IPQ SoCs. For example, it is 353 MHz
> +          on the IPQ9574 and 375 MHz on the IPQ5424
>        - description: GCC GPLL0 OUT AUX clock source
>        - description: Uniphy0 NSS Rx clock source
>        - description: Uniphy0 NSS Tx clock source
> @@ -42,8 +50,12 @@ properties:
>    clock-names:
>      items:
>        - const: xo
> -      - const: nss_1200
> -      - const: ppe_353
> +      - enum:
> +          - nss_1200
> +          - nss

No, that's the same clock.


> +      - enum:
> +          - ppe_353
> +          - ppe

No, that's the same clock!

The frequencies are not part of input pin. Input pin tells you this is
clock for PPE, not this is clock for PPE 353 and another for PPE xxx.

Best regards,
Krzysztof


