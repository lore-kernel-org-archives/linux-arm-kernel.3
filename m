Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD0606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOKAwDLp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2ISqEj/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5nv0wC5Go1XJNaxDD1nOfqVCMVLbai1ksiJmJqJBQiY=; b=hOKAwDLpWk35h/h9Txe/3B+B17
	s3R5p8Um7FmRcI9TdOKNfCm/M+BmfJ8xTbeOfENEZlUP32YlIhqcY9K61wZf/uviH2M8fSWxYhdRi
	S1cJdgvUqlBEHU6aPSSYuzhB/DqW1hqUI65gXOncH1PngbBGLK6zP9fLIP7skiyB0cD8qhPOL3TGx
	eDb5+FdADuEVBNE4XukWSMT63w24VUCWv+hDdrF1AaDkVL1VcQzAc/y+EfkWvBHIWOUFvBzfFFDG1
	6BKp2ks8LhGCAH+nloSYc7jHDavz+b6ME6sJcu7peX3wLvcGv3g3A7kuInBEVfrzsCzllBNktRIki
	YaV/bQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrEk-0000000COm4-0UOl;
	Fri, 30 Oct 2026 18:21:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrEi-0000000COln-0w0g;
	Fri, 30 Oct 2026 18:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2AD543C81;
	Fri, 30 Oct 2026 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731F21F000C1;
	Fri, 30 Oct 2026 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384515;
	bh=5nv0wC5Go1XJNaxDD1nOfqVCMVLbai1ksiJmJqJBQiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2ISqEj/jPFHsaWT4fWEIwvawOQdaVOY4wkBPBZLVvmitSZblbsI/J643p8P7gpbc
	 Hb7omRlAG9gvX7leULcIVigq+YZfKDVsRrTqb9ZS9R7Xu1pmuhAor805J6AsRJIjpQ
	 BR7x/471R3zaQZvk8VDig1A1VxrPjIQU4ro3lSdFTq2hDgGKjbFfSNurLKvAM1YTu8
	 16jhr4K+Y9cT2tlBeehNwizvzvRWsEubccTWjQeMIIlpiwd/yp6pxDprc8LqlpY+St
	 WwWx+ONeNJUmFgoYDVxh+YOHlaRemuEQo3poj9WuljxHGS85YN6pEo5HnxwtpyPYs2
	 rfT/Fx8AEt3VA==
Date: Fri, 30 Oct 2026 13:21:51 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261030182151.GA1206797-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> Northstar Plus uses the Northstar Bx PHY register sequence but also
> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> clock enable.
> 
> Add an NSP compatible with a required USB2 DMP phandle. Describe the
> shared PHY relationship with EHCI, OHCI and xHCI so initialization
> finishes before any host starts operating.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> index 7fd419db45d0..00d69b86cbff 100644
> --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> @@ -14,6 +14,9 @@ description: |
>    Known B1: BCM4707 rev 6
>    Known C0: BCM47094 rev 0
>  
> +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
> +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
> +
>  maintainers:
>    - Rafał Miłecki <rafal@milecki.pl>
>  
> @@ -22,6 +25,7 @@ properties:
>      enum:
>        - brcm,ns-ax-usb3-phy
>        - brcm,ns-bx-usb3-phy
> +      - brcm,nsp-usb3-phy
>  
>    reg:
>      description: address of MDIO bus device
> @@ -32,6 +36,13 @@ properties:
>      description:
>        Phandle to the DMP (Device Management Plugin) syscon
>  
> +  usb2-dmp-syscon:

brcm,usb2-dmp

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the USB2 DMP on Northstar Plus, for its interface clock and
> +      reset. All USB host controllers must reference this shared PHY so that
> +      initialization completes before any of them starts using it.
> +
>    "#phy-cells":
>      const: 0
>  
> @@ -41,6 +52,18 @@ required:
>    - usb3-dmp-syscon
>    - "#phy-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: brcm,nsp-usb3-phy
> +    then:
> +      required:
> +        - usb2-dmp-syscon
> +    else:
> +      properties:
> +        usb2-dmp-syscon: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 

