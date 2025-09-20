Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6869CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=; b=0VNH67NDyomX5dPEH9pCUkK58k
	eqUKNSJo77VpV0E2YJt67tCzC5uQBRQTFmo4msridZROBGToEVMf5/CbWXwpW+iUAArS9O2VUnIUp
	NC0CfOSExr8JUxlsFG5Y4MpUGOsKq424EKfA0RZib1g1KegxgXVuKFlsXK/pzM8tea5l4xXhjQbDl
	sfsm8CWkIZNy07M1Z+4CJUCfs5mYRZmH71fin2mNDrecPJbFWd4DjRQps4oAok9ofjTA0anBZ1uNM
	R51bnrWJmYq7jxgrUouUTYil7B0zv/vvMuAZa2gLbpifKrAhUslBylFfLJqZ/v1j7D846SYTM1wQw
	zHazQBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzyig-00000005TBW-0eqV;
	Sat, 20 Sep 2025 14:37:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzyid-00000005TAa-39cR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 14:37:45 +0000
Date: Sat, 20 Sep 2025 16:37:31 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758379058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=;
	b=IuOAYaht68bYkyaAnw8mBbLpF0dn3cHPZYb3bHY/9Qnt9yej59kdqYZJUWNbDzZGSJ3TIy
	vjrvCVj7pN9urWJ8vbE7f5Y7s06j1F7C25eooUUWlI/++co+NpbE+0c3O9gU8JhqiQ4SOp
	nEr9GIBlux69WP9tMhPFg67LTHmTvdVHi2p9ozbkfo80InufXiIgLtH8e3RsPcupcPYRP2
	nssGv7o6Yg5ve4IE1rmDb+lFxtqdTCMXnzYxTXl6UFFDzvLF6IKJDyxsjpNQs2JoC30EGY
	l4VSzJrhtm6l5eUJHa5gMp4mr91o6zftCBBdh0zhww52FxDcaykrwIYDsaTHpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758379058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=;
	b=LiyXhnJEAMLAmv3dP0IXuri7G82RDp9AQI+GKRfiI7mQ/gNlgkAkJhXcdz7geMJwt+zvtQ
	OagdT5Ug6EumENCg==
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
Message-ID: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
In-Reply-To: <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_073743_930419_1101AF90 
X-CRM114-Status: GOOD (  16.04  )
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

Sep 20, 2025 15:25:11 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> On Wed, 2025-09-17 at 16:00 +0200, Thomas Wei=C3=9Fschuh wrote:
>> The generic vDSO provides a lot common functionality shared between
>> different architectures. SPARC is the last architecture not using it,
>> preventing some necessary code cleanup.
>>
>> Make use of the generic infrastructure.
>>
>> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
>> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>>
>> Tested on a Niagara T4 and QEMU.
>>
>> This has a semantic conflict with my series "vdso: Reject absolute
>> relocations during build". The last patch of this series expects all use=
rs
>> of the generic vDSO library to use the vdsocheck tool.
>> This is not the case (yet) for SPARC64. I do have the patches for the
>> integration, the specifics will depend on which series is applied first.
>>
>> Based on tip/timers/vdso.
>
> Could you share a version of the series based on top of 6.17.0-rcN for
> testing purposes? I would like to test the series on a Sun Netra 240
> which is based on the UltraSPARC IIIi.

Here is the git branch based on rc4:
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git=
/log/?h=3Db4/vdso-sparc64-generic-2

Does that work for you?

Thanks for testing!

Thomas

