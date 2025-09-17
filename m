Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF2DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 05:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xpKjZAE80H4GNebrsZS/MW8m8KLs2QPMqTC7iL4j2lg=; b=DZy+aiurBj/wkN
	u+XSQ11fR86YzEZv3j0Fvz1eh46wRQ74pDvQAlFtS2uaLlDx7lwVXDEWP7MPMhPcg+OpDtnrCsopw
	6SSTRPOWzw5lu5schAppxw5sYqKndksUL3BnsCZHpPiyq3TC5ZKWRR7Uo09eou25xj4WJD59BsyZH
	IYJZk6AybCmml5Ut8V2kOrllSrjCtbPv6gBTZZg5cLpTetdAoMLIGK34BWgXglu8hIVt/GRWCMI2l
	n7jhFQb3E8oiF4omFWpd5WG20FYUZO6OGnGL5V0kZlqOiEAFJn9ugOJCPXp9V2R5w0+VWcfB4FBfX
	l+8Pd2cEaeaUpYWXQVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyl1T-0000000AGJb-1WwD;
	Wed, 17 Sep 2025 05:48:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyl1Q-0000000AGIm-2LSI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 05:48:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758088082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=xpKjZAE80H4GNebrsZS/MW8m8KLs2QPMqTC7iL4j2lg=;
	b=04v/c5wLjN/EEQafgGY+oDwRsFZSNIy1Eg1ETOEblnJHoY9Npd5jWNYJ4G0ML/EKcdAjsw
	78SdlxibZw4pFkh+JmCVw0vn6xoqHisLavZVq1wCrgOpsXL4yfhX7YBcw3N2PNxHfvH4GD
	FvQcD0uGntFdRMnVNaACKNHnhHgFYnXf2vYQfldHTGOcCsdE2rwy1mqctgClJ9fMtcDyeD
	SeUnNeTNy9gvKoMB7KSUV3RwfJkiLIymmw31w/+B9Y/P23/wQ7a/eWJvaxp+zOcBXinuEi
	PseqAgwJTKPikBMj6GsCene3O/aeosZKXhrhdPgh3q2IPOPpt8QRQG6YKwFpmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758088082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=xpKjZAE80H4GNebrsZS/MW8m8KLs2QPMqTC7iL4j2lg=;
	b=YpwvaGR/hOcTOCdIjXiofkasT5LIYsnhJ8NrUCvS8o5V575d/Oa+L6Hn6M2FPc+I4mXDVQ
	7Hm9SWpcflikgmDQ==
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
In-Reply-To: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
Date: Wed, 17 Sep 2025 07:48:00 +0200
Message-ID: <875xdhaaun.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_224804_738656_DB5AE48C 
X-CRM114-Status: GOOD (  17.87  )
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

On Tue, Sep 16 2025 at 22:26, Russell King wrote:
> On Tue, Sep 16, 2025 at 06:33:09PM +0200, Thomas Gleixner wrote:
>> When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
>> for no real good reason. This prevents using get_user(u64) in generic code.
>
> I'm sure you will eventually discover the reason when you start getting
> all the kernel build bot warnings that will result from a cast from a
> u64 to a pointer.

I really don't know which cast you are talking about.

  	u64 __user *uaddr =  ...;
	u64 val;

        ....
        unsafe_get_user(val, uaddr, fault);

The only casts in this macro maze are in __get_user_err():

 1) Casting the uaddr pointer to unsigned long:

     unsigned long __gu_addr = (unsigned long)(ptr);

    which is correct because a *u64 pointer is still only 32bit wide on a
    32bit machine, no?

 2) Casting the result:

    (x) = (__typeof__(*(ptr)))__gu_val;

    which is casting to the type to which the pointer points to,
    i.e. u64 in this case.

I definitely checked the ASM result after I successfully compiled the
above w/o warnings. It compiles to:

 ad0:	ee032f10 	mcr	15, 0, r2, cr3, cr0, {0}
 ad4:	e3a00000 	mov	r0, #0
 ad8:	e4b3e000 	ldrt	lr, [r3], #0
 adc:	e2833004 	add	r3, r3, #4
 ae0:	e4b32000 	ldrt	r2, [r3], #0
 ae4:	ee03cf10 	mcr	15, 0, ip, cr3, cr0, {0}
 ae8:	e16f0f10 	clz	r0, r0
 aec:	e581e000 	str	lr, [r1]
 af0:	e5812004 	str	r2, [r1, #4]

which is magically correct despite the fact that I missed to change the
type of __gu_val to 'unsigned long long'. I just noticed when I tried to
figure out which cast you were referring to.

The wonderful and surprising world of macro preprocessing. :)

That unsigned long long is not hurtful as the compiler is smart enough
to optimize it away when __get_user_err() is invoked to read an u8 from
user:

 b18:	ee033f10 	mcr	15, 0, r3, cr3, cr0, {0}
 b1c:	e3a03000 	mov	r3, #0
 b20:	e4f04000 	ldrbt	r4, [r0], #0
 b24:	ee032f10 	mcr	15, 0, r2, cr3, cr0, {0}
 b28:	e16f0f13 	clz	r0, r3
 b2c:	e5c14000 	strb	r4, [r1]

which is exactly the same result as before this change.

Thanks,

        tglx

--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -286,7 +286,7 @@ extern int __put_user_8(void *, unsigned
 #define __get_user_err(x, ptr, err, __t)				\
 do {									\
 	unsigned long __gu_addr = (unsigned long)(ptr);			\
-	unsigned long __gu_val;						\
+	unsigned long long __gu_val;					\
 	unsigned int __ua_flags;					\
 	__chk_user_ptr(ptr);						\
 	might_fault();							\


