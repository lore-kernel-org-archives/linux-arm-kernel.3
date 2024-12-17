Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E89BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m06eKb+0LXxL2kWMKmXmynUU1n7kANnjSiqIgxEeFCE=; b=UCohOF7aFSjOKacDCZOnB9h2M2
	u9rAYwdTKRYLfSSFT1VzUMnEuqmNXowd438YFMAAdz68WPMOrRw2e4bgmkU5TxlVhRJvurYM1rTuy
	Zj3Mf8s5F1iQSAkoJcbl3hPeKycgZU/VDbTPhkd5+A0P1lyCqWWBQsFuS2ban/BeVqL8j5KrwX5nK
	cbaeSjvJsWVGRFEOevlO1VPqzwwBzkS1iQ299BorSwF2cUE9lamVVvpRi4P+KTHwD/3OoPucp2UR7
	Qb1agZRWWAxB/T22U2Fh9eJzVS+t1DqGI4wIwwsHd/uitU5rJJPxlfyn2TTAnsEq4x6RZJVbihhaY
	YO1YGmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzW-0000000ESug-1QiF;
	Tue, 17 Dec 2024 18:08:18 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbeC-0000000EOwf-2Bj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:46:18 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHD33jT000978;
	Tue, 17 Dec 2024 18:45:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=m06eKb+0LXxL2kWMKmXmynUU
	1n7kANnjSiqIgxEeFCE=; b=739eMwp8PGdTU/m7CESzZVpZlgISnUYZivGvZ8By
	bleBOS2Vy9Q6igP0fUEH4yq0yoOZWU2aS9cj5ZiQ3m/Js5Da1e37T8sf4S7QO1wX
	s9ppyP60om11SWjLrYZxR056RmQYPh/Etd1OjrHFrgG/3Q+oSTZFK6PpJSJtV6kX
	Aye/fYOxVAgQdpmECEwL+Z5S1pX3r1b/hX7d6dSp/TCSVaaaTfKq3va2kpRnbYAn
	r2WGO4Zh1AUPVuMZJMaFC8f7WlAvdtPEyA2XslXKXFErAYf1t2DnesZhzfKaUkTp
	FLcGtIqts97SykceTBx2JU7TJDkniJ3YE+FukDjoIQC9vA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5ngaw6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:45:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E0D140044;
	Tue, 17 Dec 2024 18:44:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 395FC28AF0E;
	Tue, 17 Dec 2024 18:41:51 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:41:50 +0100
Date: Tue, 17 Dec 2024 18:41:44 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 02/15] dt-bindings: media: add description of stm32 csi
Message-ID: <20241217174144.GA3784949@gnbcxd0016.gnb.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
 <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>
 <Z17JItE-98IIrnMv@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z17JItE-98IIrnMv@valkosipuli.retiisi.eu>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094616_871506_E220D455 
X-CRM114-Status: GOOD (  23.08  )
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

Hi Sakari,

On Sun, Dec 15, 2024 at 12:18:42PM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Thu, Dec 12, 2024 at 10:17:26AM +0100, Alain Volmat wrote:
> > Add the stm32 csi controller description.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> > v2:
> >   - rename into st,stm32mp25-csi.yaml to match compatible
> >   - correct port / data-lanes (remove useless lines &
> >     use data-lanes 1 and 2 instead of 0 and 1)
> >   - correct commit log
> > ---
> >  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > new file mode 100644
> > index 000000000000..33bedfe41924
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/st,stm32mp25-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 CSI controller
> > +
> > +description:
> > +  The STM32 CSI controller allows connecting a CSI based
> > +  camera to the DCMIPP camera pipeline.
> 
> CSI-2 I presume?
> 
> You should also document it here it has D-PHY...
> 
> > +
> > +maintainers:
> > +  - Alain Volmat <alain.volmat@foss.st.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - st,stm32mp25-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: txesc
> > +      - const: csi2phy
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description: Digital core power supply (0.91V)
> > +
> > +  vdda18-supply:
> > +    description: System analog power supply (1.8V)
> > +
> > +  access-controllers:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                minItems: 1
> > +                items:
> > +                  - const: 1
> > +                  - const: 2
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port node
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> > +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> > +    csi@48020000 {
> > +        compatible = "st,stm32mp25-csi";
> > +        reg = <0x48020000 0x2000>;
> > +        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> > +        resets = <&rcc CSI_R>;
> > +        clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>, <&rcc CK_KER_CSIPHY>;
> > +        clock-names = "pclk", "txesc", "csi2phy";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            port@0 {
> > +                reg = <0>;
> > +                endpoint {
> > +                    remote-endpoint = <&imx335_ep>;
> > +                    data-lanes = <1 2>;
> > +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> 
> ...and drop bus-type property.
> 
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    remote-endpoint = <&dcmipp_0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > 

all 3 points corrected within the new serie I just pushed on top of this
one since it has already been merged.

Regards,

Alain

