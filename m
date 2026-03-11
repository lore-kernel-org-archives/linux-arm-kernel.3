Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3CD112583A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fqi7yB+UTgYOJUUaPcHDCmNygswwW4ZYGrGDcvSqdMY=; b=5AfArx6e2MBUV2p/dEyJ3tO+PG
	gVSxfsOYTvp+GCE27EGMA1YxT8/ZfwMsCYBRNln5GkWWHx0XwRu+0XUwxqDI8ukvEPna7F5aKRzIt
	NCRFmyNL/3YAqxBRavvYSsU2wytXBWo+1bVFTcJlCaQNqAKQ8YJR2iMG7hMP5ssN5fDPGnpZlUKeA
	5LiefIuR8CR8LYznOOHFkpMooMCDbsXpXVfrsJcBE0J2IruaJvE5cTmUE7TuYE9CBjv94v81HOOK0
	ePir8/jQizQgUdAbgjW4t+OYEb89IDIFFCVTGUaPIFB+EeXYL4hYyAHQSTT1leo+q/dHfZG+3XctS
	KNVIljvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KjN-0000000Bivw-3mua;
	Wed, 11 Mar 2026 14:40:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KjL-0000000Biv1-0FLV;
	Wed, 11 Mar 2026 14:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3933C40B2D;
	Wed, 11 Mar 2026 14:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D62C4CEF7;
	Wed, 11 Mar 2026 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240010;
	bh=0zJ0HQFf1lzSS5LA2IFPSO9AkXjfgAxBGWOu+Mzp1PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/ZF8l4o6TNAy+i+OxrOe0OLGywhNzKtVbVYp74L2z2TydeYuY3+X/g9L5dEUiYOT
	 yZUoISYDYPAj2StS7DHyURGWki4VbXGthWmYFwecKer1qiK+Ol0DMmRDBsZxDR/G/n
	 Qu14UDrbgrCgI523wcTEndr+Q5bpnKpKxh83hpon0c0fVoqpCfdvwQoWDxe7FDyVwY
	 zTjltTOCK6vw6u6YWicQm9DQ5nd6MOURmGxWLJoswyjTm2KD2SwG896Z8CXS8OWjMj
	 NtsZcxyNo1miOWcKlLG3k8k6jY06SDcow2r5lU+ZxY/1ym2GjQOsIIoxT/DfsFU3b1
	 DPpiGOOUXlNrw==
Date: Wed, 11 Mar 2026 20:09:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Brian Norris <briannorris@chromium.org>, Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <dp2rem4gj7zhfgykvekmcrhq4ticm6m6ido6tbgflwzfcuuwkl@4wuxgle27eyx>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <abFMa6DCGGLUHddA@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abFMa6DCGGLUHddA@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_074011_119403_C35AC7FD 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Mar 11, 2026 at 12:05:15PM +0100, Niklas Cassel wrote:
> On Tue, Mar 10, 2026 at 07:31:58PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > Changes in v7:
> > - Dropped Rockchip Root port reset patch due to reported issues. But the series
> >   works on other platforms as tested by others.
> 
> Are you referring to
> 
> ## On EP side:
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> Then running pcitest only having 7 / 16 tests passed ?
> 
> If so, isn't that a problem also for qcom?
> 

No, tests are passing on my setup after link up.

> 
> There is no chance that the patch:
> "misc: pci_endpoint_test: Add AER error handlers"
> improves things in this regard?
> 
> Or will it simply avoid the "AER: device recovery failed" print?
> 

Yes, as mentioned in the commit message, it just avoids the AER recovery failure
message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

