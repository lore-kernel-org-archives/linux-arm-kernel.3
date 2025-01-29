Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A4C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Ju9BCFYDjOd/uHCN0vNapSKcR/GM45kfkgX04XSwI=; b=WFNW3dnGUNF7MO
	YUa+hMcpmUmMV2RncamtasGch7Vu+2XqNSVwy4woL8/YU/zw5cqRxVFbMHMjiiplr8povsWelkpht
	T5LjyuAXa3uAr1ebgbCTG41bug009RKjvtydYHZJLOsaC+Dzxo5MJ31Z/7sKXr5PGHG0lxIVF9LWm
	P3peTEyedGfsB1jbR6M9Fm4Efn3bh6Dy47FQhkJvesmj9L3IKDjRH25//2BKip2UKGl+oviPPtBUq
	0IIT+izYEANFPcQPDn8KoJKiTXRKBJ1TtTTrjOx+HTZilpFL+oYFaNx7Pm5V/f7lKCsL6lyINgvYE
	lubiLMQA7BFiAzMILfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td0Tr-00000006LGE-17eF;
	Wed, 29 Jan 2025 05:19:15 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td0SU-00000006L9J-0Orc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 05:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=X6Ju9BCFYDjOd/uHCN0vNapSKcR/GM45kfkgX04XSwI=; b=JBMSSnx0ctcUYymHts7Gah/74C
	uFJs40C9SuKFUCAGes1zpMOzwn/FLcNG+oGV9cCjgoj0ZFeByzHZBBWhFsDmUBYzf/N3NL5g8twZW
	ZlNkke/Rw9YjVqrLCxixzAUC+0xUuZ1gQ5Nc1SAb4VLP+TcqZ3odfli7pwvNW///1Q47VTcicH/ER
	nhBXYjJ6vnXO8l0RK1gEmJZFhiopx8TPLjzgY9NKZksO42RtUjp6m3DZBfY4h6z8wd2YYB/ivF6lU
	Dc+qFBVJl3vvYECMAxaJgpenkTYJ211Xbo1ui6u6gyh7YFMa0Zmdla+Ohnt0xWBX2xfSzju0pT0h9
	Sng5bwnQ==;
Received: from [122.175.9.182] (port=54277 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1td0Ri-0007Uj-1t;
	Wed, 29 Jan 2025 10:47:02 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 1159A17823F4;
	Wed, 29 Jan 2025 10:46:53 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id E0F021782431;
	Wed, 29 Jan 2025 10:46:52 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KyvCiIamOabA; Wed, 29 Jan 2025 10:46:52 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9399417823F4;
	Wed, 29 Jan 2025 10:46:52 +0530 (IST)
Date: Wed, 29 Jan 2025 10:46:52 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250124-reoccupy-music-3803c753f8af@spud>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124122353.1457174-2-basharath@couthit.com> <20250124-reoccupy-music-3803c753f8af@spud>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: 6LML00aApm6KpgWq7NZwIddzwdB6BQ==
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
X-CRM114-CacheID: sfid-20250128_211750_156703_B92B4084 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
>> 
>> Documentation update for the newly added "pruss2_eth" device tree
>> node and its dependencies along with compatibility for PRU-ICSS
>> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> I find this hard to believe. If all these people handled the patch, the
> signoff from Parvathi would be first, no? Should some of these people be
> co-developers?
> 

Changes are about multiple modules. We have added our sign-off followed by original module authors.

>> ---
>>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
>>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
>>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>>  4 files changed, 193 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
>> index e36e3a622904..aad7d37fb47e 100644
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
>> @@ -20,6 +22,9 @@ properties:
>>  
>>        - const: ti,am654-icss-iep
>>  
>> +      - items:
>> +          - enum:
>> +              - ti,am5728-icss-iep
> 
> "items: - enum: <one item>" is the same as const.
> 

Sure, we will modify as below.

      - const: ti,am5728-icss-iep

>>  
>>    reg:
>>      maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>> new file mode 100644
>> index 000000000000..51e99beb5f5f
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
>> +  ecap:
> 
> Why's this one not got a ti prefix?
> 

We will add "ti" prefix to ecap as "ti,ecap" in the next version.

>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      phandle to Enhanced Capture (eCAP) event for ICSS
> 
> Why do you need phandles for these things, can they not be looked up by
> compatible? (e.g. multiple devices on one SoC).
> 

ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have created a separate driver for possible reuse with ICSSG in future.

>> +
>> +  interrupts:
>> +    items:
>> +      - description: High priority Rx Interrupt specifier.
> > +      - description: Low priority Rx Interrupt specifier.


Thanks & Best Regards,
Basharath

