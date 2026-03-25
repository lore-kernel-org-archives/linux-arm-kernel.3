Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D25109C033
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNS3L4Ed2ePfUxJ3Mt1m9TTP9IpJkzNhuIFw0PohGQY=; b=E4gCTJahBPJ2ZS7zfdRD6bJoIu
	U3BSCTkjQt04U6FHEul9JfdqoqkrO1GhhX6Cl1IsqD79d39m5UjFZPPXjvFDKx4QiOJ3dtoJBHoAZ
	3fRf8v7yzOCnfXR8UYj0ZtzMSvsdoYAgslg/8GhqJ8/4c/NXTJd0spfW4/HmR60r+8YsZ0PASQxAU
	X0ym+4uNXgCp//1ink91ahln/mFZhEBF2WgSKepjqYehwYxgsCZBPtCv/TKi8w6fdIpEEipPxGgtJ
	s6cfPcwpT22T68e/jgYnIFPKY8DLw/EGwZacs9KIrtOH6GTNUxumw8Q6pWp/huEyl0YEjPkC8pzcR
	JS9yrRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R0a-00000003sGn-1Vte;
	Wed, 25 Mar 2026 16:23:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R0Y-00000003sGI-0Q0V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4145F44091;
	Wed, 25 Mar 2026 16:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809F2C4CEF7;
	Wed, 25 Mar 2026 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774455781;
	bh=HNS3L4Ed2ePfUxJ3Mt1m9TTP9IpJkzNhuIFw0PohGQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EcJrc4jXhkjS1IwRHrJQpXTUU7493bM0vTlSie3lftXDQPec713pkTE7npY2RoUvd
	 Tbbtvgj7VE/dIFZIKnm6tg2E1/olfufGTh7Y/WK+x2xg5mzyZ5hCNzVDAHimyvzZsJ
	 VU+/mDbfKcVc907CHicbk8Ai6wZVwCNzYZH7K99Q=
Date: Wed, 25 Mar 2026 09:23:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Barry Song <21cnbao@gmail.com>,
 catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 dev.jain@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-Id: <20260325092300.9008e605ed5550ce4935638f@linux-foundation.org>
In-Reply-To: <af9d8a6a-074c-412c-ac5e-3f0dadde3e7d@lucifer.local>
References: <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
	<CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
	<d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
	<43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
	<e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
	<86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
	<e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
	<e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
	<e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
	<20260325083016.a32095bea3f04488a7c9005a@linux-foundation.org>
	<af9d8a6a-074c-412c-ac5e-3f0dadde3e7d@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092302_182408_2BD3E518 
X-CRM114-Status: GOOD (  11.88  )
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

On Wed, 25 Mar 2026 15:32:50 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> Really I guess I'd like to know the timing of when mm-stable is taken so I can
> know the deadline for stuff like this.

Yeah, as mentioned elsewhere I'll add some words into the series file to
try to describe this.

But the start of the migration is quite variable (-rc4 through -rc6) so
I'll aim to keep people updated in the weekly "mm.git review status"
emails.


