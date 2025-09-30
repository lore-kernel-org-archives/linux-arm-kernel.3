Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75027CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioMp3H6KrLSJJWEalLUIkYC5TSRKBOYlkpJQjihtMzg=; b=VrLTHhXGph9IZVB6oQIMme+Pif
	kAg76d266PhS1o/SHqvPTAIP/DYRqOXs/AKo3yTFwGEd6qL2TqmA6Ib2SDf55TpTjXI7PXsYK1F9m
	eTCPZgveUXccn+7C+n1ao6Mraelu/0yQ3AhLnN97jzem4sH03Rya6+IcLpnesROjJE7/AqgeiLT/b
	Ej/WrNYrQQgB7kVhXAU+BOzrqnZtuXqR0FRS98spnRW3TuOYmv87o9/UlUQx48ibtZAEua+r+jOUr
	Kj63xqAFZQHCVhqtu0s91sdOLFFnG4TpNy8WGP7zIg34i5c02B/VuPElfZH5JOq//6m3LO2EQNCjJ
	INd2yCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cjF-00000005hvj-3erw;
	Tue, 30 Sep 2025 15:57:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cjC-00000005huo-3Um7;
	Tue, 30 Sep 2025 15:57:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759247828; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I5L91SFryh9PWo0AVpJ8DzEfynhJp8Qa8K6IS1VSO1hvFf2LTELb9Ppa80DMjOGzZuI4ReMWA1sAcsIrtfGkgy9sQaKq2wTA39BkgYvZurBlxpRNMyDHjzPETqJ5hsxRWeheNeJSYGa5qwIHAJLI+sfr4ZAejtzcCo8pNa2VYrQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759247828; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ioMp3H6KrLSJJWEalLUIkYC5TSRKBOYlkpJQjihtMzg=; 
	b=K2s8WVu2Mvnf6b0YwSAe8lvq2SPQlWDJJDKl/S3HiTroxlfWTwTYl/SPZamF6T2yIweDHiJblbx91cy+SwQu7+NXkLB0LR9KbXEXDpFWHQ9y3hlW8Ku1kK5YdxG/pPNrWYiL4SR7hq+w8qLCpyH6/ZLVTjQ/rpvCbJIftoK/1ws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759247828;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=ioMp3H6KrLSJJWEalLUIkYC5TSRKBOYlkpJQjihtMzg=;
	b=dY7IHF+eFzJGNOppoeK/Q/lCl7//wKzf9NwwZzeKUsx/cXFOxiSSoM4wRHCqOn6r
	cmV4HmxijmwB5nyX+T2lkhLjeclOuR7ueVENEc2VKAppT7kFYHSesZRQTBt5NxkP4Ww
	K9vL3En+TcxQUkhorWjPofMdiqGqbMwCoOIkzxgY=
Received: by mx.zohomail.com with SMTPS id 1759247826058389.2239892145087;
	Tue, 30 Sep 2025 08:57:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guangjie Song <guangjie.song@mediatek.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: mediatek: Add clocks for MT8196 mfgpll
Date: Tue, 30 Sep 2025 17:57:00 +0200
Message-ID: <3374975.aeNJFYEL58@workhorse>
In-Reply-To: <20250929-whoops-kennel-5f54fb6559a8@spud>
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
 <20250929-mtk-pll-rpm-v1-1-49541777878d@collabora.com>
 <20250929-whoops-kennel-5f54fb6559a8@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_085723_113617_A4882F82 
X-CRM114-Status: GOOD (  25.97  )
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

On Monday, 29 September 2025 19:31:36 Central European Summer Time Conor Dooley wrote:
> On Mon, Sep 29, 2025 at 02:13:20PM +0200, Nicolas Frattaroli wrote:
> > The clock controllers for mfgpll, mfgpll-sc0, and mfgpll-sc1 all need
> > CLK_TOP_MFG_EB to be on if their clock control registers are touched in
> > any way.
> > 
> > This was not known at the time this binding was written, as this
> > dependency only came to light when I started poking at the MFlexGraphics
> > hardware, where this undocumented peculiarity made itself known through
> > SErrors being thrown during register reads.
> > 
> > Add a clocks property to the binding to describe this relationship, and
> > mark it as required for the affected clocks.
> > 
> > Fixes: dd240e95f1be ("dt-bindings: clock: mediatek: Describe MT8196 clock controllers")
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../bindings/clock/mediatek,mt8196-sys-clock.yaml  | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
> > index 660ab64f390d2e722b7d3e25cf057926da318bc0..41aacd8d5f69050eebdf8392f7b652427632f491 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
> > @@ -45,6 +45,9 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    maxItems: 1
> > +
> >    '#clock-cells':
> >      const: 1
> >  
> > @@ -90,6 +93,23 @@ required:
> >  
> >  additionalProperties: false
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8196-mfgpll-pll-ctrl
> > +              - mediatek,mt8196-mfgpll-sc0-pll-ctrl
> > +              - mediatek,mt8196-mfgpll-sc1-pll-ctrl
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: mfg_eb clock
> > +      required:
> > +        - clocks
> 
> Don't you want an else: properties: clocks: false here?

Possibly. I'm never quite sure how strict bindings should be when
it comes to stuff like this. On the one hand, none of the other
compatibles described in it use any clocks that we know of
right now.

On the other, if we have a second set of compatibles that also
needs clocks, but in a different way, would we repeat that for
each such if/then condition? Or would be reformulate this as
some oneOf/anyOf construct specifically for the clock property?

Kind regards,
Nicolas Frattaroli

> 
> > +
> >  examples:
> >    - |
> >      apmixedsys_clk: syscon@10000800 {
> > @@ -104,4 +124,12 @@ examples:
> >          mediatek,hardware-voter = <&scp_hwv>;
> >          #clock-cells = <1>;
> >      };
> > +  - |
> > +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> >  
> > +    clock-controller@4b810000 {
> > +        compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "syscon";
> > +        reg = <0x4b810000 0x400>;
> > +        clocks = <&topckgen CLK_TOP_MFG_EB>;
> > +        #clock-cells = <1>;
> > +    };
> > 
> 





