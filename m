Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVZDanYB1GEfuIgx7b8oUnFAcvHUmEEb2jsYYOOe4vA=; b=UhUc9PsHvx9WMn7r3PvQw3+VvU
	HCZljld06Fw40jNLI5BG6EB0LGG+PSk8q4w6xEVYo+5hOk1CrPLYlXen9wPtOGizQj4aQFAdvKU6y
	mqy+dq9L0t5uDa5Fng5b4XLTe9OGnAXgmIOlqs++4xeD7bpDeJUbLhXsHl+7nXSdgKAdBBuyGWaBd
	oR2fDuxB9spat1nu8cIpwqkCoH0yvVgK88+YRfdk6WiCsDBwLiwVO3qCclCFnJGEI8+x+swIF6h0N
	7IBJdL49PVeM6k063vG9EpWkfEbMkpzXZR9Y99kkTG52dhH4nrRWZQMb//61M9qSUkShLf4/5OH8r
	XdKDx9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9ux-0000000BUMb-2RJM;
	Wed, 10 Sep 2025 01:46:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9uw-0000000BULv-2PQJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 01:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iVZDanYB1GEfuIgx7b8oUnFAcvHUmEEb2jsYYOOe4vA=; b=f0FcUSZZjVJBUU1eRiHtLrYC8B
	fX8ygyKP47lN6S0QCXn5v2gT9H3CAbs8IRUKYD4o4ahPPQW9SC1LbIjyzIFy5IpYnJc/Zi35KMKl6
	GdUlF1LCy0kzBtNQT9ZzXDOjZmQlcu+Xai7VaAjWD7/8ywjnmbm5Ol0aHh6nNDZ+nK+u02Mi2LTbP
	KkIhdzSbwdYhFuN6+BCgg6md5Cbqr9Wtb/OQnYkHd+LUsIIIrFqJgd3p4eVkD/vtGMjJRJWTj736c
	yd2K/AZ2RcClBL8DLGKuOfEPa42TkTPx7o/71xbtDzWPW6D8jMVCQK4Hk2xdsrLnqU6R/xPghQ5S7
	5PHe08Rw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9uo-00000000UeR-417j;
	Wed, 10 Sep 2025 01:46:31 +0000
Date: Wed, 10 Sep 2025 02:46:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
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

On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.

I don't mind that the feature remains ... unless it causes us trouble.
Which it currently does.  Perhaps we could start by removing HIGHPTE?
There was a certain amount of complexity introduced into the page fault
path when support for that was introduced.  x86 removed support for it,
so it's just ARM left before we can remove the complexity again.

Most of the other pain points are around storing metadata (directories,
superblocks, etc) in page cache highmem.  I think we can get rid of that
now too.

I don't see any particular need to gt rid of file data stored in highmem,
nor anonymous memory stored in highmem.  And if we're only talking
about hundreds of megabytes of memory, I think anon+ file pagecache is
probably most of the memory in the system already unless you have some
very weird workloads.

Where we may want to be a bit careful is some people have Plans to
reuse the kmap infrastructure to support things like unmapping the
pagecacheto protect against spectre-eqsue attacks.  I know Intel was
working on this when 3dxp was going to be a Thing, but it's recently
been brought back:

https://lore.kernel.org/linux-mm/20250812173109.295750-1-jackmanb@google.com/


