Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNQAy/3v/9QLSLFFH92xpmcRe2YVjxYAjNqCMFTN3Ec=; b=3OLepubn1ijbAyva1hlcxLa4Iw
	kTWjOcdU1bZPr/ryLIaAVcpUqpziv/csN2cRGYyIY3mM4K3plOk/NnZI5QTmq51KrXMmlgelIwZXb
	l4+y0gqJSB8hTTS6lm3aInui36e92uGJZY1HZ1GCNmP8zCMwmlEGS0vg+aLf1bvrjbG3ekFUi5UwR
	vCOGBfgPtRpXdwbgdprbwsmHoK1APA4Zwc7DnD8jdsX6jCYqKoX7t281aU9ET4LNS8Wd5AElHPwbQ
	4vMp+2kJFlKVj5fprzOP9BFD/tg5vKeB+EzfTnj9ly18gcKEm0O1gz79EfUB0YkvXDJjYhK9Qn1C8
	d/q0x0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqFI-00000002mjQ-2Ygb;
	Fri, 16 May 2025 08:16:44 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqDC-00000002lwe-2tPt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:14:36 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 42FFD11400EF;
	Fri, 16 May 2025 04:14:31 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 16 May 2025 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747383271;
	 x=1747469671; bh=TNQAy/3v/9QLSLFFH92xpmcRe2YVjxYAjNqCMFTN3Ec=; b=
	052ekoYV6RayiTa2DxfUFA6HabKwskEGS2Tqtj0/bs7nkYANgSbIAuf727TX1cQ6
	P928iyqi3au10lYINrEVu3QH8QD6qV5f+sR+dtRqm7ky+fs/1y28AEXystFF8z34
	7GNVCn45I+AHO7nT7mOlBSsSw8hKr+TV0vwS8hRljWxrQuAnMGvyDCspzMD9faTH
	auoWsAyhNzl9qkXt/ko3JnNS0tz8h+uC8uu+PerXcTS95OUE3pBq2T2dKW0LMsZt
	/YPA85CGUUla92Kg0hFUlZlR5wJi6iu3B7EtntsGwjmqAAdr3rPANPOca9KV8hZk
	zMj3RTNXU4PWdF5phr1aAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747383271; x=
	1747469671; bh=TNQAy/3v/9QLSLFFH92xpmcRe2YVjxYAjNqCMFTN3Ec=; b=d
	rdAYO9ahRidVZ+oA9KDWOKxoWfMZjU4euDQQmdqiwe/fw/2l5reWmiMlPUKgtORN
	A4ac3uesbCs66B392kXrrhNbF2KvTqNfLTGldWKeKj9WmMhlNUOzqIAMnm7+DFcN
	pB9TnP0ndwgdv+haN5uzaTa7bHFuVDkoJW7iuq8/uiLYh8aXsyapHn10xVIW2a70
	1GyiHByZWdegATwuB1qbTcErcui7fNZo/twFLnBOlF7M27RPE1Z7RptkyCAGJUpi
	lCGkdshhXWZVTLSLkDcrVi19M6UE1Ltk/YFfeBWR+zrHoy4zEy/eEV0Tqpw8pWp6
	242ywdHunbRspJTC7Hg+Q==
X-ME-Sender: <xms:5vMmaGaxVnX6-ZGYTswN4aSmYLmQ-lMxCwBc4hvycnecD5YvZAXPQA>
    <xme:5vMmaJZISR81F_TkRhU9DLiwVhxx6qkv0nlzj8Ofn59spVch-MXn_aa35eRjIm_eb
    Vtp7G-9t3ZhPBb7OXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepnhhitg
    holhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopegsrhhgvghrshhtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    oheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:5vMmaA8EEx-OxskfKuRjr9KqwyscGaSynjNvYYLiCrwTmbWD-bToJw>
    <xmx:5vMmaIqgdVU4_r5WTwAPfvdbHYn3RYDW3ij-ah7orJFBFDb_ec2hGQ>
    <xmx:5vMmaBobzfhKEgME9i6MR7L-msBVA1kr6N4cGHyO6v-shXK68N8ERA>
    <xmx:5vMmaGSCjD70OA_GBpm2DaKQJhs2uNV6k2rokbq8YEFk3LnNyAWwuQ>
    <xmx:5_MmaH_50-jHxQd0krYUtVXnXcC7JhRQ2lGKO5MUdnKqV1cmrQSgd23Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0AD69106005E; Fri, 16 May 2025 04:14:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1c7885e3064aa147
Date: Fri, 16 May 2025 10:14:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric Biggers" <ebiggers@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Brian Gerst" <brgerst@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Ingo Molnar" <mingo@redhat.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Marc Zyngier" <maz@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Takashi Iwai" <tiwai@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Uros Bizjak" <ubizjak@gmail.com>,
 "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, x86@kernel.org
Message-Id: <77dca5eb-74d6-4363-9d8b-e7b0d449dcb7@app.fastmail.com>
In-Reply-To: <20250515182806.GD1411@quark>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-2-arnd@kernel.org> <20250515182806.GD1411@quark>
Subject: Re: [PATCH 1/4] kbuild: require gcc-8 and binutils-2.30
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_011435_439745_61B9E697 
X-CRM114-Status: UNSURE (   8.92  )
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

On Thu, May 15, 2025, at 20:28, Eric Biggers wrote:
> On Mon, Apr 07, 2025 at 11:41:13AM +0200, Arnd Bergmann wrote:
>
> Later in this file, there's another mention of the binutils version that needs
> to be updated.  (Or maybe removed since it's redundant with the table?)
>
>     Binutils 2.25 or newer is needed to build the kernel.

Thanks for noticing, I've fixed both the English and Italian documentation
files now.

     Arnd

