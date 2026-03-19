Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E1E109024D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We2az9rV2uZhEm2AbxZxzNYfpPMKfj/UCTlthMox8c8=; b=KHvHFyiZQSg9YuUb3k0QQF8jsk
	GUIoV+sGUIdzh3qUa5bjlg+5CYSTb3nOyviOLEOHFzPU9NoRO0R7dS6/J2k7AfzUdFax8wpRl9Zq/
	LTC//RcWatvYfkGUJF3EE/n41IJt4Zg9vEVk6dydyfLfBVFcGs/1anJaECS1o2Z5f2U3d2hV128u7
	hRzgcVOcTP+zLHqlvYCKKugLIN0GjUGt4jCWrYpDvtnaTXS4WYvN8Jr0EAuSuz1WWdzBZFnfNXrJQ
	m2AR3IsQwG5x3Y4c8RHDUtDo4CklJZKMiJ1PUuXLAtYzz2qeuOEsel0cSzhLNHp6ZnzMxZWfPgBDP
	1SqTJhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GKB-0000000B5nC-0wS7;
	Thu, 19 Mar 2026 16:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GK9-0000000B5mq-48ml;
	Thu, 19 Mar 2026 16:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5783360133;
	Thu, 19 Mar 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6525C19424;
	Thu, 19 Mar 2026 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938057;
	bh=We2az9rV2uZhEm2AbxZxzNYfpPMKfj/UCTlthMox8c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AL2p7D4nNNuwVwc7Lph39O0JFakdkYyaKrzGaPHTF2GlW3nDaBEjsMovt8IMS1cvj
	 nF/Y3zcnq4HLceLlcb6ZNa8uwOSPS9SWkhVjLMbig3i7KtVn/sUAbfmVPQesBc+smm
	 1em/bPnI5cwFnbtL9+1T0wOIIFyaOYswLb8TV3Jrtgd9OpVCyzRy0/2cXUKGL7tmOg
	 p/vGe+nw48VyFu5vUn7QxEbTeLZzSpoqZVdkf5aZk90hZ1WePMNrOHlWOcl6wQkke1
	 ZJTW5adr2V3cuwzpxHwFD5YXGP9Xk9BnMlUdpEnaAU+qap2KVjtghs04ibjGQEjgmW
	 /TmfbXYeRDlPg==
Date: Thu, 19 Mar 2026 16:34:04 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <8ebdbdba-d0b5-4887-98e5-bc45f4565d51@lucifer.local>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
 <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
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

On Thu, Mar 19, 2026 at 11:24:27AM -0400, Gregory Price wrote:
> On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> > All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> > select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> >
> > For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> > and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> > CONFIG_CMA and CONFIG_COMPACTION already do).
> >
> > We'll clean up CONFIG_MIGRATION next.
> >
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>
> HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
> this up.

That is quite the HOTTAKE young Gregory!

(It seems my pun crimes are continuing)

>
> Reviewed-by: Gregory Price <gourry@gourry.net>
>
> ~Gregory

Cheers, Lorenzo

