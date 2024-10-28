Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC62D33986
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+OiIDFujfOkX27UX0KnwST8oK9dQeo/ifyz/Fg5BH4=; b=yVuSLcg1Xpp8Fq88DlccekQ7o1
	W+g4yee8KJvlvh2Bm3fPda4dfVex+pV1uXCDUzMLYXVSNxuqZn5+v59L8nYcldH5BH2k3J77P6CUq
	wIdtVcxkOmoQnf2UcSfrfvuKM1uLZw5Omt2QNaCl+jmEx765zmapBPNRTtulkvjFjAo09t95PDVsb
	pjCk7DYpdz/3YEUq/TvtiYvfbJ7EvHbTWPRBqvde2oQ9GPlalbYXRBYCWgS/QMPjzM6Yx+zBkCBUR
	ru4NWvtbvITYh4Zyq+W7heYvrQGbR0ysYY33BR67KnNmgY0H4jpUnsG3xIT1KXt+HD0Ou86yxydFn
	qMIx6uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QLb-0000000B1vh-2Thw;
	Mon, 28 Oct 2024 14:03:55 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QJx-0000000B1WA-3ks7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:02:16 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 005041380145;
	Mon, 28 Oct 2024 10:02:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 28 Oct 2024 10:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730124129;
	 x=1730210529; bh=r+OiIDFujfOkX27UX0KnwST8oK9dQeo/ifyz/Fg5BH4=; b=
	ea1ZHKinNqus8IGzLA0oTFE4P8eRvXz95Gu5TPOZKkfCwqi3o86yRLUeKd+xjsV/
	VAdxqjBHMU4mbZ1NNQIL+AkizkZFo7uPqB4Dhy0dzlTs7C2kOqkJDkkVqKYiTqRQ
	2sHm3uJd/fNIYWIKiHQpAxXr78IkZuLZf/teNibdYoCgWD/y2xBMWRwAWo7+2kXB
	mOz2QneV3wkZ9SVACHGRZaSpIuMORxksHPJQTpqREkvsZvMnLqmnqydFlnIE11Ar
	1zWCeU0jIcyS7FHjICFf9GIVaCcC7WOYoezrJ4p0Pv+VXd/jFCozyvCh+W95kFn5
	2OjJd4ndjB03ePJdylFrGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730124129; x=
	1730210529; bh=r+OiIDFujfOkX27UX0KnwST8oK9dQeo/ifyz/Fg5BH4=; b=h
	O0xGr3doGLlUkgjlmoh7OqE6Go73AJPRNJ2+M0xnafE48wa5BDYmecI4VeFFd8wy
	1mR2cyj3hCZ7Vs7addrbq1jmRaWoyV6MWOcq/h/G//pspPLPYi6dbnPKR+GO8lZO
	exwodB+SzfiurYhUkZ1oEr3hG5WjoMRqCo1locWNOEbi2ww4RTzCyKOP6XJyjhqb
	UAbp68IQ028mACjJez/rn3Fx9hvzf5AU6cvXtsujM0b+JsjAmfqXkbn/swagzZWM
	jr8qhlNh5hpPqiNHDl3YQs3hBUBNB5Wdzu5viL726P4ZAdgQac9kcjF+KRExX+48
	uEbtRzMFWC1CCrC6GXZ2Q==
X-ME-Sender: <xms:X5kfZyu8FRLBspgYiFbjf8P-xpnCwI95vxq0l8upbbCjWMgcmc1z7w>
    <xme:X5kfZ3fc6UOl0mPo73rbzhtaeEyYJWp60srptDLhksqRQ00UFj5br5I_aosHE182S
    EGrJ-S29tHFEYG1EqE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvihgurdhlrghighhhthesrg
    gtuhhlrggsrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghr
    mhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrd
    gtohhmpdhrtghpthhtohephhgthhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehjvhgvthhtvghrsehkrghlrhgrhihinhgtrdgtohhmpdhrtghpthhtohephihsihhonh
    hnvggruheskhgrlhhrrgihihhntgdrtghomhdprhgtphhtthhopegthhgvnhhhuhgrtggr
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:X5kfZ9wgum0vvTNY1_U0ODv_2hT3VzRXXqsoqGCFXJatAt-kYV9s-Q>
    <xmx:X5kfZ9MReUmx1MBBGvppBNMDflMti1A1ib7yK1lGTPUhGJaOsGjOmg>
    <xmx:X5kfZy_tV7OnRqQq6ThR68huUTWAZzMP9XA_XEIB-auxNDKldbHnvw>
    <xmx:X5kfZ1XTwkUgXd3mnM15tMHPPAFtGGOyXiRe_PgN1W2pD24wGcTU4g>
    <xmx:YZkfZ1e_9DtjsPEP3MRLaDDdRCCDjyFM2DBoRbPq0Elqbi-AM0p0ROSp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C7E272220071; Mon, 28 Oct 2024 10:02:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 14:01:42 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <jvetter@kalrayinc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 guoren <guoren@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>, "Takashi Iwai" <tiwai@suse.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "David Laight" <David.Laight@aculab.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Christoph Hellwig" <hch@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 "Yann Sionneau" <ysionneau@kalrayinc.com>
Message-Id: <52edd934-a1ca-427f-81f8-7d7dff2d626f@app.fastmail.com>
In-Reply-To: <20241028134227.4020894-1-jvetter@kalrayinc.com>
References: <20241028134227.4020894-1-jvetter@kalrayinc.com>
Subject: Re: [PATCH v11 0/4] Replace fallback for IO memcpy and IO memset
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070214_662391_A9CDB40E 
X-CRM114-Status: GOOD (  13.68  )
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

On Mon, Oct 28, 2024, at 13:42, Julian Vetter wrote:
> Thank you Arnd for your feedback and no problem. I should have asked
> before, to clarify what you meant. I have now addressed what you
> proposed. I have kept the iomem_copy.c and only made the minimal changes
> to asm-generic/io.h and kept them in place just modifiying the content.
> Not sure though about the commit message of patch 1. Let me know if I
> should rephrase it.
>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v11:
> - Restored iomem_copy.c
> - Updated asm-generic/io.h to just contain the changes suggested by Arnd

I've applied it to the asm-generic tree now.

It's always possible to improve the commit messages, but I'll
call this good enough, as it's more important to give this some
time testing in linux-next.

Thanks for your work work on this!

     Arnd

