Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECCACD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=; b=nVwm54oTqO2+/9PsUz4osMR/M1
	PmNhLVzRTuVnd14JKDVjhWXDrr7WT1pVEVDjLamh91X4H+vuRQrfSD0mPs4UOty+otGlU5A1ChgXF
	almKTccS9M0M1qzXFs9gvfDlzF0/41nYLGYrcQknQcXF5OKK4Rp7lWtmZZtMuXOxqeA7wPl39LP7+
	0I4nlegThAc5RfTxo5J9cDQNYiyM0Q3wSmfJ0w8yaZsmflNI3qzGtz58YVHyYNAd71TIGnsxRq2uu
	hdwhgmbWFmLsYaJlzjuwQPJhkKu6chUSV0QITZhlbF9QvJf4mT7TonRN2hxi6Q3O0l//uJSaoP6Zc
	XyBFhIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOstA-0000000Egxn-1iWV;
	Mon, 18 May 2026 07:59:48 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOst8-0000000Egwm-0ba8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:59:47 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B89747A00F0;
	Mon, 18 May 2026 03:59:42 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 03:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779091182;
	 x=1779177582; bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=; b=
	WRZM9xmqxYtj848T5aFJJlnIYwPS6O9ybs6W29pknf0tC4wgq5l77xmRAxzv9JwQ
	WOPRSBcNjEmowEEafT9br1z7OqRJ2rHi+nCysCcQDjdtmU0WBH82NEgYoUIyCR71
	7nmy1H/MicUoArmow7nI9gw3+W7eBtbjVNdoaP6dIVxCdMlPqw15eZjKL4h1yRsh
	5O20JVS3wkocI3pAs0D61RyAiEx9u1q4NyYp7DP03eQndnuKf+t/sMHHIiQ8M7l7
	2KoGG/V38wQjhR6q8ON33Fsbb6UDH/koBMcOI+Fq11sOikPhVTPrr25Jlz6PnBr4
	mKz/r+3Y1i7T3f3KMbVy9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779091182; x=
	1779177582; bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=; b=D
	/JARF58TJUSQyLqcyWaZ7MqPWcIgBRFuKktKuaTg01c+1N9g2qwn1TJKQNWMRS9b
	eY0BRZ4Ib+R2hYaHDWx6jSNrNWEygyRxWEr22Fewe8WZ7cOwsaEHGzgoTdVmDlDZ
	Ueh+oH8X0zb4pwUq1DmmtHGJ+gdUga8CSlhSN8WghBZ+FbBcY2Kqq81WJhyOeBs6
	hwaN7ty3THg8IQQeoT0RHr2+I6COFjKkZPegNX9RA/HK2IYFbSkObLZ+1VDTkuKj
	/khzyCWhOmTck8v/WP2ZAihg9C3AXE9gGEcBerXbhDFYGeI+J2yonjNogPHma9u/
	DE0T5+iTZHVWQdTYgOhGw==
X-ME-Sender: <xms:7sYKanlFumOsSXzPRXll5tBlTGd3P5AHxZAYS91BP97FWuq7_bfWLg>
    <xme:7sYKaloe1aX6tmZ592PNpWE59Xd3ZLQTBQ4A_MW-EGQdVjewZYv-XsDJPsWUNkQuj
    xAlby08Sm6ZU3Wg6g-4K7xti5LJrHb_5UNFZEEurQmUak7MEq38VRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpth
    htohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7sYKanKZW10_0xy0319p16Qm3Y90W9h4WRyTkj6QVUdr1dlIXg4CKw>
    <xmx:7sYKanCU2VP7CU3Lty98GicAXKJI-oBIje6SIiJHY5fbNRdip4lnqA>
    <xmx:7sYKasvuC_YchdmY5x1Pq8FPqG404sFheA7oMlNv-L4SiMyb5stehg>
    <xmx:7sYKalR59GWKK7B8x9jZBc9fktB7xia56M9Hn0BPfyLlcbSiztiSmw>
    <xmx:7sYKaiGn-PLoZwslguTORBU6KFDLe973_QcEE9wkPs2h6lbox8Z32ZG1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1EBD8182007A; Mon, 18 May 2026 03:59:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0NnAMceuwWo
Date: Mon, 18 May 2026 09:59:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <994710ea-450d-41cf-a381-33bcae5ad5fc@app.fastmail.com>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
Subject: Re: [PATCH v2 07/16] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_005946_231093_54920470 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, May 18, 2026, at 01:05, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the '!ld.lld || ld.lld >= 16' dependency of
> CONFIG_ARCH_MULTI_V4{,T} is always true, so tit can be removed from both
> symbols.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Arnd Bergmann <arnd@arndb.de>

