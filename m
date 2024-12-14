Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB3EE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bikUv5chFR7Mp0GtINpALlwdheFMLn92Zv1sVgMXCcM=; b=JiVXs5h8JCF+6jJizSwcgjBoo2
	cLhuqKwkVZPyNLgknzLz9QaOJx8EiBFVhRW8QQfoeUEbCAecMPimg2lXiEIPQshneS6UmuQ/AC7W+
	flkJHj6ee25+EsaoZpSXmx3ThyrNUJP+CPf7ZCFtK28uiLaiWY7ALnHUUHvKtoCT+u3QXC6fiN0rp
	6uNpMhada5Wx2gbbAajurvMe5JEvNoW6ONKWjDJEN4bB2fYG28oYyn/uxGHOw9U3PV+fcPBv9HP1i
	P/MJB6VXWvsvPdGXH0HTXNOfOROimPWnVx8GGRo58gbbjjSdMyPLRPneqbbgbdOra9q/aYBNQA81R
	16NzNIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMa90-000000070kv-0DAW;
	Sat, 14 Dec 2024 21:57:50 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMa7u-000000070fK-21I4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 21:56:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BELuO4A079250;
	Sat, 14 Dec 2024 15:56:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734213384;
	bh=bikUv5chFR7Mp0GtINpALlwdheFMLn92Zv1sVgMXCcM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Su6orVk4oGSPdNpzzHJP1K/BxQb91vziqP80ujdPLV4F5FxIncFmZccYomZwYfdjQ
	 VGKuhfoa2tTGiEmsG9YgLdfhIw4zAWaPgIb52/M9AAAt3LAtG8KYAL1gmo67ZhkPmK
	 JsyOWwm6Jz/pxmbd2+4tTPTvdlLuno/FGdCiZf9Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BELuOnd024904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 14 Dec 2024 15:56:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 14
 Dec 2024 15:56:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 14 Dec 2024 15:56:23 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BELuOOP089856;
	Sat, 14 Dec 2024 15:56:24 -0600
Date: Sat, 14 Dec 2024 15:56:24 -0600
From: Bryan Brattlof <bb@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
Message-ID: <20241214215624.e372oju6eserpf4f@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
 <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
 <Z12rnZiCXQxtMWlf@livingston.pivistrello.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Z12rnZiCXQxtMWlf@livingston.pivistrello.it>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_135642_681856_3DB53DC6 
X-CRM114-Status: GOOD (  26.76  )
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

On December 14, 2024 thus sayeth Francesco Dolcini:
> On Sun, Nov 17, 2024 at 11:34:07PM -0600, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. All of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >     https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
> >  arch/arm64/boot/dts/ti/Makefile                  |  3 +
> >  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
> >  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
> >  arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
> >  arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
> >  7 files changed, 252 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > index 18f155cd06c84..b109e854879cb 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > @@ -31,6 +31,12 @@ properties:
> >            - const: phytec,am62a-phycore-som
> >            - const: ti,am62a7
> >  
> > +      - description: K3 AM62L3 SoC and Boards
> > +        items:
> > +          - enum:
> > +              - ti,am62l3-evm
> > +          - const: ti,am62l3
> > +
> 
> can you clarify the differences between AM62L and AM62L3? you have a mix of names in this series. I assume that
> AM62L is the SOC family / product name, while AM62L3 is a specific 
> part number.
>

Absolutely! I found the naming a bit confusing myself. 

We (the baseport teams) have kinda coalesced into using less digits as a 
way to describe all devices included in the subgroup. So for example AM6 
would be all Sitara class MPUs in the K3 generation. AM62L would be all 
parts in K3 in the 'lite' derivative. AM62L32 would be all AM62L parts 
with display and dual cores.

But I should probably decode everything as these part numbers are really 
opaque in my eye if you don't see them every day. 

The full orderable part number for this part is the XAM62L32AOGHAANB

    'X' is the production status. If you see an 'X' here it just means 
    it's a pre-production sample that hasn't gone through validation. 
    Most of the time (outside of TI) this will be blank

    'AM' is the prefix which indicates a Sitara class of SoC. The AM68 
    and AM69 being originally a Jacinto class part kinda makes this more 
    confusing but back in the day i think it used to stand for ARM 
    Microprocessors so that's what I've been telling people.

    '62' is the generation and family of the part. So this example the 6 
    indicates the K3 generation of SoCs and the 2 means it's an MPU 
    family with 2k display or 2k camera support among other things.

    'L' is the derivative of the family. This is mostly a marketing 
    thing to indicate the target market for the SoC:

      AM62  (or blank) would be the general base class
      AM62A is for the analytics derivative
      AM62D is for DSP
      AM62P is for Plus
      AM62L is for Lite

    '3' is the configuration. This really depends on what the business 
    teams find feasible. Some of the family/derivative combinations
    don't make sense to have. For example an AM62L9 which would just be 
    the base AM62 derivative, so some configurations may not exist.

      0 = No Display / No ISP
      1 = No Display with ISP
      2 = No Display with ISP and Analytics
      3 = Display / No ISP
      4 = Display / No ISP with Analytics
      5 = Display / No ISP with GPU
      6 = Display with ISP
      7 = Display with ISP and Analytics
      8 = Display with ISP and GPU
      9 = includes everything

    '2' is the core count. AM62L32 would be the dual core option.

The rest of the digits get into stuff we try to do automatically via our 
bootloaders so you wont see any mention of them in Linux, but I kinda 
wanted to continue decoding this :)

    'A' is the silicon revision. A = SR 1.0 

    'O' is the speed grade. (there is a table somewhere with all the 
    speed grades we support. The two I know about are.

      O = 1.25GHz
      E = 833MHz

    'G' is the feature set. Because the derivative is 'L' (or lite) we 
    probably won't have options other than G which is the baseline

    'H' is the security & functional safety value

      'G' is non secure no functional safety. (like the beagleplay)
      '1-9' are dummy key devices with no functional safety
      'H-R' are production key HS devices with no function safety 
      'S-Z' are production key HS devices with function safety
        
'H-Z' is probably the most common security you will see TI make now. 
There are ways (by talking to sales) you can purchase other variants for 
special use cases (like aviation) but I think these are all special use 
cases with unique regulatory or security issues.

    'A' is the temperature rating
     
      'A' = -40C to 105C
      'I' = -40C to 125C

    'ANB' is the package: 11.9mm x 11.9mm with 0.5 BGA

There can be a total of 18 digits which can vary when decoding the 
family (AM65, AM64) but generally this decoding scheme will hold. I only 
really see those weird parts with our vertically integrated customers 
with their own sales teams.

Sorry for the essay. I went though our catalog one day and had the very 
same question you did so I wanted to dump as much as I could.

~Bryan

