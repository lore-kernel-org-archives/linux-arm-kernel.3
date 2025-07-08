Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0BBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjDH14jcP9MHv2LGOPKKg6IHWhyCkH0qgOI83hfD9Yk=; b=W5m26FdCt54+bNuLSg7vax7wFQ
	NwEhXiePp0h49w4fFPajE2YhEhIn65L6WEXm0Ef6DeJpuiSFCxnXPHint4LNsQkk75gSRd8efU89w
	fjhnazBpdnVXg7jxtJH6YHujENEiH6hOg5xqsJvHapg0165jtxc2NXsT1R1HRj9q/T26r8Yjl26cD
	+EkWNKJu23V3dIOgVJDh32FNR/19YSiD7P3wrwOPdFiWBwhv4OXigL6kbOzNY+yQ6VE50iceXtTgh
	6SOahJBK1NHvjx5GV6zBWQdDdH7k3/tKJa3AsoC1/Zs+j7H5Xtx2RgcJsCSc7M73oQi1+OdKrUX/P
	IVLO3rsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4hF-00000004u5V-1pcf;
	Tue, 08 Jul 2025 09:33:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ45k-00000004oJn-1lS3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:54:21 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5688sF9g1110727;
	Tue, 8 Jul 2025 03:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751964855;
	bh=ZjDH14jcP9MHv2LGOPKKg6IHWhyCkH0qgOI83hfD9Yk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H69aYtkGV/ZwDd+97tcA0QtMVeEe9y13KnYRpe6QSvs+3069+mYhhydvhJB5cxzSJ
	 Xp+OLvw4XHsLl4UkCF7Zvm229lhW0IvJ9RbXarKWYFmb9w7M53dGjz5rm6brQ90CLG
	 oObdqPPpXBohHISilJTRtQ/Xv5M5swkttOQbVCzo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5688sFBo2223115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 03:54:15 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 03:54:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 03:54:14 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5688sDVc1782143;
	Tue, 8 Jul 2025 03:54:14 -0500
Date: Tue, 8 Jul 2025 14:24:13 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all
 property to enable Ethernet boot
Message-ID: <a1e0824e-1d84-4842-97ba-3ae4ec04a72a@ti.com>
References: <20250708084252.1028191-1-c-vankar@ti.com>
 <20250708084252.1028191-5-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250708084252.1028191-5-c-vankar@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_015420_542894_7B1D06D5 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 08, 2025 at 02:12:52PM +0530, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to required nodes to enable Ethernet boot
> for SK-AM69.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

