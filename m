Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F315C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C5nG+xtG3hyYyQwRUQFGYH75JNuc0Lk0Ty5BqRmWNU=; b=LSSBh8PZexlimryl324MUCR/ln
	59WV5Ei7naRzRdRVvyWfnO0+xHJ5p7V2uyD2oRyKIF9wLIyOPCC7Qmded416sLPfbmisP3emkBqVV
	1fx9bL84v7xixbNBDL1OLNVxrDglvurWFtE8PtY5TA9HEnzUEbCBZm00h4vrRvQvlf1/R3B4Y5APo
	yDnXMJY2/XgqU3f3PSo3nSnmnpYxj3tcGMIUfKvKlkjbrqv7Fq7uhvpEP27zAtlxfXuD7iWAD3TET
	Ga5bX9+cXTZPkSuL4w7rGvuec+IyWho/FPpeLDROjkaMbCE/Bgwb3PwKfNHQqtSNKo4Y1Shm9n1rU
	+V0qNJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZog-0000000BVJt-2v99;
	Tue, 14 Jul 2026 09:52:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZof-0000000BVJn-3eic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:52:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FBCD601EC;
	Tue, 14 Jul 2026 09:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232391F00A3A;
	Tue, 14 Jul 2026 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784022760;
	bh=+C5nG+xtG3hyYyQwRUQFGYH75JNuc0Lk0Ty5BqRmWNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZgSMxxsh1Lu8MR5Z6WZ7OI+nq6F3YqTn9IBm2AINDs8o2Z/nh/SpZWcv4glu+VhPe
	 cXy87Qxg3XbvgFKPnL50ydX2ZmeXZ+Y2m0e04PAZRMRDiI7yd819Ia6OkzoYI4l8hi
	 bQ5nmUAEKOPB1JNlOSIgfbjVYFEy/Nt7TJrcZZrSwXI52rztJjb2qGdZlVK+Mik1C2
	 MqZlsgx86ioBdN1tVdskpyUDQ5X3kf6HF+H7N5Qp+yw+MWEZGk2dutdazlT0Q42W8G
	 2WBALzw60ZoYjzJMEjfOp8k80iBpzrMV5Er054iRnji2EAX6IYZOtyYaIq4WMAy0e3
	 LsRNlLUiQVPTA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
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
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
In-Reply-To: <cd5d0504-1592-4b48-89ea-1efe8aa57968@samsung.com>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
 <yq5av7argr65.fsf@kernel.org>
 <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
 <20260713194323.GC3133966@ziepe.ca>
 <cd5d0504-1592-4b48-89ea-1efe8aa57968@samsung.com>
Date: Tue, 14 Jul 2026 15:22:27 +0530
Message-ID: <yq5aldbdnbj8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> On 13.07.2026 21:43, Jason Gunthorpe wrote:
>> On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:
>>> I'm fine with merging on top of=C2=A0the topic branch and I assume that=
 this
>>> patchset is mature enough to give it a try in linux-next, but first I
>>> would like to get a review or at least acks from others with good CC
>>> knowledge or experience.
>> I think it is good to go from a CC perspective, there are still some
>> more items to fix up (like the MMIO) but I'd rather they be followups
>> at this point.
>
> Great. Aneesh, any chance You could send v8 with the remaining items
> fixed till end of this week? I will be happy to push it to
> dma-mapping-for-next for testing in linux-next asap.
>

Sure. You need this rebased on top of the pKVM changes, right?
Otherwise, we'll end up with conflicts when you do the final pull
request.

-aneesh

