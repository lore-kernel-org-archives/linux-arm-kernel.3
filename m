Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A203C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=; b=LzBmbl3o0fFCiGgnAYaIZC5X/X
	VxCpYoPc71DboXow4Q2poeDXzddYGdOJ+we5DNI0jusVZPcMBkosd1ks0CgR7U18qakrsfOuAB+8a
	YGsFA++aRlVJK303qlrFTq6Tzgnuk8kYEH3aEduU5DmqelHACQ3aJ5lMlSO8vRUw/Lk3exPTPpKK+
	AzScuyOTXIMCmEi59QSLJTrgZ/J4zlDJti/5IGugDQkKp/TTY4UGakseFiSE/tjr+0osz8TZEgxOe
	gjtMPMoUFuUSIkKuteyemNIHmV4OLz2JlR3BRAhAJJsao2due3VrYvnmJAW77U1SYuXbhVPaoPMIY
	gqxUOOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LpC-00000000Bue-1rIe;
	Fri, 25 Apr 2025 16:22:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KBK-0000000HSje-2g4d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745591852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
	b=fHdvbbkRnuAcHV9Ff2u63X4GfbPxUpdnRy9sJTjJLPaT2o7f1t76EuUJ/YGVRS0ccZQ48y
	ABI94Km6CDY2KnVZaZWMMNRHiEEUxRrejFxoKhMzKgm5vLGjX1VvHhSs9/qfgiYgQqobWi
	b5nMGD7FOSrPovktSzpepe2iGYwP4QY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-Vuvsb1rGNWOVF8Kn-8giVg-1; Fri, 25 Apr 2025 10:37:28 -0400
X-MC-Unique: Vuvsb1rGNWOVF8Kn-8giVg-1
X-Mimecast-MFC-AGG-ID: Vuvsb1rGNWOVF8Kn-8giVg_1745591848
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ef89b862dso1216434f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591847; x=1746196647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
        b=p5MjaqzFF7nt6BzKc1PB2o9YiGNJUvbtiQDd0+uzfwVSRYcjxUv6YCBsMZzxiaaa+X
         Dd4SnS4hpFYS4qTYhIQPK5zJFvOmvTSCr0rE3W2InrYyx7ZVG9Gm+p0M60G9ZIxRfUW2
         nOEWNXn8u7l14QUzYPSPKhXZF84XRdC+RPq4hgiFqu2FxYlPXYyTmH40kNhFfSp6pMRa
         8vs272NMhCa2w0dgNfbw0FWXDD3z8tK8eyjWpGDy+9AEDGCsbDWsXfBNGNF0OANj6J6P
         KHh2rV2xunzBWd0JlmG3F0srwIUDwEO5eOvtdVLupt6kUV1Irzb40AwxrDlqQr0GkolA
         BO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCViQWDPR1BCh6j7WZEVqUmXQfs9y4h6Q1BcfD3iO24VYW3MsXmMdD+HOajAdvwpZTvuHuCwtsNVAoBXpf0YrRSH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb3TaKOfzNdBMDLcLEYi6IBT8yErYXsnum+VXv3xeh8/yvehSm
	SL3Lfwe1vr0fGMqFj+IAUvOT5X27iwuO0Kgm6Axy1a6zrkolFns6LkgbwceGwhQjpSUEcrs9qMA
	xYQZ8GdfqGePsvO0YU4J9T3Z3/6rgNeQJ4nsJhn7hqSxGrszkJiodQUq9IAaaz0ui9y2o0Chv
X-Gm-Gg: ASbGncuU/DeKF/omwlrw4epA1CQ9jR8HQ3GyshA871g8P7uQ3F1J+hOWFMWCn2Eb8vw
	ig6gDbYr4ycayxnZKHKPT7C/VRn5S6cxePpxNZPXNB9VSYGxpEXbNN//riT5Pno/Dva4qH82KIM
	iLt/Xy5sgmYhzruN6T2vx0xtVO5RC92Ju5hi52HAM6Wwc15yD0oIeFA/Y6RSeP9PUnruA93GnP7
	1BRfL93aqkpnrwmmrk0TItz0YQEMm3bPOvk1BJ1UJ2Kn3N6g/xNWZLqIq5gv6UY4ODxMvIjNsI4
	fm4qFwkLOAn/t+ot99p2p0Xrug==
