Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393E3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDwUb1CX6Sr6nHPLw6pFpl0RRopDNIXW9mErFWzYtxQ=; b=JDwupaQz3VmonALNj4g24P1u7Q
	MaCEfFFPJ88iQSPVUnbAZyNLvSLVyYwnYksBn6hLzVB4oVOY7C3Y9ZCIDYvCypGGYqEZ+oqVyXQJy
	2/f/2Mri4o+lVpJPR8pdDFshd6bvKGUg+k06SxQSpDBx7IyCbFtk0OFw+/Q8f9pu5BpsgmGFfqOya
	+RCGt/XVDl3TWSWgcIZtO+p4O9PSyK7A3syObLe1a/1cmNW4EiJ4ubFVnGhPCX4/5UoccdQ3YzDsA
	LGmhMPqePMJxoJ8UyCgRuAJ9EggiMXYJwM6z7Z8NlztMdZuJLbKv+P8F9RCdgwOjZNRthAcCxlC0q
	vtdS/B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBbL-00000004rRh-1zRm;
	Fri, 13 Dec 2024 19:45:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBaG-00000004rAr-0rFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:44:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401af8544bso1323e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734119057; x=1734723857; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDwUb1CX6Sr6nHPLw6pFpl0RRopDNIXW9mErFWzYtxQ=;
        b=RVZJnie7OYVRXmcIUiRajmwAWOlbYy6wBXvnJD9dzBVj0qfY5q420amZWULsRTmLF8
         KmGXdlggQWiAtaVFfnGCftkndWxPjkB94B4sHjAVTuYMpFzZTSvTeP0NUzy2tQF0Delz
         /89+Cgw0KvnQrOilQHE1SsgBw8y5D5MBYmOS78N8f6SL+CjNVhGbO90ynZTfBoQgtzdF
         eFdFzte/Czje/wjYWLdE0qGhcSp5ghvYYHV2R2WRes+1topHzBvljY3n7QfLCHRq9wt8
         +dKBKuuNgOpRYfgS6jqaz0TMXPnt8qHiI3yCdqwbzsqc8PLA0Aggwwj4qV7Vk/jdrb7a
         zAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734119057; x=1734723857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDwUb1CX6Sr6nHPLw6pFpl0RRopDNIXW9mErFWzYtxQ=;
        b=Alx1KCEumjEypn+AXISLfABBxt//UlOT8csJ5GUiJ5pbogsxtKUz3O3/x5IBYfpTEr
         K7LJE//D7Jybu8cgVvu3rEnKlVWqMRoHsQoaCHtgDqqEVXEOfAJiljDlyHJWqZ0yzz+y
         szoBoRayWAFtIupMay6MZWX0Jo8NiYatRrmwk2eUjGK1v3GVYB1SoROCEZjnoDOiWPc4
         KVJHK+869fj0mMaLgGAZuveAt7yvXISJ50bnP5RUDIjfxV0OkUbNFTGRN1hNlcnGBEq3
         b97ENYqyRvkL+Wa8FfUskgHvj5L8o904AmeUVoz9VOLB4RBMxUYCGHCeBhyFsoEAHcH+
         JTVA==
X-Forwarded-Encrypted: i=1; AJvYcCWrMk+2+Fd4rBIDdPKlys0JyxDsTfMSHPhshQ8i+GIIo9uq0F84G8Td/A6LhimbmRVGcvXYxQ81XVghMVRPdnlL@lists.infradead.org
X-Gm-Message-State: AOJu0YwUgPAuwgItUrV13MMaV0LRPne0zOFie0D1+X+qdh2ihEDqaWlE
	x9E2NkgO9z6pNxPJWH+0FPxjoHFM6Osni1h9O7/+O3dEHEPQbuPV7H4ImA6NImusu+srXrklTsv
	wQQ==
X-Gm-Gg: ASbGncujZwP+UwoIF1qa3/pc/s4/NzaKX1qBADvDmegyaIB8CMcxx473MFBD6YIdqng
	wPbvmPzwzvWpHs/w6Wgtp5Y1vOXCRVEDHOFcly3dN8cAJAHSsCoNHxOnj7jr/nPixLVp1OUXeBr
	TF7VeUurfCM8Jh1YtrjKyIvnCf8RKgMdyEUVOFivAVL8lS38Ow0nUoq+Aqb9wYXB+joFC1oKw7s
	R4wOIzGOVbqDDuUoftMdnJuHN9/Orw77nzEOq/w0P4qeEKOx+bXB+bEPaZ1VL3mR/MjFNey1i8+
	78PKVj1yHJGY0O5N+XM=
