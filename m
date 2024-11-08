Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95908D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mruf04J5sVswvGHzmEHcLl+Rcw40nQHyAgbU16amRGk=; b=QxghvZGlFmx1Mf912zZrE3lgxY
	Ldof9YxXqP6DrKIVlwyAslrLvDThA84YrUglXdkKZgKAQFCiTwQaSxcf0+rQAqso1fj/nRGvs+VRO
	9HcbVxUoGys7ZWsUmWgZpxk7E6AkpTHiFN4n7R6VPBHrFFssODb14aRmvBex6y+kEiHRf5NAlrmJH
	crbo1opo0CGp4Qxq6XhPc598stHcTC/VM1M7XX9/HPAr2DRmXJIzqK7R4XdZAABYDZUW442dLfewG
	2+jMz6XpzUCJD4NBmADaBUHpBQl1mmN4REyGMNGumQcQS5il88BiPm9saxlpae+a3cUuXE96r2u+T
	MI3UOQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OE4-0000000AY2s-3uAm;
	Fri, 08 Nov 2024 12:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O8c-0000000AXBZ-2yPy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 12:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mruf04J5sVswvGHzmEHcLl+Rcw40nQHyAgbU16amRGk=; b=D9oNCOTPzZE3riGaSQAwFcwtCk
	eJqahV8SFESsV2co3X1rEPcX0HoIvjHsCT6OafYx82s3tXAsxs5YfI6gDoGaMlsTQdma8iyFC2Lhi
	k/JZtK3cWxwnTDIV4NNgMe9nMsu5rYq0YcbckuUvTedaezXv2amPQetLCYcl30ELiTwNkmBMUt3lk
	HCxsGTzb/wrHidnCQ3RxezCoahidkigX9SjYwdSnarR/XgcBOe0b0mOrjq4KsDlo+3jlGParXNvrv
	pKz3u4BL5xcrC1GlIkoRM0XkQazDk5S3ACEIQXLTl+GRfNLuifYrS1sLnM5bESRZPb34KVkstKiVz
	y1eGD+qw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O8Y-0000000CJ7r-44gk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1B9B5C5601;
	Fri,  8 Nov 2024 12:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96802C4CECD;
	Fri,  8 Nov 2024 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731069049;
	bh=lsRVwnN3Hmvnd8CINxQUPLlzC/Ghsnml0MyuvrzJB2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq8+AFQan/3BBhcjt6Yv0qBggmChuS+jJnt9Q0fyt5c8C1R3wh2vwfS4H6IyPVze5
	 759MTX0QieWFTgUX/G5OG4YWiCJdyCPnbnfNLS97p99HU7W/r4t6caOm7YCNpTJMDh
	 1VCy3dQoMeTf+9k+fqDruZL3/vaH34pnF7BmRwTs+5ce+rVkY1KL89s9fDHGi+uqHa
	 e6l0kJHUjUcxErt48ibUjbyb7PsqYVml1ZHyZcpqb8WALKA3bM1NQ1eb9DuGNo7U7H
	 zRjbwmMJ7w9sz3UT+dlD8gLDM07BMbaMER76eRVk9UGCVLZH3nF1GKX3QLlx1lPb4b
	 NLGH4JYP/l21g==
Date: Fri, 8 Nov 2024 13:30:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anwar, Md Danish" <a0501179@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
Message-ID: <c7llcnzthr2ydp4zlyk7rhovwauy5cqeqllvmgmyluypxq3opv@c4suatmd7k3w>
References: <20241107104557.1442800-1-danishanwar@ti.com>
 <20241107104557.1442800-2-danishanwar@ti.com>
 <7f0a73c3-9977-4d07-b996-683ed18e4724@kernel.org>
 <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
 <2c368f5a-4b58-45de-8140-21b2f7af4d12@kernel.org>
 <4ba0381b-d30a-4469-a7c4-327f6ac20c9c@ti.com>
 <2e7a1eb6-df8f-44d4-9342-1bc6d8b5ad11@ti.com>
 <1fa4323b-4cee-4dfe-9c68-55f4465999cf@kernel.org>
 <2a3c54e8-46fc-48f9-8c01-f3bb0c4907af@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a3c54e8-46fc-48f9-8c01-f3bb0c4907af@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_123051_634934_A21FDBE8 
