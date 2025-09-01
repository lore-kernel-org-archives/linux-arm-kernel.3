Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB427CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atfmDciT87We9G92rpl9fIpB9K1Hgs3DJ4wP3oz+nOU=; b=jbrxYTKBIUC5OREZ7hXd3+AV4f
	2dLxyngEM+a3Yew9k2wuVm4bOSYG8TiW5Ha9UyeKFCMzGB+7763BbbEgw1kEnCClOW5vF7JwDzjz1
	uxdPfWjFZODzbghWOudl1PFvm9KhRwMhpxrELIsucVshed1uN+VOEgLPZij9OQpeb9iytfpbnnIdW
	+ysUktoeGc4BQd0K0UvA4yTX27Li6xH3XwAtkZVn5pM8b5QTol8dRAEyMAhh3nwfYSnnDldRGBWNZ
	OPB4KAqxKvc1D6h0ObT54xlxwY0jk91Vz+iU5iTWOIb6ZS5aU1Yl/gsDFN3z5fMaxOFbntiecvR1u
	Az6btdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxk8-0000000BHni-1V3e;
	Mon, 01 Sep 2025 06:10:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxXq-0000000BFlv-22Ti
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:57:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b042ec947e4so74409766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756706253; x=1757311053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atfmDciT87We9G92rpl9fIpB9K1Hgs3DJ4wP3oz+nOU=;
        b=YsooQpIU+SWJFq0y5UHQmgd4fS7hGFSq/Pi7+XHTYX38qpPdupU1xYOecMCOfuQKgR
         /jg/rR9rR3LgPrsP+nnsgcAba+259dL1EkLnmPPF4c2HsYLhiCD7E8louYgao8O+YrXk
         Esi0GD9ocn0p4sFAtnl887enrs6HQZ9K5G0cMOv1lNWl65/PmIXXDU0lBNlW9mj2XfzW
         FFLQ+b7uJnY8Z54USxriIvrV6Yh2G+zbW2qRrs7/2oji3GKWmDJn5VBRkvT4EK7qsaK7
         J9d9ht/spSTKkgEk8JXoh/HpihrCob/1zREeQF1NEgB/tZiLqhTwxU/L6UHn3Y8+IQJO
         YFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756706253; x=1757311053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atfmDciT87We9G92rpl9fIpB9K1Hgs3DJ4wP3oz+nOU=;
        b=lSKxndqhDk07FJ+zroKNo1wfzVXRabSSuMn6Wz0pN19KyDolVDMk1cD+C87KxXqA0Z
         4iAEQUsFtXuqyOIQdwnsScxfw0z/RRmfitGGvCZdzs1wcTLyGj/0gzUL/Z3zv6BAxNqJ
         0rgOxx/kFD4OZgFw+ASDpgTu0xc+hGQLX5hlyzJO8qo6j2gx0rJwMK40pnXI597XCz6o
         NOEefGdeKXhbEm82NA4mtaksPw/r1JLMWPCe7dR0NbsdnM7+bwYdhaP3u5485pliMAT2
         rMfkVYQE3gGchKYWoSzq4fUdFIbm9IAS8PqITBXJEOxTBw0yKNL7WAs1Q9cnFtYrtzEM
         GqqA==
X-Forwarded-Encrypted: i=1; AJvYcCW6/wF14lUjZaVrmri79yDCjy7YlEy4YmACCCrJHEDokHSnBk617dRf51BpNNazjNl6G4eFxBZzyFPhDEm4OtQE@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6qR2Xj3WdU356oPuK8Qi0v/kZL4EO1qy9ZIelbIDua1QsvNc
	dpgM6zVLdfI6KMwjbrLjYkidB947Ba2Ka5mmyN2CY0RpK2WLsqObXgLsSd13ico7SXbhWB71XH0
	TdcDMPnHgi/8/PSgOTvLsow3Hgur6wjY=
X-Gm-Gg: ASbGnct92F8J66bihK+FMfUCV77byFzfrXU44tPcdfrF6TkOh6Mrh2oskzlgxkRO1/I
	eO+g/die828Lszq8ChxROI/8pfXqUc1okp+oCnJVMT9DAh/T1vJIBvmyexXlBsbjHtTKORus/l1
	zxSnuPqWloSDNYiG16shYe7mDR/PHerZC2x4Pkc+m3xwgWCUKVBI72swCZlOrwLxJzKGa0i7ieF
	0I/7hz/jdoZX0djR6Ria7II5z30+/5yKxrevk1cag==
X-Google-Smtp-Source: AGHT+IGs2efo+IOitpvfttlp4QpHm+UdTuzypNYlU+dL3lMMdmTt1AUNYkmBc7Tet2CctEcc+m+cKaKxdPgXex6paWQ=
X-Received: by 2002:a17:907:720f:b0:ad8:9c97:c2e5 with SMTP id
 a640c23a62f3a-b01af2e0b76mr615719166b.0.1756706252682; Sun, 31 Aug 2025
 22:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <871pp14pkr.ffs@tglx> <20250901040538.381976-1-kaiwan.billimoria@gmail.com>
