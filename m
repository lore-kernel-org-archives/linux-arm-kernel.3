Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46FCAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=; b=ogHTiVvygC2iZRSRSWzYQ8RnVA
	rgrTHvx2fyD4wrDtkdK7OpljX354z2Q9nlyXr6DhX8PVNtF1riIbcunqiiTw2v0HyglQTmEcxFfci
	JyShSPWSUpI5zCeo3yU/2y73/IaSv7dRz0HJgQDQaXO/vxUPlnhE11NK3DWI9q3ExWYsbAcWRLe5T
	+d2Aen5rXkZ4uEjzHLofzpx/fRU7QyAEroPbWW6983ok3/qQPaPxJN/tqYPE257Q2CtTiVHr+HswO
	nwCgCw+78dAsFssZEQ7602WgZ/BAu/oE8B/S35pZEwDhnP541QIKcc3pVhjcUdBLd/6RZB3FVcbzV
	oiDAHClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nmp-0000000GyJQ-1TP4;
	Wed, 24 Sep 2025 11:35:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nmm-0000000GyI0-0xO0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 11:35:49 +0000
Date: Wed, 24 Sep 2025 13:35:22 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758713743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=;
	b=QlOkXOk3wDqFbbFYZsEnlgMHERzf96yJYS0jGCAx8XL84tsLn5ka3PYxS3tS6fRiz4EdFp
	hMUyAsiUILtR8JSw3OgT3Fy0mtO9V6+vyErIQ7UEqbgWogA4ThP02dZ7nQf1bcNUN6oc1E
	qIS9/nd74dV5DEbbsNthzLIIe0mNg8fHArZw72OWjj0HJx2y/wJcXKWq9tADPKUcw2oCa1
	MNgG8SaKpMW/kXFfHB3IGyN4KRzzDdYS8yZwV4AN2CdSs8O+lduKmgKTYpZGvoSsWu5yzJ
	vn9hc+ve1LqLnCQYSUPrJ8WxAuF+cXnlxVYaeRwKdflbaBdk98XsHYzpLwzheQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758713743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=;
	b=9aYLxaYQfRDX5WwG1TPEXNPpaVf2pDqro4TeNjcbtq5rkULq+SlNuIn8W8JezYqbHJuTiS
	grPgu4XhzSRIaIAw==
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Message-ID: <c5e28d44-3480-4e28-aff0-5c5cfd1b0632@linutronix.de>
In-Reply-To: <ec0894011cb4403f45ad8b30095cc333edc1e5e6.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de> <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de> <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de> <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de> <ec0894011cb4403f45ad8b30095cc333edc1e5e6.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <c5e28d44-3480-4e28-aff0-5c5cfd1b0632@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_043548_414679_F4ED7D2E 
X-CRM114-Status: GOOD (  12.27  )
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

Sep 24, 2025 10:29:00 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> Hi,
>
> On Wed, 2025-09-24 at 10:07 +0200, Thomas Wei=C3=9Fschuh wrote:
>> Sep 24, 2025 09:40:47 John Paul Adrian Glaubitz <glaubitz@physik.fu-berl=
in.de>:
>>
>>> Hi Thomas,
>>>
>>> On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
>>>>> Could you share a version of the series based on top of 6.17.0-rcN fo=
r
>>>>> testing purposes? I would like to test the series on a Sun Netra 240
>>>>> which is based on the UltraSPARC IIIi.
>>>>
>>>> Here is the git branch based on rc4:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linu=
x.git/log/?h=3Db4/vdso-sparc64-generic-2
>>>>
>>>> Does that work for you?
>>>
>>> I'm getting merge conflicts with "vdso/datastore: Allocate data pages d=
ynamically" and
>>> "vdso/datapage: Remove inclusion of gettimeofday.h".
>>>
>>> Can these be skipped?
>>
>> No, these are important.
>>
>> What are you trying to merge?
>> I can probably give you a merge.
>
> I'm using v6.17-rc7 plus all SPARC fixes in Andreas Larsson's linux-sparc=
 for-next branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git/=
log/?h=3Dfor-next

This merged cleanly for me:
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git=
/log/?h=3Dvdso-sparc64-merge


(Only compile-tested)


Thomas

