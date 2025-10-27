Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BECCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZCgf91re28Z+mhjsd1SA4AChxcvuQ2WJ2scn/0nNvA=; b=PHN9Mm5IjxYp/uVEcohXnFCv4Y
	DZosLE+4V5J6wHkbkkA2hVz3vmrqfRKyhVSqHYQFrUU3Tn+RNXEXuB4H8CRL9IIcxmjRbCCC1EeTL
	9vhA8U4aqi6YTFqdph3ErsC8f4MSRkDl/9Vp45q8SRwGzqxlKKhD8w3V9ydlxskWoHKa4fq+ZFkAQ
	jRlfvNw1Zgp+JZHPV8BbaF2eLIivotnMaMsNk1dw+cX9Clrde3KZNvsvaQLstQrDJ0zVrdnye0Yjl
	pJPRU1eDzJWiOUjzF4TBpUSR6a8w0LvfNBIt7CsBUAekyADGOG4KIf1gyLLGQ8v9aqeMzXR/5JNWH
	P2c/tHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFgf-0000000D7QL-47Fp;
	Mon, 27 Oct 2025 05:22:33 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFgc-0000000D7Pz-2DCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:22:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59R5MQJK2336730;
	Mon, 27 Oct 2025 00:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761542546;
	bh=eZCgf91re28Z+mhjsd1SA4AChxcvuQ2WJ2scn/0nNvA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=msWLSVsguS78kMda4jHNh4RgYidjmXRTC2lkc28TpXVU/WGp9UTi+jiv/JIYTMXqF
	 dWLEo8dWeVkQGtxeXdc2bcbgEyYdnEtbNXO7BuGLIxP94sf+zF6CKH1Aqu3Ih6LNIv
	 XpQcx4WF3MGYSirSCNfL8i29hrA5d9uj8NlMOnpU=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59R5MQTr1437619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 00:22:26 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 00:22:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 00:22:26 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59R5MNH9114936;
	Mon, 27 Oct 2025 00:22:23 -0500
Message-ID: <1d0e3bd6-eabb-4083-aa20-faae7fd79cff@ti.com>
Date: Mon, 27 Oct 2025 10:50:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62-wakeup: Enable
 cpsw_mac_syscon in U-Boot
To: Daniel Schultz <d.schultz@phytec.de>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>
References: <20250923130901.4110013-1-d.schultz@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250923130901.4110013-1-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_222230_684965_642F7EC0 
X-CRM114-Status: GOOD (  15.74  )
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

Hi Daniel,

On 23/09/25 18:39, Daniel Schultz wrote:
> Add the "bootph-all" property to cpsw_mac_syscon.
> 
> This fuse region contains the internal MAC address. Without this
> syscon node enabled, this interface will get a random MAC during
> network boot. This is problematic because the AM62x network
> boot is using BOOTP protocol for some binaries and this protocol
> does not support dynamic lease expiration. Therefore, the DHCP
> server can run out of free IP addresses.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> index 6549b7efa656..41ac17e809be 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> @@ -30,6 +30,7 @@ opp_efuse_table: syscon@18 {
>  		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>  			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>  			reg = <0x200 0x8>;
> +			bootph-all;

Please restrict this to boards that actually support network boot by
moving to dts or SoM specific dtsi? Same applies to 2/2

>  		};
>  
>  		usb0_phy_ctrl: syscon@4008 {

-- 
Regards
Vignesh
https://ti.com/opensource


