Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC5CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r03A8Th0vYb/xAqW1GuZtUZ2YWf1ktb4kgPS6uzC+Cs=; b=pnDBZ6f8FVpWRAvmlHPu6wJa8Q
	GrxWhrflefJYBE1Oy2jOpYoTrbfw/usb845XqLjyL1Fm1E1tXEstPwcaXpXi3jGHRc6Rcx6i9BR+O
	XIAs+d4J86dHpu29pzK8jXxPLHv9b1l83WS4ks7CZtvu3YZPzhf79MZSULx26AMqK/CYzJ4bbi31v
	se62I04ocgucJp7g4s6zUwbVTwg0+D0qRCHa68C7vcd90O/RPyuIdjdVEe53vA+QigzyAb7hfmtk2
	vDaRpYufOK3NmnL29QyBjC3K073m5CAJhIYCBqIVRKc3HPVLq9wHA6TxGQ4woO5f6N83UMnGlbtJS
	JikUt8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8HU-0000000GzJs-32Jz;
	Mon, 17 Nov 2025 23:05:08 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL8HP-0000000GzIh-2p9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 23:05:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DF5377A01B9;
	Mon, 17 Nov 2025 18:05:01 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 18:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763420701;
	 x=1763507101; bh=r03A8Th0vYb/xAqW1GuZtUZ2YWf1ktb4kgPS6uzC+Cs=; b=
	tKnmLxZjv65qSzghDCKgRKpFhU5/5R//cM5qnTIkWFMWCdKVnWQvvwUJz4hz8B8c
	cbJHReXtUk/OVr8ODAGj9nobHSV/Ac0ch2CBhm1g/Hn9fWLgGcB7jRjIV7QFpNmx
	zLbk4xe6PK6ryj6lxKXtRaSHKNGvlyxklQ2+BSX4qMocRAdg67UgCtVsFUZNia0E
	zEw85lYLQDKx7DJ3RPg+Klx5QTLJj/CZWlt9f5KIo/wMVWX3IhykU8/JD9tQ00P9
	3yJdSvEgqG1tZx0tkXS0tJyTDlkPOKoRgOQXFP7jy6WUoeDyLcMEQdwrkmTnrtuh
	4mmJlPVAZdE96GdN0SUL/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763420701; x=
	1763507101; bh=r03A8Th0vYb/xAqW1GuZtUZ2YWf1ktb4kgPS6uzC+Cs=; b=a
	NelHQbzkg6F0FawS9k7wMRMT21FLfnMGhbnILjg8OIhLN/EhJEvh6W18LAr6X2qp
	otRIQEGpBkStgiLHpWbik71eKZUGO0V0N7LVnGBlxc6s70JsLi6xceS31aiOuBVh
	/yFvgFPdN8XmxB8m5UxxCMsFvKtIHY08zsjkcGJ+RgcmpruBE8kjg8nDnpqLrvNP
	vjv1PqKD/uLpYeMBpsfdzHoGajO62xYz465XardCB7+HjBonY2tXliwGJi+PdXEJ
	p6RRYBwuUr/J/3ejHgAzL+2heSQdjKXh+1NxxJWg4qFWWjmQ1boyvh8a9r+MuQNj
	ssSt0irNiL+irbHzb1y5g==
X-ME-Sender: <xms:HaobaX3LgpQCzAUw1-f17p3nHVNxY6mK-8y5db0KFtpft9cVaEKQZQ>
    <xme:HaobaQ7GTZeRDII_wX4eKykowTzZaU_fX1pTIjqfqAkRNYs5wJEm1eVx1FoS5LVB0
    ctULRWn6djW6ewjAtYEfynVF6_gnWjSy87V6Fs_5jwXx7QuZ7NGI40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudeljeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhgvrhgvmhihrdhlihhnthhonhesrghrmhdrtghomhdprhgtphhtthhopehm
    rghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehrhigrnhdrrhhosg
    gvrhhtshesrghrmhdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HaobaaDcHWUIBRim3KHfOZocHg7Oyu8XlUoSmrIZkqoIUNEzwtezGQ>
    <xmx:Haobaagncd6LdCL5ZJW-n239zjThCf9tVWwMi54S2J7XV2I4OrE-JA>
    <xmx:HaobaYY7bzLHsWUq1eAQlVWwgCKzc8p1O9vDFizo9MwD4ZYIikKQaw>
    <xmx:HaobabnM0D7BoafwOrn8PSNdCd2yE2BHF1y758QqAcxv5dEMB1z0bw>
    <xmx:Haobad_CoTQmtbYctaccBZoJvKHdeDt01dK4f76-KWEHtPLQXHV5yyuk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 628CF700054; Mon, 17 Nov 2025 18:05:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5NgtTiaP10B
Date: Tue, 18 Nov 2025 00:04:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Rutland" <mark.rutland@arm.com>
Cc: "Ryan Roberts" <ryan.roberts@arm.com>, "Kees Cook" <kees@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Jeremy Linton" <jeremy.linton@arm.com>,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <Catalin.Marinas@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <6e868400-5fd7-4239-95c9-7cb6ea6269b5@app.fastmail.com>
In-Reply-To: <aRtfabU9UaflfHYm@J2N7QTR9R3>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
 <aRtfabU9UaflfHYm@J2N7QTR9R3>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_150504_255182_1257E4B3 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Nov 17, 2025, at 18:46, Mark Rutland wrote:
> On Mon, Nov 17, 2025 at 05:47:05PM +0100, Arnd Bergmann wrote:
>> As I understand, the other architectures already just use the cycle counter
>> because that is random enough, but for arm64 the cntvct runs on an
>> unspecified frequency that is often too low.
>> 
>> However, most future machines are ARMv9.1 or higher and require a 1GHz
>> timer frequency. I also checked Graviton-3 (Neoverse-V1, ARMv8.4), which
>> is running its timer at 1.05GHz.
>
> Note that 1GHz requirement is for the *effective frequency*, not the
> underlying counter resolution. The 1GHz requirement means that the
> counter must increment by 10^9 per second, but it doesn't mean that it
> actually increments by 1 every 1 ns.
>
> See ARM DDI 0487 L.b, page D12-6793, which says:
>
> | Counter resolution
> |
> | The counter resolution is a representation of how frequently the
> | counter is updated.
> |
> | For example, a counter might have an effective frequency of 1GHz, but
> | the actual clock runs at 125MHz and therefore the counter resolution
> | is 125Mhz.
> |
> | From Armv8.6, Arm recommends the counter resolution is not less than
> | 50MHz in normal running operation.
>
> ... and note that (unfortunately) that latter point is a recommendation,
> not a requirement.

Right, I see. As far as I can tell, the actual resolution on s390,
x86 and powerpc is also lower than the effective frequency, but
it does indeed seem to be sufficiently higher than this so it's
usually above six bits of entropy there per syscall there.

     Arnd

