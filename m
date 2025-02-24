Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ACDC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBQwAZX5IdjA7VsnmsKltz2HFRp1XSivvhag9IKOyT0=; b=nhJ7a7a9HsN24RBB90SEnA4QHu
	mC0FMcB4qiIYSmKCbGR/gYoCBn8Yid+Nf2fn4XQvzBJXd+96ps06UUiNfsy2eraz/1a9WOUd+grrK
	1jHl0HAZybswV9CCi23RuMhi6OjTdKJVUBFYW2kDAy6HdSeleFNXEWkJoT+A0VQW3RxjKk0N/gtyM
	PimbLhW9Z7CCEZjO3Rv73OFByYlGBxYlMnyM4Xu/Kf1DnbfA6moZr6djGSuo/61P5lWYDmkMX49XY
	/ystQhPxRs1GxVhaIc1Tc/JEUXdurkIiqsI2aVbIzhWAP0mB1VavAsJgR+EBljfBjSf6qcD/oEssW
	6/NHKaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbzJ-0000000EZP7-03Rg;
	Mon, 24 Feb 2025 17:11:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbwX-0000000EYqg-3yNq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 660C4611B6;
	Mon, 24 Feb 2025 17:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EA5C4CED6;
	Mon, 24 Feb 2025 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740416913;
	bh=I5InXa5iPxIUg/XL60LjkpRPCQ4Lls7ukDWRdePp2vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eubje9YlzJi0bBqI0AJSqLsQzrWoa05DCF4dgQBTG67+gfFKVSE6L+hh0/t4ZwX+w
	 rnVqn/tMyeSMSBJwS9FEuM7TaD2jxfme7QAgZvFBJO15SathlzjfJGvKPymY9/iSWY
	 XLcJlIPqc9Y2GYkObgbSNBWu5Wpff8xnVxjdKOzue5JmJDWG/Agwp9RbJfT7zC60v8
	 jeYEZze2FbDMF+Of/JG5USwIcNmOZCLhtJrkiG13XUrQdF/xePJhxFUq7CSfkIXRrE
	 X9x8ZpRa90FZlDRgpQqN2k4w+b/RGXWvg9PMxKohOc0yEPuAfykOvnwvAHyicbye/5
	 gwpDw0eztSzVA==
Date: Mon, 24 Feb 2025 18:08:26 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, fan.ni@samsung.com,
	nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <Z7yniizCTdBvUBI0@ryzen>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-1-shradha.t@samsung.com>
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

Hello Shradha,

On Fri, Feb 21, 2025 at 06:45:43PM +0530, Shradha Todi wrote:
> DesignWare controller provides a vendor specific extended capability
> called RASDES as an IP feature. This extended capability  provides
> hardware information like:
>  - Debug registers to know the state of the link or controller. 
>  - Error injection mechanisms to inject various PCIe errors including
>    sequence number, CRC
>  - Statistical counters to know how many times a particular event
>    occurred
> 
> However, in Linux we do not have any generic or custom support to be
> able to use this feature in an efficient manner. This is the reason we
> are proposing this framework. Debug and bring up time of high-speed IPs
> are highly dependent on costlier hardware analyzers and this solution
> will in some ways help to reduce the HW analyzer usage.
> 
> The debugfs entries can be used to get information about underlying
> hardware and can be shared with user space. Separate debugfs entries has
> been created to cater to all the DES hooks provided by the controller.
> The debugfs entries interacts with the RASDES registers in the required
> sequence and provides the meaningful data to the user. This eases the
> effort to understand and use the register information for debugging.
> 
> This series creates a generic debugfs framework for DesignWare PCIe
> controllers where other debug features apart from RASDES can also be
> added as and when required.
> 
> v7:
>     - Moved the patches to make finding VSEC IDs common from Mani's patchset [1]
>       into this series to remove dependancy as discussed
>     - Addressed style related change requests from v6

I tested this series, and one thing that I noticed:

# for f in /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/counter_enable; do echo 1 > $f; done

# grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/ctl_skp_os_parity_err/counter_enable:Counter Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/deskew_uncompleted_err/counter_enable:Counter Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/framing_err_in_l0/counter_enable:Counter Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/margin_crc_parity_err/counter_enable:Counter Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_1st/counter_enable:Counter Disabled
/sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_2nd/counter_enable:Counter Disabled

that there are some events that cannot be enabled when testing on my platform,
rk3588, perhaps this is because my version of the DWC IP does not have these
events.

(Because all the other events can be enabled successfully:
# grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Enabled | wc -l
29
)


So the question is, how do we want to handle that?

E.g. counter_enable_write() could theoretically read back the
dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG);
register after doing the
ww_pcie_writel_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG, val);

to actually check if it could enable the event.

If counter_enable_write() could not enable the specific event, should it
perhaps return a failure to user space?

Or, do we want to keep the current behavior of just letting counter_enable_write()
return success, even for events that are not supported by the specific DWC PCIe
implementation?


Kind regards,
Niklas



