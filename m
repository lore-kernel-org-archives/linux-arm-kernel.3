Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C62EEB7EA3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG26zjgDK5eBMn4s4euS52tQRFYHZ3KePwJU6F0o7Ao=; b=Q7K92e09xMUCND6d1ujORkhrZI
	MkrDqFqdYNWOZUDSi3NPtfnUe72Fv//XSF6o1WNkr4YGMuhGzbLl8FiCi3fTDIyRcKAxMNlgf7lfY
	vj/6MkwjruGzSnTtumU8APISFXPDszgB60MWXF4t4xXvuQHGDYSO3bhQiN9nUvOT9siM/hjpBCDdK
	N+E4eF2FWhi6ciH8oaZmIGUYqyVqdZGNt1QPvqDBHgfmrz3v0LP2X9SDX792xuMHVl03F+tgWJU/x
	tE93leC9UesLU+4w/cjS/buF3cTcHHPYoPgaR37Lwh5EEA4P8g66gjQepGwcReoy16F9hZ+bD4tkH
	dA9KDfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhJb-0000000GiAB-1Wbb;
	Wed, 04 Mar 2026 08:10:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhJZ-0000000Gi9q-1v1E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD0EB40999;
	Wed,  4 Mar 2026 08:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53E8C19423;
	Wed,  4 Mar 2026 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611840;
	bh=x/cjkUsrdE57qY9IYoGwEYkkvopBW35thxqhqdiJIAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZvsY4JxFcYf52LCAM8zNIoCTUr/ugS8UrXI8DpnABve0PkoahFeUDVQyAZ2T7w5tc
	 qvDxXw377nK660zLOZq0b1o4TMaqwXcThhKOlEpjZFL0bkvwxztXrr9ZfUwyJTBKr8
	 cQxEFx0psqwMRwqmtOZEExTbQ7fXQvjYQp1XY9q5+MJUrg2BO+qa42sUoMUFw/UKDM
	 FTPPks6SNAe+9AFIQxr/FV9a/NoFSZsQPHrTqKnPcpAk+LPhi9vX+9vtaSsBZMqckd
	 jCBvfJZ1aYZ2JCuOJ5wjnShT63I1i+NIZT0LHit09LZaUnxSAYz27d1DHaKybPv+SF
	 oKjTezLFpLZ+A==
Message-ID: <21ee2f0b-ae8e-40b6-ab13-e46f55c34254@kernel.org>
Date: Wed, 4 Mar 2026 09:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] vdso/datastore: Reduce scope of some variables
 in vvar_fault()
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
 <20260304-vdso-sparc64-generic-2-v6-1-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-1-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001041_553436_9C91CB07 
X-CRM114-Status: GOOD (  15.79  )
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
> These variables are only used inside a single branch.
> 
> Move their declarations there.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   lib/vdso/datastore.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index a565c30c71a0..2cca4e84e5b5 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			     struct vm_area_struct *vma, struct vm_fault *vmf)
>   {
>   	struct page *timens_page = find_timens_vvar_page(vma);
> -	unsigned long addr, pfn;
> -	vm_fault_t err;
> +	unsigned long pfn;
>   
>   	switch (vmf->pgoff) {
>   	case VDSO_TIME_PAGE_OFFSET:
> @@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			 * Fault in VVAR page too, since it will be accessed
>   			 * to get clock data anyway.
>   			 */
> +			unsigned long addr;
> +			vm_fault_t err;
> +
>   			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
>   			err = vmf_insert_pfn(vma, addr, pfn);
>   			if (unlikely(err & VM_FAULT_ERROR))
> 


