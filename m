Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvFJvGG4okhAh4ZzeiEtpd9T2TUuyeMrkIjC3ug+0NE=; b=ezD27ABpqP2mwqgi4lb9Kh0pND
	Ow3IunhythEUeTqKIxxoq22oqM5C2lL+edtwcMGiRT8T8qAGq3G2NCguDE+M5e/NyZfKNQ+upghYg
	YWIXceQC1eDiogPrZpIYFY0qu6NWOHqm0wglMVPb1RY/8BnXZSSkOus1gg1IW+Eah1c88LfFimixq
	cf1sRQ/AAwHetbQGYMOFAbbY2xpC6ea+83mUEDagbIilYiyWyoVPFPFgkO5u9wEqRJr+PjvoebYwZ
	GeUsuhFoOuY2Yo4fedVnHnO8ZLSboV/qVbBdpFh+kazh6EF6zMLHwRSkCgReG3ywr+V/MMDYQVIGq
	d4s9GXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nNU-0000000GbHF-2UV3;
	Fri, 18 Apr 2025 15:11:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nHZ-0000000GZzH-3eKi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 15:05:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IF5TH6326863
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744988729;
	bh=YvFJvGG4okhAh4ZzeiEtpd9T2TUuyeMrkIjC3ug+0NE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BbWy1GfDHWFrXxEugsYwPHi9Ko8HzFq40FtbD41WlPpl+yzMV8nKfiJz/33eQVFny
	 mPlREOxVlTkMqPZ1yhiI9a3O9clrTl4sBUvbkaIP7K9r+PTNCTWLi9Ecb8m965dA+F
	 LPZxkNth+BqtP6WLoM2+yWpvzZsXx8UTFZl+fTbI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IF5TXY095548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 10:05:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 10:05:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 10:05:28 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IF5SmU009009;
	Fri, 18 Apr 2025 10:05:28 -0500
Date: Fri, 18 Apr 2025 10:05:28 -0500
From: Nishanth Menon <nm@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <s-vadapalli@ti.com>, <srk@ti.com>
Subject: Re: [PATCH v4 0/2] Add support for CPSW3G port 2 on AM62A7-SK
Message-ID: <20250418150528.ukbbqf7vtoof5fhg@splashed>
References: <20250211182134.1500867-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250211182134.1500867-1-c-vankar@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_080534_004373_C0B74949 
X-CRM114-Status: GOOD (  16.87  )
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

On 23:51-20250211, Chintan Vankar wrote:
> This series adds support for CPSW3G MAC port 2 with the SK-Ethernet-DC01
> Add-On daughtercard. Also, the missing alias for CPSW3G MAC Port 1 is
> added to the am62a7-sk board file in order to allow kernel to fetch MAC
> address populated by U-Boot for CPSW3G MAC Port 1.
> 
> This series is based on linux-next tagged next-20250210.
> 
> Link to v3:
> https://lore.kernel.org/r/20240429101739.2770090-1-c-vankar@ti.com/
> 
> Changes from v3 to v4:
> - No changes, rebased the series on top of latest linux-next branch.
> 
> Siddharth Vadapalli (2):
>   arm64: dts: ti: k3-am62a7-sk: Add alias for CPSW3G MAC port 1
>   arm64: dts: ti: k3-am62a7: Add overlay for second CPSW3G Port
> 
>  arch/arm64/boot/dts/ti/Makefile               |  3 +
>  .../dts/ti/k3-am62a7-sk-ethernet-dc01.dtso    | 62 +++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso
> 

please re-send this series, series no longer applies.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

