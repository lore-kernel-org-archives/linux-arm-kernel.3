Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F2DF34C5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+t/kQciCWPYQ9TuTtwE8ePqtDE4emYgbGk8M0JrxkM=; b=dTqKxvqFuJ2GemWoVUP1AzKXGP
	OFK4uHkVkz6s6S1XRj2h/VppQHb1NydY0GXlvKeE6/zRFONtGD3og5bPfuIJH0kmWeeZCQ5xR0Jew
	Qa5cDgLIZZ3LU42Qy95cLMoQXWrxGFLLry1FUO7JncOBAdtlByEli/AckBu6xkTWR5RBKRexKSxg9
	g16YlZE6Q6dAe5GZ4rrdWPndZSORiCuV2GcvWyZR2bzma4YqQ6DqYm4E15Qn9DzinQCTAMfYcQQGB
	cGQT1ZEA9YKGUqw7rAX5lCb7yCvs1VdvdSuBPC/x5xQIwHTnmKBqxF1g8bxFl1eGZlLVGKm8ENIXj
	n/0+awSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIXX-0000000FtMD-0gQ0;
	Mon, 13 Apr 2026 14:45:27 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIXV-0000000FtLh-1188;
	Mon, 13 Apr 2026 14:45:26 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 63FD713004A2;
	Mon, 13 Apr 2026 10:45:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 10:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776091523;
	 x=1776098723; bh=I+t/kQciCWPYQ9TuTtwE8ePqtDE4emYgbGk8M0JrxkM=; b=
	VAzPN0Q8M06ZrISBiijyTlSN7zZjXii1iyjsU0Nd55Go1hDvnVgLbRCBducupWL/
	I7xPJiEoPevkjLJ80mYbEW/a8BVGP+DZJqRCjUfrjm3tX4hey3YtL6Qx00JZuF8v
	WjI3i2GDGrKOX6lfMDr3NkI8PTwxLuJCiP0sOV4NGpZgf3fzkLLYGy+I5Zeauesx
	Pa7bVz5nZwM+gS/NQ9njvgK3O3s/OSp/mqYNiLR905iGGN0vAev7wD2BsAy/ZN5n
	HSi20BHM/ZKZ23MgIDcWnPLPjukDeFEfSjoTKa2sxYcORDHf2CMGKzIaSruFiqz+
	oZNoQZjdZwrcCPF2MdR51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776091523; x=
	1776098723; bh=I+t/kQciCWPYQ9TuTtwE8ePqtDE4emYgbGk8M0JrxkM=; b=q
	ocQPWN5vz5eOrV7RW4YLt61EpInPDUzfRCh54wFp6y2Qkmlnv6ZW6xi1Aoq7RlzZ
	r6AxqNsae7V2QoCSPbuAl0ssOCnVNF+Nwe1zzee6gqmSKirEjbwPzN/lznn6IgkI
	jFNhpABUlOOZaUVrUhHeH/vSP+NehNFWpty8kiiS8k4XWDW1V04VNj0ojxWNDsG/
	IfeL1IDdAfa9wVDrNQg30BEe1ROTtYd65N72SkxvxptAHs7jfN3985PGHUPTFvJI
	wKmIau3hzR296XeSLQyJhwIMCCxcc2mnbgbKz8VUFGlqAJo5mE6KGja1OZI6dhmy
	PrqiKmwzjhsEhLvP09Hgg==
X-ME-Sender: <xms:ggHdaTXgJGelzz_lzrVxB1-qyO567-GVmNc01ydITgap5FTeQTDzsg>
    <xme:ggHdaWbojY5ZlN23wxAxRcQ_6Dhj9KvjWf-KNsyKBcK8W8C_Dp62np5kJfJ8b515H
    9E3UwX-YmVDxTygAoDQVAtNvx28yeQKuUCb0K1tX4I6jWCY1o3q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthdrshgrihhlvghrsegrlhhumhhnihdrvghthhiirdgthhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    lhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprhihrggsihhnihhnrdgrrdgrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhl
    vghrsehgmhigrdguvgdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprg
    hnrgdrohhrghdrrghu
X-ME-Proxy: <xmx:ggHdaWvF06daWzpSpjs739v0aJtN6iuik26sDQBaw3w5gAf8SR2C_A>
    <xmx:ggHdaZ9awg7nUXhN5OpyKRMUZCbM9osYFN5RNP6GaSqeakIU3Racag>
    <xmx:ggHdacmWL1YHAZe8ol6oPFOZFwQU0SOjOVhuke7wt-o0cNx1zs0O2w>
    <xmx:ggHdaXZVfqhFVoJvGmfQg_vToEFHdnDFmb_H9i_ab2aUXdlRPO64dg>
    <xmx:gwHdabAQPN9OqlO9_5-GhrI_SeY-FYfEJ9AFMKsVeX_HsRytcY0IapPu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88869700065; Mon, 13 Apr 2026 10:45:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: APG-r6FMkt-Z
Date: Mon, 13 Apr 2026 16:45:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Gleixner" <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, "Baolu Lu" <baolu.lu@linux.intel.com>,
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
 "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 "Paul Walmsley" <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Message-Id: <0166c8e1-b19a-44f8-aab6-f8f161c8542b@app.fastmail.com>
In-Reply-To: <20260410120320.163559629@kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120320.163559629@kernel.org>
Subject: Re: [patch 38/38] treewide: Remove asm/timex.h includes from generic code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_074525_324296_B5CEB7F5 
X-CRM114-Status: UNSURE (   8.11  )
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
> asm/timex.h does not provide any functionality for non-architecture code
> anymore.
>
> Remove the asm-generic fallback and all references in include and source
> files along with the random_get_entropy() #ifdeffery in timex.h.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/asm-generic/Kbuild  |    1 -
>  include/asm-generic/timex.h |   15 ---------------
>  include/linux/random.h      |    3 +++
>  include/linux/timex.h       |   26 --------------------------

Acked-by: Arnd Bergmann <arnd@arndb.de>

