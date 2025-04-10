Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C77C369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SD7cOLHPNPRn+FrhFL4jj5FK1/KNQWomyZ99DtlTZeo=; b=jaK76mKyJUSx3TSw5LxaQ6ldKn
	e8QJW3C/zBPs4cVNGZFJhoNQbCUOZWluZ+wJfY+r9dOqiyYrZxN0ezR4NWYRggL2rekbYIJMyrwWA
	WTdA/4LhF3OffWYi0Dpmo1rwbCR1+GRbC89DTE0OP3/1dtvGkOpK/YlrK+q0ieJHwUm5pojoUf9PC
	iMkkY7vJ4a/UaPybaOdrDHP8CPRzRmKyBQq4FT+W8TW8pQ8zwNP6yyx0LeI1gb6dCP2E1RhYO/akt
	0CYjdj7DyxiopaaTzHCgPrQ1b4HrblyBkK/D1/KleRJhNtX5W40fFVnak+2Wh1F50rD3ijC5NzcMl
	iL6ugJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pt1-0000000ABKE-0nVc;
	Thu, 10 Apr 2025 11:15:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nqy-00000009s5m-49yi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:05:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53A95OH71769035
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 04:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744275924;
	bh=SD7cOLHPNPRn+FrhFL4jj5FK1/KNQWomyZ99DtlTZeo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lXw/zGFsunICye/4+h6fJgF860Fh84ljOwinYE5ODgpWsnA7QcvEKWuxpcVnVddle
	 rTMdN6bbQFVP/3oIwr9QgvX3r9VeqqkQdDJJ8B9ZJx58SlMz3onu+Kqsb96dywsKSS
	 WAkMgmYnwZxWC0f9FiEzjsdlCPK8SSxyifS9vBxo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53A95Out047438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 04:05:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 04:05:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 04:05:23 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53A95MPQ048842;
	Thu, 10 Apr 2025 04:05:22 -0500
Date: Thu, 10 Apr 2025 14:35:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Frank Li <Frank.Li@nxp.com>
CC: <s-vadapalli@ti.com>, <bhelgaas@google.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <kw@linux.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lpieralisi@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <robh@kernel.org>, <tony@atomide.com>, <vigneshr@ti.com>
Subject: Re: [PATCH 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-ID: <9bd626d5-8fcd-4076-af52-deea6cf2dedc@ti.com>
References: <20250409153518.3068176-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250409153518.3068176-1-Frank.Li@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_020545_116186_5222DFA2 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Apr 09, 2025 at 11:35:18AM -0400, Frank Li wrote:

Hello Frank,

> This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
> 
> The previous device tree correctly reflects the hardware behavior.
> The reverted commit introduced a fake address translation at pcie's parent
> bus node.

More details are required in the commit message. The commit being
reverted states:

"The range for 0 is typically used for child devices as the offset from the
module base. In the following patches, we will update pcie to probe with
ti-sysc, and the patches become a bit confusing to read compared to other
similar modules unless we update the ranges first. So let's just use the
full addresses for ranges for the 0x20000000 and 0x30000000 ranges."

The commit message in this patch should probably indicate something
along the lines of:
The commit being reverted updated the "ranges" property for the sake of
readability but that is no longer required because <your reason here>.

Tony Lindgren is the author of the commit being reverted. Tony could
clarify if the purpose of the commit was more than just improving
readability.

> 
> Reverting this change prepares for the cleanup of the driver's
> cpu_addr_fixup() hook.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous disscusion at
> https://lore.kernel.org/linux-pci/20250314064642.fyf3jqylmc6meft7@uda0492258/
> ---
>  arch/arm/boot/dts/ti/omap/dra7.dtsi | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> index b709703f6c0d4..711ce4c31bb1f 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> @@ -195,24 +195,22 @@ axi0: target-module@51000000 {
>  			clock-names = "fck", "phy-clk", "phy-clk-div";
>  			#size-cells = <1>;
>  			#address-cells = <1>;
> -			ranges = <0x51000000 0x51000000 0x3000>,
> -				 <0x20000000 0x20000000 0x10000000>;
> +			ranges = <0x51000000 0x51000000 0x3000
> +				  0x0	     0x20000000 0x10000000>;
>  			dma-ranges;

[...]

Regards,
Siddharth.

