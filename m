Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA6CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2vFw2b6Dq4kXYpDSqPPl/I2tXbfPjM4tacHe5F7/ME=; b=q9p8Zvjbk79uYW7PbTVxMFphWk
	6m36X7MfrglsONJKSbT/EWyopmopxgHDdUKhh7M8jW2S+vRRSarlPKbFdEzUOYG6xu9HfCZDGldJV
	3Ej91Dfq7WGHBnQsop5NroWuGfgHGetFV2md+8Ee2ctpTf58Sex5uQyw7Kc8s+H1WwidnTG8qHJlr
	mnDt+ZwgSzuyPPEXA67QOhb7XuLZ6LQiLLxrj5wv1Gl4z8qyNoLYK3L2XK+UCkLe+ucAGZTQoEwRB
	6hA4oJnY92LuVgdN63wiD/FE2t66ma8rWLuwY89c5nc0Rpg5IZmF0gHJRkPpp9NyK9KvbcsRdJ26G
	Jsexon9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUH1y-0000000CIPx-3uMO;
	Tue, 02 Jun 2026 04:47:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUH1v-0000000CIPe-1lk6;
	Tue, 02 Jun 2026 04:47:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A79176001A;
	Tue,  2 Jun 2026 04:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867101F00893;
	Tue,  2 Jun 2026 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375626;
	bh=w2vFw2b6Dq4kXYpDSqPPl/I2tXbfPjM4tacHe5F7/ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVUczLjsw80yEWH3gu3NkaGjxurIFsxviLifgTASl5KmyxzFoZ9D6BRbFnC647FHj
	 lx/XsyIDDrgeNc880H1ZCzZ6k2GAkGqLt2HPVSKtCr9mjn6m2DCwScX7GkN79pS6Kb
	 Ybu4ua2edqgSU8v2FiaC7J5DsTHfum101oh9NnXGGFgdKNTpHz803fqOarf2Aq/REj
	 rrFf4M6W83xFQsgAsvLEXmOIlSUp/imXkfYWMxxsDexeQ3reNFAuz1/La1vSHOW9B9
	 ecfNlu1N+o672xehcI60o8JlzLchfcXr0Hdq8pu+MVpFykxKhmlLGaQmBsGApTcQm1
	 IWYYOlv9b/uSQ==
Date: Tue, 2 Jun 2026 06:46:55 +0200
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v3 5/5] sparc/mm: drop vmemmap_check_pmd helper and use
 generic code
Message-ID: <ah5gPx1TuEH1wFzC@localhost.localdomain>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-6-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084845.3792171-6-songmuchun@bytedance.com>
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

On Mon, Jun 01, 2026 at 04:48:44PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the sparc copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

