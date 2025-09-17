Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIG6OxSMNr+vnpp+KbXOE+yAQJXMb8ehGjpaRYDPXPI=; b=3/Gnnw84Q0XVgKIaI7SBJ9AVR3
	kl38qmNCRE8WiU8SAUzh2hyWqTdt5kT1nHvlMRRVgfNFm5TCS03M4yzUAZQCQokUShQA/IWYxs+5z
	ZWQ1LOhx5y8o2fd7TwmsD2gmc/qw/aK7SXSz7sKGkAzkl6MhpDQGUXwFDl15kZntyplp7TbQad3V5
	LpeyK1R5LeXns0srvCpMotLQb1bybFvzJHlIyJ7A6IU11FnHAZQk4SYL11283BjeinbWsEt+/R14a
	eepo7Nzj0xJtvlfbLKHgtZp+h0ISrzkhuP53XhwTDxf8MwlmTabCNjZ3fVTJ4NcsKw30syTYMhIps
	VbZ+hGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrcM-0000000BQrf-08Z4;
	Wed, 17 Sep 2025 12:50:38 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrcJ-0000000BQpK-0nXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 12:50:36 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRdXQ3MrBz9sSX;
	Wed, 17 Sep 2025 14:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hByasP5zA5U; Wed, 17 Sep 2025 14:35:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRdXN460gz9sSW;
	Wed, 17 Sep 2025 14:35:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A9278B768;
	Wed, 17 Sep 2025 14:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sCBsXy1_jEJK; Wed, 17 Sep 2025 14:35:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 977AD8B763;
	Wed, 17 Sep 2025 14:35:31 +0200 (CEST)
Message-ID: <179737a1-8847-46e0-b8d2-aba89968d481@csgroup.eu>
Date: Wed, 17 Sep 2025 14:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, x86@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk> <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_055035_391217_A6BF626D 
X-CRM114-Status: GOOD (  14.77  )
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



Le 17/09/2025 à 11:41, Russell King (Oracle) a écrit :
> You may think this is easy to solve, just change the last cast to:
> 
>          (x) = (__typeof__(*(ptr)))(__typeof__(x))__gu_val;
> 
> but that doesn't work either (because in the test case __typeof__(x) is
> still a pointer type. You can't cast this down to a 32-bit quantity
> because that will knock off the upper 32 bits for the case you're trying
> to add.
> 
> You may think, why not  move this cast into each switch statement...
> there will still be warnings because the cast is still reachable at the
> point the compiler evaluates the code for warnings, even though the
> optimiser gets rid of it later.
> 
> Feel free to try to solve this, but I can assure you that you certainly
> are not the first. Several people have already tried.
> 

No such problem on powerpc/32, maybe because we have defined and use 
macro __long_type(x), see below:

#define __get_user_size_allowed(x, ptr, size, retval)		\
do {								\
	retval = 0;						\
	BUILD_BUG_ON(size > sizeof(x));				\
	switch (size) {						\
	case 1: __get_user_asm(x, (u8 __user *)ptr, retval, "lbz"); break;	\
	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
	default: x = 0; BUILD_BUG();				\
	}							\
} while (0)

/*
  * This is a type: either unsigned long, if the argument fits into
  * that type, or otherwise unsigned long long.
  */
#define __long_type(x) \
	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))

#define __get_user(x, ptr)					\
({								\
	long __gu_err;						\
	__long_type(*(ptr)) __gu_val;				\
	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));	\
								\
	might_fault();					\
	allow_read_from_user(__gu_addr, __gu_size);		\
	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
	prevent_read_from_user(__gu_addr, __gu_size);		\
	(x) = (__typeof__(*(ptr)))__gu_val;			\
								\
	__gu_err;						\
})



