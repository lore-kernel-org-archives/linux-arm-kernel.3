Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC8CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6wijLJ6yPSQGb++9TSkyHX8aU2wWOVN2uZhv4Iw/Sg=; b=gWL3La0eCzd/W84xdHW8DESTQe
	U8ouI7pbv5vxpxmRbfA7YBRcMaKGxOsKDt6Yc8565ycAS4HaTHH/qfSVS2mY5nAYF+ReYrTjKUTVx
	4vdkLugki2aBWwjsA8ERh04Z25FrpbYMHWBj5LMog81/lcTuhHtghsaDpkWoVm3SPCZv0Yh6vKQqS
	wozmKQcVkydEKOI5dJ21XRHV15rhbCZbsQdy/ZkLRL+9+WHe+xeylKfiicMQKq6ac9h+ovNCBjm7Z
	AOPvzF5zV8SsLrZVefGc5Fo9gacz5wBPF/TpfuDFwZCOmGCWQd9qZxVYETaxGIE40I5lM33BDk9fF
	Fb8r0dIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyscu-0000000Bu3w-1l7R;
	Wed, 17 Sep 2025 13:55:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyscs-0000000Bu0u-1YYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:55:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6wijLJ6yPSQGb++9TSkyHX8aU2wWOVN2uZhv4Iw/Sg=;
	b=htgrVUpNqPrUTT6sap0+RKqY8mN+zAHUnhbm4XiqKktMI6nALNkdAU+PveIoIqDoof0yds
	R4dyZ6gGiKCQ3a4Nc7BxZsrZbq5o/1dkdzJF89dWlE5bxo4FGU/DKQdxc5qDuSx6IWcGwM
	xZEpals5M7jmJahtYkM4UjQYIPTbzm5isG7uJSgBVtgWxjaRLMmk23+XcwGBF+MSQzvI6v
	2xxzUsP6k3TCT4jllVI0Y9goiWTEesxDYvzKvvSHvkD6tWS4IEfh3tWH92htAE4rcDWsrG
	2MkzKaMJXJwz1o/1Bq7TybNJcwhwXYa8hgnaznHEUEb/wPH+Ds+SHmBFP6B91A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6wijLJ6yPSQGb++9TSkyHX8aU2wWOVN2uZhv4Iw/Sg=;
	b=rrkryvZtbzDTZhErhLp6hLKXjabdn0poRB3ciKeE+zajjGUOV6BUMtFyRPOGkyL5t1KOhm
	b17M+ZxIpGo64yBQ==
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
In-Reply-To: <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk> <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
Date: Wed, 17 Sep 2025 15:55:10 +0200
Message-ID: <87y0qd89q9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_065514_549903_81C43DB3 
X-CRM114-Status: GOOD (  23.73  )
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

On Wed, Sep 17 2025 at 10:41, Russell King wrote:
> On Wed, Sep 17, 2025 at 07:48:00AM +0200, Thomas Gleixner wrote:
>
> Putting together a simple test case, where the only change is making
> __gu_val an unsigned long long:
>
> t.c: In function =E2=80=98get_ptr=E2=80=99:
> t.c:40:15: warning: cast to pointer from integer of different size [-Wint=
-to-pointer-cast]
>    40 |         (x) =3D (__typeof__(*(ptr)))__gu_val;                    =
         \
>       |               ^
> t.c:21:9: note: in expansion of macro =E2=80=98__get_user_err=E2=80=99
>    21 |         __get_user_err((x), (ptr), __gu_err, TUSER());           =
       \
>       |         ^~~~~~~~~~~~~~
> t.c:102:16: note: in expansion of macro =E2=80=98__get_user=E2=80=99
>   102 |         return __get_user(p, ptr);
>       |                ^~~~~~~~~~
>
> In order for the code you are modifying to be reachable, you need to
> build with CONFIG_CPU_SPECTRE disabled. This is produced by:
>
> int get_ptr(void **ptr)
> {
>         void *p;
>
>         return __get_user(p, ptr);
> }

Duh, yes. I hate get_user() and I did not notice, because the
allmodconfig build breaks early due to frame size checks, so I was too
lazy to find that config knob and built only a couple of things and an
artificial test case for u64.

