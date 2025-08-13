Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FE7CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjAX2/LhHjkP4rTS8b1FppYeRZTcGybCFtXL4zZ0x3E=; b=Fs9o5pVrQPlkr5E+jL5hOKfgFe
	RyQ8AU8QLzMwsuvF0yhl8m2nUabp4JvcRDxZxsWLaLwQT6Z0IH7KOeDQ87bNG4PHDwsvziH+Jb4rO
	Ap7OEmqUzGepVNP2IowRQkt1/qkvkXS9N0pNPtKJOPKZXX7dEOMjtoT/LVN7aZ57b9rpKXxHMwzBJ
	3odj33TMSqkfeamm9u8tQUMj885bPNNV0elBdZShpQfZZtWViHCvcvWnj2cc7C6224e7J/WmHSNyG
	NuBwD1T1Ah/xNrA9AeNjOs8RAX3JJLVErE+jr3PoA6DEUcp/buRc1Hqf872xEOZLntaC2ynAMHleO
	rhCRyfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEwI-0000000EXW7-3KL3;
	Wed, 13 Aug 2025 17:07:02 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEMo-0000000EOZn-0Ubn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:30:24 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 13EE314000F9;
	Wed, 13 Aug 2025 12:30:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 13 Aug 2025 12:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755102619;
	 x=1755189019; bh=vjAX2/LhHjkP4rTS8b1FppYeRZTcGybCFtXL4zZ0x3E=; b=
	aJCV0ycEe4E/b3iJZLFGdEdPwf9zKYu5wPBV6/lYmnmHnXLqkzURwWDhQqhcar+k
	0up0qu66Lq0ssSgF4qdUDzmGyBkOIboI7dzaxYwKXscSRnTS/DHQE+HCTjX6RC/2
	w8dWciQKLWngikuOpwYzn6i5UOytqREebA5WW8z2t/a0zlCvQ60pbWtni6j2MPCY
	9r9mtAPBIEhhlS5H7LkD21mluvvlKNym6++s/hlVA5Tn70haUKgGIg5XzscvRdNL
	UA5a8rW8BoK0QGpzQ/d1gZqPp1dVR0ZX0mIBwhB0W86CngPdcwW+jLIuLKdME/L+
	X3TI8/69BPwGpN1c/0xtag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755102619; x=
	1755189019; bh=vjAX2/LhHjkP4rTS8b1FppYeRZTcGybCFtXL4zZ0x3E=; b=j
	f2QT+uwbg4ma5rRkOjbVDAMjhL3GNTO/HJLRKmT27dDW46cYweMgIAkn3x/uYxKX
	uV5QOhuU5f6a/k3j1MzMehMcl+kfPvyw7xBOos94SbYsvsvXZ0idy/2wAudsbXI+
	0GjgoIoN7XgUn3kHENC3Lr2jncSPkc9T1XXm1iETAVHmUksAedJkvBNTvFxRVcEW
	1OxNga5lvIpJVk6a6zgmQW7mxeJubgs/rZkgOAovSkQY3PxH+AeomqHKzmejC9eS
	qOtGguMzoAtXjbTymQFXuDULLrau9gHwyANF8YJHq7cORrVdOZPntEJ6jShzZwMT
	YtgdPmfFAfApGy06gZL/g==
X-ME-Sender: <xms:mb2caFvCbGaTtUkUQE7kJ9XzlyfC0jQl2wjl22xJk3l1Fs-tf287gA>
    <xme:mb2caOeexrCh9D_2r5I5S3EXCmwpQBd6wyy4b9Je0IupWt2z00to3iYFq4RLseR92
    r2l9_KN68w_2bkrZuE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekjedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mb2caPqPzvcl5q4h1-36ODgbpQZ_uLkeb7SMfQ40uYxH1Jcjtqa6Hg>
    <xmx:mb2caKGwMrqbZvjZpMGOqrjzw3XCehG5617fvvVFWBmA3se_3nyZ5g>
    <xmx:mb2caBoecBnN6iAjMGu80iWahRWxyQt1TGHMMhiNUKuGy9LsCXnwmA>
    <xmx:mb2caA2E-PFvuHi_ugtJ1Up5bnSy-_UrWFsmoMTg-WwJpU6coxWOmA>
    <xmx:m72caGyCugxt8xU_oZbvTtN6yTgbZBFZo1n6I8P7cKKy0CEGgapGRhf6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 67320700068; Wed, 13 Aug 2025 12:30:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tf2626a88c2a27380
Date: Wed, 13 Aug 2025 18:29:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ankur Arora" <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mark Rutland" <mark.rutland@arm.com>, harisokn@amazon.com, cl@gentwo.org,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, "Joao Martins" <joao.m.martins@oracle.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>
Message-Id: <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
In-Reply-To: <aJy414YufthzC1nv@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com> <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com> <aJy414YufthzC1nv@arm.com>
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add smp_cond_load_relaxed_timewait()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093022_506049_AD169996 
X-CRM114-Status: GOOD (  14.20  )
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

On Wed, Aug 13, 2025, at 18:09, Catalin Marinas wrote:
> On Mon, Aug 11, 2025 at 02:15:56PM -0700, Ankur Arora wrote:
>
>> This also gives the WFET a clear end time (though it would still need
>> to be converted to timer cycles) but the WFE path could stay simple
>> by allowing an overshoot instead of falling back to polling.
>
> For arm64, both WFE and WFET would be woken up by the event stream
> (which is enabled on all production systems). The only reason to use
> WFET is if you need smaller granularity than the event stream period
> (100us). In this case, we should probably also add a fallback from WFE
> to a busy loop.

I think there is a reasonable chance that in the future we may want
to turn the event stream off on systems that support WFET, since that
is better for both low-power systems and virtual machines with CPU
overcommit.

    Arnd

