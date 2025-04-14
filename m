Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D30C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv0jQ+VDdZHaxd5uxpw41+0vDJIDkJhqKIpTgHF8Kg4=; b=JCQnIOYvi2DGWzb4kEBSJ8al6b
	upHJdqMTSmiZGv1JxwbH6T5eDKYiU+t2W3WUhCGyYJhlXx5YrgioIlG5q9QNxtbBA2I91dFL0WurN
	bkbBm5Rl05R2fPeTDbopW6Dhf9SxtJksjodAmEFolBVI7dNW6HkgW2xeJVXGbkPzAhAUdMNs5nYhr
	P/iWQa0/lfqBAfVKoyVtdoLMb4m/VpC+ch0K6fOM06RVPAUUWLTtqJ+5TxUBae+Rx0dik3ADV1pNg
	KAo/QkAQu3iGmV0JG0HtEf2P+MWUQZgLrAhnW2HW4mbIkw1DTKf5j9A7llLcJbSAhY+s25Ki/9EaE
	Eo53/Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LA1-00000002UBO-0Yyz;
	Mon, 14 Apr 2025 14:51:45 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L1y-00000002Rhg-29bI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:43:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEhM5S2715884
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744641802;
	bh=Yv0jQ+VDdZHaxd5uxpw41+0vDJIDkJhqKIpTgHF8Kg4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vH9oVWJ2uIyvBSU9VlhDOoxmlYDwgXuyyr0/WbkRZLFjfHZ6gyIxuS/8sfOKY0d1E
	 7s4yZEEYzfT3zdXEc9TkLzJnHTubagy0rDw2NqlbwuATOBbhLypN8FvrfIDRmFFRNN
	 zYVbi2NEEezCnGmu7AHrtUBvHSc4RsufvJo5Bf3Q=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EEhMVi091782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 09:43:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 09:43:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 09:43:21 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EEhKZR010492;
	Mon, 14 Apr 2025 09:43:21 -0500
Date: Mon, 14 Apr 2025 20:13:19 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <4106b4b8-6ca7-400f-8862-a45214284326@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
 <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
 <20250414143916.zhskssezbffmvnsz@dragonfly>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414143916.zhskssezbffmvnsz@dragonfly>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_074326_641280_B732F76B 
X-CRM114-Status: GOOD (  29.83  )
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

On Mon, Apr 14, 2025 at 09:39:16AM -0500, Nishanth Menon wrote:
> On 18:30-20250414, Siddharth Vadapalli wrote:
> > On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:
> > 
> > Hello Nishanth,
> > 
> > > On 10:57-20250412, Siddharth Vadapalli wrote:
> > > > Hello,
> > > > 
> > > > This series is based on the following series:
> > > > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > > > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > > > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > > > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > > > 'serdes1' in the SoC file anymore, since that is not a working
> > > > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > > > 
> > > > Hence, this series aims to cleanup the serdesX nodes after the changes
> > > > made by the above series.
> > > > 
> > > > Regards,
> > > > Siddharth.
> > > > 
> > > > Siddharth Vadapalli (2):
> > > >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> > > >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> > > >     serdes0/serdes1
> > > > 
> > > >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> > > >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> > > >  2 files changed, 6 deletions(-)
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > 
> > > I do not understand the logic here. serdes cannot operate without wiz
> > > nodes, correct? why would we leave serdes on by default?
> > 
> > Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
> > child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
> > cannot enable serdesX.
> > 
> > Prior to this series, but with the dependent series at:
> > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > applied, the nodes look like:
> > 
> > 	serdes_wizX {
> > 		...
> > 		status = "disabled";
> > 
> > 		serdesX {
> > 			...
> > 			status = "disabled";
> > 		};
> > 	};
> > 
> > The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
> > k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
> > within the serdesX node which isn't required since:
> > a) serdes_wizX enabled but serdesX disabled is non-functional and
> > unusable
> > b) serdes_wizX disabled in DT implies that serdesX is also disabled
> 
> 
> Can we handle all of this in one series instead of two series?

The idea behind splitting it was that the dependent series is a "Fix":
- Fix to follow the convention of disabling nodes in SoC file and enable
  them in the board file.
while the current series is a "cleanup":
- No fixes are introduced by this series and therefore it doesn't
  require a backport.

I can squash the two series and post them as a v2 if that helps.

Regards,
Siddharth.

