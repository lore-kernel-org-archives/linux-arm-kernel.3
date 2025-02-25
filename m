Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2181BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBbMo4k3aIXDsqftETUHStZf6iJRhDhLXQAqrnRP+EM=; b=BQet8doc8Eho/CfHVa4/OuHqsj
	a1zVR5SHbZEzST+96RzL9zn9CAKyx8RbKYS2ZzMebYaC7jmhyMV3HhwXHNFLhjGtGAOjc8nn/ANcX
	5xOo6yHXSfnbJr/405jSbQvy0l27pOtIVlNsKi7wNi8RZGsmmEx4V8Xou4JdQ8m1JIKX7I0ER3G/r
	VrRZUnZ0NnaaLbu1H4FpcVIwzDLLNIQH+6ayb8ksluHDdtHBckf3VA/y9vyN1wkjxnirK/HsOi5qt
	nAJJ1b4F7ajxgHr2ZTDKA9CJz4Cuhl7X/pYpxeww+6Vz1Spmf+ohZSWbnsbo6tMtWzJ5jUbUwECTa
	LyS9E0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz73-00000000lJc-0yOk;
	Tue, 25 Feb 2025 17:52:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw20-0000000HXpF-3ice
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 549AB5C6793;
	Tue, 25 Feb 2025 14:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11A0C4CEE8;
	Tue, 25 Feb 2025 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740494132;
	bh=cbtKDD3eUOS+sdzuwx+f9hBpWAvAFS/SyQ4YGdqd6Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8f3yZvj6glDk0Tl6Ruw/u8+8ujoAUZt22G0OqJjvBqdqE+u1Qwltqu1+JBbvyPLt
	 KIT0fHwdI+kF0q7M4O6MdEhtC+1CEbSukUvteTZzdDiyQY9dtehS2rIDd1rAkJCDDd
	 eB9jaqfAxpq96FAi16Qmz9PGaDXDi2nOxYwjmMMN8YSbzS6UyCuaDQrUIcSu0jU/ow
	 VeO9Fx/p//NqKI2B8xptU36u5s7nvl+/H/f/h9auyqCmXByU25jGso2WBqbBFwRVDV
	 vkG5icBx3VYlfnO8oCmutzq7ergr7st/bPjtX06E3prnGiD1jjB+D8h4i9iAZTJ1N/
	 aujNSqYX4Xpow==
Date: Tue, 25 Feb 2025 15:35:25 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <Z73VLYudJVPkdbGN@ryzen>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
 <Z7yniizCTdBvUBI0@ryzen>
 <20250225082835.dl4yleybs3emyboq@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225082835.dl4yleybs3emyboq@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063533_011469_6C8811FA 
X-CRM114-Status: GOOD (  39.72  )
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

On Tue, Feb 25, 2025 at 01:58:35PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 24, 2025 at 06:08:26PM +0100, Niklas Cassel wrote:
> > Hello Shradha,
> > 
> > On Fri, Feb 21, 2025 at 06:45:43PM +0530, Shradha Todi wrote:
> > > DesignWare controller provides a vendor specific extended capability
> > > called RASDES as an IP feature. This extended capability  provides
> > > hardware information like:
> > >  - Debug registers to know the state of the link or controller. 
> > >  - Error injection mechanisms to inject various PCIe errors including
> > >    sequence number, CRC
> > >  - Statistical counters to know how many times a particular event
> > >    occurred
> > > 
> > > However, in Linux we do not have any generic or custom support to be
> > > able to use this feature in an efficient manner. This is the reason we
> > > are proposing this framework. Debug and bring up time of high-speed IPs
> > > are highly dependent on costlier hardware analyzers and this solution
> > > will in some ways help to reduce the HW analyzer usage.
> > > 
> > > The debugfs entries can be used to get information about underlying
> > > hardware and can be shared with user space. Separate debugfs entries has
> > > been created to cater to all the DES hooks provided by the controller.
> > > The debugfs entries interacts with the RASDES registers in the required
> > > sequence and provides the meaningful data to the user. This eases the
> > > effort to understand and use the register information for debugging.
> > > 
> > > This series creates a generic debugfs framework for DesignWare PCIe
> > > controllers where other debug features apart from RASDES can also be
> > > added as and when required.
> > > 
> > > v7:
> > >     - Moved the patches to make finding VSEC IDs common from Mani's patchset [1]
> > >       into this series to remove dependancy as discussed
> > >     - Addressed style related change requests from v6
> > 
> > I tested this series, and one thing that I noticed:
> > 
> > # for f in /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/counter_enable; do echo 1 > $f; done
> > 
> > # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/ctl_skp_os_parity_err/counter_enable:Counter Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/deskew_uncompleted_err/counter_enable:Counter Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/framing_err_in_l0/counter_enable:Counter Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/margin_crc_parity_err/counter_enable:Counter Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_1st/counter_enable:Counter Disabled
> > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_2nd/counter_enable:Counter Disabled
> > 
> > that there are some events that cannot be enabled when testing on my platform,
> > rk3588, perhaps this is because my version of the DWC IP does not have these
> > events.
> > 
> > (Because all the other events can be enabled successfully:
> > # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Enabled | wc -l
> > 29
> > )
> > 
> > 
> > So the question is, how do we want to handle that?
> >
> 
> This is a really good question.
>  
> > E.g. counter_enable_write() could theoretically read back the
> > dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG);
> > register after doing the
> > ww_pcie_writel_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG, val);
> > 
> > to actually check if it could enable the event.
> > 
> > If counter_enable_write() could not enable the specific event, should it
> > perhaps return a failure to user space?
> > 
> 
> Yes, it would be appropriate to return -EOPNOTSUPP in that case. But I'd like to
> merge this series asap. So this patch can come on top of this series.

I agree that returning an error is probably the nicest thing.

However, this series has been picked up already :)

Is there anyone who volunteers on implementing the proposed feature?

If you have time, it would be interesting to see if you see the same behavior
on QCOM SoCs. (Assuming that your DWC PCIe controller does not implement all
events that Samsung DWC PCIe controller does.)


Kind regards,
Niklas

