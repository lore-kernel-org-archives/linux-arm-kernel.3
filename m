Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9ADD12660
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMy/3ePTYEdmuHR3oKMj/7pQzddxJhXpPNgNE56LFM8=; b=wM7eGttX9Vw/8AR5oejeBg3zkV
	n5CjGbxcIFz4G/qu3b8gUGUhHsooUPBdLfKvkbtOrxcZbWa3+qK98DUDsoMTTPCQJ1i38rKbw/A9N
	QLwXwNhvvn1srPs+rpNZSnO1HkBocj5FDa9uELG3MFqBXEwokG58tD+ZdGKvbEfSlFbDSNNgMLNv9
	F62Gafh1LK2mxMXe+YmCQUaM5weMedoA2tQBC/uPVDWULu0HO/dbEYRn+sPZI1rmGvStRu9gDxuSJ
	cY5JUTC5cG1hV60GilsOlMLDtHpUYogpbQAN6xgLPMdu6Un2HiGO8U9cNAMOKJaiPsAyd2ixmPTLf
	7n7bqKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EGu-0000000GE1p-0nMt;
	Tue, 05 Nov 2024 07:46:40 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EFB-0000000GDgl-1Nz1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:44:55 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A51Uir2031627;
	Tue, 5 Nov 2024 08:44:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=fMy/3ePTYEdmuHR3oKMj/7pQ
	zddxJhXpPNgNE56LFM8=; b=TYud5OSXJDURjb9WH8OmxgZpzywYjos0gnr1wt5Z
	FNeMncJw+I5gU7N0V0M9fU6GzkpIGQY+XumBwW5/V5u6BTXviHXL1CcptzIJ6aQa
	5Ve/UCUI9t61hDreoemI9COiPDCOnV8rC4FIzc77pEi1lecCePpvBtodQfVWdrPK
	1p4Y+8SA/PArMWPIqvcbF4o8XuyWNan7fez+86HUEMfTvpWNHGge4emn7Nr4FhfZ
	31jTNznH5v7uht3DXTSya1cOkJLtWcpiGX8sf5+6g3NiUtc2eGgedYiZy9Pj+Eo1
	YMexn77m9RFBtlhCmEnJITW+PmP3dHO98l8rAnqX80YMSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd05aruy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:44:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E502340046;
	Tue,  5 Nov 2024 08:43:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0658024C45D;
	Tue,  5 Nov 2024 08:42:25 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:42:24 +0100
Date: Tue, 5 Nov 2024 08:42:17 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 02/15] dt-bindings: media: addition of stm32 csi driver
 description
Message-ID: <20241105074115.GA1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
 <c2askprap35pmyanrfvtk333oamjjrolbxhfkar2lgoow4gpcr@xfikinnrs42e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2askprap35pmyanrfvtk333oamjjrolbxhfkar2lgoow4gpcr@xfikinnrs42e>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_234453_694377_B7D1AC11 
X-CRM114-Status: GOOD (  22.66  )
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

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:23:10PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:04PM +0200, Alain Volmat wrote:
> > Addition of the stm32 csi controller driver
> 
> This is supposed to be about hardware, not driver. Missing full stop.

Ok, commit message corrected in the upcoming v2.

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../devicetree/bindings/media/st,stm32-csi.yaml    | 129 +++++++++++++++++++++
> 
> Use compatible as filename.

Fixed

> 
> >  1 file changed, 129 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> > new file mode 100644
> > index 000000000000..71e7c51be58c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-csi.yaml
> > @@ -0,0 +1,129 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 CSI controller
> > +
> > +description:
> > +  The STM32 CSI controller allows connecting a CSI based
> > +  camera to the DCMIPP camera pipeline.
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
> > +                description:
> > +                  Indicate the number of data-lanes and their mapping.
> > +
> > +                items:
> 
> Drop

Done

> 
> ... and test your patches. Mailing list is not the place to test them.
> Your machine is.

I did, however my dtschema was too old hence not reporting the issue.
Once updated I now got the error reported and fixed that.

> 
> > +                  minItems: 1
> > +                  items:
> > +                    - const: 1
> > +                    - const: 2
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
> 
> Best regards,
> Krzysztof
> 

Regards,
Alain

