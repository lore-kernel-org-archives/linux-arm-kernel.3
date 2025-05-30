Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9399C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 04:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYZfOBCMU4FoxcQrKpFL+3hZqE6akIUbeovKq52WWWU=; b=RHxD0Gq5fywpVNcPRUdlnW1SHw
	SOrd6xDvoZ9EDuh7PZG+uE/X2hJLbKzK2p/efU/yV+96bhmLCRd0KB4ay/Vbqy2ji+V9jaBaQdPMM
	kJFk51FYwNNsn6d80IoHkUiR2BG2ZuEgmn+cH4LU9vYXtTk+uDaJMNZ85elq9HgZZvmwOQlYlc6rL
	HlgtdfoDkEU2e+Fy93IpItLCbG0SvvI9D6YJ92Shx+RLBD6NYrJntp5ZaHryEdqhdgJR7osyBGrwD
	M4cWs9fiGRby7HBKzLO22hWI3/D3rNHzDggcUbS5d8NehpTHDJLxb3soDBNWZgfHqtuLNjFU6i1wT
	9ZxXjICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrq0-0000000HGIT-0WsS;
	Fri, 30 May 2025 04:59:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrnF-0000000HG6s-0GxM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 04:56:34 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4uUDJ3690456;
	Thu, 29 May 2025 23:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580990;
	bh=GYZfOBCMU4FoxcQrKpFL+3hZqE6akIUbeovKq52WWWU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hD5a5PJPJIZXd8sFr1BtYsRbzG3da5X9QPAn/OA/Vb1UkJqJvtQkxXLUicxheNc73
	 2xDA8AzhtTilRu85J924xksMb5kx/QOGowxeodxXIwp6L+WgskYrkqFJM3oykRkdqi
	 yRDV6XOx1tsEThm6obbTtJpT67zBLo9xngSdXkyY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4uUQj635168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:56:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:56:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:56:29 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4uTBo2610556;
	Thu, 29 May 2025 23:56:29 -0500
Date: Fri, 30 May 2025 10:26:28 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 13/13] arm64: dts: ti: k3-j721s2-mcu-wakeup: Disable
 "mcu_cpsw" in the SoC file
Message-ID: <62c3a4e6-ffa3-4fc4-a0b1-c8b4bbec684b@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-14-s-vadapalli@ti.com>
 <4d2eeedb-0b3e-485c-ba15-82fb78fca4c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d2eeedb-0b3e-485c-ba15-82fb78fca4c7@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_215633_149780_59141352 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, May 29, 2025 at 03:38:10PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > Following the existing convention of disabling nodes in the SoC file and
> > enabling only the required ones in the board file, disable "mcu_cpsw" node.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> Really all of this is fake split. One line per commit.

I split the patches into Board and SoC specific changes. I was following
the split used when we add new device-tree nodes:
- Add the node to SoC file in the first commit
- Enable it in the Board file in the next commit

Since this is a cleanup, the above split may not be required and I
understand that. I will squash the changes in the next version of this
series.

Thank you for your feedback.

Regards,
Siddharth.

