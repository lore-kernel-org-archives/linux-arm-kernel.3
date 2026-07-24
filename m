Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCBC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vfJjZVPSChpqj5TExkyw5xP8q/mwEg+7w0xWD/COsU=; b=xG+9Omllmr4Z7rpq7uGVELdesV
	zUOarIovkCCtm+FssmYUbRkRXNTdR3s5ExAgxZZM6du1LYgQvf9uxM3HeA0Fp1K1v94BWnhwCcp3V
	kvBWLEd3fXjL2PW77K7m6nRe73Up1xhfg597e/FZQwvlrnKlz/1f2XWsi3GMSwPl4gwA72LHa/TSn
	P+faJ7RhaoSC/E1eSQNEKSo1EaykLuVMZqu0xWdN+uXzAxewebXuuhsJjd8gHIgw6oZkKYNgXyeNN
	xr0enoOc+KA6Ofei10TOZ/EOm7Hc5LzlYYZF9nbXwXuYmMGfHdfTyrMMgf1nMfRgORZyHMzSGahRR
	/5ghWjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHsF-0000000GiUZ-26FC;
	Fri, 24 Jul 2026 15:31:43 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHsC-0000000GiU1-35Y3;
	Fri, 24 Jul 2026 15:31:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 04CE67A01AA;
	Fri, 24 Jul 2026 11:31:38 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 11:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784907098;
	 x=1784993498; bh=3vfJjZVPSChpqj5TExkyw5xP8q/mwEg+7w0xWD/COsU=; b=
	ErvYL8qoP8oUDTFaDLU8tI3pwp2fbfDBmOI4VztEaLQ2QEHjFNdZU+SUUDjULhEY
	am5EzSSG7baefA3tcpfyYreZ/F8vIT86jP+sFehceUqy2SJHWdt4/oTVthiS2GGy
	UEGFiDKBRIkzzIPLgkY810PeJXknmDhLhV5ZKYAZKorkGu/C+IQwMh98dwNNwGKj
	hZWwdqPjir3RJbtr/DV4n7alrGfvXO3U3rqSKD8dbw2NahJjOs0lgCnks2/aN577
	cB/1Sh3EEEEt9MEvD5z/C0rNgfg53+zhcH1nlLEyGNVB48WT12cA56V548fQ8dKd
	YFGuCDdt9PPAsiGLKEbHNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784907098; x=
	1784993498; bh=3vfJjZVPSChpqj5TExkyw5xP8q/mwEg+7w0xWD/COsU=; b=R
	RJp8/GZGpTp8w5KGbl4v5px2xtj2cmz2P+h2s2Au5oTVxJ/q212tDX7NhwwDJ85H
	+5K0LDmGiiNZIxdIkpsfk5GFWRpUNVCS4l3+XbgdVQzrjm3zigMn1iOIQaVYHrBa
	28d+irOOCQsbvvknCSO+zQYX+Kt3cKS2wOdAEJP3wpT9zKI/hoTwHgnaZQFy3XWw
	uVT8/RiWXDMOAnf0i3yEJVLgf/8YaIve783hEdtpVAVbj5UaimDx4Ru1DTTw7odf
	QabDeh63KP6pzDxfoQO6XMHzYL2gY5wNEh4mGcW+uURCUF3qbV4lZrCziOurnLgR
	RF5jmWR95MjI+PF1a1/zw==
X-ME-Sender: <xms:WIVjaoMeZRxjY5bhFBOBWmlHG6ryjne8vXF0q78JviE_k_Yzh_bTEQ>
    <xme:WIVjapyDyoatqQ2ELfinOdCF8oWERE1mjL2qje7VysX1YPs5FYApJ5gD1L79LDYcE
    VPHkdVKHtFJzS2aGc8Q2ZCjab2_GgQsVL1tmVzaybl3Rq-rqEK22Kw>
X-ME-Proxy-Cause: dmFkZTGUoMZeRv1CErRkfeBPbMV1zTc4GCIEyN8fVdYFXLX60g5GMZlj3zKIzYphbBR61q
    t12qx/D8MHIqsVPkvVWyYh31aaALiE0u8vWrXr3FD/ltDH0kAyzwfIOHjyijKSArzUVtZY
    8nIJtPxuiL402lrYG0fbV5jkyL/xXphaUUUVTxJWW7Q4z75gpXX2BDtYWisCQttVAkD1Xx
    f6iLRkLRISTpO6qoDClrKGA6L27Rafr7YecBtVsSxjv8BWlfEQ1AL7wICbnhlw8GFrex6j
    Pcu6KqOK9tctCyP89uFpxQ3QJJXPYnX1oBgJweECfBLVNr34uoNyU2f7gKPM1c/KbasAW+
    N4UAJ+fbN3tlEi5CP6DDGfFT3fa825G87A0wC9N6w7BTkNFWwcW0s6fLeUsGSI7tw8vC+e
    G8uGD8qGYwFQ2Kg80V8/0xpLLtMyUfsFelWKgx8561DU8K2YmVkuLVIOYwLfJWiVrUCymH
    SflXW0VnNAoNzyuQPkabsLyUQYh/nl9FHzRhUPR0Y408txF6bCZTgVe51ibpgIXpM/5S5U
    Dj4qBlXRfs/r+98TiVA7NosVQFMTrd/jp77FE8u6CIyZI2BAdHNY7NFktn7TfNd4aG653p
    SCNzy38nvbPemWoQAPz/OEk5xqiGY2TGyHlY1uj3SbsgVnBKjbnUpqNp/kdA
X-ME-Proxy: <xmx:WIVjalFRGj7JxirhjZDe9KLcu5Xn5ivxide2IRo0GkVjaxBVjy4xZQ>
    <xmx:WIVjameUkaNJUflcOuiwAcVQmXH135bqC2lfXK2LtN5tRm1HNIPRLg>
    <xmx:WIVjai8Gj7l17gQgdOatrbcI06coU86J5NzJ9_9C9C1-W-pwBcnEnQ>
    <xmx:WIVjakZ3JIrX6CeyjtVXveFoTCXzizBWVjL41Rr8I7OBf_fe9ik0Lg>
    <xmx:WoVjarG3AdLWIsoF6n_Q4ZDtrbtteDWbEnfdoMgyaA4VEcS7cRxMLh_p>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2B38182007E; Fri, 24 Jul 2026 11:31:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALwDRP4astFJ
Date: Fri, 24 Jul 2026 17:31:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
Message-Id: <180dc66e-f755-4b50-a6ab-65398850890c@app.fastmail.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-2-ddbe447be860@linutronix.de>
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-2-ddbe447be860@linutronix.de>
Subject: Re: [PATCH v4 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_083141_201723_9373D502 
X-CRM114-Status: UNSURE (   8.98  )
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

On Fri, Jul 24, 2026, at 15:36, Thomas Wei=C3=9Fschuh wrote:
> Some code, for example clocksource drivers, may want to use the vDSO
> clockmode constants even when CONFIG_GENERIC_GETTIMEOFDAY=3Dn.
> But the symbols are completely hidden in that case, making ugly
> ifdeffery necessary.
>
> Always provide the enum definitions.
>
> As not all architectures provide asm/vdso/clocksource.h,
> provide an empty stub in asm-generic for it.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

