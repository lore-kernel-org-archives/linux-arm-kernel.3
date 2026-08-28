Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01496C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzizNchr6WnEaWsbe0WIg1KOHaAgm5LlG9gDnfa/fI4=; b=l8FlC1h4g7+Pmd80Ho9qg9BSfa
	46nvOY6eyUxJVmcf0IOI64UivUDto7HdR0xOR/Jl/OXumIfq1fQDGxcxA5AP8tH7gv/TJRQxmq/Iw
	3/dUq0ocXppGfPXYZrVjAZii7BjCFlkf0QI9phcaTt3Aiq6VX0LPvt/5j3rJmdapFseumdll0a63J
	2l2oBbopkbN879KeokSVHOQmU1LWaaGMTwpztdDoDTk0WU1eirA2fi9374yoXuZtgb7PpC1yQJIWs
	N7EOkhrCJc+vxaLv+JDRSExlyn2kDmMu6gkknFQ+PRuFGc+ap3NK8/8SugZtWkzWk0bF5fKYqTtjZ
	J4xNBGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x012G-00000006INg-37kp;
	Fri, 28 Aug 2026 18:10:40 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x012C-00000006IN4-1OXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1787939888;
	bh=zzizNchr6WnEaWsbe0WIg1KOHaAgm5LlG9gDnfa/fI4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hfv9UXjPmOUtgcQtvb1YSLWhrJEmRWTUDHoGn35sr22HLK99gkqUmrIQgnXIe74tf
	 c0ms1s+RL2mYKdzhKgzGn3fjvGc9NHIm3aGHQszNLp1xf8fTY9ZP3JGn6hiPTu9ui/
	 nNhN5IWcKtnHfyP3r9d88f8jc0Wnr1VqtKqIcHyA=
Received: by gentwo.org (Postfix, from userid 1003)
	id 4BCC14046D; Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 4927B402A5;
	Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: artem.kuzin@huawei.com
cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org, 
    ljs@kernel.org, vbabka@kernel.org, linux@armlinux.org.uk, will@kernel.org, 
    mark.rutland@arm.com, liam@infradead.org, rppt@kernel.org, 
    surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    wangkefeng.wang@huawei.com, panov.nikita@huawei.com, 
    yang.shi@os.amperecomputing.com
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
Message-ID: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_111036_395361_6ABD7B5A 
X-CRM114-Status: GOOD (  11.57  )
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

On Fri, 28 Aug 2026, Nikita Panov wrote:

> There were several prior submissions with some sort of replication
> for NUMA systems, including one from our side for the x86_64 platform.
> In the last couple years, several research articles related to solving
> locality issues on NUMA machines through replication emerged as well.

Thank you for this work. This aligns with our efforts to increase data
locality and the performance of local data access. Yang Shi has a patchset
that introduces similar code to be able to map partial virtual ranges
differently. His code may be more mature and I think these mechanisms can
be used in a straightforward way in future iterations of your patchset.

If we combine our efforts then I think we could be rapidly come to a clean
implementation that can be merged.

This is an obvious signficant performance improvement that can be readily
seen and that is why we have the variety of patchsets being proposed over
the years. As ARM64 matures and is run on machines with larger core counts
the urge to have this increases.


Please see Yang Shi's patches. We can provide resources to push this
functionality forward and have seen significant performance improvements
with earlier approaches like this. There is significant customer demand as
well.

https://lore.kernel.org/all/0344c559-1959-4531-9265-d5a5180eb7cd@arm.com/



