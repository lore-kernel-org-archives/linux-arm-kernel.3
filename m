Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1C5C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJW8sToy+Vm9YERDVYBr4q9QXJkQsXqSFm6+U6QtoVE=; b=QwlB6MERPxMTHsf+740ewAm9YV
	tkaVuMmY1UtFUl7hyghSD3MvAQa9gcpclw/vFROGem+6KgQWRV6YefMWUWjNwm4ESRMxswrAykvLX
	zbCVMx7z7slfyFBVTSpUHitL/aiVkve/vK0GjHM0BJj7MZ7CSQA/1ii2yRnHwBEb5w9OydGkp6xL1
	Yr1AWqyyXssToEz6EU2OAxnhNC3R0iE/cAgkaiHlPx+nppI+p4Cb8DMxkEQ4ojkhj8BIvgOldVq+s
	u/uyuoK3rO2mXKTWb3q0ok2HLzCUaGU1uRsZIVp23vWp5PoZrI8hSPd3mOF4TYilBI6OIJLoC9TUl
	wbOihAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Fx-0000000AUpW-3mjf;
	Thu, 17 Sep 2026 02:53:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Fw-0000000AUpQ-2ePa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A28E2601EF;
	Thu, 17 Sep 2026 02:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862931F000FF;
	Thu, 17 Sep 2026 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789613627;
	bh=nJW8sToy+Vm9YERDVYBr4q9QXJkQsXqSFm6+U6QtoVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mt5V0ITn63VkHHJr+9WQ82sjjEFBYCEi+d1F4YPSitcCX9l7+5V5Q4nHjhTiuhmW1
	 PBeZW0krzbml5rXbOnZkvaTM28wusnxID8jlCggDZm3ZXL9fB3ZQqyx8E8UFdvz1gG
	 Vgqok6k3KarUcIu0XXwi0wBxLfMnjB/njv77Fd1EHbe5iyANWUSt5WWcHIHa4hlTT2
	 vf3kVqnGlJu5vZHjhQW17APTk7mqyxS9X0wvAWLo1sbXI0kdGjEi/m2QJr0ZrpWHYY
	 MiBUTmVr4eLbiWUgN1OH3b7NSE1pouqJFRxzmLW84SUdIuHVZdyPCLTzUtsWR0EWa9
	 I8VK3h2n3Igkg==
Date: Thu, 17 Sep 2026 03:53:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 1/8] dt-bindings: iio: adc: stm32-adc: add support for
 stm32mp23 and stm32mp25
Message-ID: <20260917035338.2ef5ded6@jic23-hlaptop>
In-Reply-To: <6e28ede2-686c-4972-8a15-348ae090cec8@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
	<20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
	<20260913040801.30e07d4c@jic23-hlaptop>
	<6e28ede2-686c-4972-8a15-348ae090cec8@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 15 Sep 2026 09:49:01 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 9/13/26 05:08, Jonathan Cameron wrote:
> > On Fri, 11 Sep 2026 17:51:23 +0200
> > Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> >   
> >> Add stm32mp23 and stm32mp25 compatibles. Three ADCs can be found on
> >> these SoCs, split into two blocks:
> >> - ADC12 are tightly coupled (common registers).
> >> - ADC3 is managed independently.
> >> Each ADC is a 12-bits successive approximation analog-to-digital converter,
> >> with up to 20 multiplexed channels that can be configured as single ended
> >> or differential.
> >>
> >> New property "st,adc-trigger-sel " allow to make the difference between
> >> the ADCs and to apply the correct trigger configuration.
> >>
> >> STM32 ADC may be in a power domain: allow a single 'power-domains'.
> >>
> >> Restrict the last channel (19), as it is wired directly to ADC Vref+.
> >> It's meaningless to have direct measurement. Internal Vref with
> >> calibration data from bsec (nvmem) must be used instead e.g. vrefint.
> >> Restrict deprecated properties (st,adc-channels, st,adc-diff-channels,
> >> st,min-sample-time-nsecs).
> >>
> >> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> >> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> >> Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
> >> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
> > 
> > Hi Fabrice, all,
> >   
> >> ---
> >>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 106 ++++++++++++++++++---
> >>  1 file changed, 94 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> >> index c4c4575d3fa9..0e0ceaa3d8d6 100644
> >> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> >> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> >> @@ -23,11 +23,18 @@ maintainers:
> >>  
> >>  properties:
> >>    compatible:
> >> -    enum:
> >> -      - st,stm32f4-adc-core
> >> -      - st,stm32h7-adc-core
> >> -      - st,stm32mp1-adc-core
> >> -      - st,stm32mp13-adc-core
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - st,stm32f4-adc-core
> >> +              - st,stm32h7-adc-core
> >> +              - st,stm32mp1-adc-core
> >> +              - st,stm32mp13-adc-core
> >> +      - items:
> >> +          - enum:
> >> +              - st,stm32mp23-adc-core
> >> +              - st,stm32mp25-adc-core
> >> +          - const: st,stm32-adc-core  
> > 
> > What is this?  Given these all vary in features
> > why would we fallback to a generic match for
> > these new compatibles?  
> 
> Hi Jonathan, all
> 
> Ack, I'll drop it in v2,
> 
> > 
> > 
> >   
> >>  additionalProperties: false
> >>  
> >>  required:
> >> @@ -239,11 +276,18 @@ patternProperties:
> >>  
> >>      properties:
> >>        compatible:
> >> -        enum:
> >> -          - st,stm32f4-adc
> >> -          - st,stm32h7-adc
> >> -          - st,stm32mp1-adc
> >> -          - st,stm32mp13-adc
> >> +        oneOf:
> >> +          - items:
> >> +              - enum:
> >> +                  - st,stm32f4-adc
> >> +                  - st,stm32h7-adc
> >> +                  - st,stm32mp1-adc
> >> +                  - st,stm32mp13-adc
> >> +          - items:
> >> +              - enum:
> >> +                  - st,stm32mp23-adc
> >> +                  - st,stm32mp25-adc
> >> +              - const: st,stm32-adc  
> > 
> > Similar to above, what is this?  
> 
> same,
> 
> > 
> >   
> >> @@ -344,6 +388,12 @@ patternProperties:
> >>          items:
> >>            - const: vrefint
> >>  
> >> +      st,adc-trigger-sel:
> >> +        description: Selects the HW trigger configuration available on this ADC
> >> +        $ref: /schemas/types.yaml#/definitions/uint32
> >> +        enum: [0, 1]  
> > 
> > Magic value that is meaningless to see in a dts.  If they
> > are effectively not compatible, give them different compatibles and
> > drop this property.  I'm unconvinced this property is more
> > useful than that given just how opaque the description is.  
> 
> That's exactly what I was wondering about. As you suggest, I can remove
> this property, and introduce dedicated compatibles in V2, to clearly
> identify the differences.
> 
> Need to distinguish:
> - ADC12 are tightly coupled (common registers).
> - ADC3 is managed independently.
> Triggers are different between them. The purpose of st,adc-trigger-sel
> was to identify that.
> 
> Also MP23 and MP25 are also different (trigger list). Combining this
> would lead to introduce four compatibles, I'm thinking of:
> - st,stm32mp23-adc12
> - st,stm32mp23-adc3
> - st,stm32mp25-adc12
> - st,stm32mp25-adc3
> 
Naming wise, I wonder if it looks too much like adc twelve?
Not sure how to avoid that cleanly as adc1-2 seems odd too.

> I plan to update it in v2.
> 
> Thanks,
> Fabrice
> 
> > 
> > 
> >   
> 


