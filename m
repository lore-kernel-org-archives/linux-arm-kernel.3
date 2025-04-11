Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2359CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7nuwgLYxSWvEr+B62ZngX9a1kKC+J1LhPwwVf57ZJQ=; b=ijbQRaUji2A50CQiN4X/t5zDeq
	Kdm01HGxOTAt6qxljCN+Md7CPo+uNab4svpPyjl2lPtqFfLMR2bekCnXib5qC1Pi6qplZTX6ot/hZ
	wOTmxPlXzZ/UER1OdP8WPiYr9VlfznkqPqr3ZNY1ewydLffHb66gPQ1EMkXtB1GH8YF2iu2qv5N/y
	zWTRoWoy2h/14kXOji6Zj4bNi4pEZkGbJ5fQgUAdRTN6dNK3UWLslIRxKBmgsQ4V7E8dOJ1tS1Rb+
	LWI7e/xdgn8YhdS6VSVNj0boSAt6HWWyTxnWYN8HrAe7ZdRKARQy38QzFZ8RIDVoTh+g3Auksq0zd
	PLyL0Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Cbo-0000000DZav-2WTr;
	Fri, 11 Apr 2025 11:31:44 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CXA-0000000DYS1-373L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:26:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBQqvC2109141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370812;
	bh=h7nuwgLYxSWvEr+B62ZngX9a1kKC+J1LhPwwVf57ZJQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZSrDs/NUAgyzHgZyMxpwagAp//2hRg2I4NZ1MGMOsSWj6hXpSe25WVsTh/aTr7uci
	 g51r9zLNRwdyt4wT82dWl5mqtH4DWmxEBRM/YFbrTmLWO4cXTugLteH07JFRdoDtgU
	 Dr+DcWjDLrA4t8uX9+4i0Fe5JuGdU/RxSXFxHmpo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBQqS6029456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:26:52 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:26:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:26:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBQpqG088464;
	Fri, 11 Apr 2025 06:26:51 -0500
Date: Fri, 11 Apr 2025 06:26:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <u-kumar1@ti.com>,
        <vaishnav.a@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add
 bootph-all to HBMC nodes
Message-ID: <20250411112651.4kt4qgiz4ikylbwi@onboard>
References: <20250411082637.2271746-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250411082637.2271746-1-a-dutta@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042656_825029_F5BE51E2 
X-CRM114-Status: GOOD (  15.11  )
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

On 13:56-20250411, Anurag Dutta wrote:
> Add bootph-all to HBMC controller and hyperflash nodes for successful
> hyperflash boot on j721e-evm.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006
> 
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 4421852161dd..9ada749f16ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -570,6 +570,13 @@ &usb1 {
>  	maximum-speed = "high-speed";
>  };
>  
> +&hbmc {
> +	bootph-all;

Documentation/devicetree/bindings/dts-coding-style.rst
Please add an EoL

> +	flash@0,0 {
> +		bootph-all;
> +	};
> +};

Why &hbmc, why not in the SoM.dtsi?

> +
>  &ospi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

