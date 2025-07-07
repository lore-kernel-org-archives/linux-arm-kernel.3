Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4CCC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiYQwAAPf4n8hF54hQ9NPDuRPE4r9c35s3L/M8iusuA=; b=m5DZDMzfzKgyISwFAIyTrDPbAZ
	IxMKoZAV2On0rEWSwLDbAeBNkSDOpLhQMjW8EphEaK0HwI6lXaX2orEf4HuZoQW2H03bx/rj8eUtC
	eiihRjMcYji7lhKGf6aI8xBdMVyeo5q0tkrgwHR5pj2qd20d1Rq9qj7C/754MENiLx26qeQfAYO2P
	rSZhO09uRc485D+Y3wTPST4kVChZbQwGls+VSTESvm0EYnfVNC+pQ98+Q++F+vaheuUIBG3RmC01y
	GSlMl2UhbgCTCsw7k0grqfarG8W5rWJR8MXnuMUIJGCwFIe2y+T1zGaSvGCwDXg1x6yu9A99T0O5V
	MjpjaZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnDh-00000002lmF-39FX;
	Mon, 07 Jul 2025 14:53:25 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYn9R-00000002l9t-3uEz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 14:49:03 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8BCEAEC0B59;
	Mon,  7 Jul 2025 10:49:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 07 Jul 2025 10:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751899740;
	 x=1751986140; bh=WiYQwAAPf4n8hF54hQ9NPDuRPE4r9c35s3L/M8iusuA=; b=
	AFq0Z654EiBDvaOSnENNsaTPa/w78Svi+tzHaxWAAsrTKYEs9s+J2vLiuMmGaehO
	C6U0kIgEwRG+OtdYlPQLFuFBMVIT7M6LBDmYQVd1WrBtjyW7T6fnWqaBWztY6rNA
	qwNlc/K2cDGlq7ZDsk32ha5a0mYxa9VK9fe8rQUcBY691VL31ko430pnmTXOpy2P
	KgXyXaaDqwQspPET4qGtAFTOKXrrfchkGicQXBQ8mNVYwlGnfJsw58PvjbPDfchj
	a0Hrsmc3tdsBAtCDzYSuYKACVVAX260Oq0vb6Gn7zGPJmGFFhkapJxjTczaufiaO
	fV9JVG172rWriJe097Hs1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751899740; x=
	1751986140; bh=WiYQwAAPf4n8hF54hQ9NPDuRPE4r9c35s3L/M8iusuA=; b=c
	7D8pwwM8t3s4foMCtFifpLwBCI2KjTfkn+91iiliVmrPSDOuRpaCD9a2Wi0Cd99O
	T+4bP92w6YYw1N0KjQPYaIvUfoYLY3iWJAAsuAtNL1JWxvfFT6Z/AKkzx5JC2Ay1
	jPMDrLco9t+/A3iW9O91pVst58TX1FypMqBHkh3JzQMSto6LJfE7tsapvMk/OsE9
	dwarxiDeCv/6BM29IZtdBNKCPvlevTOVBLiujewe/KDSFoFw7LSMMrHGJDL4mRn/
	gpEv06hse4ZB/K0+DA5I8ocMBmY2cSu8jEWYlwZJBJDaFM5fFq/xiYPwYOZ0VfM+
	WBtXhkx34cfBMdWT8XF4A==
X-ME-Sender: <xms:W95raGpbaoMB8DtLvesrhMVxSKLk-WpQC_Gyo9nC260olR-gk8X5EQ>
    <xme:W95raEpEGPwpMR-xOe82f2UaixwPnYYlSIYHSN7j_fFZf8azAhCnFZ1rkT4N2Kdij
    yNfAVhkv2-Y79iYUeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehvihhntggvnhiiohdrfhhrrghstghinhhosegrrhhmrdgtohhmpdhrtghpthht
    oheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjh
    hsthhulhhtiiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepugifmhifvdesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvghrrdhsrdhhrghllh
    esihhnthgvlhdrtghomhdprhgtphhtthhopegrthgvnhgrrhhtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhuthhosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:W95raPvIVZLNK_8zD1nAcTSidp9ooCfasgURt4knNswRgdjekxuFCA>
    <xmx:W95raLMlqKqBb8K_8TZspRTf6QJFz2EO46nIRPnI68skm7DsC5pjKA>
    <xmx:W95raBqvHcMkz-lVpH6oEn5NOyTTligmyxoN9rB0OF878_p0Ch11vw>
    <xmx:W95raE9DNVOIg4qEdNgqUJJEsOJr5ULnaB0zQ6Kxpp63FjSnejeS9g>
    <xmx:XN5raMYsmCeNvI9rQ8qma2tHGWE-fzRfza7Kve99fsLvfbPUHFC2drMX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A88B6700065; Mon,  7 Jul 2025 10:48:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T22a9fd8a498db8e8
Date: Mon, 07 Jul 2025 16:48:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Gleixner" <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Richard Cochran" <richardcochran@gmail.com>,
 "Christopher Hall" <christopher.s.hall@intel.com>,
 "Miroslav Lichvar" <mlichvar@redhat.com>,
 "Werner Abt" <werner.abt@meinberg-usa.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Kurt Kanzenbach" <kurt@linutronix.de>, "Nam Cao" <namcao@linutronix.de>,
 "Antoine Tenart" <atenart@kernel.org>
Message-Id: <fcaf7b51-a31e-4cf7-8065-db016d19d568@app.fastmail.com>
In-Reply-To: <874ivorvij.ffs@tglx>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
 <877c0ksd1p.ffs@tglx> <2078551b-c0b0-4201-b8d7-1faafa3647e6@app.fastmail.com>
 <874ivorvij.ffs@tglx>
Subject: Re: [PATCH 11/14] vdso/vsyscall: Update auxiliary clock data in the datapage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_074902_329191_FA63504E 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 7, 2025, at 15:16, Thomas Gleixner wrote:
> On Mon, Jul 07 2025 at 13:34, Arnd Bergmann wrote:
>> On Mon, Jul 7, 2025, at 08:57, Thomas Gleixner wrote:

>> (the added lines here also fix the missing clock_gettime64,
>> which was equally blocked on the sparc64 oddities)
>
> I'm all for it.
>
> Can you post a patch to that effect?
>

Sent, plus a bonus patch to remove CONFIG_ARCH_CLOCKSOURCE_DATA.

      Arnd

