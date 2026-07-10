Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C478C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ+ZZjoXshQwp4HjCw3hwahYLU+lQJ/F/RXGt07TIgQ=; b=GEoos3RBlfpsYpxV3H7Qu3bGEN
	kPVkDnOBZVnzD5R9djB7LySNIeQlDkNImv3nwS3jDU4M3Sxl1Ib1O8vlwr7dCx3JUOGkoVUX5/dhY
	qvY9gSXybRC6t4mrEmpVI2VmGcYwA9n2GWWEMj7TuKMIeUGCsesf65mNLAaHaid5IsN6pkCJGYk+O
	iOplZ5wF8foed1WQ3rjkLk9lNkRYePoy2ukXj8lBnyUEgXOqSItCx6c+0SIEzv8dk4Ysi8aiugsIe
	UlYsw2y+JBSUwd5aprQeVKm+74b2gfMRcVSEvHL2G+9pldwAILCdKcPCV+2MGPQYriv8XtkH1OHl/
	eHh12Byw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAnj-00000004xYl-3EU2;
	Fri, 10 Jul 2026 12:57:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAni-00000004xYZ-1XVh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB2560052;
	Fri, 10 Jul 2026 12:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400BA1F000E9;
	Fri, 10 Jul 2026 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688273;
	bh=GJ+ZZjoXshQwp4HjCw3hwahYLU+lQJ/F/RXGt07TIgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LZynFH0m2Au0GulWeBOL9Se7/aaURATREjA+Ms9gJ6cf6EtMIjnSwTCzlx6N02XnT
	 dmeQJC81rdCvri3euXeoAfSFGRC9CIcPElPxCiLeWREStZCOdOcBu/+qjU0yCmT0QP
	 enmkG7dOtBv4nDyzVsVDneapP70gJ5rRL8UmcRvS6VjvhQn6RB008l2MD2l32xfGXG
	 5cYGi71NQAngfXSfymfzcPQ2MPJVVaecPUhTIsgTQH82cuEl6S9WmxjFwNuGAgHhNP
	 P2e2TfAIlREWpipjFo8pinavN75nYQAV2KudNOomqBE4nuw3/+drShM6jwi7qLxDtZ
	 ksyTR9LLiW0jQ==
Date: Fri, 10 Jul 2026 13:57:40 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
Message-ID: <alDnFGncVvcjsvTg@lucifer>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
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

As per Sashiko, we need to account for x86's slightly bat... interesting
ptdump of non-init_mm page tables.

The fix is to take a nested init_mm lock in ptdump_walk_pgd(), which is
safe as nothing depends on an init_mm lock prior to acquiring an arbitrary
mm's lock.

I think this could potentially be sent as an entirely separate patch, as it
doesn't change what this protects against, nor the x86 CPA patch, both of
which stand on their own.

Cheers, Lorenzo

