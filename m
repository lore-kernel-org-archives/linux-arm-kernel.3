Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C203CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGf6An9pkuacotas4PAUho44h/2LaY9ZaYpivcI6rZY=; b=cAUpLeVh1qko8JEplDqxExlSKQ
	6kVoBZKNyQo3yZsa0ZC0o9mPjt1xIyZwbT3YV96Mft+2qQ652XOH1NHx/dfRYi6fIDaTsrm+5Akj8
	c8MDPqTxdVhro1L0zpEkNZbFir7gF1pQ4uMvjlojHkaNiXmFUrT/h4PGURreXGfN70YFx2v/Rs3/w
	92fDH36XesRd24Zj/XGWNdg+Cqnsb3AYKpSOiFRzGJVVTHgC0jrMh59zgk4c4zPHMR/0aO3/VOa6w
	v5yXl8P6gtqjumyEumdiRW09dIJETJrc3Rlto85rNtU+J6ys7CHY4bpIflK2hMndzAYN8DZmZLt5C
	cZ1zx+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRB-0000000EZUA-2lbS;
	Wed, 10 Sep 2025 14:04:41 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLR8-0000000EZPt-0xYE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:04:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D2E8683E14;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LaIcEPcDfBsv; Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1A4472FFDA5;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X4a51J5LvQXj; Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C16AD83E14;
	Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Date: Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	heiko <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Andreas Larsson <andreas@gaisler.com>
Message-ID: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: xOQifXk0CYTOSYO4gO/z6lk9BLmNXg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_070438_554582_AA03003D 
X-CRM114-Status: GOOD (  20.67  )
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

Arnd,

----- Urspr=C3=BCngliche Mail -----
> Von: "Arnd Bergmann" <arnd@arndb.de>
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
>=20
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
>=20
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

I am part of a team responsible for products based on various 32-bit SoCs,
so I'm alarmed.
These products, which include ARMv7 and PPC32 architectures with up to 2 Gi=
B of RAM,
are communication systems with five-figure deployments worldwide.

Removing high memory will have an impact on these systems.
The oldest kernel version they run is 4.19 LTS, with upgrades to a more rec=
ent
LTS release currently in progress.
We typically upgrade the kernel every few years and will continue to suppor=
t
these systems for at least the next 10 years.

Even with a new memory split, which could utilize most of the available mem=
ory,
I expect there to be issues with various applications and FPGA device drive=
rs.

Thanks,
//richard

