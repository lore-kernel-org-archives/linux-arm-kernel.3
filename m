Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF2CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7F6UvMOLOBpAnoJT2OPB9Sfj0Nlv6IRaUBh0BBayrw=; b=zL45asLuffuJ09U82v7tU3OyVJ
	rat5pmSAz0No45/GqnVMjQiz62X+bzqlGksf4eSxcuUxt3OrCUC7ksIYjH3xq1+3PAnw4kDAF/OPP
	2U3PAmCN4CmjQ0cTF/Z27zHIZVWsHl+gB7EjjxWD5xEb59HxB2t3i7nsWpcsWBJfny765ZCVRZcCl
	nXEF3ViR6JGyrqvtM0hsWQLKWRxOd62i6er6YrI73DD6ajvKVLujpdu7tAlCEOGBjpX72Hg4AXWNt
	4h0uya35Tkbysm3e3XReuM+pGXtGmBdQcUb4/pLG9tnVHG+8o+tZvkTFcZ/gPhlJPkDB7QwQpP2JP
	n64f+6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMz1-000000030kQ-2iE4;
	Thu, 19 Dec 2024 20:18:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMqm-00000002yqm-2E7c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D12D7A42867;
	Thu, 19 Dec 2024 20:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551D9C4CECE;
	Thu, 19 Dec 2024 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734639023;
	bh=Mnnb+rYLxKMgvKB3JLV0A+iSR/Plp14zPx6cxIbIn8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aas/DPTnV/tYWX8qsv2YyScKUtB1C+I8dq6XFS6KjTHe3K78zTV3cuqSb3JOmrLGg
	 KIykwCGpgXPsHid1JvwU8cqOs1bW2x1wKlNXjQczyt8tlvU7wtsdTFIh6ketSL/hDT
	 j/OO4YnBnaDYCETAFlt23MnYElpoHUTgH9tzE1G0nntOKoYROLRMGozFzpsI23X8RD
	 EYS6qtDvVMkiB0pIDjlYaqLDKbk83p5CkcJrbsFnA2X7z5uU8JFs/2UC0a+DU8HDE5
	 SwxodYNlkuOi/Vcrd4d9glvIthIRht/0KStPyLGThnmaknxQCU/nLDnPk4zyFTgpFF
	 9u0RruLpexJmQ==
Date: Thu, 19 Dec 2024 21:10:16 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 4/9] irqchip/gic-v3-its: Add
 DOMAIN_BUS_DEVICE_PCI_EP_MSI support
Message-ID: <Z2R9qPmAyTcc5mtg@ryzen>
References: <20241218-ep-msi-v13-0-646e2192dc24@nxp.com>
 <20241218-ep-msi-v13-4-646e2192dc24@nxp.com>
 <868qscq70x.wl-maz@kernel.org>
 <Z2RRimPlT41Ru281@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2RRimPlT41Ru281@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_121024_629681_AE46A569 
X-CRM114-Status: GOOD (  14.88  )
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

On Thu, Dec 19, 2024 at 12:02:02PM -0500, Frank Li wrote:
> On Thu, Dec 19, 2024 at 10:52:30AM +0000, Marc Zyngier wrote:
> > On Wed, 18 Dec 2024 23:08:39 +0000,

[...]

> If use latest ITS MSI64 should be simple, only need descript it at DTS
> (I have not hardware to test this case yet).
> pci-ep {
> 	...
> 	msi-map = <0 &its, 0x<8_0000, 0xff>;
> 			      ^, ctrl ID.
> 	msi-mask = <0xff>;
> 	...
> }

[...]

> This solution already test by Tested-by: Niklas Cassel <cassel@kernel.org>
> who use another dwc controller, which they already implemented
> "implementation-specific" by only update dts to provide hardware
> information.(I guest he use ITS's MSI64)
> 
> Because it is new patches, I have not added Niklas's test-by tag. There
> are not big functional change since Nikas test. The major change is make
> msi part better align current MSI framework according to Thomas's
> suggestion.

Frank, I tested this series (a few revisions back) on the rockchip rk3588,
which just like imx95, uses a DWC based PCIe EP controller, and ARM GIC ITS,
but unlike imx95, it does not require any additional look up table registers
to be configured.


While the rk3588 PCIe host controller node has:
msi-map = <0x0000 &its1 0x0000 0x1000>;
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi?h=v6.13-rc3#n164

The rk3588 PCIe endpoint controller node, which is the only one relevant
in this case, only has:
msi-parent = <&its1 0x0000>;
no msi-map.
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v6.14-armsoc/dts64&id=b6f09f497b07008aa65c31341138cecafa78222c


Kind regards,
Niklas

