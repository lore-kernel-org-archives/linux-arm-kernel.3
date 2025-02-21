Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5385C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EePyCqMIhGKqIC1G3UvKUVRy6wdzao/mm6Xcy0Z4PeM=; b=fXQebm93fo4TpZ
	eJqbuEENAyT+JScnqYn+ZFw+37nTy54w5BGs6H4oUJ1Qr1UNOePBplfQN66gcBKfmh601GjAxARvW
	TE2gsiHKSZCytL8O0fZZyi+MUNUV8It3566MI54GDn/Bq17zfhih5eyEKX9hdEVuDvGRZoL0PC2tg
	iMSFJqueev3y9aASMCTuraKcTUBXrqyhCpCsOAw+0HUKFVVUsUilIViHkJ6+PK1gapwHQ8y+dNe/S
	iaed8CcpFaa29mz684zsWXxVjqMy/M59pXSGHM2vaOpjY5BykHc2bDcjkQRTRul9DKyO3Q2z+eOqM
	9d/1j22hFcA7cTXvMkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSF7-00000005UNX-2oKm;
	Fri, 21 Feb 2025 12:34:57 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSDe-00000005U41-1JD7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 12:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EePyCqMIhGKqIC1G3UvKUVRy6wdzao/mm6Xcy0Z4PeM=; b=q8Fu59eoITJ4uwVAHCv+k4jSk+
	2uQj7IaWVfvVk5alcCSqyuvyE1eXqZifmZKnMomhSIMwj0w0jUeNztLwllN2z8mxbPSMeaQeisSNG
	DnSYr3hqgQaRw1xSilPXAxPXZKSalyO7zeb3O71lzfZN0UjStGCp9vdhCPera5rF11P1zIDfuzwfR
	qTYKMIRPJTIA5TtNXT2jXD4nXmmkRdqOtjCTE7BX+3YHchuMm1XGzVoFUu0N57YIrjXHEhS8t/Zao
	9e7NG7xRF3YIZhNpJEVwgxvxhWgD4v1MwjKTPrFa7bdRDm5kCSUkoA80WloMkplmvjkzSRMTLXGvl
	gtGqpCyg==;
Received: from [122.175.9.182] (port=49585 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tlSCu-0002Su-1z;
	Fri, 21 Feb 2025 18:02:41 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 2EA9B178215A;
	Fri, 21 Feb 2025 18:02:33 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0A48A178247D;
	Fri, 21 Feb 2025 18:02:33 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M0wu_t15pFmA; Fri, 21 Feb 2025 18:02:32 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id C198D178215A;
	Fri, 21 Feb 2025 18:02:32 +0530 (IST)
Date: Fri, 21 Feb 2025 18:02:32 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: robh <robh@kernel.org>
Message-ID: <1240320242.634119.1740141152414.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250219225130.GA3107198-robh@kernel.org>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250214054702.1073139-2-parvathi@couthit.com> <20250219225130.GA3107198-robh@kernel.org>
Subject: Re: [PATCH net-next v3 01/10] dt-bindings: net: ti: Adds DUAL-EMAC
 mode support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: /oo/U1rbh8omFI7E9oVZggUetPMfQw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_043326_375455_C19142DC 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi,

> On Fri, Feb 14, 2025 at 11:16:53AM +0530, parvathi wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
>> 
>> Documentation update for the newly added "pruss2_eth" device tree
>> node and its dependencies along with compatibility for PRU-ICSS
>> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>> 
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> The sender of the patch S-o-b goes last. And maybe you want a
> Co-developed-by tag here too?
> 

Yes, you are correct. We will address this in the next version.

>> ---
>>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   4 +-
>>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
>>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>>  4 files changed, 191 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> index e36e3a622904..858d74638167 100644
>> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral
>> (IEP) module
>>  
>>  maintainers:
>>    - Md Danish Anwar <danishanwar@ti.com>
>> +  - Parvathi Pudi <parvathi@couthit.com>
>> +  - Basharath Hussain Khaja <basharath@couthit.com>
>>  
>>  properties:
>>    compatible:
>> @@ -19,7 +21,7 @@ properties:
>>            - const: ti,am654-icss-iep
>>  
>>        - const: ti,am654-icss-iep
>> -
>> +      - const: ti,am5728-icss-iep
> 
> Use enum adding to the prior entry.
> 

We will check whether we can use "enum" for 2 consts and address
this in the next version.

>>  
>>    reg:
>>      maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> new file mode 100644
>> index 000000000000..1dffa6bd7a88
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> @@ -0,0 +1,147 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments ICSSM PRUSS Ethernet
>> +
>> +maintainers:
>> +  - Roger Quadros <rogerq@ti.com>
>> +  - Andrew F. Davis <afd@ti.com>
>> +  - Parvathi Pudi <parvathi@couthit.com>
>> +  - Basharath Hussain Khaja <basharath@couthit.com>
>> +
>> +description:
>> +  Ethernet based on the Programmable Real-Time Unit and Industrial
>> +  Communication Subsystem.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,am57-prueth     # for AM57x SoC family
>> +
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to OCMC SRAM node
>> +
>> +  ti,mii-rt:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to MII_RT module's syscon regmap
>> +
>> +  ti,iep:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
>> +
>> +  ti,ecap:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to Enhanced Capture (eCAP) event for ICSS
>> +
>> +  interrupts:
>> +    items:
>> +      - description: High priority Rx Interrupt specifier.
>> +      - description: Low priority Rx Interrupt specifier.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: rx_hp
>> +      - const: rx_lp
>> +
>> +  ethernet-ports:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    patternProperties:
>> +      ^ethernet-port@[0-1]$:
>> +        type: object
>> +        description: ICSSM PRUETH external ports
>> +        $ref: ethernet-controller.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          reg:
>> +            items:
>> +              - enum: [0, 1]
>> +            description: ICSSM PRUETH port number
>> +
>> +          interrupts:
>> +            maxItems: 3
>> +
>> +          interrupt-names:
>> +            items:
>> +              - const: rx
>> +              - const: emac_ptp_tx
>> +              - const: hsr_ptp_tx
>> +
>> +        required:
>> +          - reg
>> +
>> +    anyOf:
>> +      - required:
>> +          - ethernet-port@0
>> +      - required:
>> +          - ethernet-port@1
>> +
>> +required:
>> +  - compatible
>> +  - sram
>> +  - ti,mii-rt
>> +  - ti,iep
>> +  - ti,ecap
>> +  - ethernet-ports
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
>> +    pruss2_eth: pruss2-eth {
> 
> Drop unused labels.
> 

We did verified and all the labels were appropriately used,
could you point us to the exact label you are referring to.


Thanks and Regards,
Parvathi.



