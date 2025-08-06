Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAFDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk4yMu+5CuXun8sXYIo2TFOnzoml9++c5d7JiiKGt8A=; b=d/7R2ZX/Yc3/DG7PoAzlvvGyRB
	L+37wv3yvJfnBU+cuTSIXqRIWzTmh9wCM/rzTtbisowYm58/1lp5Jy6XJXieH/Kyavc7qoCONaaB4
	1as9wkrlFmgyKYcsuoZbJ2rDoFD2vhBYToObmGXFu60J8hEkmkfzVWGFER+b8NbkVsFhDprMYjnwq
	OcMAVEsChOsH4TNHroHqd937Zs0jmkCFLfl4ZGYbyekm+k87tK29Tfq5/Sj1wkI2T4D2cxvFaCnOR
	0H1smZAxNHxxZ8/qa8c2rHkPDvS9KRIIACXSms6yspkj92J1lbb/4hT8ReOHsuCAnyXu70b5OQNWT
	vCPzfKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnoa-0000000GqnO-1sCI;
	Wed, 06 Aug 2025 23:45:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnm5-0000000GqX8-2HKb;
	Wed, 06 Aug 2025 23:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zk4yMu+5CuXun8sXYIo2TFOnzoml9++c5d7JiiKGt8A=; b=fHulWqH5eIoJkmVJjwYTUrwihX
	ATR8WljDtI6jFIw3Q/VnQ6EvtfSf9hyEtH+whsLyNHhCZDC6i0p4UUy34odgcXa0WYN1xGGOziPQi
	uuwVxtEfTsJHpCYqNoBRHFj2N/I2GAKz6Sc3f5WwTKQef37BKTCFVzjm03i0MUOaShSXw8hQqxJCM
	LKcpUtF+jUtRhEsjkj5uaBCkm0iNaat1D/mywfsGfCFBmcymIIvQG92ERxft+JNBu34uI09AfLp79
	6eI+qkOQzikz7YQ11nmkOGr9jAsWfxdB3erOlW7WoiHBL9GSlh1PY3faLxr30X6Sbmst8G+/9p+Zs
	b7lIpCNQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnm2-0000000ETos-0zTB;
	Wed, 06 Aug 2025 23:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8DB8A50120;
	Wed,  6 Aug 2025 23:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E403C4CEE7;
	Wed,  6 Aug 2025 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754523738;
	bh=fT+0nxGaI/I9WVL1BF+SKc8auvCNd+sDv/v6lTZlbh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6FbtGLuBIsaxm9rAcCORBKES0EYWoX6s/2EZ0HirwpLVzAoXocRpQ7Wf6KdRSriA
	 paPcxDCTqwVX91F3IYgz53wtrEfOW9z/IW7PzbesLbolDRUsuYhMVB5CDklCpG5EYT
	 1JJqcebLBRAwgfPtG6Y4LmxEsT967vKr7bcxp6f1jyAebMl8rBSZD6x2BTBlM9cFv6
	 o20FyeacpZ5sefYTkdcs1EsoW3BjaS0h6KB4D71epHNNQmI9t5cALb2QXrHygOTL4V
	 9axVKctbXg3sUkmkYvSPEOHDN4zZWg6nnuoQmhntZR/1skJXXtVJyl1tuzJvUZuv9x
	 VyUtl+vl/G0DQ==
Date: Wed, 6 Aug 2025 18:42:17 -0500
From: Rob Herring <robh@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250806234217.GA2030512-robh@kernel.org>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a@epcas5p3.samsung.com>
 <20250805115216.3798121-2-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-2-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_004222_673877_B317C302 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, Aug 05, 2025 at 05:22:11PM +0530, Pritam Manohar Sutar wrote:
> This SoC has USB2.0 phy and supports only UTMI+ interface. This phy
> requires two clocks, named as "phy" and "ref". The required supplies for
> this phy are vdd075_usb20(0.75v), vdd18_usb20(1.8v), vdd33_usb20(3.3v).
> 
> Add a dedicated compatible string for USB HS phy found in this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index e906403208c0..1932a2272ef9 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -34,6 +34,7 @@ properties:
>        - samsung,exynos7870-usbdrd-phy
>        - samsung,exynos850-usbdrd-phy
>        - samsung,exynos990-usbdrd-phy
> +      - samsung,exynosautov920-usbdrd-phy
>  
>    clocks:
>      minItems: 1
> @@ -110,6 +111,12 @@ properties:
>    vddh-usbdp-supply:
>      description: VDDh power supply for the USB DP phy.
>  
> +  dvdd075-usb20-supply:
> +    description: 0.75V power supply for the USB 2.0 phy.
> +
> +  vdd18-usb20-supply:
> +    description: 1.8V power supply for the USB 2.0 phy.
> +
>  required:
>    - compatible
>    - clocks
> @@ -219,6 +226,7 @@ allOf:
>                - samsung,exynos7870-usbdrd-phy
>                - samsung,exynos850-usbdrd-phy
>                - samsung,exynos990-usbdrd-phy
> +              - samsung,exynosautov920-usbdrd-phy
>      then:
>        properties:
>          clocks:
> @@ -235,6 +243,17 @@ allOf:
>  
>          reg-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynosautov920-usbdrd-phy
> +    then:
> +      required:
> +        - dvdd075-usb20-supply
> +        - vdd18-usb20-supply
> +        - vdd33-usb20-supply

Presumably the existing devices don't have these new supplies, so:

else:
  properties:
    dvdd075-usb20-supply: false
    vdd18-usb20-supply: false


