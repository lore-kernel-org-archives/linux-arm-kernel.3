Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94B9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlHahpXnp8IJeAHPagZczFwQdB2gTDNHE9Q1Zh7iQoM=; b=wZ09R5WlGioDhtm7cmG/Rm1PP1
	xgX4HQ9HCj0N3YBlrT22j7CkRJohG55kZ/+ufOzMAe45IaHjZsV2Kkj8as8LnZu95BfBqq4fyEYwi
	Z+GVRjihWHwQK/tk/3YW4wiYLDsBhhARs8kWjDsD8szA+fypbOrujIBqV6TzBFKudcy+cP3h1foMt
	MakNNEW0vW+4uZ9rh/5Pt1TKERPHujZXdiiHKriw13bWlATl09KN10727XlImYbFlIGmK1aesT2dx
	A7PMZ/5SRCIVX7tJQ19VaafWPKj7hN9S/ZGzgleH1ZMwLjMhXe10u04St3/LQfMRUKaYftM/YMzyc
	Mq+TYrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7p1g-0000000CsSM-3J49;
	Thu, 24 Apr 2025 05:21:32 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ozh-0000000CsKm-2GdX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 05:19:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O5JAvq1756408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 00:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745471950;
	bh=AlHahpXnp8IJeAHPagZczFwQdB2gTDNHE9Q1Zh7iQoM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZA9NLSwzw4l+T1crMjoGLiAMzSUx1V07zKqDk+BL6ZeDY1f+AHsiUvPWZZzaL2scP
	 +/KD3ycD23xEnj1CD8W6UBS7BRXBmunBtTpYw0h7QOHHQSAz9gCizXg2QyhJAs4VbP
	 cUYR8DE/hTkrfiUSLHPjZVJojedvakxIfs7aFIUw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O5JAgn022471
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 00:19:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 00:19:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 00:19:10 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O5J8Ux080258;
	Thu, 24 Apr 2025 00:19:09 -0500
Date: Thu, 24 Apr 2025 10:49:08 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Rob
 Herring <robh@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Kishon
 Vijay Abraham I <kishon@kernel.org>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        =?utf-8?B?VGjDqW8=?= Lebrun
	<theo.lebrun@bootlin.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] pci: j721e: fix host/endpoint dependencies
Message-ID: <573c92aa-f891-47c9-9ea8-c71e89694a11@ti.com>
References: <20250423162523.2060405-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423162523.2060405-1-arnd@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_221929_676844_38725B8F 
X-CRM114-Status: GOOD (  15.92  )
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

On Wed, Apr 23, 2025 at 06:25:16PM +0200, Arnd Bergmann wrote:

Hello Arnd,

Thank you for the Fix.

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The j721e driver has a single platform driver that can be built-in or
> a loadable module, but it calls two separate backend drivers depending
> on whether it is a host or endpoint.
> 
> If the two modes are not the same, we can end up with a situation where
> the built-in pci-j721e driver tries to call the modular host or endpoint
> driver, which causes a link failure:
> 
> ld.lld-21: error: undefined symbol: cdns_pcie_ep_setup
> >>> referenced by pci-j721e.c
> >>>               drivers/pci/controller/cadence/pci-j721e.o:(j721e_pcie_probe) in archive vmlinux.a
> 
> ld.lld-21: error: undefined symbol: cdns_pcie_host_setup
> >>> referenced by pci-j721e.c
> >>>               drivers/pci/controller/cadence/pci-j721e.o:(j721e_pcie_probe) in archive vmlinux.a
> 
> Rework the dependencies so that the 'select' is done by the common
> Kconfig symbol, based on which of the two are enabled. Effectively
> this means that having one built-in makes the other either built-in
> or disabled, but all configurations will now build.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

