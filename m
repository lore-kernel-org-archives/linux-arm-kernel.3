Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09717C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2YxfmSarHgpb5HO7sz/zNXl/cJmHFZ1E8d5kP4xEXI=; b=0H108KpDzr2NPDEJnnATiqYl+z
	XoidDiQo7YREmMQAMsp2817+zOqZR1mc+3pRZw7jABbK1D382WYpQegUQDJI1/RdJPyzIgOHYLPv9
	XM2krZYm0L9+Q53cCERgqBgdAY6Z4LiBepq2Fo/5J6ommPLcIYiZPMDGXl+dyaMFa1rBib4/kp9q+
	9m53WHi8Vs/n1uzQKPilXNj7AXiiUwsgYQec6JTUAGy/Z2olcDpdft6xpqX/JGgQyd36S14CIGB7V
	8QA7blFu2C25XiFXSnqSc3bv7Ir1ZliV5i7fvsnt/FFHq44snvd7X0JGAwAhsKkwXPoRfwfujWbtK
	J7zx6RlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOEV-00000002u6w-2wKx;
	Tue, 04 Aug 2026 23:07:39 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOER-00000002u6C-1hea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 23:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785882922;
	bh=I2YxfmSarHgpb5HO7sz/zNXl/cJmHFZ1E8d5kP4xEXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W0VwktCKoSSQVpgdNLkLAZweHK79azHkGFZRIN6itAo6aNsh+RGZl4Qu7HXWbFaFF
	 dz4CIbhIQ+BtHYOTTix2WBEzzrM4PggOvqMmlkZqu0IazIRpgcE08l/kX+mCF6Dvy4
	 yXiDy6MGeayqG0jAMD8mAQ8bY9zkobyNqzP7exW8=
Received: by gentwo.org (Postfix, from userid 1003)
	id E414840FCF; Tue, 04 Aug 2026 15:35:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E2E4540287;
	Tue, 04 Aug 2026 15:35:22 -0700 (PDT)
Date: Tue, 4 Aug 2026 15:35:22 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Yang Shi <yang@os.amperecomputing.com>, 
    "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
    dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
    catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
    hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
    linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <94c7988a-3ecf-4b26-b0a8-011bdc76283b@kernel.org>
Message-ID: <29edec61-8f11-b9b1-3df9-2a51815ee771@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer> <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com> <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org> <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer> <69f4cd9c-bd6c-4e5d-b8d1-a7be8408a57a@os.amperecomputing.com> <94c7988a-3ecf-4b26-b0a8-011bdc76283b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_160735_487015_D4F024EA 
X-CRM114-Status: UNSURE (   8.30  )
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


> That's really all we are asking for. If there is a measurable performance
> difference, great. Share the results or point us at them if we missed them.

Scanning over the patchset: It seems that you are using a special
instruction that is unfamiliar to me. Which processors support that?

