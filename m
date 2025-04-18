Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mwD13u2Ox/2Kj6Ld0IpcXFeQGngNBtN+7DZfyvKxAS8=; b=QHSeZqD9EZtUPK
	JN5o9u9xsuV/76qtQ3wsPRhxpm7DC/qoLDMQuInZq/Coc+PljTJ/mRp3u7DAAf006qi9mNQ9hAGCG
	ERnxdvCv4bQAyHg5s0+lYxqeih82tsksSh/CgXmORqa3XT/Ya8z6bosLjPAQmO5VIrEZHxp7LYQSP
	hCOcbJlCV1Hr3VFpU2IEDjeEYDkWS+K0NsaTo2AK6+V0SmKsnZWQdU5aJWFF8n1zg4LkEc4TFPgU8
	CYeY1iFRsKjmepUL+uUPUmliY3remKd6CQU1qwvpbgmNnMi72wXBkoEiwCbMwt6RD1Z2bc2Tkzgd0
	33JI4JaAMpj/Wt3m7zbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ohA-0000000Gy4n-15QW;
	Fri, 18 Apr 2025 16:36:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ofE-0000000GxiE-2Q5g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D6AFA4B511;
	Fri, 18 Apr 2025 16:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E0BC4CEE2;
	Fri, 18 Apr 2025 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744994043;
	bh=ed3FOAzpZAREOk5SHpU5+5vpIY0q3AAD2Ue6wKBsD4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ui/c38NbH9ruZHxr8vvOvTLlkpoR0fAjRPRj/AoBYuFSyPo6Bdg4oK2pwjR9+lDbV
	 97EHazWSbHuoTN7bNvnbWYCV2MiXK4ccaJ11/MLxaAnYjCg3AqZCxjduTZzZoG+Z3m
	 wrH0kqYAkGSn0p4oIT+ICPA6wHS+iQ4gJ1EdSgjpmLC+Sx6L8fLJ7B1EJmj8bfwSwZ
	 L5VJcVcEZQ88MjuWWjeMpLoZ+7uciEZPY/a8W97aDd8Sq8k7/5afqK0f06OVrtvVyq
	 bOJvNJw6ZerlcwDQufJKpCEiA6PpXmEBOa9JjbI9zH+NxjhelDieZrRhDoBgF/9eks
	 PJdzC2yUBwupg==
Date: Fri, 18 Apr 2025 11:34:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: huaqian.li@siemens.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
	baocheng.su@siemens.com, bhelgaas@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, diogo.ivo@siemens.com,
	jan.kiszka@siemens.com, kristo@kernel.org, krzk+dt@kernel.org,
	kw@linux.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s-vadapalli@ti.com,
	ssantosh@kernel.org, vigneshr@ti.com, iommu@lists.linux.dev
Subject: Re: [PATCH v7 0/8] soc: ti: Add and use PVU on K3-AM65 for DMA
 isolation
Message-ID: <20250418163401.GA159541@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418134324.ewsfnze2btnx2r2w@country>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093404_679402_20D1CC3F 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, Apr 18, 2025 at 08:43:24AM -0500, Nishanth Menon wrote:
> On 15:30-20250418, huaqian.li@siemens.com wrote:
> > 
> > Jan Kiszka (7):
> >   dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
> >   dt-bindings: PCI: ti,am65: Extend for use with PVU
> >   soc: ti: Add IOMMU-like PVU driver
> >   PCI: keystone: Add support for PVU-based DMA isolation on AM654
> >   arm64: dts: ti: k3-am65-main: Add PVU nodes
> >   arm64: dts: ti: k3-am65-main: Add VMAP registers to PCI root complexes
> >   arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices
> >     behind PCI RC
> > 
> > Li Hua Qian (1):
> >   swiotlb: Make IO_TLB_SEGSIZE configurable
> 
> I see at least 3 or 4 maintainers needing to co-ordinate, gets
> complicated as I am not sure which maintainer needs to pick up what
> patches in what dependency order. This looks like a mixed bag. Can
> we split this patch into independent series for each maintainer with
> clear indication of dependencies that is spread around a couple of
> kernel windows (maybe dts comes in last?)

The keystone patch ("[4/8] PCI: keystone: Add support for PVU-based
DMA isolation on AM654") depends on interfaces added by "[3/8] soc:
ti: Add IOMMU-like PVU driver", so I can't really take 4/8 by itself.

But I've acked 4/8, so it can be merged along with the rest of the
series.  I assumed the easiest would be via the drivers/soc/ti/
maintainer, i.e., you, Nisanth :)

Let me know if I can do anything.

Bjorn

