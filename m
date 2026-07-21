Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5FDC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHZ6KR0HBY/A+4ayC9BCwjfVh3BlnXge75QXQoZQPFo=; b=BrXiJ12cJ8/Z/1MWpJYKHeuLVj
	M9ixDOBtsrKaLIl8otJLk4wmwWMPfRXBrbREQyo+asSIaHY11VqUIhDgMzmPoKVklTeVdVbZt664v
	rcZJzsnwefdSHeGBiVXMQxautWhNbZahQ1TMTNaq8D2gTJ2GMm4IkjGkux0x9QguyJ+SRwFbiVWqh
	qtMNsjJcYL3vP8wneyOlno3ZvC5udrANxOQuzCraGTzRdgwvUn+p4cNMxzonIe229DoLAJS36NC6h
	0o3RJOsv3BWYccF5lpo3Km1DtdtKSwcVj2GOqWBjqmhTeMgTWdgRB/+fi0bocSZB/qO4rHI1Tx2g1
	FZdbu8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGYy-0000000AKTI-3rjx;
	Tue, 21 Jul 2026 19:55:36 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGYv-0000000AKSj-3ALb;
	Tue, 21 Jul 2026 19:55:35 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 72DC140E00E6;
	Tue, 21 Jul 2026 19:55:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BFh35W6ojD13; Tue, 21 Jul 2026 19:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784663720; bh=mHZ6KR0HBY/A+4ayC9BCwjfVh3BlnXge75QXQoZQPFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xran02uKyC5edtPpDYP3zrYWvM/wd+TuG8TczFdXanmHqJhF4EQsJramNEgpUqMwo
	 qKjV7yxLOGcs3wwnXmjjsCK5Wsw3coj0OmWWhxSEvMj6q5BqKwChVtk+5XngQLUbCr
	 /O1lX0OhBtGD757bPtSiNIuD8gDwKolYacrfjk729yTU/wd41XvJ+Txnbfg+WR8ucu
	 ZpiWXmpQ5StCU0PcoZvEj867IEcdyNscwc/HZQrbWpF4lscz3jaXE7vdz8WjzoJQfL
	 GDpLxjoBWUV0QWk2qVOLe/DigHevMVj41j2DrfnWbCar8FMZNrvwr3ceq+FvFEtLNw
	 rekRCUCLPFqCLIs4bS3oJFRNFimbOqu5sqM4nf0pMGmLcuR9HFD3php75HDfUvDgiN
	 G3IRK97tDDj5J+3sEGwfflva1Z+sNvEsTc+mALCDIjJ399i+n5nWTNTnzk1l1NCNT7
	 JP0i3sSqMhy7J5xHbWKX0Ki3IvtL51oonXbpv3Xo8OESr1ABKFqZPkXBIXMKwWkrRE
	 YxiTGeQOVesK2TUnUn9AIBV5+Z3L52z/SIJ2k0j6W0aaosNAqJwgh897ftzD+uInQh
	 31m6kPgkYEz4Z4fslke2woWDCwHQLFhtW8IJVLJ7H12rRG/CN+c6+j3GaBs5bmc3Ng
	 XIgXGRuajM3fuCnBC+JRBOxs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C109E40E016E;
	Tue, 21 Jul 2026 19:54:48 +0000 (UTC)
Date: Tue, 21 Jul 2026 12:54:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20260721195446.GHal_OhkuBCWQjmLQW@fat_crate.local>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
 <al-6aLMJONOMfW2v@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al-6aLMJONOMfW2v@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_125533_975876_EC194F22 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, Jul 21, 2026 at 09:28:56PM +0300, Mike Rapoport wrote:
> I'll take it via the memblock tree? ;-)

Definitely not.

Unless you folks want to carve out the bits of set_memory.c which interact
with core mm and mark it as maintained by someone else. I personally don't
mind too much.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

