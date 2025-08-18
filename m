Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46410CA0EF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdAWM4VoEFpKIci+YeNFUKl++/E12AuQc7lCaC4JGcM=; b=xXqgyMn7xCHbl3SrLCI0htnfrt
	HCp+YofIT1z6TtlylMuE4At7aYuWZY5fh0p7AG17UFAgDwUTjC1tL61t81wl/K0c31b2/PtCKqxqK
	Bj2RWnnn4vvXtGaBYO89qjcg4sIRJwFTJ8I5b4VgzG1brWkvIx7YJ4W3ATjVx+UA136DXMhd/MxMA
	txClK5BV5UiQZUyAz3nhTWKsIQxWYTXGZnR1QWokhWWh2EcrHt+Kghv6Af+wseIYkgU6L+tVs/N6P
	TDXiTrFOZZD0PKvjOSpqItnTJBG0f6sayyKtTM2N/378Fex5lrvlc5tl9SbFHUjr2qh7GXLo4PNmx
	Hy9EUfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3h5-000000088St-1YY6;
	Mon, 18 Aug 2025 17:30:51 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyPO-00000007Gle-2gL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 11:52:16 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D1493140019F;
	Mon, 18 Aug 2025 07:52:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 18 Aug 2025 07:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755517930;
	 x=1755604330; bh=xdAWM4VoEFpKIci+YeNFUKl++/E12AuQc7lCaC4JGcM=; b=
	h2oUcSs131J819wJvJTUef53dLSfrK3pHFPlRRldLsqNj9I/hXPeoGtIHI0iT3/y
	cDYnQVVpuW99OmB7K+lPEFvYdVlGGBNmmq5brTZ1CAlRoGmeryryE1GgmNfXg9uh
	TgBMuyniCnAQzZ49puTDzar5NmC2cyIQM67Krx8syaWCMDckSSPKeP8gtu49mR+G
	CScPZBKcukCsHxfgw5eePK/lgh0k5Afs7gCHTtSlDE6Igs8y0RlJdZCC0DWaBMRg
	3jpdEJ3JKLLqkOvj0mbZeYhRRnHHa/10vtfCvAe6EL/zUe+Hg6IYuunKbU10dpID
	qk1wvIO+zggkXBgzJra/9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755517930; x=
	1755604330; bh=xdAWM4VoEFpKIci+YeNFUKl++/E12AuQc7lCaC4JGcM=; b=X
	n1NVHAlgbfDXUlT2I+6XovZZtytwOYYHPOHqmZcI+YdW7j58ItLIEfUJAZ3lVOV6
	BwkxX93JgbcU+Z1tJZjR7UFzFxrmFtg+ZzAc6fYXpjM3ZltckyQADhlFNe2qJG2J
	kX+4e0UCLeJGHkp5gxeCB0L+CmHqcEeSK0mK5gspf3CL3JOjNvb3TWJI6GyHs22l
	s9ycEf9qKB17CHI5RpN3wR1Q4JrHBLbL3zWKAhYwwj+h2Igl2dMGUvwkzO3Nrtiv
	7V2g2jQ2PzcYqqKPaFq0h+ePlEDqvP1G3YJwsXG2AvIs0h47UXsRBrjfjM14Pef5
	w0oj60Po2VNhCShuZi7dA==
X-ME-Sender: <xms:6ROjaOuitNLKajWCXYgTbY8qebcCFPEWU-gG3euwtsq2g5EHyoqrFw>
    <xme:6ROjaDec4kPycLiFwmKAMf_8STikAe2q1_5SGAwDjQYAQ32OeQyoIArLarw0HxrwE
    PczG7UIPN7LJrDzVBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehhrghrihhsohhknhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehmrghr
    khdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopegtlhesghgvnhhtfihord
    horhhgpdhrtghpthhtohepmhgvmhigohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    iihhvghnghhlihhfvghnghdusehhuhgrfigvihdrtghomhdprhgtphhtthhopehpvghtvg
    hriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6ROjaFqAG9vVd4hWbW6eNyE7SESzQeaM9w92hMsr4lLEwp7yjsDzFg>
    <xmx:6ROjaMofJKUARlp42HjoQme1HABCrz4GM1iJYrMnUidh95kfG7D9xA>
    <xmx:6ROjaDHMlVoyoJbcVzEHbynZIsAzzrbI8zRo0UwXjZ1TdWUZpXVJqQ>
    <xmx:6ROjaGo6Jrd7CjQbAz9kCTkTcJLtjqJ2mGKByJ8Caslhk4ctJ8mcmA>
    <xmx:6hOjaDx8XTH3TIRclWvE8wp-hX4Cj7u2C4YXrjNi-XuGmN1mVBnwmWxF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF07E700065; Mon, 18 Aug 2025 07:52:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Awa8eXB9XRs-
Date: Mon, 18 Aug 2025 13:51:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Ankur Arora" <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mark Rutland" <mark.rutland@arm.com>, harisokn@amazon.com,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, "Joao Martins" <joao.m.martins@oracle.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>
Message-Id: <1ccb0011-d2d2-453f-afcd-dd2967bf572a@app.fastmail.com>
In-Reply-To: <aJ3d2uoKtDop_gQO@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com> <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com> <aJy414YufthzC1nv@arm.com>
 <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
 <aJ3d2uoKtDop_gQO@arm.com>
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add smp_cond_load_relaxed_timewait()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_045215_107342_9B7A8CD9 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, Aug 14, 2025, at 15:00, Catalin Marinas wrote:
> On Wed, Aug 13, 2025 at 06:29:37PM +0200, Arnd Bergmann wrote:
>> On Wed, Aug 13, 2025, at 18:09, Catalin Marinas wrote:
>> and virtual machines with CPU overcommit.
>
> Not sure it helps here. With vCPU overcommit, KVM enables WFE trapping
> and the event stream no longer has any effect (it's not like it
> interrupts the host).

I would expect a similar overhead for the WFE trapping as for the
bare-metal hardware case: When the WFE traps, the host has to
reschedule all guests that are in WFE periodically, while WFET
with event stream disabled means this can be driven by an accurate
host timer.

> That said, my worry is that either broken hardware or software rely on
> the event stream unknowingly, e.g. someone using WFE in a busy loop. And
> for hardware errata, we've had a few where the wakeup events don't
> propagate between clusters, though these we can toggle on a case by case
> basis.

Don't we already support hardware without a functional architected
timer even with? Those don't use the event stream today even when
CONFIG_ARM_ARCH_TIMER_EVTSTREAM is enabled.

     Arnd

