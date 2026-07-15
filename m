Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F537C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcqaG9bdGXl50jPu/JZyaS7ewr6T+770xaHIMx0NS0Y=; b=RsrPwderUKH7tJSAnzUSMPMhNF
	8TGE8ekof5Nt7Et4f1DMk0zY57e6HsGEqmSZMLA1Eqq4ZtxujW9VnfPTTFddL+PceLEM46Y79pHtu
	7mHp8f1EzU07GBF0N7BVohVeDdHhH2VpknWib6KYmY4xQDWxQ/mGQhjtO8UwmZiSn5VFaBlEpk/DC
	9IuWwPUGfZzhd+NU5/pbInIp7HuGcE9DeSk+m0oXKyNnxgYdO47WkGe44BT3VFsS5itDQB/Oc72cE
	lXJXNGPcn4qKXKIpY//7VA7eICnHZLvlGCRHRgFLoLB+TV0E8TymBFphL03DZmEHZwBoQhZ1jpFfa
	lyL6xcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjv1z-0000000EAOX-2xnV;
	Wed, 15 Jul 2026 08:31:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjv1y-0000000EAOP-2OAh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:31:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AA0743624;
	Wed, 15 Jul 2026 08:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DA41F000E9;
	Wed, 15 Jul 2026 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104309;
	bh=QcqaG9bdGXl50jPu/JZyaS7ewr6T+770xaHIMx0NS0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XUzAtmOxttpIajpYuy9PHtsD/bbW3lMFTsULGrMLvudH7saF0OU+fpWl05tOPF6R5
	 tP3keWSIwMqQ8Qx6ee5BaOdgQLqR+bNqka/rqBZpHdQOLs2mDTSYbheNF78Igp0/HA
	 Pf4kpQpBBTUT2RpHgFJtIwPFPjufQ170EIEbnVoLc4n8lvuzFvTQ3lsnkjcazdojkk
	 J2AkTaVg7ZHOEBORZxSngiVqpWHUvWAOIRyRnMe3zvEJYh3TXK4bc+/Am4c5Zd1x1w
	 uw/4/J0AllxcbikrYAIxECY8JQBp/wRGpkqQX0wQKp1p9DXCEiLP32lM18eK4CXR5n
	 MuUZZ7YqLzzMg==
Date: Wed, 15 Jul 2026 09:31:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org, syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v3 0/4] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-ID: <aldFYDI6LFOv3GsM@lucifer>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714121102.9cb28d080556c94d45a6bc3e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714121102.9cb28d080556c94d45a6bc3e@linux-foundation.org>
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

On Tue, Jul 14, 2026 at 12:11:02PM -0700, Andrew Morton wrote:
> On Tue, 14 Jul 2026 18:24:22 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:
>
> > Kernel page table walkers fall into two broad categories - those ranges
> > where no exclusion is required via walk_kernel_page_table_range_lockless()
> > and those where exclusion is required via walk_kernel_page_table_range()
> > or walk_page_range_debug().
> >
> > ...
> >
> > This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
> > lock in vmap logic, then partially reverting commit fa93b45fd397 ("arm64:
> > Enable vmalloc-huge with ptdump"), keeping the enablement of huge vmap
> > support, and removing the ifdeffery with the partial revert patch.
>
> Thanks, I've updated mm-hotfixes-unstable.
>
> > v3:
> > * Rebased on latest master of Linus's tree.
> > * Accumulated tags, thanks everybody!
> > * Reworded commit messages as per Kiryl and Boris.
>
> I've confirmed that v3 introduced no code alterations.

Thanks!

