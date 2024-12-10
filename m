Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85LRYKUeIbL3UcQvmEcS0/dbZ7pj+vVRPWkht8UMN7g=; b=2CJao7kCR0CzMFPdCcGVq7HiW7
	BNmH5Q5etkAXXqxjf7idIJUxrEmv1F6oM7TO298KLMWPTLc8+Mwd3+Lb/YUreoQ46vWTIJf4bRqHy
	I5G6Ssw7EeGgQgXp7RxX3MdhafjLqvmC4W1WOkGpP+Nx2WwJ84Tmll3wfkqM/0V5dImKZyG1bMJgc
	F6fbexykMTZj6tSWu7qDr7iyJmN6jn9rHhI2U3dqN44dZ6S6nprx8sqyIZxCvbsJLyDVKrP2+0d4y
	v8GjP8qPxayBBBOhBeOQvneIJAjIYPPZQstb40Y+kGHlPUq3ExWCrUZTHP1Fmq3cNLtg9d/7AeGgz
	lKeU0NSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvuG-0000000Alsh-2Evk;
	Tue, 10 Dec 2024 08:47:48 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvt9-0000000AlVp-0x6C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:46:40 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id C45D31381D88;
	Tue, 10 Dec 2024 03:46:37 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 10 Dec 2024 03:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733820397;
	 x=1733906797; bh=85LRYKUeIbL3UcQvmEcS0/dbZ7pj+vVRPWkht8UMN7g=; b=
	BcU/kg5E19YhIVE1aCBA9Qbwu/wol6eaRPiPiSlJH7BI28RvoTR6M/AEQyKWkAj7
	CR7f6JBy/Vzao1ZVwvrIslxbDrn//duoqn0A5cOzsPr+el1Q6+A/3SK4t0Kdppjn
	BLyLiNU1d87AZSfdeClY7wzSk6G9l9DhSlcor1Boxn4YHsCYwBd5CumZFCtuz+hG
	JQmWpk3ZCsuFNGogYIMi2VL+weHjRX901p/FoN7aM79EnPfyvSwVT1d+TbD4hz/H
	2mRNjzov6NweuxpSB1teThKDkX6yUvmoxWIbbr8NDEVMHNwH8+4gN5DsBCiOmX+z
	jv7V0NhlunsW69pRop2hUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733820397; x=
	1733906797; bh=85LRYKUeIbL3UcQvmEcS0/dbZ7pj+vVRPWkht8UMN7g=; b=O
	3Skgj/XKrzu1v5ERSTy3GR+o5Jg7u0HGga27Az1k3kGVzbyqASbenx84XWalyG1c
	tskzb+l6gM2Pza1WHjk5XTuc2QnrOL8FjcoXfQM6N6xj6ep4po+QTwzB0egzENN+
	fJC/j738ryWmG/EETVJ8nij8C7TB4KVK/itUF6f3Y/TyCAV5UhVy/G6o1r0Kx+da
	AEa4VbGICJqxQ+YUame2P1j27kkPyAwCK7oF0QY48P6AFBT5UTB8Te5nhIaw8pMK
	9QzL+P3KAj0/QiGum2D4uy6C8zJdCBHJv6tKBMzBJL0N8CWIwK9Kh6JncygTVBOG
	a6keOVdfxWtDeicKEldBg==
X-ME-Sender: <xms:7f9XZ50rdLGghJi6cVkt-Ia-9j_5lbvIjQyXBKFAuTnScZBcCtPUSQ>
    <xme:7f9XZwG8V5DGo8ql5QmAeZshShSiwNN6T8D95ceh74cxAkbbE4zus03NQDRE3qkHI
    CQ-zPacZzcZcrY4s6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeejgdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgusegrrhhmrdgtohhmpdhrtghpth
    htohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtohephigvohhr
    vghumhdrhihunhesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7f9XZ55KkG43CufokNv_1iaFKmxmWAAEHBQLXbFvLWu_jszg2qEtkw>
    <xmx:7f9XZ20lBcmeRkYZbtb1uRQgA5SKynlxQb8quDxv-KGw1hnLbR6ZBw>
    <xmx:7f9XZ8GhkHnY1hGgePXp0CVuu-IIofGN7FIxITANgKSwT1FLPhS0cA>
    <xmx:7f9XZ3_hurDHfKdbl6BV7l7YTLugMv2qKT9qFbqgbZuzGKb_NXM7Yg>
    <xmx:7f9XZ4gX0SAhp00-_1_jM268_u791VYrVwQGChoWA1NunWtI_YWnKqVZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7B1282220072; Tue, 10 Dec 2024 03:46:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 09:45:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>
Cc: "Sudeep Holla" <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
Message-Id: <d750f114-8a25-4c84-912e-b6fb407a5150@app.fastmail.com>
In-Reply-To: <Z1fvkpYvqpnjPZA8@e129823.arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
 <Z1ch52AthTYVhtH4@bogus>
 <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
 <Z1fvkpYvqpnjPZA8@e129823.arm.com>
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for
 direct msg v2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004639_338043_A6666901 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Dec 10, 2024, at 08:36, Yeoreum Yun wrote:
>> On Mon, Dec 9, 2024, at 17:59, Sudeep Holla wrote:
>> > On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
>>
>> Looking through the other functions in drivers/firmware/arm_ffa/driver.c,
>> I see that most of them just match the specification. One exception
>> is ffa_notification_info_get(), which incorrectly casts the
>> argument response arguments to an array of 'u16' values. Using
>> the correct bit shifts according to the specification would
>> make that work on big-endian and also more readable and
>> robust. Another one is __ffa_partition_info_get_regs(), which
>> does an incorrect memcpy() instead of decoding the values.
>>
> Conclusionly, Yes. But the RFC 4122 said with network byte order.
> to describe how uuid is saved.
>
> but I think the endianess to load the register is not a choice.
> because the spec says:
>
>     UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
>     UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.
>
> this means UUID.bytes[0] should be loaded to x2.bytes[0].
>            UUID.bytes[1] should be loaded to x2,bytes[1]
>            ...

I meant they had the choice and chose to specify little-endian
64-bit word to encode the sequence of bytes of the standard
in-memory representation of UUIDs. 

> That's why other software spec (i.e tf-a) doesn't loads UUID from register
> wihtout swapping byte with endianess but just copy it.

If the uuid is transferred in memory, you obviously don't want to
swap it. If they pass it in registers across different endianess
code without specifying the byteorder in the caller, then they
would have the same bug.

> The bug is "not send UUID according to spec" in kernel side
> That's why it fails when I send message  with direct message version 2.
> So, it''s not change code unportable to portable but it fixes according
> to spec (load UUID as it is in register wihtout endianess).

Sorry, but you are not making sense here.

Sudeep, should I just cherry-pick your other fix from the pull
request and ignore this patch?

      Arnd

