Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D5ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kvy79l38OjgXam56LG4SBUALLkxIDxyLLpk0bImYB5k=; b=JEO12C1XEqEx98slJHUBH1GPiZ
	yd5UtMCrxRlzwnnwIVVMO5HMcBmPOyD2xxlbshrEFocIbFdFdkz31L5+rRAjf+J4kjtLKTSenIRNT
	ESC+VlLYbhhcO9om9zvLFDYMfejJZxsF9czdZlwcIcZTcc4ytN2HL6VWSnxkps2P8iiv0ep1tQVpy
	z850sCVSMSROlwR4dZA+tZ8PIoPgTAXeO5NdcJwfQrIsJkLqB//5UDs/QObu3eGYiEbqiOQbG/JLT
	udWDmry7bBgpnbR+WwpHXWRIumT1k41/LqTLqY5s4TWhM9Kvg+axAYNlydv0C0lp8BwXXFr0g8mR3
	RxLj0y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQdV-0000000GLad-18fN;
	Wed, 10 Sep 2025 19:37:45 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQdS-0000000GLYT-11ap
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:37:44 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E33972C14AA;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mZ4QcxbfF_Ic; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 274732BA98D;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q1j44iMB0ybE; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D9D02CE340;
	Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
Date: Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
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
Message-ID: <1586788245.22320.1757533057730.JavaMail.zimbra@nod.at>
In-Reply-To: <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: BY4xIXfJeETYMNF0Cnq/68k1mYFqTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123742_426072_5814DA62 
X-CRM114-Status: GOOD (  12.63  )
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

Christophe,

----- Urspr=C3=BCngliche Mail -----
> Von: "Christophe Leroy" <christophe.leroy@csgroup.eu>
> Can you tell which PPC32 model/family you are using ? Is it mpc85xx or
> and/or other variants ? Maybe we can look at keeping CONFIG_HIGHMEM or
> find alternatives for that subset of PPC32 only.

Off the head, MPC8343 and QorIQ P1022.

>=20
> Could you also elaborate a bit on the kind of issues you forsee or fear
> with applications and FPGA device drivers.

Unfortunately, applications in this area often make certain assumptions
about the amount or layout of memory. This becomes a bigger problem when
using FPGA device drivers of questionable quality, which share memory
between the kernel, userspace, and the device itself.
These are mostly out-of-tree drivers, so that's my horse to ride,=20
I'm just mentally preparing myself for "interesting" bugs that will need
to be sorted out.

> FWIW I sent out today a patch that removes CONFIG_HIGHMEM complely on
> powerpc in order to get a better view of the impacted areas and allow
> people to test what it looks like on their system without
> CONFIG_HIGHMEM. See [1].

Oh, that was fast. :-)

Thanks,
//richard

