Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24232C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsFBUXiH8o16pSj0PWVq1s5XJ9ooiQqZ0HXBk5az69Y=; b=qTjP1E9lKXM59S0Wi3rRKGnpzV
	idDDclxusq1kZpk2U44KLWN8EjJBscoJwpitdzejQZCztBeIC3X2/wdyfarriLXKgcSnM6SKSiJBX
	o5R3xXIEIUCT6ZBqsfnsQbCNWFWODBsCPE6i0N6fC4Cpv85Vy/nbTHKf9KMBuPOtWvLJyo+LeBARI
	Um0Nm4cL2t/v0ql6B947YS4nV64sRAXnBd8TgKL1UPj8/PdgLfl3VI5HHqBTu6droILRrDczZfcx7
	DjWLWOw5h7uYqDbFaQCnjR/bSfCNtdyrleNz6HbC2gQKkcnQY0MzUh68Cx/ef4CVlGKUUlqSG554/
	4Mqcn6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYBv-0000000EIs6-0bgc;
	Fri, 21 Mar 2025 08:57:23 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYAE-0000000EIZP-2Nf0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:55:39 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F38D11140143;
	Fri, 21 Mar 2025 04:55:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 04:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742547337;
	 x=1742633737; bh=WsFBUXiH8o16pSj0PWVq1s5XJ9ooiQqZ0HXBk5az69Y=; b=
	C/jeYx/aa3rbvcxPAVVFtu72F8p7M4V81P3r6HKNZ3E5ZmMkV9uGYclPfAGKhW9d
	BIhQMJ3DrwKlrIE6tpN3AwRGL0HaXnQRT37oK8jHxupkVvCdC/78xiXx43OxvBrU
	aT0GiDpAVJ8gvsoYAhG1nQq0wQuZqgbdslfKq51GCoHbN7uhcByCDQ2lp3Q3DB90
	gr5kqSxwZDJ2eUKq8fgIbV53qH43hLrySWiGDBEcXLlNxbskuHrUFr/BE+RwdE2Y
	Gbrb8xVrasPrh8M75H0euKxPh0gQEaqSZirhxcYPGrQXOGx93HWoIcfCu8gFmCA2
	zKKrBn6C06hLwk3MgGowvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742547337; x=
	1742633737; bh=WsFBUXiH8o16pSj0PWVq1s5XJ9ooiQqZ0HXBk5az69Y=; b=r
	eWrdfSzSZkxz3/2t+G9UlXu/9DpQqJDgutuHy2FwE1hcHyLFYcJkLyFxxZttWYeP
	50vcXEsfXCcBe6ulmf/ZL0ml+DkLIcmTUEkWhbeUJJ2VBUMi6k3vZ5PminvfxnSQ
	rMe0ZYlaXHzafxfut9lKISbVKdtKEdE4OB2M4/2d8GEvYNb6XlYgphzdGlRvuUp/
	3PXeuq0GK5M1851onYg1KKl0dM/G0qG5GaqOg8m3usRlEcSlO/dfFi9eWFcD5PyG
	SFhgDVdxMTM2OC2aYmJ2Kk2zWY2LPXJlIlXY919/PANKdCaFGKDc8wKGmgf+gnhl
	9x19t1AA80r8NbULxlDHw==
X-ME-Sender: <xms:iSndZ-AJ1dwMzdn1_uYJzPPqx6MhDid4fCxep7rT-Qjr_Bjt2nN-tg>
    <xme:iSndZ4iQChBiKtU4o4KyZ2ldxaZveBxCxxFK4J1ZdNazobnlrCwAcxAUSMSfCPTw8
    s29byk61_3YSV5_Vxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:iSndZxkSGnfU1YuwFS-XzLWPJ9CLO78zW959QBtWJ5zMn8iQIc0Dfg>
    <xmx:iSndZ8yWS8TnciT3flYa4l-_uURahtMecdk7IgX4iNaWhePgjuJ1DQ>
    <xmx:iSndZzRB_qWnPwGHhcifyxRrwijC5mJ0VwjneZ3sQynVB4E0YFxPYQ>
    <xmx:iSndZ3YXrdAHM8AFGDC7nTmkCSFJpZcLApE4QL0UyJohia38-OfM_A>
    <xmx:iSndZxM2LEDJbbuGzhDU3rRKl_Rhq78T45nhu_ftTrJCqFNo9iqReJZ0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BFDD2220073; Fri, 21 Mar 2025 04:55:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T03b4c03f0ce6f6fd
Date: Fri, 21 Mar 2025 09:55:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Rob Herring" <robh@kernel.org>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <1eda0df7-a797-43b9-b3d0-3d1855b58e38@app.fastmail.com>
In-Reply-To: <20250321153800.639f03c5@canb.auug.org.au>
References: <20250321153800.639f03c5@canb.auug.org.au>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_015538_673076_5DC3D4B4 
X-CRM114-Status: UNSURE (   8.32  )
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

On Fri, Mar 21, 2025, at 05:38, Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>
>   a78f7a337bc7 ("docs: process: maintainer-soc-clean-dts: linux-next is 
> decisive")
>   b31cc6af1bb1 ("docs: dt: submitting-patches: Document sending DTS 
> patches")
>
> These are commits
>
>   a42d2d53a6d7 ("docs: process: maintainer-soc-clean-dts: linux-next is 
> decisive")
>   d98d35d99e0f ("docs: dt: submitting-patches: Document sending DTS 
> patches")
>
> in the arm-soc tree.

My mistake, I saw them in the patchwork backlog and applied them.

I dropped them again now as they were still on the top of my branch.

    Arnd

