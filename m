Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B7CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tHPqKKnRlf/2yoYaU51ff9krR9hR2OUkjvBjZR7nbs=; b=2whyI5xs4/MzMXrRTORREEpZvB
	7jG+8d4N5X/j/Up5TEYW70ji5yv7HGCwZsctyDMWSjXvHEqSoaKo7LkP9Qj0bt32Tkh8E+YP2kGXS
	q8hmO6cj0Kbgor6aSAGHVbqldDJHlG35SzuPCVTgxddaRPGWJg5SeIyhOnTpt/mf/1fNSU61ms6tG
	/Ks4gl8GO8YBFY9jU3Zxf0IJxpEZpNuE6HPxk+SqRU/2lCBWZJVmWchsVxV4YZ95ulg2RZQGDN6UZ
	dVNyQ2n4m2zI+gSicdy+1SrGf15bRjUlBg2xxM/JXtQ7FRdKYi1UDPgCThTF+eW3kHhpMBF/BXNHD
	M64UaSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSbb-00000002lAU-2Hwy;
	Fri, 22 Aug 2025 14:18:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLA4-00000001gRz-3Q0T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:22:06 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57M6LvPp186577;
	Fri, 22 Aug 2025 01:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755843717;
	bh=9tHPqKKnRlf/2yoYaU51ff9krR9hR2OUkjvBjZR7nbs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dUou/LpX8uNa3HvO0F+Tq/zAfHL4I1JJB3OnLNEzOvy3pP0vqtk3b/PUCshyEVRUr
	 0mlBM704WiDbJ9EgwcbQgn5NCh1oiDVuY+V8xH/I5pCqK2f0SBeo3HVAaUcRxXRZQD
	 dLtKH13IqLeVzdR6B7L/zjmwxk8pVpudZnyWJRsE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57M6Lvxf2699211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 01:21:57 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 01:21:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 01:21:57 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57M6LpGm3090508;
	Fri, 22 Aug 2025 01:21:52 -0500
Message-ID: <eaf4c015-a9e2-486b-a5ca-f98ce2146866@ti.com>
Date: Fri, 22 Aug 2025 11:51:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add cpufreq and USB support for AM62D2
To: Nishanth Menon <nm@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
CC: <praneeth@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <s-vadapalli@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
 <20250821122741.eqrwystfey7nwvym@outfit>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20250821122741.eqrwystfey7nwvym@outfit>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_232205_120026_5FDBF0C1 
X-CRM114-Status: GOOD (  15.37  )
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

Hi Nishanth and Vignesh,

On 21/08/25 17:57, Nishanth Menon wrote:
> On 14:03-20250820, Paresh Bhagat wrote:
>> This patch series introduces following changes:
>>
>> * Patch 1 fixes the register length in main_pmx/padconfig for AM62D
>>   and AM62A.
>>
>> * Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
>>   tree nodes.
>>
>> * Patch 3 adds AM62D2 SoC to cpufreq-dt-platdev blacklist so that
>>   cpufreq is handled by the ti-cpufreq driver instead of the
>>   generic cpufreq-dt driver.
>>
>> * Patch 4 extends ti-cpufreq to register AM62D2 SoC support by
>>   reusing the am62a7_soc_data.
>>
>> Boot Logs-
>> https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9
>>
>> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
>> Schematics Link-https://www.ti.com/lit/zip/sprcal5
>>
>> Paresh Bhagat (3):
>>    arm64: dts: ti: k3-am62d2-evm: Enable USB support
>>    cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
>>    cpufreq: ti: Add support for AM62D2
>>
>> Vibhore Vardhan (1):
>>    arm64: dts: ti: k3-am62a-main: Fix pinctrl properties
> Please do not mix things up to maintainers. Please post patches #1,2
> separately to DT maintainers - these do not have any relationship with
> the rest of the driver patches.


Thanks for the review. I will keep patches in separate series for 
further set of patches.

>
>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
>>   drivers/cpufreq/cpufreq-dt-platdev.c      |  1 +
>>   drivers/cpufreq/ti-cpufreq.c              |  2 ++
>>   4 files changed, 25 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.34.1
>>

