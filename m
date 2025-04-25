Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACC3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFP2W2jmPvIjX4SKsg8ordEsFDwm2ltfl5D0WhF7rH8=; b=YfTUuRq/Qr1Y4FZZl3JiNV9K2h
	0joB+QknRgTwKbCNLAgdfF54yRuTZ88WAYMQVyrHsYV/9arjctjMcZgHujiL2VnrjgZeKpL/9Gm+A
	ko1ZcQzMedAAWjrqP7O06s+5oj2wzAjw97pQreO7wEAtc4gPJmQvr/AhkTx3hTE5etDnR0383fjk+
	GlpqPZl/HskbvpWe7++TQlZA7sd5zWQZos6SUHb3pwTk9YX9iuC1Pu0ud278thsayGvPzx4vOMAmW
	F4gxrXY2yB5l0gx3XEdHlk7+2aKxtfgvhwFW6Xi5RfJZYx+c/arUWNEldXC+0higE1Vn1eZxRSjDx
	YMRlgEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JkM-0000000HNzP-19qQ;
	Fri, 25 Apr 2025 14:09:42 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ijw-0000000HDRI-1Bj2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:05:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PD57E12176482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 08:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745586307;
	bh=NFP2W2jmPvIjX4SKsg8ordEsFDwm2ltfl5D0WhF7rH8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pzyOup1QdVC49a8w2KlyxMfn+vrDnXsxZuqzZe98WNl+tSjvQ21J90l3ZpYDAl571
	 +DiVrH0vDyLyfE/VmdJ45ePkh7oEmMP+S95EazUktqr0ejM4EdKlg5if0oiCXWrGFT
	 RIdQiKOH91Du2txW5oQ4P/OuLX0Pdk++YSSh55Aw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PD57Mb019281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 08:05:07 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 08:05:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 08:05:06 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PD51Bn053981;
	Fri, 25 Apr 2025 08:05:02 -0500
Message-ID: <c63cac69-6cfc-48b9-81a3-42a88dcd74f9@ti.com>
Date: Fri, 25 Apr 2025 18:35:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-main-common: fix length
 of serdes_ln_ctrl
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <u-kumar1@ti.com>
References: <20250423151612.48848-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250423151612.48848-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_060512_417322_2535E8EB 
X-CRM114-Status: GOOD (  16.59  )
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

Hello Siddharth

On 4/23/2025 8:46 PM, Siddharth Vadapalli wrote:
> Commit under Fixes corrected the "mux-reg-masks" property but did not
> update the "length" field of the "reg" property to account for the newly
> added register offsets which extend the region. Fix this.
>
> Fixes: 38e7f9092efb ("arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix serdes_ln_ctrl reg-masks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on commit
> bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> of Mainline Linux.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 1944616ab357..1fc0a11c5ab4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -77,7 +77,7 @@ pcie1_ctrl: pcie1-ctrl@4074 {
>   
>   		serdes_ln_ctrl: mux-controller@4080 {
>   			compatible = "reg-mux";
> -			reg = <0x00004080 0x30>;
> +			reg = <0x00004080 0x50>;


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   			#mux-control-cells = <1>;
>   			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
>   					<0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */

