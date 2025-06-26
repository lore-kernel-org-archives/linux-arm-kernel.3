Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518AFC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 03:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBKAcBpn6IE4UyuR5btcSfdmtxt26FB5KnEyD1oJXTM=; b=wThn0xeX/QOej5n/IVJdKRA0qQ
	QV37oYazbTnSWBQuXpheZurhvQnd38K1uZ65rUUqy0W2x+oLTJYj+AihKQq4yrI4N0d4GfVqvsHTi
	5f4/WZvHwgr/aylDceSbUcJST9ESHb8OEUEdZv9034FwAtkuZ3EosF1AJk0fgiJxTRPqz7J/1JMZT
	mM1x+spYpl8mRcOPVBOIyu9Ga6xOE3WJXzX4PXwXiBMi42Ov0u0KnneyiMKbcCRANjKEaMHpmWjq+
	BxErtpVjcpnNTp17KIN8gymqUsO2I/Fv7D0by3PMc2rSZS/tWexrsZTpPJQ5a9kXP9MOncUs1lqgr
	emeEtJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdlo-0000000AZ6y-0Fz4;
	Thu, 26 Jun 2025 03:59:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdjU-0000000AYpx-1MYj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 03:57:05 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q3uuYx2300854;
	Wed, 25 Jun 2025 22:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750910216;
	bh=vBKAcBpn6IE4UyuR5btcSfdmtxt26FB5KnEyD1oJXTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yYB9fGhRRjMCBTrb+Ke6q6aksP5H9IGdnGqK6J4lZfLvFTbMaKrN0hK/YDHwZMcfn
	 jkLG5y1ff+6GF/RtokvY2hnglLeMysa2n7LyoArxLqg1FDKJ1Dn5WG0j94eiDiBvVF
	 yfHhP4VCVBMGe1861JrFpTA8u0z6wkAum+YiuwMA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q3uupd3271443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 22:56:56 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 22:56:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 22:56:56 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q3upeZ588826;
	Wed, 25 Jun 2025 22:56:52 -0500
Message-ID: <0bf7ccf4-26ae-42f6-b679-d7840e42efc5@ti.com>
Date: Thu, 26 Jun 2025 09:26:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Workaround for Errata i2312
To: Judith Mendez <jm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian
 Hunter <adrian.hunter@intel.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250624221230.1952291-1-jm@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624221230.1952291-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_205704_496372_888DB22D 
X-CRM114-Status: GOOD (  10.48  )
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



On 25/06/25 03:42, Judith Mendez wrote:
> This patch series includes fix for Errata i2312 [0].
> 
> Also include fixes for removing eMMC HS DDR support for am62
> SK which has been descoped as per datasheet [1] and enabling internal
> pullups for AM62 SK and AM62SIP SK, as per JESD84 spec recommendations.
> 
> [0] https://www.ti.com/lit/pdf/sprz487
> [1] https://www.ti.com/lit/gpn/am625
> 
> Judith Mendez (3):
>   mmc: sdhci_am654: Workaround for Errata i2312
>   arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
>   arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
> 

2/3 and 3/3 have no relation to 1/3 and they need to go via different
trees. Please post them separately.

>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      | 25 +++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |  1 -
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts        | 25 +++++++++++++++++++
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 ------------------
>  drivers/mmc/host/sdhci_am654.c                |  9 ++++---
>  5 files changed, 56 insertions(+), 28 deletions(-)
> 

-- 
Regards
Vignesh
https://ti.com/opensource


