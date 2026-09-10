Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A4C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=; b=d7Cd9CMoD6KNjRIRbkiMsEoMqT
	VIEOpJznsBJcl9oQyMbtYzrCrdx9Dh9iPQqTUyPIl1YXvrD+2zHTNsdlvTkbPa1+O54vCSo30z0H+
	RYLp1PJ9V4I1yQHyHUzzuQPoTlJ33A+so1VfGfasK4AXSJ6hk/XLglxgRk1l9mHqUrECtCqZgw0Ba
	Q+bJkoV1oiUTKPIj7aeRwBzQz2RP+KmqOnv47P8gAo72BOwX2M86gc/8ajFhpfRWqXbVqlVKfkBGu
	zMMmRlEkw6wTfss3cbwVM+8e/Yj5jKiOhceiE/WQYwMnj7WglvCsy7MWFZ6rFXwRnHsgV2sWTJGfM
	LOrxQWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eAt-0000000EMyB-07fV;
	Thu, 10 Sep 2026 12:46:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eAq-0000000EMxp-2aqu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=; b=GDC2l64jKyzAL9kbJXBlrW1p7g
	kdh/Jz+uVvfHANBisr+J+NqEIvvWxoeryOT3lOGCuEjhc0FdXQIJ4yfZnJaNv68Tn3/H+prHXFcoA
	Q0BO9597RDh/2jRL3EtsfMhRuMfI6ly333082Hd/Xvv9hrRD/x39A6tgkcDMPUEb9Yz28WmoVumdh
	HuH7f2dD/PwRM1nPZJYuUrQpnTe8tKRNhcT9uY20gYmUllkKczkSrTV+aa08dc1OxQSZuY0hQ1YFK
	BoYP+8oLlBCP4H0EwaltXxFEqT6l87rG/Mv4zrs2Jz39NTfIv2BXu/dKw+aBepj1OSHMMXzRtEBED
	4DszwPdA==;
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eAn-00000002Tzr-1vUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:46:39 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-90ce08834feso100278076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789044395; x=1789649195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=EwnG3G/PNGjd+3chuCmL70EIE4N1unhEBFS+UhROd0SFwEl9Jgix5OXZreHHUUZ+jv
         cjwbWZ4Pgo/AqJth21bOwYA1OYcn6ORrMgfIwOpFD5veHfIdYYIzLfLuaJ1CTOWF3l7w
         xXutIcTwwyztU7lcWy2W6felgnVNdiMRCb54fRfHfYmFgVac2jD4aAsXITXTx8qpS/Z6
         OpiWqiUgW3RWsrulxjEuZU/b7dBtigqDgnXu139VTqWIMa7R6taAouA79QAOxOHv/yLv
         wsfB/olye8y6DVdbmkg7mMZxfDpGLdZREhUL+MMeRiTLhAoBiK9Ea33e/0xYDQawHnqg
         ntKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044395; x=1789649195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=HZMwAVjXQvZa31S01qHrgQhVcfXUAzNS7YHRPA7PJnTrXAxqwQwq7ecKiF+Hhudz09
         UcRo04VXar18l8zf0gS+TzdWVqapbKz68v6YsOKeYlHW50C2+iNX97QtjUO1iMkHF3wr
         RkYj8DiExD7oPyrqVByuZv0rfkpjrHTjrxwF5yGG0r+DXeR2P+xXcQq0UmegUV9Rhh3z
         U83bnCZpY8mp1hFLHO9BSIxC551UjyARnpEtbb/JEukitCs2/HRuCg+IHK+A3GobLSju
         RQtQ1zGa9De1CC7XVoYcFyO/Srpgn2JZGRSc7jWIPjdlpxDO2zDkhIPdgDv6FPG35rpK
         0JfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAlKzLraA0JXFBxbpsiOXhEPb4vr7ks+tVfkVMgbygivDcuzZdAGFa8XT5ctm9vNx2jWxk22bVki80QG2Ewt6e@lists.infradead.org
X-Gm-Message-State: AFuF++lm8oTB2+D9qjGtdVp/vG/32pytX+Dl+5FwgWW3N8cadrqJF26F
	aRK7pROEysj0KybNOp4RGQuE6/VFjP+Xrqa+Pm6mbL3RHqbtv+f+aayyg71RvHA4N4g=
X-Gm-Gg: AYBFou3mxfX5y58D710R3/BVZ4FdtSFP3yoJTj2Nfz7mZZIOYtKuK9EfO4UV9o/lW4y
	3YNuzoFCxHqUM/O+cKH7nCXZCBPArQnsoDYTBS13ZMEFEZtYFuw7IYtQCjVmNhOMFUXDOOKXlzE
	wwIXiIalc8H/+3r8kouAmPYNWpc9866CniGfaK5eRncM5Vm5ZsRRhImLY1SXhYhxvBnkTstEUvb
	Z2ni7Jj0D1hZIzMB9YHuF04q4p2GrWGdsZAo0Q34G9dnLxDnwwDiq0I9iM3Cpyt5+jp3dS3xpv0
	goiX3oniAkMBKCopa65N73i72rrh0wrN/jvC9ujp25p+8VGxhu8g34HplkJaIKxlZe2bA+1hfyR
	o9rnTbYJeSthnEhpwVZm153z9SJtjFvVRia2BYJbb1MFp+SrLHfKmx3eQ1eV1ff+WyAqD1gHVC8
	0bkoAzlNOXd6bz5MDYzII/6+AyJK3LI7HNY5O9VrMJa7B99h3yTbpo/y8NzDC9SmbqZFgknENPG
	WhNJLVXRIDJZpKiSE4GPfQIRmYChogwysfXgoUZYEeyIEWZA0ny+cNVvlCpJ6yf7xg=
