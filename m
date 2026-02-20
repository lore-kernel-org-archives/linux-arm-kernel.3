Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33903C55178
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ss8+VywhuMU/4S/P79Oi5pZzhllFGa7sC8VXnFATFo=; b=4dbSIiPtyJsIgk24zcJTEAwgus
	GBhTrhpaIPccCesCB6cuUokRc3gauxHvAxF3a58+ZnAMuWjuo6F29KfZbdAmWwQHU/nHuJ+A15Kma
	Izkmyk2YQxV+3G9+2hebMg+UjwDViaLh9w3fsZmpR4Q65Flkrsq2I36MyQjhHgbUZAG1OqFCeMiEt
	RzaJQypRl4oyUDzkvPUo2CKAmcJ+CZRDg8XWFhV4czQdb39xB3nCmWyd7AMu4gdlAuWPOOb3XEKN4
	Nlz1EfR+wi+s5Pv6SH1Wc/K/YFQwPThHr/OXbivmDvHdDyXHHayBmrfxUmcC/4rnWH9FBfwit2++L
	H35xShzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNAZ-0000000DfcO-3Fnz;
	Fri, 20 Feb 2026 09:51:31 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNAV-0000000DfXZ-3Oyl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:51:29 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A73D7EC00BE;
	Fri, 20 Feb 2026 04:51:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 20 Feb 2026 04:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771581083;
	 x=1771667483; bh=/Ss8+VywhuMU/4S/P79Oi5pZzhllFGa7sC8VXnFATFo=; b=
	DM8l3uM54FlOtMhdVmuiKUnCv+Tdb05f/0/le+2o7lCAyrlAlayKHHIoDwMaE5+L
	VgnZQAssygnuYcc2cr58Y9X+zQKJt48nGOiMht3Pmm6T/F/UYLUAFnfkNBK6vHLv
	KeJ1NgEPJ61wPCgS4SvodSHSVPBSTTFzEURuHk1XABKqJN0W+ghzSsqcSQVjXjuk
	0HPuihJzk7vvndxVcKz37UQ5mgSH72QfgIijj7M3CqCiO05FsTefKV+/Arv/dfwL
	qnCAx/fTV3xbQs2rPh6JxHCYAxbppMR5xmtUHMo/UBQxiwRHYiFyosSjIJYVUUfS
	AC73s4R32s+z/FThsWIPGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771581083; x=
	1771667483; bh=/Ss8+VywhuMU/4S/P79Oi5pZzhllFGa7sC8VXnFATFo=; b=L
	g0sPUzk+wjVOq3c+ySWLNHKhNdDP1aNcbKu2Igeu0YmL9p6yj2rVP4SXygzl2X9o
	47BETZmZ+eoPcPka5MtbwsmLfUdilPwa/QhJTgTDdFQ5rCQojfUPZr1NXSGEwOz8
	yvpD2/nJkRorJ403yFC/SoUv3eseB21eWCI7yPjFwsH6dvZXTDKa69U3VeMxuOep
	3osIDLDXf5DQnVtdFkdRrsyYx/oCtqqSaiYkGJb0AqVGd+uiR75cVhkcVnmoaPOy
	KkSioLBhVGQTS5Bk2Ad9QotvJilGgvBwmNebScXsBLgT/pkvEUnCWpxy6yDyQywF
	34i7ujWsm9UbBjPAHxlZA==
X-ME-Sender: <xms:mS6YadDcMz1LW9GlFgls2pIkaWd-nac4ctLgKiC9GeQ4tuA4WobsHg>
    <xme:mS6YaWW4xnJACieWFCPsFLuAXGa815jgmercmd9MSEmh212xyyqERZzWmYf14UnBM
    PW9m_pWz4lgekPAOiKPCgeKyiI0XwV-xnlfGC9N7DJXhqfWqoAQc-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepuggvvhdrjhgrihhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhr
    ohgsvghrthhssegrrhhmrdgtohhmpdhrtghpthhtohephhhughhhugesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhoghhlvgdrtghomhdprhgtphhtthho
    peifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mS6YaRn5gsZlN31IV-YVFag28YOwQjXuLMU7uZDbX_HQE02SNqa2xg>
    <xmx:mS6YabNvD9ZyuAY6rrUR_xwp28TrBXegBjycAcHGYfUD7G55ZYi-BQ>
    <xmx:mS6YaToaXbFImnpECXlViUynjZHYH7nP1vGDVwLY4RdLfAMra1WXPg>
    <xmx:mS6YaUvdB2QK0kJK8EVY2Et2G_gm5JVgpwRi1yePHjOszGe4pAo_Aw>
    <xmx:my6Yad2etw_Sw5FD4H2hINglbPGE5SPNWZlEAlt5XZQK1Od-jSxLQ_og>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CCB9F700065; Fri, 20 Feb 2026 04:51:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApFJJ1QKyIT7
Date: Fri, 20 Feb 2026 10:49:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Wilcox" <willy@infradead.org>, "Dev Jain" <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <5a687d0d-5ee2-42a2-9bd5-df29e518edac@app.fastmail.com>
In-Reply-To: <aZSHvt9Trlq7k7aH@casper.infradead.org>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_015128_341416_5A953B65 
X-CRM114-Status: GOOD (  20.05  )
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

On Tue, Feb 17, 2026, at 16:22, Matthew Wilcox wrote:
> On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
>>
>>  - Are there other arches which could benefit from this?
>
> Some architectures walk the page tables entirely in software, but on the
> other hand, those tend to be, er, "legacy" architectures these days and
> it's doubtful that anybody would invest in adding support.
>
> Sounds like a good question for Arnd ;-)

I think Loongarch and RISC-V are the candidates for doing whatever
Arm does here. MIPS and PowerPC64 could do it in theory, but it's
less clear that someone will spend the effort here.

>>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>>    example, what happens when a 64K process opens a procfs file of
>>    a 4K process?

This would also be my main concern. There are hundreds of device drivers
that implement a custom .mmap() file operation, and a few dozen file
systems, all of which need to be audited and likely changed to allow
mapping larger granules.

>>  - native pgtable implementation - perhaps inspiration can be taken
>>    from other arches with an involved pgtable logic (ppc, s390)?
>
> I question who decides what page size a particular process will use.
> The programmer?  The sysadmin?

I would expect this to be done by a combination of these two, it
seems simple enough to have a wrapper like numactl or setarch to
start an application one way or another.


Another concern I have is for the actual performance trade-offs here.
As I understand it, the idea is to have most of the memory size
advantages of a 4KB page kernel, and most of the performance
advantages of a 64KB page kernel for the special applications that
care about this. However, the same is true for 16KB page kernel,
which also aims for the same trade-off with a much simpler model
and a different set of compatibility problems.

Do we expect per-process page size kernels to actually be better
than fixed 16KB page kernels, and better enough that it's worth
the added complexity? In particular, this approach would likely
only get the advantages of the TLB but not the file systems using
larger pages, while also suffering from the extra overhead of
compacting smaller pages in order to map them.

   Arnd

