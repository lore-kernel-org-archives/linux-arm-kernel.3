Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A0D358E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7Uq01nsUAbxcpsw//fEkbbEWwG3leShOVNkoOyKzzs=; b=xo2ZxTcrRnRySRpmep83jCZQcD
	DdzH07OKFxNt+WGNlnwCPv+eOFklMcI2yl5HNnnPPn93RU68ZjTZGc/lGM6X2/yNZbYAolTgvbLvm
	gSxojwyNt0PpFakOOxLXWYNhceUDNp0v3fm/Cb1+ZnoRbPgLPxA9+2UpWfWo4cQYqNRiDrdEEdewl
	s4jwygkBKbtNyy4n5CUvSAQJkI+iQ1QCinTEBGZYMt7rfsgEc7Teay4mC6a7N08n9U9lTBM4ffkL3
	H93FwpC53g1BxsVUU57EORiiyiMZSnRTvyz0RId6AG5we3GZJudiuHwoKoClOv+Tl+QxbdMPZvmUq
	x8xLigAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOEv-0000000HVai-39L1;
	Thu, 29 Jan 2026 09:23:01 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOEs-0000000HVZt-3CKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:23:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C63E17A008F;
	Thu, 29 Jan 2026 04:22:56 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 29 Jan 2026 04:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769678576;
	 x=1769764976; bh=t7Uq01nsUAbxcpsw//fEkbbEWwG3leShOVNkoOyKzzs=; b=
	PBNGEmvyoaTqsz5uf/QdoRkvy3AsIVmy0krtCwSXSOZ3sNS396WMf7I0HyrZaIq5
	exwNGHpy9m+Na+63ca1dNsqST3g7JSS2uT3b4xY/mc1BIzHUxXkGibCDvKn11xTC
	r9rujvvN3K49Y9W1VQb0ECVtCYb1ckol3aoIbAX7cDf996DjITVcmVbFTCLz7iaA
	Vw73i9lKU3KcIznVUmfcDV+5ruR4rrX1KBzHXabctSwFYkYPN6CnQcDv6kix8b9p
	vfhVgiquYiFmdaOCYG8U66y3L+kLuqPSj/vCElbOWwN254zJaGBLUCbhoTT0SZYh
	9eEjiY7k5I/RO3NcljY5cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769678576; x=
	1769764976; bh=t7Uq01nsUAbxcpsw//fEkbbEWwG3leShOVNkoOyKzzs=; b=E
	p+vFh8/eg3GyA0XWQSmZxViO6DTodO5FXT07FMIXMvLsse9jI4gDjpzk7NRl61Xc
	Y9Kya0xNy7NKq0JoGUQ/jsA2TpO6vMUdMI7QOew2dx+lgMxcpVV9afKNUp1/FkZG
	KR3aUxaRcn//PX3M13PfPlCp+SSNu8hn3fVz0Ue84DNnHS1Qsal1mEMSF5jYagK2
	ngIG5EV4XeSe/insMe1mR5e0yEJNn0npllFSzt4kDJQiQxPBw+osY+wqIUPlW7mY
	8HgasAzpsTBMQnIUXn9B9WfbG9tOtjn4yb3ndrW7pMy1vC4ot2SNN/OjHgBuWfEl
	I+SF6IAXx19qdfmWqpvsQ==
X-ME-Sender: <xms:8CZ7adWaISbRV90l7Qk3rxyrgYOlb5_F8i9vZ5M8fV1cmWgkm0567w>
    <xme:8CZ7aYYeVbtE4sw1CvBzAfo9AgxhEdqFk1t1dfnRcvZrpN3oeRq-67U9L8wDbTdlh
    AV-NYUK9Rh2SYFNBIN93MuemPbW0oWBFBNK6WkX3T8h5AseGdVafwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhkedthffgtdffheekhfegvdfgvdeukefftdfhheetieetkeeuueeggeejvdeu
    necuffhomhgrihhnpehpvghnghhuthhrohhnihigrdguvgenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkvghrnhgvlhesph
    gvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhht
    rhhonhhigidruggv
X-ME-Proxy: <xmx:8CZ7aa_DbcMW_qaPYSiGHoF0s0cR7aizWhid7LWg7zvFoyIlVX7LXw>
    <xmx:8CZ7aYiZ_9MPkbKVEAOqO85OtPT3lhU4zUdiJAR1g2q0gXFB9rOYuQ>
    <xmx:8CZ7aafEZQ4BmBkpM9pQqItLc17ci-rbvMthffq4oEZdLxHUwvvtEQ>
    <xmx:8CZ7afoSjfqcAxJwPeNh-TdpMbfCgIZ1oO8e7DDFCzNS8HhPmNsybw>
    <xmx:8CZ7adinhH8BxTR_4F_nwZAdgTHauLlExWHN3pFGAvqh83tZeKtSufpG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 45871700065; Thu, 29 Jan 2026 04:22:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUiDU-RBgMOg
Date: Thu, 29 Jan 2026 10:22:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>
Message-Id: <04afe35d-260a-4ff7-a06b-1fb79b553917@app.fastmail.com>
In-Reply-To: <20260127102237.3945322-1-p.zabel@pengutronix.de>
References: <20260127102237.3945322-1-p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.20
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_012258_848736_CDC9F904 
X-CRM114-Status: UNSURE (   7.88  )
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

On Tue, Jan 27, 2026, at 11:22, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.20

Hi Philipp,

The git server appears to be down, can you figure out what's going
on or upload the branch elsewhere?

     Arnd

