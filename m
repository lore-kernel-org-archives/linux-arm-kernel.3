Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D41606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gsAE7NPs;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UHhaMzbJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=; b=gsAE7NPs+9uHgj0Y/xvLefExYJ
	eUJSs6U8HApw6DIIrpfAutklkUBvZ4f/HCGCbVUaEJ1pYEfK9RtCXP4JoSxst1/ZD3VAN/U0ZMtXK
	bjMjn+yGOdU6yPOvaegd0fnj8epkgVR4hLiEO/WQVUmLFBtAYruUnWyMKHwRwR857TYV1DCQofy5z
	Qkd5Y8Qfx32aRoc6Kd4rRXbU9y1dhl55qRhczsnSDb1s6AY61Z1C4UbbL+Yz5q+Pb17t6+RAo2Q4s
	krWhQfjf2EtjAomRqQEfW/oLjE8YbUtbOvlC9XoHJ1FxxFqppFs+/ezHavXtcay/y1G605CYuL7cV
	dLiebWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpvz-0000000CAyp-0UVu;
	Fri, 30 Oct 2026 16:58:31 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpvw-0000000CAyV-2CZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:58:29 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-91c79f306e9so10969446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793379506; x=1793984306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=UHhaMzbJtFm71+riwXEW5ApIlWYHS53tPMwaDcXFVSUNmy+JaicrdWOdbsn4uQdiot
         iJrZrrqYD4vTLohKyOH+NitoWlJy4gl7ypYb35nIki8EUefaK2fBMPN/PtIVlbf57vo0
         R1rd4quQvCDk1X6OKSSA7ISmjVzuDEoLaUNbqbnjrEdq/jAsNLX62GssV9W3Dm3V/XZC
         blFp1cZL4NL/u2gMTpe91q7xNxlz9BGqO6xpgMRTEaU41FoKapzP+VKkfvnaHVgtaSqJ
         TZ/Kx5nfM19swRwB/+z/cMLwaJml5c5KCnMQDiBLebCn9TsnWAjwdFtyQzvBlIVaC6MV
         TP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379506; x=1793984306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=url2Ao/rhJ25vAc71MKJwJEh8xNx4FXaqIdgHsmJ9UFU1QcQoCotrBuROHHBlU1pFQ
         Z0oEq2qUwvQUthBSfUKbig7X36h60Rb5Ap3NK0cJqj8JlFnSaXydznsOl4m2iMpqewnr
         K07xtZmkNyHBgN2izygERm9zD69L/r+AJUa/3+d3b12FHrEvsoLxMAHgRj7YVGNzp6rp
         fL5AhkJ/QEj0IOMCOBHz0M4gZjnR7Ft/tlPWULrqNp1LYhmWHLd9xNJ5G+oQiVpDtFOT
         nhVqMUxSgjN7rqiKu867AGtEasUkJaQWvMtOCxby+SZytF79dfbwXljTc3tALGinzUOh
         Drqg==
X-Forwarded-Encrypted: i=1; AKwUvByCCXrrxyq38I3NyRFdRYdKnorzEIfVVZDUehC4xRLmiFPjM2nZ54d5JcefedrbxMa9nyiw401fmacZd5gSe1Z5@lists.infradead.org
X-Gm-Message-State: AFq9FYKyufo8ohNcFyn2VkaByQw5EmfPwMuhzqhSIsDVGUKOBvkqv1xI
	iKCcklOPKRQt6v66b+k48DCY112FOhJBLF0pHnfwkxMmM+uwkFvHvg2hl0dwNiwZMnY=
X-Gm-Gg: AYBFou2sNI04ltvhUS3tj/NPf+ERFESCE2c9LUxVam7vyeTKEHAiQFjDJCTgt37ZXjS
	LZc1MWvXtEZ0PVqBPjmqGwV6sYOn7YhpW8YyBxpY0BeVUoM2Je4me0LqF6GGcdlm8ZrSOZG17Xd
	NFaWhLxYeLtNZCF5CHpCx62nSRiSvITzHI9TSbHgCDUdvJdG5GVfbVF6VchKMzxsG6wwzejrNrZ
	7MTlGWTECqJBfJt2jjTguRHYRMqtmCGyTUALY8U46vcK/KIGZScyc7P+PO9iHQbcDLXumb55wPK
	sAZPhbctepRN98eMhWlnaNio3uAEe3BDOAt9gHw4CpGuqluO55ghbKq7qx/9l0za1BLE0ribGk8
	KMFP2iUrE4Pc+h1n4xiUhFf4y/BeQGdSYIqQm+X2hPDkkYft0mv7ChB6ZkeDoKKoM0GIvFRADIn
	XaHjrniWP0LC3ZaApmH9ZfHwpsT5adJdEeGjZ7y4Scwd2oHBoK8OYiKK1yibn2E0/mfvD6UBc08
	AyuchZ4WpTHXPguAJ0k1RasdoAPoKgViDhmQN+JE7BJyyK74nHLcRfUsRaulfxCf7R9WpRgE484
	QuUliADDvCIdEdPb/M4+f9IjM4SlGA8gSZsZYj5BeDmNoSqCkmLRV1w3GCyqwP8OXhqqvpMglsR
	mB4m3YZiYUtY=
X-Received: by 2002:a05:6214:226b:b0:91b:ec0b:9671 with SMTP id 6a1803df08f44-91ca4b9a540mr46456036d6.52.1793379506439;
        Fri, 30 Oct 2026 09:58:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca80700b5sm19825486d6.38.2026.10.30.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:58:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMpvt-000000019rO-0nKn;
	Fri, 30 Oct 2026 13:58:25 -0300
Date: Fri, 30 Oct 2026 13:58:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
Message-ID: <20261030165825.GE3889730@ziepe.ca>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com>
 <yq5aecd9aupx.fsf@kernel.org>
 <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_095828_770906_73CD9ECC 
X-CRM114-Status: GOOD (  11.09  )
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

On Fri, Oct 30, 2026 at 07:54:04AM +0000, Tian, Kevin wrote:

> Besides, it might be a good idea to return an error if idev->kvm_file is
> NULL in iommufd_viommu_alloc_ioctl(). I don't think the viommu logic
> is designed for native application...

That's probably going too far..

It should be possible to fully test most of the viommu stuff without
an actual kvm, for example.

Jason

