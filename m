Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEODEvpZ+kS569dNngWKxPn7Rdv1MvJZa+IDSy7FiTA=; b=HWCfLr03qWMGRrbOP9iNfFEQvZ
	t8Dc23dprDzR8zPIuAxkuxHECmrQtfq4v8cfu0gfI5wdf42m3p0kUheTFb0EtfWhbUytdBWacTSmY
	kU4kncp2p20i4O7E45hnAapDd5xY6XU8mRrLpcHG7XyJGELaQHmKKeSFYYgyRe5Dkyo0+BOA1aOwc
	3jqxiDAmWQvYiDiDrhl0vlEdsRQXY4d6AKtXh2E3JFD11sYS62DZVDpwjU+v7KZjjmL+Kv/FuCDUh
	KtLfpuV/ncQ3NyLAIFSvR0NQlGtAIeeMFb4TOka2oblKmJdpPHl2Ql0iaqFc8W3bVKY4EWtYE/6Wi
	SqemAy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40C3-00000008bHo-2V19;
	Wed, 01 Oct 2025 17:00:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40C1-00000008bHC-15OP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 17:00:42 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591H0bIt2711958;
	Wed, 1 Oct 2025 12:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759338037;
	bh=ZEODEvpZ+kS569dNngWKxPn7Rdv1MvJZa+IDSy7FiTA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=I3m0RJFlD4f93M3FuwSB2x20oHw/qeSywDKnYQsGnaP3y4bNteFM+noUb1+nCB20P
	 P0j+alxQNzJDMKH8H1a/lCv9zjyehoceSAoAViHVwntKWl2uCn6CZW18N7B4JWi8/W
	 /7VmsuJC667Zw62FaLxoTbw2fQiu89I5owD7hxRo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591H0bZg3004851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 1 Oct 2025 12:00:37 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 1
 Oct 2025 12:00:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 12:00:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591H0a5v612566;
	Wed, 1 Oct 2025 12:00:36 -0500
Date: Wed, 1 Oct 2025 12:00:36 -0500
From: Nishanth Menon <nm@ti.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Dhruva
 Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>,
        Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/3] firmware: ti_sci: Partial-IO support
Message-ID: <20251001170036.favd5zaieknywcch@amendable>
References: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_100041_390278_355BBCC1 
X-CRM114-Status: GOOD (  19.24  )
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

On 16:37-20251001, Markus Schneider-Pargmann (TI.com) wrote:
> Hi,
> 
> This series adds support for Partial-IO to the ti-sci driver,
> implementing the firmware interface necessary to enter this low power
> state. It processes the wakeup-source properties from the devicetree and
> communicates with the system firmware to enter Partial-IO mode when
> appropriate wakeup sources are enabled.
> 
> Partial-IO Overview
> ------------------
> Partial-IO is a low power system state in which nearly everything is
> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
> system on pin activity. Note that this does not resume the system as the
> DDR is off as well. So this state can be considered a power-off state
> with wakeup capabilities.
> 
> A documentation can also be found in section 6.2.4 in the TRM:
>   https://www.ti.com/lit/pdf/spruiv7
> 
> Implementation Details
> ----------------------
> The complete Partial-IO feature requires three coordinated series, each
> handling a different aspect of the implementation:
> 
> 1. m_can driver series: Implements device-specific wakeup functionality
>    for m_can devices, allowing them to be set as wakeup sources.
>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.17?ref_type=heads
>    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-0-6972a810d63b@baylibre.com
> 
> 2. Devicetree series: Defines system states and wakeup sources in the
>    devicetree for am62, am62a and am62p.
>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.17?ref_type=heads
>    https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com
> 
> 3. This series (TI-SCI firmware): Implements the firmware interface to
>    enter Partial-IO mode when appropriate wakeup sources are enabled.

If this is the order of dependencies, I guess the series has to wait
till CAN driver changes are merged? did I get that right?

Also surprised that the DT series is second in the dependency.. usually
dts changes occur the last. but anyways..

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

