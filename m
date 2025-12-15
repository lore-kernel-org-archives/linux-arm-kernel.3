Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F05D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pHcf68OzB3iptBnKlj4zsBnNadT3/PAA/zgTFtPF9w=; b=mz5l6wGrL2s1jzArndm0bw4qdu
	AUvyV+FfqeMerXW9xK2RCg7GQrYYj2j9kNllSaqkb4wVU/FaGnU/aNgp3RAnvjAR14kvidkeMkNlv
	iWZzauvJSWl4piXMAl3xMgdDOzPDrGIu06JdkzwH09OHJ2YIie3iDfq7Ol8CHyJXCOhgC8o+a1ial
	2tVqhHxLLBnoMDuD0mntdezqY6oem3fLcWwFN9ciixiYFAI3joJ4u0W42QxZyaUAmYPIO5bi6BovY
	yJQXsBDfUp+d80wFblUauSH2WVwdzTuH3/T/pkBZoQJKYYrWG1IjnlfVO4lMto7F/e3mOJftjVH5P
	rHh5OgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4xL-00000003Mz8-28hA;
	Mon, 15 Dec 2025 09:33:27 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4xG-00000003MyX-1dat
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:33:23 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 064AA13002AC;
	Mon, 15 Dec 2025 04:33:21 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 15 Dec 2025 04:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765791200;
	 x=1765798400; bh=4pHcf68OzB3iptBnKlj4zsBnNadT3/PAA/zgTFtPF9w=; b=
	jgTcOyQSuZN0pGuc/z7Mr9IYMCHhCbC0eWPOrDchjY37dvvmXlGaYxW5So+xENtG
	Y9Wml+u5+hpmkM8/AFe8GM07e8biXQnxoKcZJhxDykq0c9FGFfc9AT+/V5O14asU
	2lJ5EGPhjntr2wMAe7/vsZVoSe4H5nl8QM5L/BXgYAerO1aNr3owO/aC53ZMLhZy
	/ivmmdswodGPdQZXUQ/tvCLz9PSfa646BH5GMBKtfkKuMH3y7GVbFMZwc7khIypu
	sJ7To5yfk3i+tJ7QQTHYEhdJzl/K+6NRHGSHww6HRFVftn2iMGhOY9WqQih+nH1W
	/ymBpbezHNkhEVekGS1u7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765791200; x=
	1765798400; bh=4pHcf68OzB3iptBnKlj4zsBnNadT3/PAA/zgTFtPF9w=; b=F
	dNkAeSeX8zYK9BF6Gv5HISKTNYlUJ8GK37oAUJmhu/Ova89PjCHiBawLrtGj7xuy
	Am11m2f2+jvFfonTTvqbj4COMBC1eI5tvhb/keg7BedDs6NbHB1JCpwC1Wx0ZShB
	muH92QXwJf9ASL5FtOpDb5xdLJ8Dgneg8HLkVViyxO2c1yYWB60QW4D0jMKiUW5B
	nlHSrNyONylKKEbJRo4SIGkLKqlMKhYj0mFL+v2h0t528h6aN6KtrjFLu0C48yxy
	KBxqF0V5i6VgA6gRVV4eUTu9pX77Com+TaydjKzw6G0kmBcSYMuclzYbnedWVHAZ
	KbM7vrvkgw4Ljcknne1Gw==
X-ME-Sender: <xms:4NU_afUiU6bxvdhK7gPt4SCmCTRYjmWQw_4_YQ91vtM0v_H1A0AXlA>
    <xme:4NU_aSbUOA79coN5_-qXgwq4WxvQDD7ZWwm79xWFF7puAvsJec2CWinnR018kwfsa
    K_a-kdY44fXmCZpJ4BPOIPn8ChmGkEpdP-YC5GgPbu-Uw0AcXKyczk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmh
    grrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehlvghordihrghnsegrrhhmrdgt
    ohhmpdhrtghpthhtohepjhhovghlqdhlihhnuhigsehjmhgrhidruhhspdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghmvghsrdgtlhgrrhhk
    sehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhp
    vghrfhdquhhsvghrshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4NU_aQ_Lq3F0WtXynqUQAQjpBySIzi7Zb5CTetNdqA_s7KrpDj4LrQ>
    <xmx:4NU_aSxPtkRGjegDctBcnmjxz4iD93nW1TMo_8cU3ybbIOo1spKkeg>
    <xmx:4NU_aV6ZK6U9MY7mUsHj0kQQ5Py3TyTbScWQiKBOz5SXqE0hz2f0hg>
    <xmx:4NU_aR-8a_R90YdA5bOf1JIjMBS3Anx6EmDjncuP-4QSNxE0MBz0MA>
    <xmx:4NU_aRK2iESYRg_u0UqWRXAH4TmQcQgBMqQlQ_04ZBnSEuDSGi6bPolY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A98FFC40071; Mon, 15 Dec 2025 04:33:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV8M3mJaQpUZ
Date: Mon, 15 Dec 2025 10:33:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Clark" <james.clark@linaro.org>, "Joel May" <joel-linux@jmay.us>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Leo Yan" <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Linux perf Profiling" <linux-perf-users@vger.kernel.org>
Message-Id: <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
In-Reply-To: <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013322_473686_434E8D91 
X-CRM114-Status: GOOD (  16.58  )
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

On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
> On 15/12/2025 00:12, Joel May wrote:
>
> Hi Joel,
>
> There is a similar fix on the list here:
>
> https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/
>
> I'm not sure if commit 1 alone will also fix your issue, or we'd need to 
> collapse both of the commits in that set.
>
> The first commit has an older fixes: tag and also fixes some other 
> issues so it might be better to take that one rather than this one.

I don't understand that other "fix", doesn't that just work around
the arm64 build issue by adding another special case for arm64?

If we want the tools directory to have a copy of the generated unistd.h
files instead of generating them, it should at the minimum be done
the same across all architectures.

    Arnd