X-CRM114-Status: GOOD (  26.99  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, kristo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, ssantosh@kernel.org, srk@ti.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 08, 2024 at 05:49:54PM +0530, Anwar, Md Danish wrote:
> Hi Krzysztof,
> 
> On 11/7/2024 5:51 PM, Krzysztof Kozlowski wrote:
> > On 07/11/2024 12:58, MD Danish Anwar wrote:
> >>
> >>
> >> On 07/11/24 5:16 pm, MD Danish Anwar wrote:
> >>>
> >>>
> >>> On 07/11/24 5:14 pm, Krzysztof Kozlowski wrote:
> >>>> On 07/11/2024 12:36, MD Danish Anwar wrote:
> >>>>>
> >>>>>
> >>>>> On 07/11/24 5:01 pm, Krzysztof Kozlowski wrote:
> >>>>>> On 07/11/2024 11:45, MD Danish Anwar wrote:
> >>>>>>> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG
> >>>>>>
> >>>>>> Why? We see what you are doing from the diff, no point to repeat it. I
> >>>>>> don't understand why you are doing it.
> >>>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >>>>>>> ---
> >>>>>>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml          | 11 +++++++++++
> >>>>>>>  1 file changed, 11 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> >>>>>>> index 3cb1471cc6b6..cf4c5884d8be 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> >>>>>>> @@ -92,6 +92,17 @@ properties:
> >>>>>>>      description: |
> >>>>>>>        This property is as per sci-pm-domain.txt.
> >>>>>>>  
> >>>>>>> +  clocks:
> >>>>>>> +    items:
> >>>>>>> +      - description: ICSSG_CORE Clock
> >>>>>>> +      - description: ICSSG_ICLK Clock
> >>>>>>> +
> >>>>>>> +  assigned-clocks:
> >>>>>>> +    maxItems: 1
> >>>>>>> +
> >>>>>>> +  assigned-clock-parents:
> >>>>>>> +    maxItems: 1
> >>>>>>
> >>>>>> Why? This is really not needed, so you need to explain why you are doing
> >>>>>> things differently than entire Linux kernel / DT bindings.
> >>>>>>
> >>>>>
> >>>>> I need to add this to the device tree node
> >>>>>
> >>>>> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
> >>>>> +			 <&k3_clks 81 20>; /* icssg0_iclk */
> >>>>> +		assigned-clocks = <&k3_clks 81 0>;
> >>>>> +		assigned-clock-parents = <&k3_clks 81 2>;
> >>>>>
> >>>>> But without the above change in the binding I am getting below errors
> >>>>> while running dtbs check.
> >>>>>
> >>>>> /workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30000000:
> >>>>> 'assigned-clock-parents', 'assigned-clocks' do not match any of the
> >>>>> regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', '^pa-stats@[a-f0-9]+$',
> >>>>> 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$',
> >>>>> 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',
> >>>>> 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
> >>>>> +/workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30080000:
> >>>>> 'anyOf' conditional failed, one must be fixed:
> >>>>>
> >>>>> To fix this warning I added these in the binding and the warnings were
> >>>>> fixed.
> >>>>
> >>>> nah, cannot reproduce. Just be sure you work on recent kernel (last time
> >>>> you were sending it on some ancient stuff) and your packages are
> >>>> updated, including dt schema and other kernel dependencies.
> >>>>
> 
> The purpose of this series is to add 'assigned-clock-parents',
> 'assigned-clocks' to the DT node. Initially I was only trying to add
> these two nodes to DT and at that time I got the above error. I also got
>  the below error as well

So you pasted different error, not related to topic we discussed.
assigned-clock* depend on clocks. You must have clocks to assign them,
obviously. Device should no assign rates to clocks which are not its
inputs. :/


> 
> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
> icssg@30000000: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> 
> To fix this I added 'assigned-clock-parents', 'assigned-clocks' to the
> binding and at this time I got only the below error,

To fix this you must add clocks. The error tells you this.

So again: drop assigned properties. No error msg asked you to add them.

Best regards,
Krzysztof


