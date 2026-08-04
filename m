Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1218DC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i1mGJ+FRQRfIxKQvXxnnfkifi+5HFhjIAJsj6nqa5k=; b=wyv5ycWfYw2Wt2VEJSekQRFGZU
	1jw2b7YaeglAUshohIvRPnZx2NIyfv0IdUj1d72iaK1+d+SGqxvS3DynECXuL87wAP3Ovj0Tm7Ko3
	ar4gYKiyPxWenmK/aNDy32I5B8Q40hSzm4K5NQ4KNiS1RJJEa4b7fpo+Th76U81tIsaIjleQgYnRP
	g1ZzvcO2Htl0J6gGgxmdthUM3Kk/esYhUsoit/Hl1xLB6rgAK+j+4YpvQPULeoWPZb6g73EdVQqGk
	ZWKj2CObsvtVG1Nj4i4kwRwBIhBpao54gGlt6hzstFfZdaBX9vZohiMffXiDTzrIi3sWmMVDTgWST
	uI3Igfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOJK-00000002uNT-1Anc;
	Tue, 04 Aug 2026 23:12:38 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOJH-00000002uMq-15oK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 23:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785880881;
	bh=4i1mGJ+FRQRfIxKQvXxnnfkifi+5HFhjIAJsj6nqa5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=at2yiKLYfZC3fVakZoWLhCksz0PMrkI6/d0TYKBPoXpIGPtfNc7LU+ViWv+A6CxMf
	 GC7DQy0jW4XLySRIheErfnG9B0tvk7yE/mUQWds+3h9H8PtzC63PmrbXcK6D3O7ooq
	 2NcakzJJtfeuENJUfR891WT/5jvSHVkQBfAfP5dE=
Received: by gentwo.org (Postfix, from userid 1003)
	id 2788540E6B; Tue, 04 Aug 2026 15:01:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 264D540287;
	Tue, 04 Aug 2026 15:01:21 -0700 (PDT)
Date: Tue, 4 Aug 2026 15:01:21 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
    akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
    agordeev@linux.ibm.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <ea268481-d584-4744-99d6-0b05aade7d5d@kernel.org>
Message-ID: <b4b79f6b-e09d-bbb1-2181-07e756e849bb@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer> <63ea8156-a109-b2a2-6d35-1c17ad7f1a9d@gentwo.org> <84b31836-1d10-4bec-a469-468b91fd4645@kernel.org> <9f146ce0-4adc-0c00-a2d8-c01b47edc9d1@gentwo.org>
 <ea268481-d584-4744-99d6-0b05aade7d5d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_161235_323044_32F9ED22 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue, 4 Aug 2026, David Hildenbrand (Arm) wrote:

> >> If the proposed solution has a significant benefit over Mark's solution it could
> >> be discussed as a next step; and it must be backed with sufficient data to
> >> warrant all this complexity here.
> >
> > You cannot accept that one instruction is faster than the same
> > instruction prefixed with another and something else at its tail?
>
> I am pretty sure that you got exactly what I meant, you likely just don't have
> the data to back it up.
>
> Proof me wrong!

Well you seem to have alrady seen the benchmarks that we ran and are
running. So I had doubts on your sincerety with this comment. Seemes to be
be just there for effect.



