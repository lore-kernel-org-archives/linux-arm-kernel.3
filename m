Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CCECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WK7RF7NsYG+8NsyTTvySh7GNGT5jm6UcDa778flAEQ=; b=mFcb/OSB7bVHrI4nr/caHPfqSJ
	Db7ZdrnNH7NOhFi+G/atAzNg4YxobOFQYLbvZFvAhVu3RHE9sqOHGqyuQkkzyPQyp/a/k6YQdEwag
	eQAb8gqaqz2/qjstd+bYQr1LYRzZqGekTKafIdROY18bVh3kviKX+BWRSDpwaUUSjZ4z4fdXHWt5J
	Y4/ix3La0CdjIdiIlMGrFjvh9Xtp3JG0wL9Xrar8y7P0YnelOrGWX8dWRZwxZGpKYo9wrKNlpFZPv
	BYRqESjnBXHQ5qVY7MrkchI1KY14LwvekE2mNM1ioLmR1gwtuciM+Lmqta7jLWuuebEcJZ38+6BFA
	iFvP3zDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEmb-0000000HZ4R-1Zvg;
	Thu, 18 Sep 2025 13:34:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEmY-0000000HZ2L-2evh;
	Thu, 18 Sep 2025 13:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2WK7RF7NsYG+8NsyTTvySh7GNGT5jm6UcDa778flAEQ=; b=mffiEw3N0Xsy0iehgYkPk5d+dg
	sWKIhv5XK/zUNW+x7cpwzMKn+fWVigxBkekrLwF/YIOd76oce1YtRzHGNOghxSvsx4TZKrO8BB5yX
	oA6G/OA6kjESeDYNowdA/HoKupolfgZZgm9ZJ1RTWZMa7p8eDc9puB5qodRd9gcxhoms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzEmL-008pSt-MZ; Thu, 18 Sep 2025 15:34:29 +0200
Date: Thu, 18 Sep 2025 15:34:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
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
Message-ID: <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_063442_672280_E6A43557 
X-CRM114-Status: GOOD (  10.68  )
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

> * Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
>   powerful in 2008 and could support at least 1GB of RAM,
>   but I only found one machine (OpenBlocks A7) that does
>   this. It's unclear if anyone is still updating kernels
>   on this machine, but they could /probably/ use
>   VMSPLIT_3G_OPT if they do.

If i remember correctly, there was a design issue with the OpenBlocks
A7, and it would not run with its full amount of memory. To get a
stable system you had to limit the RAM. I don't remember if that was
just with the NULL series, and it was fixed for mass production
devices, or they are all broken.

I doubt there are any mv78xx0 machines left, why where never very
popular, but there are still Kirkwood NAS boxes around. I keep mine up
to date, put an LTS kernel on it once a year, update to the latest
debian sid.

	Andrew

