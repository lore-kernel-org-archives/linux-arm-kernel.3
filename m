Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE097E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx45m49A7rbyoDNzZ9IqzaqQc5ODntfqPsXgrpTfP7I=; b=FmS4aruXUFrE0nT1jjABbMEQIB
	94Gm26lPjWxQEV4/YTLqp73m04G87P5vT0/Ij9jd0Ir61NBgS7koD1ZFsBI+GhNPnDzfVv0b13PQK
	R/2a6HNWDCrFBWfFKopSToB4s6fj83CamheF+h1xq+fOwvfeCrXq9ExFuAr6iVSSAXNe7Fqy13AJy
	jyfVz4rWZKXIHN8C1faj8Xxa6MBgaJEdxcYt5qMissmaUrgqygDo9oFJ5m+EJ32NHae5n6MlWrxNa
	QMTexuL7jQl8XvcxfnfX/JesJ4AehfVZNoxHG6bA8l4RsjiBZHG4aNGiPJv2JA8DNM1RN06ao8R3K
	69Tw8DCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrrt-0000000GAE5-1mtd;
	Thu, 26 Dec 2024 17:41:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrmh-0000000G9bl-2FoL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:36:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQHa5Sm007975;
	Thu, 26 Dec 2024 11:36:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735234565;
	bh=dx45m49A7rbyoDNzZ9IqzaqQc5ODntfqPsXgrpTfP7I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gqkbLQqWJJcNL4toy1hHZQ0RKhSDt+x218lryK14wGIr59q0ueCPV+89sOVFX4P2N
	 bjDIStQwmUHsD1v2U5ZHCt+xwqmASS7GMwoznnTBuD4NjPLe5scDj9gxXFvCdD3nkg
	 kGouUdr+t7sfusd959jzpgkZIi+EIfBcofPK9CzU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQHa55p078363;
	Thu, 26 Dec 2024 11:36:05 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 11:36:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 11:36:05 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQHa5xr072158;
	Thu, 26 Dec 2024 11:36:05 -0600
Date: Thu, 26 Dec 2024 11:36:05 -0600
From: Nishanth Menon <nm@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Kees Cook <kees@kernel.org>, Tony Luck
	<tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Felipe
 Balbi <balbi@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, Devarsh
 Thakkar <devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, <linux@ew.tq-group.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: dwc3: Allow connector in USB
 controller node
Message-ID: <20241226173605.hcvybgbi5pmmeh2b@sweep>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <06497b8aadc0b5becced274d0a5fbcd808d87a48.1733737487.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <06497b8aadc0b5becced274d0a5fbcd808d87a48.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093631_670028_294CB8F6 
X-CRM114-Status: GOOD (  12.97  )
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

On 10:51-20241209, Matthias Schiffer wrote:
> Allow specifying the connector directly in the USB controller node, as
> supported by other USB controller bindings.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 1cd0ca90127d9..2976fb1a58061 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -68,6 +68,12 @@ properties:
>          - enum: [bus_early, ref, suspend]
>          - true
>  
> +  connector:
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    description: Connector for dual role switch
> +    type: object
> +    unevaluatedProperties: false
> +
>    dma-coherent: true
>  
>    extcon:

This needs to go via the USB subsystem team. The device tree changes can
go once this is merged.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

