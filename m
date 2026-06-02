Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C373BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI1EMaQf2aC+jwKCogVgIAXfxFKnj7BpW+hiYAKrFZ8=; b=CRb8NUtqUxP1OnDTCp0IlJ0phd
	+ox0WqX4Syirv4odmNQFxX9+UIiwOj/wsSDGCvOFT0yO0Mlf7HGUgof7gNx648/RopkX01G9Ck015
	yePQS+UFs7qOvYiOLpLwRYOkkQeNb09H4/MY5Vge3Yt/UCSgD71A7apPmHcOKHQ8KWkMbzUQqX+zj
	cjqO4FuJbm5Aovy6hXvM2IXnITfSpL/eXTTSZL945l1pGu/eN4871+Z1YGhdKdLQ3cMp78EkPaIH9
	CeYv7BHp5EIntg+PqtGdJfYTQ5/QX0su1fG3RzlW0ap53uFIDY0FZagW3zEKRnh1MVh+/GzxmuXfT
	psrARlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUH0Z-0000000CIEX-2tAk;
	Tue, 02 Jun 2026 04:45:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUH0Y-0000000CIEF-1osp;
	Tue, 02 Jun 2026 04:45:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC563600AA;
	Tue,  2 Jun 2026 04:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FB71F00893;
	Tue,  2 Jun 2026 04:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375541;
	bh=RI1EMaQf2aC+jwKCogVgIAXfxFKnj7BpW+hiYAKrFZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m+z0zlI4cyMGOnMErPfrIMqf0iWtdk7EX1MfOrHUoTqiO7tPcBlCZpccxp8Un4k54
	 d2qBnpIBm2HfPas5jkKo+5CiqJTc0hHlU6AGKeMoGVU1Q7onXg6zaSw4wfyk+8qynC
	 fOpFEFW8m8wmylq4C3Q2V2uuIW7bdmjx3cp2g6nLNRMD5/JGUisgSZxJcEUNv0i5ei
	 bBOxMYGMiY2f/W7BXDrfjO7bVl/eWwFhDqSgdpRZjbfGCWHOr6ep2sW/mNsYJZ+kRn
	 AAgXzr10EYrOk7kJVfNJWscoQxhNKbyolztYkQYSqJyOsapQn/9pfNt4IyVsGxoWUr
	 ABHGwIkedbhLg==
Date: Tue, 2 Jun 2026 06:45:32 +0200
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
Subject: Re: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and
 use generic code
Message-ID: <ah5f7NlrmO0bw-pX@localhost.localdomain>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-5-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084845.3792171-5-songmuchun@bytedance.com>
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

On Mon, Jun 01, 2026 at 04:48:43PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the loongarch copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

