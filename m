Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7AEC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEpiTYfrKQjJZ0APtPysPfd88bdBjGszmoPLyAL9M+g=; b=BqXloxbVn4+4SDhOHCb64HxIRT
	rU6eSw5rlt2Fs3+gFCZ6hDLnB3OP17z7EFsTdzNSe0hj2KDpSVs8fCKBX9XJ+bk3DPSURyMPJidl+
	ELVhM+SO2b3W1conrRjif5xkC0IJs6xE7q1T9R+Wh+4AICFiZK7MHTyO4JKtWSbJb/vm5Tw3ddaoR
	Q2AeQ5nvwMsiRIv7yh6NDoFXX5iUEBTOGFkPZKMw6z5D4rzfcMlZbzmO8y3gI51Qm74P0TLMYI9O5
	/sLyl0+8sspqLiAaoLB+buBmJ8NhbkrOjVXJrgAJ620c+qfpnefaFywD4j6pXOBsp2vnl7H9IQLJa
	LUASBX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUogk-0000000C9ed-48Ww;
	Thu, 26 Jun 2025 15:38:59 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnRO-0000000BtWr-2TVj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:19:05 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QEIvQM1757161;
	Thu, 26 Jun 2025 09:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750947537;
	bh=LEpiTYfrKQjJZ0APtPysPfd88bdBjGszmoPLyAL9M+g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dAF6pKi4p4zZmoNuM4NJTMa6nVYijZNpgEAvIBPG3wLPLM1/JC2mFzbggocG7z0S5
	 tFUJYk3EeC85DNynYB9eSPVwVbYPP5hGoc0UcALeP6DmOSyuRHeNyiX5rQblSOwA1b
	 gkg4aKNvQ3cYvItw2V2zb3gRg1bhl0As6PZx07co=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QEIvpX3694908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 09:18:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 09:18:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 09:18:56 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QEIuul1133313;
	Thu, 26 Jun 2025 09:18:56 -0500
Message-ID: <ba694996-0a17-480f-b286-4cfed81165f0@ti.com>
Date: Thu, 26 Jun 2025 09:18:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Workaround for Errata i2312
To: Vignesh Raghavendra <vigneshr@ti.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250624221230.1952291-1-jm@ti.com>
 <0bf7ccf4-26ae-42f6-b679-d7840e42efc5@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <0bf7ccf4-26ae-42f6-b679-d7840e42efc5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071902_821498_7593881B 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Vignesh,

On 6/25/25 10:56 PM, Vignesh Raghavendra wrote:
> 
> 
> On 25/06/25 03:42, Judith Mendez wrote:
>> This patch series includes fix for Errata i2312 [0].
>>
>> Also include fixes for removing eMMC HS DDR support for am62
>> SK which has been descoped as per datasheet [1] and enabling internal
>> pullups for AM62 SK and AM62SIP SK, as per JESD84 spec recommendations.
>>
>> [0] https://www.ti.com/lit/pdf/sprz487
>> [1] https://www.ti.com/lit/gpn/am625
>>
>> Judith Mendez (3):
>>    mmc: sdhci_am654: Workaround for Errata i2312
>>    arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
>>    arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
>>
> 
> 2/3 and 3/3 have no relation to 1/3 and they need to go via different
> trees. Please post them separately.

Will separate the patches, thanks (:

~ Judith

> 
>>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      | 25 +++++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |  1 -
>>   arch/arm64/boot/dts/ti/k3-am625-sk.dts        | 25 +++++++++++++++++++
>>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 ------------------
>>   drivers/mmc/host/sdhci_am654.c                |  9 ++++---
>>   5 files changed, 56 insertions(+), 28 deletions(-)
>>
> 


