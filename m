Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164A8C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEpWTe61+74cG3pFHph2f6+09AGJuOKbyS7idiq4FNc=; b=4U7R6vyjzhLG8cesS9UCI8SNqR
	q7ef0pjz2iNKCRSheLf65zq2tzVW5fJM0DoBOiMiVMOPMYA90elT9Cji5C5cgV7P9/aIAycWS4WZZ
	mzHC1lqa2rx34gG8OKd8ZyNZKGUpsg0Sras0ux6t+6TwpPwbX3jUslhKIqlL3a9mWidfbiLhEjQTH
	ADIoHMu/F7oxtDX+qlDrv1pnzB6SZzcAkYlgzyqI6bM+AYtbponh9+rQJP4DeZdRlH3ermfju1hd1
	k6Q6SjNBkC7MtHbDjg/ZaEly6ssXXgxiGI59jJrgFZHYkiHDLEV/BhWyTsnlHcfgA3AAf8HnKplYx
	y+ZIFdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrnq-00000001DM0-2mA4;
	Fri, 17 Jan 2025 19:14:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrmZ-00000001DA0-0QOh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 19:13:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HJDKJ7384543
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 13:13:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737141201;
	bh=yEpWTe61+74cG3pFHph2f6+09AGJuOKbyS7idiq4FNc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CGp94e1cs3cgvhf6lwgHy7XvzJOmk/cpzZL1khkihQgnCKfdEQwTIqNtlu/u6lFO6
	 Q/WBfmixX0uj/5uYZt/7s9nborg9ENoNDbb3W175UmIhfENLOltKmNkri9ZS9RILSb
	 4hech46b6vf0RA0LU34xddoYFQQ5u0aEkOD4I12A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HJDK57074495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 13:13:20 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 13:13:20 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 13:13:20 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HJDK3H036702;
	Fri, 17 Jan 2025 13:13:20 -0600
Date: Fri, 17 Jan 2025 13:13:20 -0600
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof
	<bb@ti.com>
Subject: Re: [PATCH 0/3] Misc MMC updates
Message-ID: <20250117191320.dr6ls5iwryk7752v@crushed>
References: <20241014194722.358444-1-jm@ti.com>
 <e7c34c5f-b039-4ead-bb50-13a98efdb0c4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7c34c5f-b039-4ead-bb50-13a98efdb0c4@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111327_235107_AA6AD088 
X-CRM114-Status: GOOD (  17.59  )
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

On 09:11-20250117, Judith Mendez wrote:
> Hi all,
> 
> Is there any issue with these patches?
> 
> Thanks (:
> 
> ~ Judith
> 
> On 10/14/24 2:47 PM, Judith Mendez wrote:
> > In this patch series we remove/add MMC DT
> > properties:
> > 
> > - disable-wp
> > - non-removable
> > - ti,itap-del-sel-legacy
> > - ti,itap-del-sel-mmc-hs
> > 
> > for am62x, am62ax, am64x, and/or am65x family devices.
> > 
> > Patches 1/3 and 3/3 have only been built tested.
> > Patch 2/3 has been boot tested on am64x IDK board.
> > 
> > Judith Mendez (3):
> >    arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
> >    arm64: dts: ti: k3-am65-main: Add missing itapdly to sdhci0
> >    arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
> > 
> >   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 2 +-
> >   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 1 -
> >   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 2 +-
> >   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
> >   arch/arm64/boot/dts/ti/k3-am642-evm.dts        | 1 -
> >   arch/arm64/boot/dts/ti/k3-am65-main.dtsi       | 2 ++
> >   arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 -
> >   7 files changed, 5 insertions(+), 6 deletions(-)


Test logs will be helpful, also please rebase once 6.14-rc1 is
tagged and resubmit. looks like it fell through the cracks.

Will be good to get additional reviews on the patches.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

