Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1208E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3Kc4OCgSvKd/epZOxEeCEHon8tDHQaK9PORYrELsJ0=; b=j8gNCPC8dxZswCbmbQaCHwKqLs
	U2df3O8MjapqX9IGZLPu/e2aomuB5L5UcGdmRymrnd8MrdSN2shBnE9ZGF6syFGCeqXKvLzNKMRGB
	U5+5Do2iqbodgpvaPIhGh//jQgmrpzaw2nsCxDQ+rwYaSqzORVeNwG5jBhrATV17DOUxwueT+4HRV
	H/8dYntgAKHxtpkBJiU06aBHBQwu/pioTNnKQujjAZTR6Z5qQhsoCafOWNkSWBybBarxMgQ+EEDXB
	fbPKEQHYAmDhpVpBFwQgphklk4j6jvf9HP9YZNKJoW4Ux/faHnO28Xsz6zF7uVIP7NJuNywerYqU8
	Ui8W6qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLp4y-00000001gdl-0NXR;
	Thu, 12 Dec 2024 19:42:32 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLp3q-00000001gPj-2uF6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 19:41:25 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b6d63ab374so61826185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1734032481; x=1734637281; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3Kc4OCgSvKd/epZOxEeCEHon8tDHQaK9PORYrELsJ0=;
        b=mEHJHb9uEEDhlXTm9822WyT7kpp8n+Oz7BWyBa8Dq0xuFScISXBQQTaeZOPbFqqaPx
         JxoORI/IhS214yfgrdQ/v3pKmIbmZ4VZl5c0y2pCiwqVAia6CtNGePWR9QYecO82YN3B
         Y2/d7TFwBz66AA6Ze+fE4Z2xpHINDJ4WyjIfCZW+5mwuz2qUhpFI/JtXt4BgyLVslKZC
         Lz1kyqW2THnXfz9pRnCI24LX3lnVwP4fvgPto+HU8kBBRjRMqmqYDXOJCyrjPwTf0aFv
         ryDEKVdpAvIBcEKLP4IDMv2jqVqDl8qtZNosv5JrX2pp00fWaTQtvsSaDrjIpEKNC/rK
         TRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032481; x=1734637281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3Kc4OCgSvKd/epZOxEeCEHon8tDHQaK9PORYrELsJ0=;
        b=biWwK/CFDVCSapse0wNvFtzSIq3PdT8bnxmLk+XTsW5ktg+ShbfTtb28XuB9qWXPUP
         AFjEyQ/3sB00i8VVmKGTQyH/udgYxA29POuM4N9njWUcN9dpovB38sR4NEO/q5wbuNx4
         M11rN94Jn7DTIUVrrQ8KYfRWsy6W/Iojl/RggLIxh0pArEp6rH+HhFJ9tK9UYuja0qBd
         6l1tnYxfqh78oGuhH1/9Xth8+HHzLOa5RQ9BkTFYXduBp4a2zncBLv3YpOuPsDrTiOgu
         k9oMdjjZ90zN9GYMDUvUgc44khHhH85NY5gvwKJSNdQ+9vOK+vUI7rZVmTC+cfYjXcGj
         lY2g==
X-Forwarded-Encrypted: i=1; AJvYcCXCFPVvCDl5uePISFzEGd081fNsivtuu+KYy+oow1oXl4jUwq2AJL34/MVGrz7UONf4PoCHlhoVWxZxYVxxhrow@lists.infradead.org
X-Gm-Message-State: AOJu0YyxfRNIU3goswLJwjCsVgSav4eIm+wkwFttat31MnsAGU6MYKUn
	NiAxtBOdzNRx3D2zpjSAvLlTOA0Volgj6G8xpPBK//BKJSvFkwFX3mOcO5bisI4=
X-Gm-Gg: ASbGncuWhd60yyOk/xo6Iz2IabQVG3f/cRBncJwgFdFuuYN9IqEdECHtvRTOYgrcJuw
	SBS25n2gjZ5ILYq/YXJbI5MESdEThzigVuJScvI7yRRwTNCfVKkIxyMyjUTRjaomL4FAcgv7FW5
	BGKOVnfNAZ8gxhkjZTp1AQ5+wDNV5bHhaI+SFJVBlHuf6l4977x2wOAZ/HK0Y7nTXS99Jf6kaxo
	Ms3esXck8X2e1GPjISuc4Fk/g5MlFqfqAwye5Xik2VIx0/aUACUXrbc6yLYgxAdqUeGom0JEK4R
	UgZFiXjNgYB9KHNmCXHC2rFHb/OxHw==
X-Google-Smtp-Source: AGHT+IEAIplt0z2RMr+HjydESxf+Hn46nEN6kxVZTLt1QJkSzwAdttK3JwjCrGJqs05d0XfX9mfmMg==
X-Received: by 2002:ad4:5c66:0:b0:6d8:9124:8794 with SMTP id 6a1803df08f44-6db0f6ebbe6mr22392236d6.5.1734032480736;
        Thu, 12 Dec 2024 11:41:20 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6eed3d22dsm162122185a.31.2024.12.12.11.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:41:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tLp3n-000000001YW-1idH;
	Thu, 12 Dec 2024 15:41:19 -0400
