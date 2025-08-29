Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E5FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaWfP3mDKCTKkl7RN75qVdEctGBAP2mBme4ObMh7L7I=; b=ojmNxfzLczXnjf55wBSpBl7ZHZ
	NyzesSu9ZXc834/suiDChTIx+7tn+1iEmI6YRVc93y+kqUjmbz+DOQ8UXWCz97ZOLaZkenFPPSgO8
	Gs/MfRtY9yNlr0e/Z/xgWapdmp/YlrZE7SazKO41RQnqhxT0OH0gmPxIN11B8gHQa0XN393tvuvga
	vcSrAnBw1o2MlEPUT175JbJutH4RX1C8Ijb+RUv1+R7dhYye+pNm8GVBUhiAYUptFz07mboroozx4
	brfeYxXNuHjbweIEiKdOxXDinzIP8Lmdw57Lb7oWQmsmiRmh0/tUrJK2vfAvEHIaAW2xeu5MkOcpc
	vTdVfZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iB-000000076NQ-13WH;
	Sat, 30 Aug 2025 00:44:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxpf-00000005ahe-3EYC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:03:53 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TC3lCH1798691;
	Fri, 29 Aug 2025 07:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756469027;
	bh=jaWfP3mDKCTKkl7RN75qVdEctGBAP2mBme4ObMh7L7I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SLoPJGOhqd5SaL8cJFl8FmjPWwIrSbW0criJFKOBGwpBHvozEj5HrVIGou1Pijzpc
	 OBbmUaG/Ai/naWSil3ZXvxkqTodsR/cYrwbCq8fuROmi8IqTQhPACjplVFP12GvI3T
	 WPZHyQf38WjNRKEgc5HfY9L6ndCdwMBpKKo6ul3A=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TC3lIE3997113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 07:03:47 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 07:03:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 07:03:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TC3l6Q2308133;
	Fri, 29 Aug 2025 07:03:47 -0500
Date: Fri, 29 Aug 2025 07:03:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH 0/3] arm64: dts: ti: Add bootph-all tag to USB PHY
 controllers
Message-ID: <20250829120347.v2mhce4tntnewrm7@mushy>
References: <20250829074700.1531562-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250829074700.1531562-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_050351_855325_E306D17F 
X-CRM114-Status: GOOD (  12.58  )
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

On 13:16-20250829, Hrushikesh Salunke wrote:
> This patch series adds the bootph-all property to USB0 PHY controller 
> nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S). 
> 
> The bootph-all tag ensures that these USB PHY controller nodes are 
> available during all boot phases, which is required for USB DFU 
> (Device Firmware Upgrade) boot functionality.
> 
> This series is based on commit:
> 8cd53fb40a30 Add linux-next specific files for 20250828
> 
> Hrushikesh Salunke (3):
>   arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add bootph-all tag to
>     usb0-phy-ctrl node
>   arm64: dts: ti: k3-am62-wakeup: Add bootph-all tag to usb0-phy-ctrl
>     node
>   arm64: dts: ti: k3-am62a-wakeup: Add bootph-all tag to usb0-phy-ctrl
>     node
> 
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi               | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi              | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
>  3 files changed, 3 insertions(+)
> 
> -- 
> 2.34.1
> 

NAK! please do this for the boards that need this capability. bootph
property at SoC dtsi level are mandatory components for ALL bootmodes
and all boards.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

