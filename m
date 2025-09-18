Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0DCCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=; b=LhiticifUk2tPVNKWXtSOYFM9z
	/rvYq2Fjqo8QYjWzTkFWHo3lyeZbRy8NU4QyfU19dE/JjZShFJgty3mGivLsjp7jLmD02sTGebZms
	6HQaRM5MksvzPrnak53W/l4npAgNJyRKWpcuEwxKKgMGERqrqzwlE6MbzXmk3bG6liIHbUNcVCOWM
	gdK+NL4xRCJcdJ1scUsgZ4IxqrzjGn3wRRR9ut43s/ME1Wk94Lvn1dYztnZiPo43EKhvRw+8aDFJC
	nQ8j/neI8CzrHUZbbHwzlKeF3fZzJCI76udonOXnOXIPTQIrWWRNh8FUaX4OarnmDZzar0alnuyQL
	BDoSazMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzESH-0000000HVVh-1jX4;
	Thu, 18 Sep 2025 13:13:45 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzESD-0000000HVTk-3HxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:13:44 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4D4921400123;
	Thu, 18 Sep 2025 09:13:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 09:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758201220;
	 x=1758287620; bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=; b=
	1ak7ojNef1e3g67ZCzGe8Cr86CQBJ+FtYUUdZ98wga8fH+3vuc+RwkTppRISmifj
	TUQF2YYM9tYsbtzlw4/SjUUoGGdmMBn5Tx06zjVUjlInz+zUP3GqpAoEjzvsx869
	wddDDt+HjXSiHs17uF5aM1hYdPjyFfy6k5SzRR6jWICdWQiEVv359WWJgj132jJJ
	07v99j6h/aqeBEffHIyXve8yXE+JF2yzFo9WhjAf903RFRHGDj74a+pThncDZ43U
	cChz0t8T2JlvSu/bhlxR1hPt7TnIjh7DK2BI84tuHaRAr5IdA5Jn/e/MNKeBZUvX
	Ow885bcZSVPcmIgNRzukfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758201220; x=
	1758287620; bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=; b=N
	58W3tD5qawBw1eKsBN+kr6ZcUHb/ofQFbLKmLhZdv+qguzRhHYAyDLKSfwESXhrf
	aIY6l97xj+oglomqiNtEG7VTMJ9wGTjdZMtSQXPvA0EL9TgggVm3rQC5HzIiRV2m
	5xDJYwe8g7qsIUc9Kj38PQcYSOITY0LVGaKueq50doFP6bW244OFrN22sPeENXIY
	jA1EycAhUpQLSIWjFRVFE+zrgWjqWlsWl40HCwEKhwWQaCWvW/njRnEmJDgdvYsK
	zw0up4/m7eOD9/kuy1jxPa2+IOIk6ItpAJZUa8eKMXOtJiiJT+cAySSGyZ4hEycm
	gElUUMqK3gL3+zK38/pmw==
X-ME-Sender: <xms:ggXMaPqxmIxuS57jlyxuYXMmHn12czYQdlZwV1PqJq6k9KYeiwbKhQ>
    <xme:ggXMaJp_WDMqihTWUxA0KZ9pJgwdVmKsCp-Vn1fdREcdFTwl75fs0leTwW73akmHR
    JcpMICm3hi5jq9-VNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:ggXMaPyueOXB7yEQObwBgenAb7JQTgJqnB9NOI6UKzHpBn4i9VSQEg>
    <xmx:ggXMaOPqe_O8XUcPksli8MZC-GvW0FcpQCzBR-ts3xEmFaWKO-kRlw>
    <xmx:ggXMaPyfz-9UNPjw4MTfZh2k7kwzHQF2IHlbqQH8wuFNANzoleY-xA>
    <xmx:ggXMaICP5uqRm6gPGSMpHGW8PXzZmSwLVbGztYAkXSxcjxhxDrjnJw>
    <xmx:hAXMaDehpAP39-4S3Q408oZS3Swdc4rSB0uIxx1VQvIAhJfZ8ILlFImQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 85F7270006B; Thu, 18 Sep 2025 09:13:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Thu, 18 Sep 2025 15:12:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <20250917125951.GA1390993@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_061342_147463_1FC7EEAE 
X-CRM114-Status: GOOD (  20.41  )
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

On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason. 
>
> On this topic of removing some parts of highmem, can we say goodbye to
> kmap_high_get()? Only ARM uses it and only for
> !cache_is_vipt_nonaliasing() systems.

Good idea. I think we are almost there, just need to verify that
there is actually no impact for existing users. I already knew
that there is very little highmem usage on ARMv6 and earlier, but
I tried to recheck all platforms that might be affected:

* As you say (and contrary to what the code comments suggest),
  all ARMv7 and most ARMv6 systems have non-aliasing VIPT or
  PIPT caches, so kmap_high_get() does nothing, and we could
  just turn it off for those configurations.

* ARMv6 with aliasing VIPT caches exist but are fairly rare,
  and I think there are no ARMv6 machines left that actually
  use highmem. AST2500 is commonly used and has aliasing
  caches, but I only see machines with 512MB or less, and
  its aspeed_v5_defconfig enables CONFIG_SMP (for AST2600).
  OMAP2 and realview are in the same category but less
  important. imx3, s3c64xx and bcm2835 are non-aliasing
  (and don't have highmem either).

* VIVT caches are used on all ARMv5 and earlier, so removing
  kmap_high_get() would effectively break highmem these.
  Most ARMv5 use very small amounts of memory (<256M) in
  a single physical address range, so they are unaffected,
  we just have to go through the ones that are left.

* Intel IOP (armv5 xscale) certainly had highmem but was
  removed a while ago.

* Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
  powerful in 2008 and could support at least 1GB of RAM,
  but I only found one machine (OpenBlocks A7) that does
  this. It's unclear if anyone is still updating kernels
  on this machine, but they could /probably/ use
  VMSPLIT_3G_OPT if they do.

* Microchip SAM9x7 is the newest ARMv5 chip, clearly does
  get kernel updates, and the only one I can think of with
  DDR3 support, but seems to be limited to 256MB total memory.

* The Gemini (ARMv4) platform enabled highmem as part of
  commit c12d7e9fe9af ("ARM: defconfig: Update Gemini defconfig"),
  but I don't see why, as the machine cited there only has
  128MB of RAM in a contiguous chunk.

* A few ARMv4/v5 machines (omap1, davinci, ep93xx, clps71xx,
  sa1100, riscpc) used to select CONFIG_ARCH_HAS_HOLES_MEMORYMODEL
  or SPARSEMEM, which would indicate that they might need
  highmem even for <1GB configurations if their memory banks are
  far apart in physical memory. I checked those and as far
  as I can tell, they are always within 768MB or less.

     Arnd

