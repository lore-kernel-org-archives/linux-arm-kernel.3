Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D280CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKSB+4xL7cCmeYE/ZtEdtCjsvm7CIgVIfr0teJIjFAU=; b=ZcleUnDAYcWO2U1bUwhth4fpV3
	iU0EIp6WnWyyLKFLcdGjPQXwGzH/9VkbrJs+vVqTQR7YQRSNl5ZYuAQ4pfEJtQE6F95ouv0+iWT68
	WtZA2osBIsMz0UoRYOIU08cTCrc+2sWOgNuYTSiEU8rZkiKgO0TN73w+ctpDKnKL3y1E8TqjzwcAh
	wt4mSL+31EpINGj9dgBQR9+1czwpTgVNYMwzs5EXizr+80UCqQT3oetvoOVZvZH08RRc2hT+Akdqm
	hlZBpeCDPd6Z2+QuhcOUsW4a5BVUTs+pX0u5/7hunRqQ0TUrXJZqbuzLyE3svPDv8dOTZOMQmNHFv
	eP2PXhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRU-0000000EZdK-436T;
	Wed, 10 Sep 2025 14:05:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRT-0000000EZby-0BwF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 14:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mKSB+4xL7cCmeYE/ZtEdtCjsvm7CIgVIfr0teJIjFAU=; b=dofEW7af/ejhmNipPt2aD1zjQc
	r/T1X53PF0e+BEfGBFGmptVoarxZBEN1Hr7xriD76R1w+M+nvAcyFt2PcHdzuHg+TQmoMQFUdBQaA
	jm/o6jj1rPqB5i/QW6QVLU4W6O2YAUS0S3TvZPMLDfVQol1YTS76QR+/j8xxBFEpwnMLWAqId4scS
	bdUpC9Pcr4BH4JRwC/mCjcKWJe0ye/ZaEnL2OllK0B+92NxsmXiDMXLQP/kJYOtEetOYDdThozbzr
	U+eiVsgCMI71Rea2iE366+z3/3jQiRamjgJEHnieliGZegYbRdaVVmJTC4g6lcXbzYemC7sUUzZ3A
	gI/iBz2w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRO-0000000A1bz-3lAQ;
	Wed, 10 Sep 2025 14:04:54 +0000
Date: Wed, 10 Sep 2025 15:04:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMGFhuHyQwtwyF7B@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
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

On Wed, Sep 10, 2025 at 03:10:05PM +0200, Linus Walleij wrote:
> This is is done so that we can unmap *most* of the kernel
> memory but *keep* the VMALLOC area, so that e.g. exceptions
> can still execute and save to stack when they occur, and we can
> call into the kernel to execute said exceptions.
> 
> This in practice means the area 0xf1000000-0xffffffff
> which also includes the high exception vectors that must for
> natural reasons also be kept in the mapping.
> What we have mapped today (all of the time) is
> 0xc0000000-0xffffffff.
> 
> A minimal 256 MB mapping from 0xf0000000-0xffffffff
> should be able to cover this.

Can I ask where the MMIO (PCI?) window lives?

