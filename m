Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC71C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E95ReJy9DE9GiIJH0l+XVPQUMS7fnh6eJltHCKDpl+U=; b=Np63hJfkx37N4YIDe2JH9QhnGj
	mhrr3QyltOfa/87h39cOdGBxXs6rhGaj0ds9nLQw65PeC0NRyru1L4jo2wa9WORVhNgU99XZNFNBJ
	7shu83Pn4lK0v422ugrV5/Rs322c3BXugm8Qdv3L99Y6BiV9oR6UWj6p8SL5CjkhZfnW+bQIDpkY/
	2RrNGorB3WNOwwLL3ywf51Ah7VzU3eUEMoUt172f1wODzeJxkVRGcmhM/zHQmnfwmlybiDAZudCmA
	9XiREO4EpLOnzdroYXrv5wUMPrSyBuyySVHKIixa6lr+EcYm1EuSBOEacyy3Zt3Ngy+tq9Voffp/n
	sSGU82ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIDr-00000002NIJ-0BB9;
	Tue, 04 Aug 2026 16:42:35 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIDp-00000002NHz-1u3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785860368;
	bh=E95ReJy9DE9GiIJH0l+XVPQUMS7fnh6eJltHCKDpl+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sHtfao+PlU9mdbJDyFXTTnhzclUtn67IfHvtbkzcR7yPuktwdDdUkvM8gE9gtKzk0
	 6OXCWy5Zu5lbkxQOuMb5sE0mAR7d2cLL89M9F3GEEjNGqIt5BWuBoVYQr+WrlzRTiJ
	 V/pySj3LduZjB5Yp2N5ezaq7qyzlSC1Yekr2Pfyc=
Received: by gentwo.org (Postfix, from userid 1003)
	id 928C7408CE; Tue, 04 Aug 2026 09:19:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 90FD040287;
	Tue, 04 Aug 2026 09:19:28 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:19:28 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
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
In-Reply-To: <anHuLy52o5S9Nlwp@lucifer>
Message-ID: <63ea8156-a109-b2a2-6d35-1c17ad7f1a9d@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_094233_507468_8130C05F 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Tue, 4 Aug 2026, Lorenzo Stoakes (ARM) wrote:

> Since this work seems to be very much arm64-focused, perhaps it's therefore
> worth looking at an alterative solution that's specific to the arch, like the
> one suggested by Mark ([1])?
>
> [0]:https://lore.kernel.org/all/CAHk-=wire3dzhHx=KiL_f5Rj0=1u9ustsa33QoR-F9-v-NU9Ng@mail.gmail.com/
> [1]:https://lore.kernel.org/linux-arm-kernel/al_DpFJFcmVhxpvW@J2N7QTR9R3/

Mark's solution does replace the preempt_enable/disable sections with a
rather hacky restart logic. It relies on a long preemable and postscript
to each per cpu operations.

 It does not remove the code entirely like the proposed patchset here and
cannot produce the same compact code as x86.



