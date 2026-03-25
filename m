Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F3A109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZIRaXPgrY9XO92K3r1yFSjUBUwQqvuFyOUdxlhkPAQ=; b=xXQcGhDEVhHKGxCHchok42AmqJ
	lQsDEJ0Ng2p2iPAPLHD7PJdV1wNXfEOIooAfbZsXg/Ea6lHjBy70GYT914GSQGBDmuJwv1fCWuJr0
	1iNzKu5OXcGP7FgPmLj3F6GI1IxRDoWFJFJxqJFxru+w7/3ltjfpQduqX2L3FYq/6W6jb9hLcnQRp
	6WQapMWmK+rmlVTME6yZ2MM+5b0cR05+W9kUK4MQ9vKsnXqQKHxPTfOC1mhYGAEthHcN93phwQRzM
	dGMrnwlxmQPeYV+kjepbgVcWKTedlRgEt3WuSjtEiRhGDDPHWjjCxBtjZHIZUfDi9a9UJVZKC//+g
	iC0F3eTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QBY-00000003nJ4-0XRG;
	Wed, 25 Mar 2026 15:30:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QBX-00000003nIy-0tPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D375600C4;
	Wed, 25 Mar 2026 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47386C4CEF7;
	Wed, 25 Mar 2026 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774452617;
	bh=ipt0qF+CvItlsG5F2muWd9cfvoSnSIi7qZEIATPqnBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hg/tY5ncFUVkWwXBifZuAFbHCNb2uSb6fLwBzSq9v4Vq/c6E3Z4Y6MVkEn5ck4V1G
	 04hrNT6rzTHoPYKeRMOitF7vr5q3+6df2rnrVAzuH3rQM3W0mY/i8LLuqtWbxWF7f5
	 x+ZWu10/YhLx82NmzA2rS4bnS6g66aT0uS1R67R8=
Date: Wed, 25 Mar 2026 08:30:16 -0700
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
Message-Id: <20260325083016.a32095bea3f04488a7c9005a@linux-foundation.org>
In-Reply-To: <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
References: <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
	<CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
	<a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
	<CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
	<d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
	<43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
	<e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
	<86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
	<e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
	<e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
	<e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 25 Mar 2026 15:06:26 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> > > Sorry unclear here - does the series need more work or does a follow up patch
> > > need more work?
> >
> > Follow up!
> 
> Ok good as in mm-stable now. Sadly means I don't get to review it but there we
> go.

Well, this was sent 6 weeks ago, at v6!

But please go ahead.  If review is very bad, there's git-rebase
(happens sometimes) or some followup fix and a minor bisection hole
(happens a bit more often).

And those followup fixes will trickle in all the way out to 7.1-rc7,
via the hotfixes path.  This happens a great deal - about half(?) of
hotfixes pertain to material we added in the current -rc cycle.


