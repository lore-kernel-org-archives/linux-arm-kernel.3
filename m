Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613ABC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv6Sg9oriYz3cRSUGKqGu91FELTk5ukWJXCsL2561ks=; b=fvfWDKWMZBQw0QgcFqbwwPKPBZ
	lI8vIRpbxvIbuKEYROUu1PFKrMBMDt50AW3w0ohsSaV6dH0InRyEKOHwcx09Jp1r1TPi362flR5s+
	Vn/TkX0i99fcpbvBJfx9DRcLYVCI1rq/VUR0TeDBJjYIv1r7EmAszG/0ebcT+agwqV/mSe0w1ulBW
	OsbqfD9k5dtYP/x8ngwY9jYGgw1J3Dm74ejb11i1e9Z1RTyE/1izQYqRcp/41RK4Oqh3dj6gLgLe1
	g8G3v4++D/dAZ+rgcLuCB4RUe4MVzl6j5+J9Y/O/eefpb/dROVVKP24BXsgVi1qqYimKsp9VtXiiM
	iYxSejzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ObT-0000000D1hI-1jB9;
	Thu, 17 Apr 2025 12:44:27 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ORi-0000000CyUD-3XWH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:34:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCYJGR012975
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893259;
	bh=Zv6Sg9oriYz3cRSUGKqGu91FELTk5ukWJXCsL2561ks=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LAnlnd8EbLuvdd7fbUuERIsjsKa4/3mayZu1noNOj+C1FaX9fijMPbi9j3ORA9zR2
	 GPQibpOCT5bQolJTqUYgIZ2fZOqd3RvvIxYbxMzztSjOPL8W2jIsyiKfqdA8/Jb31g
	 tN7Es/8joOFgvkaPwMhM6b3mOLLkIx1cAznw6Uuk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCYJKT095064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:34:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:34:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:34:19 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCYICZ038854;
	Thu, 17 Apr 2025 07:34:18 -0500
Date: Thu, 17 Apr 2025 18:04:17 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <c952d708-fd56-408b-ad16-15c1c013c396@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
 <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
 <20250414143916.zhskssezbffmvnsz@dragonfly>
 <4106b4b8-6ca7-400f-8862-a45214284326@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4106b4b8-6ca7-400f-8862-a45214284326@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053422_973055_749E9FEC 
X-CRM114-Status: GOOD (  31.30  )
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

On Mon, Apr 14, 2025 at 08:13:19PM +0530, Siddharth Vadapalli wrote:
> On Mon, Apr 14, 2025 at 09:39:16AM -0500, Nishanth Menon wrote:
> > On 18:30-20250414, Siddharth Vadapalli wrote:
> > > On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:
> > > 
> > > Hello Nishanth,
> > > 
> > > > On 10:57-20250412, Siddharth Vadapalli wrote:
> > > > > Hello,
> > > > > 
> > > > > This series is based on the following series:
> > > > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > > > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > > > > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > > > > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > > > > 'serdes1' in the SoC file anymore, since that is not a working
> > > > > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > > > > 
> > > > > Hence, this series aims to cleanup the serdesX nodes after the changes
> > > > > made by the above series.
> > > > > 
> > > > > Regards,
> > > > > Siddharth.
> > > > > 
> > > > > Siddharth Vadapalli (2):
> > > > >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> > > > >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> > > > >     serdes0/serdes1
> > > > > 
> > > > >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> > > > >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> > > > >  2 files changed, 6 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > 
> > > > I do not understand the logic here. serdes cannot operate without wiz
> > > > nodes, correct? why would we leave serdes on by default?
> > > 
> > > Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
> > > child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
> > > cannot enable serdesX.
> > > 
> > > Prior to this series, but with the dependent series at:
> > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > applied, the nodes look like:
> > > 
> > > 	serdes_wizX {
> > > 		...
> > > 		status = "disabled";
> > > 
> > > 		serdesX {
> > > 			...
> > > 			status = "disabled";
> > > 		};
> > > 	};
> > > 
> > > The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
> > > k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
> > > within the serdesX node which isn't required since:
> > > a) serdes_wizX enabled but serdesX disabled is non-functional and
> > > unusable
> > > b) serdes_wizX disabled in DT implies that serdesX is also disabled
> > 
> > 
> > Can we handle all of this in one series instead of two series?
> 
> The idea behind splitting it was that the dependent series is a "Fix":
> - Fix to follow the convention of disabling nodes in SoC file and enable
>   them in the board file.
> while the current series is a "cleanup":
> - No fixes are introduced by this series and therefore it doesn't
>   require a backport.
> 
> I can squash the two series and post them as a v2 if that helps.

I have squashed the series and have posted it at:
https://lore.kernel.org/r/20250417123246.2733923-1-s-vadapalli@ti.com

Regards,
Siddharth.

