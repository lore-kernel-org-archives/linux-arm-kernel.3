Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F169E7BDA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzZUgI4/0n6CLisMDMurd6EdCliOo1A0U++gbNUOhQA=; b=GvvYHRZffRb6kXFlHYx0SYDhFS
	Y0PoVPZ/F7LdThb+n2q+bAOCRB/+RtRNmt20kJ0VS4JQSsKRYQOfEkq7/M7fb3YlBD+6L8cGPp/bW
	Sa5+MJndGXt2KojmxEoiFgx1rvcLnnqROniPy0pzEzSLhcCJFSZ4X/7lD1v0jyOtm7rzbcfRB7ICG
	uCm8yBPbL+GcIX4iD3BX6BhJpNA3jQbIy1yDMupTNrrk173lXpmr9GHbcBv2UgHO6qkko93gitpEh
	POwoNC2J+cVvPKmYn3Oc0uiveiUHk7E5ZXFITo5DLgfVjimfTFnDxXIT4NrUlegzaLVR59VmJW509
	8egp+qJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrx6e-00000006TSE-3U4Y;
	Mon, 16 Feb 2026 11:49:36 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrx6c-00000006TRt-17Tu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:49:35 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9FFA1EC0329;
	Mon, 16 Feb 2026 06:49:30 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 16 Feb 2026 06:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1771242570;
	 x=1771328970; bh=VzZUgI4/0n6CLisMDMurd6EdCliOo1A0U++gbNUOhQA=; b=
	Fq3dMXKJyxfooEsY9f+9uWN71fP1wjtWLFgQXIDj+ZsMIruNTpM728NuyvAr11v0
	LKYCqYHA98baei4hJ1gPosavOue9V7qy/gTimZSgnaTq0ySiJlU6lYVHQyPNrPCW
	Xgv5b49CudQg4NdTQJCW4vd3DpWOc02a0r8P43TpEd7WO1N8m9kU4xmmMRFlrRb9
	DBF7SLhsdgbjHyBD70p/0yonKJUeb1WvBqt0y8CV2r7ExmtM2C14lIMiV6mWoZiR
	gVPWha56UYNpTVF3v5SUv2C9Gvwa/vbhhBh6rFmBEtp5lLpu3lupAvnDP3kHwZsL
	RkjjnML0LEPhLyakrTHKOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771242570; x=
	1771328970; bh=VzZUgI4/0n6CLisMDMurd6EdCliOo1A0U++gbNUOhQA=; b=c
	6JL9/YMm54t3j/KZIcWZQt/EAm7zoUKoAaTISNhL+aS2aXS0+L/Zb0px00QFlQQX
	xsh+a9x5mFhOYg2zynqLE+DBJxZ2Sbxg39eCdMTcZE6IJo80juV44sgapRyjhRlq
	OnxASFzO9C82ZPWtjXeuaGEeEYAiqoPyCiT9u5I5znsBkqVbB/usDsIg+xzrj8Ud
	x/A3Ay4eZCV+Iqf43dwlX2QOox563Ld2lMVuUbN6XXd6CBkFmriqzzULkgpCpnaP
	AThyrPu/JbiUMfeVZhZTXMW1lR1x9kqhvE3KKWyeA4qAojefBoWAAaJVGY7lcO1T
	sD5awUqW5yzm3BLRTaUxg==
X-ME-Sender: <xms:SQSTaehZOMQH55NKEow6Ry3Pt1_9ECTHSOfJOOqSoTFTEADlaWBhQA>
    <xme:SQSTaZ2LMxoGXQREVirN41LJTHv2XXNggXUA3l9x63wNwokK1EhKIyDLRIaSldQ-e
    us4K_VUfNkB4uz9wsS87kkmMbPcRX_ibb71hPopCCW8BQrRYBBh1iU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudeijeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhshhhumhgrnhdrkhhhrghnughurghlsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopeguvghvrdhjrghinhesrghrmhdrtghomhdprhgtphhtthhopehkvghvihhnrdgsrh
    houghskhihsegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegr
    rhhmrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhig
    qdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegsrgholhhinhdrfigrnhhgse
    hlihhnuhigrdgrlhhisggrsggrrdgtohhm
X-ME-Proxy: <xmx:SQSTacm6_o43U62Iu0x0uLc4fmSX-953v9o0pr3gfrSqTmmg20RfAA>
    <xmx:SQSTacSQPHGbmxOOFrAXJ2Ny1CY0Qaqr5jTs2-pGvCxTOVrqb_cO8Q>
    <xmx:SQSTaaYrbW5m6T5ela0lWJT-odSznFipdc2TaH3Tiezc9e3LCmJfDQ>
    <xmx:SQSTaU-JTKFR-nl-IHwIr9CHC94IucL4VVcZTg3nxWloqbE49ihjiw>
    <xmx:SgSTaYDLL8r-V6PkhRY20o_r2pD7CLtPM74ui2qrYSNEEWmqap8s2MB1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6E60170006A; Mon, 16 Feb 2026 06:49:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AZKTqhPwrVVF
Date: Mon, 16 Feb 2026 12:48:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dev Jain" <dev.jain@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Alistair Popple" <apopple@nvidia.com>,
 "Andrew Donnellan" <ajd@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6482195e-5230-468c-95ac-625da1b233d8@app.fastmail.com>
In-Reply-To: <b7711ebd-02fb-4cab-ade3-f4ff2f738de9@arm.com>
References: <20260213162219.1042965-1-arnd@kernel.org>
 <b7711ebd-02fb-4cab-ade3-f4ff2f738de9@arm.com>
Subject: Re: [PATCH] [v2] arm64: hugetlbpage: avoid unused-but-set-parameter warning
 (gcc-16)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_034934_392647_43763787 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, Feb 16, 2026, at 07:31, Dev Jain wrote:
> On 13/02/26 9:52 pm, Arnd Bergmann wrote:

>>
>> The issue here is that __pte_clear() does not actually use its second
>> argument when CONFIG_ARM64_CONTPTE is disabled.
>
> But that is true even when the config is on? __pte_clear has an 
> unconditional definition.
>

No, you're right. I'll rephrase the changelog and send a v3.

When CONFIG_ARM64_CONTPTE is disabled, the warning doesn't
appear because the argument is unused by never changed as the
loop collapses into a single call.

     Arnd

