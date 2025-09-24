Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D08CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=; b=OnpOOqOlzKqMHLeJabEpSFQPr4
	YlG8PSPJE+TrenZ0kdoIGODqk2msYtf/UKAzp4P0m2WZJdaHfOeFFKB4sT1N8gWVSKBU988NH8z9R
	cvsWFYuRQh5LavQEpryDbcTieBWUAs/LAFaOt+IZYkZpDr5T78lCsCnS+A/H4xyCqO7Xg1xZZ6Blz
	0n2xyG2rXpOQnwmPOFLpHNM/jMvUpAzVnosqrskKVNiBvssMDq+yfBVqxg+OvzUiLZGZbP0t3Ls3j
	oMYxYUQoSiJAH3CAU+A6ogUJ7EYoWT42CDvGhxaW7T/G671o8NFvIeBZ9Xj58HosEoS6hDfqkDXTz
	PNrMOEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KXV-0000000FpSL-2Ed7;
	Wed, 24 Sep 2025 08:07:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KXS-0000000FpR6-22aZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:07:47 +0000
Date: Wed, 24 Sep 2025 10:07:36 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758701262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=;
	b=31Omeb15YqChHkBBrePL7NG3JD983FRx11Q5uWT/69RIupuUYdoTYmGARAlJia6NlrrGQN
	5bccvQRhu9NcTZtmvjlgyrvdEj5A1CDs8zthnojoVFXb7nQgs5SpXbO8rV9L4e+rwnpaCO
	ua2jL9ZurCRzeQvEx0XtMCN7QuKSfAfEmHL2Y+sW7stPznDDzQHvTqbRTdGYko3+/T12ye
	j1+Ro5mKKD/7GFoBxJzLa4UvxffzbMiluz2XiPl0kMDb4Rznzr4zg9+LVFIMxv9nAN+P3+
	XSkEVbGVGFCipqBlQpFNsRbuwLO+4Us4XFeGg8YiuoKCqT4LwQxWTqtgvVs2Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758701262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=;
	b=n9aMu2nrfU7/A2LOU0ndnoE+3K8jSV2X1C4MQa1OTm1DcYDn9hSt6n0FuxlpuJtK/TUJKn
	tCL0hbarV8eUGJBg==
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
Message-ID: <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
In-Reply-To: <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de> <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de> <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_010746_663045_B0029CDA 
X-CRM114-Status: GOOD (  11.79  )
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

Sep 24, 2025 09:40:47 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> Hi Thomas,
>
> On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
>>> Could you share a version of the series based on top of 6.17.0-rcN for
>>> testing purposes? I would like to test the series on a Sun Netra 240
>>> which is based on the UltraSPARC IIIi.
>>
>> Here is the git branch based on rc4:
>> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.=
git/log/?h=3Db4/vdso-sparc64-generic-2
>>
>> Does that work for you?
>
> I'm getting merge conflicts with "vdso/datastore: Allocate data pages dyn=
amically" and
> "vdso/datapage: Remove inclusion of gettimeofday.h".
>
> Can these be skipped?

No, these are important.

What are you trying to merge?
I can probably give you a merge.


Thomas