But it actually can be solved solvable by switching the casting to:

    (x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;

Not pretty, but after upping the frame size limit it builds an
allmodconfig kernel.

The proper thing to use the corresponding sized values within the case
$SIZE sections i.e.:

	size 1: {
       		u8 __gu_val;
                __get_user_asm_byte(__gu_val, __gu_addr, err, __t);
                (x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;
		break;
	}
        ...

See below.

> Feel free to try to solve this, but I can assure you that you certainly
> are not the first. Several people have already tried.

Obviously not hard enough. :)

Thanks,

        tglx
---
Subject: ARM: uaccess: Implement missing __get_user_asm_dword()
From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 12 Sep 2025 20:16:11 +0200

When CONFIG_CPU_SPECTRE=3Dn then get_user() is missing the 8 byte ASM varia=
nt
for no real good reason. This prevents using get_user(u64) in generic code.

Implement it as a sequence of two 4-byte reads with LE/BE awareness and
fixup the size switch case to make get_user(*ptr, **usrptr) work.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Closes: https://lore.kernel.org/oe-kbuild-all/202509120155.pFgwfeUD-lkp@int=
el.com/
---
V2a: Solve the *ptr issue vs. unsigned long long - Russell
V2: New patch to fix the 0-day fallout
---
 arch/arm/include/asm/uaccess.h |   50 ++++++++++++++++++++++++++++++++++++=
-----
 1 file changed, 44 insertions(+), 6 deletions(-)

--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -286,19 +286,41 @@ extern int __put_user_8(void *, unsigned
 #define __get_user_err(x, ptr, err, __t)				\
 do {									\
 	unsigned long __gu_addr =3D (unsigned long)(ptr);			\
-	unsigned long __gu_val;						\
 	unsigned int __ua_flags;					\
 	__chk_user_ptr(ptr);						\
 	might_fault();							\
 	__ua_flags =3D uaccess_save_and_enable();				\
 	switch (sizeof(*(ptr))) {					\
-	case 1:	__get_user_asm_byte(__gu_val, __gu_addr, err, __t); break;	\
-	case 2:	__get_user_asm_half(__gu_val, __gu_addr, err, __t); break;	\
-	case 4:	__get_user_asm_word(__gu_val, __gu_addr, err, __t); break;	\
-	default: (__gu_val) =3D __get_user_bad();				\
+	case 1:	{							\
+		u8 __gu_val;						\
+		__get_user_asm_byte(__gu_val, __gu_addr, err, __t);	\
+		(x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;	\
+		break;							\
+	}								\
+	case 2:	{							\
+		u16 __gu_val;						\
+		__get_user_asm_half(__gu_val, __gu_addr, err, __t);	\
+		(x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;	\
+		break;							\
+	}								\
+	case 4:	{							\
+		u32 __gu_val;						\
+		__get_user_asm_word(__gu_val, __gu_addr, err, __t);	\
+		(x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;	\
+		break;							\
+	}								\
+	case 8:	{							\
+		u64 __gu_val;						\
+		__get_user_asm_dword(__gu_val, __gu_addr, err, __t);	\
+		(x) =3D *(__force __typeof__(*(ptr)) *) &__gu_val;	\
+		break;							\
+	}								\
+	default: {							\
+		unsigned long __gu_val;					\
+		(__gu_val) =3D __get_user_bad();				\
+	}								\
 	}								\
 	uaccess_restore(__ua_flags);					\
-	(x) =3D (__typeof__(*(ptr)))__gu_val;				\
 } while (0)
 #endif
=20
@@ -353,6 +375,22 @@ do {									\
 #define __get_user_asm_word(x, addr, err, __t)			\
 	__get_user_asm(x, addr, err, "ldr" __t)
=20
+#ifdef __ARMEB__
+#define __WORD0_OFFS	4
+#define __WORD1_OFFS	0
+#else
+#define __WORD0_OFFS	0
+#define __WORD1_OFFS	4
+#endif
+
+#define __get_user_asm_dword(x, addr, err, __t)				\
+	({								\
+	unsigned long __w0, __w1;					\
+	__get_user_asm(__w0, addr + __WORD0_OFFS, err, "ldr" __t);	\
+	__get_user_asm(__w1, addr + __WORD1_OFFS, err, "ldr" __t);	\
+	(x) =3D ((u64)__w1 << 32) | (u64) __w0;				\
+})
+
 #define __put_user_switch(x, ptr, __err, __fn)				\
 	do {								\
 		const __typeof__(*(ptr)) __user *__pu_ptr =3D (ptr);	\



