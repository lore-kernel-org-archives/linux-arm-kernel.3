Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWr4d7FdEbOlGE3vrG07XOxnFjq0nNHsAsokSmwJO1M=; b=pH39RuHKKhkLyM0qUmskhkrGDV
	B4nRIoWSfWc2RQk2+j5Is8hKxGj8+ZBXae3SBmAIHbN4Vs6m5bJcajnTU6ClMk5WFn9WBPp28GFEo
	4LIyem0C03+h8S8LQI56ghW0w4zxIEPL0Kbi1fCKIhJnu6aUVolXtZ4JQjIXMhUKkh4qAj/wRy0cC
	AatSn5eVaUxQp93lQeVPZH0b6f5JxY6egbQ6uMrZDQDks4hfWHdbI1I9FlMQnX2EJj4Zc+pDgUu9r
	TKTdibmvydprAjnldgDwp6pT5AVO/CTH0bIrCS3nAATAQTDT+JBZfBiyF9KLr1djMbasrOwkW7oMQ
	NJYs0asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgS2-0000000Fg19-06MY;
	Wed, 06 Aug 2025 15:53:14 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgH7-0000000Fdeo-0x38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:41:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 02A977A00A9;
	Wed,  6 Aug 2025 11:41:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 06 Aug 2025 11:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754494913;
	 x=1754581313; bh=QWr4d7FdEbOlGE3vrG07XOxnFjq0nNHsAsokSmwJO1M=; b=
	IRHh2zqojx8PoMn8cGUFKso+3zgg/P3V2+tsP0G7wfSrK0raZ+sBj1ppVbU6B2Gt
	yK67/J2hnOt6nSSP09sgiTpfg96QFkJfmLMwhpZpBA6DtH/Z1XzNLO4XR+Z1ict/
	KtFnWhMwmkI0Rxn2V1Gtn6+mCelPuyp22wF0LrgMWpZcMvx3BPIe5mPIZpsSyitw
	993VNiWaZ3KS5IqF8QTEXJI6uTd5FM/Tjxuz+wqXnEBvoiqIwK4WAfJsAwTZAkEr
	EPRMYpGajcmzjbGwx15ZUreGaqncUXz1FqSp5gIha72M3qrZHVEyjekc7HL9KLh5
	4H36vHQGgKY8mMPKe5PjtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754494913; x=
	1754581313; bh=QWr4d7FdEbOlGE3vrG07XOxnFjq0nNHsAsokSmwJO1M=; b=e
	uB77sI5ewUzYFfNNaPiYWZzRkcWvJa5+sof97mQc369i8G7xoYvjx8zaGmkLI1T9
	Ytg/jqVKMk46Eg7UiPR/hSPhi006ES8IwBxoKSD4jwbD8pDHnrDlyXoJkBOpZvAf
	e7wzrsvKo8mDAe3u+7wlCBNy0/flSiiTkzD0tyrgZNJXb5GhgvB0CB55ziL38hWW
	xCwdN9BZsrfLVt9tnsfXgAPm4YIj8riu0n/fdE1qRTP0YRVsnF9ve+UPG+xxoogP
	oJhXhIp8S+SeY76C3zG39s4GZsm+zw8qKf//2u7Js+nN3Un5uqyL16yEY08yj1gL
	dBRvvc3BeRz0TQKulJQlw==
X-ME-Sender: <xms:wXeTaFP5k2z0ayqg1PpMRsU5qEbPmqpy8Jj75Ih3i82MxnR3TJ_2ag>
    <xme:wXeTaH_We0fjQKaCOB8xZJ44MZiTkJkwDnQN-eLbgL3z79S5o3Yuw4HgD_E7s90kI
    dX5EUF5qjz7kttZnG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdq
    khgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprg
    hfugesthhirdgtohhmpdhrtghpthhtohepsgdqphgrughhihesthhirdgtohhmpdhrtghp
    thhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehuqdhkuhhmrghrud
    esthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wXeTaEuDqAuHDDLpPonCoUv8hyo8xHw0fUKCaWbKxDksU6jjI-RgEQ>
    <xmx:wXeTaOUd9_Zpc4js60U_kgvcED3bCa9kuQhff0M4kUY6H6LMoM7tMg>
    <xmx:wXeTaPgtvF6S0lIEPw-hYGOfTjarLD6UVgJdcLRxxmzOsm0aGihQcw>
    <xmx:wXeTaGqSjFnBd2kKjLtUqwsvs2_w8UYC9hk1kLPp2c-G726Vww-cng>
    <xmx:wXeTaHaZy5UgXD-fRQfipAyOXEe8R6IApNQLFTi_kRRpKFnbz85FGLlh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 61F57700068; Wed,  6 Aug 2025 11:41:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tab3d7ddbd4694d8e
Date: Wed, 06 Aug 2025 17:41:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Beleswar Padhi" <b-padhi@ti.com>, "Russell King" <linux@armlinux.org.uk>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Andrew Davis" <afd@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <133a5da2-d161-411c-9cc9-0bad46ab981d@app.fastmail.com>
In-Reply-To: <20250806141808.4013462-1-b-padhi@ti.com>
References: <20250806141808.4013462-1-b-padhi@ti.com>
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_084157_584115_C8EC6A7A 
X-CRM114-Status: GOOD (  15.63  )
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

On Wed, Aug 6, 2025, at 16:18, Beleswar Padhi wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> This allows us to enable various peripherals in the TI OMAP family
> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
> OMAP specific defconfigs.

Hi Beleswar,

It's fine to enable drivers that are only used on a specific
platform, but those should generally be loadable modules, not
built-in.

For the generic (platform-independent) options, I would
suggest splitting them out into a separate patch, so you
can describe better what the purpose is, since this is
clearly not just for OMAP.

> IKCONFIG*:
> Allows reading the current kernel configuration through /proc/config.gz

This one seems particularly unnecessary in a "defconfig" build
since the configuration is already known based on the version.

> THERMAL_EMULATION:
> Adds emul_temp sysfs node under thermal zones to allow emulating
> temperature changes.

The documentation for this option suggests that we probably
don't want it enabled.

> FANOTIFY:
> Allows sending open file descriptors to userspace listeners along with
> file access events.
>
> USER_NS:
> NAMESPACES:
> Enable user NS to provide user info of different users for different
> process.
>
> POSIX_MQUEUE:
> Supports POSIX message queues for priority-based IPC.
>
> BSD_PROCESS_ACCT:
> Enables BSD process accounting to allow user space program to write
> process accounting information to a file.

I assume these are all in order to run a particular userspace
distro?

      Arnd

