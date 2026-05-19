Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B37BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHkXRgSpfCE3cZ1V0Db4Vo8H9DBcC8wfYFae8i+MopE=; b=cqcByFwyIVjBYbJNE8x/XqRNh0
	k2YUgBqvpQs/zCUAl0jOsE+TRCajKy809R3ITNlOQXRzNd8YYufo6fcyqg7Pvo8wlG7Bcf+vAHSMw
	uks/73LoMzhTuRLl/sgGBYQtlAOqzIYcjVvlHQmtJVZlERB8hS7iBTGBrbCbKbMdH7eiAqe5olULA
	2VKx9xjn+OjqgBZCiYRofQO2WYUzlqXs2l/jxlyefb89fbfQVFc3jUn5dU+VOvZvfalrHUHMzvfbx
	fwMMUqc6dXDXWfnHYASREJSqHXCZAoRm8EtnCUoqEqNzOWpYR7V35qTlpSAqEb+zMcATuOEolc1SO
	mucIKJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKzm-00000001kea-21HL;
	Tue, 19 May 2026 14:00:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKzj-00000001kdl-1xCM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E3F544493;
	Tue, 19 May 2026 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D58C2BCB3;
	Tue, 19 May 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199227;
	bh=3DPK2EbXv/3wsOl17AXXlVKobx6PME7rhn3Y2pD37rY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FJApOYnDwaielcOINdOz1m25oZHbpn3hiDJIO3zmg0dNyspugG9+kJWbUgDPzC6d+
	 /ckU7YijNm2/TPN+Hz9RYOAUzY4hFu0d+0bNggkC3U/bzYs/3cZmAwn1DyeZSlzZvx
	 dH1PeSgRGGCQHSlDRvsay4KTbEzvQ504Kg3+MSpbrx/nvn3fChg43T26iLRVkK7/gt
	 8rcqRCSQy5u6NoaNncNwcxb0/MwBCLyjuB/JnTsulV4dvriOnfy7Bt7IitbvfRRQ0X
	 vP67ZNbXn4wwSpMF/8KYnn1WmsOdTRVJ8wYY9blbr8Eu8xLzQ5d3DqyyGuHqTPib1P
	 /nStnaekQuhpQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
In-Reply-To: <agxolksC_1nfO34X@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com> <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com> <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com> <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com> <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
Date: Tue, 19 May 2026 19:30:16 +0530
Message-ID: <yq5ah5o3sdn3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_070027_544895_60B38DE1 
X-CRM114-Status: GOOD (  26.95  )
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

Mostafa Saleh <smostafa@google.com> writes:

> On Tue, May 19, 2026 at 10:29:11AM -0300, Jason Gunthorpe wrote:
>> On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
>> > On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
>> > > >>=20
>> > > >> What I meant was that we need a generic way to identify a pKVM gu=
est, so
>> > > >> that we can use it in the conditional above.
>> > > >
>> > > > I have this patch, with that I can boot with your series unmodifie=
d,
>> > > > but I will need to do more testing.
>> > > >
>> > >=20
>> > > Thanks, I can add this to the series once you complete the required =
testing.
>> > >=20
>> >=20
>> > I am still running more tests, but looking more into it. Setting
>> > force_dma_unencrypted() to true for pKVM guests is wrong, as the
>> > guest shouldn=E2=80=99t try to decrypt arbitrary memory as it can incl=
ude
>> > sensitive information (for example in case of virtio sub-page
>> > allocation) and should strictly rely on the restricted-dma-pool
>> > for that.
>>=20
>> ??
>>=20
>> Where does force_dma_unencrypted() cause arbitary memory passed into
>> the DMA API to be decrypted? That should never happen???
>
> Sorry, maybe arbitrary is not the right expression again :)
> I mean that, with emulated devices that use the DMA-API under pKVM,
> they will map memory coming from other layers (VFS, net) through
> vitrio-block, virtio-net... These can be smaller than a page, and
>

Don't we PAGE_ALIGN these requests?

dma_direct_alloc
	size =3D PAGE_ALIGN(size);

iommu_dma_alloc_pages
	size_t alloc_size =3D PAGE_ALIGN(size);



> using force_dma_unencrypted() will share the whole page.
> And as discussed, that leaks sensitive information to the untrusted
> host.
> I am currently investigating passing iova/phys/size
> to force_dma_unencrypted() and then we can share pages inplace only
> if possible without leaking extra information.
> I am trying to get some performance results first. But the tricky part
> is to get the semantics right, I believe in that case those devices
> shouldn=E2=80=99t use restricted-dma-pools as those should always force
> bouncing. Instead bouncing happens through the default SWIOTLB pool,
> if not possible to decrypt in place.
>

-aneesh

