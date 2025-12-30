Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F607EE0203
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvZE2Mdaq3RzQueJdX+n3+4wx/tUoxDbdm9E/c+gs1o=; b=z7rxrn9AxVjM1dMbMbXO6fUfwA
	FVHMcGekFBufq0zX1wXhvGslJ31gDRCLt74cQqv4/K9iIoNtXtvj8S3DLz1n0W6NXRNPsb4hyUR0q
	lMF4AcaZ/Ufx3heA1fPMtePe8ebzlrKyXkhgg+5fr5O1LgAskJ3MSA/4kt8kn/syYJkPuGAa6F48N
	gR5x/VpbJT46+msRVv99lGzTIlrFN0Tx2rP0nEg5l1J8HCO7k79gUUd42T7/RUgXnrX2pQN+rrxqk
	D3jtdd44MP3wQ3JlAWAYoV9C6dRjc55XeBmI5R3lFg6UEagf4kDItqdEVU80iXAtfkAoq4lJV8c7C
	cKbsMwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagxY-00000005IYo-35xU;
	Tue, 30 Dec 2025 21:08:52 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagxV-00000005IYM-0n0o;
	Tue, 30 Dec 2025 21:08:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DD971400089;
	Tue, 30 Dec 2025 16:08:46 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 16:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767128926;
	 x=1767215326; bh=hvZE2Mdaq3RzQueJdX+n3+4wx/tUoxDbdm9E/c+gs1o=; b=
	m5VRocYSXIlaNjd+wnyxBkSVsUT/BydMIpJq7VagNGuKzBrqFtbgisYFelvU7Mqy
	ipBIrQzYfnPIapunzxQX69y2NP5LynZX8FpTsZ9zoCAgqOFuhNtQaOCU8cIOSKtU
	7F1PmHdpMDwwJLPSYVLfWRj3kV8QrKcp5y86LKuEP+N4WpmUHf64xINXxKVdg3kL
	qF4ZtIGseqI8F4kWe/w8WrErprFwyIM93VviN76uAnk8Hm1o///re+scA+CofU0m
	/ltX8JeBbs66ZEDAc17iuvb7gLtVZOlVlipCv5u5vt9kPimmSHADDrLuhkrOoW5a
	hFIdUFJhGqCpIpwwZLhNbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767128926; x=
	1767215326; bh=hvZE2Mdaq3RzQueJdX+n3+4wx/tUoxDbdm9E/c+gs1o=; b=S
	6oRw7Epu5P83pBA0VBspCtXLB9a+fetUFSiiUsfvJEL6RQPSW90uhRVcGFyC4Fo5
	gxkgaAx095YYoERFgoXy9eJDavez8YdhCRI4XplExR95uDhyO59c400fuyBiVIfT
	1cJu+S5IU994i2m+Ed6KeFLOGUDf0bwCaOOdGDOVLRNNc71azzHI2/ZOC0RQREMW
	BATRCK0mnBociX6piQSsajcRl8E14M3NQ+fk0gGIFN1Osb43dFTa7I4bHkMUlNP9
	hCxF7kwd6IXe6WpwBXgkNHdUB081jFrF0v8OJhfPE31oPOUAe1DsfnmlQaXuCIIL
	rtNvczVIOjav0rn9B2vHw==
X-ME-Sender: <xms:XD9UabAR9AMaHtmELUsYgLkS0pC60-lTD1E0dZYKeZoUrwRaF3Tyuw>
    <xme:XD9UacV7nsCRy-q07r96ibTWTP7RlkOdzm6fJ0mpsvjBkWiBKKGKNyIQ5Hs-UrS9o
    3F6BVZCqmwbGKj1TekeL6-Uc84Yqg3VnYSS31DQS_y7QaVVJmiK-m4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeguihhnghhuhigvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhguhhpthgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:XD9UaSZYiC2v220cdPaTYOU-oj3KPPFC1Xc3XmgWHjp4UHZYvckwZw>
    <xmx:XD9UaU_rZbeqDwREYLiDFU2r48qjrwn19l0pErG8anBa-9LRWtcXUw>
    <xmx:XD9UaRS-Hfm9K4o2wQLCtyVCO8PTdUu7MTjfaDxn_9M-5HK2LfJ_Lg>
    <xmx:XD9UaXJmwJ0jAtnQwzckrvQecW_EEq3-DNi_Xw4hDhRouIr-8Lb91Q>
    <xmx:Xj9UaXEt3t9oxxj_Pw_AnnsGkC0dmbkMLvZn9Hc02v0ZSP6jrwqnikBy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0E08700065; Tue, 30 Dec 2025 16:08:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1Q6nbcC_O6V
Date: Tue, 30 Dec 2025 22:08:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a745a59f-947c-4847-b31c-5e32125a51a4@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 4/5] x86/uapi: Stop leaking kconfig references to userspace
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_130849_680713_0B79F9AE 
X-CRM114-Status: UNSURE (   9.78  )
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

On Tue, Dec 30, 2025, at 08:10, Thomas Wei=C3=9Fschuh wrote:
>=20
>  /* entries in ARCH_DLINFO: */
> -#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
> +#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) ||=20
> !defined(CONFIG_X86_64))
>  # define AT_VECTOR_SIZE_ARCH 3
>  #else /* else it's non-compat x86-64 */
>  # define AT_VECTOR_SIZE_ARCH 2

While this patch clearly keeps the current behavior, I think it's
wrong, and 32-bit userspace should see a '3' instead of '2' here.

It can probably just be '3' unconditionally, or we can
make it more complex and have a userspace definition based
on __x86_64__ being defined.

I also wonder if there is a problem with the third
x86-64 entry being zero rather than AT_IGNORE. I see that
some architectures do it like this, to keep the number constant
even if some entries are missing:

        if (likely(signal_minsigstksz))                          \
                NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
        else                                                     \
                NEW_AUX_ENT(AT_IGNORE, 0);                       \

     Arnd

