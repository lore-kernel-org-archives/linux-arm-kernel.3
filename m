Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1469CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=; b=LE7wXUt10TcOiSfZlGGSEHrRdz
	0mPiJmmSfoNFdR8wdQDeSUsjd1gpvBCK618xWzCthpEr0g+ANCurcobbiZjK77Sbg9E6ruw0locEx
	vwpMt7qQ5cI6FvJSdKZnhHliixyxUHbcVXuDgV43Kb3zrjsNKuAH6oMFOq1ZbilmqMxNVs9vgYa8e
	htRGdcISsLE+f/73Qj8rQfAk1dTx2zSV1ANO+8Gy1fwhhdWNHf1nYIpqqfHKGxpHUrtJ7/fdS4/Dx
	2YEMiTl7MMHnUJ4Y4BlqDkyjsbH5V94k3LFkymnqF7znkxJoxqf0xc+T2l5Lyh1h6scmdkgGi3rw6
	U8Y+2VPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH06o-0000000FZqS-2XXr;
	Thu, 06 Nov 2025 13:33:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH06l-0000000FZou-1xcU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:33:00 +0000
Date: Thu, 6 Nov 2025 14:32:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762435976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=;
	b=XS5vcpYsyAxNvRXOzuV5hRb/nQgFMLuPJMVo17+GbZKgOVszq7TxXwgPILyevsEeD41fRn
	qOecx6vaBm+bot7gT0OvheUUOzSI/pCShMR7tGzNjWpRHVrPUfjroThu/dYpXsZWlxaEeV
	xJ5xEAUZvXg5zU2IycYwgMGtSJLdOOxj/L6FphMysTTnqID+uvpkGIepHgdU3dYJMYHK0D
	NqmpgjE3ZZBGM791NCYCLB4PlFTInSDtb+xizEDEsMjUL1/vQ2L3uOAXQyBpRCYcmc1FsI
	2+nm2NpDf8vOD6oEAqJpBSUip2moNPpLvHwoBacGawqj3f0ZCv3Emz/VsYjdKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762435976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=;
	b=h2lJfuFW33gCMREswtFH2osl5Sj9f2XsBF94AxG8++SjialvXzh6EqV+QL44v58SNQ52NN
	ToDU5p9Dbx2lwbCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com, 
	Ryan.Roberts@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_053259_650686_9A65C7DA 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Mark,

On Thu, Nov 06, 2025 at 01:28:35PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> > On 03.11.2025 16:24, Mark Brown wrote:
> > > On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Weißschuh wrote:
> 
> Copying in Ryan Roberts who's much more likely to have some idea about
> memory management stuff for arm64 than I am (I have been poking at this
> a bit but not got anywhere notable).  Not deleting context for his
> benefit.

It turned out not even to be an mm problem.
Instead the data pages were not zeroed out on allocation.

> Given that this issue is very disruptive to userspace it's causing us to
> miss huge amounts of test coverage for -next, would it be possible to
> drop these patches until we resolve the issue?

This issue and the observed panics should be fixed in v5 of the series:
https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de/

I'll ping tglx directly.

(...)


Thomas

