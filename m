Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE93C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR4JDRdfHYKvdpk6HtZwrxcJOGiIo5P5StChQCWf82w=; b=wyw99LrqpkQ4/h0piRjvZOMveb
	0qXF9LdG1+Hhk8zCe1o/j00jpGd4Z+PYHY0RJyPylcFLViCOKUYpmHNs2glLJWr5InujnfE8U4+dD
	UM9IRKBR6ol4TG6qAO1wu2wJvlQbOcT4N/z+pBZyjNxO33grIqx8BHm6NH+RsG0yJ5hY9dxiq81/s
	Q4CtAXO3FqzFRgCginw5b5S+HP8tscxphwjTcYmfkiw1wx7u0CX6CBxOZsoxSwee8t2AfFgpfdH9M
	VCxCK3RTmR46gTZv76vOSmHLQYCJYeZljLxflyXW5JlIYcqfFQYpWjPmhTIiL29QHCGuLZ2W35gwq
	y4EhH7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PmN-00000000oRm-0UN8;
	Fri, 25 Apr 2025 20:36:11 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Phy-00000000nwP-1o1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 20:31:39 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKVVpp2267729
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613092;
	bh=IR4JDRdfHYKvdpk6HtZwrxcJOGiIo5P5StChQCWf82w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Zf6mqFb/fq0fZ7nw1aYYVoCqbYVnFsQSwK8dAtk9Sei68sx8cvNybn+Vf0N9W8twf
	 dfr4IIlzhd/MUYc8mGbnChsFrHutbygUtgboOyGd665b8DRq4hFCuCFdnUIQGNfEXY
	 p5OGoelufueHvwuyPtPaNwx2QXe5Lvw6tO1o3sj0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKVVKJ019061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:31:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:31:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:31:31 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKVVJD064112;
	Fri, 25 Apr 2025 15:31:31 -0500
Date: Fri, 25 Apr 2025 15:31:31 -0500
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
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Message-ID: <20250425203131.ueswwq2kifozt7m2@footwear>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
 <20250422-bxs-4-64-dts-v3-2-ec6657bde135@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422-bxs-4-64-dts-v3-2-ec6657bde135@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_133138_562595_0DDC518A 
X-CRM114-Status: GOOD (  19.54  )
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
> The J721S2 binding is based on the TI downstream binding in commit
> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
> but with updated compatible strings.
> 
> The clock[2] and power[3] indices were verified from HTML docs, while
> the intterupt index comes from the TRM[4] (appendix
       ^^ spell check interrupt (please use checkpatch.pl --strict --codespell
to catch these minor nuisance bugs)

> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").
> 
> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
> 
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - Use assigned-clocks to pre-load the frequency of the core clock
> - Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com
> Changes in v2:
> - Add interrupt reference details
> - Add Randolph's Rb
> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com
> 
> This patch was previously sent as [DO NOT MERGE]:
> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..9e36cbbe0ea2fefceedcc95b78068ded7ef395f0 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -2048,4 +2048,18 @@ watchdog8: watchdog@23f0000 {
>  		/* reserved for MAIN_R5F1_1 */
>  		status = "reserved";
>  	};
> +
> +	gpu: gpu@4e20000000 {
> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> +		reg = <0x4e 0x20000000 0x00 0x80000>;
> +		clocks = <&k3_clks 130 1>;
> +		clock-names = "core";
> +		assigned-clocks = <&k3_clks 130 1>;
> +		assigned-clock-rates = <800000000>;
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a", "b";
> +		dma-coherent;
> +	};
>  };
> 
> -- 
> 2.49.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

