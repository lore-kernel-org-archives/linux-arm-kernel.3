Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD77C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+xos08V2sWXcFWLKiVVATbXyOouS4eSGAsrdc2THPY=; b=VDeQTRvqVhYi03nGRl2AMHdhQy
	163LFMQLmoXt3tQk/szCd41ghmYeK152jPlZQtPhn0FlabiWLsQHtltDxVs6EK/kLf2p8pFChWGLB
	0vSBIw+vO9CNRcj4YHaAdyppRq32Gw8XW0gn9z2ZECSLBJij9dvFjTSisQrySMdBKIHtkMeyWMqLf
	OsPvLzj1V4i0OuNOx5DvDzJdI9cBADmgz0MtsuCKWEeaosU8gnbVWYmZte47KgDOY8GSW7jDhd9YU
	cJ/ZLLEFX2q7CaEaxeKRr+842uM57743BaRDIU433FRHroGFe/WCy2PId0syw6j/XHHZoKlrq4Te1
	LhO7P+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnt1e-00000009ny0-1g15;
	Fri, 28 Feb 2025 05:35:06 +0000
Received: from [198.47.19.245] (helo=fllvem-ot03.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnt06-00000009ntE-02wT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 05:33:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51S5XOIT1964122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 23:33:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740720804;
	bh=v+xos08V2sWXcFWLKiVVATbXyOouS4eSGAsrdc2THPY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LsKAWzhi6SZ11jwjd7NbfKpZiC6vNJeI3ggFOkbfytK+pEF3a5JVlAMjuLU1rWMVk
	 JMom3ntAt+eOjcpOnOl/K666GJUTeRsS6TXln0bMM4gNEOoBBzo8XwESCQIEkfTAI4
	 5zFCFbxtC4G2MgKeX+c9d4GRKRm8ulyU3fAivmus=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51S5XOGt019559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 23:33:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 23:33:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 23:33:23 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51S5XMrJ064044;
	Thu, 27 Feb 2025 23:33:23 -0600
Date: Fri, 28 Feb 2025 11:03:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <j-choudhary@ti.com>,
        <rogerq@kernel.org>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix
 serdes_ln_ctrl reg-masks
Message-ID: <20250228053321.pekdadgl4ebscsc2@uda0492258>
References: <20250227061643.144026-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227061643.144026-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_213330_335276_A4385591 
X-CRM114-Status: GOOD (  18.58  )
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

On Thu, Feb 27, 2025 at 11:46:43AM +0530, Siddharth Vadapalli wrote:

Kindly ignore this patch. The register offsets should start from 0x40
since SERDES3 is not present in J784S4. I will post the v2 patch fixing
this.

Regards,
Siddharth.

> Commit under Fixes added the 'idle-states' property for SERDES4 lane muxing
> without defining the corresponding register offsets and masks for it in the
> 'mux-reg-masks' property within the 'serdes_ln_ctrl' node.
> 
> Fix this.
> 
> Fixes: 7287d423f138 ("arm64: dts: ti: k3-j784s4-main: Add system controller and SERDES lane mux")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> dd83757f6e68 Merge tag 'bcachefs-2025-02-26' of git://evilpiepirate.org/bcachefs
> of the master branch of Mainline Linux.
> 
> Regards,
> Siddharth.
> 
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 83bbf94b58d1..a5fefafcba74 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -84,7 +84,9 @@ serdes_ln_ctrl: mux-controller@4080 {
>  					<0x10 0x3>, <0x14 0x3>, /* SERDES1 lane0/1 select */
>  					<0x18 0x3>, <0x1c 0x3>, /* SERDES1 lane2/3 select */
>  					<0x20 0x3>, <0x24 0x3>, /* SERDES2 lane0/1 select */
> -					<0x28 0x3>, <0x2c 0x3>; /* SERDES2 lane2/3 select */
> +					<0x28 0x3>, <0x2c 0x3>, /* SERDES2 lane2/3 select */
> +					<0x30 0x3>, <0x34 0x3>, /* SERDES4 lane0/1 select */
> +					<0x38 0x3>, <0x3c 0x3>; /* SERDES4 lane2/3 select */
>  			idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>,
>  				      <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
>  				      <J784S4_SERDES0_LANE2_IP3_UNUSED>,
> -- 
> 2.34.1
> 

