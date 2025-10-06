Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933BCCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GQ/0jR0gVdoLEQuuwM/Hs1zQEnI3s78mUUBE3R9tUM=; b=rJccHjZ7S8mkL6RmpbyXac/iCe
	GA/c0kv60+A7xPLWbanRHkwZMriH56vO2gqSUqWZKN9wgIPrPK2XZpnw8t6Bv3F4pV/d8lTFsqOra
	Vv2HzpUzl1VlW25C37CSw6wXzJGEOZhtcFM5GLiEC2hxdgpjG1uT/wzCgO372zTzzZ8MswFbLfECG
	sllNzYJmGJWsTq9YwE9/xYszElowp29QQDbkdtaBcHeQmJ03s1U2XTKh+7l38NJTepk3EgwN27saW
	JPYK+WP1i//tGO9p8TSgytFDYxzQRD21DON0Jx8V4CqykrftcgYdD0J7DCE9zHN9yJMAnNhVKzqBt
	S5blpUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jrt-0000000HXKn-1Y39;
	Mon, 06 Oct 2025 11:59:05 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jrr-0000000HXKS-1H7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:59:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 039E514000E2;
	Mon,  6 Oct 2025 07:59:02 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 06 Oct 2025 07:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759751942;
	 x=1759838342; bh=7GQ/0jR0gVdoLEQuuwM/Hs1zQEnI3s78mUUBE3R9tUM=; b=
	qhMhXeJkK0ZAsD8fQDGc9FkqBOdXuWYRz1JK0xf20I4m8zCP6yT4cHe6eiG+84zZ
	cJCFYYa7AJux2umtoU1iLS817iOgJYfby79rTIDeTuhj4id2EVjaHlj3O1oSn9xl
	JRufo260ZpCRun9DtA3wLjw+PTY57h6mY8oE8iEF9gQRB6B+4kI9e2qXa7i7PTKr
	n3r8e5ed+/HWyqSybNNiXxF7yu0a1kjVww4+d3zC8SqhBErxFuJtauZPMWwuOl+i
	qr9GOE1jsLW7upa8hXJT/EbRT8darbErd4x3bXzqJHGQU42NiR165Jjt6+jGYyK/
	NygIlALHsVC17dqMTDa3lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759751942; x=
	1759838342; bh=7GQ/0jR0gVdoLEQuuwM/Hs1zQEnI3s78mUUBE3R9tUM=; b=B
	76/Ywx9vbXjDjujzUcyhVWlQsYtwTAcOOGqpU1mFDCW9V5C6sUawSoYQlsCoVtgL
	C6wZ0lQd0fQca7BHIjvhBmSG3NWQslmNdruZ7pKIYs9lrDefQ0Mbt+cWHR/mQbkW
	Y2bNJcuzRXAbF41RqL0tAFwNCNZU6HewB0gGXAdf4OPIqLc8JLn/VmrM9uBWov1+
	p5DmYWIU/8PBsqOiSTKwrY7Xr58rluhEWeKgifUv8ujqGVHOZLjQ8bJOo1djywL/
	Figu72Xmtrwqj/ZzF5S+61uCsM55n3xyokp7LQZgyzxJ7ZbecLWFju/0I/mqy9nF
	RdQKng5NtssSajknVV/DA==
X-ME-Sender: <xms:Ba_jaEfGweUCEwN3MH9DoD4rXHqUcGIMIKY0UFGVRyI43VB3fwoeSA>
    <xme:Ba_jaBAKqCIEh2FrkI6Rx4soK0iddDYv5Kxnj7hFhAy03QtSJWKgn_uO-bqey-NY9
    -odQKcd38I7loLduSZJESt6NvHqwDdnmkcr_iwGQ0AknDPY-WjctbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefuddtfeeukefgteduieeiuedvjeelgfettddtiefhfeefhfefffelvefhveeileen
    ucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtohhmpdhkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhn
    ugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgs
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrnhguvghrshdrrhhogigvlhhlsehlihhnrghrohdrohhrghdp
    rhgtphhtthhopegsvghnjhgrmhhinhdrtghophgvlhgrnhgusehlihhnrghrohdrohhrgh
    dprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgt
    phhtthhopehnrghrvghshhdrkhgrmhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhkfhhtqdhtrhhirghgvgeslhhishhtshdrlhhinhgrrh
    hordhorhhg
X-ME-Proxy: <xmx:Ba_jaKAGybnjVE-uWoUnRgJKlfqjmUKzRGjKe5q7nuLC4S_gzhkSwQ>
    <xmx:Ba_jaNQtNC8ngmUykBG9GqraoJJS2h74jGCmuEaZ-J-FY_CxmDAl6A>
    <xmx:Ba_jaMQac1xHqd8lsMQhNQm3ubOhUb9e6Pvi3vfNwtW0XA_CJZBaWg>
    <xmx:Ba_jaLIU2c2cSGXiBrkAGglM2IVJxfWblgLf2CqrhvL0QcX1LqRTvA>
    <xmx:Ba_jaO_bqHvRa8C_Gf8CDe9AB-0F0mHSrqoHkmY2exYkdtLoOdXjHIvZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 73FF3700065; Mon,  6 Oct 2025 07:59:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOEbzVvuXYlJ
Date: Mon, 06 Oct 2025 13:58:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 Netdev <netdev@vger.kernel.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>, linux-rdma@vger.kernel.org
Cc: "Ard Biesheuvel" <ardb@kernel.org>,
 "Patrisious Haddad" <phaddad@nvidia.com>,
 "Michael Guralnik" <michaelgur@nvidia.com>,
 "Moshe Shemesh" <moshe@nvidia.com>, "Tariq Toukan" <tariqt@nvidia.com>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Anders Roxell" <anders.roxell@linaro.org>,
 "Benjamin Copeland" <benjamin.copeland@linaro.org>,
 "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <a2357b92-8a8a-4d79-afb8-0bb8aee244ac@app.fastmail.com>
In-Reply-To: <CA+G9fYt+9QZ4TwEx7+m2S5Vtn7cq1N54oGceSR72upZJTrzkng@mail.gmail.com>
References: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
 <CA+G9fYt+9QZ4TwEx7+m2S5Vtn7cq1N54oGceSR72upZJTrzkng@mail.gmail.com>
Subject: Re: next-20251002: arm64: gcc-8-defconfig: Assembler messages: Error: unknown
 architectural extension `simd;'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_045903_415271_DD306B77 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mon, Oct 6, 2025, at 13:31, Naresh Kamboju wrote:
> + linux-rdma@vger.kernel.org
>
> On Mon, 6 Oct 2025 at 17:00, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>> ### Build error log
>> /tmp/cclfMnj9.s: Assembler messages:
>> /tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
>> make[8]: *** [scripts/Makefile.build:287:
>> drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1
>>
>> Suspecting commit,
>> $ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
>> fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
>>          (".arch_extension simd;\n\t"
>> fd8c8216648cd net/mlx5: Improve write-combining test reliability for
>> ARM64 Grace CPUs
>>
>> ## Source
>> * Kernel version: 6.17.0
>> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
>> * Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
>> * Architectures: arm64
>> * Toolchains: gcc-8
>> * Kconfigs: defconfig
>>

Nathan already analyzed the problem and suggested a fix, but I could
not find a patch on the mailing list so far and sent his suggestion
now. Please check

https://lore.kernel.org/all/20251006115640.497169-1-arnd@kernel.org/

    Arnd

