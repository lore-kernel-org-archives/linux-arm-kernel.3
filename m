Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7geUCbmReCXzmlkt85CSJgfKGD/03e0emrqRlFpi8ro=; b=iamFO9yEDK/rWlG8RLOVeedy0b
	mOJNn3tMTxXkbDEOlcsl3/uy2DGyuc8hEV04jlSJDSfUj28jEWv7UoMRrGu59QgCRyNNZlj6q59IC
	N6jhYMWMZRCsozTcyZDDPOFgD3lbD4RgKcMcw+hUyLBIUWAysQ/ZLXV3vBEgOnG23j6pJIQRL5qZW
	nDb37IYFBFM0/J9rua7joBB/bUsgC2fT9tLQ3dsWJSoYwg/qHO34uoHvWhqFHjxglw41+riVO0+Bx
	9/YkC9K/W5pl6KllupTLC8hpXV5a9HR0fvIkDLtLS8bVCaIClYdtkZJ18XF3nWTsqpGuFuaMZeHh9
	xGwI9DAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSvI-0000000FYaC-1fsB;
	Thu, 16 Jan 2025 16:40:48 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSu1-0000000FYJt-01xt;
	Thu, 16 Jan 2025 16:39:30 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E8231140192;
	Thu, 16 Jan 2025 11:39:25 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 16 Jan 2025 11:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737045565;
	 x=1737131965; bh=7geUCbmReCXzmlkt85CSJgfKGD/03e0emrqRlFpi8ro=; b=
	tp3VvXVJe5dQTHK9cTU1ydJiuT3MjPizKwof4s3XQEPdI84WqJKQyGh2A4BVupWW
	mp7PbXGNK+VDgxMAem+aCIhltE5kZOCzpXlZBTzY2P5MLVwqlVmORIf/v8lGFeL0
	kbhvDQWBO4Benw1VweWdwY3I6ax3JPE1LGMuawOsowTPsE2CoQ1kdGMVRPx5UIvu
	15f6hPzCPsW+yQapFBJ9pNoAp6iII+43K1PALkbvj+Rf32KViYGJfjEoeNScCDRf
	vtFdeO7yTcMUGhKpf8BY/DtkK4EcZrM4UABOj4V77/CG9mjNCA4ITXZvgI6esnwb
	/cU0HLAE1mlwxtCQjMmmpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737045565; x=
	1737131965; bh=7geUCbmReCXzmlkt85CSJgfKGD/03e0emrqRlFpi8ro=; b=w
	WHKtsmOrLaKCXEAlObuAkiYsj9pYXijIGCcaAFnbAVaBJiqYIjRuod+aY7TlyCbD
	prrD3kxBDjNRTYMYkDbhJ+gQLnMB6q25PbIqFn6IKkNqA2UfQLfnuIdMLtsph2iJ
	UqxGfFbAaQms0ZR5hUBHZs67crQ0qng+tPqxQzrvIpnbpxYd/RK2L1NX1/pN+wE4
	TSiDVhb0jFLkqcxw2a1YM1RS8GND5HkOnwcMC22/MUBFzvLVgTciDx3FQU4QdE0O
	ceM7+lja2ISJe7AQBHdE/9sRWQwEXKwo1UEaBkactRzXbP4moOwGsGOoc2/sNOHN
	qkkjeCy5jZY4laL3opHdQ==
X-ME-Sender: <xms:PTaJZ8JH8kcesZJ9lVI7Wu2ly_WjHg3hZngzH3gFk9EMg9Y-gTIyPA>
    <xme:PTaJZ8L1bvmm_2KFO4s2WgiykB8qFet4iPKMruLzHICvPx6n-N8xXnFq_eJyukVkB
    hXTfeL4cYCKr7rKGOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgr
    rhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrmh
    hlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:PTaJZ8tHQ6dsRojE8BjEYk4zySnaVxPuX9ioIG36bWBizbv2yo7EoQ>
    <xmx:PTaJZ5ZfLSgFtqkLXHTFRwDyfvKnd4da6aMQ1TU9UvMVAL-4Z-omgA>
    <xmx:PTaJZzY7vk1KhFns1AevQqobv9vZrp4gWsDZmh9s5578733PCg8Mbw>
    <xmx:PTaJZ1BW4O0xvDY9VnWQg1t3WJLGdFSRm9GvoWP05lBBcUvBAweuZA>
    <xmx:PTaJZyUdoKK8828_tbyB_QDBaOQpdR3c7AYc5Yn4PDM1rj2U1husRB2v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26BAA2220072; Thu, 16 Jan 2025 11:39:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 17:39:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, soc@kernel.org,
 arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
In-Reply-To: <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
 <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_083929_515641_794071BF 
X-CRM114-Status: GOOD (  10.36  )
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

On Thu, Jan 16, 2025, at 16:23, Neil Armstrong wrote:
> On 06/01/2025 15:25, Neil Armstrong wrote:
>> Hi,
>> 
>> Here's the final DT bindings change that will give 100% success in Amlogic
>> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
>> via the MMC tree.
>
> Gentle ping, it doesn't seem you pulled this PR.

Thanks for catching this, I had indeed missed it in my first pass
through the backlog.

When I first looked at the "drivers" branches, I decided to skip
it and instead merge it into the soc/dt branch since it's just
binding updates. I don't normally care which of the two (or both)
the binding updates go through, but if the drivers don't depend
on it, I pick soc/dt.

When I later looked through the dts branches, I skipped over this
because the subject said "drivers". I'm now in the second pass of
looking at everything I skipped originally, and would have
eventually caught it, but it does help to have you look at what
I'm doing to ensure it doesn't get lost entirely.

      Arnd

