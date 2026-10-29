Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A401E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EUGWKr85;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2/AnfBb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xm/82lb0vdE7UE3lfCTgpLvIz8gxwRlNqpIHYX74QDw=; b=EUGWKr85bpvrEt3UFm1jJJr9u0
	dCFXs3FSq69KRebsraIeAddvJnAU9YbxC5sZ2BQgPnJyIniujLyNBOCZD7gobrWW0GbVuxvXooXMM
	HgTXtlTcEmqKYdU5eJEYNVpCztqGWpibLG+z4eOSaRG7rGJYK/1rjRSCcG8Rm9JpJvQ35UlTPq8xL
	UEVrxLx7vpNpRZFhU+9K6WgM+auf+uq6nQKLbUd3CIak33/zDPycH0RU/n6ZqNQ9/nXVNAervS4j0
	ihykhMn1QgQ8P/RDP8pNnle6Ct1To7K1AA5bHLq81lJakm5BmXVQEWQKSiDgKwQrBUit89QVR4Mcr
	I4Uch40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMK3r-00000008VpO-4B7U;
	Thu, 29 Oct 2026 06:56:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMK3q-00000008VpD-3Jxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 06:56:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A629B601E4;
	Thu, 29 Oct 2026 06:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6283E1F01828;
	Thu, 29 Oct 2026 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793256989;
	bh=xm/82lb0vdE7UE3lfCTgpLvIz8gxwRlNqpIHYX74QDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G2/AnfBbNO0zt72CeeVhNXL+8QKSwpiUw2d2rwFl8G/YCRD/OBkWfpRV5O5cQWu7s
	 3MvWhAeryn2J3r0LyEzJ2ys0PLv4CImqow6yugeYzfPhpPwhu9ARflIlrlZwo8xNqP
	 eW18BVZ3W4tXZpE8e0MBKdd5cU6ADvGfDmYp3nwG8NV4XMaZgGKRuz5PA6DOe5e873
	 5Nyv75DXTI8lAWMWHynNwRtnHZl+wQht+ZAwyWWlgoPHdhCMBZ7H4tJRA2/m2a7r/z
	 OjBvGLMs1WERnExaZMc/hhgstmCojzyA/PUO7Kw4pycWBzbM3inTRQ8z8PL7aDRNOs
	 n2R3XweWme1Aw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 09/16] tsm: Remove the device from lookup before PCI
 teardown
In-Reply-To: <179321444108.2412245.9613928294789740313.b4-review@b4>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-10-aneesh.kumar@kernel.org>
 <179321444108.2412245.9613928294789740313.b4-review@b4>
Date: Thu, 29 Oct 2026 12:26:17 +0530
Message-ID: <yq5abj8datbi.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 22 lines skipped ... ]
>> -static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
>> -						 struct pci_tsm_ops *pci_ops)
>> +static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops)
>>  {
>>  	int rc;
>>  
>>  	if (!pci_ops)
>> -		return tsm_dev;
>> +		return 0;
>
> Aside unrelated to this series: Do we need this NULL pci_ops stuff? I
> don't know what it was imagined to do, but now that we have split
> things up attestation subsystem I wonder if it would ever be useful?
>
> It is quite a maze of unused layers in here..
>


Agreed. I'll remove it; we can always add it back if a use case arises.

>
>>  
>>  	tsm_dev->pci_ops = pci_ops;
>>  	rc = pci_tsm_register(tsm_dev);
>>  	if (rc) {
>> +		tsm_dev->pci_ops = NULL;
>  [Severity: Medium]
>  Does this unprotected write to tsm_dev->pci_ops introduce a race condition?
>
> And of course sashiko finds races in all this unused complexity...
>
>> [ ... 14 lines skipped ... ]
>> @@ -96,15 +95,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
>>  	if (rc)
>>  		return ERR_PTR(rc);
>>  
>> -	return tsm_register_pci_or_reset(no_free_ptr(tsm_dev), pci_ops);
>> +	rc = tsm_register_pci(tsm_dev, pci_ops);
>> +	if (rc) {
>> +		device_del(dev);
>  [Severity: Medium]
>  Can this error path lead to a use-after-free if PCI registration fails?
>
>  Since device_add() is called prior to tsm_register_pci() in tsm_register(), 
>  the device is already exposed via class_find_device(). If a concurrent 
>  connect_store() finds the device and proceeds to pci_tsm_connect() before 
>  this error path cleans it up, it will attach the PCI context to tsm_dev.
>
> Fun. Usually device_add should be the last thing in any driver flow,
> not the first.  There should not be any device_del on error paths.
>
> Because of races like this...
>

I now have:

struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
{
	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
	struct device *dev;
	int rc;

	if (IS_ERR(tsm_dev))
		return tsm_dev;

	dev = &tsm_dev->dev;
	rc = dev_set_name(dev, "tsm%d", tsm_dev->id);
	if (rc)
		return ERR_PTR(rc);

	/* Complete PCI registration before exposing the TSM to class lookup. */
	rc = tsm_register_pci(tsm_dev, pci_ops);
	if (rc)
		return ERR_PTR(rc);

	rc = device_add(dev);
	if (rc) {
		if (pci_ops)
			pci_tsm_unregister(tsm_dev);
		return ERR_PTR(rc);
	}

	/* Notify TSM userspace that PCI/TSM operations are now possible. */
	if (pci_ops)
		kobject_uevent(&dev->kobj, KOBJ_CHANGE);

	return no_free_ptr(tsm_dev);
}

-aneesh


