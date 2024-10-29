Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DE4D2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkmyWd+WEFnErbPoKlztVMnzbLGAaFnM1My2qYl8+jw=; b=rwGA+g62GIq17EbDH2ponCtfhI
	agWFR5ZuCLEsgySydIV6KFRaEzVqLw6XTQnHt4MkYZB3DPp0B9CKbWk5HF84PJvqMfVIKu7x+VM/G
	ZWhH6T7T3RrIvR/mJKlfVjMXV2Lexap6YNs87Z6abiTmhtwjUOEK7VAXqY8jqOW70OEu61lYNhRNZ
	HxgUqFV1MdV4/iEr07t8k2rSQBRC2LugGlXmHe7plmnpvyDhXBnAhZDO0UGOU+9nWdL7/zn4BRFCO
	TvHv374+foSMxFyIKoKpyITEuLeSbg09dGBNWnlyYsLSCgL5T3nNx5cK3nGcGRNeJFHHcRV3b32iq
	ppdylxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jig-0000000E5PL-1iyR;
	Tue, 29 Oct 2024 10:45:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jSi-0000000E2Az-3wxW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:28:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TASRji005328;
	Tue, 29 Oct 2024 05:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730197707;
	bh=OkmyWd+WEFnErbPoKlztVMnzbLGAaFnM1My2qYl8+jw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QrTtYg3KN1nyWkN/J7RMszFEcK82Ad9TORSrBHrCa9xBobCmGofUPDJoAAfJz8HLO
	 FvQxxMr5h19x4dpzMqqBv6Po68iorEN1tk9X4qpPJUfwrQ2xlqRFR5A6bZbfRBHu1x
	 bjGAYnMwLkorSCr0IeWirhYkYslwn82qssAwELE0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TASRdZ005531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 05:28:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 05:28:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 05:28:26 -0500
Received: from localhost (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TASQLY015477;
	Tue, 29 Oct 2024 05:28:26 -0500
Date: Tue, 29 Oct 2024 15:58:25 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Andrew Halaney <ahalaney@redhat.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Keerthy
	<j-keerthy@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        Eric Chanudet
	<echanude@redhat.com>,
        Enric Balletbo <eballetb@redhat.com>, Udit Kumar
	<u-kumar1@ti.com>,
        Beleswar Prasad Padhi <b-padhi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: ti: k3-j784s4: Mark tps659413
 regulators as bootph-all
Message-ID: <20241029102825.fhyuk2rrjusysy7i@uda0497581>
References: <20240916-j784s4-tps6594-bootph-v3-0-ab70da0de7bd@redhat.com>
 <wl6ri2djky2rkfuaj6hhotzgie6el7leno2qupze6geshp6j4i@g7q5a2rt2cmr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wl6ri2djky2rkfuaj6hhotzgie6el7leno2qupze6geshp6j4i@g7q5a2rt2cmr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_032833_097468_05D4090A 
X-CRM114-Status: GOOD (  24.74  )
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

Hi Andrew,

On 09:56-20241010, Andrew Halaney wrote:
> On Mon, Sep 16, 2024 at 12:14:50PM GMT, Andrew Halaney wrote:
> > This series marks tps659413's regulators as bootph-all in order for
> > the nodes (and parent nodes) to be accessible during MCU's u-boot SPL.
> > 
> > This in turn is desired since the tps659413 needs its MCU ESM
> > state machine setup in order for the watchdog to reset the board.
> > 
> > This took me a little while to track down, as enabling the ESM, TPS6594,
> > etc in u-boot would result in the below boot failure:
> > 
> >     U-Boot SPL 2024.10-rc4-00007-g44b12cbcd1b3-dirty (Sep 06 2024 - 14:25:52 -0500)
> >     SYSFW ABI: 3.1 (firmware rev 0x0009 '9.2.4--v09.02.04 (Kool Koala)')
> >     Initialized 4 DRAM controllers
> >     SPL initial stack usage: 13408 bytes
> >     ### ERROR ### Please RESET the board ###
> > 
> > Which turns out to actually have failed far earlier in spl_early_init(),
> > due to these nodes not being accessible in u-boot. That's hard to tell
> > though since console isn't setup until later (and for that reason I
> > think spl_early_init()'s return value in j784s4_init.c isn't
> > evaluated since a panic() at that point would leave a user with *no*
> > information at all).
> > 
> > I've tested this in conjunction with a u-boot series which I'll link in
> > a follow-up response on the k3-j784s4-evm. I'd appreciate someone testing
> > on the k3-am69-sk at a minimum, as it should suffer the same fate if things
> > aren't setup appropriately.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > Changes in v3:
> > - Added Udit's Tested-by tags
> > - Reordered bootph-all to align with dts-coding-style (Beleswar)
> > - Link to v2: https://lore.kernel.org/r/20240911-j784s4-tps6594-bootph-v2-0-a83526264ab1@redhat.com
> 
> This applies fine still on linux-next, any chance this could be picked
> up?

You might've to re-spin the series, I saw that [0] got merged and you
might've to put j784s4 related changes in k3-j784s4-j742s2-evm-common.dtsi
now instead.

Regards,
Manorit

[0]: https://lore.kernel.org/linux-arm-kernel/20240902-b4-upstream-j742s2-v6-0-6a7aa2736797@ti.com/
> 
> The associated[0] u-boot change is dependent on this and it would be
> nice to get the wdog working on mainline u-boot + linux.
> 
> [0] https://lore.kernel.org/all/3bf2177d-178f-46bf-abfe-6f00a52c623b@ti.com/
> 
> 

