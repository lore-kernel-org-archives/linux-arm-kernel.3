Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2892EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wduqzuUnyN4v6B979S2NkcvhwxgSQYfa7l4KxdYqumQ=; b=zs1uDOw8wel/k9d6cA2HYchDuZ
	v3YMQB111xKtC4u5z9r4j/W+jYlTol0Fwu2CRP6iaBoM34FFVGibv2bFk5dpoSKi8+iqVEhk4VtYk
	JouiuCNrtWl11zGLeO4Xx2+r+mZ4GnkJZsJ/S+jzKX2xMHRmwIp4cRhGjknpJ0doFQW3cD2FO2N6a
	3t9dcm9e8QXDKDp8ZOB/KrjFRcIqtd9fNeRz3BIX1nR8QVrxhKkpbFIB46el9keYuSx6SN1YRzZ30
	rfaSqf8CL8+tg6KYtPxhOkfhO9MF8o9SipsmPYR7ZXgItNkeVgfzV5bfi2RUaJeRMrVohuhWHfKy9
	2Dggerpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ee-00000003lcv-1xnc;
	Tue, 08 Apr 2025 10:58:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u265F-00000003dSD-1QaY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:21:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538ALT6e502981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 05:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744107689;
	bh=wduqzuUnyN4v6B979S2NkcvhwxgSQYfa7l4KxdYqumQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jkEDR1JBjJ4DR4EYmAYLvk52/VVVopl++GdGfwpP5+26Mvr/PXpar4Ff6NbmJ99oa
	 ut/KdUUfUC3vvkPM1WxQ89gkjdQPjt5rXf3STJILjDl5l477r3kzqCob4oYxR/OMQ5
	 r73sb8jjjRUsgwVTMceIDAVL9XaIMfPFVzVKOohY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538ALSih117396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 05:21:29 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 05:21:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 05:21:28 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538ALRuv130575;
	Tue, 8 Apr 2025 05:21:27 -0500
Date: Tue, 8 Apr 2025 15:51:26 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH 0/2] J722S: Disable WIZ0 and WIZ1 in SoC file
Message-ID: <20250408102126.uzmhkkt5ebiaotvq@uda0492258>
References: <20250408060636.3413856-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408060636.3413856-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_032133_464223_CE3A87B3 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue, Apr 08, 2025 at 11:36:34AM +0530, Siddharth Vadapalli wrote:
> Hello,
> 
> This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
> nodes in the J722S SoC file and enables them in the board files where
> they are required along with "serdes0" and "serdes1". There are two
> reasons behind this change:
> 1. To follow the existing convention of disabling nodes in the SoC file
>    and enabling them in the board file as required.
> 2. To address situations where a board file hasn't explicitly disabled
>    "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
>    as a result of which booting the board displays the following errors:
>      wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
>      ...
>      wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

Since this series fixes the above errors on Beagley-AI, I will include
the "Fixes" tag in the commit message of the respective patches in this
series and post the v2 series.

Regards,
Siddharth.

