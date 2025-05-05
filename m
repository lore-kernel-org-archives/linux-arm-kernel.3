Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D039C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz6qpzr4bWrGe4AO4WpYeTnOtWSVnS+tyHsG4borA2s=; b=3K040PLBiTLeVAGFz3cvturodg
	gffOGPNabk0t4SVRBVbBTi/SBTEWuIRFw8E7ern5y2BCqe9lGN3ITM5th9ZjbXiG5F/EnAlL5lfx/
	WNbajABfSsLRSksyJKjjeD8AEGjQ1KdAVocWFjOLHYLP1nMI79zGQtLmmX9pM0dLgGtRDNma7hT6f
	0pclofdrs+dCIo3VtdVjjju1ZvOr5Iv/f1y7aLizvWl5qT5s+rT0pBU0qzrRD/hqOTiyQD64uegRT
	Ky7iW/58+F2mYZu8EXMa+CcZBPcnPIFyHB983yhHF5Brwx1Q/BIiDdrFcOhLJ/9SVZUFP2pEAOCzh
	XMAfK0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkb-00000007Rty-0CfB;
	Mon, 05 May 2025 13:20:53 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv5g-00000007M0z-42uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:38:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CcXeP762189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746448713;
	bh=dz6qpzr4bWrGe4AO4WpYeTnOtWSVnS+tyHsG4borA2s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Maj2dj09KHbCoTeBiPWG2KZsInEORj+RINL2szdtWGY1SFP59ODpTrNKBowwZ8XfW
	 ZZWiyMLRDGnjC5eWRcU7uLBryOQLMIojhV1I7u7yxSbgElKKBDCADVe6Ha3FM7QLwA
	 qNG7JL5Y0+rVw+OI1F+qs4WRwMaIMD8sPrEf1ACQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CcX4X064815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:38:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:38:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:38:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CcWWX066547;
	Mon, 5 May 2025 07:38:32 -0500
Date: Mon, 5 May 2025 07:38:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1
 on J721E
Message-ID: <20250505123832.shukji5gfx3erjdq@lustiness>
References: <20250505112731.2515734-1-p-mantena@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505112731.2515734-1-p-mantena@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053837_106389_4DF16817 
X-CRM114-Status: GOOD (  14.13  )
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

On 16:57-20250505, Prasanth Babu Mantena wrote:
> J721E SoM has MT25QU512AB Serial NOR flash connected to
> OSPI1 controller. Enable ospi1 node in device tree.
> 
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index e3d0ef6913b2..3112b351c052 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -571,6 +571,7 @@ &usb1 {
>  };
>  
>  &ospi1 {
> +	status = "okay";

Follow Documentation/devicetree/bindings/dts-coding-style.rst

>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
>  
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

