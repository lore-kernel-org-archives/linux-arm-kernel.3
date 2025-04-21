Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71597C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgV536aKTURayOABQgXkmovr+QyXvP7zhUmjnkrwm5M=; b=KyAGgBr8/LWTJzdhFXVoitrxKg
	6Ng7OMcKpms9F0Aonh0QPbBXBXU/chQNJs/byRjLsc8zDobatIm1xskVFZjszM7HytqnmwavOWn56
	bAPXmX0d4BCO+S/BaJXl+ey3eezHP2qgXjn0H4Qro4qZp3cOHTqZkCDAJjHedr0kuOKFhjt/OL9gS
	yXLA5xs7n5EJzcO1bGYVo9P0KR6MdIkBVo/igEV3yhWhTr0finSWgD8IjdQEWgwPmthA8MkiSQpHb
	TJV5IgMXpL6NtuFRFLz6QFn++OGVmQADc9CrRz/lIigQft1RArjIICiBtqhqSieZqsbGwqMIwtDmP
	5ygkGpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pbO-00000004De1-1IhY;
	Mon, 21 Apr 2025 11:46:18 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pZW-00000004DVl-34ZX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:44:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBiLBC1538159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745235861;
	bh=dgV536aKTURayOABQgXkmovr+QyXvP7zhUmjnkrwm5M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PPPHtQpMHPxFn0vUFkBubAbpbv9Y9otaMEmRss1vSJxtNZ/DTA9cZ4owWfweKhkdx
	 ojw6FHIYrP1URZJUqqryZYePV5kOrYOYbhX9PQ2qYomf+/CWEwDMJ0wd1fBhz8z4T5
	 QeH9nCcIFPEbFhKMKmjad3nVmkE4ycgDs1dK4m24=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBiLC0008738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 06:44:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 06:44:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 06:44:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LBiLat113661;
	Mon, 21 Apr 2025 06:44:21 -0500
Date: Mon, 21 Apr 2025 06:44:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721e-som-p0: Add bootph-all to
 HBMC node
Message-ID: <20250421114421.pj6vceavzjl2qkky@filing>
References: <20250416060754.2393701-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416060754.2393701-1-a-dutta@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_044422_817363_7B8FD200 
X-CRM114-Status: GOOD (  15.41  )
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

On 11:37-20250416, Anurag Dutta wrote:
> Add bootph-all to HBMC controller node for successful hyperflash
> boot on j721e-evm
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> Test log : https://gist.github.com/anuragdutta731/103e84e84f013093fa089803719d997d
> 
> Changelog : v1:
> 1. Added bootph-all to hbmc node in k3-j721e-som-p0.dtsi
> 2. Removed bootph-all from v1 patch from flash@0,0 node
> 
> Link to v1 : https://lore.kernel.org/all/20250411082637.2271746-1-a-dutta@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> index 0722f6361cc8..5665b9490003 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> @@ -440,6 +440,7 @@ &hbmc {
>  	pinctrl-0 = <&mcu_fss0_hpb0_pins_default>;
>  	ranges = <0x00 0x00 0x05 0x00000000 0x4000000>, /* 64MB Flash on CS0 */
>  		 <0x01 0x00 0x05 0x04000000 0x800000>; /* 8MB RAM on CS1 */
> +	bootph-all;
>  
>  	flash@0,0 {
>  		compatible = "cypress,hyperflash", "cfi-flash";

This node already has bootph-all, only the child nodes need bootph
properties. Am i missing something?

> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

