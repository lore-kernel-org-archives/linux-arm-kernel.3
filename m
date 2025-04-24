Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A47C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=; b=l87UHjkCrSOtjg/0TTaCFUqZAY
	c1lOLQnKftqY5vGl1yOUlw1vQLKActlsHk+De6mAOA5BY5BL6D1D8FbE5VgWPOgYXSM7J5RwTHDHM
	texhAJVO8eaQS7AV6OX6JyIHkcDndXwfij91qfU/XQKoWUCQyF4H8picAm0MMgBUN9EnQj/xbgd2C
	nsyxiQbTJTnSmU9By1RuJSSsu11CywVxed9qdFc4AxXQDhe+PLSOFwC+PHXjATy/1gZ4BBhVjdXy+
	7YincxTrm/eCuFLDggZhKPvdG0D0h9jrk0Bc3sSAAoTmsx5KwGk5huWmoJjAj5eU46iu7JkUHI9fl
	1d7a8IYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84bI-0000000FSYB-38LD;
	Thu, 24 Apr 2025 21:59:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84ZR-0000000FSBn-05bq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745531843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
	b=Uen+WLSxRqBmCBACU6UgZoXbPsvjR3FdjdJsT/baxVHYhj7vXpR20psFyg5EwTGAz9Plt3
	GdnozljDcmrlTAZLLXmBEPUMkeYkA0swareNLGOz+Fcxgtz445GHwsIhwsXT2PXaXvlBDy
	c+t84BYoLsmfYEWD7z9Pqrp6UBz/O7M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-TAKnqcDNOUu0HMzV7TWn5w-1; Thu, 24 Apr 2025 17:57:21 -0400
X-MC-Unique: TAKnqcDNOUu0HMzV7TWn5w-1
X-Mimecast-MFC-AGG-ID: TAKnqcDNOUu0HMzV7TWn5w_1745531840
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso675858f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 14:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531840; x=1746136640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
        b=QN9bAGbpgIuW6fugL/Xizya5S1WFkzvOCr1+ViC/tscBlNr+8Idd5Dqfkp7kPf+FxI
         l+qmS3XbnoXSX+D5594C+u5fiSGmf4gRNQm3Y5wN2/0EmpBC96Qlmu8I40lV0dZy4RxA
         b845zDN8c4/3ebQ3nZKHaNlxR0ng5HCrmK9ATZO8M83FbIyDZ9Kak7KvimLC7suO5Yp3
         pc+j++/FHRbv69+JQOjG+5XkReAdZ4pYRx+5HuiODp9q/IWpnxTJzpvwLm7h2ixSf9vo
         NV1wakMyyw6IQHQGSmKhBz8r7eUi+h/pcRGG26CSAknKkhaCKpJCCKu7gbkJ6KRiW3aB
         Fl8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2zDlkQN1a7yGCjXCdw7m9YCXn3p8+SMQayQavNHeZPpcI6nhao1cDsSeRlD4TdaXaww853FIvgMvM5f7oUJ4o@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7k0u46xpjG2JTbSYkj3hFqbOnrD8dCQebSQuwRKBXD+W4WILf
	WkfarBtcF2PsLfD47c8IcLFg7u+fd+awnGwVNNXT23tYhzKRWZt2XeA29iAt/zfPtip11VOKGPe
	bhzqPVEe7wjqwEZNSBlGuQB+UEILtbQfhc+XN2JI3b6/NVJJjCNPKugU15HsV0kQwHm8mx7wmSs
	QfvGS0av2UQQ+1xoYGbOumEROvFj8l9xhO0XlQIvyStnp1RR4=
X-Gm-Gg: ASbGncuPl54eg4bdGL6UZKNlYaLPe9tyiLlUeEiSyWTQ2gcfwZCWeFP1Zq6f56hv9n2
	RJ4lAaYWxox1oflvmm5eEDAywzfexS6MuAEYp5KIZYBLF8LaufBv+ZO0jG8yU/mIZkQ8=
X-Received: by 2002:a05:6000:420f:b0:39f:b604:4691 with SMTP id ffacd0b85a97d-3a06cfad4demr3613299f8f.58.1745531840413;
        Thu, 24 Apr 2025 14:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKzKsojxPFQjf2qyPC/jLCrBU0TIGuJgSXSwemHUuTZespuYvxujkus4uQUh01e60jmTuxs45QJiRsX3qQ8A=
