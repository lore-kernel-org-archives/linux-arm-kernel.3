Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C811C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=; b=LwKwnvXyKadE6kXfmIs5P46ILp
	YmTVbUBTy7E3TZEoeQ0AgHOxt7x4egeJ9LMVU15wBAgVIvGHHOX/fRoUY/C9E8qjEdLSg0FBoZ/Dc
	eIRii/WgGTqLb2mKtOUmOqs0N7FxXaQRHGEH41QiMAQypST8OMp60i/iWEWywK7kc/GN9FCD42wjN
	5ap0J9+m3RfJtftdO8PID2X39nuKEjIOZU6OBiEP//CdJ2mxGOFDKdFrn7k6g2+k6hS/MMQLtS9x3
	kAPi+ErAhvy+6l4oeCF2OtQ4UxM5Y/utQuHo6oYH8XZQCMPPLCz6mbZrxBapwSFUYYAaNXyft3xTg
	Yo/n9UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ypu-00000006qrm-2I6I;
	Mon, 07 Sep 2026 12:52:34 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Yps-00000006qqp-2gAY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:52:33 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-90cc39e06bdso42843176d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788785551; x=1789390351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=IqKXOZJa1E6vowrlGik71rRgOS6lHYeqnqb1vcCxYO8Rs+MKs1EgO43RAdQ56/2IlV
         ql/T0Q068eYL022RkutEWD6EBjJKeCFoZShm0gY9QjfbOR87Boe1SwH2xU+IGF9dZjdI
         bTAxTVYNOjVCNgzzj8/o0vDVikAplmY2L778y9PLWAMCqGUNonXg6ZEnZSc5iirp/jsJ
         xCCFkFtyqg2597MXmqGXSEC0lt4s/iBpb/8c/n6loOiI+xxT/ABoNyyHOq7IU30ZKwGZ
         98uARWT57YBswXbcwJgHK8ufZzkW9xBwRdamO82r7229LPo+J6C+Zg6pS+9n0nCaNHoN
         u9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785551; x=1789390351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=ETNJDKXdt4BxmEx503wkzzKDHL/O8DG4FkvfGCefBd27oZLE9ekpby7BwJRWrrUSnr
         TpJdlxOpFZdGoBcE2JFH1zzbBRzazZR3r02cGTM1zPX2m3c6eJB9gYTHrQ1z1t3Q74xz
         5QqWCrNNjYpu92ICcVT9BChhn/QCH4oQQ2lhYEWeRhcFE45bMitcFTLs/e4j8MC2WEnc
         SNfuwv3N8Q8Y/iv/JSrgMUR2OdYd00DMWcC8oTYdUDfcnRiS5jc6fRsu6QBHDPXOoEa5
         LFpaAgD1JdVKynwpXS3QbpoBAMF42BZFl7/U8RpXMsvm6v2DIDYZitoOO87YaNC8Nchj
         848w==
X-Forwarded-Encrypted: i=1; AKwUvByJAeOSHIQoIk0WHyzvkLFMiK/9OIg2jRIunuIslpVD19Nrco/NppkafWoVnLaX7MDeQkGx8BzTje/YTXXm13T0@lists.infradead.org
X-Gm-Message-State: AFuF++lyC4N21mnh+sdRRp/myLdsLn9kUl5lMPocI7F7wJaC/X7tO37A
	lzXucZ+bzrHgg+5NzM8aBYRMbkSTYSHn7l/UdvMlNB+360WKXCy7WhT7ioLYwjzx7gg=
X-Gm-Gg: AYBFou13s7rBXoL/bh7Tbydckx2eCbQ1gDSfe7B5dcjLPXLsAUW2YnZA8bI+WH/0Vvq
	vdes/qGYqz81S51K0B5S4ew2SraG4HGXro8TweX8NByQG0DcI96jTj14Mmfqh3GjAW2I5d/mrEH
	xHjU6fVGeKEHQ7p+w4zLYwUWDOsFMiVgEYTBE0/j2+XRRTmgBpI6I3fzuKGV6igEjxPuYUR4JS6
	sGbKAZRdJ5PLkTxenOp00TyCMi60249yxYvyNkEK+tAQYhC1uteQ/QeolP8tqGdueEXcW7bBEUE
	BgnkdBnNIY7GTVVOt1bvfiDBO6ziGjEI68Jdhkdc97WwSU+t8nxNGs/bRfQN79FRq+hdhPDIBxV
	3krBqZO6F3qijkYKjm1/W0AnlPhAZerNboC6+s8SjdAHQjZcJaOzXdpsJb8q6MqRFbpukR5EzyS
	eed30cBBj/pGBbKkI9et49je6cFavItz+aZbXZcmzTNlgU6uUJuzgSIt4Kb/VNnnjiskdGbRehG
	4SvzvrKmsmdDFamlbk/kHYh3DcuIfANUP/8XmOgkeyANw==
X-Received: by 2002:a05:6214:3d8b:b0:910:479a:f7a7 with SMTP id 6a1803df08f44-910479af8camr173644776d6.30.1788785550029;
        Mon, 07 Sep 2026 05:52:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91048476220sm62621416d6.31.2026.09.07.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:52:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3Ypo-0000000AfMt-2MmF;
	Mon, 07 Sep 2026 09:52:28 -0300
Date: Mon, 7 Sep 2026 09:52:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260907125228.GB667892@ziepe.ca>
References: <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxupjsy2.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_055232_748980_D2C083CC 
X-CRM114-Status: GOOD (  17.63  )
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

On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:

> I looked into this, and it becomes fairly complicated. We can move all
> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:

I was going for the opposite, you'd move everything out of arm-smmu-v3
and into the arm-cca-host and obtain the viommu through tsm_ops not
through iommu_ops.

I guess I pointed to that in another email.

The only thing arm-smmu-v3 should provide is a simple function to give
the pdev phys and irq parameters. arm-cca-host calls that when it
creates an viommu object.

> 1. Adding more CCA-specific code to the SMMU driver.
> 2. arm-cca-host continuing to own the TSM link setup (IDE).
> 3. Adding callbacks from the device communication helpers back into
>    arm-cca-host, since device communication still goes through DOE.
> 4. Moving the device communication helpers to firmware/arm-rmm and adding
>    something like:

With the above change you don't need to do any of this.

> The locking also becomes more complex. Unlocking a vdev can trigger a
> stream key refresh, which is owned by arm-cca-host. Currently, the locking
> is simpler, using pci_tsm_rwsem and pci_tsm_pf0::lock. With the SMMU driver
> owning the vdev/TDI, we would have:

You can't really avoid something, the vdev *IS* the TDI and the ops to
effect it come in through the iommufd path. The ideal version is the
tdi is never used outside the iommufd path so you don't need to mesh
the locking quite as carefully.

> - pci_tsm_rwsem protecting the lifetime and registration state of
>   pdev->tsm.
> - pci_tsm::tdi_lock protecting the function's pci_tdi pointer.

Like here, why is there a pci_tdi linked to pci_tsm? Anything coming
in outside the iommufd locking is very suspect.

And the iommufd locking should spill over to the TSM, you should not
be able to remove a tsm while a viommu object exists.

Jason

