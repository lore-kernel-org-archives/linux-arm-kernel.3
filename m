Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7950CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1GxC5wEZ7w0hRkO573JUt7hmP/RrOOhSWDg3A2PT/o=; b=Ua+1x3CSdw92F/
	A5CrRj9wmXo1Yikz9vq88xabgqouLR+U2XD3G4xOJzBk137S2f70WXbAGcqBufIfLIXfRZpg73jHP
	MUO74EEnc34b/6FaoHyPhpKJFkgdzeZldNRI8wufpZslpE/voHVH5zclkHEqzv8JK3jChO4KnZmGz
	fwQyrn45Ea+PdAHJBbVS0L7N/gVUl9VTItdlV51KPkjSlEYNcm1/HywO97S7kqhiCK2D0bhruXPw4
	3KpCAuJJc0Cf4L7I6XV+eYdgXxLVTnPexVrnXvGXHOQMWJwqtNlKhsY+E0rZ4WLgWtdpDmpCVD+/j
	JOpYwQNQHcgQ2Lm1wu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjHr-00000005mxd-1Fdl;
	Wed, 03 Sep 2025 08:56:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiO1-00000005KZS-2LyQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:58:35 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5837w2q73215022;
	Wed, 3 Sep 2025 02:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756886282;
	bh=C1GxC5wEZ7w0hRkO573JUt7hmP/RrOOhSWDg3A2PT/o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gm/FiO2863E9riM2wUW/YKWv+8Hap14okkUNr7krZuwkWdIUMhHcNztY9yuLsb/me
	 HcYQNkHXf/M0DnC+lgydKkWhm8U+ai3ViN3TsI32t0zs3rNF8a1iM6VSvY3nCXGFZH
	 AlQQf2CZdmkmuaDdcQSLogjYpUH0z4Br8PsHf/q0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5837w2lr3363202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 02:58:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 02:58:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 02:58:01 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5837vpEY1226636;
	Wed, 3 Sep 2025 02:57:52 -0500
Message-ID: <d994594f-7055-47c8-842f-938cf862ffb0@ti.com>
Date: Wed, 3 Sep 2025 13:27:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
 <20250903-peculiar-hot-monkey-4e7c36@kuoka>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250903-peculiar-hot-monkey-4e7c36@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_005833_697556_16B8ED57 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 03/09/25 12:49 pm, Krzysztof Kozlowski wrote:
> On Tue, Sep 02, 2025 at 02:37:40PM +0530, MD Danish Anwar wrote:
>> Extend the Texas Instruments K3 R5F remoteproc device tree bindings to
>> include a 'rpmsg-eth' subnode.
>>
>> This extension allows the RPMsg Ethernet to be defined as a subnode of
>> K3 R5F remoteproc nodes, enabling the configuration of shared memory-based
>> Ethernet communication between the host and remote processors.
>>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml     | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>> index a492f74a8608..4dbd708ec8ee 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>> @@ -210,6 +210,12 @@ patternProperties:
>>            should be defined as per the generic bindings in,
>>            Documentation/devicetree/bindings/sram/sram.yaml
>>  
>> +      rpmsg-eth:
>> +        $ref: /schemas/net/ti,rpmsg-eth.yaml
> 
> No, not a separate device. Please read slides from my DT for beginners

I had synced with Andrew and we came to the conclusion that including
rpmsg-eth this way will follow the DT guidelines and should be okay.

I have another approach to handle this.

Instead of a new binding and node. I can just add a new phandle to the
rproc binding. Phandle name `shared-mem-region` or `rpmsg-eth-region`

Below is the device tree and dt binding diff for the same.

diff --git
a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a492f74a8608..c02c99a5a768 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -210,6 +210,16 @@ patternProperties:
           should be defined as per the generic bindings in,
           Documentation/devicetree/bindings/sram/sram.yaml

+      rpmsg-eth-region:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: |
+          phandle to the reserved memory nodes to be associated with the
+          remoteproc device for rpmsg eth communication. The reserved
memory
+          nodes should be carveout nodes, and should be defined with a
"no-map"
+          property as per the bindings in
+
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+        additionalItems: true
+
     required:
       - compatible
       - reg
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index e01866372293..e70dc542c6be 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -61,7 +61,13 @@ main_r5fss0_core0_dma_memory_region:
r5f-dma-memory@a0000000 {

 		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0xa0100000 0x00 0xf00000>;
+			reg = <0x00 0xa0100000 0x00 0x300000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_memory_region_shm: r5f-shm-memory@a0400000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0400000 0x00 0xc00000>;
 			no-map;
 		};

@@ -768,6 +774,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	rpmsg-eth-region = <&main_r5fss0_core0_memory_region_shm>;
 };

 &main_r5fss0_core1 {


In this approach I am creating a new phandle to a memory region that
will be used by my device.

Can you please let me know if this approach looks okay to you? Or it you
have any other suggestion on how to handle this?

> talk from OSSE25. This is EXACTLY the case I covered there - what not to
> do.

Sure I will have a look at that.

-- 
Thanks and Regards,
Danish


