Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A5C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us19Ty/9n8yZsApwmlVDeaLsgtr1VaqGDivNaYz1zGU=; b=jFZaak8RKfbrptGpmCOHqL0RRu
	Rt5XKcGQw9wa62ixsOfJjC3UhLwjA5TP6thMzFXF/5orQso/ENRcL0pd2P4ycRj2+SphSr8qSqnn5
	JcRMKi9dd7BTVkrIhHxRqEUxDMTVplLQBS/h1HNVZQ4s1x5Nh7217SKGjFHb60HNHBut9l/iShrYq
	mhQMDWQ6UI6Cyxtbg7kCQ9aP1B1D2XcFlvu+ArlvFKno0GzVNxtSkSvVox67fElHqmK4nB/PyMWfW
	7dAjiaKXiaTJh+TvTqft2TXH+mXiK7YZjqgsj0A0XdV6PlI0FE1uejqowoTYkE0G6pFE0vtLr7lU1
	zdtdBKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBK-0000000AhI7-1kqK;
	Tue, 03 Jun 2025 10:47:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOYY-0000000Ae9e-1xRO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:07:43 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7d5T491699;
	Tue, 3 Jun 2025 05:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945259;
	bh=Us19Ty/9n8yZsApwmlVDeaLsgtr1VaqGDivNaYz1zGU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZTdrYtw+8ejrz+MiEONG/IhLdVkwNJntRs/SnsXKUSCvWhZCmUdwWsnToxJct+3zZ
	 kooD9bWptWcWax9ppNYCTFnwUeOq33dKOZrouaI4Ae66rLn40fT4PqE7LpjVrEYfxK
	 gt1rvOVMquVWKsYTESwwaGnPjBnZvFXYU5AXFLBc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7d0f3454256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:38 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7cT1182257;
	Tue, 3 Jun 2025 05:07:38 -0500
Date: Tue, 3 Jun 2025 15:37:37 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-j721s2-main: Make the "scm_conf"
 node a "simple-bus"
Message-ID: <72fc5b90-5c51-49d9-8757-1971e5dbc208@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-4-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-4-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_030742_592950_FAB2D6FF 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Jun 03, 2025 at 03:26:08PM +0530, Jayesh Choudhary wrote:
> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
> "scm_conf" node to "simple-bus".
> Also remove "reg" property as it is not needed by "simple-bus".
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

