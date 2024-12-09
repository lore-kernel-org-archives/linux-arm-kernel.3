Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40C9E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pey3qaL2MVAU4bb9jpRhHYrGZpF/T8OVsgJPcaguTPQ=; b=PhjEr79rgt5+/6
	FaJoIdU1id26ZRK3l415ZLN2HnyMgKyCMMV0y+smvcy2cNxhuIRli1SOy6ebJ2O/udHyZhP4aFLsz
	sZwOJ6/Le61oQIsEIFrfB0+tjH2Tz5QN+jqX3ta1qM2myAUgv7lJe8NTh0Tz9FLX7FM3VQVcQtoOq
	+QdpY11oyLZeiXIbLunUKDcGv7JJiygnUgLricKydrCoVTjHkld2K8h6d7fKt6sSHcQYQZfU0eH/e
	7+eKo2ERXgG4mRiEOEBmIqY+PaTwo7Si4XBfEw7yNT/M+rkAlNWNypDKFMy4ABXyItl/oH+s8bLWS
	kGUUvIlVk2xw13neZ+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmYc-00000009TOx-2IHy;
	Mon, 09 Dec 2024 22:48:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmXZ-00000009TDR-0F4a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 22:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5EBDA419D8;
	Mon,  9 Dec 2024 22:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F29C4CED1;
	Mon,  9 Dec 2024 22:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733784463;
	bh=bfR3ZPj+k58Qcimmw1cGqJKij4yOncMke720Uzmfll4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KUM+Xnqsh+stm2JD9cvf12wymyTmnA8Rk7+2vT7glkmgNR2uyYLOkEWOEGx/9eC53
	 7lcm/UqJkA/3GwTO0OKaavodTQsk8IaFubNsLz3Vok44i91S+Dwj3LJ4TQg+vLPEJA
	 ykBayw4tg9Ay1YlKX4pChU7t3FVLLmqBctArRYPh6ss2Ed2OXj9HMW7oF1mE5CBZRb
	 r87aFC1k33G5i4lYGp7/RL5gEmrZDB1ZaQ9BOFf5G8kM1fQj+Vy8e6XIH10yia5PbY
	 rmCRwILvpobpMNqEDpSw4MYJzGclfuNIwC4WgjiXhjGzndB8SKSN8xLhNEOQkoxdaE
	 WzuikYFxmtr0w==
Date: Mon, 9 Dec 2024 16:47:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, ilkka@os.amperecomputing.com,
	kaishen@linux.alibaba.com, yangyicong@huawei.com,
	Jonathan.Cameron@huawei.com, baolin.wang@linux.alibaba.com,
	robin.murphy@arm.com, chengyou@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, rdunlap@infradead.org,
	mark.rutland@arm.com, zhuo.song@linux.alibaba.com,
	renyu.zj@linux.alibaba.com
Subject: Re: [PATCH v12 4/5] drivers/perf: add DesignWare PCIe PMU driver
Message-ID: <20241209224741.GA3206765@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209154015.GA12428@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_144745_162644_CDD14F1B 
X-CRM114-Status: GOOD (  22.48  )
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

On Mon, Dec 09, 2024 at 03:40:16PM +0000, Will Deacon wrote:
> On Fri, Dec 06, 2024 at 10:54:57AM -0600, Bjorn Helgaas wrote:
> > On Fri, Dec 08, 2023 at 10:56:51AM +0800, Shuai Xue wrote:
> > > This commit adds the PCIe Performance Monitoring Unit (PMU) driver support
> > > for T-Head Yitian SoC chip. Yitian is based on the Synopsys PCI Express
> > > Core controller IP which provides statistics feature. The PMU is a PCIe
> > > configuration space register block provided by each PCIe Root Port in a
> > > Vendor-Specific Extended Capability named RAS D.E.S (Debug, Error
> > > injection, and Statistics).
> > 
> > > +#define DWC_PCIE_VSEC_RAS_DES_ID		0x02
> > 
> > > +static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
> > > +	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
> > > +	{} /* terminator */
> > > +};
> > 
> > > +static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
> > > +{
> > > +	const struct dwc_pcie_vendor_id *vid;
> > > +	u16 vsec;
> > > +	u32 val;
> > > +
> > > +	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
> > > +		return false;
> > > +
> > > +	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
> > > +		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
> > > +						DWC_PCIE_VSEC_RAS_DES_ID);
> > 
> > This looks wrong to me, and it promotes a misunderstanding of how VSEC
> > Capabilities work.  The VSEC ID is defined by the vendor, so we have
> > to check both the Vendor ID and the VSEC ID before we know what this
> > VSEC Capability is.
> 
> Thanks for pointing this out! The code's been merged for a while now,
> so we'll need to fix what we have rather than revert it, I think.

Yep, for sure.

> Any chance you could send a patch with those, please? I'm also not able
> to test this stuff, but I'm sure Ilkka would help us out.

Posted at https://lore.kernel.org/linux-pci/20241209222938.3219364-1-helgaas@kernel.org

Bjorn

