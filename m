Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9000C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2ZeF0loK2FrZNYrVqmGEch2JbjFM4iCxIkGBP4YBPg=; b=niFukoOJUnFdJcoJJlyWA6Sbqy
	8AhylJGBeIjnXrZkRiuif3zI9WhQXNxMu1gISpX7t3LszAbqV1KPXBnKWZMRt+WFpFho7rTNTytih
	G/WQ/Oawd67CRrtOOaWXo/vHYknGHwH5EwyRybNjirlsJRyqIDSLdHUK32sQ3jp1C8QBxa2OrkWXD
	/15jLxnkMNHBik6Zbqs2fgobXE+jWVWgrTUPQuEh3/jCtVRA9QloTxcxReOGUyXY0c7c8s76MW08B
	69m8Ijfr3OQuOTq5aPHSghMNSSKVhtAq57tcsAGB5v1ubvNO39ONIRrhkDjrXZ22hVUBY1zHw9N0h
	l3MgtgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFXb-0000000CZMm-2sZJ;
	Tue, 05 Aug 2025 11:09:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF84-0000000CWH5-2zKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:42:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87A9E4321E;
	Tue,  5 Aug 2025 10:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A99BC4CEF4;
	Tue,  5 Aug 2025 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754390567;
	bh=rK71U250BK27CMyHf1FowcrdOTFDq8gjL7pfGebYpEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZIA6rl4omdzTy8g7gTN1gA/6k2Y0gFk+ifudok3drvkaP49riohOADH+jtfNKnAT
	 u6WDQGSYmK8eXF4Ef7Q9A+uMSXLzGxHiNb9AyKRRYW25DH5Xf52N5TPUGodsjeL0pL
	 aKEbvxrB6l4efVsPYfr35c+iiu6DF/g29kzmFtmIJvhTkS8evr11bq9uQ75gCAssH4
	 stYvm0zcpqRKIq5LCaPS6RJvKm8iAXgxsV/OikzqcsQjT1GHtn1lswhB+v1/I+ikQG
	 aLvd1GQMejjsRpOUbn8Ydz2WL188ZCoqKheOo1C18IFzaS3XkCF+YmmaV4hMcM9WdM
	 Zx7BKG3AX83UA==
Date: Tue, 5 Aug 2025 16:12:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>, 
	Brian Norris <briannorris@chromium.org>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] pci: nwl: Unhandled AER correctable error
Message-ID: <g4w5tcasa4ka24rqhgmbrmrua5a23dytgcbsqkuoyzekgmv43f@2wjltdepyizc>
References: <20250804205702.GA3640524@bhelgaas>
 <23d9f128-af95-41b1-a5b9-3c69d2df8ab8@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23d9f128-af95-41b1-a5b9-3c69d2df8ab8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_034248_796915_81B9F0F2 
X-CRM114-Status: GOOD (  32.21  )
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

On Mon, Aug 04, 2025 at 06:10:48PM GMT, Sean Anderson wrote:
> On 8/4/25 16:57, Bjorn Helgaas wrote:
> > [+cc more folks who might be interested in AER with non-standard
> > interrupts]
> > 
> > On Fri, Aug 01, 2025 at 01:43:19PM -0400, Sean Anderson wrote:
> >> Hi,
> >> 
> >> AER correctable errors are pretty rare. I only saw one once before and
> >> came up with commit 78457cae24cb ("PCI: xilinx-nwl: Rate-limit misc
> >> interrupt messages") in response. I saw another today and,
> >> unfortunately, clearing the correctable AER bit in MSGF_MISC_STATUS is
> >> not sufficient to handle the IRQ. It gets immediately re-raised,
> >> preventing the system from making any other progress. I suspect that it
> >> needs to be cleared in PCI_ERR_ROOT_STATUS. But since the AER IRQ never
> >> gets delivered to aer_irq, those registers never get tickled.
> >> 
> >> The underlying problem is that pcieport thinks that the IRQ is going to
> >> be one of the MSIs or a legacy interrupt, but it's actually a native
> >> interrupt:
> >> 
> >>            CPU0       CPU1       CPU2       CPU3       
> >>  42:          0          0          0          0     GICv2 150 Level     nwl_pcie:misc
> >>  45:          0          0          0          0  nwl_pcie:legacy   0 Level     PCIe PME, aerdrv
> >>  46:         25          0          0          0  nwl_pcie:msi 524288 Edge      nvme0q0
> >>  47:          0          0          0          0  nwl_pcie:msi 524289 Edge      nvme0q1
> >>  48:          0          0          0          0  nwl_pcie:msi 524290 Edge      nvme0q2
> >>  49:         46          0          0          0  nwl_pcie:msi 524291 Edge      nvme0q3
> >>  50:          0          0          0          0  nwl_pcie:msi 524292 Edge      nvme0q4
> >> 
> >> In the above example, AER errors will trigger interrupt 42, not 45.
> >> Actually, there are a bunch of different interrupts in MSGF_MISC_STATUS,
> >> so maybe nwl_pcie_misc_handler should be an interrupt controller
> >> instead? But even then pcie_port_enable_irq_vec() won't figure out the
> >> correct IRQ. Any ideas on how to fix this?
> >> 
> >> Additionally, any tips on actually triggering AER/PME stuff in a
> >> consistent way? Are there any off-the-shelf cards for sending weird PCIe
> >> stuff over a link for testing? Right now all I have 
> > 
> > This is definitely a problem.  We have had some discussion about this
> > in the past, but haven't quite achieved critical mass to solve this in
> > a generic way.  Here are some links:
> > 
> >   https://lore.kernel.org/linux-pci/20250702223841.GA1905230@bhelgaas/t/#u
> >   https://lore.kernel.org/linux-pci/1464242406-20203-1-git-send-email-po.liu@nxp.com/
> 
> Thanks for the links. Toggling PERST does seem to reliably cause
> correctable errors (however "correctable" they may actually be in
> practice). With the patch I posted on the other branch of this chain I
> now get
> 
> [   43.041610] pcieport 0000:00:00.0: AER: Multiple Corrected error message received from 0000:00:00.0
> [   43.050693] pcieport 0000:00:00.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
> [   43.061477] pcieport 0000:00:00.0:   device [10ee:d011] error status/mask=00000001/0000e000
> [   43.069842] pcieport 0000:00:00.0:    [ 0] RxErr                 
> 
> Whether or not that's the right fix, at least I can test things :)

Could you please check if INTX is working for AER? You can just pass the cmdline
parameter, "pcie_pme=nomsi" and observe if the IRQ is getting triggered.

We have a desire to add platform IRQs for AER, but before doing that we need to
make sure that the platform doesn't support both MSI and INTx.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

