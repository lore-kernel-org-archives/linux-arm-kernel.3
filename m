Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE53E94122
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JAZbMLGq9TMjs8GUZEfV2eAaYJ10hW1yeCStSWqdbw=; b=zLxOnQMpz475vwWNxTldyyVsi4
	0/8+bc84L7oUHy+4lBfsVTxwvER6PBC8VqjBQjS+TW6nRS5PZkUxJvEQJZWNNbmnWDAtR3qdf9+hL
	W3WacZPOBnSpAcBAP9VExWWvbIxjSBregNjiLQzqrY2RNkg5UPPF5tKd6VfwUeNderdBAtbljKhvp
	V9BtbtsXFhbC3oPkFV9jZV+udDnJwivXrCJRXLVDbBIa9chLQssXR5T/R8DY1vgufak5VOTbwi5t8
	y48nTqo2FrjoZx4Cj1KqegwxqWtOdkIkDnwX1UfYyGopZLK8dD1T39OV+XBDxkYIRh+vgicsFdGQj
	t4cF6qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaanH-00000004wMy-0SOA;
	Tue, 30 Dec 2025 14:33:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaanD-00000004wMR-3hcC;
	Tue, 30 Dec 2025 14:33:49 +0000
Date: Tue, 30 Dec 2025 15:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767105221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JAZbMLGq9TMjs8GUZEfV2eAaYJ10hW1yeCStSWqdbw=;
	b=zZCJc47rPwYSGoSyowiQ5zR77aGR5p7Gh1btHYIGDDdSDN2keKjXHAH9tW7KsyEeTXNptu
	ST1wDx7lHJCXNbQQGDSm1JkFlBCE5Oq2AhhX/b81Ja6YxQqBP21lpqRuSclVkeqLKZQiZp
	mym9qAEHMyzMeg5UTw0oebvB0HzgsU9cYmVQMBFbksOH60Ndqp6C+jEZ0rhgBcDWxLMUgB
	VLLEeIERwNAtZ7imIxo33ZqZLoUthDcjyCcuJOptdIqhP0E3uORzK6q7CY9+atEY8RJ/yS
	/mIV8RsdCLbs/r5GO4qgGY0wnckdFKn4Za/fNsNcddYQJLaLE2AeRa6CE5akSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767105221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JAZbMLGq9TMjs8GUZEfV2eAaYJ10hW1yeCStSWqdbw=;
	b=LioFw67402qE0XgQ9J0GPgISibVX0jYkqA5gf745chp6vrOc9WS5riUaygVucjyTJV066Q
	iVGei/dJLk5J4gDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8
 reference to userspace
Message-ID: <20251230152519-1f7ea27a-10de-4d0c-9dd0-04eb0588d733@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
 <d2ad12f2-3d65-4bef-890c-65d78a33d790@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2ad12f2-3d65-4bef-890c-65d78a33d790@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_063348_109286_3831A5CC 
X-CRM114-Status: GOOD (  19.49  )
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

On Tue, Dec 30, 2025 at 03:20:10PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 30, 2025, at 08:10, Thomas Weiﬂschuh wrote:
> > UAPI headers are not supposed to leak references to kconfig symbols.
> > These won't be set when building userspace. Hide the kconfig reference
> > behind 'if defined(__KERNEL__)', so it will be stripped by
> > headers_install.sh, the same way other kconfig references in this file
> > are handled. The result for userspace will be the same, but the
> > exception in headers_install.sh can also be removed.
> >
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> According to codesearch.debian.net, there are no actual users of
> this definition outside of the kernel, and there really shouldn't
> be either.
> 
> It should be both safe and correct to open-code PSR_ENDSTATE
> in the two file where it is used as
> 
>  if (IS_ENABLED(CONFIG_CPU_ENDIAN_BE8))
>         regs->ARM_cpsr |= PSR_E_BIT
> 
> and then remove the definition from the header. Alternatively
> it could be moved into the non-uapi header, or you can have
> an #ifdef around both of them.

These alternatives work for me, too. I went with the current aproach as
it matches what the rest of the file is doing and it won't break users.

I'll do the open-coding as proposed above.


Thomas

