Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52487D3A67A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5/m98SCsuWyhGETBfSTsJ23RKI9RIUIQKPTQpndJ3w=; b=Y5P464mblkHFIgilIyeNtMHb3V
	bIthek3YaVrSU4fRAB6fP//CjfuJ2f6RtJyv8SXDIFgVOE4AQn3KBhy0FHkQAQY+hfVDJMh9Fi4RV
	QoXgtWkXeY8MjA7BCSxjO7YLpGbPoluPqkDbtBIVoZtvHVKexB6Rrb213S3DFkbX9AKXB+vRv2Juy
	mvNOgALTG7wLiNRamPZXNJrsfdj4BVmQRF2LXAxenHjyEoN6JHiTXxmEs0BfYo44/kyi+H8ib9u/0
	aRz0Ej9GHXNDjMmPH/oH1uq95THD0HQzurIiJqXddWA40E31H00j+mO7MbKSdvAXBF2VcyE48+pW7
	Snbq6e9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qjp-0000000FSsH-0uM9;
	Tue, 29 Oct 2024 18:14:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q5V-0000000FGqS-405o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 239B0A43130;
	Tue, 29 Oct 2024 17:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76539C4CECD;
	Tue, 29 Oct 2024 17:32:58 +0000 (UTC)
Date: Tue, 29 Oct 2024 17:32:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <ZyEcSCuxYGylmDCa@arm.com>
References: <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
 <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
 <1608957a-d138-4401-98ef-7fbe5fb7c387@suse.cz>
 <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
 <ZyD5iXikMzotl9mU@arm.com>
 <da15a72b-c1de-427b-a764-0ebbdd3f6a8e@lucifer.local>
 <ZyEL0s_qiyAYURR2@arm.com>
 <a050599e-6d43-4759-b08c-d37c0d28ce0e@lucifer.local>
 <ZyEVHy-767RfFwh_@arm.com>
 <2759d754-9bd7-4bc0-a4a3-42f733fb2596@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2759d754-9bd7-4bc0-a4a3-42f733fb2596@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_103302_083511_EF6C3714 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, Oct 29, 2024 at 05:28:49PM +0000, Lorenzo Stoakes wrote:
> On Tue, Oct 29, 2024 at 05:02:23PM +0000, Catalin Marinas wrote:
> > That's what I meant (untested, on top of -next as it has a MAP_HUGETLB
> > check in there). I don't think it's much worse than your proposal,
> > assuming that it works:
> 
> Right sorry misread. Yeah this is better, let me do a quick -v4 then!

Thanks!

> Cheers, sorry pretty tired at this stage, was looking at this all last
> night...

No worries. The way we handle MTE is pretty convoluted. Happy to
simplify it if we find a better way.

-- 
Catalin

