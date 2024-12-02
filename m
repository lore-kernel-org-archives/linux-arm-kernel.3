Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D0D7830B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vgqNbahwuMClWcsdgda7zc19e2mmsJjqzzMtuFFmBA=; b=3Qk9A4PGwcqT7wKRLK3RD/GXlP
	w0FcDgfYQBwwLGn90NALesf8xX/OusyNOdgQVxhKfflFqzi7h0UnJNKcQzFdb2D76xwZJaSwYbcsb
	SHXyIjpgJ/05K/INl1aDu946WYtSAtR5teOey8D71MARR5FL24GuYUAuBKbwnwxGKT0Zcsb64bRll
	4b9+fkUxkSONpk4a9sON/v6LOBTVApJRfN5swyEALVPVW/iptUhWr1Qv+Zw6PEzeFe4LnRlb3QqjG
	GRYhZyDAw6rpA1cFhE46Q0QutiFcnxg7A1KKJYiAgNL0n0y6Up+zObe4Dbz3ROOAfkunObFjHND/0
	dxllNuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI49r-00000005nBC-04hA;
	Mon, 02 Dec 2024 11:00:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI48r-00000005n7M-1D01
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:59:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Awmcr1282120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 04:58:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733137129;
	bh=2vgqNbahwuMClWcsdgda7zc19e2mmsJjqzzMtuFFmBA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GcpKU428HI9NKHd6UF5q3+UydrZzmd0zo425FzF1FNWxIlm6pigK5pVyDovlyODWW
	 CjOoQgUR99EjuuQIU3V3TVhimuN/0h+KcWemvYgtm5a1estvfUw5aHIB+IYyAajeiH
	 uJKoisHjyZ5I7YZxtW/7mUN+9bD1u33050VWyHR0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Awmhs055903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 04:58:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 04:58:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 04:58:48 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Awkdp100025;
	Mon, 2 Dec 2024 04:58:47 -0600
Date: Mon, 2 Dec 2024 16:28:46 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Romain Naour <romain.naour@smile.fr>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_025901_419174_39992497 
X-CRM114-Status: GOOD (  17.09  )
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

On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:

Hello Krzysztof,

> On 02/12/2024 11:11, Romain Naour wrote:
> > From: Romain Naour <romain.naour@skf.com>
> > 
> > Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> > (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> > provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> > provide refclk through PCIe_REFCLK pins.
> > 
> > Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> > module's PAD IO Buffers.
> > 
> > Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
> > buffer and its functionality is the same across all K3 SoCs.
> > 
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Romain Naour <romain.naour@skf.com>
> > ---
> > With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> > applied on vendor kernel for BeagleBone AI-64:
> > https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> > 
> > v2:
> >  - use generic style comments
> >  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
> >  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
> >    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
> >    (Siddharth Vadapalli)
> > 
> >    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
> >    J721E and all other K3 SoCs.
> 
> No, it shouldn't and you got comment on this. You always need specific
> compatible, see writing bindings doc.

Could you please clarify in which cases reusing the compatible is
permissible? The list of compatibles at:
https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L112
namely,
          - ti,am62-opp-efuse-table
          - ti,am62-usb-phy-ctrl
          - ti,am625-dss-oldi-io-ctrl
          - ti,am62p-cpsw-mac-efuse
          - ti,am654-dss-oldi-io-ctrl
          - ti,j784s4-pcie-ctrl
have all been reused for different TI SoCs since they all correspond to the
device functionality enabled via the CTRL_MMR System Controller registers.
The compatible "ti,j784s4-acspcie-pcie-ctrl" has also been added to the
list:
https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L117
with the intent of reusing it the same way that other compatibles have
been reused.

Regards,
Siddharth.