In-Reply-To: <20250901040538.381976-1-kaiwan.billimoria@gmail.com>
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Date: Mon, 1 Sep 2025 11:27:15 +0530
X-Gm-Features: Ac12FXxUPY4QvmXb8GUBOvVPhQCnYWtPBmgGFTiodjw4BbIZhYZ-Q9Y4Lx9pjfk
Message-ID: <CAPDLWs-oikjGMDE1L36UETaN75D6n87E+MLtqRmetHiyhHPA6Q@mail.gmail.com>
Subject: Re:
To: tglx@linutronix.de
Cc: Llillian@star-ark.net, agordeev@linux.ibm.com, akpm@linux-foundation.org, 
	alexander.shishkin@linux.intel.com, anna-maria@linutronix.de, 
	bigeasy@linutronix.de, catalin.marinas@arm.com, chenhuacai@kernel.org, 
	francesco@valla.it, frederic@kernel.org, guoweikang.kernel@gmail.com, 
	jstultz@google.com, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	mingo@kernel.org, pmladek@suse.com, rrangel@chromium.org, sboyd@kernel.org, 
	urezki@gmail.com, v-singh1@ti.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_225734_525271_F64B1A57 
X-CRM114-Status: GOOD (  32.30  )
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

Apologies, subject missing; it's:
time: introduce BOOT_TIME_TRACKER and minimal boot timestamp


On Mon, Sep 1, 2025 at 9:36=E2=80=AFAM Kaiwan N Billimoria
<kaiwan.billimoria@gmail.com> wrote:
>
> > What the heck is BOOT SIG Initiative?
> Very, very briefly: it's an initiative that plans to measure the complete=
 or
> unified boot time, i.e., the time it takes to boot the system completely.=
 This
> includes (or plans to) track the time taken for:
> - Boot from CPU power-on, ROM code execution
> - 1st, 2nd, (and possibly) 3rd stage bootloader(s)
> - Linux kernel upto running the PID 1 process
> - Include time taken for onboard MCUs (and their apps to come up).
>
> The plan is to be able to show the cumulative and individual times taken =
across
> all of these. Then report it via ASCII text and a GUI system (as of now, =
a HTML
> file).
> For anyone interested, here's the PDF of a super presentation on this top=
ic by
> Vishnu P Singh (OP) this August at the OSS EU:
> https://static.sched.com/hosted_files/osseu2025/a2/EOSS_2025_Unified%20Bo=
ot%20Time%20log%20based%20measurement.pdf
> As mentioned by Vishnu, the work is in the very early dev stages.
>
> > -     pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wrap=
s every %lluns\n",
> > -             bits, r, r_unit, res, wrap);
> > +     pr_info("sched_clock: %pS: %u bits at %lu%cHz, resolution %lluns,=
 wraps every %lluns hwcnt: %llu\n",
> > +             read, bits, r, r_unit, res, wrap, read());
> --snip--
> > So let's assume this give you
> >
> > [    0.000008] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps
> >                             every 3579139424256ns hwcnt: 19000000
> >
> > Which means that the counter accumulated 19000000 increments since the
> > hardware was powered up, no?
> I agree with your approach Thomas (tglx)! (eye-roll)... So, following thi=
s
> approach, here's the resulting tiny patch:
>
> From 1e687ab12269f5f129b17eb7e9c3c5c2cec441b7 Mon Sep 17 00:00:00 2001
> From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
> Date: Mon, 1 Sep 2025 09:17:57 +0530
> Subject: [PATCH] [sched-clock] Extend printk to show h/w counter in a
>  parseable manner
>
> Signed-off-by: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
> ---
>  kernel/time/sched_clock.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..e4fe900d6b60 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -236,16 +236,14 @@ sched_clock_register(u64 (*read)(void), int bits, u=
nsigned long rate)
>         /* Calculate the ns resolution of this counter */
>         res =3D cyc_to_ns(1ULL, new_mult, new_shift);
>
> -       pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wrap=
s every %lluns\n",
> -               bits, r, r_unit, res, wrap);
> +       pr_info("sched_clock: %pS: bits=3D%u,freq=3D%lu %cHz,resolution=
=3D%llu ns,wraps every=3D%llu ns,hwcnt=3D%llu\n",
> +                read, bits, r, r_unit, res, wrap, read());
>
>         /* Enable IRQ time accounting if we have a fast enough sched_cloc=
k() */
>         if (irqtime > 0 || (irqtime =3D=3D -1 && rate >=3D 1000000))
>                 enable_sched_clock_irqtime();
>
>         local_irq_restore(flags);
> -
> -       pr_debug("Registered %pS as sched_clock source\n", read);
>  }
>
>  void __init generic_sched_clock_init(void)
> --
> 2.43.0
>
> Of course, this is almost identical to what Thomas has already shown. I'v=
e
> added some formatting to make for easier parsing. A sample output obtaine=
d with
> this code on a patched kernel for the BeaglePlay k3 am625 board:
> [    0.000001] sched_clock: arch_counter_get_cntpct+0x0/0x18: bits=3D58,f=
req=3D200 MHz,resolution=3D5 ns,wraps every=3D4398046511102 ns,hwcnt=3D1409=
443611
>
> This printk format allows us to easily parse it; f.e. to obtain the hwcnt=
 value:
> debian@BeagleBone:~$ dmesg |grep sched_clock |awk -F, '{print $5}'
> hwcnt=3D1409443611
>
> So, just confirming: here 1409443611 divided by 200 MHz gives us 7.047218=
055s
> since boot, and thus the actual timestamp here is that plus 0.000001s yes=
?
> (Over 7s here? yes, it's just that I haven't yet setup U-Boot properly fo=
r uSD
> card boot, thus am manually loading commands in U-Boot to boot up, that's=
 all).
>
> A question (perhaps very stupid): will the hwcnt - the output of the read=
() -
> be guaranteed to be (close to) the number of increments since processor
> power-up (or reset)? Meaning, it's simply a hardware feature and agnostic=
 to
> what code the core was executing (ROM/BL/kernel), yes?
> If so, I guess we can move forward with this approach... Else, or otherwi=
se,
> suggestions are welcome,
>
> Regards,
> Kaiwan.

