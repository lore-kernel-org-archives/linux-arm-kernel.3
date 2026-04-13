Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CD2F34C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPqrtdPK1fzOFd0Y9/MDHGVDApYeKMdzUWsDXpmbjTE=; b=BhpJP8AlyTr7gGgUnUYZpsNlEt
	UaBB+EvcGi/l4QRxpRMkRHJ7K2FhPXxZM0VjzEaYmolap7eHUgB7bFN5hxQEz5YH4HQCVSSXRxXoZ
	JeebRlcIpb/wmuZ0VI7ZivGCXl+BCF7vvY1yV++gBo22Txj14WUWMMIQLABNZySkjBEm7vUt9XfPp
	tAhIjGUzw7DXAlsNlrKQ3Z9wDoqE9med9V0GNZGZfDvd3zvOzdGKzI3Hg/SCknjQKyX6lMmtgaQ4Y
	Lk6qUDZe4i+cOQvSkGQbys+WAe9jDMf3PDULzbKKP8CuFRjoYfjGBFGGP+s8oI7xSUr2BLijfC4AO
	zPVyrB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIVt-0000000FszI-3xgk;
	Mon, 13 Apr 2026 14:43:45 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIVr-0000000FsyV-0aWo;
	Mon, 13 Apr 2026 14:43:44 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 580C613004A2;
	Mon, 13 Apr 2026 10:43:39 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 10:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776091419;
	 x=1776098619; bh=CPqrtdPK1fzOFd0Y9/MDHGVDApYeKMdzUWsDXpmbjTE=; b=
	dThTVDJRrT61VUkRS+cdt7Y0Z5RRsLEBjlt5LbUT/Wkj3XuC1dVyKWZPgLth6rHI
	xbXnXmRzoJxvLeN5K5KTS4bLI9JTPMUMZHJQi9mq2+Mm0O8HtxzN6gdwi5dKMGzS
	o1z8qIdRudVgAnBmJYPys1vSE6iXXFJKhXBunGcqiXTQxSIZPwExbixipylrVyN9
	4kf4i5YSOQ5TyiEguuaQMFY1bjfsEzY4T5yjV+i49k3OFs/Vmf2QAO7EvG9pkkWh
	N8bT6ZPczJACaYt7v0DdNhd+Jcw1QSr4sfdnPLEq3qIenfqRfJd23mvz1BSPAcJy
	t7jf+cR2gTZwsPDeAUjd8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776091419; x=
	1776098619; bh=CPqrtdPK1fzOFd0Y9/MDHGVDApYeKMdzUWsDXpmbjTE=; b=m
	KaUdPcERkC+zzfJk9o14B4ADxV7hBFIrlwDzvbBZEzHm0PKs68AEHjccunfdwCIR
	xandwmc3ligmxNR3yrYrjDSRktpJmwg0D7TTzo3rAlmWy0gSHQXh1wFw4+NYGyVg
	zDlM8PgR4QH15XnDMMXbSfnGvjJh/j4eK/GlCalmtgkTknPnFph+dfWco8cTlWse
	WFEPDTU+OA38Yo/f8OVtqBAERl/dqEvgrfDqnngro8UiU3Du4URjogCH7u9C6eP/
	RYqA02k02M2VwiJpdNWH8HG6r4KmynyPDoJYdxTNeNoiAqYyt88JcV7BBjOLulpB
	DJUQhLG59C0zm2Z5pxrQg==
X-ME-Sender: <xms:GAHdaVYGCaKUPjfNsUorzxAck0ngCpZdPLdqJKjZEoxtd6QEkfV5yg>
    <xme:GAHdaXPKX2B9tilU84LfHthnj4XuzUMENgXV2EBsOOdx9XMImcZUEPIIzoIwFqvOh
    pcGkwnRvUUR4OUGZGU3iYkbbpFp25Dx9wq8LoeuFKlAv-Ydx1YT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthdrshgrihhlvghrsegrlhhumhhnihdrvghthhiirdgthhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    lhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprhihrggsihhnihhnrdgrrdgrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhl
    vghrsehgmhigrdguvgdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprg
    hnrgdrohhrghdrrghu
X-ME-Proxy: <xmx:GAHdadx3OaLmpgnQ-qR09fFSyphBizIiykQxx2Qr5HCiMADvCUw5LA>
    <xmx:GAHdabzajIhZOwZQz55Cqp-WmIPvMJl0Qeu3WJrRVrqO07JZC9K3bQ>
    <xmx:GAHdaSIxPmEuEecG1TMTc2ieeRuLkqK7w1Mgwy5a1Wj0e-ew_hD6MQ>
    <xmx:GAHdaVsDbvRI-p-Ezq237oUrDyOkdrmimmA3aH1JiaBrwsVneKVMbQ>
    <xmx:GwHdaelj14NT6xOHjmTv_huVndzlY2JM81Rr0b3-wFbundNAWyZ-7jZM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E9F8A700065; Mon, 13 Apr 2026 10:43:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AaL_vZcj0OrJ
Date: Mon, 13 Apr 2026 16:43:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Gleixner" <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, "Baolu Lu" <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev, "Michael Grzeschik" <m.grzeschik@pengutronix.de>,
 Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org,
 "Herbert Xu" <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, linux-mm@kvack.org,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Bernie Thompson" <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 kasan-dev@googlegroups.com, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Thomas Sailer" <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "Helge Deller" <deller@gmx.de>, linux-parisc@vger.kernel.org,
 "Paul Walmsley" <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Message-Id: <3d7c3433-2325-4bb2-a8f6-ddd11c82f71d@app.fastmail.com>
In-Reply-To: <20260410120319.723429844@kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.723429844@kernel.org>
Subject: Re: [patch 32/38] powerpc/spufs: Use mftb() directly
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_074343_228821_DBD22F11 
X-CRM114-Status: UNSURE (   6.64  )
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

On Fri, Apr 10, 2026, at 14:21, Thomas Gleixner wrote:
> There is no reason to indirect via get_cycles(), which is about to be
> removed.
>
> Use mftb() directly.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org

Acked-by: Arnd Bergmann <arnd@arndb.de>

