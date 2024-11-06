Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D576D29F9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=; b=3ZtqCCk1jNRvPst7lkA6/4zPAB
	d0mBZxJQZ1m4krgkkQ2pvIcrrIKA2NsrP/+NmByrZ6S8UkvnBwomfhHd7Fkd3Bg0yBq6i/t47lF3I
	kA+vbyix7woJubBh44WVAPjdo3jfrrojpu0Zw6V2FQ4IoKbnvkew72RrZkQ1aeX+dh2InDmGUAGw6
	OFt0pn8vwn7CVCahFxJtkgN8H7YGCCGDsvyxESAU4a0Uwpnu4bJFAx4buaMKKX4pzn6MuxEyl6d98
	NTdGgNOfkbgwTJ6CeAWBLT8r1ykYkA4oo3kHJpGn8twJMGF7qZfA9xyErRntyBGMQFX+jLzl+bXJ5
	WogBZvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aAZ-000000024VI-0igd;
	Wed, 06 Nov 2024 07:09:35 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a7x-00000002484-3xvZ;
	Wed, 06 Nov 2024 07:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730876806;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h80rEgtJ7qD9jyDyLJcISbRk3INZH8ZPcYosK4VrHHZVogREXxmMdnucgdz5uGIVq
	 2FKIvnwHaCmTCM5h2wCPV5BHvVPqGtTkGb8EMAQ3QpqRcFOIuuN9J+N+f2mo7sMJe/
	 dU4VVqU+Z1FcyNgWJiu6rzNqueMfO3e6FKKNop6UZT1IVzPlW79wIw8rl8ikKnhRpJ
	 +n1/bbdRaP9EQPbjeaxIqHG5JuYMBpoWql3abi4yDgJ1tGm3FhgLFRk5m7yklMr2OW
	 JsGlZDD1354L3XGFFlQ4dOrEE1hpvtyE9IKa50nyhPWS+nOpSyzlxB/+3KkxmrZtK5
	 AOEEtdbWDj8jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xjx8D1mmSz4x11;
	Wed,  6 Nov 2024 18:06:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner
 <tglx@linutronix.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx> <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Wed, 06 Nov 2024 18:06:35 +1100
Message-ID: <877c9glu2s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_230654_789542_DC0D0D94 
X-CRM114-Status: GOOD (  13.01  )
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 30/10/2024 =C3=A0 12:39, Thomas Gleixner a =C3=A9crit=C2=A0:
>> Folks!
>>=20
>> On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
>>> Historically each architecture defined their own datapage to store the
>>> VDSO data. This stands in contrast to the generic nature of the VDSO
>>> code itself.
>>> We plan to introduce a generic framework for the management of the VDSO
>>> data storage that can be used by all architectures and which works
>>> together with the existing generic VDSO code.
>>>
>>> Before that is possible align the different architectures by
>>> standardizing on the existing generic infrastructure and moving things
>>> out of the VDSO data page which does not belong there.
>>>
>>> Patches	 1- 2:	csky
>>> Patch	    3:	s390
>>> Patches	 4- 5:	arm64
>>> Patch	    6:	riscv
>>> Patch	    7:	arm
>>> Patch	    8:	LoongArch
>>> Patch	    9:	MIPS
>>> Patches 10-20:	x86
>>> Patches 21-27:	powerpc
>>> Patch      28: 	Renamings to avoid a name clash with the new code.
>>=20
>> As this has been sitting for two weeks now without major comments, I'm
>> planning to merge that through the tip tree tomorrow.
>
> To avoid any future conflicts with powerpc tree, I suggest you merge=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=20
> topic/vdso into your tree before applying this series.

I thought the same, but there actually isn't any conflict at the moment
between the two trees.

Some of Thomas W's later changes to convert arches to generic VDSO
storage do conflict, but they look to be destined for the next merge
window.

cheers

