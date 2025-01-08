Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2846E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjeBkPMQqyR7BlVmHv45XiZ11hoiUcvKXfiavZCHrmk=; b=YDfQTzqMaSCissP/D4+o8xRhCl
	NiDat5TrsIYB7jaqKvBH2Trj4ffGCjANHwDzQYxwaMc2xpMpXVDpgGwoGYB1JlPhI1R2Za+e9if0s
	wisu4Z4bKotU0qpJwsTA2lQtPshnRVGCp68Th5qWXVSXwWAcvgDYGzVWs06QrVqculK2qAgWVjHiX
	lEQCHxpladRfd/FRozN8HevvwDDcCpqchNf4QUWSWl+u1WTwjP4FwTWPoADPPAi+yQVSHA8FoP0VB
	IrU5JR/q5oXVNutSIecYyN64ZrLA4xPSSDoLGEDVaa9zNBl/csfHkgk1f1hfSACWOLJbs2yM9/V+a
	b1KcDowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYHS-000000091v0-0JBI;
	Wed, 08 Jan 2025 15:47:38 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYGC-000000091ZO-3WXB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:46:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508FkFxI004464;
	Wed, 8 Jan 2025 09:46:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351175;
	bh=yjeBkPMQqyR7BlVmHv45XiZ11hoiUcvKXfiavZCHrmk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eP8P8W/Nn7cQREinI07bmmXbKiT0mWO9ZlPbh1GW6bBXa3nNUjggp8XXMZbSkdoFY
	 Nb4UP6Bg3A33yyhJxvpyHtI+i6OfmNgxdYZ415QuNy+cS6pkNZaNgMdaWgwuKJY/yD
	 OtzGchb2qkd46p8aoiEn/bSold/ZCJrH6ptoh+So=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FkFef012739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:46:15 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:46:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:46:15 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FkE9v082617;
	Wed, 8 Jan 2025 09:46:14 -0600
Date: Wed, 8 Jan 2025 21:16:13 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <ikfjvrqi7jbqmeyjejuhpe4iw7uzaqeuqc3ijf4t6wjqgvextt@j4w5cift7ev3>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors>
 <7hr05eb5st.fsf@baylibre.com>
 <20250108131139.dygei6ejamh5zaij@segment>
 <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_074621_077531_4AB849F8 
X-CRM114-Status: GOOD (  27.60  )
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

On Wed, Jan 08, 2025 at 09:09:37AM -0600, Andrew Davis wrote:

Hello Andrew,

> On 1/8/25 7:11 AM, Nishanth Menon wrote:
> > On 14:46-20250107, Kevin Hilman wrote:
> > > Nishanth Menon <nm@ti.com> writes:
> > > 
> > > > On 15:07-20241205, Kevin Hilman wrote:
> > > > > 
> > > > > On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> > > > > > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > > > > > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > > > > > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > > > > > obtain the regmap for the ACSPCIE_CTRL register within the System
> > > > > > Controller device-tree node in order to enable the PAD IO Buffers.
> > > > > > 
> > > > > > The Technical Reference Manual for J721e SoC with details of the
> > > > > > ASCPCIE_CTRL registers is available at:
> > > > > > https://www.ti.com/lit/zip/spruil1
> > > > > > 
> > > > > > [...]
> > > > > 
> > > > > Applied, thanks!
> > > > > 
> > > > > [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
> > > > >        commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
> > > > > [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
> > > > >        commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
> > > > > 
> > > > > Best regards,
> > > > > -- 
> > > > > Kevin Hilman <khilman@baylibre.com>
> > > > > 
> > > > This will need a bit of fixup - See along the lines of the following.
> > > > Additionally, we should be a bit careful about the dependency of dts
> > > > mix up from two trees.
> > > 
> > > sorry, these should be going through your tree in the first place.  They
> > > are now dropped from my tree, please go ahead and take them along with
> > > Andrews fixup.  Sorry for complicating things.
> > 
> > 
> > Romain,
> > 
> > There is additional fixups needed, unfortunately as well: syscon yaml
> > has two lists based on which dt-schema version you use.. your patch
> > fixed one list, but missed the other as well. Could you integrate the
> > fixes and resubmit, please?
> > 
> > 
> 
> Or since we already have 'ti,j784s4-acspcie-proxy-ctrl' for the same
> reason, you could drop the first patch and re-use this compatible.

I had suggested this in the past since the ACSPCIE IP on J784S4 and J721E
is the same, but Krzysztof insists that there will be hardware differences
in the ACSPCIE block across J784S4 and J721E irrespective of what the
datasheet says, as mentioned by Krzysztof at:
https://lore.kernel.org/r/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/
Therefore Romain had to introduce a new compatible for J721E.

Regards,
Siddharth.

