Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675D0C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnxogIQS7eoD999V7HLL1Y7l5CDp4hmKICTpMm/zYng=; b=hUG8cymiuVGU+t6U4eYpPFugZ3
	p6KDxnzt8kRtc7oE1pL0gwYePAtiUWcn/Palv81UWxMFqa/yoYJqDbFmDnDJNwWxMXRXluMRo4kyv
	ca9LZ3xU4c04avUsUn/7I2sF8A/ZTr8bGKOsw91ygWK21QSAVF9hfj9qDxLzGrF1ssw9dm74C6I1w
	ziofsM58n485geF0fR98kyiYu++t1888BVg8fieLnURTEQZMKmol8EMKWzTlsxOSGeL8J14kpjPF7
	koKe9pVwnQmaOy6XnqSfsfEvFQXXKkwzFjVAbo+nlaGaMDM4TxAECKveNXsMZ6obI3XjltqYByEj3
	z0SYoHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQmk-0000000B087-2dBz;
	Wed, 22 Jul 2026 06:50:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQmi-0000000B07c-12rE;
	Wed, 22 Jul 2026 06:50:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BEF760A6E;
	Wed, 22 Jul 2026 06:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69921F00A3F;
	Wed, 22 Jul 2026 06:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703026;
	bh=XnxogIQS7eoD999V7HLL1Y7l5CDp4hmKICTpMm/zYng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6R84Ps3/o94s4otuUkA+xNRsB5SBqBibOFkn3ZUnHYqT68BNhN4Q6nc4CuniP19I
	 zYEnJ1fmed/32oOwBB71rH0FjI5bExSFo+zlkkxYGw3sCWwij82ZJ8uclZpZQlVyo8
	 ebrxOKEISusfcf7TJmWKFvFZOfZqSmurjyLJks8m+sX/YHFgL7k4zBlJwb1k5wn24E
	 1fk9q3Vcd4xS/QdQVthkdevDIv5Suvv0pRY9ose9471KFU3cykS+x/qOOCj5ZB0GIO
	 /+an0VbZVI55lPLsc1ki6evJDFzMwpChtRqQkvtAM7j5el32I4dCakfifpWOZP5Wpi
	 LVRtdVoJ6XJEA==
Date: Wed, 22 Jul 2026 09:50:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amBoIXBYKAhToIgy@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <al-6aLMJONOMfW2v@kernel.org>
 <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>
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

On Tue, Jul 21, 2026 at 12:54:46PM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 09:28:56PM +0300, Mike Rapoport wrote:
> > I'll take it via the memblock tree? ;-)
> 
> Definitely not.
> 
> Unless you folks want to carve out the bits of set_memory.c which interact
> with core mm and mark it as maintained by someone else. I personally don't
> mind too much.

Well, in essence that's what this set is doing:

 arch/x86/mm/pat/set_memory.c            | 611 ++++----------------------------
 {arch/x86/mm/pat => mm}/cpa-test.c      |  66 ++--
 mm/set_memory.c                         | 396 +++++++++++++++++++++

I just decided to postpone MAINTAINERS update that would add
mm/set_memory.c mm/cpa-test.c to MM CORE section until non-rfc version.
 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Sincerely yours,
Mike.

