Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F4C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey7yoOjV/lc5KcZj4q45sCx1nDoy4AmcmcNqfQe/iX8=; b=gFcoS3D3vqxjNNphcLVZOHvKjO
	TkkNXa0ZnKejj0x3YFFoltUChGHp90UxdTXItwr2GTitmerOPBZqTpSmrIWds6JeLGdzy1H2clcQS
	cb+OVj3W/ljhyCAQfLypoNzEbuaA8O3Co+mN5P03cxQBg7KzF6PIy0b9nQWA2a+jnYqm4IzKXOLOG
	pOPTw1WFRk1/riQ0AqqtEAzPxAglXQ4Je1WWslaIw43TsanhBYW+ipA7+3lJBW5AsMDQBPiWnVJkC
	kobw10M4WfKogsA0l2JGVZa14TtHzZWtzH1LhbAepjQ0QrEI1J+jyRUSOl+jMdRtYEeo6cCHfTiSW
	U61avQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYXX-00000002a9A-0BE6;
	Tue, 01 Apr 2025 10:08:15 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY6y-00000002VVA-47fw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:40:51 +0000
X-KPN-MessageId: 645a4459-0edd-11f0-b8e6-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 645a4459-0edd-11f0-b8e6-005056999439;
	Tue, 01 Apr 2025 11:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=ey7yoOjV/lc5KcZj4q45sCx1nDoy4AmcmcNqfQe/iX8=;
	b=FqAE2REkFgpO5l2/SNwlAFSrFOx/nu6RzHt2R1+ZsCDtBV69NLrvIrhuJGvE4fTGoK1ZmzxSNirSG
	 ZwHLUY0PHF1CINuzACJAO/SfbfazgI03XZ+WhebvUE+J8i2x+VGt66VoqcEVIgDgnAgtFNOFzKujzs
	 e3XICGWRWyabId09ZjxjE4SXaAKy/UrjoWYCmlGVs8xpAYan/LZSKBXRTbt/aSHuCqD6BmyFx4Yn4N
	 J13gtkyWN7M3vcaqKuYGngCJFovRXrHFS8bvLvcN7tgXgQivboaPq3m4gxtTZaT2Zkx6DSE90Ljgd8
	 rJkmMa+qi1t1I374U1YP5Y5vrb1gUxQ==
X-KPN-MID: 33|Q3Biel+nTqoBd3E8Ejl4/blQ1eotWFPRsXPh84eyXyVG8o/qGN/zkB/xVlQuHaH
 VetITMcREbJ3DnFIWK3u0glWOq0lwEsC5oKzxzT1vxGk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|W0d/KH2Hq4f/I/JXtohD/yi6JDISu5nftVLzXJnFRULuKq3Rc3Vn2VnYtkRYUy+
 oTF6eiBDYAmLq8KY2ELmrXA==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 617e7e6a-0edd-11f0-97bf-00505699d6e5;
	Tue, 01 Apr 2025 11:40:44 +0200 (CEST)
Date: Tue, 01 Apr 2025 11:40:43 +0200
Message-Id: <87cydwxlr8.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net,
	marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org
In-Reply-To: <20250401091713.2765724-3-maz@kernel.org> (message from Marc
	Zyngier on Tue, 1 Apr 2025 10:17:02 +0100)
Subject: Re: [PATCH v3 02/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
References: <20250401091713.2765724-1-maz@kernel.org> <20250401091713.2765724-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_024049_303181_218A9200 
X-CRM114-Status: GOOD (  17.63  )
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

> From: Marc Zyngier <maz@kernel.org>
> Date: Tue,  1 Apr 2025 10:17:02 +0100
> 
> From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> t6020 adds some register ranges compared to t8103, so requires
> a new compatible as well as the new PHY registers.
> 
> Thanks to Mark and Rob for their helpful suggestions in updating
> the binding.

Ah, that's how you do it!  Thanks Rob.

This matches the binding already in use for U-Boot and OpenBSD, so:

Reviewed-by: Mark Kettenis <mark.kettenis@xs4all.nl>

> Suggested-by: Mark Kettenis <mark.kettenis@xs4all.nl>
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> [maz: added PHY registers, constraints]
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  .../devicetree/bindings/pci/apple,pcie.yaml   | 33 +++++++++++++++----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> index c8775f9cb0713..c0852be04f6de 100644
> --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> @@ -17,6 +17,10 @@ description: |
>    implements its root ports.  But the ATU found on most DesignWare
>    PCIe host bridges is absent.
>  
> +  On systems derived from T602x, the PHY registers are in a region
> +  separate from the port registers. In that case, there is one PHY
> +  register range per port register range.
> +
>    All root ports share a single ECAM space, but separate GPIOs are
>    used to take the PCI devices on those ports out of reset.  Therefore
>    the standard "reset-gpios" and "max-link-speed" properties appear on
> @@ -30,16 +34,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8103-pcie
> -          - apple,t8112-pcie
> -          - apple,t6000-pcie
> -      - const: apple,pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8103-pcie
> +              - apple,t8112-pcie
> +              - apple,t6000-pcie
> +          - const: apple,pcie
> +      - const: apple,t6020-pcie
>  
>    reg:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 10
>  
>    reg-names:
>      minItems: 3
> @@ -50,6 +56,10 @@ properties:
>        - const: port1
>        - const: port2
>        - const: port3
> +      - const: phy0
> +      - const: phy1
> +      - const: phy2
> +      - const: phy3
>  
>    ranges:
>      minItems: 2
> @@ -98,6 +108,15 @@ allOf:
>            maxItems: 5
>          interrupts:
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: apple,t6020-pcie
> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 10
>  
>  examples:
>    - |
> -- 
> 2.39.2
> 
> 
> 