X-Google-Smtp-Source: AGHT+IHdFtR6nWbEKqYw854N5Zc8zTfw4isez/5ifoPu3S8WlhrESs7+a6kca8RFQjDNrPJyOsPwuA==
X-Received: by 2002:a05:600c:35c5:b0:428:e6eb:1340 with SMTP id 5b1f17b1804b1-436367928cfmr91385e9.4.1734118749096;
        Fri, 13 Dec 2024 11:39:09 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm57782095e9.7.2024.12.13.11.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:39:08 -0800 (PST)
Date: Fri, 13 Dec 2024 19:39:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <Z1yNWI9lBNIZg6Le@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212194119.GA4679@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_114420_245439_BB7A99AE 
X-CRM114-Status: GOOD (  66.88  )
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

Hi Jason,

Thanks a lot for taking the time to review this, I tried to reply to all
points. However I think a main source of confusion was that this is only
for the host kernel not guests, with this series guests still have no
access to DMA under pKVM. I hope that clarifies some of the points.

On Thu, Dec 12, 2024 at 03:41:19PM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 12, 2024 at 06:03:24PM +0000, Mostafa Saleh wrote:
> 
> > This series adds a hypervisor driver for the Arm SMMUv3 IOMMU. Since the
> > hypervisor part of pKVM (called nVHE here) is minimal, moving the whole
> > host SMMU driver into nVHE isn't really an option. It is too large and
> > complex and requires infrastructure from all over the kernel. We add a
> > reduced nVHE driver that deals with populating the SMMU tables and the
> > command queue, and the host driver still deals with probing and some
> > initialization.
> 
> The cover letter doesn't explain why someone needs page tables in the
> guest at all?

This is not for guests but for the host, the hypervisor needs to
establish DMA isolation between the host and the hypervisor/guests.
Before these patches; as mentioned, a host can program a DMA device
to read/write any memory (that has nothing to do with whether the
guest has DMA access or not).

So it’s mandatory for pKVM to establish DMA isolation, otherwise
it can be easily defeated.

However, guest DMA support is optional and only needed for device
passthrough, I have some patches to support that in pKVM also(only with
vfio-platform), but it’s unlikely to be posted upstream before merging a
host DMA isolation solution first as it’s mandatory.

> 
> If you are able to implement nested support then you can boot the
> guest with no-iommu and an effective identity translation through a
> hypervisor controlled S2. ie no guest map/unmap. Great DMA
> performance.

We can do that for the host also, which is discussed in the v1 cover
letter. However, we try to keep feature parity with the normal (VHE)
KVM arm64 support, so constraining KVM support to not have IOVA spaces
for devices seems too much and impractical on modern systems (phones for
example).

> 
> I thought the point of doing the paravirt here was to allow dynamic
> pinning of the guest memory? This is the primary downside with nested.
> The entire guest memory has to be pinned down at guest boot.

As this is for the host, memory pinning is not really an issue (However,
with nesting and shared CPU stage-2 there are other challenges as
mentioned).

> 
> > 1. Paravirtual I/O page tables
> > This is the solution implemented in this series. The host creates
> > IOVA->HPA mappings with two hypercalls map_pages() and unmap_pages(), and
> > the hypervisor populates the page tables. Page tables are abstracted into
> > IOMMU domains, which allow multiple devices to share the same address
> > space. Another four hypercalls, alloc_domain(), attach_dev(), detach_dev()
> > and free_domain(), manage the domains, the semantics of those hypercalls
> > are almost identical to the IOMMU ops which make the kernel driver part
> > simpler.
> 
> That is re-inventing virtio-iommu. I don't really understand why this
> series is hacking up arm-smmuv3 so much, that is not, and should not,
> be a paravirt driver. Why not create a clean new pkvm specific driver
> for the paravirt?? Or find a way to re-use parts of virtio-iommu?
> 
> Shouldn't other arch versions of pkvm be able to re-use the same guest
> iommu driver?

As mentioned, this is for the host kernel not the guest. However the
hypervisor/kernel interface is not IOMMU specific. And it can be extended
to other IOMMUs/archs.

There is no hacking for the arm-smmu-v3 driver, but mostly splitting
the driver so it can be re-used + introduction for a separate hypervisor
driver, it’s similar to how SVA re-use part of the driver also but just
on a bigger scale.

> 
> > b- Locking: The io-pgtable-arm is lockless under some guarantees of how
> >    the IOMMU code behaves. However with pKVM, the kernel is not trusted
> >    and a malicious kernel can issue concurrent requests causing memory
> >    corruption or UAF, so that it has to be locked in the hypervisor.
> 
> ? I don't get it, the hypervisor page table has to be private to the
> hypervisor. It is not that io-pgtable-arm is lockless, it is that it
> relies on a particular kind of caller supplied locking. pkvm's calls
> into its private io-pgtable-arm would need pkvm specific locking that
> makes sense for it. Where does a malicious guest kernel get into this?

