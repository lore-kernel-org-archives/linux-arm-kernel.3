Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E75D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9YOBZ5miiA8PQ9oxv2tW/ypKDf9bSv32CdHRlk5ulA=; b=A3qoh5lUY1c/HfdYXdUGKnzdrt
	uLrGJG4WVhq8JqGPKkyijlw5aGtksOd2ShCw/InpkaPQo5OJLp/4QBfCixuXa6IaqmY9UN3UTSWgu
	Py0Jm+jpuH/XdWSKbwDgAPWC3YIqH8+YlkS5xPxV3qPc9Bd//zDnemsqoYEptt8Un8ppqmpaoazHN
	g3bZASfUCvgl9Zz/9eB2xIVf/v7ixniQiJ/eRMliEb0SG63Eey4fS9KqsughQoV0GFtCaA18KGfVP
	82xgKBnlDHBOcOu4Twh1RkySG6g/M28JtEj4Biwceg4RePiT17cSsKDNhC4H5J0BktGKV2t5dNDLi
	7LS7pQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Rq-00000003Z1h-2oTK;
	Tue, 20 Jan 2026 09:54:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Rm-00000003Z0g-0q26
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 09:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h9YOBZ5miiA8PQ9oxv2tW/ypKDf9bSv32CdHRlk5ulA=; b=cxRdOVNXd8SEVEn/PGQRc8LC1v
	0XVYoB2sTVb5eG92qdWwpSX9snOl7mz8HPI4ijcLkCZZblksT8AOURiXeKBpfqDum7WG9RlFhbRtA
	ChQ3v1nOxZEaXBR0WCByvInmsVsW+7UHcQ+4AshnVDP+NIVn5a5a4gWe2iUDdMka9s11wy9t1fy3l
	EGL2JkRziy73u5yyu3nOd/2dLkooMELEhmOohJzK9PJ0BX5n/mxAu5GjOO9A4XGoZGP3UiFfGpXXp
	fB4kCF6NHsXOZ1QSN2r2qwOR5xABISTjgzYXbF+9yuz9S5Kz9CUe9IZXYUrIVgJR4KlNOsjF8H/hT
	TLR0H9YQ==;
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Rj-0000000DkTR-0TP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 09:54:49 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 823CB1D004D8;
	Tue, 20 Jan 2026 04:54:41 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 20 Jan 2026 04:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1768902881;
	 x=1768989281; bh=h9YOBZ5miiA8PQ9oxv2tW/ypKDf9bSv32CdHRlk5ulA=; b=
	HgxF9qNj8nDJPnfVzduuoMTz48JeKsZ4iIf7csB+WxSy6MzYkD+8VKdmLhkrrTUo
	dbOkuDnEPzA0WYev2Ex+/GbMHX3DH/uorAyVi9ZXQ5IYQmfRRsJiYA+9srbPrvso
	GrTBgWmT6EQl4Yn11rtbGXPEDk0CDFG6Fg9VCZVEL9b9TmAlAOtMXl68YZQFxJMg
	L02cbe8B43H1fWd906RcbORZCvu86oPGrZoan8lYk6GLyOBDVUi9ccfoedTuwn91
	/YlFVQgFFOkl5nybY1oyCtXPYDoUgZp+nXh4/ugjX861LcRBLNOuM+cgP5Dresky
	G8ZEL+8GHHLYxqXOwUQNSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768902881; x=
	1768989281; bh=h9YOBZ5miiA8PQ9oxv2tW/ypKDf9bSv32CdHRlk5ulA=; b=P
	EYSiO99u2dbMtG4ECgu2HZVRGKJsAWlm2BQ5QMdhV5bxZgGD/qS3v8uIc1rOoxC5
	WVQQi7gql8uX677q1TnbbKjDrCgiAYEsIn0RDYP9Za36p4eNxgOYM1qHBLuOp4rz
	2MRZzqbr0Rtwgwx+Jo6T2nWZcAYkA2q+p4aln8AhoKeX/pHDqy+gw1yXiBsArwVE
	aew9Amn6s76KTWWaSEPrzI9v2/08coTP29lNI1HmoQbWTCA40GPJP8Eit6+me0vr
	7sbvXN/z+9LLMh00k72+qt8N5ohSw96OiAjJGVs/dXkHIxQxSo9kWDdNLD1dvzGj
	ssSGFf/irV6LxO7oxWB1A==
X-ME-Sender: <xms:4VBvaavqBQN6V45_fjcqSkXkxSarv0cXq9fyyjbwGS6elw2XuGfJhA>
    <xme:4VBvaaRgjRW-hHcCt3KrlhPp4UXQZpD1Yx3akddhOtFzg22IDrd83PO3Y3lg2vcFy
    wD74tYXUOZ3WwAC-SoNT7_nNr9odfCg2fp-uerEoGX5TNSHMTzyA0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedttdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivg
    hrrghlihhsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:4VBvaWN89djM1sHAlJQohFEzIVkbd5z31i-70Rh7B6ZYY72KbhkDeg>
    <xmx:4VBvaf4GuwIeBfkV2Sbv4W7Nk47M94iYO_4h_Xe0OF5Bczm9wlCDoA>
    <xmx:4VBvacSkGvZpksIsczbTvjMTJX48-VY4F7ONRJI2G679yvaV6CF2Gg>
    <xmx:4VBvacBD3pSQJ5qmi4MFr01yA_YHltgMVkWvejCdUIvGkGeNPfIjiA>
    <xmx:4VBvaX6qes0kVi2nTiYP1tT29Kw1mPGzypiCmTHM8lpXV2Y8Ll35U6Bj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 20692700065; Tue, 20 Jan 2026 04:54:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AyIhq_EbNuZc
Date: Tue, 20 Jan 2026 10:52:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marc Zyngier" <maz@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Thomas Gleixner" <tglx@linutronix.de>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e090dcf7-b55c-4bbe-bfba-482cf318463e@app.fastmail.com>
In-Reply-To: <865x8wd5v9.wl-maz@kernel.org>
References: <20260119201603.2713066-1-arnd@kernel.org>
 <865x8wd5v9.wl-maz@kernel.org>
Subject: Re: [PATCH] irqchip: gic-v3-its: avoid truncating memory addresses
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_095447_401249_7DF90D96 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Jan 20, 2026, at 09:51, Marc Zyngier wrote:
> On Mon, 19 Jan 2026 20:15:12 +0000, Arnd Bergmann <arnd@kernel.org> wrote:
>> 
>> Change the itt_addr variable to the correct phys_addr_t type instead,
>> along with all other variables in this driver that hold a physical
>> address.
>
> Ah, nice catch. It's amazing that we've managed for so long with such
> a glaring bug. I guess most 32bit VMs don't have much memory above the
> 4GB limit.

Right, the upstream qemu model specifically has no lowmem above
the limit, as its RAM starts as 0x40000000 and the most lowmem we
support (with CONFIG_VMSPLIT_1G) is 3.75GiB, ending at 0xEFFFFFFF
physical.

There are some SoCs that start physical RAM higher up, but I suppose
these were either never tested with CONFIG_VMSPLIT_1G, or they don't
have a GICv3.

The patch I'm testing with allows lowmem to be at physically
discontinuous addresses, so this can happen on any SoC that has
its second DRAM controller mapped to a high address, potentially
even with the regular VMSPLIT_3G or VMSPLIT_2G.

>> I checked the gicv5 driver for the same problem, and it correctly
>> uses u64 variables,
>
> GICv5 is strictly 64bit, and cannot be plugged on a system that
> supports AArch32.

Right, makes sense.

   Arnd

