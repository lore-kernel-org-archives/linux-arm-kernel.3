Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375ECC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJ/MQEOFn51fZY59uzPsubNIli4RMHGxcabIb/8mjwY=; b=A8RVaLvTxycwo4JaBOfggGRkrK
	3ToZZ0W6hhBssiyO6kfEtQbhyWkFKC9CqBusu7TEw8wo5mkFCh7vORL+LBdiWtE03OCstllLn2L52
	FoPTI2tUnRiREHtpjlHn9sPs8DlBw/6TMAbvz1RQ24TH8GOADwU3yvW06Z8n9mN2bJKNTDU+eAXiP
	IVTKVQgNQbK7UKHa5wvgiMaCK09SP7wB6Qg0D74OtF3jtUSsP1dpfFVWj9KAWaWbmasFbrWviV1hU
	RZXUWN6iI6ojOCcHbizqdzgAtP/8q+ZX28n9UdO8fEuZle5ulMtqjlQfpRCzxGJrh81UNT/a7F2aw
	NF5nODoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td89e-000000071Hj-1BI4;
	Wed, 29 Jan 2025 13:30:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td88L-000000071D8-14bd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738157373; x=1769693373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WesBG+jjD2tRTVdByBwKWmtB14CYZppXcUWCk3ge0Vc=;
  b=fqB8kRK/J6663fJ/ePJ6gcZC3nRRRJVAqjuCoKbmJGXLyHa1VeKpzidj
   m8eww9YCgXncsKRVpUsiEJH1qa/klFeT5ey0h3Pln/cXfJijMwzXMgkN+
   MXQEhtCHCACB20g4ALr4WxjrfUsdAnmiY5+pI+zqCSelMGn6st0Ms620E
   Q36KjLUsW8s8YK41YxIL7RnafAl3w+h1AgvN4zvFuVdW77W0F91yvE97X
   N79Rs4EXrq8TULm1OWB25eOrvnmea2QLCeew10Ui6ZnDTUKX1SSQM1BAp
   k70mUoQ2SzhThxdksJ2eg5tJ1CAdxL7fM1A10SRrjiLtuJdJMPN4BFjgG
   Q==;
X-CSE-ConnectionGUID: Qu3qKRu3QiuJYJdtclTq/g==
X-CSE-MsgGUID: 4v9D/ymHTqajRbX7K2tZUw==
X-IronPort-AV: E=Sophos;i="6.13,243,1732604400"; 
   d="scan'208";a="268371753"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jan 2025 06:29:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Jan 2025 06:29:26 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 29 Jan 2025 06:29:24 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<broonie@kernel.org>, <claudiu.beznea@tuxon.dev>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: misc: atmel,at91-ssc: Convert to YAML format
Date: Wed, 29 Jan 2025 15:28:23 +0200
Message-ID: <20250129132822.9382-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129-vagabond-scrupulous-scorpion-b57db9@krzk-bin>
References: <20250129-vagabond-scrupulous-scorpion-b57db9@krzk-bin>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_052933_333215_4F0F81E6 
X-CRM114-Status: GOOD (  10.54  )
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

Hi,

Thank you for the review.

I will place this in: Documentation/devicetree/bindings/sound/
because the SSC it is used only for Audio.

>
> Missing dai-cells. Old binding said 0, now you say anything...
>
> Missing required block
>
>> +allOf:
>> +  - $ref: ../sound/dai-common.yaml#
>
> Full path, so /schemas/
>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - atmel,at91sam9g45-ssc
>> +    then:
>> +      required:
>> +        - compatible
>> +        - reg
>> +        - interrupts
>> +        - dmas
>> +        - dma-names
>
> So only dmas?
>
>> +        - clocks
>> +        - clock-names
>> +    else:
>> +      required:
>> +        - compatible
>> +        - reg
>> +        - interrupts
>> +        - clocks
>> +        - clock-names
>
> Drop entire required:
>

I have a question:

1) The old binding said if "atmel,at91sam9g45-ssc": add dmas and DMA-names to the list:
	- compatible, reg, interrupts, clock-names, clocks
   Why do you ask: "drop entire required"?
   I intended to set the required through a conditional.
    case 1) dma transfer
    case 2) pdc transfer

Best Regards,
Andrei Simion

