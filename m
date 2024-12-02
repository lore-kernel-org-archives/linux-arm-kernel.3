Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD5D78332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wANpDU65LhU/8X4F+bXK7+FUgsbERBICABWmsZeuQxA=; b=0d0Z+vYlA0DJpFlRykrB6RPOgh
	ec2m4JMb8a2PN8fuEpZeUlIpo+92RW/JpzVWXj+s2IleUN9yBlzweMRApEWervoDT65ilSvOpzcRX
	zPCDUIYBVNxg8GO+cY136K3E5QomBw2YGTEUkIF1Hhsz3EFt+4Ml/ZAmm7naLYB9JMmrNPCkrFOIv
	ehBaNfJsz5XbFH8zM0NqXKTUqDXOa1BirL6U/+1gS9Rs3RD6sLk/Un0Q7kM6ZZWQcxE3S9YTI9von
	SPzPSUW44j6UWwhNdf4bdHWnVMf7GS6oWELHuJzwskIbBLqi6XG4Y8OpQ7Sk21dGhw+SANZTNKrav
	IdD9uQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8dW-00000006iBM-0zPi;
	Mon, 02 Dec 2024 15:46:58 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8cP-00000006hw4-02rM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:45:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2FjjrN114294;
	Mon, 2 Dec 2024 09:45:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733154345;
	bh=wANpDU65LhU/8X4F+bXK7+FUgsbERBICABWmsZeuQxA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jFnqVkxOIUyPOkGVaCVEyrgdzttAInlmUGz4K49J1QYGbRX3VbQ3/AaZiDZXls69J
	 sRj6A3T2hq5s6b27di1Uut3P1QDu+UJ1S31GYwueGCc1gbWo0jfrA5x/n7pbFTE0I6
	 DD5GMW2bDD0MDxEwp8a+YDExQw6lkTcWfj7Zm1og=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2FjjZr018855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 09:45:45 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 09:45:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 09:45:44 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Fjh03025124;
	Mon, 2 Dec 2024 09:45:44 -0600
Date: Mon, 2 Dec 2024 21:15:43 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Romain Naour
	<romain.naour@smile.fr>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <rjecpmr4bsedbfhu74sdlzmdz2mh2shsr5myawb3qveooawa3j@i2ysnnyf7hio>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
 <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
 <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
 <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074549_137006_1D03CBE8 
X-CRM114-Status: GOOD (  26.02  )
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

On Mon, Dec 02, 2024 at 04:09:51PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:53, Siddharth Vadapalli wrote:
> > On Mon, Dec 02, 2024 at 12:07:17PM +0100, Krzysztof Kozlowski wrote:
> > 
> > Hello Krzysztof,
> > 
> >> On 02/12/2024 11:58, Siddharth Vadapalli wrote:
> >>> On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:
> >>>
> >>> Hello Krzysztof,
> >>>
> >>>> On 02/12/2024 11:11, Romain Naour wrote:
> >>>>> From: Romain Naour <romain.naour@skf.com>
> >>>>>
> >>>>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> >>>>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> >>>>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> >>>>> provide refclk through PCIe_REFCLK pins.
> >>>>>
> >>>>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> >>>>> module's PAD IO Buffers.
> >>>>>
> >>>>> Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
> >>>>> buffer and its functionality is the same across all K3 SoCs.
> >>>>>
> >>>>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> >>>>> Signed-off-by: Romain Naour <romain.naour@skf.com>
> >>>>> ---
> >>>>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> >>>>> applied on vendor kernel for BeagleBone AI-64:
> >>>>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> >>>>>
> >>>>> v2:
> >>>>>  - use generic style comments
> >>>>>  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
> >>>>>  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
> >>>>>    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
> >>>>>    (Siddharth Vadapalli)
> >>>>>
> >>>>>    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
> >>>>>    J721E and all other K3 SoCs.
> >>>>
> >>>> No, it shouldn't and you got comment on this. You always need specific
> >>>> compatible, see writing bindings doc.
> >>>
> >>> Could you please clarify in which cases reusing the compatible is
> >>> permissible? The list of compatibles at:
> >>
> >> Never? You always need specific compatible. Did you read the writing
> >> bindings document?
> > 
> > I went through the bindings document again at:
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindings.rst
> > It mentions:
> > - DON'T use 'syscon' alone without a specific compatible string. A 'syscon'
> >   hardware block should have a compatible string unique enough to infer the
> >   register layout of the entire block (at a minimum).
> > 
> > The ACSCPCIE Block as well as its integration across all of TI's K3 SoCs
> > is the same i.e. same Hardware/IP. The register bits corresponding to
> 
> 
> And first rule for compatible property? DT bindings maintainers keep
> repeating it over and over - specific means soc as front compatible.
> 
> > the feature to be enabled/disabled via the ACSPCIE block are the same as
> > well i.e. "register layout can be inferred". The same goes for the
> > compatibles listed below in my previous reply i.e. they aren't bugs.
> > Same IP and integration across SoCs and hence reused in the sense of
> > Hardware and not Software. I hope this clarifies the rationale for the
> > "reuse".
> 
> 
> You mix re-use with fallback. These are almost never the same blocks,
> which you imply here.

I know that the IP is the same, the bits are the same and those bits enable
the same functionality of the IP across the SoCs. If you still insist that
they are not same, I don't know what to say anymore.

Regards,
Siddharth.

