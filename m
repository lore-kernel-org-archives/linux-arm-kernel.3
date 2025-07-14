Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04553C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0njB26qrHgHgqgJhixVMK11C5AVnOvF5avutan6EoGo=; b=DOVDvbl68IKtZQ9Rlw+vKIM7Sy
	4R/lf7YduQR9X6QLI11hopxHm+yVufHIUQjI3FxzRvZ6bQBxfTZ0dE9qf3mXWLVu0FwC2lH0ypQfq
	A+EMDoAFSYXsnR2jas8lyTVsl5uH2c8V1v4BJAOupbzO83elndcKSFQaUZdnnihnBVW0tcZR6HLEL
	NxM/Nb+0//5NFgqN4l4EUMeGhwztLQXr5hLysraHWsTb2gAsUy9VvgprAL6rt8esdBJf31YMKj44q
	O8oYVVVj85o+aXTKoVRmgi8ygf4Df0U7WNV6Ju/cSuMCX9K+PDpISVtWu9PCm5Baq47kq1o6sEhK8
	4s1E6rQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN4j-00000002yIr-3IqW;
	Mon, 14 Jul 2025 17:34:50 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLHt-00000002ib1-1mUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:40:18 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id AC0C21D002FD;
	Mon, 14 Jul 2025 11:40:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 11:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752507615;
	 x=1752594015; bh=0njB26qrHgHgqgJhixVMK11C5AVnOvF5avutan6EoGo=; b=
	OF5XC57glEJXYXFhmhLebcZ3wXlVdszeqaxgdQOjNlpcPyeeNZVSaAiWws1IyU63
	BSgL6SZMVBmNZk6Tr8619klxaRXS/Dyl0cMCqfTHokmmaQ2P21Lb7GUM7lnBGq1t
	1D5WgbFpfV1QMg/ZlK1a/q5LDXozabWKAilDOLwnwYZx9ZnZWORc2hqiKW23Lgd/
	I8h1qkpiTSmtjGepf5ulVeVLoGsLLpsUJvT7gj7FXxwlydswepAjNKkfiqJgtl3t
	NB+p/5jcwIXrEKq+0hV9EvHu/WiK5ZXSKLezZlYsZ1U+VXFZ5zOM5XPao5mYxprh
	w9p1ByZOqkD0tQMWdSMJwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752507615; x=
	1752594015; bh=0njB26qrHgHgqgJhixVMK11C5AVnOvF5avutan6EoGo=; b=m
	rZeo//KtPwVCOwy3s8kprUGhEkNgPVD4OBA3/UpzJx+Gw6obGDPZPeYmgbq92m+G
	C3iXV4T1D5g8cTwQkw6YuX22l6GNF9KVwFH8FA/w7xeHESy3JIt0L9znkgaZBtw+
	uRwowS6wJ3ckaOmwXVlt1JTGinvwqhboyzUDmYSX55HTyARgwxOlyRCxM22+Grz0
	8SN/VLrZ7VvJJHvXQTZ+w3ZlQwfFU/2LQRo5wkTwzoOAumMQUR4vrJXsa38ycnF/
	5c23/DftYRKbZ6tkArDMOe7oqgk+/g4PsyRUl9uhC7p++QhXLFfkPxvNcrDNf8nU
	1oNB3QARdYhmF+AZR8L7g==
