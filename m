Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15434E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0+iYPCNdQLGxjMdcbwA/gTR2x+sGNDsrapagDJOjyk=; b=hVWCgZz8hqynbKjx18bVoaK8Bo
	ACQF58wLj/UgY9kJ0uYMt+yISSdPOoJ3XYtU5D1R+FfpeR3li/ioTK3A5DDMwRWueSb7XDMYG2359
	+cg9hilqNG3RqSO/tGmNTfGV1KEaYo7T3u1Gv0L7YxRJ7DMshcBVD493WMARKrHU33Uv/I4Uu9VgG
	6FSFkGDS2S9IdgRdgp6i3/q9uXp3LoXIwXQx/GHiA17ZCEoCTbB+/KW8AqSa3W+DMWfJVQQEdSrdO
	vxTd/9FfmneAP691QdexVpT6ebUY28Mfqd/GnPpD4MOl10OznzJz7FGHiu9hOnql2l3fpGnnQkaEY
	cJ8rHTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWvv5-0000000BajJ-3at4;
	Sat, 20 Dec 2025 12:18:47 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWvv2-0000000Bair-1bAL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 12:18:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 38167EC00C6;
	Sat, 20 Dec 2025 07:18:42 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Sat, 20 Dec 2025 07:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766233122;
	 x=1766319522; bh=J0+iYPCNdQLGxjMdcbwA/gTR2x+sGNDsrapagDJOjyk=; b=
	ZMNUJHqaIlhxOZxNF5kSN9cyqEffKO1N6c+BEpBlv8VjXQMbHQE7yoALKJ0HjI/b
	XvGAc6Nr/uXvXo9lym6t/FhNbTT8hJ0mSSBz+fmaESsNJJOl7jlu7LgAT+0sDIu3
	9Ki9V/JcUOfgAwGFROotsToxiJrzZ2HbHUg/qvUaZIsoyJuKUij2LQthPHxIVZHT
	8dPzn3VcdepxgSOgThr/jM4iCzdR6eBphXPpTptuUXHjKJRJy4wlZja4j/aSTymk
	QtqFEZPslcpgA2KOsgjQagojGoMci4HnQdqU53UAPoZV6TEruD3xNxW9FNgzp4rX
	rCThjZ3LfEUaBUqtpw6mWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766233122; x=
	1766319522; bh=J0+iYPCNdQLGxjMdcbwA/gTR2x+sGNDsrapagDJOjyk=; b=q
	ZCZMqRFfdIVy+pv6ds6PnALhXDnC0sRLUaAmzj3s4eVEqx67+Ol363oA9MOttWV2
	j6hXQPA/CRtlNilvr4HTv16wkfHYlGm9V6j7lI69yUJ3XWv2O6KxcLjZB0OGGlW7
	9Pb6sKpvPbvw3pOLBVtxWWn+Gos1HAh5Vj93mri1hme7FUkzJuZiJJ0PCEni5MfC
	6qQ40JesdRdWISaTK2J+CavcrMWFx0ijMPey4PXY9Owlvp6KchmrR39qmMPIz3Ra
	164FxKRCIRTCLjUZGZtgfcqqiEVjq0sisy6FgxS0o+vS4efs1uxSgU2KGk1LftxX
	zoQDQ7mzZgTT8pMwzmq3Q==
X-ME-Sender: <xms:H5RGaeWggCPW-3VtQo0jpC7-99pN-EJCk2wblScdGz1-ni6zzovHpQ>
    <xme:H5RGaVYT_XLO9OmSwEzEJsXvW2S4qWUO59PT1vBDEEtjuR17lQ2yRdmUOnh16NRBk
    N4b2YhYcXMwf3mfadzQdQvw6TUuKClb1exusXGWb9um0WliqAYI0RC9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdr
    ihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtg
    hpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopehsuhhrvghn
    sgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhr
    tghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:H5RGaQN7rv5zp-HFb4nG5aaO04M6xP8R7qsDCEyc91z_HfiEw9u7pw>
    <xmx:H5RGabPeugWqp3_PtYsF-HqGb-Qi4TuBmur4HsG9oKOJ7JXp_YbzCw>
    <xmx:H5RGaUNckeV1xAQTE2DLNCcunDp1dlhBcx2IoeXkPzkj3nzshhpIWw>
    <xmx:H5RGaXb7G2ORik0ZKe9tiOzWwycV_3Ybzkw_-C8JbPSkIm3ilKdNHg>
    <xmx:IpRGaSEvRduNosmd8e790xMBHZoVrcyCL5X-_b1o6s4G1yFIMK_FSZ54>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2004C40054; Sat, 20 Dec 2025 07:18:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AhgucsMdbVXw
