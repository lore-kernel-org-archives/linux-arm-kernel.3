Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01086CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pJCdmP/I1O9qQOYy3P6wkUiGVmzpOS2+Rao0WrGW64=; b=wTkqhUL1HsSHAlTqzkzQpEKuRH
	bZF6b1SiIglXbL4rlDXqpPZdWkLL5IMr+7nrL8ZZJQXXJsOgtNvNDGAMV2ZjE2lGjynjZ0RJ4yq99
	iogMY1QuTXmFa+QwK3QhIyPnTMgFy1EYDHYUC2z5LsM1/+UbM6X8A8PD9oLSAJWy29p8tuxB+6UMf
	FqyERFx0b4FUyTfppxxiUzRZJl0nWwZn/0SP9sJeI9Iy3Z0gSLIrd0EFadE7rVw9s7zrA5et6YobT
	Xyb39gicFaz2c23Su+5Q4AU2iICE+B6RcbbeVHgd5IO+RUe31ifhtEKj2616g4gcdWC+C+tXGdVPl
	GVKDP+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCLi-00000006sm9-0D4G;
	Wed, 10 Jun 2026 06:23:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCLh-00000006slu-1BYx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A4946001A;
	Wed, 10 Jun 2026 06:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CBC1F00893;
	Wed, 10 Jun 2026 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781072616;
	bh=7pJCdmP/I1O9qQOYy3P6wkUiGVmzpOS2+Rao0WrGW64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMTQiNERSJazYilIigjjFiYbyNChVIRknRAokvryq5rlvBubewjeD3JaSHn+6UQxN
	 UM9NOS+leh5PE1n1YNYL93aPK8iSU9m9SNeO8MunUBtPna3GrIpBLTNu4clPEKGxTT
	 cg0pPPk+9TKrWQ5nOw408qsJSzgtfpJf1HR0mMaUceQYe1IOdH1FEP+Et0hhSuLa/9
	 CnXaKcNAvdnTZNs27XPdO/+3VCRmOqKwaU0h0UYHFPM7YcMa0A98weK2Jtd0q7/GqO
	 6C1vGN9GI5ZtUyTqdUKkOFomXKK1ytB9mMvnYH58YnAH1gBlOBEvVFarNPfoPJFvw6
	 Sy93YFxIdW4tg==
Date: Wed, 10 Jun 2026 08:23:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260610-lovely-bumblebee-of-fame-505a1c@quoll>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
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

On Tue, Jun 09, 2026 at 08:32:52PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> The video clock controller exposes power domains, so '#power-domain-cells'
> must be present in the device node. Add it to the required properties list
> to enforce this in binding validation.
> 
> There is no ABI breakage and no impact to the existing devices, since the
> nodes using this binding already specify the '#power-domain-cells' property
> for videocc.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


