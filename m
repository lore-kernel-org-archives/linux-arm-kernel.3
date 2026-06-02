Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94FAC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBcSho0hyTBOiz46tMOdOloLT1LDWsfZliq97z/1xao=; b=AkQUGnJaCPNlRUfyLvr19iy0Zn
	oFdAdgB0jVkxU6D6tcwwwvbndzI5GcEsBqzIdaxOi1xGGTkjRg07MSF+2LdnT8Iebn1bSskIozeK5
	z5HqwuGKxbxL7yKOjJ0BVj5iPWlE6WpfbD0C8sdWDqujH94qVPfZvV++ZRBOnW1DtAVPBVbJNYOeo
	b5MwdfPuSZ/NW/MC/aw+ur7gQeXHh7L7TwaAYNH+3bYSKtKC6imX7E9PPHdCshTGnY1RGIsF33iC7
	BAZztX8v1ywGKyquO7DU2jPVOQEL+EFUv8zDerg8I4gVZdbzb99Qojbns0iR4MRj50H4dGozecxE9
	+hFD4FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGzn-0000000CI4l-1dcg;
	Tue, 02 Jun 2026 04:44:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGzl-0000000CI4H-1Bbu;
	Tue, 02 Jun 2026 04:44:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA99243951;
	Tue,  2 Jun 2026 04:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F821F00893;
	Tue,  2 Jun 2026 04:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375492;
	bh=HBcSho0hyTBOiz46tMOdOloLT1LDWsfZliq97z/1xao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dscgPlENCGbnky2yH/Uf26BENDpdZmCNYagwcRFJUhTkMydO+/0JasfnOfb6k/Pz8
	 5Kzg5CgZ3DbhA3mk2MbFQw+6FBTCNen++P5Ul6oWqo4nLZ0F8LX+Or0ibTfPSHM5q7
	 VfxD+jIYyPQaIgwUc0Qq+IGRrA8unrZIUZ/goWhu4AnrDEtaHvsU8DR4APQe89ehJI
	 Ef7lCvRcfISQj6222jsW7gGQ3StuP09wXeRJcybPZyOM3plqWfZQkRzqMEQsgXqOBp
	 lYD3IJ9ivvNM271iJK88fZ/7GtgwWeYa7TKfKYoD+b1skZ4AZdek6Gtue2J4+n5NIg
	 jja0YigGJim0Q==
Date: Tue, 2 Jun 2026 06:44:42 +0200
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
Subject: Re: [PATCH v3 3/5] riscv/mm: drop vmemmap_pmd helpers and use
 generic code
Message-ID: <ah5fusGeBmwsZuIm@localhost.localdomain>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-4-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084845.3792171-4-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_214453_344409_9812FFE8 
X-CRM114-Status: UNSURE (   7.60  )
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

On Mon, Jun 01, 2026 at 04:48:42PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the riscv copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

