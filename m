Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn32CgfsCdcgiZc5xVsldvxbovwbLiKF6pDU6aeqlX8=; b=Be7jYHv215yr9+oXVu6cvbnnfN
	PRtWfFAPhYyb8yTzE7/zsNpnB79k0y/5sjvV/XijOnyB7x3ZjQDObcvoGCZbQGU5/12yUgAPz6sKR
	wnkva1ylkT1IHEtU2jKfPrZoPdM8mlUGBW0pFGd5e9MWCdzSd3BDWic+nYJJS3cWX+N8IBAHV72yJ
	M6iBg9VgWspe6RlpgbUFxhrPmsxsu8yuBnfWsRZliCc3yfkp/HDtYt6ITcI8YI2MeldqMN5N21SS0
	HpojLYmc5V9sCpuOsd3NMadDIFVLWutTKXrMN2SOjWvSyPZqWQ98MC9w79zofNTOmvRbiDg3O7uYG
	BWoHQRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRVJ-0000000GZvi-0uaR;
	Wed, 10 Sep 2025 20:33:21 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRVG-0000000GZqt-0hpE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:33:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 511D5CE34D;
	Wed, 10 Sep 2025 22:33:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id aSKreuvdlGXI; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4BFD3CE34E;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YO9RM-IU3T_L; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 082B5CE34D;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Date: Wed, 10 Sep 2025 22:33:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dave Hansen <dave@sr71.net>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
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
Message-ID: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
In-Reply-To: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: qX92QwLBi0un/69XQpQP6tb4aScRlQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_133318_347077_81EC0BF9 
X-CRM114-Status: GOOD (  11.15  )
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

Dave,

----- Urspr=C3=BCngliche Mail -----
> Von: "Dave Hansen" <dave@sr71.net>
>> Even with a new memory split, which could utilize most of the
>> available memory, I expect there to be issues with various
>> applications and FPGA device drivers.
> I'd be really curious what the _actual_ issues would be with a
> non-standard split. There are a lot of "maybe" problems and solutions
> here, but it's hard to move forward without known practical problems to
> tackle.
>=20
> Has anybody run into actual end user visible problems when using one of
> weirdo PAGE_OFFSET configs?

In the past I saw that programs such as the Java Runtime (JRE) ran into
address space limitations due to a 2G/2G split on embedded systems.
Reverting to a 3G/1G split fixed the problems.

Thanks,
//richard

