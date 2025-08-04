Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFECC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=52tfmzhvOxMV5Ai6qt++0gqehSXumD0twzGQQuImvnM=; b=XL9L6sTS1UzGr7
	1E+RPWkoBxfP/nrrCJMoJ3uavy2h0R9R3zImkggRrgN7kk+SfGt7mynmcJIHUyzMnR33WLwDiNK1d
	fJUniGtn7152806KsMz30qBRlxSUxSohRgA7UdUNT5buwVXe+7LRPNg9ZAvq5/RZ55g1xwlQmM6eK
	6aKlNbb+g/SV+Wzivf87wZnAeJHBM87IynET3TyfFWwri1OFGmiTAyk3TAndU77MghaxsdkZ4jJd9
	fX/YWtyTqLjvBTx7YJQFp+9H9/O6+8liKJtXBo9IMcn7m7C+9dfzy4u51w88rsCLbIjMNTNGaTD+/
	i2HtGsGeZeFKb2ZGpdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj2HV-0000000BK0t-2IoH;
	Mon, 04 Aug 2025 20:59:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj2Ey-0000000BJuZ-45Bf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 20:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4221E5C545A;
	Mon,  4 Aug 2025 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BA6C4CEE7;
	Mon,  4 Aug 2025 20:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754341023;
	bh=uD/eeGs14/ke/E/bSE2APe5YyfCJ6APCOIGAkSrY6QI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pn3KehDz6hnfQNL9lCppU6ubjpm163ZJONZVfmrgEDCSs6JOQfAAlLT51JlHTqE6V
	 kXJo3zGFUhjSXrs7Klsv/9RETgVrSBOtJRfHAhEFO4Yxq2Us1wjLz1qgOtn9+UtAjn
	 M32YqOR2RfvLLkPfUMbij5O+XaR+r/qcZCn7dN71jQY3OQkq6iIWIJNE9IGPiPLqs+
	 i1xMUGUzF8Ri+nFRwWOq3vTY3ZptxV37GY2Mxv8RicrufjWxpO/ZuU6dvzdhlSWK0k
	 WC63rBwdcBuaX/8Gv+ZHvj0j7qaVWJUTShBX6IVZDANNqwkJUR9LH3Mcwa9p5iVua7
	 dSgR+OIiN/c1Q==
Date: Mon, 4 Aug 2025 15:57:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Brian Norris <briannorris@chromium.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] pci: nwl: Unhandled AER correctable error
Message-ID: <20250804205702.GA3640524@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f6d267-62af-4dad-8fa7-a2a497b22636@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_135705_089997_758DB21D 
X-CRM114-Status: GOOD (  19.34  )
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

[+cc more folks who might be interested in AER with non-standard
interrupts]

On Fri, Aug 01, 2025 at 01:43:19PM -0400, Sean Anderson wrote:
> Hi,
> 
> AER correctable errors are pretty rare. I only saw one once before and
> came up with commit 78457cae24cb ("PCI: xilinx-nwl: Rate-limit misc
> interrupt messages") in response. I saw another today and,
> unfortunately, clearing the correctable AER bit in MSGF_MISC_STATUS is
> not sufficient to handle the IRQ. It gets immediately re-raised,
> preventing the system from making any other progress. I suspect that it
> needs to be cleared in PCI_ERR_ROOT_STATUS. But since the AER IRQ never
> gets delivered to aer_irq, those registers never get tickled.
> 
> The underlying problem is that pcieport thinks that the IRQ is going to
> be one of the MSIs or a legacy interrupt, but it's actually a native
> interrupt:
> 
>            CPU0       CPU1       CPU2       CPU3       
>  42:          0          0          0          0     GICv2 150 Level     nwl_pcie:misc
>  45:          0          0          0          0  nwl_pcie:legacy   0 Level     PCIe PME, aerdrv
>  46:         25          0          0          0  nwl_pcie:msi 524288 Edge      nvme0q0
>  47:          0          0          0          0  nwl_pcie:msi 524289 Edge      nvme0q1
>  48:          0          0          0          0  nwl_pcie:msi 524290 Edge      nvme0q2
>  49:         46          0          0          0  nwl_pcie:msi 524291 Edge      nvme0q3
>  50:          0          0          0          0  nwl_pcie:msi 524292 Edge      nvme0q4
> 
> In the above example, AER errors will trigger interrupt 42, not 45.
> Actually, there are a bunch of different interrupts in MSGF_MISC_STATUS,
> so maybe nwl_pcie_misc_handler should be an interrupt controller
> instead? But even then pcie_port_enable_irq_vec() won't figure out the
> correct IRQ. Any ideas on how to fix this?
> 
> Additionally, any tips on actually triggering AER/PME stuff in a
> consistent way? Are there any off-the-shelf cards for sending weird PCIe
> stuff over a link for testing? Right now all I have 

This is definitely a problem.  We have had some discussion about this
in the past, but haven't quite achieved critical mass to solve this in
a generic way.  Here are some links:

  https://lore.kernel.org/linux-pci/20250702223841.GA1905230@bhelgaas/t/#u
  https://lore.kernel.org/linux-pci/1464242406-20203-1-git-send-email-po.liu@nxp.com/

