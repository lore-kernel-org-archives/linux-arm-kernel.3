Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E869CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF+871OBmr63RAEPuWLxRZTj4+NEuwut1XCKOb5POuY=; b=sxvi41do2eExNDFsezF4Hg3SOh
	xS4CPYjHJcx3PcBK2WyVD4dTmg0kxZyjIjQw4YIbWIA/Y9bX6X3SvkZGBptCxwRfMOl5yA2wgSfN1
	vqTppEBzRHbZG+ozfveT8Zo01Dsy0ZKVEJe97IJ8w+Ef4tEjIFYZPVaEDyCiw0iVbkAdJTWt0pS12
	JG+MUv53FDvVCJudZmbqausNCQQk/gS6bzI1D2EZRUSBGkb8nAr6UBYttcbydsBLh9qccgNtZkCea
	FUb6RzIXad+y7si+1PV6hJj9BQHCYe/j3HgU36k4ThfZ2xZ2z3dGPT1EUM6yYM6Yav2+/C+paIN7x
	SElM3t/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5wG-0000000AS8g-2oak;
	Thu, 04 Sep 2025 09:07:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5LP-0000000AEwm-1OUe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:29:24 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5848TKKm3034493;
	Thu, 4 Sep 2025 03:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756974560;
	bh=PF+871OBmr63RAEPuWLxRZTj4+NEuwut1XCKOb5POuY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mpO702DBP25ljkQ+SVuEah13rOMzvpKRuH+2kPRFz61umuLhJwpQ9LPDtQIMuwtDK
	 mDr3kUAlo8lFZVNq5Bpn6vE1UOb6Q79fuewv+sdilWEy499LSERMF5uB2JiWWQJ31E
	 PDw5+OsC50+kt5DSSNCERydSZG60DykGqP5gQ3NY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5848TKJu734742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 03:29:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 03:29:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 03:29:20 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5848TJWF2972113;
	Thu, 4 Sep 2025 03:29:19 -0500
Date: Thu, 4 Sep 2025 13:59:18 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: ti: k3-am62p5-sk: Remove the unused
 cfg in USB1_DRVVBUS
Message-ID: <20250904082918.3jn2mcvnpwhbly4b@lcpd911>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-2-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902071917.1616729-2-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_012923_460677_5EB6E2AC 
X-CRM114-Status: GOOD (  20.26  )
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

On Sep 02, 2025 at 12:49:15 +0530, Akashdeep Kaur wrote:
> After the SoC has entered the DeepSleep low power mode, USB1 can be used
> to wakeup the SoC based on USB events triggered by USB devices. This
> requires that the pin corresponding to the Type-A connector remains pulled
> up even after the SoC has entered the DeepSleep low power mode.
> For that, either DeepSleep pullup configuration can be selected or the pin
> can have the same configuration that it had when SoC was in active mode.
> But, in order for DeepSleep configuration to take effect, the DeepSleep
> control bit has to be enabled.
> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
> as the DeepSleep control bit is not set and the active configuration is
> sufficient to keep the pin pulled up. This simplifies the setup and removes
> redundant configuration.
> 
> This reverts commit 115290c112952db27009668aa7ae2f29920704f0.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index 899da7896563..e8f0ac2c55e2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -360,7 +360,7 @@ AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
>  
>  	main_usb1_pins_default: main-usb1-default-pins {
>  		pinctrl-single,pins = <
> -			AM62PX_IOPAD(0x0258, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (G21) USB1_DRVVBUS */
> +			AM62PX_IOPAD(0x0258, PIN_INPUT, 0) /* (G21) USB1_DRVVBUS */

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

