Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BCFC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA75cmb4q9oaSiGTVBpWOcTFkhaeDK+5Y2JGVmDb+KI=; b=lKidWMo9pVMOx+pcVr9mXBg02c
	9LZjGNWOGAXXftRxuq3qoMOssTGhfstwskrpEGZefJoSzWrum8AXIkXgs+JIrMZWDIF81JzxlWJJi
	TkR/2zYkbjUHj1W7hsIZZjMrQYA9raZ3WlyLH1t4BdeO06J9UK6jjPQ+gOEzfZBPirMKxZS8zM4HQ
	4VTuEwKpLK8i9enfJWY3LVdjbjBlYCNAh+ozIvidwSD3i7Dvy1EB5H2ZHeMFhgOxJ7YjXySk9YIJ+
	4HIBa0WWziNqJRTNFX+vS3tsJO+8phs4NmKUgdcMOGbkibw5GXDfHJAKKE9XpOcZCbF0F7knJD084
	h1VxeAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJWB-00000001nKP-2rxx;
	Mon, 27 Jan 2025 07:26:47 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJUo-00000001nC9-15J5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 07:25:24 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 964111380ADC;
	Mon, 27 Jan 2025 02:25:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 27 Jan 2025 02:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737962718;
	 x=1738049118; bh=PA75cmb4q9oaSiGTVBpWOcTFkhaeDK+5Y2JGVmDb+KI=; b=
	BCTaA27HTV/pZU6PkvC1pFJa1F4qOXTL9gOgJKUZxGJjgiP21HI+rZ2kvxp80eCH
	mk1tksPPvhXIN7tiJsc4JSV5rRSduGaWMiC3Y1X5YPxKx3bQn1W6xwU0Vzsqmb8d
	/l2QahcsoDjbAWmxr6qczVcT+EFIcFTm1bonpjTPvs/u7PABxDmVRSeZh96uEzZG
	BTfSFNDJOrUsjYBVN5EQPQCcJ9gMrIN6iany/KfzwJAVYHLekGy4vxzIuHS0zNwQ
	yZOJnZQdnOfuuWL6NW+KNTDKeRsNGk/1q7KZEIe0x/lGa1kHXJxDvQ2Al+vSS96j
	DchWx9zlsjBCJaqu41cKzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737962718; x=
	1738049118; bh=PA75cmb4q9oaSiGTVBpWOcTFkhaeDK+5Y2JGVmDb+KI=; b=t
	UFrBF/ZwRrIBpuvG0sS1D4JkFWDbNVBLbqtrwEKeEfQAh0/aVmUAdOtc3bjU1GwV
	x6N/NocdCHQNC98tGlHuDVWqMt7an/r7d5YNme3IPneGnQ7/VZiHOEbAe5xab9yN
	WV36uXwsezpQhQR86DBo5uFHzZyz26H+G386/ZW5ibY7mnVxChsFzDkXv9HeprjG
	PDiHvs41OcRV80uUbPsAFXTgRSebxGhfKrCKEmnS+dBbEo/rpa4/diJ9xTlrBati
	/nOlVQd4es5OVoBbq+wOa5tufRgI8PUEIR0eC9vz+l6BmFQ693aCWO1+XD1m3jQr
	V/UZ+9mV4LeMMVE5VGIZQ==
X-ME-Sender: <xms:3TSXZ5ctuOzgKyf-7l6wtFVmypKTk-WI0yQq_N3tR6UvCTHxUaY_Tw>
    <xme:3TSXZ3Mvi4QxeUokTwEcvx8pMJ9E82mlD5oNf9sTSmd9AUMb09IfnZ1lLx7MCkkNH
    -5fnKC1R2EnuIeIHOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddvheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhugh
    drohhrghdrrghupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgiht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3TSXZyjeSOubUFL9y7a7SekOqG_Ne-hj75EHBo765xru82K3MjNeUA>
    <xmx:3TSXZy_zYWcZevFDJuA75DrfYMKFtAqmcRSkBVSL46jL0OIlViNhuA>
    <xmx:3TSXZ1uJyDJRlwbTnLhZsnfvyOkWirnLh8i8lqQsUdNB_9VipE1RMw>
    <xmx:3TSXZxHalNXrZZqGByis5s48C7NgQelZBpzo3wynufJjGlnuNB4SKw>
    <xmx:3jSXZ9IQvvTjJxQsn6yccxBA2zP4d9TDoblCvw-IWwqJiT2SmPQqodCe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A82BE2220072; Mon, 27 Jan 2025 02:25:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 08:24:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 ARM <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <0cf32861-dd67-4c37-95f3-066b3f77e85c@app.fastmail.com>
In-Reply-To: <20250127135717.00817b0a@canb.auug.org.au>
References: <20250127135717.00817b0a@canb.auug.org.au>
Subject: Re: linux-next: warning after fetching the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_232523_203656_531E2E13 
X-CRM114-Status: UNSURE (   9.27  )
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

On Mon, Jan 27, 2025, at 03:57, Stephen Rothwell wrote:
> Hi all,
>
> After fetching the arm-soc tree, I get the following warning:
>
> Commit
>
>   1f8dba7e7b83 ("soc: document merges")
>
> added this unexpected file:
>
>   arch/arm/arm-soc-for-next-contents.txt.orig
>
> Not a big issue.

I've cleaned out the branches now, thanks for letting me know.

      Arnd