X-Received: by 2002:a5d:47ad:0:b0:39e:cbca:8a4b with SMTP id ffacd0b85a97d-3a074e0e1a8mr2130260f8f.6.1745591847598;
        Fri, 25 Apr 2025 07:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHQ8vRI/X7PrO43k0DiFqkqa4Uk8XRAM7d2gJ9xafb1xfkOT7jJlK6mrbxxsPSXHf+XLM2Jg==
X-Received: by 2002:a5d:47ad:0:b0:39e:cbca:8a4b with SMTP id ffacd0b85a97d-3a074e0e1a8mr2130242f8f.6.1745591847204;
        Fri, 25 Apr 2025 07:37:27 -0700 (PDT)
Received: from t14ultra (109-81-82-22.rct.o2.cz. [109.81.82.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530a6e9sm26807935e9.16.2025.04.25.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:37:26 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:37:47 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <aAueO89ng7GX2iyl@t14ultra>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
 <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
 <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
 <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9R9y46S3q7vVMujR4QT21orCCG-KvX-2GzQt4tLXx3Y_1745591848
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073734_757281_3B93F018 
X-CRM114-Status: GOOD (  16.98  )
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

On Fri, Apr 25, 2025 at 03:40:55PM +0200, Thomas Weiﬂschuh wrote:

<snip>

>
>Some more information:
>
>The crash comes from the address arithmetic in "vc = &vc[CS_RAW]" going wrong.

That appears to be because it's not doing any arithmetic, but using value
from some linker-generated symbol (I'll refer to it as "7a8").

The below is presumably the check that compares clk != CLOCK_MONOTONIC_RAW,
CLOCK_MONOTONIC_RAW is 4. And it should choose between first and second vdso_clock
in 2nd vvar page:

# readelf -a /root/kernel-ark/arch/arm64/kernel/vdso/vdso.so.dbg | grep 7a8
     25: 00000000000007a8     0 NOTYPE  LOCAL  DEFAULT    7 $d

objdump -d -S:
  658:   17ffffef        b       614 <__cvdso_clock_gettime_data.constprop.0+0x104>
                 vc = &vc[CS_HRES_COARSE];
  65c:   58000a62        ldr     x2, 7a8 <__cvdso_clock_gettime_data.constprop.0+0x298>
  660:   7100101f        cmp     w0, #0x4
  664:   10e7cce3        adr     x3, fffffffffffd0000 <vdso_u_data+0x10000>
  668:   9a821063        csel    x3, x3, x2, ne  // ne = any
         while (unlikely((seq = READ_ONCE(vc->seq)) & 1))
  66c:   b9400065        ldr     w5, [x3]
...
  7a8:   fffd00e0        .word   0xfffd00e0
  7ac:   ffffffff        .word   0xffffffff


(gdb) r
Thread 2.1 "a.out" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xfffff7ff2dc0 (LWP 44638)]
0x0000fffff7fa066c in ?? ()

(gdb) disassemble 0x0000fffff7fa0658,0x0000fffff7fa067c
--Type <RET> for more, q to quit, c to continue without paging--
    0x0000fffff7fa0658:  b       0xfffff7fa0614
    0x0000fffff7fa065c:  ldr     x2, 0xfffff7fa07a8
    0x0000fffff7fa0660:  cmp     w0, #0x4
    0x0000fffff7fa0664:  adr     x3, 0xfffff7f70000
    0x0000fffff7fa0668:  csel    x3, x3, x2, ne  // ne = any
=> 0x0000fffff7fa066c:  ldr     w5, [x3]

$x3 here is using correct vvar runtime address, but $x2 uses
a bogus one from "7a8". And when it tries to load from it, it crashes:

(gdb) info proc map
process 44638
Mapped address spaces:

Start Addr         End Addr           Size               Offset             Perms File
0x0000000000400000 0x0000000000410000 0x10000            0x0                r-xp  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000000000410000 0x0000000000420000 0x10000            0x0                r--p  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000000000420000 0x0000000000430000 0x10000            0x10000            rw-p  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000fffff7d80000 0x0000fffff7f30000 0x1b0000           0x0                r-xp  /usr/lib64/libc.so.6
0x0000fffff7f30000 0x0000fffff7f40000 0x10000            0x1a0000           r--p  /usr/lib64/libc.so.6
0x0000fffff7f40000 0x0000fffff7f50000 0x10000            0x1b0000           rw-p  /usr/lib64/libc.so.6
0x0000fffff7f60000 0x0000fffff7fa0000 0x40000            0x0                r--p  [vvar]
0x0000fffff7fa0000 0x0000fffff7fb0000 0x10000            0x0                r-xp  [vdso]
0x0000fffff7fb0000 0x0000fffff7fe0000 0x30000            0x0                r-xp  /usr/lib/ld-linux-aarch64.so.1
0x0000fffff7fe0000 0x0000fffff7ff0000 0x10000            0x20000            r--p  /usr/lib/ld-linux-aarch64.so.1
0x0000fffff7ff0000 0x0000fffff8000000 0x10000            0x30000            rw-p  /usr/lib/ld-linux-aarch64.so.1
0x0000fffffffd0000 0x0001000000000000 0x30000            0x0                rw-p  [stack]

$x3 was the beginning of 2nd vvar page (1st vdso_clock), and $x2 looks
like it should have been 2nd vdso_clock, but the value that is used is not
the address of vvar during runtime. 

vdso_clock has size 224 == 0xe0 (according to pahole)

(gdb) x/2x 0xfffff7fa07a8
0xfffff7fa07a8: 0xfffd00e0      0xffffffff
(gdb) p/x $x2
$1 = 0xfffffffffffd00e0
(gdb) x/1x $x2
0xfffffffffffd00e0:     Cannot access memory at address 0xfffffffffffd00e0

But it does match the symbol value from vdso.so:

# readelf -a /root/kernel-ark/arch/arm64/kernel/vdso/vdso.so.dbg | grep vdso_u
     37: fffffffffffc0000     0 NOTYPE  LOCAL  DEFAULT    1 vdso_u_data
     39: fffffffffffc0000     0 NOTYPE  LOCAL  DEFAULT  ABS vdso_u_time_data
     40: fffffffffffe0000     0 NOTYPE  LOCAL  DEFAULT  ABS vdso_u_rng_data

>>> print(hex(0xfffffffffffc0000+65536+224))
0xfffffffffffd00e0 -> and this is address where it crashes

Regards,
Jan

>This should just do "vc = vc + 1", advancing the pointer by sizeof(*vc).
>But I get these example values of "vc" before and after the arithmetic:
>0x00ffffbc060000 -> 0xfffffffffffd00e8
>Which is obviously wrong.
>
>The arithmetic can be fixed with any one of the following changes:
>* OPTIMIZER_HIDE_VAR() as above
>* Replacement of -mcmodel=tiny with -mcmode=small in arch/arm64/kernel/vdso/Makefile
>  -mcmodel=tiny is supposed to cover 1MiB programs, the vDSO only needs 300KiB here
>* Removal of the (clk != CLOCK_MONOTONIC_RAW) case
>
>Shuffling code around, even without any impact on semantics, sometimes fixes
>the issue. Compiling the vDSO with UBSAN didn't show anything.
>
>
>Thomas
>
>> > > > > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
>> > > > > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401
>> > > >
>> >
>>
>


