Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0AEF53D6C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UyC2rv+fuf1B8esy+O+vyfPhSfBzfj4uOXEAJ8jSnc=; b=XOXWQpeon+7IWfcD8xW/yPlMR6
	tcjPq0nYcM3lYM0WoglhgGu2M+IN9QBzICy0HoEFcFgvpjnooiZ9vTZIlby3an4LZY2o2EIsFbd/8
	qba8pls7hg0edDqU/EO+ck355308gnXq7zjVoXZzAld3mPLiThzJeLXz0yYa3rWPsOaVniSu3+ZPj
	aw31HCdvIKQ1h2e4hOaU2Twz787yX2ssjEvFEsLD9ZF/1tWMkYs/82jRw1NmR7bQHCkIa32SXh9wX
	0bBxNjqa72VvNffP1BqLy4fxiMiMGZDPwvJi4Zh2qYjEzckeGQoNy0IIrD0SE4JgP9JJR0MAVMqjf
	XiuAJ+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Fl3-00000004xXN-0HoJ;
	Mon, 16 Mar 2026 21:45:53 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Fkz-00000004xWy-31zq;
	Mon, 16 Mar 2026 21:45:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DE7AC2C14A6;
	Mon, 16 Mar 2026 22:45:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gGqg7UAYOlZ6; Mon, 16 Mar 2026 22:45:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3AEF62C14A8;
	Mon, 16 Mar 2026 22:45:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q-DUhqY-5-xt; Mon, 16 Mar 2026 22:45:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A7EA82C14A6;
	Mon, 16 Mar 2026 22:45:43 +0100 (CET)
Date: Mon, 16 Mar 2026 22:45:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
	alexandre torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-hyperv <linux-hyperv@vger.kernel.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-staging@lists.linux.dev, 
	linux-scsi <linux-scsi@vger.kernel.org>, 
	target-devel <target-devel@vger.kernel.org>, 
	linux-afs <linux-afs@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, ryan roberts <ryan.roberts@arm.com>
Message-ID: <305430349.46051.1773697543461.JavaMail.zimbra@nod.at>
In-Reply-To: <e3071ae43af79277d3919bafb71f009694d0854d.1773695307.git.ljs@kernel.org>
References: <cover.1773695307.git.ljs@kernel.org> <e3071ae43af79277d3919bafb71f009694d0854d.1773695307.git.ljs@kernel.org>
Subject: Re: [PATCH v2 09/16] mtdchar: replace deprecated mmap hook with
 mmap_prepare, clean up
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: replace deprecated mmap hook with mmap_prepare, clean up
Thread-Index: pNh82O8fJN+FJCj96uoZroIJd3hL7Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_144550_051975_1F6EA34F 
X-CRM114-Status: UNSURE (   8.97  )
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>

[...]

> Commit f5cf8f07423b ("mtd: Disable mtdchar mmap on MMU systems") commente=
d
> out the CONFIG_MMU part of this function back in 2012, so after ~14 years
> it's probably reasonable to remove this altogether rather than updating
> dead code.
>=20
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
> drivers/mtd/mtdchar.c | 21 +++------------------
> 1 file changed, 3 insertions(+), 18 deletions(-)

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

