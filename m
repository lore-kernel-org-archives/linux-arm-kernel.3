Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1963BD4A60E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Bd/Rxfu/2cKkV2Hr1s5jr6cA4j1GO4SFRdz3ZmeLwg=; b=TvG0CYrfe3Ef9TbMvv0mBt6X/q
	dr3ywV2MxJE4a6eo02k8EgPyFGN0/rTPCPu9xyikvYIVH+AYzcnWyBYcntmYZsVKXbb3YyN0wq9fk
	F1BD2nvjjF1nnJl+mGTOMosNUSbxtIjP7EiHDoICyFmr4gHNrRGdhB+gw5H+14O6n61f2sKvShVGX
	gzZf1lKtdgBE4Jwfcnj926XyT+dsN5GYfpY4bipcyNnWHW1Q1YjEMlulNbhHL5JQKpICx+KNvziCM
	r6accjCROPwAn0yqsr1ZSIyCYRkdh+vUt7nMJ3NtrIzCnI7iRMmtqoje/R7aLIGDEIqsM1oNSUmiO
	fhWgJzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfBs-0000000DlMW-3svY;
	Fri, 16 Jan 2026 08:28:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfBr-0000000DlMG-3b3L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 08:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 016416016F;
	Fri, 16 Jan 2026 08:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26957C19421;
	Fri, 16 Jan 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768552098;
	bh=nYv5A7M2Uly0VFTiKqPRXMw+9d7IYZ3TOjRkq75m5F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXCcI5WMomZGKd4w/V6CWonoZbqSfNmJOZh+3s4xc+/2T0zvEkdEQVpDcqHmlpwG3
	 Wi8NwamaSQE5oKtUMdmHwGv2KYB5SQSRArCO0g3N173jrq0+F29JyI3K2CXqaWsGL4
	 yf6cNkD46RQE+Kp70A05DFFSYBL6gBOGxYUIa/3CQBRgLcHFz7G88zowL0v3v+6uL+
	 4bdWHRSjLw+Mm9cKhofaBlIm11TJeJGQWj1rFTsRJxfsYr7S9Rl++fAAhUHUwXYkXA
	 O5si3HEs+rqQnWO9tTu2ltdtrNPpKC4ZXeqceQTcmIiIKKUDlK79rYJObyELCuv3RN
	 qtHljKX16JWSg==
Date: Fri, 16 Jan 2026 09:28:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -263,6 +264,23 @@ allOf:
>              - const: cpas_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6150-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: iface
> +            - const: cci

So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
existing enum with qcom,sm8550-cci.

I asked for this at v1.
https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/


Best regards,
Krzysztof


