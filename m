Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58576C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUDIe9gR+rSLhhhfLCdbqdanDu9FYyFLld3nExrjk8M=; b=PM6S9NUDVeAbSmJOLwlOomCk+9
	HLrZefFLEAtcPkH1yfxCd0VfV97BFR2QBUYsITPjooM8G339fxHUqlxtDyY23hOaUQhyk58vLzSN4
	Fw0q6BrFGXGb3Rp672IjKzHiBoCrcq8ssyY7qw6yjpzj3RSa5VnPwaDhakPdeJ79+fKO8JY1LSQ4O
	w0ghiP4FmY5lWm0wBLyPJ53DpF322KtVDaxVIy//gyt1oLgJk0d7Qbd6H8IkZpBNHvOpOk0enrCgt
	fHniittax8yw2K9Y/kn27fFaeYUu4mmxXImsOGPcRaMQC4HGuavaL12yIZlisTrkXm1RBp2WRLPF5
	2nAlwUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ovg-00000009BUL-2F8i;
	Wed, 16 Sep 2026 12:40:00 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ovd-00000009BTz-1uD4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:39:59 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93a222edc62so96353685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789562396; x=1790167196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUDIe9gR+rSLhhhfLCdbqdanDu9FYyFLld3nExrjk8M=;
        b=AkwMRyDocQfOfYJEUXZ0zbUH4P3SLovtUjjPAuV4PWuyrllUvDNI3Gz5uEiNCmf00b
         YsTBEd3GOztdzjSRtZa2f0ltKcjthTGK1qICHHFiN/x6QYBcXQprnE89vP3wWiw5dgW5
         GyAqm6o5ZnIo5cIleW2fBhGMFpPResUMvOW7aqfg0EwpDwgmg74dsoNJm/QYnbiZkZWA
         N1XIDmy7t6ooRkqTLW69Evo++SHDEMb+QzyJ6AxppHlKaKVqrOxAR1f4T2QMVb2/MDHD
         5CMVu+IteiKBrYKpVqWOR71/YbZecTlj3htryV8CA3IGC/1S6L8fUXpXh2eR9ZuqML2m
         AMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562396; x=1790167196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUDIe9gR+rSLhhhfLCdbqdanDu9FYyFLld3nExrjk8M=;
        b=A1VYgMgLve0CeIx1j6uLfJj3tr0IaGMUMsISbJ20rV7FpRwu0q9RoA08A0tVrWKO0g
         IjDJIZCizOZyoIvRmTfChlr5kfZ5Itdg6LPxgmMWzPu7TEge9bTEgLVq92RCAWuiZ/G4
         43q2vVt2jgTr3gt2sCpXjKo9eTYItUe/J/FEZAGWdiRVQMi1CxHWUlYfIOEFYb9zNfZV
         qNBvNjYBNbZvh64tZYY4Eu6UEWC5gOGchYcJ1mB2Akenb+SPwLR/C3E+SBe9aqutMaw4
         DFcI/n6aOjiDDmPebNPbN1tqM9aBh5OX9nLH8NP24Ti8gJifX5zvBgzZBdZNjHp6GDKx
         wYKA==
X-Forwarded-Encrypted: i=1; AKwUvBzDkDZbq8F6yZ0DR4xTENokOAYmFA+Khj8EvcR7pqmsRzu9fiAo81N4gNWKtUr4/xT9gFDker/xPRZavTHrF46Q@lists.infradead.org
X-Gm-Message-State: AFuF++nbX+xGLfo+Dg+4Yq93PThoBH7khXPH1jhCfHHbMFD/OIOjzE9r
	fVi5vNHTWP6awxYIj6KJjxxKOdFDWipCwfTnbM0710+Bc786BxJhYESspgCwuTFJUag=
X-Gm-Gg: AYBFou1te0oz4JMiK3gN9GMEsD4P2WMVLE/BaJkhyyDJOV1u6k6UB99Z2jAUeA94ujn
	fGqMEHZpeH74LcW0SkNrH3CPBV517Xr2FozRD+QruSjNIAJGxYTYi1JdxC2T8f5GY9xNYpXx3+p
	Udcy4L1+eenDibrD3N9CUOMfqY/3IL0+ujX7GNLPJPAGJ1CL5eB5dErWsGM7AnaP48l1B/xkk5m
	2SI9IwVcMiyEP/8XvFABlYnNVj6rbRWhbcKGtdriLuPJBd+gAlGyag7Vuu5gsvSv71rK9/WG9Sr
	B0PjiRa0StDJ+amGwZB9Rh+i/ahXx7YvjPhUwEppZKYQVGsWm0RqQVDA/3DIIL1qmTcMfHQVzw0
	ApI3trPe1Uu9W4cSxai9RRhdgtxmXiOsbe75dOGwsf5ICSziiMj22WtVG1GbZ+06DaGF8r0BeAk
	qJNEONkv6jc9bt9GvrzcmumS18z9zplI3GFHQ7l5cGiF2CWYVUACtDD4PNb6l+MkTfM21ZIIx8e
	avPj875m/uijnuWacFLom+EKjV4udCX1xk6QlBMAfC1y5gif0UhFL2WF9x+B8VevDI=
X-Received: by 2002:a05:620a:4542:b0:93a:1540:a75d with SMTP id af79cd13be357-93bb78f1ddfmr339230785a.37.1789562395834;
        Wed, 16 Sep 2026 05:39:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780cfdd7sm206826385a.6.2026.09.16.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:39:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6ova-000000098HD-0Q4W;
	Wed, 16 Sep 2026 09:39:54 -0300
