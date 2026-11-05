Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC62606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjGI8Vky;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YvePkcRO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=; b=EjGI8VkyNVG4P68mQ/93nYwujh
	N4NQCB77vUqZMRbEnNluHpHgxid3W6MuvOMUi9x0Rzucs5VUnwIokLCNrOfmn1zlIpUCdWn5P0STl
	kpwz/TLayDrWtaeCMQGZmWFw4Ehrw0jB92jGkCk2HaqenA1/VMLKkFxX+rEE8oTJ0UvSVlQzkQO2z
	wIy1v6Nj4rQ18sVqVq3hYeh/OXQLxUknOqlzB/ZngXORiKV020sHIYJ+Y2vFXLe7nXlF7q4uO6sLz
	a9rWl9/H3MzY0vUzoAmSw66JzkgTJDRjx6FTiUQcDuY6+FveZcJGPwjVwgg0N2AHEqlPkdgMGTkIS
	lJ/Pthxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlfg-00000007NZ9-2iB9;
	Thu, 05 Nov 2026 00:49:40 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlfd-00000007NYm-3t1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 00:49:39 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so493380e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793839776; x=1794444576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=YvePkcROuc+gRONHXjOR97f1gmdoJdp1YxJguB5MDZjK7Rao3ecueGa/MVOvRGTdQG
         59CWeieC/JLakSGbkirXEg+lzxrz1g1daveWNFbt+CZB/J3qc2iTvp6g/W/O2Olm8OiX
         +onxIUu+7lOZn3gnnWIvJQH0hz63cTziwyC21LpCaCLPMAdJzYl0/TwHNYQys9iREW7r
         adqZSS2q0+ZCId906tJ5jXD+5yIpD6uO9E/cJzyhVfyRfs53HAMnd3RmFVrUMlZjk6ki
         NKw9R/WKdF69fOcF9yJPuAPKLJEjsBs7+2ykk3CaPML7Fr1qAFh76JHuCS2Rc8i6qgF0
         paaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839776; x=1794444576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRIt6wL5JukeI7CutNHrB30kNWGfRXMCU9CjLoUJZrc=;
        b=mLrLgPBICpHb+wP903ewSC8gyhakvCzVdJmY9UwLSPKntS3RAY1z/6BqJj7WJOmxgU
         m05OLIIxxKm6YiDHN9a41nqHsy98dCjJVyvuf18dSa/6sUficjoAEA8J9/fNtS5kRsrU
         BzcrxYfNqTu4K5LdvlqpY9FIcDvODFGIDV2ajbMzDekqGbrYqFnvjVa2XeCst4NcKKD8
         MrJcnmDsvcJvU6oLGOzjXHKnKW+mBzdnEXcAo6DSIMKe5v+hHwoyIgtGUw5i3ML67/HB
         +GvTEWPcA20Pxn12Cdp1uQ5RCvZra5zrnoVImQOmfGkUM51XarcIkuPOnLY9F8A8zJdT
         A6Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzvkxKGNBL+FZnxkhM2t+7+V0bRpUEYcVkGQOMzC1BjbHpu3vBcGYPZHywrZgC48uApFM0buVkAGiDHnONtNu8h@lists.infradead.org
X-Gm-Message-State: APuU4Z9LqfmGOc1NTqwSfkKS/YhIUI0GOF/r6akyhKdXCEYoBPnHUN3o
	sIejsGQkw0R/3qTnMlKlXlskJM1w4ySaWTXnVIOSrTEI/mYIA7nIIpq40bAl8ArMGf4=
X-Gm-Gg: AYBFou1vZZllkvP5Z5rnZZrVbHC7h7i7TMHcql9o9bkcWzpyqDBIiR8oyrwBBA4wOr/
	j/LnN0xMPRHHChYuZkNgFwTvtKmIvClDLaHKStywSlOrrC/HY2OechhxBq9uTq0c6gQRVZ4kuAf
	j5LpxpwoDolhPpjJ6ZwsiM/KEj3Ar6Mr3InP+anQpyUr67gF9vL2Lg59u7jgUv7T+prUqFb5FBx
	pB//sWd4ssy4+kQPA5cAl67mfZUx8iaJt/nSWhBWycaXVtjDZufw7zwdP/xZzKQq+aml55KRGYJ
	UBMuPGASoJp3nCHXw+cGr4s2oc8Sde4YIDju4wPAgxM5NfY+k4TOgWBpGfaVddR5R5Ckpx+k2hf
	nqaDQ/Hjm+BgcljOHHrZnnoLhFV8dSHX1SylsTw+E4jHMu42m3Nnsszq1bGApbpB6KGjF5lmH6a
	Sr1cPAuTY7SwxRToJZQl+5+ZYizZdINdz8Jqg4cSUY9XTZ5NLETY05aVQTwEf58nsv07iGRcqZx
	cN5lChAP6MD8f7kW06D+hJKlF2TXoZWFjycyhc4B9wO9DkWhY9SiEv9qoOObyulonr5J46DBJue
	mH3O/husL2JQJjklTfoSpOHeR2/5yrA01NcBQ2psQ/AFxAqGwlo+9BqtlTTEUQVktQZjfPEipEq
	dBe7H5YwNVtA=
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7d0725e16d4mr6016853137.21.1793839776242;
        Wed, 04 Nov 2026 16:49:36 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9a9ca31sm3266318241.10.2026.11.04.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOlfb-00000000cqL-0257;
	Wed, 04 Nov 2026 20:49:35 -0400
Date: Wed, 4 Nov 2026 20:49:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261105004934.GE3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-13-aneesh.kumar@kernel.org>
 <20261104152351.00002565@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104152351.00002565@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_164937_999225_0DD06B55 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:

> I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> leverage this? Could PCI/TSM support this role without device-security?

It is certainly not what TSM was originally imagined for, but with our
new arrangement, yah maybe so?

TSM basically just becomes this weird overlay driver on the PCI device
that does stuff. Some of the stuff it might do:
 - Register an attestation subsystem device to do SPDM
 - Register to allow iommufd to create a viommu
 - Some status sysfs ?
 - ??

It all seems separable and composable to me, so if you don't want to
launch an attestation subsystem device because there is no SPDM then I
think that might be OK?

Another option would be to somehow obtain the viommu from the kvm file
descriptor and rely on the fd to handle the module pinning/etc. I
don't know how to do that nicely with the way the modules work
though..

Jason

