Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZOy08TzhgR+C7BOBCw+Xh1KukDn7aGXDaa3zhZtGeHM=; b=vffC0mVI9pFmnq
	uJZ2QF9jefi3/fzT+jSr78RXGLmTF2HFtKs6RQwaspX2J5mRcaflO/Wausypc8gbp4277xj29nh8M
	71+QbXKgHdwDiud7K8bSgnVzFPZCnzSrMXZwiTqMEjJGnKAAXHLGj1QwIHMTUPtnVxfgSRirUP0je
	xUmmfApJln4oI1Xye10LtAbR+OM5orWdLhVpRegDQeBsTlY9QXI2mGXe5d1CSral6URRH6ErOfW3Y
	B52oqD3MOYPIp9FuuMVmFAzJZKZuhyOte2hUV2IU4oo9V8/ToPyx1S2fTLbYvLGESUmuz582RhnSP
	0nBWZFfdot1GNnN3ojMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUJu-00000009bWJ-1ZOi;
	Wed, 12 Mar 2025 22:12:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUBe-00000009aN6-4A4J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 22:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90CE05C5AEC;
	Wed, 12 Mar 2025 22:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED4C4CEDD;
	Wed, 12 Mar 2025 22:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741817066;
	bh=/sBtyAsM65N4B5RyoYwCJ72E6UZV3xXX6NeGudU3MPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K9WEAZnzaYoIKkk7haWh8wYbDaunkAo2lU6vWYI2jXs5qJBRthzTejGsrr1tmvhTQ
	 qgOmjrLQ7v/cmRSnNSSc8gdAUQ6YdSfYjUOaLxemm97fsmuhTNRGTaD/UmRYfyEoN6
	 X9lmowYTggIbZklNSJ4i/IWmRe9P/qx0yWavsWNrs8wIFKrOUTV8fW1teatrfswJcA
	 wNAV4/4NjVGCliEIteWN2FfA3TKNGiZf8gQfe+maLVJ87y9Rl9eG3EP0NOEFFBoPOW
	 aivTXzUaKtUF+jcbum/4ZMtvpaX09/yhnxhqWrixneKblEZD3nNePJzVsQaME/NrVP
	 bqUwPoKcMRRPw==
Date: Wed, 12 Mar 2025 17:04:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v10 08/10] PCI: dwc: Print warning message when
 cpu_addr_fixup() exists
Message-ID: <20250312220424.GA711004@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-pci_fixup_addr-v10-8-409dafc950d1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_150427_070827_B0E2E591 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, Mar 10, 2025 at 04:16:46PM -0400, Frank Li wrote:
> If the parent 'ranges' property in DT correctly describes the address
> translation, the cpu_addr_fixup() callback is not needed. Print a warning
> message to inform users to correct their DT files.

> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1125,6 +1125,8 @@ int dw_pcie_init_parent_bus_offset(struct dw_pcie *pci, const char *reg_name,
>  
>  	fixup = pci->ops->cpu_addr_fixup;
>  	if (fixup) {
> +		dev_warn_once(pci->dev, "cpu_addr_fixup() usage detected. Please fix DT!\n");

I don't think we need this.  The mere presence of .cpu_addr_fixup()
doesn't tell us the DT is broken.  When we have .cpu_addr_fixup(), the
DT is only broken if DT tells us something different than
.cpu_addr_fixup() tells us.  And we already warn about that in the
"reg_addr != fixup_addr" case.

> +
>  		fixup_addr = fixup(pci, cpu_phy_addr);
>  		if (reg_addr == fixup_addr) {
>  			dev_info(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",

This message is really just a hint that DT is fine and
.cpu_addr_fixup() is redundant but harmless.  If you want a dev_warn()
here to encourage people to remove .cpu_addr_fixup(), I'm fine with
that.

Seems like "dev_warn()" would be enough, probably no need for
"dev_warn_once()" since we should only run this once per controller
anyway, so I don't think we'll get spammed with messages.

