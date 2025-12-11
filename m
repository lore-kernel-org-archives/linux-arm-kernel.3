Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABCED41C35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoksV2+x2K7a67/g5oomzkcDGXEz2z+L+nGj/+ubSqc=; b=XWKHS4GqcqwAEhaSwwannsp1v+
	A4adkGs+DxZ1+dksqbCSVJ6y+SHNtkKJWFSbL1ynh25QHeXFNNun+Fg8XdcarbL/1LiEglT0DntgA
	XGOn3EeElZR2RDePfb0l+Mmpr9yii05/prqV9cVMlXfsHcI+ctfav9vG8HMZGIJPY0JgZsds5xCq7
	MVepCHMoOfQ4xL9Aknpkgtnr+zhhOzBea4SZI0IWuwwq7FxMUJom8g5t6ihV29FIK72sisB99SbUf
	WPiiwHkPOSDtmdvt7GqHXH8YIA4RxVuFCbIaZHPWr4JhYiX9Xj/Ch0cN1zFE9+hk1LJGWP86FFeGy
	SpjRclCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrK-0000000GeTR-3QGe;
	Thu, 11 Dec 2025 13:37:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrI-0000000GeT2-2DzA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECD7344248;
	Thu, 11 Dec 2025 13:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FABC4CEF7;
	Thu, 11 Dec 2025 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765460247;
	bh=WicvLgJ3zuOHsq7pRChjkMd+4DZttyIDawUvyHdiB+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icLVHvhveGjgL/AF+ZDXAvLRE8E0BweFDHOpx+aXZn3K27vq4fV+8tPoC8/YcEhyi
	 3XWVoVhdLFKmWJpdhTsOKi836DnzyPFTBINrt5ymDKRVNVwylFhnYHiY1b0jm2w7NE
	 etFJIoZSFKWhByJVWnj9c/4qrHjTm6K3t3caEeoKPtjMyhNZO9M81cB2Bw4BR0fnvj
	 FtfshZjXS23Kop5lZOBRKUcYMNu6B2NhWJC3YVijclZ3JvtXlx3OLk4enmSaxBJl3i
	 lKcsAPNK8M0ML8vdCI2KgITYKTUsLCCMBAHzfnP2j8zbkcE06yIaX+3AFXqvJM4ZyC
	 H8zZZZIkACCcw==
Date: Thu, 11 Dec 2025 07:37:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Message-ID: <20251211133723.GA859302-robh@kernel.org>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053728_633923_CA154725 
X-CRM114-Status: GOOD (  16.98  )
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

On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..90f88cc6cd3e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>      items:
>        - const: apb
>  
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for the first etr device
> +      - description: Byte cntr interrupt for the second etr device
> +
> +  interrupt-names:
> +    items:
> +      - const: etrirq0
> +      - const: etrirq1

Names are kind of pointless when it is just foo<index>.

> +
>    label:
>      description:
>        Description of a coresight device.
> @@ -60,6 +70,8 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      ctcu@1001000 {
>          compatible = "qcom,sa8775p-ctcu";
>          reg = <0x1001000 0x1000>;
> @@ -67,6 +79,11 @@ examples:
>          clocks = <&aoss_qmp>;
>          clock-names = "apb";
>  
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etrirq0",
> +                          "etrirq1;
> +
>          in-ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> 
> -- 
> 2.34.1
> 

