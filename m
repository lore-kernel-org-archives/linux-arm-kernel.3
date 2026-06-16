Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC84CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEKDV+rvEzW/GsX9IMLW4VBOK/SLwUy4xNVC6Yz+6Fs=; b=WZWkCjC/6jaDaFKAnE49RD+hMN
	fanZamRC2aO8b9LqoEFNqYK/rQUqzsUt3qyxGokX32FhGZlmA4oeYPLVH8SZNXl3b4qjXdxo+7ucW
	2swsJsVt9UpU/B8TK+0JTopcaacr7Tfl0vi2gGcSUko0WeTqmj0wzDQE7HpPqq+0bjVh0USWwQH2A
	VFLey1O/Puvuh+lm2NbssihfOC+R0QFa/gq5MSElLdRZZi5oVK95OfIAv2Ne8UNyswNpNpGEpJLP6
	zwzKYJTeiRERd76NLP0vH0SngdnOJo8HPUI0RXqrKDSXBuPFg8517fISYfhEUAFtgwALUOVGxqTrg
	n3k1g61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHY3-0000000F0fR-3OLW;
	Tue, 16 Jun 2026 00:20:59 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHY1-0000000F0ej-2dVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781569255;
	bh=wEKDV+rvEzW/GsX9IMLW4VBOK/SLwUy4xNVC6Yz+6Fs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eC2tXB7ykm3tgVwqx2hDiTZi6AmMv4ab15vLo4MTFUT6qRuH3D8uPUoLMxu6pseDj
	 ayhpOdvK88yIlEtYVIH6w7rHrMKDf3axkUigBbc+HBosT723Ta2A8jGmOgBx7WcjNJ
	 qm2zkRriO1DQtI9AWlnIelZ6QG5Oesv4RjlAR2SV5g5PdY4XUK8oVqaKsBYmpE2sQv
	 FpxD97Z10eii3z0mKAES1A/MMozfIEAd4hzf4srn9TZzrvfRTDPOT1RsCYDDL3Ajqy
	 UGzNo75MQOYg8i0DpsIa88MP5uDiLOizqalxBVm94Ie7S3oqySpD9TTDscn165ThLM
	 J8oqdA0KsRn0A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C7BD06001B;
	Tue, 16 Jun 2026 08:20:54 +0800 (AWST)
Message-ID: <133a2533be758b1e95bb0365a90d5907c7b09ddc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Tue, 16 Jun 2026 09:50:54 +0930
In-Reply-To: <20260612190744.172638-1-karthiproffesional@gmail.com>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260612190744.172638-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_172057_866830_3C0B1588 
X-CRM114-Status: GOOD (  14.63  )
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

On Fri, 2026-06-12 at 19:07 +0000, Karthikeyan KS wrote:
> put_fifo_with_discard() acts as both producer and consumer on the kfifo:
> it calls kfifo_skip() (advances out) and kfifo_put() (advances in) from
> the IRQ handler without synchronizing with snoop_file_read(), which also
> consumes via kfifo_to_user(). On SMP systems this concurrent access can
> leave (in - out) larger than the ring buffer, so __kfifo_to_user()'s clam=
p
> to (in - out) is ineffective and kfifo_copy_to_user() can attempt a
> copy_to_user() past the kmalloc-2k backing store:
>=20
> =C2=A0 usercopy: Kernel memory exposure attempt detected from SLUB object
> =C2=A0 'kmalloc-2k' (offset 0, size 2049)!
> =C2=A0 kernel BUG at mm/usercopy.c!
> =C2=A0 Call trace:
> =C2=A0=C2=A0 usercopy_abort
> =C2=A0=C2=A0 __check_heap_object
> =C2=A0=C2=A0 __check_object_size
> =C2=A0=C2=A0 kfifo_copy_to_user
> =C2=A0=C2=A0 __kfifo_to_user
> =C2=A0=C2=A0 snoop_file_read
> =C2=A0=C2=A0 vfs_read
>=20
> Serialize kfifo access with a per-channel spinlock shared between the
> IRQ handler (producer) and the file reader (consumer).=C2=A0 Annotate @fi=
fo
> with __guarded_by(&lock) and opt the driver into context analysis so the
> compiler enforces that all fifo access holds the lock.
>=20
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc ch=
ardev")
> Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
> ---
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 38 ++++++++++++++++++------=
---
> =C2=A02 files changed, 27 insertions(+), 12 deletions(-)
>=20
> Andrew,
>=20
> Thanks for the review.
>=20
> Changes since v5:
> - Annotate @fifo with __guarded_by(&lock) instead of a comment
> - Move kfifo_initialized() check inside scoped_guard(spinlock, &chan->loc=
k)
> =C2=A0 in put_fifo_with_discard()
> - Replace spin_lock_init() with scoped_guard(spinlock_init, &channel->loc=
k)
> =C2=A0 around kfifo_alloc() in aspeed_lpc_enable_snoop()
> - Enable CONTEXT_ANALYSIS for this driver in drivers/soc/aspeed/Makefile
>=20
> Dropped Cc: stable =E2=80=94 the fix uses cleanup.h/context-analysis idio=
ms absent
> from LTS; I'll send adapted backports to stable@ once this is in mainline=
.
>=20
> Tested on ast2600-evb (QEMU):=C2=A0
>=20

Can you describe the specific steps you used to test this under qemu?
I'm interested in reproducing your efforts here.

Andrew

