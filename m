Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BE1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0rbd5r2XPU85ZjN9Z8MDWtjzmRcNTYnxCurh+UMIug=; b=dxKOE2vNhw7DnCxshAYSakdJnF
	fvlbuBNm7QaeVeimB2EGrHdlpGzSh6sXi6hRbe5ojsB0ZmMdY2LjGcFcnMHMVYKH/GHfeKSQZktNl
	IJglKpjzdFjucD5el88PURIG1Pue7kqZctN7UkbV66o/M1036jYJneut+x8XozklplWrr03Hlb1X4
	kBUFzld0NaXj/KdJUzvD94mwr/jp/UZ7TJAt621i1tD/onsEKM1Tx4y5yip0GRwFpCdFx/RR9SyU0
	Tv4bffLwFnutXpqcIdiPYhCMPkcr8mvbrXy1wSuNGzNQitoL9XAN3YOivlBJ9WNzDN5WU346U/03N
	4l6aEzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKhk-00000001hMr-0C0R;
	Tue, 19 May 2026 13:41:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKhi-00000001hMI-0SWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:41:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso38a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779198108; x=1779802908; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b0rbd5r2XPU85ZjN9Z8MDWtjzmRcNTYnxCurh+UMIug=;
        b=Or1GdQU8tUxQpjyXo2M7irm8SP4iRq6PC+icIpbYLaruMee9q3aS3VB4AkbGnR3Dfm
         w73wQusN6xgaPlH0id6iClxRtixBnqrIwHl1NmLy08DtOsNemGtnrlPyu7uT4zpZlgYm
         8Zet6GwfNGftvhMsPJX9Ao/2LXt2QgmMH9MebRElLlI+/GkUbffh8ptVG4hINt3F87Hx
         e8eMFgFAFsnMxI3H0Df1ct9sgg/osl4miXpSn2OX1CQdsbQfP+Z+feUQQ50SAWXAv4V5
         bj+rrCMbN3RZXeqJIVxf32PxjnIkrbto8d1kbzXF7TTlIS8aF/cwV/4VgY8GtUttNxho
         BzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198108; x=1779802908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0rbd5r2XPU85ZjN9Z8MDWtjzmRcNTYnxCurh+UMIug=;
        b=mx4LRGEbOmDnDKN9jci81cEwnpO+Ed9oGe7g7vb2Z4iSkgGnAmdj7tn6pQRsR+EpMJ
         fsHk7MHCTa57YanRmKJeb9JjCEwAwKqyNX2G1ysKqDmLCkD3qWGxa7ua5QdyBl3VJFIQ
         mcm00VH64m7scTAP00f/HITe/OLnmA9yqtWGK/yKwy+m/SoO6w4ltfO/5kcOmN9GvRbg
         /BnzZF+LsA905Nz0dj1bPoUS3BYWMjWjPHUGgvmk/WyrV33pHtnNZc7JzqRnOpsobZVP
         B7JWb7JRjW8S8LeFwxh3tWWGDfHhT1yvFUMJ+oXMGHgJzDVmCQr/xgv+KQkYgouLRkUG
         eO+Q==
X-Forwarded-Encrypted: i=1; AFNElJ97kDOI38hE2VwvLGJ/T8WPYE6yWOE2RIKVfyvRu5mGLGGBg+Ta7kinc0YHVimDPIlBOXJFqkHMRv0avtO6wjLv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3uNs3Gy2ODOwS3RXm3sdY/GcR/IuoKDHldYf/zQLCxE2BgIbx
	UVZC+exjan4opL9OiPnC5nvenEx0/sGRLqz+taSrAbYzvB8gAllAV33/qql5VC60jQ==
X-Gm-Gg: Acq92OFJt547/Rt3h47TR52cRSjArdiE6GYW9DdSbPMqGfYKaVX20ZWrQySHwdi6sdI
	gSRBDTxIeZi1D8pA8O3Ga35Wu/W0xwPI2llRGNOIuZrFCTa1kYIltibPta8+J1PkSD8eVTtHyMH
	IgP5hF9jvKGpg51gWraPyiO0QY1iedx4Zkai3OUx2glYE/1XyeqSEvbZaQfmBy3PvsqEXbmVWB0
	N7RFUgJF3dLOzTPZLhx7X3KTOTHv1w1KZcgt7LFIKbccb8AMOlAEfk0ygLSwuW1CS/YaV+F6dSs
	ScWbHqTU0weG/sEM0rG4/kstEC/PgQ3L9rY3NvZ8M+mroTD9f54IC7kIeQws04S1g2SXuCn3ygs
	U4TDsyLaPAJ/iNW6zP9laTzJP0Rf5F8096uy/H/bXrZki7N7ooeC3ohjqTpY6Ydoyrt6zAwiuoz
	C8f8HaiZ6nmbXk+qg/eMFQUTJ2IstCjC0kKD6Lo47ZkCHEB2PunS2upGkPXYpYsFWX7H/Fl1BwO
	ok=
X-Received: by 2002:a05:6402:21d3:b0:672:9c8f:910a with SMTP id 4fb4d7f45d1cf-6848a7425fdmr177638a12.8.1779198107616;
        Tue, 19 May 2026 06:41:47 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ded942sm705903166b.36.2026.05.19.06.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:41:46 -0700 (PDT)
Date: Tue, 19 May 2026 13:41:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <agxolksC_1nfO34X@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519132911.GA7702@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_064150_168617_2079008E 
X-CRM114-Status: GOOD (  27.41  )
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

On Tue, May 19, 2026 at 10:29:11AM -0300, Jason Gunthorpe wrote:
> On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> > On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > > >> 
> > > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > > >> that we can use it in the conditional above.
> > > >
> > > > I have this patch, with that I can boot with your series unmodified,
> > > > but I will need to do more testing.
> > > >
> > > 
> > > Thanks, I can add this to the series once you complete the required testing.
> > > 
> > 
> > I am still running more tests, but looking more into it. Setting
> > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> > guest shouldn’t try to decrypt arbitrary memory as it can include
> > sensitive information (for example in case of virtio sub-page
> > allocation) and should strictly rely on the restricted-dma-pool
> > for that.
> 
> ??
> 
> Where does force_dma_unencrypted() cause arbitary memory passed into
> the DMA API to be decrypted? That should never happen???

Sorry, maybe arbitrary is not the right expression again :)
I mean that, with emulated devices that use the DMA-API under pKVM,
they will map memory coming from other layers (VFS, net) through
vitrio-block, virtio-net... These can be smaller than a page, and
using force_dma_unencrypted() will share the whole page.
And as discussed, that leaks sensitive information to the untrusted
host.
I am currently investigating passing iova/phys/size
to force_dma_unencrypted() and then we can share pages inplace only
if possible without leaking extra information.
I am trying to get some performance results first. But the tricky part
is to get the semantics right, I believe in that case those devices
shouldn’t use restricted-dma-pools as those should always force
bouncing. Instead bouncing happens through the default SWIOTLB pool,
if not possible to decrypt in place.

Thanks,
Mostafa

> 
> Jason