Date: Wed, 16 Sep 2026 09:39:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
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
Message-ID: <20260916123954.GC3196566@ziepe.ca>
References: <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260910124632.GB4083318@ziepe.ca>
 <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260915134318.GB3196566@ziepe.ca>
 <CO1PR11MB4835562E7714F368E669D3B48CB92@CO1PR11MB4835.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835562E7714F368E669D3B48CB92@CO1PR11MB4835.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_053957_579880_F36B7CF9 
X-CRM114-Status: GOOD (  41.78  )
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

On Wed, Sep 16, 2026 at 05:54:57AM +0000, Tian, Kevin wrote:
> > At least for ARM there is effectively no entanglement with the actual
> > host iommu driver. The viommu is entirely provided by software in the
> > RMM world, so it can have its own dedicated driver. In ARM T=1
> > transactions are alwayus routed to the RMM's iommu and there is no
> > relation to the host.
> > 
> > I am interested how Intel works here, but I thought it was similar.
> 
> Largely yes. Main difference at Intel side is that TDX still relies on the
> host to initiate iotlb invalidation (upon notification from KVM on S-EPT
> change). Currently we put this logic in intel-iommu driver but it's more
> about wrapping invalidation info and passing it to the firmware. Moving
> it into the tsm driver should be straightforward.
> 
> Maybe there'll be other subtle connections to host iommu driver but
> it doesn't sound a hard problem to solve.

Okay, so I saw the driver posting for basic iommu support, can we try
to rework that to be split out like Aneesh is doing so everything
about TDX calls lives in tsm and intel iommu only provides a small API
surface to exchange whatever details are needed to bootstrap TDX
module?

> > AMD is different and I suspect AMD will have to continue to use the
> > viommu from the AMD iommu driver, but I am not sure.
> 
> ARM/Intel may support guest viommu in the future. 

ARM supports guest viommu today, it is in the public spec. Secure
guest vSMMU is entirely handled inside the RMM and has no connection
to the host iommu driver. It is a <100 line ++ on top of Aneesh's
work, Nicolin posted a draft at one point in those threads.

I anticipate a future intel guest T=1 viommu should be the same.

Thus I expect Intel/ARM to have two viommus, one that handles the T=1
stream owned by the TSM driver and implemented entirely by calling
TDX/RMM.

One that handles the T=0 stream owned by the iommu driver - and it
already exists.

> So AMD's case is a good reference. 

I think, AMD is completely different. I keep forgetting thier thing,
but IIRC they have a secure DTE but instead of having the secure word
control the translation it controls the RMP and you end up using the
host's translation for T=1 traffic. This is fundamentally different
from how Intel and ARM are doing it where the actually IOVA translate
is under the control of the secure world.

Both Intel and ARM put the S-EPT into the iommu HW directly.

So, I expect Intel to have an API similar to ARM. When you create the
TSM viommu you tell it if the TDX module should create a secure guest
visible VT-d emulation. TDX module has to perform the entire emulation
because it must be trusted. Existing viommu ops should cover the
remaining to register pdevices as vdevices, provide the vBDF and so
on.

> > How/when the tsm driver links this to a arch specific "bind/unbind"
> > operation is more up to that driver, but I would expect what is
> > thought of as "bind" should be the affiliation of the device's T=1
> > stream with the viommu and the target VM. It should not be sensitive
> > to the TDISP state.
> 
> Not sure about this part.
> 
> Each arch has its own definition about the binding flow (about 'how'),
> but sharing a common step by sending TDISP message to transit the
> TDI into the CONFIG_LOCKED state upon guest request (i.e. 'when').

Sure, the LOCKED command can be relayed from the guest, but that
shouldn't be called BIND. locked/unlock/run/err is taking a iommufd
vdev that is already affiliated with the VM to a specific TDISP state

> According to the TDISP spec, memory reads/writes with T bit set is
> accepted only when the TDI is in RUN state (except MSI/MSI-X writes
> are allowed with T bit set in LOCKED but I don't think any arch supports
> it yet).

Sure

> So your definition of 'bind' essentially affiliate it to the RUN state?

No, it is informing the secure world that a physical PCI function is
now a virtual PCI function, is a TDI, and is in a certain VM.

Outside virtual hotplug this is a permanent action when the VM is
created.

> > That is not prohibited, the TSM driver could do some auto
> > "bind/unbind" whatever that means triggered by ops or tdisp state
> > changing under the covers. But this cannot leak out as some kind of
> > asynchronous vdev destruction.
> 
> Maybe it'd be clearer using an example e.g. ARM to clarify the
> suggested split. Or wait for Aneesh's next version...

In ARM:

BIND is RMI_VDEV_CREATE it links a physical device to a virtual
device in a realm.

RMI_VSMMU_CREATE can attach a vSMMU to the realm and there is some way
to link the VDEV And the VSMMU together

Some sequence of RMI_VDEV_COMMUNICATE, RMI_VDEV_LOCK, RMI_VDEV_UNLOCK
and a few others manipulate the UNLOCKED/LOCKED/RUN/ERR TDISP state of
the VDEV.

I assume TDX has the same general shape, I don't know how you could
implement this in a radically different way?

So iommufd viommu create calls RMI_VSMMU_CREATE
   iommufd vdev create calls RMI_VDEV_CREATE
   iommufd viommu op ioctl calls the COMMUNICATE/LOCK/UNLOCK

Jason

