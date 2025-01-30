Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819C3C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmAzshRQ/eoyUa15a7shiw9xP+4OVwraDsIOrNlYrEc=; b=ICC8MexnwK4eEJbvZEutYGGhCm
	fQ7nYWuNNM4t/lejpk9SDV5vJimIE3DU1z8GpuLBnwKDjyE8ZvjczvTbXIqD5sp7VhSHPZmn/EuMy
	fJJ3Q9V/k7HpCP13M+YPzPrEFycc/fItk5rDyY0wNI0IqfB9au5Mi7fLWPEIpu8BRj5YhyVjPQNnn
	AnytAqRRTHEMRKZ4u26phwRBXTlVF3reqqkhKQ3zOLOkbhoSBGtQdSONgh0V5LmWp3I8sIVLDMB7D
	CbvGmfcZGpvpTADSJTgoJ8S8TfsjODO4qwazUyMfUitZsLwBKElZxkuQrxqprCvjtcwhaxBcWcsFp
	/4Rggm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWJs-000000093Oo-3HbI;
	Thu, 30 Jan 2025 15:19:04 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWIZ-000000093Kx-3BCi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 15:17:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50UFHWbE2317888
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 09:17:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738250252;
	bh=EmAzshRQ/eoyUa15a7shiw9xP+4OVwraDsIOrNlYrEc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=InBVI5dvdr+EFtv8wa94f9gAgJNSMaV+krTmaEpGqs+Kdf1s3s1zzbhcGgml8Jpaz
	 iwh7ySbjDRev86GjagsJnUmVCJpGK9i5YBsSGlnk/qpvOQ3aSrgdYlFjY3MuQDDRtl
	 a1LLk02Pje7MiM4bwBgFaTFb/7KY2RJsXO5lLpeo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50UFHWYQ050333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jan 2025 09:17:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 09:17:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 09:17:32 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UFHWxD069097;
	Thu, 30 Jan 2025 09:17:32 -0600
Date: Thu, 30 Jan 2025 09:17:32 -0600
From: Nishanth Menon <nm@ti.com>
To: Andrew Halaney <ajhalaney@gmail.com>
CC: Daniel Schultz <D.Schultz@phytec.de>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com" <srk@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Message-ID: <20250130151732.affkcg2w74op3vne@shorty>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
 <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
 <20250122145822.4ewsmkk6ztbeejzf@slashing>
 <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_071743_926741_F65397E4 
X-CRM114-Status: GOOD (  26.97  )
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

On 07:38-20250130, Andrew Halaney wrote:
> On Wed, Jan 22, 2025 at 08:58:22AM -0600, Nishanth Menon wrote:
> > On 14:53-20250122, Daniel Schultz wrote:
> > > can someone please apply this patch? It's actually required by all TI 
> > > AM6 devices with PCIe, e.g. AM64x.
> > > 
> > > - Daniel
> > > 
> > > On 07.08.24 22:15, Andrew Halaney wrote:
> > > > Enable PCI_J721E for usage in both host and endpoint modes.
> > > > This is used by boards such as Texas Instrument's SK-AM69 and
> > > > J784S4XEVM.
> > > >
> > > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > Tested-By: Daniel Schultz <d.schultz@phytec.de>
> > > > ---
> > > >   arch/arm64/configs/defconfig | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index 01dd286ba7ef0..e5222dbedd387 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -225,6 +225,8 @@ CONFIG_PCIE_RCAR_HOST=y
> > > >   CONFIG_PCIE_RCAR_EP=y
> > > >   CONFIG_PCIE_ROCKCHIP_HOST=m
> > > >   CONFIG_PCI_XGENE=y
> > > > +CONFIG_PCI_J721E_HOST=y
> > > > +CONFIG_PCI_J721E_EP=y
> > > >   CONFIG_PCI_IMX6_HOST=y
> > > >   CONFIG_PCI_LAYERSCAPE=y
> > > >   CONFIG_PCI_HISI=y
> > 
> > please make them as modules. no point in growing the default Image file.
> > 
> 
> The PCI_J721E_HOST config only supports builtin, which I think has
> something to do with [0] (but I only re-skimmed that this morning
> briefly). I don't have the hardware any more, so I can't test what goes
> on if you make it a module etc unfortunately.
> 
> [0] https://lore.kernel.org/all/86o73j3vea.wl-maz@kernel.org/

https://lore.kernel.org/all/20230817120823.1158766-1-a-verma1@ti.com/
needs to be refreshed. With that we can go ahead and enable PCIE as
module. I have requested TI teams to get it back on radar.

To give a context on why: Overall, we are pushing as a armv8 community
to lower the size of Image and move the drivers to modules overall -
this is to facilitate other platforms and armv9 architectures to also
be enabled in out default defconfig.

https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
was a discussion on the topic previously. my stance that I articulated
in the thread has been: if not mmc/NFS needs, please convert the driver
to be capable of modules and request to enable it.

However, I want to be able to move to initramfs default with all drivers
(8250, tisci, ....) also as modules.. Upstream poky builds of
genericarm64 is trying to get there.. but there are few more drivers to
finish the conversion before we flip the in upstream defconfig towards
initramfs. I did give a headsup on #linux-ti IRC that this change is
incoming, to allow folks to be prepared for it.. hopefully we get there
in the next 1-2 windows.

So, stuff like PCIe, I cannot accept as built-in :(

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

