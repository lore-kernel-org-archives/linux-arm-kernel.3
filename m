Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6D1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcLmyf/yI3lueA2N9Nh2ktmh9qhX02LazNi5j2d4bz8=; b=RUYFnPdyZ8vABMX7moId8pMAQb
	99Fhm594oLYNyMEsO7odaaJxpyT4oaJ0nHgXnUI5mr4ApXcu643qUjXkhcVjYE6VokXzh3Yul7oYT
	1F0vJPF+ON/nD6zJ57DnBl0S89EweWKEr1PTgPOJe1Df1NSW4voVlondfPXo4t0kuc9csdQKJ+aZT
	7hqFJ3ihQQ3FHQuMhFWvpb0PaWsUEqK+AIvs0eH/tvbO8dRmpfA4GtigTvLNF2J6YYk3Niq5FbrqJ
	Q+89rqwLw/1e2zkEWCxQhLPt4me5zfj1Y6Ornm4DataVFjjphGLn+3p2+OxFVcdg6df8pUBD1Jt1Y
	ddGnATXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pdp-0000000AY84-1AAP;
	Tue, 29 Apr 2025 18:25:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pbW-0000000AW6N-13BH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:22:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TIMiCd3915107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745950964;
	bh=PcLmyf/yI3lueA2N9Nh2ktmh9qhX02LazNi5j2d4bz8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cMDS6aqDUJhMt1cRjkuTnmzyoSSfP0KPWP1+tF4U+2iSAodzSyP5wQroUsgh8+MxW
	 +TRZC1pDtOxQ7kDGVv7wyLgGxWh/dkS0XToHLdAUuMIMpEkmbE9wNq48YeaZM0eZKf
	 2XcoU4zlSn/0mD65/bT+P5eHJ6JQy9AmmBqBx0Tw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TIMiFb023800
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 13:22:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 13:22:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 13:22:44 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TIMi6Q093030;
	Tue, 29 Apr 2025 13:22:44 -0500
Date: Tue, 29 Apr 2025 13:22:44 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: Re: [PATCH v2 0/3] Set eMMC clock parent to default
Message-ID: <20250429182244.vm2atpuvmdfhtmlc@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250429163337.15634-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250429163337.15634-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_112250_466446_F8407751 
X-CRM114-Status: GOOD (  15.59  )
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

On April 29, 2025 thus sayeth Judith Mendez:
> This series was split-off from "Misc MMC updates" patch series [0] and the
> original patch further divided into three to help with backporting as per
> review comments [1].
> 
> This series sets clock parent for eMMC to the default clock parent
> MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
> does not switch MMC clock parent correctly as per the Arasan IP requirement
> to hold the IP in reset while clock source is switched. Since muxes to
> switch clock parent are not glitch-free and the default parent is tested
> and working fine, switch to the default as a preventative action.
> 
> Changes since v1:
> - split original patch into three
> - add cover-letter
> - reword patch descriptions
> - add review tags
> 

Acked-by: Bryan Brattlof <bb@ti.com>

~Bryan

> [0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
> [1] https://lore.kernel.org/linux-devicetree/20250429142825.bvrbpoc5iz32wh35@garment/
> 
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250429142333.4140010-1-jm@ti.com/
> 
> Judith Mendez (3):
>   arm64: dts: ti: k3-am62-main: Set eMMC clock parents to default
>   arm64: dts: ti: k3-am62a-main: Set eMMC clock parents to default
>   arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parents to
>     default
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>  3 files changed, 6 deletions(-)
> 
> 
> base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
> -- 
> 2.49.0
> 