At the moment when the kernel driver uses the io-pgtable-arm, it doesn’t
protect it with any locks under some assumptions, for example, unmapping
a table with block size and a leaf inside it with page size concurrently
can cause a UAF, but the DMA API never does that.

With pKVM, the host kernel is not trusted, and if compromised it can
instrument such attacks to corrupt hypervisor memory, so the hypervisor
would lock io-pgtable-arm operations in EL2 to avoid that.

> 
> > 2. Nested SMMUv3 translation (with emulation)
> > Another approach is to rely on nested translation support which is
> > optional in SMMUv3, that requires an architecturally accurate emulation
> > of SMMUv3 which can be complicated including cmdq emulation.
> 
> The confidential compute folks are going in this direction.

I see, but one key advantage for pKVM that it requires minimum hardware,
with the paravirtual approach we can support single stage SMMUv3 or even
non-architected IOMMUs, that + the DMA performance, might give it slight
edge, but as I mentioned I plan to do more throughout comparison with
nesting and maybe discuss it in a conference this year.

> 
> > The trade off between the 2 approaches can be roughly summarised as:
> > Paravirtualization:
> > - Compatible with more HW (and IOMMUs).
> > - Better DMA performance due to shorter table walks/less TLB pressure
> > - Needs extra complexity to squeeze the last bit of optimization (around
> >   unmap, and map_sg).
> 
> It has better straight line DMA performance if the DMAs are all
> static. Generally much, much worse performance if the DMAs are
> dynamically mapped as you have to trap so much stuff.

I agree it’s not that clear, I will finish the nested implementation
and run some standard IO benchmarks.

> 
> The other negative is there is no way to get SVA support with
> para-virtualization.
> 
Yeah, SVA is tricky, I guess for that we would have to use nesting,
but tbh, I don’t think it’s a deal breaker for now.

> The positive is you don't have to pin the VM's memory.
> 
> > Nested Emulation
> > - Faster map_pages (not sure about unmap because it requires cmdq
> >   emulation for TLB invalidation if DVM not used).
> 
> If you can do nested then you can run in identity mode and then you
> don't have any performance down side. It is a complete win.

Unfortunately, as mentioned above it’s not that practical, many devices
in mobile space expect IO translation capability.

> 
> Even if you do non-idenity nested is still likely faster for changing
> translation than paravirt approaches. A single cmdq range invalidate
> should be about the same broad overhead as a single paravirt call to
> unmap except they can be batched under load.
> 
> Things like vCMDQ eliminate this overhead entirely, to my mind that is
> the future direction of this HW as you obviously need to HW optimize
> invalidation...
> 
> > - Needs extra complexity for architecturally emulating SMMUv3.
> 
> Lots of people have now done this, it is not really so bad. In
> exchange you get a full architected feature set, better performance,
> and are ready for HW optimizations.

It’s not impossible, it’s just more complicated doing it in the
hypervisor which has limited features compared to the kernel + I haven’t
seen any open source implementation for that except for Qemu which is in
userspace.

> 
> > - Add IDENTITY_DOMAIN support, I already have some patches for that, but
> >   didn’t want to complicate this series, I can send them separately.
> 
> This seems kind of pointless to me. If you can tolerate identity (ie
> pin all memory) then do nested, and maybe don't even bother with a
> guest iommu.

As mentioned, the choice for para-virt was not only to avoid pinning,
as this is the host, for IDENTITY_DOMAIN we either share the page table,
then we have to deal with lazy mapping (SMMU features, BBM...) or mirror
the table in a shadow SMMU only identity page table.

> 
> If you want most of the guest memory to be swappable/movable/whatever
> then paravirt is the only choice, and you really don't want the guest
> to have any identiy support at all.
> 
> Really, I think you'd want to have both options, there is no "best"
> here. It depends what people want to use the VM for.
> 
> My advice for merging would be to start with the pkvm side setting up
> a fully pinned S2 and do not have a guest driver. Nesting without
> emulating smmuv3. Basically you get protected identity DMA support. I
> think that would be a much less sprawling patch series. From there it
> would be well positioned to add both smmuv3 emulation and a paravirt
> iommu flow.
> 

I am open to any suggestions, but I believe any solution considered for
merge, should have enough features to be usable on actual systems (translating
IOMMU can be used for example) so either para-virt as this series or full
nesting as the PoC above (or maybe both?), which IMO comes down to the
trade-off mentioned above.

Thanks,
Mostafa

> Jason