X-Received: by 2002:a05:6000:420f:b0:39f:b604:4691 with SMTP id
 ffacd0b85a97d-3a06cfad4demr3613274f8f.58.1745531839898; Thu, 24 Apr 2025
 14:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de> <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
In-Reply-To: <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 24 Apr 2025 23:57:02 +0200
X-Gm-Features: ATxdqUEI0uDThPwtIXkgDnYksB6HJCT6szRwp_ZXnbL9vPXmguxH9v8pzuTDM2Y
Message-ID: <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -RMr2r9yR-RXy5GGhZkQdgFkIJJPme_52RAIbWU0iB4_1745531840
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_145725_134329_EFCF9BB2 
X-CRM114-Status: GOOD (  30.75  )
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

On Thu, Apr 24, 2025 at 5:49=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> > On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Wei=C3=9Fschuh wrote:
> > > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > >
> > > To support multiple PTP clocks, the VDSO data structure needs to be
> > > reworked. All clock specific data will end up in struct vdso_clock an=
d in
> > > struct vdso_time_data there will be array of it. By now, vdso_clock i=
s
> > > simply a define which maps vdso_clock to vdso_time_data.
> > >
> > > Prepare for the rework of these structures by adding struct vdso_cloc=
k
> > > pointer argument to do_hres_timens(), and replace the struct vdso_tim=
e_data
> > > pointer with the new pointer arugment whenever applicable.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de=
>
> > > ---
> > > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > > 1 file changed, 18 insertions(+), 17 deletions(-)
> > >
> >
> > starting with this patch, I'm seeing user-space crashes when using cloc=
k_gettime():
> >   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for =
introduction of struct vdso_clock
> >   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introdu=
ction of struct vdso_clock
> >
> > It appears to be unique to aarch64 with 64k pages, and can be reproduce=
d with
> > LTP clock_gettime03 [1]:
> >   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kernel co=
nfig '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+6=
4k/build/.config'
> >   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
> >   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372=
351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC=
 2025 aarch64
> >   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0=
.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> >   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
> >   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with l=
ibc spec
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 1000=
0ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000=
ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -100=
00ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -1000=
0ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> >   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> >
> > or with:
> > --------------------- 8< ----------------------
> > #define _GNU_SOURCE
> > #include <sched.h>
> > #include <time.h>
> > #include <unistd.h>                                                    =
                                                                           =
                                                                           =
                #include <sys/wait.h>
> >
> > int main(void)
> > {
> >         struct timespec tp;
> >         pid_t child;
> >         int status;
> >
> >         unshare(CLONE_NEWTIME);
> >
> >         child =3D fork();
> >         if (child =3D=3D 0) {
> >                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
> >         }
> >
> >         wait(&status);
> >         return status;
> > }
> >
> > # ./a.out ; echo $?
> > 139
> > --------------------- >8 ----------------------
> >
> > RPMs and configs can be found at Fedora koji, latest build is at [2] (l=
ook for kernel-64k).
>
> Hi Jan,
>
> Thanks for the great error report.
>
> Can you try the following change (on top of v6.15-rc1, should also work w=
ith current master)?
>
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 93ef801a97ef..867ce53cca94 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -85,14 +85,18 @@ static __always_inline
>  int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_=
clock *vcns,
>                    clockid_t clk, struct __kernel_timespec *ts)
>  {
> -       const struct vdso_time_data *vd =3D __arch_get_vdso_u_timens_data=
(vdns);
>         const struct timens_offset *offs =3D &vcns->offset[clk];
> -       const struct vdso_clock *vc =3D vd->clock_data;
> +       const struct vdso_time_data *vd;
> +       const struct vdso_clock *vc;
>         const struct vdso_timestamp *vdso_ts;
>         u64 cycles, ns;
>         u32 seq;
>         s64 sec;
>
> +       vd =3D vdns - (clk =3D=3D CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_=
COARSE);
> +       vd =3D __arch_get_vdso_u_timens_data(vd);
> +       vc =3D vd->clock_data;
> +
>         if (clk !=3D CLOCK_MONOTONIC_RAW)
>                 vc =3D &vc[CS_HRES_COARSE];
>         else
>
>
> I'll do some proper testing tomorrow.

That does seem to work for the 2 reproducers I have.
But why is this change needed? Isn't 'vdns' here equal to 'vdso_u_time_data=
'?

>
>
> Thomas
>
> > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/ker=
nel/syscalls/clock_gettime/clock_gettime03.c
> > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2704401
>


