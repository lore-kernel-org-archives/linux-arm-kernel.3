Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12BCC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7H05z7jucR/EtRAv3/7u/jdhZGjnuRYvP/7J7BdyYQ=; b=IVU2BfPNkwq//Z5BEftZAy7QMD
	TMcefL/UyF30DIv/7eY/KAswcIw4F8B5JnL1Z8SOKCMzZBHAc7MMh48nFmrO+ppR9UJeyw8D3hNMT
	NBg54AS3Fyp0sL5yhjZlR5IB1WoIPKUSAC1Q5zHr7om1rkJbjlA/YHdAumO5Dr4ssKu0gBd9QHHrO
	HVRPZR0yb04xeXYt5qhi6HO2zEwBMGvbqnpvhSyd+KIjCPhw5yEsMChWT6syIuvGAhrbW2EfK55ci
	q3LnN3ldgqzSTqid8ybZlhdwWr3yfAkfWvf/h2tJRWsHHSEiC6ryTGqQbZcjfA0+AP7YQeczbNR4L
	Q+a5RoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u63zh-000000013cN-3T7F;
	Sat, 19 Apr 2025 08:56:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u63xn-000000013VW-1tGp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 08:54:16 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J8s4K6463776
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 03:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745052844;
	bh=I7H05z7jucR/EtRAv3/7u/jdhZGjnuRYvP/7J7BdyYQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CDngH0LP6iWrIm4xwCRueRHYVp5sJ2QABV3bFAxxaAUlZD6uKswwxPhxNGouxLTGJ
	 raO445F56FsjfEt+fxGp8U0fuxWZkppDOa+qsN3lqpXmSOi79XlQhrSls/kMWt9ndj
	 xqs5TDQXnzIJCdccRF9bS6/ibtJnsOv3r8WkTcPo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J8s4Xn088680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 03:54:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 03:54:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 03:54:04 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J8rVQn040142;
	Sat, 19 Apr 2025 03:53:32 -0500
Message-ID: <02f1912f-0a05-4446-923a-7935ed305cb3@ti.com>
Date: Sat, 19 Apr 2025 14:23:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add DSI display support for TI's Jacinto platforms
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_015415_655531_9919185E 
X-CRM114-Status: GOOD (  12.23  )
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


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Hello All,
>
> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
> - J784S4-EVM
> - J721S2-EVM
> - AM68-SK
>
> [..]
>
> NOTE: For higher resolutions, we need bigger CMA region.
> But for validation, the default value is enough.

I am not sure , how DSS uses CMA region


> I am posting another series to add CMA region to Jacinto platforms
> similar to Sitara family soon:
> <https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/>
>
> Jayesh Choudhary (5):
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
>    arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
>    arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
>    arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
>
> Rahul T R (2):
>    arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
>    arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
>
>   .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 116 +++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
>   .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
>   6 files changed, 454 insertions(+), 1 deletion(-)
>

