Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22EBC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 02:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZLTMhZywyKwCxB1jTgnlgJn0C3qbn1W+s81lVEcG4U=; b=i8gPe4+9NMDE244pDpAkyVWSOG
	Ue0gk5DcWHcGAIihnPfnmhLyORGVs/wms15ibfocxL1SbiAbJalojODmaDrirC3G2VpJdIzb24OU6
	mFHnoXTg3aUXgo0lslW32upbHHjbEsZgm0GuRKxQBsAi5/4nKbK+wbsny2UdQz7n0BHRqO9u6/Wkh
	OoYxFn0XsqonXVS5U58ZKZWjm3W7exXCAAzhctK3qDNysnZIUq9kbfWJZcyv4NRX9gC7Fy1LmSL76
	EwDvVf6i6Vu4AIC0V+rUG9fseg5JI5ACeugmhrE/Iw1gMdLMLfXDO6FAu2NB/qjTu79eFYGkuUdmw
	l72hOlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDRy-00000002FRu-2LU5;
	Fri, 09 May 2025 02:26:58 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDOs-00000002FAa-1dfr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 02:23:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5492NfXa1818466
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 21:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746757421;
	bh=RZLTMhZywyKwCxB1jTgnlgJn0C3qbn1W+s81lVEcG4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yp0y45A+gz++rWOCl+2gdnSeJOd62Sg1M/ZEmrJH8DhzxZAWMTyQUlAEHMOd6noEI
	 YRcMsCaCp60IBf0/XnKcDUOWTgsk/ulIHPYlrFvRTHp8ghqXwUrbv2vHbo+A/BObJP
	 m2DLSIWzgHs29bGaZsttAiiq5qHzezHAjEZgNoRM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5492NfaC016600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 21:23:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 21:23:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 21:23:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5492NfoY078015;
	Thu, 8 May 2025 21:23:41 -0500
Date: Thu, 8 May 2025 21:23:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: ti: k3-j722s-evm: Add overlay for
 TEVI OV5640
Message-ID: <20250509022341.m7gfna2y2fjv2ak7@quiver>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-5-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508155134.2026300-5-y-abhilashchandra@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_192346_513929_06610FF0 
X-CRM114-Status: GOOD (  14.31  )
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

On 21:21-20250508, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
>  .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 322 ++++++++++++++++++
>  2 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index b317eaff64cc..b0ac5c05274f 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -133,6 +133,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>  
>  # Boards with J784s4 SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> @@ -230,6 +231,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
>  	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
>  	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
> +	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo

Same comment as previous patch - keep this alpha sorted.

>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
> @@ -268,6 +271,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
>  	k3-j742s2-evm-usb0-type-a.dtb \
>  	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
> +	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \

Same comment..

>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \

---
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