X-ME-Sender: <xms:3iR1aJ7l36q__p0rLR44gcyBWQWywAlXplWWcLI677KMQfKwE4iw5w>
    <xme:3iR1aG7UPuNcgM10Iu05vD-OuMqCxLBJleYTJ4bfEUHkdV5Es3AdpzD3rgFuvhz6E
    PKTtQO4nHu-mtV9CTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehkrghjvghtrghnrdhpuhgthhgrlhhskhhisegrrhhmrdgtohhmpdhrtghpthht
    ohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtoheplhhihhhurg
    drlhhiuhestghigihtvggthhdrtghomhdprhgtphhtthhopegtihigqdhkvghrnhgvlhdq
    uhhpshhtrhgvrghmsegtihigthgvtghhrdgtohhmpdhrtghpthhtohepghgrrhihrdihrg
    hnghestghigihtvggthhdrtghomhdprhgtphhtthhopehguhhomhhinhdrtghhvghnsegt
    ihigthgvtghhrdgtohhmpdhrtghpthhtohepphgvthgvrhdrtghhvghnsegtihigthgvtg
    hhrdgtohhmpdhrtghpthhtohepjhgrshhsihhsihhnghhhsghrrghrsehgmhgrihhlrdgt
    ohhm
X-ME-Proxy: <xmx:3iR1aMIYv3JQe4Szc-JpjSetEI22ercdeg7Rg3WKmQi8TSg82drXKg>
    <xmx:3iR1aBr2EuXj6BHAWrP9-ZMTPoOPz7FEMmxuxlnAtu_IvQzJASdyPQ>
    <xmx:3iR1aFC8QGCi3Q93WpKOe0BkAyHpwoodEcEK6VsoJUh_oSdpMIbLoQ>
    <xmx:3iR1aHfNNrrwQ8XGsJX9FqbViaqkJI87ZuEYy2zexTesDSDCMhshJg>
    <xmx:3yR1aFZPDnM9fRspzybccfJdxEECJbb7EC_ExvL3vIH0x88d7sGGVA2w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BDFED700068; Mon, 14 Jul 2025 11:40:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7a47ae1d7bea40f2
Date: Mon, 14 Jul 2025 17:39:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Guomin Chen" <guomin.chen@cixtech.com>
Cc: "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Peter Chen" <peter.chen@cixtech.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, "Marc Zyngier" <maz@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Kajetan Puchalski" <kajetan.puchalski@arm.com>,
 "Enric Balletbo" <eballetb@redhat.com>, "Gary Yang" <gary.yang@cixtech.com>,
 "Lihua Liu" <Lihua.Liu@cixtech.com>
Message-Id: <6b5f38f7-0557-483b-9252-cfade7a24cf5@app.fastmail.com>
In-Reply-To: <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com>
 <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
 <aG0i75h32dWg/L2G@gchen>
 <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_084017_529150_E9B8D3DD 
X-CRM114-Status: GOOD (  16.00  )
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

On Sun, Jul 13, 2025, at 19:00, Jassi Brar wrote:
> On Tue, Jul 8, 2025 at 8:54=E2=80=AFAM Guomin chen <guomin.chen@cixtec=
h.com> wrote:
> ....
>> > > +/* [0~7] Fast channel
>> > > + * [8] doorbell base channel
>> > > + * [9]fifo base channel
>> > > + * [10] register base channel
>> > > + */
>> > > +#define MBOX_FAST_IDX          7
>> > > +#define MBOX_DB_IDX            8
>> > > +#define MBOX_FIFO_IDX          9
>> > > +#define MBOX_REG_IDX           10
>> > > +#define CIX_MBOX_CHANS         11
>> > > +
>> > if it is not really a single controller owning different channels,
>> > maybe implement only what you currently use.
>> >
>> As mentioned in the previous email, a single controller can support
>> multiple different channels.
>>
> OK. I am not too worried about having all variants in one driver esp
> when it is manageable and share the code.
> Unless I am overlooking something. Arnd?

My main worry here is that the types are all quite different: while
the doorbell and fast mailboxes are what a lot of other drivers have,
the FIFO mode does not seem to be a good fit for the mailbox subsystem
but instead looks like a more generic firmware interface with variable
length messages.

For those, I think a higher-level driver with fixed data structures
passed through the hardware interface seems more appropriate.

Are there any other mailbox drivers that just use the mailbox to
tunnel variable-length messages?

     Arnd=20

