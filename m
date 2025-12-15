Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB502D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQmhYgUl0R3ZoA9Kzf0ZNjLsJ7LHllV2YtG/6mbLmIc=; b=zW64utqlpjN0gDk9fmwdzUWMyx
	1Jca5UnZfs5j9UkTL/Yl9TYgEx6lS7hZE4euM35No6MIpRO+0CV6sr5dZvFlrdSBbynzWmBUVsrLC
	p3HJQ7r5Wgy50R9rcdGlU1U1TJX5bFgQNRlvlZsqEH9vtyLPC7BPbjssUnJG2paacctobQAszuIS7
	VQfzzTL2dlVywd/695lCEOdFxnQQBpydSApGC+ch71cxgVD9v1uFlw3zzrOMqdzhjexOgyFkmWklE
	p3eLeneRq1tZv34TAMNDJNN7OCvL6BLbRHRBGDQ6nPpPSsTiZe2V6VXLS4+Xc6AG4S3cfZV5N9UmT
	kmsRlGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV48D-00000003HfE-3Osp;
	Mon, 15 Dec 2025 08:40:37 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV48A-00000003HeO-45xB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:40:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id B879A13002AC;
	Mon, 15 Dec 2025 03:40:31 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 15 Dec 2025 03:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765788031;
	 x=1765795231; bh=zQmhYgUl0R3ZoA9Kzf0ZNjLsJ7LHllV2YtG/6mbLmIc=; b=
	VqOX09Gl1gxCf35lMhsjA6j0mX0XFP3E/qqBQQ3cOM6i+f3foyzw4MSmFq5vEl8g
	XjTpKQ5ZOE/oslCrnHTD1hTmMSfJbzSqzxMbxqQwwiRNuGl3uJC0B7COPmojzrGg
	REvT4f9POGAZei7S9+AcxpzWua15SuXPJieMlXPkhSzTrsR0d1o6zQEBRYREs+RE
	Ou3Sp7HaVcvACU28sAfLESA8zdbVJ0dPeKZpQ9WH2Nwod0JMdCf4A3oBzN5gIsO3
	hALI1O3+IiZXU6fiN6fE/7EUGa4gWTZbssjvwbO2tWq0rgFPM+L/C5Y/yhPFWE0Q
	e3FLic6kg+zMqOUAsF/K2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765788031; x=
	1765795231; bh=zQmhYgUl0R3ZoA9Kzf0ZNjLsJ7LHllV2YtG/6mbLmIc=; b=Q
	UM+a1zpEbITXo3WWWuA6DJS7sJpi6vq4xQPFzjn0RRsCZsg4oamYT+6YFlM6B35g
	5QrdJ5ovYZD+O5tA5ozFKHV2V95KNjdGg5GG1jpdV0aVuxAFBkj8yNPhKIFLmhdn
	PW0bIJOLcMhBMly4rvtY/JheR1iB/DWkMFYYJKPTpWnAOajurXwe4eiiQgE6m1pz
	aET7r4cYyDMdzyIBw5LFf5nvPJeq1sIYLTl6b9Vxa2m0cjawr3En/Z+R2wJyHapG
	rUenVdNLYWKITegHwVA/kf69eZgSOy2KR5C6YaeqJ9DZZzruSF3mpZZYXb7sUzfC
	oFGbRJnkKPoL7qnaAFFBA==
X-ME-Sender: <xms:f8k_aS0Uf7ojBtvJ3lxmb-KQXXW6F_mpemjWtUQvE1BMgQUl-5_B-Q>
    <xme:f8k_af7YRg97HjdaSZHUGgJzZ-7qqjBwzZ4ULHDOE8XoIyibYW588mNAlw2rmTbeW
    jJ9LJkrW7PD4FLTexGojxPcWw_141LJd478KGTGnL79O4Pu9ITyrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmh
    grrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehjohgvlhdqlhhinhhugiesjhhm
    rgihrdhushdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epjhgrmhgvshdrtghlrghrkheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:f8k_aUbjpxesmrRuZgIU-_sEijVU7hrbCX2efuivesOQHioloqPZxg>
    <xmx:f8k_aQ7T1aYnBk6w4ouIfKuAHKxZ7a7FxqDpW_cCk5whmtfTFtwx-w>
    <xmx:f8k_afAtpw6ctBVzdJA72NKhRObdSENM7bLAvaS-L83kvGgP4ogqxw>
    <xmx:f8k_aeeIsO2Vwpg-GvihzjEVqs4sysICjqr66pfuJqwsfLM__7ymdA>
    <xmx:f8k_aR6b-QnZSdJrdnhJUrYhMqJDTv8IjMpZCYM9aWrjBV1-IOR2DKw8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A7B9C40054; Mon, 15 Dec 2025 03:40:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV8M3mJaQpUZ
Date: Mon, 15 Dec 2025 09:40:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Joel May" <joel-linux@jmay.us>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 "James Clark" <james.clark@linaro.org>
Message-Id: <fcc6ada2-8a4d-4989-b257-e4ba17d5d14b@app.fastmail.com>
In-Reply-To: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_004035_445744_5EE162B4 
X-CRM114-Status: UNSURE (   8.77  )
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

On Sun, Dec 14, 2025, at 23:12, Joel May wrote:
>
> The problem is that scripts/Makefile.asm-headers is including a relative
> syscalltbl path from arch/arm64/kernel/Makefile.syscalls.  The syscalltbl
> path needs to be based on the srctree root.
>
> Fixes: 7fe33e9f662c0 ("arm64: convert unistd_32.h to syscall.tbl 
> format")
> Fixes: bfb713ea53c74 ("perf tools: Fix arm64 build by generating 
> unistd_64.h")
> Link: 
> https://github.com/truenas/linux/commit/91377b555a57dfa75364d7da85b5e21e41e81625#diff-831a0e8e3eaa7a5ca92599e58771b8a6b2c4bd7533f627e33138873995aac61eR147
> Signed-off-by: Joel May <joel-linux@jmay.us>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