Date: Sat, 20 Dec 2025 13:17:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Hansen" <dave.hansen@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Michal Simek" <monstr@monstr.eu>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Nishanth Menon" <nm@ti.com>,
 "Lucas Stach" <l.stach@pengutronix.de>
Message-Id: <25642e76-43d6-4b17-94a9-e7dc53512223@app.fastmail.com>
In-Reply-To: <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
 <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com>
 <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_041844_918850_1E19A576 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, Dec 19, 2025, at 21:52, Dave Hansen wrote:
> On 12/19/25 12:20, Arnd Bergmann wrote:
>>> But, in the end, I don't this this matters all that much. If you think
>>> having x86 be consistent with ARM, for example, is more important and
>>> ARM really wants this complexity, I can live with it.
>> Yes, I think we do want the default of VMSPLIT_3G_OPT for
>> configs that have neither highmem nor lpae, otherwise the most
>> common embedded configs go from 3072 MiB to 1792 MiB of virtual
>> addressing, and that is much more likely to cause regressions
>> than the 2816 MiB default.
>
> The only thing we'd "regress" would be someone who is repeatedly
> starting from scratch with a defconfig and expecting defconfig to be the
> same all the time. I honestly think that's highly unlikely.

The entire vmsplit selection is guarded by a CONFIG_EXPERT conditional,
so I would expect it to change both for embedded distros that store
a project specific defconfig and for individual users that have a full
.config. If someone sets CONFIG_EXPERT, they do indeed keep any
previous defaults, but I'm also less worried about them.

In the Arm version, the 'choice' statement itself does not depend
on CONFIG_EXPERT, but I've added 'depends on !HIGHMEM || EXPERT'
in VMSPLIT_3G and VMSPLIT_3G_OPT for a similar effect.

> If folks are upgrading and _actually_ exposed to regressions, they've
> got an existing config and won't be hit by these defaults at *all*. They
> won't actually regress.
>
> In other words, I think we can be a lot more aggressive about defaults
> than with the feature set we support. I'd much rather add complexity in
> here for solving a real problem, like if we have armies of 32-bit x86
> users constantly starting new projects from scratch and using defconfigs.
>
> I'd _really_ like to keep the defaults as simple as possible.

I'm fine with 

	default VMSPLIT_2G_OPT if !X86_LPAE
	default VMSPLIT_2G

and dropping the VMSPLIT_3G_OPT default for non-highmem x86
builds if you think that's better. I still think we need the
special case for X86_LPAE/NX users to get to the point of having
VMSPLIT_2G_OPT as the default across architectures for current
HIGHMEM users that have exactly 2GB.

I honestly don't know enough about x86-32 users to have
a good idea who should be optimizing for. The embedded systems
(vortex86 and geode) seem to mostly have 512MB or less and no
PAE, so it probably works either way. As with similar
Arm configurations, these seemed like the highest priority
to me.

I see there are a few rare vortex86dx3 boards and the
upcoming vortex86ex3 that can have 2GB and would be using
HIGHMEM=y but PAE=n today, and these really want the 2G_OPT
split by default, not VMSPLIT_2G.

Hobbyists running on vintage PC systems instead may have
intentionally seeked out the few machines that actually support
2GB or 3.5GB of RAM on late Pentium-M or early Atom CPUs,
though most of the historic machines between the i486 and
the last 32-bit desktops would likely have much less.

    Arnd

