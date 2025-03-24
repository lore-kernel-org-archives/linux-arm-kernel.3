Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3B1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWNykCfIZE5y2vVmoZSSnKAkwrG/e9pduNl8HAGkIE4=; b=dS6+uMeF6ui2l/zFbCTifXsaSS
	ZmEMRqHBU02R/fgCFfXZk+K8uMt1zoU2aPYyYOTzdFVkjf7Cdu7yoVQjNh/ohM7ymp1ONci1Wo8LL
	PQNrK0wCyf15a7CLT71j+mmx4MPgbTxjK2mHuGJxQHh36cyUNizdPdZ7LfcbGF0hyzeg2gMIRz27n
	zPMeUMOi+UuOcwjQx2f94Z1T9B4fJr28h3nuXqKgwzfm4M7jYbgS4Ec08iOEKs+CBHC5W4fALvl2F
	Fj/Jv+cBxYzoh3CrWRavco3u+//sOW79NUj3ri/dGB2dsRHQ0zccmr/ZPmmRH9Ztch8JJt4sH1lLk
	2BUumM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twogj-00000004DzK-10zT;
	Mon, 24 Mar 2025 20:46:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoS4-00000004CPa-0qQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 20:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E7C361590;
	Mon, 24 Mar 2025 20:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC1FC4CEDD;
	Mon, 24 Mar 2025 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742848275;
	bh=XZ2Yktl6mmKJfiTNy+Z4/IvVxFgIZo5WawcMrRO2Vbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFuZW06FF/l/+XccYW9mOLm0/T/y+rQ5Qey1sx5gf4IDaXAPgVGHQnHICkOj2UmZU
	 PDykSuBwUEVADe6TdOjuKw5QO577NinlTsZimjhVNndV+uT/QF2NWLD0KNSrhsi0MI
	 KO6BpOsq9Hl8egajcNvUPEudOv9SNJhFWRHqJQFRyzT1WHtvDIrlMg9stNwULybj+M
	 BrUElG7Trs8lG1eluh+AtsXNGzvNnGeOi0P7Dlji1cjRBLjpqvGDXDk+yLmDF92QVM
	 HY89MNPoMV56QNAw8di8kHyUcASHkvgva7nx0zVefH0OjCTcc2EeKbkkR51Kcbzo7D
	 YfL6AJQifexgw==
Date: Mon, 24 Mar 2025 15:31:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	devicetree@vger.kernel.org,
	Petre Rodan <petre.rodan@subdimension.ro>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Anshul Dalal <anshulusr@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	linux-iio@vger.kernel.org,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Robert Budai <robert.budai@analog.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: iio: Use unevaluatedProperties for SPI
 devices
Message-ID: <174284827311.819192.14616231717400662961.robh@kernel.org>
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
 <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
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


On Mon, 24 Mar 2025 13:53:13 +0100, Krzysztof Kozlowski wrote:
> SPI devices should use unevaluatedProperties:false instead of
> additionalProperties:false, to allow any SPI device properties listed in
> spi-peripheral-props.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml      | 2 +-
>  Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml      | 2 +-
>  Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml      | 2 +-
>  .../devicetree/bindings/iio/dac/microchip,mcp4821.yaml          | 2 +-
>  Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml     | 2 +-
>  Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml    | 2 +-
>  .../devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml    | 2 +-
>  .../devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


