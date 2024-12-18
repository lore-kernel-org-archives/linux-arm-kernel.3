Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DC8E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+W7VROJYAKWesW0btuLtsny/5rudGPHx9yR2y+wyzo=; b=HbDntXTn3rseX2Fm5M75yJD3rs
	AtVpnFIJZQ7sGhNIvv/6dL74S61jhwgzgj1tYtVEon+nuM5aiBpYZT0oGwvQE5qTToQr6+MIqVMTA
	4t2DiTPQVBBp24qRxRjJBctpuO46bpvyo2XsuzRlSXFbBcsP3lpBP/mCZdz9YOV7K81W2mOABT1Rv
	KBIZ23anBESgMRy1Q6Ne0EMfOAGGuHG+RD9JhZEm2Mv0bOmXs2xY5nTAJU2B5LefseMbvBkXXZjTN
	7aow9NcSTB1CohwwvuSwk8N9wsCzfPlGsYBRsOOMcuixi5dRGiJJj6agkDvnlrX9FO4ICpxyihOKH
	W9WVH3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsAt-0000000GRb0-2bhM;
	Wed, 18 Dec 2024 11:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrAB-0000000GEYK-0mjQ;
	Wed, 18 Dec 2024 10:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y+W7VROJYAKWesW0btuLtsny/5rudGPHx9yR2y+wyzo=; b=qd+WfcHOCwTPnnDR34QoHWF/x7
	ZiOcQ54IhjQN/JspesBSvILNr2BUqBnkndO4OfaEGMgxL4QFiCL8Jvb2vasBi9JsjxzcPa39/OheN
	LnyxvWC3IbHEBDYrLsnetkdGZpVlAViQciR4e+/UUMF53isrmPfqTeJPvsd7rGSnjYUZBtkhvlTx1
	UM2QANC7awSY72XKzfI8IYXeNQhJHHUALyvi6qVE6aza+uVv70ZuCRvUjdLU28QNrPXTQa3CFl/fO
	gSENNHjANgipzu+sYHSNgwCyK6RymWvFMbaVEMR6B8owDOOSwtDiy6EQco1Oc8SZtFloB2in4MT04
	NBmVjblg==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrA8-00000005EXv-0rJ0;
	Wed, 18 Dec 2024 10:20:17 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YCqSD111Vz9sPd;
	Wed, 18 Dec 2024 11:20:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKpioB5BCG2d; Wed, 18 Dec 2024 11:20:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YCqSC6pM5z9rvV;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC0DD8B770;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ffiwrVR0qIrj; Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D2408B763;
	Wed, 18 Dec 2024 11:20:11 +0100 (CET)
Message-ID: <e69b2927-b415-4e16-a346-8d874c9a8b39@csgroup.eu>
Date: Wed, 18 Dec 2024 11:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] powerpc/vdso: Switch to generic storage
 implementation
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-12-f7aed1bdb3b2@linutronix.de>
 <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102016_456631_42685E30 
X-CRM114-Status: GOOD (  11.41  )
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



>>   #ifdef CONFIG_TIME_NS
>> -static __always_inline
>> -const struct vdso_data *__arch_get_timens_vdso_data(const struct 
>> vdso_data *vd)
>> +static __always_inline const struct vdso_time_data 
>> *__ppc_get_vdso_u_timens_data(void)
>>   {
>> -    return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
>> +    struct vdso_time_data *time_data;
>> +
>> +    asm(
>> +        "    bcl    20, 31, .+4\n"
>> +        "0:    mflr    %0\n"
>> +        "    addis    %0, %0, (vdso_u_timens_data - 0b)@ha\n"
>> +        "    addi    %0, %0, (vdso_u_timens_data - 0b)@l\n"
>> +    : "=r" (time_data) :: "lr");
>> +
>> +    return time_data;
> 
> Please don't do that, it kills optimisation efforts done when 
> implementing VDSO time. Commit ce7d8056e38b ("powerpc/vdso: Prepare for 
> switching VDSO to generic C implementation.") explains why.
> 
> For time data, the bcl/mflr dance is done by get_datapage macro called 
> by cvdso_call macro in gettimeofday.S, and given to 
> __cvdso_clock_gettime_data() by __c_kernel_clock_gettime() in 
> vgettimeofday.c . Use that information and don't redo the bcl/mflr 
> sequence.
> 
> See for instance function __c_kernel_clock_getres():
> 
> Before your series it is 30 instructions.
> After your series it is 59 instructions.
> 

It is even more obvious with __c_kernel_time()

Before your series it has 12 instructions,
After your series it has 26 instructions.

Before

00001408 <__c_kernel_time>:
     1408:	81 44 00 04 	lwz     r10,4(r4)
     140c:	6d 49 80 00 	xoris   r9,r10,32768
     1410:	2c 09 ff ff 	cmpwi   r9,-1
     1414:	40 82 00 08 	bne     141c <__c_kernel_time+0x14>
     1418:	38 84 40 00 	addi    r4,r4,16384
     141c:	2c 03 00 00 	cmpwi   r3,0
     1420:	81 44 00 20 	lwz     r10,32(r4)
     1424:	81 64 00 24 	lwz     r11,36(r4)
     1428:	41 82 00 08 	beq     1430 <__c_kernel_time+0x28>
     142c:	91 63 00 00 	stw     r11,0(r3)
     1430:	7d 63 5b 78 	mr      r3,r11
     1434:	4e 80 00 20 	blr

Versus after

00001534 <__c_kernel_time>:
     1534:	81 44 00 04 	lwz     r10,4(r4)
     1538:	6d 49 80 00 	xoris   r9,r10,32768
     153c:	2c 09 ff ff 	cmpwi   r9,-1
     1540:	41 82 00 20 	beq     1560 <__c_kernel_time+0x2c>
     1544:	2c 03 00 00 	cmpwi   r3,0
     1548:	81 44 00 20 	lwz     r10,32(r4)
     154c:	81 64 00 24 	lwz     r11,36(r4)
     1550:	41 82 00 08 	beq     1558 <__c_kernel_time+0x24>
     1554:	91 63 00 00 	stw     r11,0(r3)
     1558:	7d 63 5b 78 	mr      r3,r11
     155c:	4e 80 00 20 	blr
     1560:	7c 08 02 a6 	mflr    r0
     1564:	2c 03 00 00 	cmpwi   r3,0
     1568:	90 01 00 04 	stw     r0,4(r1)
     156c:	42 9f 00 05 	bcl     20,4*cr7+so,1570 <__c_kernel_time+0x3c>
     1570:	7c 88 02 a6 	mflr    r4
     1574:	3c 84 ff ff 	addis   r4,r4,-1
     1578:	38 84 2a 90 	addi    r4,r4,10896
     157c:	81 44 00 20 	lwz     r10,32(r4)
     1580:	81 64 00 24 	lwz     r11,36(r4)
     1584:	41 82 00 08 	beq     158c <__c_kernel_time+0x58>
     1588:	91 63 00 00 	stw     r11,0(r3)
     158c:	80 01 00 04 	lwz     r0,4(r1)
     1590:	7d 63 5b 78 	mr      r3,r11
     1594:	7c 08 03 a6 	mtlr    r0
     1598:	4e 80 00 20 	blr

Christophe