X-Received: by 2002:a05:6214:d89:b0:910:4b85:a298 with SMTP id 6a1803df08f44-9104b85a587mr381394946d6.26.1789044394511;
        Thu, 10 Sep 2026 05:46:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059615dsm168922596d6.3.2026.09.10.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:46:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4eAi-00000002O5s-42fb;
	Thu, 10 Sep 2026 09:46:32 -0300
Date: Thu, 10 Sep 2026 09:46:32 -0300
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
Message-ID: <20260910124632.GB4083318@ziepe.ca>
References: <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_134637_694969_70369A51 
X-CRM114-Status: GOOD (  40.79  )
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

On Thu, Sep 10, 2026 at 09:52:12AM +0000, Tian, Kevin wrote:
> > The mmio is owned by vfio, there should be a handshake in VFIO to
> > remove mmio when it becomes private, otherwise I don't think we need
> > to do anything more?
> 
> for TDX a callback in VFIO is invoked to revoke the dmabuf.
> 
> btw I didn't see any dmabuf related in this series (even in a hackish
> way as Yilun sent out last year). Is it not required by CCA or just
> skipped now waiting for the framework to be settled?

I think just one step at a time :\ I think CCA needs it as well, you
also cannot safely leave private MMIO floating around the host
userspace on CCA.

> So viommu will become the abstraction point for tsm operations and
> directly talks to the tsm driver instead of going through the merged 
> tsm_ops (bind/unbind/guest_req).

More precisely for what was being called the TDI - ie it is the
abstraction point for the host side of a guest virtual PCI device.

iommufd vdevice already represents this, so we use it again.
 
> currently what tsm_ops provides additionally is more about synchronization
> with connect/disconnect, otherwise just calls into underlying tsm driver. As
> long as viommu creation holds a reference to tsm then disconnection is
> blocked then it's safe.

Yes, this already has to be true or our lifecylce model is
nonsense. Once the iommufd creates the vdevice the guest is running
and we cannot disconnect it without unplugging it from the guest. Thus
the locking can rely on that. Within an iommufd ioctl context the vdev
and underlying connection must be stable.

> and IOMMU_VDEVICE_TSM_BIND will be removed. 

Replaced, the same logical operations should flow through the viommu
command ioctl

> Seems originally this series
> does SMC_RMI_VDEV_CREATE and SMC_RMI_VDEV_LOCK both in tsm
> bind op. Then the proposal is moving them all to vdevice creation time so
> no separate bind step is required.

Hmm, lock still should be guest visible on CCA, and the device has to
start up in the guest as TDISP unlocked. I'm not 100% on the RMI side
of the flow, but this does not look right.

VDEV create should be done before the realm is started. We need this
setup right because Linux VM is going to validate the vdev during boot
if it is affiliated to a vSMMU. lock should be done only when
requested by the guest. The guest must start with a normal unlocked
T=0 PCI device.

> Does it mean that ARM CCA is essentially an early-bind model i.e. the TDI
> starts in locked state from guest p.o.v.?

No

> but https://lore.kernel.org/all/yq5aecfbzjyk.fsf@kernel.org/ seems to indicate
> that guest_req() still handles the bind request from the guest:
> 
> "
> - cca_tsm_guest_req() now handles TSM_REQ_SET_TDI_STATE requests for
>    the unlocked, locked, and running states.
> "

Right the guest side request to lock should come that way.

> 
> a bit confusing, but maybe due to stale info cited from different timing...
> 
> for TDX we're currently pursuing a late-bind model (i.e. TDI starts in shared
> state in guest), so a separate bind interface is still necessary. We could look
> at whether it should be an explicit @bind viommu op or carried by 
> @guest_req (say, if most preparation works can be moved to vdevice creation).

It should go over the viommu command ioctl. It looked like there was
alway some iommu specific format to the command in the tsm version of
this, so that is the appropriate way.

> btw per past discussions VFIO should block some operations (reset, etc.)
> while a TDI is locked. Do we expect a callback into VFIO to notify the locked
> state, or require VFIO's own interface to place a cdev into a special state
> which prevents sensitive operations even before binding it to iommufd
> (and allow creating TDI vdevice only on such idevice)?

At a minimum I think we have to synchronize with vfio, somehow, that
when the device enforces its private MMIO so it can unmap it. Thay may
be an argument we need a few standard viommu ops so the core code can
capture lock/unlocks and do this prep work. Or maybe a special cdev
state is simpler.

This should be figured out before any uapi is settled.

I don't know about reset, that sounds like something the pci core
should deal with?

Jason

