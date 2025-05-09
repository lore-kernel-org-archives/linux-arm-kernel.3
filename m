Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17572C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCP/12rAyQwOl5LrFAi4QTkdDpc/orvAD1e4tN/2d7M=; b=Fbw3DLJTkfqNxazAMsd55xR4mw
	7414DT+QljxjMlRtSjgry+2QlcaH6vplWxtWQX4vUvxIaiFAC9BH0rFTYEdiIRBBGXdKlcHhRdz6z
	7wOUqij7iN/1Tliq2vkYJkcN70VZ4JBj8dUqQh/A4MrCCajGH3nwVypZS92LlSvuNba9pRvf4aPNQ
	Hsaso9hy2LCpE+02sJ99kCw3kMeqqbSnu6l7ETpiqCwYXpLGO/SXDUE/bTydczl4K0RsffSjiwQiE
	BxIsk50v78GlRwDy4q7ZEjnOv09hw8+eIdW0NmrSaBGgyVStoo11hOmLro/onqBEQ67Wd27NMPVYp
	x9jqLCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJkd-000000033Bw-1QGO;
	Fri, 09 May 2025 09:10:39 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ2g-00000002vE6-0NGy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:25:15 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5498PAbZ1345842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 03:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746779110;
	bh=HCP/12rAyQwOl5LrFAi4QTkdDpc/orvAD1e4tN/2d7M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xELnqpi5bJF6eitop24E6D+ONFUP6vAFMe4viDUsGo918leyJuxKbUUP/VzPAV2qS
	 xoV9sxH7fdjs5eTTB19jWdnUxuk4C0HVcMUIHD1x+X7l5lvEGOtH3csGwW340ZpscN
	 sJJyR8R3NOE2W292EGMNF42N05Q62iAFN+TEgtvE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5498PAm6095237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 03:25:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 03:25:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 03:25:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5498P9uR003472;
	Fri, 9 May 2025 03:25:09 -0500
Date: Fri, 9 May 2025 03:25:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721e-common-proc-board: Enable
 OSPI1 on J721E
Message-ID: <20250509082509.ogfs2ulyfgk6etxc@unshaved>
References: <20250507050701.3007209-1-p-mantena@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507050701.3007209-1-p-mantena@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_012514_217331_2BEFE05C 
X-CRM114-Status: GOOD (  17.14  )
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

On 10:37-20250507, Prasanth Babu Mantena wrote:
> J721E SoM has MT25QU512AB Serial NOR flash connected to
> OSPI1 controller. Enable ospi1 node in device tree.
>
> Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few peripherials")

Yes, cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few
peripherials") did not enable the node, But back then, we used to
ensure all nodes were left default (okay) and then disable unused
nodes in board dts.

BUT, we ended up having a bunch of maintenance issues and board bring
up problems and looking at the rest of the ARM ecosystems (you can
check the mailing list for all the discussions on the topic), we
flipped the order for peripherals that need board level connectivity
for functionality to be disabled in SoC.dtsi and enabled explicitly at
board level and when that occurred, specifically:
73676c480b72 ("arm64: dts: ti: k3-j721e: Enable OSPI nodes at the board
level") which enabled ospi0 at SoM level, but missed fixing this up,
whoops!

I will fix this up locally when I apply this patch. but FYI.

> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index e3d0ef6913b2..45311438315f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -573,6 +573,7 @@ &usb1 {
>  &ospi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
> +	status = "okay";
>
>  	flash@0 {
>  		compatible = "jedec,spi-nor";
> --
> 2.34.1
>
>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

