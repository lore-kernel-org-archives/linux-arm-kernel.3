Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A1C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=; b=tkYJhpeNb77QxHAcXsZ8MVNL4p
	bTAcTbG1YtxLSGne9kldVxuScYlSyO0RG0An025I5N4ycUa6EXHJ6iW8//2EwHWoglEci932p2QUU
	9NRrNFgl0ars75Z4I7/Ql4vBj+i6rLYucRMgsbec++SKMydUKnZidJpT9GgOIvJBGGHatF7JbpA4B
	HfttpAhw+TGxpDKrEik4WKh/agLGp40T+C2gsNYoLvT10zsuta91Pjbg2DmOfkY7xDmgYRpFxKHsd
	ON/0M0xEakGq7Dmz5h8QhKAkXilXzhBwlCUCHpkrn+1EsWjIsnajv80lwrc3V+QLxLxku4C5Y/xgn
	RrJdHSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6klY-00000008gzr-1maz;
	Wed, 16 Sep 2026 08:13:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kkz-00000008gyW-3CFZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:13:12 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f6so4337505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 01:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789546360; cv=none;
        d=google.com; s=arc-20260327;
        b=rYI71fRYYbLem6zI3NbpQ5utWdxUVkdv+4N51kExpz5+CN6HKVV+uB1CC1YEAReGwc
         fLCP2903W/G9erntD/8q/qKVBD7tVohJmRj+CzG/s5mUqWUVQ4wnm7EsizUBV6ek6YQI
         DuufIgMphQNjA53k7RR/xbh7hzYjhMpPa68/SNAkVgb34JK0mG4zF6sPZzV8YIUp821V
         e1YSg2KSlbS/E4txHeUx1kZ/c6R3Khh2aNrRzyvlkd0/vYORrwYMiCWyuLHQ7AEzfXs7
         xuOkmTtIcNq8PrY6HuqXHvufmdeS4brAx+yrYUfk4ApW5yQZdA5aTaHpBvvB9QgQTouR
         GWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        fh=3okzBrib2B+zs7DYqs9ZmNjRwlBnrzjlwETBO77WCIQ=;
        b=chY/X3boHafPyaEA0ULgYeRU365ig8nMtuss+QdZCb2n4Vt9xUJU6ia0twdZ0TjIyr
         /m3AOjIotDjBwtLpvWkRxA6WhSObBVcPjOso5jZc8nE2Nmzp2a0sn0giP9BQo11TlAvq
         QiT6eyttmzCApryE6QoUS6W6u0DwTQrEw+i96BWb4ZP4kue4KO9Phd510C5Tp4rqaKlr
         7su8SxgUXtfLLqnbpG170Oo7IMK9nd4PrKTSIdVSPf2j8CMbmS/YIb5QR5dNiVbeaWSS
         hvx1zmUdIfXei4FZvHZnbOf5D0FqXIlLW/X8ujBzkJcpVduRhMcORoPekUmKJpIIVakU
         TsTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789546360; x=1790151160; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        b=nWCmOdjNaY4pSYrXuqcBos8pcYyqRk6oYbcSGytoqWDTgJH0Cpk+gg6SM5I46IdRBI
         UVN5Dfo2S9sqI2OcTpdu7BEgpanJ2aACACuvp6OYzK6VqQIoa5I8CEVT8knYwdL6eGsU
         lN37xHy1t3Agj8uAJGp4N8WOfpOzJksLa+Z8up404ykI0LgtdMvePj01QdifwMf7FV5E
         8PSTl3+IUkPonXWe0b2ThtjIt8CLipX5jblKnGM+EMXaeOCd8z7IBranEepBGQkLGx0A
         wkZffCRS8FVzVdxOlD5UYbrOBJRtBKIJWH4vwjY7XgH5UZC7BURA1pCkQ5R2kWdmP5Vi
         2xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546360; x=1790151160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t14AObIR2QBOUNMncWOce2WTBgZep0rHd7yi7bMhncY=;
        b=Lrk90eSnqL9UudS0UvhhdivbL5VRDPY1SwdgIYnACitBb1o66HAQxzNsw729SPsfuw
         FEmEiqFanr7tNB585xA8t/HnO4y6btwo76HxuIm1Wxczhszihi5/xGUvx6T9fOhxppsg
         ID90cTIWGP62S+4mQHwMrnWVapp1dOlQhmQ6ZXVXoqiggAuvGa75AY8uWvy04IcE0hwb
         WCeNbwBFR/lqHvLst7XtE9uEcxCkX8HRV6M874i9ssVSk+/H2UJM7GB+YLyMZ9osYeql
         Oah2YH2cngfYvyWvK9jEaHh28J+QdWlsQki/awEAU+9kxycD39+YZXPGQPtPyaSNTPxr
         xrgA==
X-Forwarded-Encrypted: i=1; AKwUvBxXnx885HzG5np3ZnicHMrNsHWgR/QgdrG6rkzSnejeNeNJwGTFBBzv1oKBMpeEkyETNmKXPRjmkz1YFtz2sIRu@lists.infradead.org
X-Gm-Message-State: AFuF++kgIYMr4a4QQoenrPfbubxehspi04oYGQ/1F746uetA8yL08YJp
	XdDsdlIY93dRQ0ly11wznvnCKMhIL1EiVsHuTKO+iHItFSeP+xwsJ+ULJqP3yfMRVLUN9LL222g
	gDp7ItttYsvE2YOvtCW/RVEj/90GG7+8=
