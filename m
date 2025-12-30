Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B883BEE49B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0ZsZ80gOyv9K5AsBUtbpmXPA9O1Zk/t4cM6p32TmUo=; b=LIiaMyOSTze26fkAs6FRl/7/6o
	lpY4Szc0OSfakUMNgjXWl5mWCUK3fwnYUFazIixwxiAB8Xwz5rLzNADwNEbRzBYgVuyPmJ/Sg7zIX
	PpQ/00KQFPqy1oC6DL2LJA3Vrik3qy6u+QAYY1MzaYcTghZ5XPs1Z4Lb8ffpvn4/zI+orCfpKvXF6
	0a9/OFVFwy6jf4oaBYalBaTudYyaAXf1VXMevN34JaLkaOJ6UCgv0qXj1gvm1sy4wdHeUbqzAE8Vf
	a/oC647/CC+UcYubhyecgSrVKbFDv8AMqcEwv/nXs1yvfhhZMKrgYsVX8Y2E0ZFTv5I/2CbuFQz+/
	MuXlXwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahBl-00000005JHC-2zME;
	Tue, 30 Dec 2025 21:23:33 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahBj-00000005JGn-0cjS;
	Tue, 30 Dec 2025 21:23:32 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C3BA1EC007A;
	Tue, 30 Dec 2025 16:23:29 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 16:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767129809;
	 x=1767216209; bh=j0ZsZ80gOyv9K5AsBUtbpmXPA9O1Zk/t4cM6p32TmUo=; b=
	rnvn1xMKaQw4EdxITy3EP1d+8jRLdA4s9PRvBwrOBFDr+1jF7IanPXIOZfgJfT4m
	V23gp+u2JCC4ziMlXai5uamH/uVVxZsOFbVivW9X1ej72NFjGx9jaCjMplFtqL0i
	40p+IGYu39YHpp7N71BxMHptD6IOM1jqekEDfxTBfaXiXQa3VZ4HLY/U4W017mdM
	4fPeZS+b3YcCSy68K0hDFSm6TuH6jKsy6WtxgYMmQDMxp8okUWTtTuoPjwM6BiuT
	/OP+qbN9JYCvQCTtETqgIgwjGh3V7U9lTNBSr85sziQIKr6oRHMGCbQ82y2qh2vI
	WzFOCmt6b+q+XAkBD0iIKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767129809; x=
	1767216209; bh=j0ZsZ80gOyv9K5AsBUtbpmXPA9O1Zk/t4cM6p32TmUo=; b=J
	D5JbQPe0ckdBTMpnpR3T7198WmY0gBhwlbcaJ61RbxGrsJ13kn36kor1V0gYl5UL
	D52vUXzKyiyxBd0MgkD7f6n/c1sEJYWUV4ZBggNHxaC5UYi6lmeLB5aOEp2+FXha
	wCzGNc5DbsShatQd/JSEAbkLMTn12Zjkdt9QUdQGI7DMVfldcMsOS+i8QPborpWe
	7seC+ouwwXrTUAWW3gE8dK6RpJqXkGjmT/chxrk0CRGqn2IQ1uOaTf3yDqpJ2w06
	X6+GJe4QKQCdlwkYq+5ss/SOUQUaDwuhfoap7soUE/XjOLw70Ida6lA/3rTQKZpe
	U3fCv2eohzdOHqwJRWVjw==
X-ME-Sender: <xms:0UJUaUcG9Ip6mzzT7WmBd_4ov1OlJUwM_M80rjcDGIqdraQGisCbug>
    <xme:0UJUaRBKjZ5ynxxvlUiEjvOf5JfYydw3diqzxDaeqGvjyTBGSmPfM9h_zHXCYEWh9
    RSZtY28Ghfltce-vG59-0d6J782avKM7CQc8gze-5vIwzfC-LahAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeguihhnghhuhigvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhguhhpthgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:0UJUabX3uEaYwfWdELX3u6ZzrfbSpIyfTuH_jCl26JU1uGq72SpIpw>
    <xmx:0UJUaTJVSDrHP2lsa3VLQw9TRU2rRHdcCAA8eUHoOcMnaK-xXI8FrA>
    <xmx:0UJUabvF6pVvRUKR71-OdNb4yYfl6Dxrqs_ZH-oaYU73saDqprQtCw>
    <xmx:0UJUaY2y4HX0bPqn_u4TMXK1nxY4SxfJK9GqaMf_gyycvcfrMijX8w>
    <xmx:0UJUaTAXBqdiRoUP4BRrxxx46xIiZkFNsmglknondG8GX_jZcJ76-hwp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6576E700065; Tue, 30 Dec 2025 16:23:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbWOAV9uh8L3
Date: Tue, 30 Dec 2025 22:23:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference to
 userspace
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_132331_272540_12105C22 
X-CRM114-Status: GOOD (  12.52  )
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
> UAPI headers are not supposed to leak references to kconfig symbols.
> These won't be set when building userspace. Hide the kconfig reference
> behind 'if defined(__KERNEL__)', so it will be stripped by
> headers_install.sh. The result for userspace will be the same, but the
> exception in headers_install.sh can also be removed.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Same as for the nios2 version, I think the nicer solution would
be to use the asm-generic header for uapi and move this one
to arch/arc/include/asm/swab.h for kernel-internal use.

In theory, using 'select ARCH_USE_BUILTIN_BSWAP' in Kconfig should
let the compiler pick the best swap instruction, which would
be even less code, but I'm not sure if there was a reason that
nios2 and arc don't already do this.

      Arnd

