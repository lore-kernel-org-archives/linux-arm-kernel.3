Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E25EC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7NoyDY9Dn6QVm3qjGWsuSrg+qy6pFgw5ECsoArjewM=; b=ELlVlhI7bSY8etoZ0uS0drdEoK
	73Zr7qc19rh9TCzxF1P91oQkgA7yi+06kHNLF38iZ00Pjk2nuufdZaykPzgLfti68PhcJkcvmK18G
	vEpgspe0E5M72pEaiPsOBG/mZbZ1KJc8BryhIoql6y1ofbSfVAJvisFUP5BQkLPrZtOzCe/seMc0n
	SiJ75sgGNT/Yd/ta6jayLk8IBWR9NFMEshZqN/6pGeYr5JXL4N3uf3yK6hYZ2g0U5tSsr/xon/WbN
	+S8wAFcBJ+JfRxvHIpxqf04NZfsYV4U69YyxGIeDSIrxo0Pw4iD59X7ep5mvTiM53eAchqtc4PKkt
	DyhVTIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pig-00000000o0D-10aR;
	Fri, 25 Apr 2025 20:32:22 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pgn-00000000nk8-0VaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 20:30:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKUI4t2267675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613018;
	bh=Y7NoyDY9Dn6QVm3qjGWsuSrg+qy6pFgw5ECsoArjewM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XmzXZhedXXAIAjXF7RbhZY/1hUYkv9aofAu/d0J/hGiEwK+XSQlSf+6aqQiCX834w
	 ZkRdbbkNjtDivyI9FtcgY4FvmQhkl10IiYoUXeavSvfq23XpPhOIRev0bWPfPsnxFE
	 NHL69zY/5uBIfdOzjUzck2ZAHzFpYnmS/lIH72u4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKUInC018335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:30:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:30:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:30:17 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKUHLk051233;
	Fri, 25 Apr 2025 15:30:17 -0500
Date: Fri, 25 Apr 2025 15:30:17 -0500
From: Nishanth Menon <nm@ti.com>
To: Matt Coster <matt.coster@imgtec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns
	<frank.binns@imgtec.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Alexandru
 Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Message-ID: <20250425203017.dzppbtl3euy4rmc4@ranking>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
 <20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_133025_344221_F41CC24A 
X-CRM114-Status: GOOD (  18.73  )
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

On 16:26-20250422, Matt Coster wrote:
> Use the new compatible string and power domain name as introduced in
> commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
> enhancements")[1].
> 
> [1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com

Please remove the lore link in the commit message, commit sha
reference is sufficient, url could be used in the diffstat section to
provide reference.

> 
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - None
> - Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-1-9f8c09233114@imgtec.com
> Changes in v2:
> - Add Randolph's Rb
> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-1-f7d3fa06625d@imgtec.com
> 
> This patch was previously sent as [DO NOT MERGE]:
> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2116723735f70b9351cefcd8bc118..d17b25cae196b08d24adbe7c913ccaba7eed37eb 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -691,12 +691,14 @@ ospi0: spi@fc40000 {
>  	};
>  
>  	gpu: gpu@fd00000 {
> -		compatible = "ti,am62-gpu", "img,img-axe";
> +		compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-axe",
> +			     "img,img-rogue";
>  		reg = <0x00 0x0fd00000 0x00 0x20000>;
>  		clocks = <&k3_clks 187 0>;
>  		clock-names = "core";
>  		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a";
>  	};
>  
>  	cpsw3g: ethernet@8000000 {
> 
> -- 
> 2.49.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

