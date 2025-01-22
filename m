Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2693C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D148uN4hDXdT2rJSZKJwByhsJ6g1FBpWYudcX0hVbmM=; b=va7mpYpckjGFXqKapC3xh9wKN9
	btP1BD7D4UeCzGMYekd8CqcTQJQtaVWUys1QAZ3vE/6EwsKax28v3u3cZ4+puNDcFhOL/8mvHkA3i
	Vy0GXWky+4DQHVbiP9rFZrJ5R+yLwsKAOmumBqi1Q4CkwoXkMWUW+UZWs+3pIgL5bd3S4RFGclW5g
	N2FeF/1EXyzaXgrDzPoRnIiMg3YiqBLB/tgP1WkuymXKTnXOFOKCgGuDGd8BP4pTAxgUCs15QxCn5
	BhwLKNJK1JRSRO47BgU3txOXLtVO2Q2vpHU+suX/JUYHUpTONfMrmJtLdtHnoQgQE6UUbJUFc7BhA
	Idj/42fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY9E-00000009yHY-3FlX;
	Wed, 22 Jan 2025 10:39:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taY45-00000009xQG-1p7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:34:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MAYNrK998000
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 04:34:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737542063;
	bh=D148uN4hDXdT2rJSZKJwByhsJ6g1FBpWYudcX0hVbmM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=asebbBcouZYomCUcR1R60J/3sjbhOTfqfLWJz0eIxYX9TKFIkjastUZyFJ1ymseRX
	 Nt5CjjyVK17BdWqqCqvnlURnvrVwnUSIgDzyGiTptMkqmwpFTwCBhXNO5hILA5PUOR
	 hsVhbAGGnGBVXk3a6HftOLjNpu2CMxmHm9M1gHU0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MAYNw6118463;
	Wed, 22 Jan 2025 04:34:23 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 04:34:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 04:34:22 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MAYLfx010598;
	Wed, 22 Jan 2025 04:34:22 -0600
Date: Wed, 22 Jan 2025 16:04:20 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: syscon: Add
 ti,j784s4-acspcie-proxy-ctrl to second list
Message-ID: <ktchilwqxu3xxu7afa2qkrmkfbwwf3xasyo3jfypizgrl7yd64@nqdp5zle7xkl>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-1-515d56edc35e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-1-515d56edc35e@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_023429_604114_871F91B8 
X-CRM114-Status: GOOD (  16.58  )
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

On Wed, Jan 22, 2025 at 11:24:32AM +0100, Markus Schneider-Pargmann wrote:

Hello Markus,

> The compatible string was only added to the select list, but not the
> second list of compatibles. This adds it  to the second list as well.
> 
> Fixes: 0d078d47cd3e ("dt-bindings: mfd: syscon: Add ti,j784s4-acspcie-proxy-ctrl compatible")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

The fix is already a part of the "for-mfd-next" branch of the mfd tree:
https://git.kernel.org/lee/mfd/c/756d4b7a873c

> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index b414de4fa779ba3289a5f0d484b3c7d0341395d9..0e68c69e7bc9ef8c2c96f0e7d1b5d88eeab2bfba 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -213,6 +213,7 @@ properties:
>            - ti,am625-dss-oldi-io-ctrl
>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl
> +          - ti,j784s4-acspcie-proxy-ctrl
>            - ti,j784s4-pcie-ctrl
>            - ti,keystone-pllctrl
>        - const: syscon

Regards,
Siddharth.

