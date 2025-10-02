Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583E5CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 23:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LDGnQ0gt7Sa0hoshBs+Cuhi9U0Tyg1pO8zVbYSkSqs=; b=OMoHUlIq81TAQwQAh/drJg1THp
	rrBofSVyHoEQdmtZENiTtJy/z/QSfzecMHafplUCcfHh0XA3JO7eB97qo6DC3SPYpfuTp4n5W/NwF
	ALhylo2GJLSLIvaOs2oHvBiCg7TcB2M7/ZVcCyhibuR3fwev5WgO2D+8nBAcCCtJm9wUq+Y3SdyKL
	JJUVRL77XNvWYP30MAxzCjjysXk7Vq6OLa4ejOR+zSCCQ2HAv/ms9Z7P9n84/m8FySvNmTcrLMycz
	BVddM7FU8AeZ5CgqgkkkeHGng37o1AdTNFFzHR3nqGiuMYBwsbs7KYYAnyTKJ5kjSQDBVdxgfvYuO
	26AfYa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4SKZ-0000000BNoa-36xT;
	Thu, 02 Oct 2025 23:03:23 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4SKX-0000000BNoE-3SSv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 23:03:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4BD647A006E;
	Thu,  2 Oct 2025 19:03:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 02 Oct 2025 19:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759446200;
	 x=1759532600; bh=1LDGnQ0gt7Sa0hoshBs+Cuhi9U0Tyg1pO8zVbYSkSqs=; b=
	ptcGK8uww5oB2UZho+1jOjjSKDcv5u24wPLKuZnnaxD2fJIUP23mJAI/YEOBbmOg
	2r482COP8NuOmAMsnPGoyx9IOUDEX1DrThyZTldcFjnvkrf7SFzB3SRiVbTgSYLS
	GfNRzBMWx98Agd1/rwmcOQs+xO8PduEHL1xTdR2ZqFf3CiGeDvrJ3ZsbAZvFd/uP
	gpHKCUfylPeIYiu7ap5HvGTemwzIKmaRGZPB8Rk+RGb2AqKfLD8Hk5xqCa4r6Hqc
	lo6cxwGWNP+oGXlrdEQJHt+Jc1hxf5IzJqvS/Icd6hJ+eCmaT3iz5MdfT9x0JvkD
	S7UmEKfAvwL7t5S6o9jpcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759446200; x=
	1759532600; bh=1LDGnQ0gt7Sa0hoshBs+Cuhi9U0Tyg1pO8zVbYSkSqs=; b=O
	d7d2TK/o8ERGISXaBGmTIhporaOoHjMieanul1AxMOIs5GXqTo+HqjUMZkMMFk9o
	ahBGAmop1c8PsbU3frGuwfll5AWNJ1VrAYk8RJ+FW9AARBqkd46mLOii/+uesyMI
	Z8ABC3CyM2d/5Qmnhq45SWeQDuxr5hWBeO6yu/pEgxUm6fO3J8AsHa2WtKtIkiBf
	WVAvZCjJZ7R2s2cN7Exz6OwE2AsWlBp5VVv5aqqR/PPyp2rjvQFgkZl+39HZwJ9z
	rqpMWjWb3aFlWRAYhXncnZFYyl0O3fAxXCSrV0TM1kdT03/S3NkhpJqiHX0YTncn
	JNxw0w32g79BrRMaK87mw==
X-ME-Sender: <xms:tgTfaNgLRq52evy-8sFzstZnu2rXDIU1QwOdWJNf5ndPwgCNgBIdzw>
    <xme:tgTfaM3uJTnLmnD30l1wb0Zj4jNbcr5QcUR8brREqP4DjldbisSRZzszVblUO1fhS
    J331nbm2ZYMM5mL--0knohwXd_YSUjg2LFnbXRx4rwE6KpgSxeVbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekjedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrh
    hmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhm
    lhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhish
    drohhrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    vggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtrhhivhhirghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    hsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:tgTfaEfVDig9l8uBUPbN7qI-_DCBdQrBBJe3yeBYBHZdyx9wWZ4ZrQ>
    <xmx:tgTfaLbg4sGGDeoOoYcYMIPsh-C1g4ou8AJZLCZHIk7GR5UKpT7M6g>
    <xmx:tgTfaI65r36mfVjBW4Sizc85YSjIO03Rozn3KAc9a5fLZkOkmQsEmQ>
    <xmx:tgTfaJfUjaJ1MTjrgZ6HaVSDj_-s66VpG_UyiHMbnGvso9Je95AENQ>
    <xmx:uATfaD7SKOA3y3hBY1ljKWGvlwxTwPxi5Xem1yzgPXtv89plbWNhmQ9U>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CF691700065; Thu,  2 Oct 2025 19:03:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOvO0JZNdWB-
Date: Fri, 03 Oct 2025 01:02:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Franz-Josef Haider" <fj.haider@outlook.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, "Kees Cook" <kees@kernel.org>,
 "Dave Vasilevsky" <dave@vasilevsky.ca>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Message-Id: <7d0b68d4-6798-43a5-a6ca-99807bc183c5@app.fastmail.com>
In-Reply-To: <VI0P195MB273999EC8797270AE732D8BAEDE7A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
References: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <CACRpkdZbwuf2Fgtq+jyqzqspb37-P6X4O9xqkG-mSb+afSjh3g@mail.gmail.com>
 <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <6d9bb65c-d693-4d99-8183-b605cabf9380@app.fastmail.com>
 <VI0P195MB273999EC8797270AE732D8BAEDE7A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_160321_925401_E72B9AFB 
X-CRM114-Status: GOOD (  23.84  )
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

On Thu, Oct 2, 2025, at 17:34, Franz-Josef Haider wrote:
> On 10/1/25 23:52, Arnd Bergmann wrote:
>
> Ok if the support for ARMv4T NOMMU has been removed, then maybe we can 
> leave this as resolved.
>
> It's actually just for a hobby project, nothing important. I just 
> thought these two patches might be helpful to other people who 
> encounter a similar issue on similar cpus, but if the support for 
> ARMv4T NOMMU has been dropped then there is no point maybe.
>
> Here are the patches for 6.2 in any case but it's very much a hacky 
> WIP, and there is some stuff in there that's not needed anymore on top 
> of later commits. https://github.com/krnlyng/linux-ipod/commits/n2g-wip
> I also have a version on top of a recent (~29 SEPT 2025) commit locally 
> if that is interesting too.

Looking at your tree, I find that the ARMv4T NOMMU support is not
even that bad to put back, especially since commit 84fc86360623
("ARM: make ARCH_MULTIPLATFORM user-visible") made it possible to
add a 'depends on !ARCH_MULTIPLATFORM' in the platform specific
code.

I still think that this specific oneline patch is not helpful,
but the other one you sent is technically still a correct fix
and we should either merge that or drop the remnants of the
ARM740T/940T/946E code now that we know it's broken.

Similarly, the later ARM1176 based code that you based your
patches on does look worth cleaning up and merging if there are
still users.

For the specific s5l870x (arm940) SoC support, I see what you
mean with missing cleanups, but more importantly I think that
we will want to drop nommu support from arch/arm/ in a few years
as the remaining users all tend to fall into a similar class
as yours where the developers work on them for the fun of it
but without anyone else depending on it to run on the latest
kernels. Since there is a significant cost in continuing to
test and fix the special cases for nommu support overall, I
would prefer to draw the line at S5L8720 support and not merge
S5L8702 or earlier.

      Arnd

