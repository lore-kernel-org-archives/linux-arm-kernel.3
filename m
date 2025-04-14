Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F407C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1IFU/hnbem1sYOgooD5MSIx7+OsM6dKMaxDZm3kAPA=; b=agAz9/SyXTpszBR0Fucsa8QPoR
	nA4xBaC/MO175amt53XVcmCvR/4GW1RDMduyu/Oa0jJ2m2VPm/3re7fash2MRmFK59sO9jkv93QS4
	Ce/K2N0Bv3NwA/cr9kVVPhCH58a3u74xOvFKKEz8ov2TiW7ndGyi+7Xqh7fWv8rxfC4vz6rMxS5Bw
	xmyPWBoE7C6EhQWLVitnnXIx9W9pkScLR4cfmwJvuB4W8J9sV3XU8Smx4jwujnBpqMSGwpd1c7GEf
	kG+z4ufj2G0rzjWqvnYS4ZXFnFDFJbvbcrU2WsbFng+DlOe9IGD0BfkhCsEZ1Fci3vOJMjCKeby/R
	oZUqFiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IpL-00000001vhe-3jgj;
	Mon, 14 Apr 2025 12:22:15 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Iey-00000001tuH-3zXk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:11:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ECBTL62151049
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 07:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744632690;
	bh=X1IFU/hnbem1sYOgooD5MSIx7+OsM6dKMaxDZm3kAPA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=crTp8vSGexXVAep0VjsClYlEkM2TsperzpbGVedlKnpOSAvZeq98ZHvL3vsxQzWTR
	 9xesTFusleokXqQ9Q9C2kaxU30yZL+uSwhVvAZp2ZYElMoJKSQPUaKk5/g10uurTBD
	 NL+Q6TZNbDY3q07pfeoHdRbRbxVAP+VXgcEB5AY8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ECBTwJ099694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 07:11:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 07:11:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 07:11:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ECBTtj082970;
	Mon, 14 Apr 2025 07:11:29 -0500
Date: Mon, 14 Apr 2025 07:11:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Dominik Haller <D.Haller@phytec.de>
CC: "robh@kernel.org" <robh@kernel.org>,
        "kristo@kernel.org"
	<kristo@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "vigneshr@ti.com"
	<vigneshr@ti.com>,
        "m-chawdhry@ti.com" <m-chawdhry@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
Message-ID: <20250414121129.srke66ozlydeceux@widget>
References: <20250411101004.13276-1-d.haller@phytec.de>
 <20250411101004.13276-2-d.haller@phytec.de>
 <20250411122942.3gh2prc6cqrynfva@darkish>
 <0f37e6867a057c713f9da7b3bdfac06bdc7f4184.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0f37e6867a057c713f9da7b3bdfac06bdc7f4184.camel@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_051133_086165_F70618E1 
X-CRM114-Status: GOOD (  23.98  )
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

On 11:28-20250414, Dominik Haller wrote:
> On Fri, 2025-04-11 at 07:29 -0500, Nishanth Menon wrote:
> > Quick look comments below.
> >
> > On 12:10-20250411, Dominik Haller wrote:
> > > The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring
> > > TI's
> > > AM68x/TDA4x SoC. It can be used in combination with different
> > > carrier
> > > boards. This module can come with different sizes and models for
> > > DDR,
> > > eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2)
> > > family.
> > >
> > > A reference carrier board design, called phyBOARD-Izar is used for
> > > the
> > > phyCORE-AM68x/TDA4x development kit [2].
> > >
> > >     Supported features:
> > >       * Debug UART
> > >       * 2x SPI NOR Flash
> > >       * eMMC
> > >       * 2x Ethernet
> > >       * Micro SD card
> > >       * I2C EEPROM
> > >       * I2C RTC
> > >       * 2x I2C GPIO Expander
> > >       * LEDs
> > >       * USB 5 Gbit/s
> > >       * PCIe
> >
> > Can we drop the whitespace prefix?
> >
> > >
> > > For more details see the product pages for the SoM and the
> > > development kit:
> > >
> > > [1]
> > > https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
> > > [2]
> > > https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
> > >
> > > Signed-off-by: Dominik Haller <d.haller@phytec.de>
> > > ---
> >
> > Could you share the bootlog in the diffstat along with output of
> > deferred_devices Using the default defconfig -> I want to make sure
> > there are no defconfig updates needed.
> I'll add a bootlog using the default defconfig to the v2 with the style
> fixes.
> deferred_devices is empty.
> PCIe and the TMP102 temperature sensors are not enabled with the
> defconfig as of v6.15-rc1. I plan to send a separate patch with
> CONFIG_SENSORS_TMP102=m but if you can queue that in with the
> devicetree I can simply add that to this series.

you can  post it as a single series and I can pick to the correct
branches.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

