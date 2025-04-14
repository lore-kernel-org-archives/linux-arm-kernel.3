Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921CAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEPgO6nsWxDMhcy69FrfMIaR0CqA/3l+hKQM8diis4M=; b=unQ27v4OhD1snqDeqiejspojS3
	TvU9fYdQp1vTYvlDiVRxfhqKanR+00tCwVFy+RMfTAXqzC9WsKNgIDhiSUfSZzDOLaWUV+mXy2KDx
	lQS+b/LCYvRF8oAccIKPuFJNXOP2sCElG4aTgkSE6icjbXr3YS/Gy7JLsQ0gU1S0I9LFHoMXtiRZZ
	6h46d5bAvcRZnFMx1kCBkp6vIZSTbhfSrWevKWNPnNOlCujgZqpP5KeLskr30hCNYTrXGO1JX+ksr
	420Nj9cXuCCsII8+6KJqyLSdaEV0cwV1e3L/sB4nAyCseBM5p4xc7RrUZFRYHUyx3skmdeISYoccQ
	aw9rdEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L8A-00000002TiJ-1mMp;
	Mon, 14 Apr 2025 14:49:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ky1-00000002QRK-1HYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:39:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEdH2C2082862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 09:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744641557;
	bh=fEPgO6nsWxDMhcy69FrfMIaR0CqA/3l+hKQM8diis4M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oBUxOJNFmj+s6rDyqWI8q+/h0cMaEO62LC5qknhy/X9b5623vfJJLxPQ47iI1Gu+f
	 elar/5WqF2HWWwxj6A/hMQWJuX4e0jVL8hg5f8pjENJhEPkJaN54+G6AAyFrKioUXY
	 6nSkqGqbhtKrAlmiNl6QjqoPxWuDSJ6Pq51c468U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEdHo7089201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 09:39:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 09:39:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 09:39:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EEdGVp005436;
	Mon, 14 Apr 2025 09:39:16 -0500
Date: Mon, 14 Apr 2025 09:39:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <20250414143916.zhskssezbffmvnsz@dragonfly>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
 <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_073921_435487_F7F12760 
X-CRM114-Status: GOOD (  26.00  )
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

On 18:30-20250414, Siddharth Vadapalli wrote:
> On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:
> 
> Hello Nishanth,
> 
> > On 10:57-20250412, Siddharth Vadapalli wrote:
> > > Hello,
> > > 
> > > This series is based on the following series:
> > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > > 'serdes1' in the SoC file anymore, since that is not a working
> > > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > > 
> > > Hence, this series aims to cleanup the serdesX nodes after the changes
> > > made by the above series.
> > > 
> > > Regards,
> > > Siddharth.
> > > 
> > > Siddharth Vadapalli (2):
> > >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> > >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> > >     serdes0/serdes1
> > > 
> > >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> > >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> > >  2 files changed, 6 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > 
> > I do not understand the logic here. serdes cannot operate without wiz
> > nodes, correct? why would we leave serdes on by default?
> 
> Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
> child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
> cannot enable serdesX.
> 
> Prior to this series, but with the dependent series at:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> applied, the nodes look like:
> 
> 	serdes_wizX {
> 		...
> 		status = "disabled";
> 
> 		serdesX {
> 			...
> 			status = "disabled";
> 		};
> 	};
> 
> The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
> k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
> within the serdesX node which isn't required since:
> a) serdes_wizX enabled but serdesX disabled is non-functional and
> unusable
> b) serdes_wizX disabled in DT implies that serdesX is also disabled


Can we handle all of this in one series instead of two series?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

