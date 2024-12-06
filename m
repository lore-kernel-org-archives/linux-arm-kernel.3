Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C00E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ChEhoOdAZzWVUEK8+SJEvbKjEBmPgkSIVAVmGVZFO/w=; b=H+JkqzDsXyS44F
	kDaFIng/RzxWHk5mIOD9kJDRWaO6mVvW8xSPkB6GqslsQAEnkEzoZdi2vKobPMrB+cgYgo7Ci0CpX
	nYaE+0YVTLx4VxUJAobtwNaudgg3OxWEXKvGjPBZbWPIAb0ZVcFmDWma+dV3KqF+WGUeZ6aJj8Jws
	6AhX2PJ5WBbAxFT1JS72mPJOiecMMmcvzUzhVipCOJY/URoUSViM2pCNu6cmEdEcQnblNGeshyQpK
	krH8ddVerPxyHTWvhtqgAKPOTOkclPCqgeyzYcMDy+ESGcyu2igm6n6OFJHgnmZZHGShXPjgRFF+c
	FXiBYj6xIhoezMJNJlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbca-00000002FvK-34Bm;
	Fri, 06 Dec 2024 16:56:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbbY-00000002Fea-00Sr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5ECB2A4430C;
	Fri,  6 Dec 2024 16:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59EDC4CED1;
	Fri,  6 Dec 2024 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733504098;
	bh=np6gijQaJ2x8dV5tPEnKGpmtFkb0N2ZUr3OIxXLKdYo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OHmXV3QX4IIj37XKRydmQO6CdiMsGQTMjhUjio6TN2j6HRFguE72Bcc6sUNFYPePF
	 xBW8jxki98Q/fX72d1w/6Z8/cbmFUH7IlGHPpXgNeVtUH6Z+xxIkhADMnoZnHDu6ny
	 09abxs+PBL+KFW2dwFVPb7N10ptQTr5Wb5pqGsIWajRKAaWZYh2sOJkv2ZD8PM0sUu
	 0qeX1nQfIqjRZv/vQSmKxPWO8PQasbHzVXLOyBeW0w7oeU45kk8Us3kxvTZMMd958/
	 ItKdqjHGo8moZJqmS0W0WzwXtl9yu5ESZ86aYUb7doZWKfgs3LXNuVeae7y9L+3fJX
	 ALExZT5dld14w==
Date: Fri, 6 Dec 2024 10:54:57 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: ilkka@os.amperecomputing.com, kaishen@linux.alibaba.com,
	yangyicong@huawei.com, will@kernel.org, Jonathan.Cameron@huawei.com,
	baolin.wang@linux.alibaba.com, robin.murphy@arm.com,
	chengyou@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	rdunlap@infradead.org, mark.rutland@arm.com,
	zhuo.song@linux.alibaba.com, renyu.zj@linux.alibaba.com
Subject: Re: [PATCH v12 4/5] drivers/perf: add DesignWare PCIe PMU driver
Message-ID: <20241206165457.GA3101599@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208025652.87192-5-xueshuai@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_085500_176534_FA5E4372 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Dec 08, 2023 at 10:56:51AM +0800, Shuai Xue wrote:
> This commit adds the PCIe Performance Monitoring Unit (PMU) driver support
> for T-Head Yitian SoC chip. Yitian is based on the Synopsys PCI Express
> Core controller IP which provides statistics feature. The PMU is a PCIe
> configuration space register block provided by each PCIe Root Port in a
> Vendor-Specific Extended Capability named RAS D.E.S (Debug, Error
> injection, and Statistics).

> +#define DWC_PCIE_VSEC_RAS_DES_ID		0x02

> +static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
> +	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
> +	{} /* terminator */
> +};

> +static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
> +{
> +	const struct dwc_pcie_vendor_id *vid;
> +	u16 vsec;
> +	u32 val;
> +
> +	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
> +		return false;
> +
> +	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
> +		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
> +						DWC_PCIE_VSEC_RAS_DES_ID);

This looks wrong to me, and it promotes a misunderstanding of how VSEC
Capabilities work.  The VSEC ID is defined by the vendor, so we have
to check both the Vendor ID and the VSEC ID before we know what this
VSEC Capability is.

In this patch, we only find a VSEC Capability that matches
(PCI_VENDOR_ID_ALIBABA, DWC_PCIE_VSEC_RAS_DES_ID), but as of
v6.13-rc1, it finds all of these:

  (PCI_VENDOR_ID_ALIBABA, DWC_PCIE_VSEC_RAS_DES_ID)
  (PCI_VENDOR_ID_AMPERE, DWC_PCIE_VSEC_RAS_DES_ID)
  (PCI_VENDOR_ID_QCOM, DWC_PCIE_VSEC_RAS_DES_ID)

There is no assurance that DWC_PCIE_VSEC_RAS_DES_ID means the same
thing to Alibaba, Ampere, and Qualcomm because each company defines
what 0x02 means to it.  PCIe r6.0, sec 7.9.5 for details.

I alluded to this earlier [1] and suggested that these devices should
have used a Designated Vendor-Specific (DVSEC) Capability instead of a 
Vendor-Specific (VSEC) Capability.

But since they didn't, I think the dwc_pcie_vendor_ids[] table is a
dangerous way to work around this because it suggests that all we have
to do is add new vendors to that table.

I think the table should be extended to contain the Vendor ID, *and*
the VSEC ID, *and* the VSEC Rev used by that vendor, i.e., it should
look like this:

  struct dwc_pcie_pmu_vsec {
    u16 vendor_id;
    u16 vsec_id;
    u8 vsec_rev;
  };

  struct dwc_pcie_pmu_vsec dwc_pcie_pmu_vsec_ids[] = {
    { .vendor_id = PCI_VENDOR_ID_ALIBABA,
      .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
    { .vendor_id = PCI_VENDOR_ID_AMPERE,
      .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
    { .vendor_id = PCI_VENDOR_ID_QCOM,
      .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
    {}
  };

This *looks* the same, but it's not, because it makes it obvious that
the VSEC ID and VSEC Rev are defined separately by each vendor.  It's
just a lucky coincidence that they happen to be the same for these
vendors.

> +		if (vsec)
> +			break;
> +	}
> +	if (!vsec)
> +		return false;
> +
> +	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
> +	if (PCI_VNDR_HEADER_REV(val) != 0x04)
> +		return false;
> +
> +	pci_dbg(pdev,
> +		"Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
> +	return true;
> +}

> +static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
> +{
> +	struct pci_dev *pdev = plat_dev->dev.platform_data;
> +	struct dwc_pcie_pmu *pcie_pmu;
> +	char *name;
> +	u32 bdf, val;
> +	u16 vsec;
> +	int ret;
> +
> +	vsec = pci_find_vsec_capability(pdev, pdev->vendor,
> +					DWC_PCIE_VSEC_RAS_DES_ID);
> +     pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);

Nit: "val" is never used, so why read it?

This looks even more wrong, because this matches ANY VSEC Capability
from ANY vendor that happens to be numbered DWC_PCIE_VSEC_RAS_DES_ID.

I know this is indirectly qualified by the check above in
dwc_pcie_match_des_cap(), but duplicating this here just spreads the
confusion about how to interpret VSEC IDs.

I suggest updating dwc_pcie_match_des_cap() to iterate through the
dwc_pcie_pmu_vsec_ids[] table and return the capability offset so you
can call it from here.

Bjorn

[1] https://lore.kernel.org/r/20231012162512.GA1069387@bhelgaas


