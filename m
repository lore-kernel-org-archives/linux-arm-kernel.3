Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F74EB7EA0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0EweCKy3lU+DdloOAnpjGiH/03g5gh5bSik4KxXyvc=; b=Ilp1+piXVdq12Jr5RR2eDGkKwX
	HY1QpOaSG8PN4Zm2iCvHs0kj29tLcWRExA7hAPW19kHPUQ5l23bZZlhQZbBIwz1PvDRypvmPGLAMY
	9pZ/+sSYAOTUzyCiQP48aYaAYB4VJf3t6xOqTV9mKmzWMulf8ucztBBLghNhd90c4214sUHwirlIo
	SwlCs73hKv2HG0uZfFQsurAcj9yWqASSvMANy74dVRPwzis5L6LeW2eLDnA/6UmNsdmzlw7+7vPXf
	lFeUPUb5G4ePl6s3X3XvIhREAe+EXeKccfaLX86ksdv0mKJWYcUCSyWl2wKddJlDoWnauS/VjgFS6
	oqjg0OwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhKA-0000000GiGx-01o4;
	Wed, 04 Mar 2026 08:11:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhK7-0000000GiFz-1Phl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A8AB41858;
	Wed,  4 Mar 2026 08:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0EDC2BC87;
	Wed,  4 Mar 2026 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611874;
	bh=II4aDDUE02AkgxLhaNuEGD/wI5+MI7d/Qa23fAse7cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A5lAjDtanRrs9/jMMfHZjLSQ4Tg+H1VtfLa02oOUXcBRCAvsllq3CMU8FsnYUKRU3
	 woEFbclHxtUCwYTflKhlqjQJ6PMrfjDkK1vS5GSChwmTBU1t/pmnqyAIxzz3JAtWu2
	 ZbxNjbEL2y7qLePDpgoHQAxIhG6/hySl/e8E08ruXkBf9va7XSf3qwlpvMCFAxJgJn
	 VtP6wU0+i5KB4nyeyOBs7VQZC3BzAIhStfnN8Yuvxcvj/3LjK6oz8JHPMmslzsIxJG
	 CecyeCXm0oJ/jY87OVjfE/zG8M/hbHlZQFGt3yFkwXPD/7uU5Ewy54hZdZcV8TPiTj
	 ZUGPqjyFwEuQg==
Message-ID: <5e2c2d09-315c-4f68-a762-54253e2320c9@kernel.org>
Date: Wed, 4 Mar 2026 09:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/14] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
 <20260304-vdso-sparc64-generic-2-v6-2-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-2-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001115_528119_7AAECBD5 
X-CRM114-Status: GOOD (  11.86  )
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



Le 04/03/2026 à 08:48, Thomas Weißschuh a écrit :
> This header is unnecessary and together with some upcoming changes would
> introduce compiler warnings.
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250916-mm-rcuwait-v1-1-39a3beea6ec3%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C8f791d1218bb4befc3d908de79c289b8%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639082073628618434%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xxp2D4fWK%2Fd9%2BhcwfbD7s7ft5l773T3LhRdnchXga28%3D&reserved=0
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   lib/vdso/datastore.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index 2cca4e84e5b5..7377fcb6e1df 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -1,7 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/linkage.h>
> -#include <linux/mmap_lock.h>
>   #include <linux/mm.h>
>   #include <linux/time_namespace.h>
>   #include <linux/types.h>
> 


