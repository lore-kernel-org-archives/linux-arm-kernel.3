Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83388EE49B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaRqv7k7VA61kOfmLtimV5rGgCGFCZ9YKiGuBGbb1EI=; b=SfpKi/CuR5L/Flq6hnQv/bOOsI
	gCjaq2OaNk5GGUcE49GxET4FXIgvK8XhEzhO3ZPz/lW3l/9uJwX14l9M+PYz8//51BqJtHh7ZfD+W
	fVBLdTdx9Qvr6jtDAcpHeAgJxCK7Zk9U3/ZgqE/+eryvg3SpuuZl4jNgNT/HgKwWqhcLecGZ97mzz
	pQ/jTWZXcTfBF1OId1W1GJ/1IybFa6HItmI8A9hRccz0dD4OdPyOOP2HJb3UMTOqC1db9lSwaeYcu
	LSfEwLSK6wF3gusXA8/DWhE+SwJf71leDrj2AgDh3VWQT2JzkZ8zUdRoM03jmxpPE94L5GbhtLR0w
	GpbBCSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vah88-00000005Izl-0EW1;
	Tue, 30 Dec 2025 21:19:48 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vah85-00000005IzL-0Zig;
	Tue, 30 Dec 2025 21:19:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 18B4B140010B;
	Tue, 30 Dec 2025 16:19:44 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 16:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767129584;
	 x=1767215984; bh=gaRqv7k7VA61kOfmLtimV5rGgCGFCZ9YKiGuBGbb1EI=; b=
	rssManEhMuouAJrUcFMK+d3yZigXJ8ZX5wfE7aVfxVK6exde9GYrwv76yH3RDFOY
	n+WuGMXpsVM0DAlyDR+rm0Z9U6msE/jZlGX6HmtEu01mnvYNqo5SHZenCsPwbOtA
	7zBLr7qL+osA4D3A5Q/IPjO51Y8YRnyT5UoPHL79scullTrcMr4EH7H3hXRz0dMl
	Mif1PCkeJKrfK8vQ9y73jzUz3kZ8NM7JRim3R1Z3YdYKqHlEZtGQT3DncXbxRiF8
	wqktnyPCN3ELrQQLL1m6GgaviWDjcZpZeX1zX5VCYRBDV/lJ/FK/YptydrIOvqj/
	FngxD3fMXbctQt7Xv1+J7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767129584; x=
	1767215984; bh=gaRqv7k7VA61kOfmLtimV5rGgCGFCZ9YKiGuBGbb1EI=; b=g
	en7v+wnekIyiUPLxQVI4zShOneTJrXWjRjnMZ7iYqo6pD7WGat5sNhmEOdXpGvdu
	f41RW6XSWON2cAjjdlmOhF9eiMF0GOWk09R6UOEusd9vDslYE2l30ZZZcxjFe6Bl
	v2gzWP+e5i8RNKBtF3LVRzr8XbMPJ7O+w5/MGdxYto1ynKDDcN34H42/hzlgYpzq
	w7ax8mH24AVKFjTsxFtcKMIr1OMxZZyhiKTTa6qFsG/CYhS2kqna3QO9t0BvPccD
	1/QK/TlVMaiXmZTAMdzouourQmbjyiwlcabmFHy1eFL5cvCE2UGHudCOSfxc+pxl
	Ob0cuGMdr7O9uecLAy90Q==
X-ME-Sender: <xms:70FUaYJuXBybU4ESG4j6EgnOJxKPZ8J1bEm2xxU8ZEaTV9EUc5wdvg>
    <xme:70FUaS-tCpY8sbvbz9hVuJxJA_xOXWqLdcunuS7ipGmKNMH0jpXOSR90-5yTNpZrD
    1727Q0LVdGjyhmY7Kzt90BKWjwZ6lHcTFgbbSsRxHyjDMQxP3BcUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddtlecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:70FUaQgP-JMzu_xmvfxwJpTBVdBW1OiqpQkKnqAI1zHyo5s1wAmdiw>
    <xmx:70FUaYnVnUcRsQ__xeAnKBChr80fdTccxjv8h4s-wkWn-ijkBk7iYA>
    <xmx:70FUacaU1NZXNxkZoF2lEehHMGSLdYefbsXapL-GuidnjcW_DdUj5Q>
    <xmx:70FUaTy8lZETqHSujSoS5nKa3fWiEYKATp3oxpcnVQjLiPIcY3Kp6g>
    <xmx:8EFUafMvYwwHj5f5bGm86TQ3E-FZXMyUWVrWK8QSm5FO1oqDZe6qGXmC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D56E2700069; Tue, 30 Dec 2025 16:19:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGeayQqQY9QV
Date: Tue, 30 Dec 2025 22:19:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <93c55086-931a-4282-a94c-de4954047fa9@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 3/5] nios2: uapi: Stop leaking CONFIG_NIOS2_CI_SWAB_{NO,SUPPORT}
 references to userspace
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_131945_245234_E4A76C75 
X-CRM114-Status: GOOD (  17.43  )
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
> behind 'ifdef __KERNEL__', so it will be stripped by
> headers_install.sh. The result for userspace will be the same, but the
> exceptions in headers_install.sh can also be removed.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  arch/nios2/include/uapi/asm/swab.h | 2 ++
>  scripts/headers_install.sh         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/nios2/include/uapi/asm/swab.h=20
> b/arch/nios2/include/uapi/asm/swab.h
> index 9750547a5f82..bbfa9bd10b2f 100644
> --- a/arch/nios2/include/uapi/asm/swab.h
> +++ b/arch/nios2/include/uapi/asm/swab.h
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  #include <asm-generic/swab.h>
>=20
> +#ifdef __KERNEL__
>  #ifdef CONFIG_NIOS2_CI_SWAB_SUPPORT
>  #ifdef __GNUC__
>=20

I'm fairly sure this approach is correct, but I noticed
that this makes arch/nios2/include/uapi/asm/swab.h empty
in userspace, so you could just move the current file
to arch/nios2/include/asm/swab.h instead and fall back to
the asm-generic header for uapi.

     Arnd

