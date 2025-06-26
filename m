Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C082C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 04:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB9dRw9uYtsjuxMgsVAuJMwlfiDy5nUxbGT1YdqIT4Y=; b=oNt/a0S5NL2xDmN8h3FpthW84G
	MNbHQ9qLOPLE5aaSbXVmj5xD5EfS3PY6L4aoMMyIsS0BcTYzDI4WEHQgXz6/f52menf0Qldz7ER3w
	PLSOI8MUSj7M9+rM47Fq5K5bjYNM6olrSM7oSYtLmMgDa6e2uFeJXG08Df+JlmngPJ7szU+K8f+yM
	tC1ZhYOSHzDXAUkiMiYX0HMw9L90mfgO2hIDftGVn4aZExQMDD6UBr4Y/tGc7rqvUXz6NXLt1+cav
	rc2oJgXRqs2NwwUTqKqosB1SB3oynyNZ+KtnC5toWT7HLd/jGB4GCK7V0NjBs1hYEePGHHImTPesm
	BEh8V7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdr4-0000000AZSG-2Os4;
	Thu, 26 Jun 2025 04:04:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdoj-0000000AZGJ-3uKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 04:02:31 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q42PC02303186;
	Wed, 25 Jun 2025 23:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750910545;
	bh=xB9dRw9uYtsjuxMgsVAuJMwlfiDy5nUxbGT1YdqIT4Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LtENwyHIM4ucwSkRJQ9KOEvrYvSzOBCfJH9ixv/Z2eXbeuB3V7tapudz5WMv8PiqC
	 QOXtZMKGjpW6MC+Febpx2xtBM/6kWOLX/SzARFfZY8UxDin7aan2nWalDuN1CEWHKV
	 ZvhDzQ2nPUey1VbGJGNSuoZoMj1yjwGoonWVIpIk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q42Pox1619858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:02:25 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:02:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:02:24 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q42LBe334729;
	Wed, 25 Jun 2025 23:02:22 -0500
Message-ID: <02a85bf3-0c2e-48b6-9938-c4f8a50d662b@ti.com>
Date: Thu, 26 Jun 2025 09:32:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62: copy bootph flags to Linux
To: Bryan Brattlof <bb@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_210230_065628_29546046 
X-CRM114-Status: GOOD (  15.04  )
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



On 24/06/25 20:20, Bryan Brattlof wrote:
> To keep things as organized as possible, copy the bootph-all properties
> from U-Boot for the packet DMA controller to indicate it should be
> available during all phases of bootup.
> 

Above isn't a valid reason to add bootph-all properties to a node. You
would need to say why this DMA controller is needed during all phases of
boot, does this enable a certain boot-mode? Fix $subject to reflect the
same.

> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..2a727caf36ec44e4a023c5985d1bad9b80737633 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -150,6 +150,7 @@ main_pktdma: dma-controller@485c0000 {
>  				    "ring", "tchan", "rchan", "rflow";
>  			msi-parent = <&inta_main_dmss>;
>  			#dma-cells = <2>;
> +			bootph-all;
>  
>  			ti,sci = <&dmsc>;
>  			ti,sci-dev-id = <30>;
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250623-62-uboot-cleanup-dbec66f9e257
> 
> Best regards,

-- 
Regards
Vignesh
https://ti.com/opensource


