Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65834C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3ZOzUdjtOFEuhwm/cEU4y2EYS4Yk/OhdGqcU/ZOYUc=; b=PYJwqGmHn4gAw0ctKVznw5MwK+
	WhgzlRlcy/x2/Wtqq/CGKP4cRCUicLi72p2N+8Qg35tGqJcx4A3ZbGWTAuGEaJ/b/SkZEpykXwmhU
	HS2NaJTjR9z5wHosxSArpgy+iuIV28pykNPn7xjLY8Dg7ZVOPtLCVn0BNnwJSgjBH46Z+MsEvh1Aa
	rNR+Q/FX1zcYq2DCbLA9lfMEGKMMw6OPOTcYqZhpOB/g7bRpqnkajrgfzPIfiyfH0O1+Cn3dQf+7O
	YBn7c9EDl5nz+KcavO1xh7XaCQptVRPY0PN7V1UsNGCn7FA0j3Xdy2HHM6IdrFgm9DfYiJA/CZfcf
	nF+gYzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wsi-00000007ZeX-0SV3;
	Wed, 09 Apr 2025 14:58:24 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WNw-00000007Rvg-0UWD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 14:26:37 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 562302540169;
	Wed,  9 Apr 2025 10:26:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 10:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744208794;
	 x=1744295194; bh=x3ZOzUdjtOFEuhwm/cEU4y2EYS4Yk/OhdGqcU/ZOYUc=; b=
	Y1BbvLACgsmfOucFr02y1rD7MJGoemJUJeW52i2NlM7IPVt5/89qC12Z+JMRJPJA
	D2lM5JCjDyu7MXKXhBSypuX1MQ0WBt5WczGCo+p6tQ64EKPprfgJdfdQQUrA5t6P
	MfMBELg7Py08YDC0filjwfHxJQpQ2rGr6FUJ8OM/oTQPqzJCJVn73cgw/yJKIykP
	vvi/kcqPmoYyI7hxVWfbdtx6X7TGYQvTTBPfYZDXapAFBeNm3q7Q5UwVjRj8d+1Z
	DtCsE2VFJVRPHYmY8Dad5lmn2yHLQ/p5q1/eVOXZD2AuJPD1AA1m+yy19d4mQOy7
	UTLS8QXzpICcBF46SvKzoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744208794; x=
	1744295194; bh=x3ZOzUdjtOFEuhwm/cEU4y2EYS4Yk/OhdGqcU/ZOYUc=; b=i
	AOOv5bSXN4zOuAhHIH4Vnwzu70mVL/q61W/3Rr6LqXXmYj0Ol/MvOzv7ppWzzbaL
	4i4hjp/ycjO4PxLWIF8KbcOWpZ52Mpgbkk8lSrqTGid3CvHcPtEVI3ppNGahxJjU
	/m66S8s5qxEFL/nZhrjA+ZlXzaXrnUb67cWJ7Ojk6CCMVC9WQ6hMEUugHFG0RTN+
	Wm55V+7Izo2ZedVMI4sRaxNK5S2+YnLXeUCThDDAeuqvjDLSGUThtIyPHtuQTc27
	ij6584i4h+ibcyyP8EIdXIq4IhadhXPsLvL6UD52h7lolypp7EmxOkfSyLBa5eEi
	thjY9XHKUHchMOx9MFY/Q==
X-ME-Sender: <xms:mYP2ZwQxcmHCBTElBtemUn65cg2NTinW55Gi_aI96z74njjfWVc8Yg>
    <xme:mYP2Z9ySTgWG7AWS-5uPOOJBU30ZA5Weq_d97SnhxREvpZHQ7WUU01mmysUBhcq0O
    Gv17yYKvcGP2eXyg5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mYP2Z92HlvwhatWvgobJpwRwqu66wOkDzubjSB1rNKGkbHuyOlMmdw>
    <xmx:mYP2Z0DTx_RoxVa7Z4Au6mNklIHZtswjXlpjNvTSu09A1matMP6cCw>
    <xmx:mYP2Z5g2JDyJsHveBwK0Bv30ps0u7LgESsWOI5BP6qmObSKqQvKzuA>
    <xmx:mYP2Zwprfsk7p3d4zRQC5PAwBxyk1uT9B_MRSEGcymoZBLcpu19iIA>
    <xmx:moP2Z9t--rONNyP_3OX_CvoZi5R7nx2eVEhmVNI42lyG57C2EDQj5cDm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CCD372220073; Wed,  9 Apr 2025 10:26:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T274101974a25e0dd
Date: Wed, 09 Apr 2025 16:25:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>
Cc: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <6e71b946-d6c0-48ee-b1e9-7c767a4dda12@app.fastmail.com>
In-Reply-To: <Z/Zy2zxD33/7sRrx@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
 <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
 <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
 <Z/Zy2zxD33/7sRrx@lpieralisi>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_072636_490593_5B7AA097 
X-CRM114-Status: GOOD (  35.52  )
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

On Wed, Apr 9, 2025, at 15:15, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 12:56:52PM +0200, Arnd Bergmann wrote:
>
> KMALLOC_MAX_SIZE is set according to MAX_PAGE_ORDER, that should
> be fine for most set-ups (well, obviously implementations that
> only support a 1-level IST can't expect a very large number of
> IRQs -  we set that to 12 bits worth of IDs deliberately but
> given the current memory allocation limits it can be much higher).
>
> A 2-level IST can easily manage 24-bits worth of IDs split into
> two-level tables with the current kmalloc() limits.
>
> For the ITS DT and ITT the same reasoning goes, so the capping
> is the (rare) exception not the rule and I don't expect this to be a
> problem at all or I am missing something.

Ok, just mention that estimation in the source code. If someone
ever runs into the limit and it does become a problem, they can
then figure out whether they have an unusually small
KMALLOC_MAX_SIZE or an unusually large number of interupts.

>> >> Do you expect actual implementation to not be cache-coherent?
>> >
>> > It is allowed by the architecture - I don't have a crystal ball
>> > but if I want to add support for a non-coherent IRS the DMA mapping
>> > like sequence above has to be there - alternatives are welcome.
>> 
>> I see that we have a few GICv3 implementations that are marked
>> as non-coherent in DT. I don't understand why they'd do that,
>> but I guess there is not much to be done about it.
>
> You don't understand why the GIC HW is not coherent or why we set it
> up as such in the driver ?

I meant why hardware would be built like that. I would have
assumed that the GIC is designed to be closely tied to the
CPU core and the L2 cache, so it shouldn't be hard to make
it coherent even if the rest of the system is not.

>> The only other idea I have would be to use an uncached allocation
>> for the non-coherent case, the same way that dma_alloc_coherent()
>> or maybe dma_alloc_wc() does. This still has the same problem
>> with bypassing the dma-mapping.h interface because of the lack
>> of a device pointer, but it would at least avoid the cache flushes
>> at runtime. If I read this code right, the data in here is only
>> written by the CPU and read by the GIC, so a WC buffer wouldn't
>> be more expensive, right?
>
> The IST is also written by the GIC, the CPU reads it (explicity, with a
> memory read rather than through instructions) only if the table is two
> level and we are allocating L2 entries on demand to check whether an
> L2 entry is valid.
>
> I am not sure the CMOs are that bad given that's what we do
> for GICv3 already but it is worth looking into it.

If the reads are common enough, then an uncached mapping would
likely be slower than the flushes. Not sure which way is better
without L2, you'd probably have to measure on real hardware,
though you could perhaps do that on a GICv3 one if the access
patterns are similar enough.

      Arnd

