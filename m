Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1341EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Njmu/kDM1xSU/K64/+IR5Y3ODQTNZCGbM8fmRUrXiFQ=; b=jmrXMHa1we7lXoaqJCxUq+j0jG
	0TmtmPvQJR1cBW/g/GHjv8HLCNDbSioHnzu2AazrLwwaAoeAfQ2z/8jTe9OwreKoOKCjqiW4bGK4G
	tHuQCY4miXxKANBFXIlwtEGB0Mq6PBE2405war1Phj40SEBLoTyddtWHvVv7RStBvDvrEOYQlCh29
	pRYAmiQgJWN8Yvp3Xl5jXLrWTDpfHFy1qXzc03OkZ3w07vS/PakKMN/PduXL5hJ5AgZa7nU6/Gryw
	IDCKpTtdrpBKgBj78fuMo+1pWEVUHfLGxQl4pQxkcLk+c3BKUaJQmewcjGaLXt9eXroeIMnRXYCx4
	f/L6UGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacCr-0000000AVEb-42Sn;
	Wed, 22 Jan 2025 14:59:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacBa-0000000AV4x-014d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:58:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MEwMPa1008063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 08:58:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737557902;
	bh=Njmu/kDM1xSU/K64/+IR5Y3ODQTNZCGbM8fmRUrXiFQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=khZ26zZxSHNvE4D7g4EhGnJbVj2h1OdbuQBIWEuXPq2D73BcoSv7XwxllUNoSC35P
	 zpxoEb6mkyTPibDVDCL4o+0+hcqtYxwJuZb2mhMnKaMwRtN9xq6KCfADMKWL3mraKO
	 AcqEbjs0w6AvVvyUR15RXF6wMlkt9kI5HsYXS3Ks=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MEwMZ8102967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 08:58:22 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 08:58:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 08:58:22 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MEwM4U030645;
	Wed, 22 Jan 2025 08:58:22 -0600
Date: Wed, 22 Jan 2025 08:58:22 -0600
From: Nishanth Menon <nm@ti.com>
To: Daniel Schultz <D.Schultz@phytec.de>
CC: Andrew Halaney <ahalaney@redhat.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com"
	<srk@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Message-ID: <20250122145822.4ewsmkk6ztbeejzf@slashing>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
 <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_065830_175756_87206FB3 
X-CRM114-Status: GOOD (  17.02  )
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

On 14:53-20250122, Daniel Schultz wrote:
> can someone please apply this patch? It's actually required by all TI 
> AM6 devices with PCIe, e.g. AM64x.
> 
> - Daniel
> 
> On 07.08.24 22:15, Andrew Halaney wrote:
> > Enable PCI_J721E for usage in both host and endpoint modes.
> > This is used by boards such as Texas Instrument's SK-AM69 and
> > J784S4XEVM.
> >
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-By: Daniel Schultz <d.schultz@phytec.de>
> > ---
> >   arch/arm64/configs/defconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 01dd286ba7ef0..e5222dbedd387 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -225,6 +225,8 @@ CONFIG_PCIE_RCAR_HOST=y
> >   CONFIG_PCIE_RCAR_EP=y
> >   CONFIG_PCIE_ROCKCHIP_HOST=m
> >   CONFIG_PCI_XGENE=y
> > +CONFIG_PCI_J721E_HOST=y
> > +CONFIG_PCI_J721E_EP=y
> >   CONFIG_PCI_IMX6_HOST=y
> >   CONFIG_PCI_LAYERSCAPE=y
> >   CONFIG_PCI_HISI=y

please make them as modules. no point in growing the default Image file.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

