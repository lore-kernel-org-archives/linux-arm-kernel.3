Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90221CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+9oy/uQje1G1sxzVl3tUaa4mGAbbi+cglDFrnK+Tvs=; b=jLWf+QC2gQV9FizTdwy6kWPkOA
	qR0/tRfmB5SNxhJLCjoR5EN8R09eWdFAGv6BAYkmGzXzlTnp/JARPsDIE0n5Mf7jB4QraCw9xfHir
	+lX4hIOT3mZHv6/sY6W69dxVoIM7NGC0KTuw2blUwZ3nzR4qAGf0ZdMciBVcISgHKaNMcFoy+SBbY
	gNOj/DXzebqTHmRh1hAqrbma1CsU+xY+IXQW6CCZG/06+b7YAMiKMmRAwx/KDAXvhxSYbClCOqs+z
	YhEMgQkdL+iRxBBSG2xujVeen/P7vQaJSWIk/KEU+H4VhQqkfmoYry3q5LwXJb8/Qz4xXt/aN23Op
	SmuMRpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbKf-0000000H9Pi-44R1;
	Mon, 08 Sep 2025 12:50:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaKC-0000000GkTc-1uSF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:46:22 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588BkFQi3857896;
	Mon, 8 Sep 2025 06:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757331975;
	bh=u+9oy/uQje1G1sxzVl3tUaa4mGAbbi+cglDFrnK+Tvs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=I5xnFxMKNKKvW3sZQJrZMLJKlFS9fn8WSKJIO1WI6P9EWNgaMBl+FmjNbz5tz1Bv2
	 8LpFCklIIDy6BliLz8tNAnrpy28W31pD9xFIOQTgE3pbe1GqWuYEm2FL51QicoxZJ4
	 xupgJuo/GZH8kSpIbuNrPsXFYbXHXhaAr6Ns3yWY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588BkFq42380265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 06:46:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 06:46:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 06:46:15 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588BkEd1540310;
	Mon, 8 Sep 2025 06:46:14 -0500
Date: Mon, 8 Sep 2025 17:16:13 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v3 16/33] arm64: dts: ti: k3-am62-pocketbeagle2: Add
 missing cfg for TI IPC Firmware
Message-ID: <20250908114613.mfujvrzqzqudkmpl@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-17-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-17-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044620_674753_A45CA678 
X-CRM114-Status: GOOD (  21.55  )
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

On Sep 05, 2025 at 10:48:29 +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62-pocketbeagle2.dts file. Correct the firmware memory region label
> 
> Currently, only mailbox node is enabled with FIFO assignment for a
> single M4F remote core. Add the missing carveouts for WKUP R5F remote
> processor, and enable that by associating to the above carveout and
> mailbox. This config aligns with other AM62 boards and can be
> refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Requesting for review/test of this patch
> 
> v3: Changelog:
> 1. None
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-17-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 19/33] to [PATCH v2 16/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-20-b-padhi@ti.com/
> 
>  .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> index 2eee5f638e0f..729901b2ca10 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> @@ -78,7 +78,13 @@ secure_ddr: optee@9e800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {

As long as Francesco's comments [1] are addressed,
include my R-by in the next rev:
Reviewed-by: Dhruva Gole <d-gole@ti.com>

[1] https://lore.kernel.org/all/20250821060629.GB7503@francesco-nb

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

