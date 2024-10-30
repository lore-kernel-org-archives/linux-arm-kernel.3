Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6C1D6B6D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JxAVP7P6vz6uRVczUSEWh5pNmsDsyZSOoFJ7T+DvfCs=; b=3oBMx9Er1K4OUi
	Em23ZimuRmRy6/kVGHr/nArioniT8EofL4fVAdlB+ZvoF6qkUEgglZ4o3NBD1dhAcwC5rxp+i7sp8
	aKVq2IdoBTZlqwlOOuwHnnfQ2uHDFWW/Ff2bNphD7PCY6ZXAFz7sufIIlsEWqhhAb4o3cDoXK9pnb
	ELSt+mpZDHFUXmOwEHyXbR/upcZwfcbCwgsDHsJxXF6BSSkMrIjtuoAVU2RIhV0VG1fmSmBdvjIfF
	AzkVAO3OKQHh1+HMJ1IrHOoTEympr8O/620o16hjh0AsAUVdD8WYOn5LdKS4t5MDW3kkl8ubmUyph
	Q4PyVAoqUsA03RRu/S2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Fns-00000001lSB-399B;
	Wed, 30 Oct 2024 21:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FlD-00000001krJ-3Pl2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43ACE5C4B6E;
	Wed, 30 Oct 2024 20:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE684C4CECE;
	Wed, 30 Oct 2024 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730321866;
	bh=wNwwtHjerl5MOUKCcq++pQSCtUGk2n3cZjFysjvFczM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fJ780LP0j6ktkSTkhByNv1VDAzp2PlzhQOHSWIRx6tKeha8uWCMblwtbEavcI/rkz
	 BN1DUMTqQIiqCq3LIcsomz0BG03CYNacGft761QHGlrGRfKPYr4gIAnrgIDpO08bqr
	 PyA4GMWST3HAtWSjMbJtuZdikZOlrHrOk3c706TLIjjOeyBm5s+zygWoxyx4PbuApG
	 xveVP3jm73wiIK5iVH/1GaraBg2oZhN+eoiK0zuTUfZNOjGW1ULZ3zDzaNi2QZ7DG2
	 kjB+DoVuU1UpQNnWkFrJZhUamu1cU/AxJu3Bve9EN2b+a/5MS0Esanwae10eV+a2gW
	 JZi91cfvYa1bQ==
Date: Wed, 30 Oct 2024 15:57:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, Siddharth Vadapalli <s-vadapalli@ti.com>,
	Bao Cheng Su <baocheng.su@siemens.com>,
	Hua Qian Li <huaqian.li@siemens.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 4/7] PCI: keystone: Add support for PVU-based DMA
 isolation on AM654
Message-ID: <20241030205745.GA1219408@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6ea60ec075e981a9b587b42baec33649e3f3918.1725901439.git.jan.kiszka@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_135747_923890_B906DC31 
X-CRM114-Status: GOOD (  12.65  )
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

On Mon, Sep 09, 2024 at 07:03:57PM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The AM654 lacks an IOMMU, thus does not support isolating DMA requests
> from untrusted PCI devices to selected memory regions this way. Use
> static PVU-based protection instead. The PVU, when enabled, will only
> accept DMA requests that address previously configured regions.
> 
> Use the availability of a restricted-dma-pool memory region as trigger
> and register it as valid DMA target with the PVU. In addition, enable
> the mapping of requester IDs to VirtIDs in the PCI RC. Use only a single
> VirtID so far, catching all devices. This may be extended later on.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> +	/* Only process the first restricted dma pool, more are not allowed */

s/dma/DMA/ to match other usage.

