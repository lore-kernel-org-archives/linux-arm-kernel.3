Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918FBD111A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 04:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plZaN47/UeZAG1fxbybtFuEI5NnJRqWIxgjxXp4yRZg=; b=LmpWOSIZuSdN8Ue5OoR09DXYyP
	7A8YuuI5pr3rQLxJvb/YO5M2UVBjdD0lJsT3B7YoS56Z7bKkj4ftYUBqevH/9PhOZW/1riQBdUr+b
	QeNCQC3eO5PhSC6C8N6fiXtAa69GfR+ANqeGxy31v1JX4W4eiEjq+DOR459TzBF8E81dmfZ8oyF/r
	rvSj0JFTnFa7AbKoWtj59jhW87yizpdwIktYVeOYJ7FLUVwNNKMQJ2K1QYQorLO06e+eifcPivgVL
	12OUWzkINiK8kwh5qOZSsG12foK9YfQQRjbPLTDTny0h9KFK+DBXHgBLc1q8SkG8t3g5vaW0IYdjT
	GeTWMJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7p6Z-0000000CeIe-1dVq;
	Mon, 04 Nov 2024 04:54:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7p4s-0000000CeB9-1WKp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 04:52:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A44qStB092545;
	Sun, 3 Nov 2024 22:52:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730695949;
	bh=plZaN47/UeZAG1fxbybtFuEI5NnJRqWIxgjxXp4yRZg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n0Lq0biJsxO+8yz4XUCUtpbLeeuRsFwX4XQs8CjBwyZLlY//OqALPaqBvwc/aoKjO
	 1LppbZ5DTJIhVicdgkPytK64ZiHZJRnUKrGMvBJIk4yIXaQ6sGpEdRzesUHOjmxlEl
	 RBtWJRvFEwyA2O78NlAVdP6kEU9Q/au9fhOrH4cY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A44qSI8011227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Nov 2024 22:52:28 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Nov 2024 22:52:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Nov 2024 22:52:28 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A44qR35090094;
	Sun, 3 Nov 2024 22:52:28 -0600
Date: Mon, 4 Nov 2024 10:22:27 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62: use opp_efuse_table for
 opp-table syscon
Message-ID: <20241104045227.2tzm2lcwi7kqee5r@lcpd911>
References: <20241030044553.3225383-1-d-gole@ti.com>
 <e3c4f895-71a1-481f-86d4-dfab1b61715c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e3c4f895-71a1-481f-86d4-dfab1b61715c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_205234_515103_967B3A7B 
X-CRM114-Status: GOOD (  26.63  )
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

On Oct 30, 2024 at 11:17:16 +0530, Vignesh Raghavendra wrote:
> Hi
> 
> On 30/10/24 10:15, Dhruva Gole wrote:
> > Add another entry in the wkup_conf for the syscon node, and then use
> > that for the syscon in opp-table.
> > 
> > Marking entire wkup_conf as "syscon", "simple-mfd" is wrong and needs to
> > be addressed similar to how other child-nodes in wkup_conf are implemented
> > in the same file.
> > 
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > ---
> > 
> > Since the driver fixes for ti-cpufreq.c have made it in -next [1],
> > The DT fixes for SK-AM62x can be supported with support for legacy
> > style DT as well. This has been tested on SK-AM62x [2]
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/cpufreq/ti-cpufreq.c?id=1724ae88efcbcd0daeb203ffeb4a2c0e59f2ddf7
> > [2] https://gist.github.com/DhruvaG2000/40b80cc04a9ac90c86445d6e67ece4cb
> > 
> > Changelog:
> > 
> > Changes in v2:
> > - Deleted PATCH to Make the AM625 efuse_offset 0, because with [1] we no
> >   longer break backward compatibility and hence need to preserve the old
> >   offset.
> > - Link to v1:
> >   https://lore.kernel.org/linux-arm-kernel/20240902093222.2828345-3-d-gole@ti.com/
> > 
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 7 ++++++-
> >  arch/arm64/boot/dts/ti/k3-am625.dtsi       | 2 +-
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> > index e0afafd532a5..b2b65e31c7cf 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> > @@ -10,7 +10,7 @@
> >  &cbass_wakeup {
> >  	wkup_conf: syscon@43000000 {
> 
> Now that the compatible is updated, this needs to be bus@addr
> dtbs_check should catch such errors.

Oh yes, I'll update this. Good catch.

> 
> >  		bootph-all;
> > -		compatible = "syscon", "simple-mfd";
> > +		compatible = "simple-bus";
> 
> Did you also check U-Boot and make sure no regression/update needed?
> 

No, I can do a quick sanity boot till kernel with this DTB in U-boot to
check for regressions.

Thanks for the review.

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

