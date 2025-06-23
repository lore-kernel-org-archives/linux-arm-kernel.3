Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05283C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1mJZ57ChC5HqF8yPvS2kAr0B+cCQirxzf4xeYNbbxk=; b=4NziWTfanAn0VgmnyaRmGl+oXN
	SB6wuvs8IlJWy+R1gFuylbKZx52fD63v7zmOnaXsEBYLB2F7CO/h9cLEkiJHbD9nudFf5hdtuRmDv
	fu6g6KiCezmUB3H7LMs7+PVLmt7s/OO/7libZ0lWC1VaAIDBkrwKMs3phMqzBGIX9J3r0QA8wDv/U
	mfXz+Xxfdm11nuL6ZSqvw092rOE57u6HFkk7kLSj87g3331AcbSYDxRzBkd/rE4lCdbf8F9toNE48
	ORS/QV42xVY2y/EeXh/w4D7QN2wxw7O1qD7I2udP+lRM2rpxfBXx1YXD5XVL/LiQSpcr5x8TkGUda
	TbnYjoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlSg-00000003d3c-0k1y;
	Mon, 23 Jun 2025 18:00:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiBI-000000033OH-0y9d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:29:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NETrJ0907681;
	Mon, 23 Jun 2025 09:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688993;
	bh=S1mJZ57ChC5HqF8yPvS2kAr0B+cCQirxzf4xeYNbbxk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gV+sSAhAdO2pOPeHwvwH6k/6kRqUkxKj1vrCc2OtWjHVj1tD2Cx3YaK8/GwfsPMTi
	 G+kmt3rjT9ohl6SBQVj7CnT3ke37A08UiUQ4LVyQkcrDjjr/wkf/0espnNpNLlb15P
	 JeW1hMnEaM6PE0WltdGRg7iAHWcLCu0MXOVHTTHo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NETr38586092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:29:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:29:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:29:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NETq4w4009277;
	Mon, 23 Jun 2025 09:29:52 -0500
Date: Mon, 23 Jun 2025 09:29:52 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>
Subject: Re: [PATCHv4 5/6] arm64: dts: ti: Update firmware-name for IPC
Message-ID: <20250623142952.3aeec366w2lmoswv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-6-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-6-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_072956_314748_E4B446F0 
X-CRM114-Status: GOOD (  13.46  )
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

On June 23, 2025 thus sayeth Paresh Bhagat:
> Update the firmware-name properties in the dts file to point to new IPC
> firmware binaries for both the mcu-r5 and c7x core.
> 

Same here. This seems like we should have squashed this into 4/6

~Bryan

> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 8fde89ecba67..c98e4c98c956 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -487,6 +487,7 @@ &mcu_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>  			<&mcu_r5fss0_core0_memory_region>;
> +	firmware-name = "am62d-mcu-r5f0_0-fw";
>  };
>  
>  &c7x_0 {
> @@ -495,6 +496,7 @@ &c7x_0 {
>  	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
>  	memory-region = <&c7x_0_dma_memory_region>,
>  			<&c7x_0_memory_region>;
> +	firmware-name = "am62d-c71_0-fw";
>  };
>  
>  &cpsw3g {
> -- 
> 2.34.1
> 

