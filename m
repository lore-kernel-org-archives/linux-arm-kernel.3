Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbwmokaiQsTOA7B8SevyBawIpYDSQ2xVw9i3NB7U0TY=; b=1Hok9RB3YqSQRZbVTJk/4N4+OL
	NNVBm6EZRTiomzob6D3X3N/gv5bjsyQYLy8r6M2nigAqPKcqCAm5oQS9T9zhAky+CdCgQtTLmGww/
	wLK3E5aFOF4+XNo6tQ7U/GncKK509D0TOf6PXNFaIIVcneBlnntgALnNp2QiOTmjJnrSV7ovSM3LR
	PDD4cLJxjsz++hDKHtACkP31qm0HsRAO7VPHGmvIhKKIu1EyNlQqdhfcvgl7yIABo7SWRzlmN8Hir
	BAyiCk36gz5pyuH2VmTCpFAePAwGaV8vHOfSms3yd8rk3abWIkxafYNf5Y52G8wlqPhb7652bGl+8
	iCdD0iDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw71x-0000000AimX-1mYz;
	Tue, 09 Sep 2025 22:41:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw71u-0000000Aij6-0dGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:41:39 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589MfWwZ006957;
	Tue, 9 Sep 2025 17:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757457692;
	bh=WbwmokaiQsTOA7B8SevyBawIpYDSQ2xVw9i3NB7U0TY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RQRMKuW53IAl6gwVfRHjJpiVC2x7WLzRuZlbOppN46g7Rvqibe02AAfRmue/nyofm
	 Vr+59yamY19i/i3S8voot2fKW9wEPjFwtumgioGfOQBG1GS0qgmSTqEVu3+i6Ujrvt
	 gy5k3O05OcIdW4ao6kv600Gj1/QiVmt6m6RMscRw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589MfWfn689483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 17:41:32 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 17:41:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Sep 2025 17:41:31 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589MfVHJ3725550;
	Tue, 9 Sep 2025 17:41:31 -0500
Message-ID: <433c4594-8081-45cf-bbc8-a4816e8559f4@ti.com>
Date: Tue, 9 Sep 2025 17:41:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62: Support Main UART wakeup
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>
References: <20250904212827.3730314-1-k-willis@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250904212827.3730314-1-k-willis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_154138_387330_87377F1D 
X-CRM114-Status: GOOD (  20.75  )
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

On 9/4/25 16:28, Kendall Willis wrote:
> This series adds wakeup support for the Main UART in the device tree of
> the TI AM62 family of devices. It defines the specific pins and pinctrl
> states needed to wakeup the system from the Main UART via I/O
> daisy-chaining. The wakeup-source property is configured to describe the
> low power modes the system can wakeup from using the Main UART.
> 
> Dependencies
> ------------
> This series is dependent on the following series [1] to be merged into
> the kernel. The series adds the system idle states that are available on
> the SoCs. The system idle states are used when configuring the
> wakeup-source property.
> 
> This series is also dependent on the following patch [2] to be merged
> into the kernel. The patch integrates the PIN_WKUP_EN macro which
> enables the WKUP_EN bit.

Series also depends on this series [1] for DT bindings of pinctrl.

[1] https://lore.kernel.org/all/20250904212455.3729029-1-k-willis@ti.com/

> 
> Implementation
> --------------
> This series is intended to be implemented along with the following
> series:
> 
> 1. "pmdomain: ti_sci: Handle wakeup constraint if device has pinctrl
>     wakeup state": Patch which skips setting constraints for wakeup sources
>     that use pinctrl state 'wakeup'.
> 
> 2. "serial: 8250: omap: Add wakeup support": Implements
>     wakeup from the UARTs for TI K3 SoCs
> 
> 3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": (this series)
>     implements the functionality to wakeup the system from the Main UART
> 
> Testing
> -------
> Tested on a SK-AM62B-P1 board with all series and dependencies
> implemented. Suspend/resume verified with the Main UART wakeup source
> by entering a keypress on the console.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250812-topic-am62-dt-partialio-v6-15-v2-2-25352364a0ac@baylibre.com/
> [2] https://lore.kernel.org/all/20250904112538.529857-4-a-kaur@ti.com/
> 
> Kendall Willis (3):
>    arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
>    arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
>    arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
> 
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 24 +++++++++++++++----
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 24 +++++++++++++++----
>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 +++++++++++++++----
>   3 files changed, 60 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010


