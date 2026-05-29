Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D6DCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o+Ph0tTb4eF1XhLrujxalR2sbm4OzjeOlUrVCpCliU=; b=skQ3/UACjYh+orX+J96eNjQQBP
	ksU8UEXFeJbZHVwR1cRm2lTD/yJ+pNXKDteUZ2acceJjO6Ipu9ccr6dKyEMCyCSSk+x5WlZm4Hsdu
	OxkhN+jgx+wZTWdupyu6iiDCFOyA5S8Nx4zdlolGjq0mJHqMcJ2gRVnYl8/XSMKnUEgjJsdQanmiB
	itoSVKGP0PvhO/7Ua0EHr8HEWgBdDMnYCm9yYFFF/Q3VXj6hGec95lC4f5uQRTwIvsp4RzJnUijns
	eMPP6RCOjygq87RB1AxSCpp4JGJKAdxi5VAQeC0lyFpUAPL8C35/u91S8U2vPJTkYvhPDuQL0pDW7
	mh809iKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqjS-00000006ocA-38QB;
	Fri, 29 May 2026 06:30:10 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqjP-00000006obP-3kc2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036208; x=1811572208;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XVFL5+u3D8+RPR15Py+42blBLqa7fTFoC0PlHXHmIt4=;
  b=PMhYoAq9XXjIjWwdpR9i+WAYKLEtDO/1UdCzEh6fh9CEW6SzDdcu6u3l
   emc0j/RCIc5TYXJ6DwKtpcqo1DLUujTfZg99yCIo7GRy+I7T0wnrpD89W
   YCoqDjgYCMMdVt51jblVYMkzOyM151MyPCduW/FzuoB+4vnRV4WN7UOCS
   PIrcdLsJtmUGRnIWJjX2Iy6/FXWwJDSk27kPhkAbpsN8CY8j1p6HTsa06
   BaX3EsO/418IVENyicnJLFIdsdx68HjcN2gEsf6oWOIJJ9UdQH7Q9zcHh
   1sx9KDzluKbvbIucZDH80pnwZCrvbjVCufq07NIa8+/ByuYOoRVQpdxHw
   w==;
X-CSE-ConnectionGUID: ctisdI1ES2OsmWKEjm6Pqg==
X-CSE-MsgGUID: E/I3+U6KTPaeehhXMsF8gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98301255"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="98301255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:30:07 -0700
X-CSE-ConnectionGUID: +jpgAPLmQcWBIl/7yRujyw==
X-CSE-MsgGUID: gAS04WXOTxOmUFitPNnflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="241947410"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:30:03 -0700
Message-ID: <2693467a-eb86-4cb9-9161-db6042b0335d@linux.intel.com>
Date: Fri, 29 May 2026 14:29:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] PCI/ATS: Decouple pci_ats_supported() from
 pci_prepare_ats()
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 David Matlack <dmatlack@google.com>, Samiullah Khawaja
 <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Mostafa Saleh <smostafa@google.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-4-praan@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260528202353.3422206-4-praan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_233007_984966_FEF314B8 
X-CRM114-Status: GOOD (  23.30  )
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

On 5/29/26 04:23, Pranjal Shrivastava wrote:
> Currently, pci_prepare_ats() internally calls pci_ats_supported() and
> returns -EINVAL if the device does not support ATS. While this provides
> a safety check, it conflates support detection with configuration.
> 
> Update pci_prepare_ats() to remove the internal support check. This
> decouples support verification from the configuration phase, ensuring
> that drivers can distinguish between a device that does not support ATS
> and one that has a true configuration error (e.g. STU mismatch).
> 
> Update the function documentation to mandate that callers must verify
> ATS support (via pci_ats_supported()) before calling pci_prepare_ats().
> 
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>   drivers/pci/ats.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index 8057c24b0469..92c2a6bc2dcc 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -56,7 +56,9 @@ EXPORT_SYMBOL_GPL(pci_ats_supported);
>    * @ps: the IOMMU page shift
>    *
>    * This must be done by the IOMMU driver on the PF before any VFs are created to
> - * ensure that the VF can have ATS enabled.
> + * ensure that the VF can have ATS enabled. Callers must verify that ATS is
> + * supported by the device (e.g. via pci_ats_supported()) before calling this
> + * function.
>    *
>    * Returns 0 on success, or negative on failure.
>    */
> @@ -64,9 +66,6 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
>   {
>   	u16 ctrl;
>   
> -	if (!pci_ats_supported(dev))
> -		return -EINVAL;
> -
>   	if (WARN_ON(dev->ats_enabled))
>   		return -EBUSY;
>   

I am not sure that the removal above ensures that 'drivers can
distinguish between a device that does not support ATS and one that has
a true configuration error (e.g., STU mismatch)', especially considering
that this helper already has a return value that explicitly conveys the
failure reason.

Furthermore, if a caller misuses this API by calling it against a non-
ATS device, the following code executes:

         ctrl = PCI_ATS_CTRL_STU(dev->ats_stu - PCI_ATS_MIN_STU);
         pci_write_config_word(dev, dev->ats_cap + PCI_ATS_CTRL, ctrl);

This causes the driver to attempt a write to an invalid or non-existent
PCI configuration space address. Instead of removing the check from the
function entirely, how about adding a WARN_ON() around it?

	if (WARN_ON(!pci_ats_supported(dev)))
		return -EINVAL;

Thanks,
baolu