Date: Thu, 12 Dec 2024 15:41:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <20241212194119.GA4679@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_114122_904079_67C53D2F 
X-CRM114-Status: GOOD (  36.14  )
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

On Thu, Dec 12, 2024 at 06:03:24PM +0000, Mostafa Saleh wrote:

> This series adds a hypervisor driver for the Arm SMMUv3 IOMMU. Since the
> hypervisor part of pKVM (called nVHE here) is minimal, moving the whole
> host SMMU driver into nVHE isn't really an option. It is too large and
> complex and requires infrastructure from all over the kernel. We add a
> reduced nVHE driver that deals with populating the SMMU tables and the
> command queue, and the host driver still deals with probing and some
> initialization.

The cover letter doesn't explain why someone needs page tables in the
guest at all?

If you are able to implement nested support then you can boot the
guest with no-iommu and an effective identity translation through a
hypervisor controlled S2. ie no guest map/unmap. Great DMA
performance.

I thought the point of doing the paravirt here was to allow dynamic
pinning of the guest memory? This is the primary downside with nested.
The entire guest memory has to be pinned down at guest boot.

> 1. Paravirtual I/O page tables
> This is the solution implemented in this series. The host creates
> IOVA->HPA mappings with two hypercalls map_pages() and unmap_pages(), and
> the hypervisor populates the page tables. Page tables are abstracted into
> IOMMU domains, which allow multiple devices to share the same address
> space. Another four hypercalls, alloc_domain(), attach_dev(), detach_dev()
> and free_domain(), manage the domains, the semantics of those hypercalls
> are almost identical to the IOMMU ops which make the kernel driver part
> simpler.

That is re-inventing virtio-iommu. I don't really understand why this
series is hacking up arm-smmuv3 so much, that is not, and should not,
be a paravirt driver. Why not create a clean new pkvm specific driver
for the paravirt?? Or find a way to re-use parts of virtio-iommu?

Shouldn't other arch versions of pkvm be able to re-use the same guest
iommu driver?

> b- Locking: The io-pgtable-arm is lockless under some guarantees of how
>    the IOMMU code behaves. However with pKVM, the kernel is not trusted
>    and a malicious kernel can issue concurrent requests causing memory
>    corruption or UAF, so that it has to be locked in the hypervisor.

? I don't get it, the hypervisor page table has to be private to the
hypervisor. It is not that io-pgtable-arm is lockless, it is that it
relies on a particular kind of caller supplied locking. pkvm's calls
into its private io-pgtable-arm would need pkvm specific locking that
makes sense for it. Where does a malicious guest kernel get into this?

> 2. Nested SMMUv3 translation (with emulation)
> Another approach is to rely on nested translation support which is
> optional in SMMUv3, that requires an architecturally accurate emulation
> of SMMUv3 which can be complicated including cmdq emulation.

The confidential compute folks are going in this direction.

> The trade off between the 2 approaches can be roughly summarised as:
> Paravirtualization:
> - Compatible with more HW (and IOMMUs).
> - Better DMA performance due to shorter table walks/less TLB pressure
> - Needs extra complexity to squeeze the last bit of optimization (around
>   unmap, and map_sg).

It has better straight line DMA performance if the DMAs are all
static. Generally much, much worse performance if the DMAs are
dynamically mapped as you have to trap so much stuff.

The other negative is there is no way to get SVA support with
para-virtualization.

The positive is you don't have to pin the VM's memory.

> Nested Emulation
> - Faster map_pages (not sure about unmap because it requires cmdq
>   emulation for TLB invalidation if DVM not used).

If you can do nested then you can run in identity mode and then you
don't have any performance down side. It is a complete win.

Even if you do non-idenity nested is still likely faster for changing
translation than paravirt approaches. A single cmdq range invalidate
should be about the same broad overhead as a single paravirt call to
unmap except they can be batched under load.

Things like vCMDQ eliminate this overhead entirely, to my mind that is
the future direction of this HW as you obviously need to HW optimize
invalidation...

> - Needs extra complexity for architecturally emulating SMMUv3.

Lots of people have now done this, it is not really so bad. In
exchange you get a full architected feature set, better performance,
and are ready for HW optimizations.

> - Add IDENTITY_DOMAIN support, I already have some patches for that, but
>   didn’t want to complicate this series, I can send them separately.

This seems kind of pointless to me. If you can tolerate identity (ie
pin all memory) then do nested, and maybe don't even bother with a
guest iommu.

If you want most of the guest memory to be swappable/movable/whatever
then paravirt is the only choice, and you really don't want the guest
to have any identiy support at all.

Really, I think you'd want to have both options, there is no "best"
here. It depends what people want to use the VM for.

My advice for merging would be to start with the pkvm side setting up
a fully pinned S2 and do not have a guest driver. Nesting without
emulating smmuv3. Basically you get protected identity DMA support. I
think that would be a much less sprawling patch series. From there it
would be well positioned to add both smmuv3 emulation and a paravirt
iommu flow.

Jason

