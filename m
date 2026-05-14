Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51B6CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 04:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLBypvNW5ZYdCzcXRqM68PW6cdfiVcgNLkkpkfrL15Y=; b=YJDSo/rvj8eICGhyuQfHscEG5n
	aDgtkiHsziskiNu1RFeIf7nCNBTCrnz8vfNx0+qhRZsU4m7X8MejC/t7cqaxV1Bh/n9qKa/ERfkgp
	HJfrH/HZEFMXFYD9VtgP6jiAkcpW24wzXzmjTih927n7Em7zGyz1ZKDgqKdud2t2Tp+QFxlusCqSZ
	RRBqvfRqHwdzyA+vMgzNOGB8g0nLaHokyhGrNClO7nOYt4yLMvbO22g5ZeU0IKY6x/31bkQkI91yN
	JaxmT276tuZjGCzNxokcKiVjwMZDC451CenNmsNTJxp0EK9+8KetzsOr4dSQpL6IOvhgKH8eoa11k
	mBibzBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNR0-00000004VvV-0RBD;
	Thu, 14 May 2026 04:12:30 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNQx-00000004Vus-0o9g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 04:12:28 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ba838d3fa4so82565025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 21:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778731946; x=1779336746; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLBypvNW5ZYdCzcXRqM68PW6cdfiVcgNLkkpkfrL15Y=;
        b=jfjyAxls+vopKkKkBctC5nzk2LXEI1IwGVKHjH6rQGNY8avvqXsGBIlPjdZ9+o8dxL
         VPg1XeF0qZe9OeAufi8LZlC22AbUvc/kAfGxBRRsX60hzH/8mEILwVpi5zsX9Cq1ElO8
         XVKk6P+iObet63lGd4ztrVULtLH+jUkiqFNFyPsoELGm6ZzojRNf4DMK4Gx36NMUnXvh
         3DEz2j3LRQsCUfPpKQYxcqQUCeMqrs9UvH9faJlV1lzV3yXbTm3GvjMclFvQOzTjWX9P
         zmZrtNb46qKkFk13NFvLzIbAGlLienmLbaN/hdUprCwQRKt06o8Ft3GdZLoBG4tSHbT8
         Tx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731946; x=1779336746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLBypvNW5ZYdCzcXRqM68PW6cdfiVcgNLkkpkfrL15Y=;
        b=Nq8aYdAqNB5hx4lKv3oSWGJV3ETB5EXpJJ24mauCB2rMZfUzM0EQCajZd4cOWy7Sp7
         sAoXqoJg9zVzkvguAMv8lCYEyhqzW26nRPrkb8kkLqgXf7GG7H1piE0QS/ANc7L2s1d6
         Vn2Yzh9pze9ZS/g77T7bvk2PIGc1k0AbY72u1aQXvxCx0PXlGZOwTMhFsFiO/tQ+C8EF
         Ujf/IpfRgS6Cq+cM4Bt7fTdAHkA8B7nMgJhEIRzWpONaquOFfh+GD6QeUf7k4WBlIcLf
         GnPiwWfJOmR8xRujBhyCxHOqeZKZZq0JBp9ZCbWXtboGQGGhyJiN49Mvo5rY+RY/KrzD
         8FNA==
X-Forwarded-Encrypted: i=1; AFNElJ8AbmGubw3fVucykqd69TC0tLSzpu08K5y3hwKnkc4ComkWzkTaAP17ctAhn0mAu2qwBdwOA0qTSKwiadRsiQfV@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHcR7cJNoHgiUFrMdg53ULGRX0jk1ou1/ke5CgbY4MnTrOdLT
	bvs710ZLeJama55TaAn6eL8lBfs+dF74T7fSpB0yuPddecan4lAXC7Fqv6hhSHmolssnIohfCbO
	MR13KfrJRSFfnE8+cx6Sm5yRGdw==
X-Received: from plj12.prod.google.com ([2002:a17:902:c14c:b0:2b0:5006:5260])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:388d:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2bd2fc2201cmr55370495ad.24.1778731945615;
 Wed, 13 May 2026 21:12:25 -0700 (PDT)
Date: Thu, 14 May 2026 04:12:23 +0000
In-Reply-To: <20260513171059.GP7702@ziepe.ca>
Mime-Version: 1.0
References: <20260513171059.GP7702@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514041223.1518250-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org, kevin.tian@intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nicolinc@nvidia.com, praan@google.com, robin.murphy@arm.com, 
	smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_211227_239259_4A5F6104 
X-CRM114-Status: GOOD (  29.60  )
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

> On Wed, May 13, 2026 at 05:03:33PM +0000, Joonwon Kang wrote:
> > > On Tue, May 12, 2026 at 02:51:38PM +0000, Joonwon Kang wrote:
> > > 
> > > > Appreciate all your clarifications here. So, my understanding is that if
> > > > our system does not support ST64BV and ST64BV0 or if our device does not
> > > > distinguish between the posted write and the non-posted write regarding
> > > > PASID, then we can lift the use of the global PASID space. Can I say this?
> > > 
> > > You should do what Robin said - just have your driver use a per-device
> > > PASID that it allocates and never use the global pasid allocator.
> > > 
> > > To do this lightly re-organize the SVA code so the driver can supply
> > > its own PASID, and in this mode we wouldn't activate the ENQCMD
> > > features in the mm.
> > 
> > Ah, we could actively disallow EL0 to execute ENQCMD-like instructions
> > when the device driver explicitly shows the intention via a new API like
> > `iommu_sva_bind_device_pasid()` that Tian mentioned earlier. 
> 
> You shouldn't need to do anything like this. 
> 
> All you need is to ensure that mm_get_enqcmd_pasid() returns
> IOMMU_PASID_INVALID so long as a the normal iommu_sva_bind_device()
> hasn't been called. Once it is called it is fine to allow the ENQCMD.
> 
> Your new iommu_sva_bind_device_pasid() needs to establish the SVA and
> attach it without triggering mm_get_enqcmd_pasid().
> 
> The arch code is required to block the ENQCMD like instructions when
> IOMMU_PASID_INVALID.
> 
> Devices that can mmap an ENQCMD sensitive BAR region must not do so
> unless iommu_sva_bind_device() has been called.
>

Yes, the basic idea I meant is the same as this: use `mm->iommu` to
deactivate the instructions. The arch code for ARM may block them later
as it does not seem to support FEAT_LS64_ACCDATA for now. Thanks for the
details. I think I am pretty much aligned. Let me try it.

> > To allocate a per-device PASID, I think we should do it using
> > `dev->iommu_group->pasid_array` instead of making the device driver
> 
> No, make the driver manage this, don't mess with the core code. PASID
> isn't supported with multi-device groups already.

Understood. Thanks for this info.

Thanks,
Joonwon Kang

