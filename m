Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08048CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9vAa0AsWTqSQzz6uFyc7VXVf8ZJ7QlTL9Ja3Bg/hgg=; b=PinYl5c4UF6sHSZBFsttx/0ruL
	nYLcuSscTUnISbzpOBpMt9Tp4mrbrTL81sQ1ldkVVF8LsXP04B0AeJjT8onFEZz9ndAplVXg7HJs9
	BhhOL1/N8rHJST1iOeFKect1H60ViveBiRDKgNwu+a5vKoASstNqewAGcEg++QoIsijHGhCTu7UaS
	S3brOWZHPA11wd+T3SHZ643BZhVhzju5ccTi7yqyjS+sfWSa985PV+sBdZ4ubzimfTu26P+FD2RlS
	O6IMoHLkJaf9yWfnu8QXuucgZheCX7KiE5//LrQMuM8AdFUPcMnNik4gT+1qNjD16qH6Fa0agL0n/
	fnqhc0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WXS-00000008dSy-0R4W;
	Mon, 22 Sep 2025 02:44:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WXP-00000008dSl-46g3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA674601DC;
	Mon, 22 Sep 2025 02:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8F6C4CEE7;
	Mon, 22 Sep 2025 02:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758509061;
	bh=i9vAa0AsWTqSQzz6uFyc7VXVf8ZJ7QlTL9Ja3Bg/hgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kgX4zQG9Ggek7o49bHXrtRIo5kLI9byQA1VGrO0g2NhIfgF+O7g3DmNB4VQlWu1RU
	 rvn5Ng1I/gwc6uqXQlAM/GSftBSoRv2cs1GgW98+sggq0LEaVHB/4xzRlQDOEBTq1V
	 1JYbrUBIXkWzk+Fxrb0Sh9GHTmuk2EE+mV4Erfh9IKaJWfsdSPKF2RmfatCJ5ey+OJ
	 pKeM2giE9tz2rFVxxjrnv7iaAggC9I9+OA/rkyeZeNdXzU1EZLtTCagulCOYZflJrI
	 fxVswkLQWeowr2MiQl8Ix33L2RboXxqNbIRe1zX9vbj1iHayNHW05Rw5FrDBFRHP5w
	 e32O7vOprApgQ==
From: Michael Ellerman <mpe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas =?utf-8?Q?Wei?=
 =?utf-8?Q?=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nick
 Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include
 asm/cputable.h and asm/feature-fixups.h
In-Reply-To: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
Date: Mon, 22 Sep 2025 12:44:18 +1000
Message-ID: <m1348fmcjh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> Le 17/09/2025 =C3=A0 16:00, Thomas Wei=C3=9Fschuh a =C3=A9crit=C2=A0:
>> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
>> asm/feature-fixups.h. Currently these headers are included transitively,
>> but that transitive inclusion is about to go away.
>
> Hum ...
>
> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make=20
> POWER10 and later use pause_short in cpu_relax loops")
>
> In theory, vdso/ headers shouldn't include any headers outside of vdso/

Oops, looks like that was my fault.

It's expected that there can be feature fixups needed in the VDSO,
vdso_feature_fixups() handles them, so that's OK. But the headers
pulling from outside vdso is a pity.

Still this patch is fine as-is.

cheers

