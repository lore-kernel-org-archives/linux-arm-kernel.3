Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC95C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwXoDzRvS+YsbHtUNjtpCGK6RTqznHYzIL2Zam2ecbI=; b=yQu00Xuw1f9g66QrIOxl3oWoxF
	2UevyrUC+z5p4R/r8NL9rJ7f9lpWaRK9XeT2HAdPVqV4FZzVSC5Tk+SReCTd4QzHd8F5r4hyq2DLV
	e8MsUAYjfVcKLlLwnUieGal1l8GG9Hc7utjjkryyUALUL557dDNwdR0KUrNjiWTdhkqo1bWzrE6DM
	uZ+d/MACSNSgUXilGfuJDOswdg7H5YgGKzc3QA9oan3kPjg6d75xDzEBQPeYpAv6pklD0ObOc4X2M
	/Gz87rZoKsXsR0TPUF9m2fb8hwYSf67c4vRV1Pn4QPuobqB/c1il9WpkQuvsdAdAoTFH/46PAfVJZ
	Kxog9fTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpp-0000000Dgkg-32yL;
	Tue, 06 May 2025 23:36:25 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCN8U-0000000D7Yb-2V7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 18:35:23 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546IZHqQ586234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 13:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746556517;
	bh=BwXoDzRvS+YsbHtUNjtpCGK6RTqznHYzIL2Zam2ecbI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gSusIwAt5xnnc7Ahc7IxKAhUieiWzQM7E4oyZfp5AyY5uOyOd66JPeIhJyhpCyxLO
	 RuUXsWp4ZicAQ+PBU0x8DXbZVH0caxvLiK/JakyCGW4D8igK0tr9UpdJj1H8HR4Uf2
	 fdI1Y6oLEOJFo8Jn+NlwkNPPhT77PdvfqJA6tb5M=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546IZGZ7075472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 13:35:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 13:35:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 13:35:16 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546IZGH4077563;
	Tue, 6 May 2025 13:35:16 -0500
Date: Tue, 6 May 2025 13:35:16 -0500
From: Bryan Brattlof <bb@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62a: Enable CPU freq
 throttling on thermal alert
Message-ID: <20250506183516.roxspxdjkcoiudfr@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250506114134.3514899-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250506114134.3514899-1-d.schultz@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_113522_723572_6396921C 
X-CRM114-Status: GOOD (  11.37  )
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

On May  6, 2025 thus sayeth Daniel Schultz:
> Enable throttling down the CPU frequency when an alert temperature
> threshold (lower than the critical threshold) is reached.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changes in v2:
>   * Increased passive trip point to 115C (10C below crit)
>   * Dropped patch which decreased critical trip point.
> 
>  arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 57 ++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62a7.dtsi        |  4 ++
>  2 files changed, 58 insertions(+), 3 deletions(-)
> 

Looks good to me :)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

