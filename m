Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E701BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=; b=T2ivO2X5YAFqMvKPODJ05o3lI0
	OHgzgv6L8LU4QEKjTgawT/z/3jAqciEPAUpknYJcB5zNSkNc6Xo3OyP0JQePl3uyLaIgpCQ6OXqRt
	u6Wfb//tUjtZ9PVgqkeflgGOAT8rsyFntasWSER1HuWPCt9vVrnYB76mRYjvFGfals5w4ecpAZ/Kx
	qkNfeE6lv1ww3RtJrj+5eThEmULwcUak4TQIKpxY3bVS5XDNvZ1GAnrwULuGG+MYbFaVXzTDoF8g8
	ZwkdxOddAVrWI9/r0uMsb2HwYMVb6Y5osXux43YqGIUUUfVq37nCGJRvOGT9in4kgia1u7Fdks9J8
	tmitT/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1JS-00000000y8s-0kWp;
	Fri, 30 May 2025 15:06:26 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1HH-00000000xug-3civ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 15:04:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1813F1140178;
	Fri, 30 May 2025 11:04:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 30 May 2025 11:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748617449;
	 x=1748703849; bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=; b=
	QBtOCxq9do11N460argK6gxYJQQgamiGMYhP+WkMtjou6hdHaZId5Lji4cGBvJTs
	qByRoPnSmF7ts1QIXMKdVCEN9ZfqAXWm8JRCJeOaBv1Sl5f9G9v8qCuOTQFc5JnX
	mBV5mrAW8GZyg+3DMwygiXrBCHDGmOij2HI6sVwarFi++OoOKgb5he//21XgHspd
	ovzb0eWMMYxNzMRHkjku4IoV3+xfXwLs7j1GJpYCGnYNeDh7EqwMRr3A90bsLBmL
	ywDuo7cQuv3b04JnrncZW6pbt8oteGrvJ0K7k7iBHzHATy6gSpDkJ3L4ny7TI5D9
	Xne4oaShLbQ95ho3eOzPDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748617449; x=
	1748703849; bh=KALkRHWr2x7oc2NfUJmDl9Xk3d9z8IS4JawLoIptgoU=; b=j
	U7y2yoS+dyun7wHJ6cLzj4vifsyBwIFjOBpTMa6i5nsrKSVqB55zTqtp0zinMbn0
	0SZYVz9/AoOtEYI82YqeMj8ROlvFl+1rD2/BTzpjkSna+/5uQE+s/Arl/6XRve9x
	u5I6JbCOWL13OBhzhcPy/9RdQiDvrrH6SN3vlcZvycaq8JC2ts73ra35C7/wuZ6C
	6lUR9GLhDM18gFUw+HFoZOObrFBUmn6TOZZsuP9n6wqbylmoJ7STLinbFUpdMmK4
	xmjNvMqys0o9e5cpUOla8LLeKo84AYajjKfus5+rIXDIkNxkybwZpfM8db+LbVhC
	eveGlG2pxJ8Z2xCdJxwbA==
X-ME-Sender: <xms:6cg5aFq57vf4FojijZQkOTa3L-su3drEJpN3nTF-6O1DlncF2-yq5A>
    <xme:6cg5aHrjGT4ZanblcA1S-fOESExth9HFvvusYohN-YJF-OyxTsxH1aB_N9uBXexx3
    6VcT_oJfGuKrh7BfpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleeffeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhfeejhfevudeg
    keekjeevgeetgfevfefgueegtdekudfhgedtgeegtdfgheffkeenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmpdhllhhvmhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtph
    htthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6cg5aCPPPSuQPYWQYAyNuIW6hNzIlvl_JHjTVJFd8dbo695Oq3ZZQQ>
    <xmx:6cg5aA4QkoRfDrBZTcEBMWYBNvE1k2JL51BICdjV-Nbsj4W3JuSAJw>
    <xmx:6cg5aE4uydm8M5CyBeFYHp13m3t6cwb7-07tjkqP5ZDhshX09_so_A>
    <xmx:6cg5aIhnEU_CWBGCEtINzFb7M2GOpwsGc8Zo-Cu3HTqK-_4rDxvNdQ>
    <xmx:6cg5aK_Sc856ITTyjWvdzqWctIyz-i-Zoh5H7CwSeb2UeGjD1mVu0VOf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 748F3700061; Fri, 30 May 2025 11:04:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5be5ebf0a6c00b33
Date: Fri, 30 May 2025 17:03:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>
Message-Id: <35249898-a48f-4a9d-b586-2c6231136b6e@app.fastmail.com>
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
References: <20250529073507.2984959-2-ardb+git@google.com>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_080412_495801_FF55AD48 
X-CRM114-Status: GOOD (  10.24  )
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

On Thu, May 29, 2025, at 09:35, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

I have lld-21 from apt.llvm.org, though with a slightly
older version at the moment:

1:21~++20250418112422+c609cd2df981-1~exp1~20250418112440.1395

this version still hits the assertions on the bss symbols, but
I guess we don't really have to worry about pre-release builds.

I checked your patch with the latest ld.ldd-21 and an earlier ld.lld-20,
both work fine.

Tested-by: Arnd Bergmann <arnd@arndb.de>

