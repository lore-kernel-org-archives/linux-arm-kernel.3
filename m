Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE1C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKWps21C2vpIWj/xL3lTP3KBe8XdUi+jDN1FX8vkfyI=; b=mgp4HZVrXDQXY+MMT54a/T3oIR
	X3t/6xv3bLoO+XGrRhuq0WTFs82j0yi/X+BPeZqybvT0UHo9O+e3lVwwxmLoKsY6kWNiG1xG+4upi
	JGpnGCt0DFm0Dy2pvAtmLo0N+88EDl9ztk7FRJ9ItuKLAJiST21A4bV8l0GiclieQEX+aXXr3lL8e
	UzUV04DRC/OJT+eHntXhz1y7463vEWsd0lsaQ9xe3dRRgqi1Kl/xrDokggMbdfz4w1flyJUyac68t
	aejipYe5oEhXvkY2Q8/cusIkaTtzzVHw5rXL8VFI8ISuCGlBceLW3TVpHeWId8/hBvAV+lZnTOv9u
	01xzygnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6tK-00000006ozm-3K6r;
	Thu, 06 Aug 2026 22:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6tJ-00000006oza-1tKm;
	Thu, 06 Aug 2026 22:48:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5325A600B0;
	Thu,  6 Aug 2026 22:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CFC1F000E9;
	Thu,  6 Aug 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786056524;
	bh=aKWps21C2vpIWj/xL3lTP3KBe8XdUi+jDN1FX8vkfyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y/hkOxsiIyXqvny+I6euy/SH9J9Y7PfvaVvzz4ktCdEuX4pKj6zPoGgBWZ5XftV5k
	 TJfDirsMpGdI8gmczhDD0jw9OYPO5/iIRZkpzwjANRXqfSxsf443+QOpy/gnslQp/t
	 soLmaACg6qvULyVpdT1asWMzpnJCBRCNU+SfzJlM=
Date: Thu, 6 Aug 2026 15:48:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, David Hildenbrand <david@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon
 <will@kernel.org>, driver-core@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-Id: <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
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

On Thu, 06 Aug 2026 09:58:38 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
> 
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
> 
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.

Unclear what tree this is targeted at.  I grabbed it.


mm-stable does have this change:

--- linux-7.2-rc5/drivers/base/arch_numa.c	2026-07-27 04:44:55.000000000 -0700
+++ 25/drivers/base/arch_numa.c	2026-08-06 15:47:59.019918702 -0700
@@ -231,10 +231,6 @@ static int __init numa_init(int (*init_f
 {
 	int ret;
 
-	nodes_clear(numa_nodes_parsed);
-	nodes_clear(node_possible_map);
-	nodes_clear(node_online_map);
-
 	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
 	if (ret < 0)
 		goto out_free_distance;


which is easily handled either way.

