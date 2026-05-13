Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE31CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEs2l25RMgTsDXvEQvBIXqNT2xkIVk4H/8R/2ZbyLkM=; b=rseISWg1WKQji5xIoadtWw1C8V
	hHoH0TGXGyKPlyBX5GcdQ9nv1qpn9jdZr32/bl6CF8o0SZ4xrtgol5kCfJl7xNrJfw1u6kcRjbjaT
	Om6wxhrL7slC3rLrW0ZVUvRQugCszhSY8NNMn/8lAbxAGHalM8/lY2C33+OXbZxirt1G3zQQxF8BG
	1rIi07x0hCKk0WzxeZNOpRDvN+z5gzfe4TB1mHlslOK2Jxo1ACeWDnfFSSAYoeN1aF1HwTuYdd+oL
	7kCSXRHZBJVyanW8cQyoJzZB/AQjEaF/LQzqbZ3B1xs9LY85L+z8KNX3y1q5MclLOTkvT9yS9iyg3
	7GnYuYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG3M-00000003gMb-0lkR;
	Wed, 13 May 2026 20:19:36 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG3J-00000003gLJ-3u9H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:19:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED6E36B0F3;
	Wed, 13 May 2026 20:19:29 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5E0E593A9;
	Wed, 13 May 2026 20:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G7fLJ9HcBGpwcwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 13 May 2026 20:19:29 +0000
Date: Wed, 13 May 2026 22:19:28 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
Message-ID: <20260513201928.GO2558453@suse.cz>
References: <20260512052230.2947683-1-hch@lst.de>
 <20260512052230.2947683-2-hch@lst.de>
 <20260512114231.GG2558453@suse.cz>
 <20260513054742.GA1018@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513054742.GA1018@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: ED6E36B0F3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_131934_107582_ADB617C3 
X-CRM114-Status: GOOD (  28.12  )
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
Reply-To: dsterba@suse.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 13, 2026 at 07:47:42AM +0200, Christoph Hellwig wrote:
> On Tue, May 12, 2026 at 01:42:31PM +0200, David Sterba wrote:
> > On Tue, May 12, 2026 at 07:20:41AM +0200, Christoph Hellwig wrote:
> > > While the RAID6 algorithm could in theory support 3 devices by just
> > > copying the data disk to the two parity disks, this version is not only
> > > useless because it is a suboptimal version of 3-way mirroring, but also
> > > broken with various crashes and incorrect parity generation in various
> > > architecture-optimized implementations.  Disallow it similar to mdraid
> > > which requires at least 4 devices for RAID 6.
> > > 
> > > Fixes: 53b381b3abeb ("Btrfs: RAID5 and RAID6")
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > This patch should have been sent separately as it has user visible
> > impact and can potentially break some setups.
> 
> It _is_ sent out separate.

It's public interface change of btrfs but in a patch series cleaning
up some library code, I noticed it by accident.

> > The degenerate modes of
> > raid0, 5, or 6 are explicit as a possible middle step when converting
> > profiles.  We can use a fallback implementation for this case if the
> > accelerated implementations cannot do it.
> 
> This is not about a degenerated mode.  For a degenerated RAID 6, parity
> generation uses the RAID 5 XOR routines as the second parity will be
> missing.  This is about generating two parities for a single data disk,
> which must be explicitly selected.

The calcuation is a different than what I'm concened about, changing
minimum devices from 3 to 4 is a breaking change. If the library won't
provide the xor/parity functions then we'll have to add a fallback for
this special case.

