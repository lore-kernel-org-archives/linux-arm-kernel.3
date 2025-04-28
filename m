Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3299BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/2bBsmNgshpx+fVZzGiZUVbGDRvaT0rx5juzitARMQ=; b=OIyM3Q6IQTci9HEp02tzQabFCP
	hXJRFFko2eNh1f1oG4hdM2Tf/DWAVWHyK2p2Th12fbSlHrxFYmeo+Lvk1anhmTNyhTRey+BpewETQ
	TssK7iMXQ5e/hTmZaHnYwmsbhwaFhlpz9+iROFH8Oe8FC6lwRqE8rbQ249wdZfiDysDKxg6vidPuP
	OSUQCcWkT0zsAkqgm0KaRt7ItpJT38mSxQuO4MQOmQvRCYdAKx0eLAwvJBBx0FeqLxkDjl9lyM2q9
	IPjcrSEd3s2A4R0mdzK9U6kUgYShzFHUZ8mAVzftUCYtMU1UEATOQXe6MUD5Y00MJlhIbXoK87zY0
	uYi2XnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PdU-00000006f4m-3TCm;
	Mon, 28 Apr 2025 14:39:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PWz-00000006dzl-2ttQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:32:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEWLTE2797771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745850741;
	bh=h/2bBsmNgshpx+fVZzGiZUVbGDRvaT0rx5juzitARMQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xFkUJxoGm9XO51g5jRFTmGUvg7QMqNi7cTL5RW+D7tVOCXzjgGfMzVwTTtglBxE5l
	 R+N3JdSmWftEGudzB6IbyTiEAzl9euBfwRXJtLfY0H509qoxAgwLT8+8vaWwdti9Y7
	 Jp+2lN+Z9aAgskninJLu7DhFFlzepM1nZXp6hWV4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEWL8H130550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:32:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:32:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:32:21 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEWDF0103895;
	Mon, 28 Apr 2025 09:32:13 -0500
Message-ID: <22475489-3142-44dc-8020-e9fd8cf8709e@ti.com>
Date: Mon, 28 Apr 2025 20:02:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_073225_853708_127240F1 
X-CRM114-Status: GOOD (  20.69  )
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


On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> Hello,
>
> The Cadence PCIe Controllers in TI's K3 SoCs namely:
> AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
> support two address regions:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
>
> Currently, the 128 MB region in the 32-bit address space is enabled in
> the device-tree. This might be suitable for most of the use-cases, but
> for those use-cases requiring larger address regions than 128 MB it is
> necessary to switch to the 64-bit address space with the 4 GB address
> region. This series implements the corresponding device-tree changes to
> support the 4 GB address region as the default configuration. Existing
> use-cases should continue to work without any regression.
>
> Series is based on linux-next tagged next-20250417.


For series

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Link to v1 series:
> https://lore.kernel.org/r/20250417120407.2646929-1-s-vadapalli@ti.com/
>
> Changes since v1 series:
> - Fixed the 'ranges' in k3-j721e.dtsi which is the third patch of the
>    series to set the size as 4 GB instead of the incorrect value of 128 MB.
> - Based on Udit's feedback and offline discussion as described at:
>    https://lore.kernel.org/r/7f6ea98c-df6d-4c94-8f42-76cc8306b6c4@ti.com/
>    the address region of 4 GB is split as:
>    0. 4 KB ECAM
>    1. 1 MB IO
>    2. (4 GB - 1 MB - 4 KB) 32-bit Non-Prefetchable MEM
>    instead of the previous split of:
>    0. 4 KB ECAM
>    1. 1 MB IO
>    2. 128 MB 32-bit Non-Prefetchable MEM
>    3. (4 GB - 129 MB - 4 KB) 64-bit Prefetchable MEM
>
> Series has been tested on AM642-EVM, J7200-EVM, J721E-EVM, J721S2-EVM,
> J722S-EVM and J784S4-EVM using an NVMe SSD connected to the PCIe
> Connector on the EVMs.
>
> Test Logs:
> 1. AM642-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5d1814ee2e0857dac0ac08a6cf8759da
> 2. J7200-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/9927faab7615b9c1c101854a213f30f5
> 3. J721E-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/e6545e31f45077fe59c896f8875bf1b9
> 4. J721E-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5c0b64f339f89139797d8346c40b1ee9
> 5. J721S2-EVM PCIe1
> https://gist.github.com/Siddharth-Vadapalli-at-TI/67b03c441d53ef0d27837e615371efbd
> 6. J722S-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/7625f47b57d45aada4c125ac4f60ebd6
> 7. J784S4-EVM PCIe0
> https://gist.github.com/Siddharth-Vadapalli-at-TI/edf2af424fc7d5905832d536a1171a1a
>
> Regards,
> Siddharth.
>
> Siddharth Vadapalli (7):
>    arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
>    arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for
>      PCIe1
>    arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
>    arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for
>      PCIe0 and PCIe1
>    arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for
>      PCIe1
>    arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for
>      PCIe0
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address
>      space for PCIe0 and PCIe1
>
>   arch/arm64/boot/dts/ti/k3-am64-main.dtsi             |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi            |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi            | 12 ++++++------
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi                 |  2 ++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi           |  6 +++---
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi            |  6 +++---
>   .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 ++++++------
>   7 files changed, 26 insertions(+), 24 deletions(-)
>

