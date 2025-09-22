Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E89CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tw7JZ6uQ+dSxRm1cR3ykcHwmxGgsza4QaeIC4IgS1AM=; b=xDjtsdFC+nbRHk7Vzvt0DtWkLr
	TBglHWnN0gZ3C3rVt4pLZbNUQ5SkgYaL4Tv0IjCTJ6qdODyTvpEAnncxBd/kmN0n2nf1gUPdFGTbs
	rW+7vGFYV7vY2y+ofUAxvvg+IqD2Tuyw3LVSs+Yfc8nHu5zSXlY9hxUzMd3zKx/uS/vyn4HLBNlNr
	pm7Q2Mus/wk0HDz/7ZRliICNXEfQDacY+XPRsCwkBw3TrW5SMB2bMSGpAWPZoin58P9Nx7QnfmM0f
	/gurtJcyNtETgrrsvXY1AX7lgUsfRAE2Z7dJCT0CoqxNm/vv03XVxqNK2KeFwHO21TxHk7fGkkdvH
	kEGOA0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aWM-0000000922z-1lqz;
	Mon, 22 Sep 2025 06:59:34 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aWJ-00000009218-1PaX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:59:32 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 535241D0018C;
	Mon, 22 Sep 2025 02:59:29 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 02:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758524369;
	 x=1758610769; bh=tw7JZ6uQ+dSxRm1cR3ykcHwmxGgsza4QaeIC4IgS1AM=; b=
	l/zsR0G5eT2gz2q4CXpfCwEpXLiXIWeuSMMOfqTnOtjbPdFXKq1o5OVaHjeuQvok
	O/W1x65coIcNpApW8qDJuJ4wKYWnuGNwyn7j6woJVBtie9xTAb11d6HngQbvPBKf
	HkCNYVpWqebU7GhZ9Qey2zLtrgNjUWrVxAmBONRPhSMCY64Yky9DXR9XDsvA3+XZ
	ZbbjO4HokYqsR0tDqaso05RrMm8/wXDNhWRhP1S8JSdqgGPk660msIOs8xolJTTe
	2E/lysfyyJ9YlxYZ8Aor/xg7B2nhZhTFHzG0yoqk3Jvxl/t/B3hFBhIboNtcexas
	F/U17mzbpFvEthrXVADCEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758524369; x=
	1758610769; bh=tw7JZ6uQ+dSxRm1cR3ykcHwmxGgsza4QaeIC4IgS1AM=; b=Q
	zwoyyBXTJ/xlyTuAl6eaDR08Yk7cKQ/BYb5Q+OZLHccYXOTq0s/D4PTdaj96/BWY
	ggJn+VsyjX4BR1Hr2f98K40hOZatGzQ2cuJfCPnbWUbSoltfyoQfrYcbTyI5AP3z
	cdO1sLjEizaP++pe3JWdqMUu8E/hcLc6Ezoa3b1J8l3zBl/LcuFy2NWUviuBLo+j
	hEda/Sd5M2ZGiE+v/q3X7Sq/5MeU9PWw3eI+9cHwC3G6RvYy60ZxsD8o6B1XVsHD
	/+UIoZdinlSwV09zE0r1PRQKkYVnb6LlKZJUsMPxXN8tUA+c46acCx0AdynNnU3F
	AWgKAlnztXyZ2gLYJNgsQ==
X-ME-Sender: <xms:z_PQaHJgzXYKoYDzZ-ssaOLFznF26Q_ZnAG6-dRyqJQJmlL_yyLZLQ>
    <xme:z_PQaLKYJie8lkusfN2_LRJLymKL9CiEKO2L9JMaW6nU_INMf_a-KAqcU9AVkuY7H
    Dtm7lvTZTS76OqV9zI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtohepnhhstghhihgthhgrnhesfhhrvggvsghogidrfhhrpdhrtghpthhtoheprg
    hnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvg
    hrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggt
    uhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhogh
    hlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:z_PQaO-AbAyrchLt1gPFzz5ImqtdsCE4MtwCgozi9Nvp6tIrZcpE2Q>
    <xmx:z_PQaOrgvuN6qNmRYjHfGwBTMsdEkP_7cBTz8lKVYq6AnPpCxT48tA>
    <xmx:z_PQaPkdEcrkiW2nIGq5bH_Mu4Fdt4bCb8JYLLnUSHz6JcSrKkzR9Q>
    <xmx:z_PQaLbNi1YcKXD1-mIpvlgsrc7fhhvtK_CV_WIUToIeUNXLq5ldZg>
    <xmx:0fPQaCrlRiKZ3grcKLdDxNAcmQRYM5wxeUnR0jLm2DG7jGDKd4pLMQoQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 79F2D700065; Mon, 22 Sep 2025 02:59:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Mon, 22 Sep 2025 08:58:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
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
 "Andreas Larsson" <andreas@gaisler.com>,
 "Nicolas Schichan" <nschichan@freebox.fr>
Message-Id: <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
In-Reply-To: <20250919143436.GC2132010@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
 <20250919143436.GC2132010@nvidia.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_235931_432279_A4E85ABC 
X-CRM114-Status: GOOD (  19.31  )
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

On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
> On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
>
>> SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
>> the datasheet, no idea why they chose not to support more,
>
> Quite possible the internal SOC wiring only has 28 address lines. :)
>
> I am right it sounds like we can drop vivt cache support with highmem?
> vivt is alot easier to understand if kmap isn't running around
> creating virtual addresses aliases!

I think so, yes. I've prototyped a patch for it to add a dependency
on !VIVT and the drop the code paths that are clearly no longer
needed without it. This obviously needs proper testing, but the
diffstat is promising:

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f14bac913d50..0a31cfaf3818 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1214,6 +1214,7 @@ config ARCH_SPARSEMEM_ENABLE
 config HIGHMEM
        bool "High Memory Support"
        depends on MMU
+       depends on !CPU_CACHE_VIVT
        select KMAP_LOCAL
        select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
        help
 arch/arm/Kconfig                    |  1 +
 arch/arm/configs/gemini_defconfig   |  1 -
 arch/arm/configs/multi_v5_defconfig |  1 -
 arch/arm/configs/mvebu_v5_defconfig |  1 -
 arch/arm/include/asm/highmem.h      | 56 +-----------------------
 arch/arm/mm/cache-feroceon-l2.c     | 31 +------------
 arch/arm/mm/cache-xsc3l2.c          | 47 +++-----------------
 arch/arm/mm/dma-mapping.c           | 14 ++----
 arch/arm/mm/flush.c                 | 19 ++------
 mm/highmem.c                        | 86 +++++--------------------------------
 10 files changed, 27 insertions(+), 230 deletions(-)

I did get an email from Nicolas Schichan (added to Cc here),
and he is still supporting a widely deployed Kirkwood based
platform that uses 1GB RAM configurations. He should get
a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
would expect that to continue working, possibly with minor
bugfixes.

For the timeline, the coming merge window is for an LTS
release, so if we remove VIVT highmem support in 6.19,
any remaining users we missed at least still be able to
use 6.18 for a couple of years and get security updates.

      Arnd

