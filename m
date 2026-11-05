Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAAD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C5/bZ319;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=WDDOju96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=; b=C5/bZ319uiYEnh0sLbflPgZuMc
	wlFnlJ5kzD0c/DvkSTe6F8yxyyvC9Mmk6H8vrvak0PPx7YbcObIOEnU++0ujR34bAIcu4UuS8WKp/
	uVEgbF0gGDsJ0qMcuupo34tWbrSaXp0lb4whwJapOO+6lCkFm/nwRasEg/CIDA6cWbeZO2jfFE6MG
	dmCYeDgHNfbLvdr96xP/izsT5LZthggigfcRbtFD6GlRYy5cFqBNPUmWAh2Ip6Vb7hbNTf/euQuEp
	SuGiNpk5WYg0o9/prnJzzOaAor4rI2PohGQTdIlyIur91NacMbM1CN5yD3WwmMDjOTAvCgWNdS+cM
	tPamab0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP25X-0000000A7L1-0yeS;
	Thu, 05 Nov 2026 18:21:29 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP25F-0000000A7Ji-0PAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:21:21 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1406165137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793902868; x=1794507668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=WDDOju96nEJSgKGMk7X9i2tx851MW7q5K/SAR2LFL1/bRQznjkDXo+VJOx0BSLDM8u
         rRQwpyISfz5ZgacrRpt0Z3V14Cf7Y8bezXa05xnZZpS9hB4Sh0MixvEa4NsiawXF9B5l
         iFMi7nvmvEFlVxEZmixYrhc1zU7aZ2fcXwaYpB+04dcqE9YYR43pX7zkNNL/SnqEgX4v
         mjJQVo3Wc+tS/b3bo8UMaVDxNID7vukcaUGcXjAKOpErVDYuIEvMdn6Bd5rLndXmhAJW
         YkA2SGjWZ/07gGbbTJo5XA91lyzy0UdzaiXq1L+cjPUj7VTch0mIG8+uS7PouC+EHbYi
         3tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902868; x=1794507668;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=jYHAOybVP2Ifyi4cZZHwfafrsyh44TAf9WmT0qzIONacx14TaK4CEcr9V32N0rL/ix
         vbO7mBln6aqg4dNOyJAgb4VHpgdH8TJbxP04Ny3paPKCzNu63mzp6Ee6yYv/zvR2T4AG
         cLpHkpkGCIb4ZJbPntHiwtJwjEAx9NKWzOOLHsTxH9+/jQ/d/oarjVwlvC5R8bzOR0w3
         7qFklvLkvgmm8J0rZ1wQ0/pKonRmkszX+tdlNdMsaNWkju9c4wQ6ZjkIA1Tmz6QSfzGY
         H0HuF1OmAb7g0DRq9YOFzP8XB66+W04lILuyAoTofAPULUgl5svErYtfytOoGKxxao8J
         DbZA==
X-Forwarded-Encrypted: i=1; AKwUvBxgtw3EX8c+5fzRPDx5WEKG8st+qqfQX6P7xktR+H6MTH1Jr5fpxgWQRPebj7bFqFZ5F1yMHKIpgve/O0S8cBcx@lists.infradead.org
X-Gm-Message-State: APuU4Z/bPn88dwX4YywOoPQktZMDuKoirSaJpy7kwch2c0EPghjBqgrz
	tirvECIV54ZKQGMDGE27su9SXwL15z4j80L8nNyr4a0eoPbzamI6iAumgG9bQbZ4R8g=
X-Gm-Gg: AYBFou2YbT9zxUS2aDIyaCrAATn5b+kKz7as7q0ax9vEnTa7pk1MKcrHZcn1V/HiikH
	nPTW19UAGeNtbBOHL2CxYLNnuS0I9BEIygglrCAOzRmgKR95Mm9vPf1biS5bOYLGkiOGjAX8hSf
	wul1yoNV5Nrex5WCZEBzlO9ieguxn9MXPi6tI25K0mkuhoKx16rVrnP5D/NKknPm2mtDw+rf4ER
	Fo1Xks63rsRSC5Y8JBY9Qcv0ELW3byViqbmZDQZmz9KRb/fRTcBf96eEwaxaBFaF7w1CH7ueU1p
	c8o70lDPRwgi0R67tz442BTYEcbX+d3lvritfwcX+ycIp0wtZo++1o5P0IcY494Q32lTEWeZFdF
	2fn+choMMpXZ6BzkM6pEnvbCtlcRd6tN3ktktvYf4r2bxVmoo7F8laguBuvVFHcm5k3nNPOvwp8
	YLNXA7yKjHwrgcrOFplYIgO/anWaCNJUKra4eZHVjb2RvYWeCoYutUrnhMyGjOynD44KfIGHWv1
	giFubd/CzjT7ogB4Ccqbh+BPkAosLIEOdfS1hsbZd6+NHPZJTtYMkyAlruCtgrQ6DHdy8a+DXl+
	vqLpAbhwOohimBBAB4rMkQbeL7b5uvPq5Y4SBpFvLe+m6VbLqa2sOWLbspK2I8RRUJ1xxXssI1h
	vecGJL1ZWDg==
X-Received: by 2002:a05:6102:5706:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d2a1628b19mr348440137.23.1793902867469;
        Thu, 05 Nov 2026 10:21:07 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998da178b59sm5242293241.12.2026.11.05.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:21:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP25C-00000003LsF-0vAz;
	Thu, 05 Nov 2026 14:21:06 -0400
Date: Thu, 5 Nov 2026 14:21:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
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
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261105182106.GD663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzAivzpzSUHjEQj@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_102109_764245_21D17B99 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > >> attachment to an S1 paging hwpt, right?
> > >
> > > Yes.
> > >
> > > The VMM must always maintain a S1 paging attachment that is the
> > > identity map of the VM on all devices, same action as when there is no
> > > viommu.
> > >
> > 
> > I am currently creating an S2 paging attachment. This results in a
> > configuration with S1 disabled and S2 enabled, which is used by all
> > untrusted devices.
> 
> For validation, that would work. Yet "no viommu" should would be S1
> paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.

It doesn't matter, consistently using a single S2 for everything is
probably better..

The VMM should try to minimize the number of hwpts involved, ideally
just one per NUMA

Jason

