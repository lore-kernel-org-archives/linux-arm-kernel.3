Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0295C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRFwU9Lb1WfEpspcwACoRGomPCvtegLX9PptHfh7xPw=; b=hkBJ2PXyvH1sQZjrc1wXZMLlxk
	NB4grtzw7KQwa3Hqr64R4BxEaMAD5TivDifmm9lyscoK/dmyj3AdgqX4+lOSy4ipCG7LUub8eayzJ
	pI7csr1BH+aB58ZeXHOIHLiRhkK4UbbSb/B/jNZ0qIVFmoit58yydNhJZxiu/3hTmMW2ZqLL195jH
	SFiJ6fZEh+3/sqTfkXFqmkgBOMaH9N8F9izbPvCbwwKcQl+OrE5fyQB8RZIvZrKkTys5gmFsxKLy7
	TIhro9s3N6EUwXwEgNT3dk5+HVGRKzPy9S9jixYodSqMcE6xtBdtXzgC1W+trYe3fGblqXkr8g9T2
	ScmWd9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ca1-0000000DZ9C-1ROn;
	Fri, 11 Apr 2025 11:29:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CRQ-0000000DX5k-32Q8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:21:02 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKvjS2059419
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370457;
	bh=SRFwU9Lb1WfEpspcwACoRGomPCvtegLX9PptHfh7xPw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nCIySuVhusyy5uTdh6Dp+buSgfKGWx7NTaEWLINAqD6IiUODjDBjwmdf9nOImJIL4
	 ejMkpwIrJzNiOL4cZb4t21y6Dforu5uEcQrh7VAwDL7eFZrck5mdxy8eO4qSpVOCu2
	 a0E7kc/pEryfQDIYRE1HIoaON4ecZCohT67VvavU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKvrI028722
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:20:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:20:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:20:57 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBKuw3065396;
	Fri, 11 Apr 2025 06:20:56 -0500
Date: Fri, 11 Apr 2025 16:50:55 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
        <rogerq@kernel.org>, <kishon@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: k3-am64: Add PCIe ctrl node to
 main_conf region
Message-ID: <37527a6f-6573-4e2e-bc79-09c067870d90@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
 <20250402113201.151195-6-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250402113201.151195-6-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042100_806921_443F704B 
X-CRM114-Status: GOOD (  11.32  )
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

On Wed, Apr 02, 2025 at 05:02:01PM +0530, Jayesh Choudhary wrote:
> From: Andrew Davis <afd@ti.com>
> 
> This region is used for controlling the function of the PCIe IP. It is
> compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
> the PCIe node.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> [j-choudhary@ti.com: Add changes to k3-am642-evm-pcie0-ep.dtso]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

