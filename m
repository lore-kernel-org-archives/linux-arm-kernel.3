Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580DEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNj2Be0bKSfGk+fsGABndEIKFa0Oidh9U8eYMXOA2ds=; b=rxjVED0s5RoiAlCRlxLGxWbKcb
	tM9BCM7zryOCx5YBchGdTA+jp3Ps0+Lc86eL7vmgOKmNUnkklfRe/eLrCRzREH6yRaXadRJhN5Gdy
	xToXlTT5/70mL2Kz6rfLdXhVku2xcNxR8PPzbDKJYCKkiCvayZGoq6iHqRut7sEgrMx3cVfcibbWy
	RLaklSQpSgo1xJJrBnjwH1T794EHn9gFAW9IGh1p2w/Bam3tIdoUlrFXbffXWGawW5O8zLYRFAvl5
	wtwZotJFU7lLvyKJTOpC4fvJiQysOn+5ZzYqUnz01io0LTwosYnWmzI06DR1hIjmbiS432LHHli58
	fbUbmq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5m2I-0000000GHvM-0bXF;
	Fri, 18 Apr 2025 13:45:42 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5m0L-0000000GHaF-1fik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:43:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IDhPpX310236
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 08:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744983805;
	bh=WNj2Be0bKSfGk+fsGABndEIKFa0Oidh9U8eYMXOA2ds=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NOfOAshsqJxkwafY5dgPwxjMkNwFRwWVc5bemqBrcPclY5Xy/klRH9ioK/07GcrwY
	 OP2M/cROoTuC9+oD47MyO41WFVfv5PKiqVBc5aEOnx+jlEWSfQaEyfw6zIPSlHd6tK
	 OkbqwLKecAsg090lWHGb/o4s4Ji5I0sc7MTiNY8Y=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IDhPbo003348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 08:43:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 08:43:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 08:43:24 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IDhOLc051358;
	Fri, 18 Apr 2025 08:43:24 -0500
Date: Fri, 18 Apr 2025 08:43:24 -0500
From: Nishanth Menon <nm@ti.com>
To: <huaqian.li@siemens.com>
CC: <helgaas@kernel.org>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>,
        <baocheng.su@siemens.com>, <bhelgaas@google.com>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <diogo.ivo@siemens.com>, <jan.kiszka@siemens.com>, <kristo@kernel.org>,
        <krzk+dt@kernel.org>, <kw@linux.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <lpieralisi@kernel.org>,
        <robh@kernel.org>, <s-vadapalli@ti.com>, <ssantosh@kernel.org>,
        <vigneshr@ti.com>, <iommu@lists.linux.dev>
Subject: Re: [PATCH v7 0/8] soc: ti: Add and use PVU on K3-AM65 for DMA
 isolation
Message-ID: <20250418134324.ewsfnze2btnx2r2w@country>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250418073026.2418728-1-huaqian.li@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_064341_594745_F2685D5B 
X-CRM114-Status: UNSURE (   9.74  )
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

On 15:30-20250418, huaqian.li@siemens.com wrote:
> 
> Jan Kiszka (7):
>   dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
>   dt-bindings: PCI: ti,am65: Extend for use with PVU
>   soc: ti: Add IOMMU-like PVU driver
>   PCI: keystone: Add support for PVU-based DMA isolation on AM654
>   arm64: dts: ti: k3-am65-main: Add PVU nodes
>   arm64: dts: ti: k3-am65-main: Add VMAP registers to PCI root complexes
>   arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices
>     behind PCI RC
> 
> Li Hua Qian (1):
>   swiotlb: Make IO_TLB_SEGSIZE configurable

I see at least 3 or 4 maintainers needing to co-ordinate, gets
complicated as I am not sure which maintainer needs to pick up what
patches in what dependency order. This looks like a mixed bag. Can
we split this patch into independent series for each maintainer with
clear indication of dependencies that is spread around a couple of
kernel windows (maybe dts comes in last?)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

