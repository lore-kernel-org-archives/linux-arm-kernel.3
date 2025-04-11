Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC61C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Genc+foR3TLZU1XFpVYp4UeiPJ0ZTyJwWiJkAOrjZJU=; b=J9kKu356XF6HN7zP8mCCitwAWP
	+1/Kdfx1ubxPL5L1t2QkAqljMYmol1p7j04ihIn09QnZP4jXjVQLzKqblUm4Ju0Y9LiGgmd/3lrXL
	dvZ7rH/rbp0WasPUtgpS1GtvEQQerMs0eor8xWpO0sTaQ8DRYfXju9rRVZp+p87Jo+LQ9ysr5hRbc
	IpXDilVVXIuH811SR5HdTG+d4UXsluYqGtEnPBYrJvryb39h3mwEKc+F04yl45s+LnfWIAjd9DFno
	+LybrGOCSG5FKEBjfhQOzjWoXmpDIeLFhCvKYfVY5/V9zVMP5/89atC9qj5wID6McFLxnnur8xrqf
	9oYrr03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FH4-0000000E4YX-1gSq;
	Fri, 11 Apr 2025 14:22:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ExN-0000000E11L-2Qdv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 14:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Genc+foR3TLZU1XFpVYp4UeiPJ0ZTyJwWiJkAOrjZJU=; b=O5Xm2wuw/tabnxbWCHNHVPFon1
	/eOkwjNcsk1kBAIBCGgpSxiiPYG1p1TZ4M92/49NlZMGi0EJpEBlKR9u65vZW6MyfLejAl41MYr5A
	DPgK5SUwnjSk5VarZ7z16bp/3rNW8KpF5n2+n4gFJD/2Mqv/a9KN75is0tt1aox0g07MZwDTCiXuL
	2VfIhQZkJ9A4GGEFjtO+SZWN2o7bHyg6QmwGJsw+Dovc9/Vo3hZz6bY9RCKE7Lm5fEFAUtFFPGvJJ
	jnDOThOLKepxIWCY5MI1b+jDVZBb6UwCtwBU+29sHypNuDrd3BEDu9kHWVrY/7ZFMPi46bIZFJEZh
	HJDgn8rA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3ExK-000000092J2-0JMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:02:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BE1w511458980
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 09:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744380118;
	bh=Genc+foR3TLZU1XFpVYp4UeiPJ0ZTyJwWiJkAOrjZJU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OTJw5ugNRiRefNzTa0I1IZ9RO1Er+xZPNrg9Pa++8XsYAQAyQi+BBXx2h+iNtuOAb
	 Wy9lOthCxRPOV33NzxIfs4r48KLgpcbwDXoAfQ+QviEhS4mxsOYZnc86kckG0zOShG
	 0NNndGpv1a9zPejSxb/wk+SPJ0PTK9rVkBGM86mk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BE1wtx097818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 09:01:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 09:01:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 09:01:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BE1rOJ020355;
	Fri, 11 Apr 2025 09:01:53 -0500
Message-ID: <7b2f69ad-48aa-4aa9-be0e-f0edae272bdb@ti.com>
Date: Fri, 11 Apr 2025 19:31:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j722s-main: Disable
 "serdes_wiz0" and "serdes_wiz1"
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <u-kumar1@ti.com>
References: <20250408103606.3679505-1-s-vadapalli@ti.com>
 <20250408103606.3679505-3-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250408103606.3679505-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_150206_471622_19D77E66 
X-CRM114-Status: GOOD (  20.87  )
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


On 4/8/2025 4:06 PM, Siddharth Vadapalli wrote:
> Since "serdes0" and "serdes1" which are the sub-nodes of "serdes_wiz0"
> and "serdes_wiz1" respectively, have been disabled in the SoC file already,
> and, given that these sub-nodes will only be enabled in a board file if the
> board utilizes any of the SERDES instances and the peripherals bound to
> them, we end up in a situation where the board file doesn't explicitly
> disable "serdes_wiz0" and "serdes_wiz1". As a consequence of this, the
> following errors show up when booting Linux:
>
>    wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
>    ...
>    wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12
>
> To not only fix the above, but also, in order to follow the convention of
> disabling device-tree nodes in the SoC file and enabling them in the board
> files for those boards which require them, disable "serdes_wiz0" and
> "serdes_wiz1" device-tree nodes.
>
> Fixes: 628e0a0118e6 ("arm64: dts: ti: k3-j722s-main: Add SERDES and PCIe support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> v1 of this patch is at:
> https://lore.kernel.org/r/20250408060636.3413856-3-s-vadapalli@ti.com/
> Changes since v1:
> - Added "Fixes" tag and updated commit message accordingly.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 6850f50530f1..beda9e40e931 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -32,6 +32,8 @@ serdes_wiz0: phy@f000000 {
>   		assigned-clocks = <&k3_clks 279 1>;
>   		assigned-clock-parents = <&k3_clks 279 5>;
>   
> +		status = "disabled";
> +

Since you are disabling parent node.

Do you still want to carry status = "disabled" in child nodes serdes0 
and serdes1.


>   		serdes0: serdes@f000000 {
>   			compatible = "ti,j721e-serdes-10g";
>   			reg = <0x0f000000 0x00010000>;
> @@ -70,6 +72,8 @@ serdes_wiz1: phy@f010000 {
>   		assigned-clocks = <&k3_clks 280 1>;
>   		assigned-clock-parents = <&k3_clks 280 5>;
>   
> +		status = "disabled";
> +
>   		serdes1: serdes@f010000 {
>   			compatible = "ti,j721e-serdes-10g";
>   			reg = <0x0f010000 0x00010000>;