X-Gm-Gg: AYBFou3B2VCCtnzAWac0Y/gXaqgzL+j5Yvbylnb969cM5nHmXnosAytaon6VzZ7hDMP
	NIcyyiHN7ABiKNZWJWyRPcX9lKrVU2aDGyZdrufIxmGpSwPT1rzCG2vmKjVMqjWZzGHon/MwnbC
	T4sLg1CJJg9t5/L/rHUukFZq3SRr7f7UJJPP8Cl0idyLpKGkDyTB2l/pe/AlPukZCeRHBADzLHH
	5mLHTQAiDLtX2LUsighVmgNyukTx92KcTDqB09uHpYTvqWce4xsSXTs3Lx2zgBMzkke6Q9dKCPP
	VX8+egNCj0/D6GRzJ5VDJgJt/ofLKj6ulahCEGa2aBcj5gRJ7X/ILilOC+Iry2A0L7t+mAY6XOL
	Sj40TFTfg4w0l3DYDxz9nef8o/MdPRA7KLAnWlK4zAiHGpEkL
X-Received: by 2002:a17:902:f787:b0:2dd:4070:8f5 with SMTP id
 d9443c01a7336-2dd8e75ca6emr35576805ad.21.1789546360033; Wed, 16 Sep 2026
 01:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260912043626.437-1-strst.gs@gmail.com> <20260914174624.GA663242@bhelgaas>
In-Reply-To: <20260914174624.GA663242@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Wed, 16 Sep 2026 11:12:28 +0300
X-Gm-Features: AcwNN1Uc845XdVMCaRf6nH7tbJM_-GdS3-1HqZH4tFRgRtiorOZOnG7_uldSdsw
Message-ID: <CAAsRjRmur6jr6mOt4ifSc7DA3k7z31qZ5AWwoJ2qK8qV26eqpg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com, 
	arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_011241_825930_FFECD9AD 
X-CRM114-Status: GOOD (  25.35  )
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

On Mon, Sep 14, 2026 at 12:46:24PM -0500, Bjorn Helgaas wrote:
> I guess this goes back to 767012397976 ("ARM: dts: BCM5301X: Describe
> PCIe controllers fully"), but I'm confused about this.  Why are two
> incompatible devices (rev 0x01 and 0x07) described with the same DT
> with address ranges that are wrong for rev 0x01?  I thought DT was
> supposed to be matched with the hardware in the box?

Yes, it goes back to that commit. The PCIe nodes are in bcm-ns.dtsi,
the include behind bcm4708.dtsi, bcm47081.dtsi, bcm4709.dtsi and
bcm47094.dtsi. Before 767012397976 they had reg and the cell sizes
only. That commit added the compatible, the interrupt maps, bus-range
and one set of ranges, and widened the axi node's ranges to the same
three windows. Its log says it was tested on BCM47094 with the
platform driver.

Both revisions are the same PCIe Gen 2 core, BCMA_CORE_NS_PCIEG2, and
pcie-iproc-bcma matches it at BCMA_ANY_REV. The difference this driver
meets is the fixed outbound window base. The first controller decodes
0x08000000 on both. The second and third decode 0x20000000/0x28000000
on revision 0x07 (BCM47094) and 0x40000000/0x48000000 on revision 0x01
(BCM47081 and BCM4709, measured). The values in the DT are the
revision 0x07 ones. Broadcom's own driver in the 2.6.36 vendor
kernels, arch/arm/plat-brcm/bcm5301x_pcie.c, has 0x40000000 and
0x48000000 as its default table and switches to 0x20000000 and
0x28000000 only when the core revision reads 0x7. The enumeration ROM
reports the same base per core, and that is what the applied patch
reads through bcma.

> And I guess I missed this part about the platform and the bcma drivers
> both trying to claim the same device.  That seems like something that
> should be solved somewhere in the bus drivers (platform, bcma), not in
> pcie-iproc-bcma.c and pcie-iproc-platform.c.

Yes. Both drivers have bound these nodes since 767012397976 in any
build with both enabled, and neither the applied patch nor the
follow-up changes which one binds first. The follow-up only stops this
driver from requesting windows it never programs. It is in the commit
log because that changes what happens after the collision on revision
0x01, and multi_v7_defconfig builds both drivers (both symbols default
to y under ARCH_BCM_5301X). OpenWrt builds only the BCMA one.

> Why is this not a problem for other BCMA devices (bgmac_bcma_driver,
> b43_bcma_driver, brcms_bcma_driver, bcma_hcd_driver)?

Because the pcie nodes are the only children of the axi node in
bcm-ns.dtsi with a compatible at all. bcma_bus_register() runs
of_platform_default_populate() on the axi node before it registers its
cores, so a core whose node has a compatible gets a device from both
sides.

The gmac nodes have no compatible, so only bgmac-bcma binds them;
bgmac-platform matches brcm,amac, brcm,nsp-amac and brcm,ns2-amac,
none of which appear there. The usb2 and usb3 nodes have no compatible
either; bcma-hcd claims the core and populates the generic-ehci, ohci
and xhci children itself. b43 and brcmsmac have no platform
counterpart.

> Is this another consequence of using a DT that describes
> "brcm,iproc-pcie" controllers that don't match the hardware?  Why
> don't we have different DTs for these two kinds of hardware?

The double claim comes from the compatible. Revision 0x07, where the
DT window matches the EROM, gets the two probes as well, so the ranges
play no part in it. bcma attaches the node to the core by its reg
either way, and the wifi child nodes in bcm4709-netgear-r8000.dts hang
off it, so both drivers see the same node however the ranges are
split.

The DT is already split per SoC family, and BCM47094 has its own
dtsi. The shared part is the include. The per-SoC files can carry the
window difference; today they do not.

Best regards,
Semih

