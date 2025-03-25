Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6AFC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OikC43tfGVqcaGJaSFtBGBt98zMmOylB8g82DSjPV3k=; b=LGeKgBbbCoOamdC3Mv1xdHHCGW
	LSAOdHcmkoJOeTss/VQu/wroBpgkkL0GGF3ovlmB8BGZk9xDe8XBk77O3eSAA5vLSb4zAM1D8uTxM
	4OSloCE+LN1XK42u5ca0BiWC63iddkIn2PNOgB/niRPjXiRotMfiXjkb0gwZqkwGKB4qe0SGsfaw8
	loWbQcAIxBmWG0E8VDg6DGEZgTBEmCiXs9yW2iMqlqGXqruXpjqtbkGt6n4kZvTtD7kNrpdsgLT7+
	uBPib98LMPkdGzcuECJDhkh+mAH21JM0jj5f9FchKxxqeSFgoygLTk3zvFFDtGTnAPbw7RmOwwE5d
	4HXgDw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx11m-00000005NJt-2tX7;
	Tue, 25 Mar 2025 09:56:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx103-00000005N3q-0cIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:55:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso6950519a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742896510; x=1743501310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OikC43tfGVqcaGJaSFtBGBt98zMmOylB8g82DSjPV3k=;
        b=jZ9MIjH5iMlxYmaKnpK+5z+4jCuUvdp8zEPxF84AV/oItKe5Q7kP1vZu2RgLkVz2em
         Td2NS34nqT+ME2yO3dt4rXXEHzvJUbL0UVqUF8dikgEdw95UdxyvIFdx/s2+4dEaeS1H
         4gcfmN7XYGotuRvC8gxyLjQsMnJ8mWvUPNbLA3rklgOH7kIL6Dfsro47EkfoVUY12BQs
         jRRSVNIs3Z0vZkNK37ciIzX/A69tgOp6LApX6YDHUOqVv/4G8EaMf7lggVTUYKhLv3AL
         cYtjiWn/dCkrCONvjOhBsZ8kXHBN6i8PqVnpWysBv9MLfLIRSDzcIDMK/JydDSqjoNuE
         dTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742896510; x=1743501310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OikC43tfGVqcaGJaSFtBGBt98zMmOylB8g82DSjPV3k=;
        b=bOwvi89apCeuHm0b/eoM2RHoGQoD5wCcsfxnURMe482rDexzvoh+gIpUxHrD9/RB5R
         EjTdXHgxkA1AsL8Ill5haRHUygntXtG9O/fqt0rvdmfdWbTgJNiqRzE0IqtUwErYVRp9
         UopdSnhNdkcja3Tf5gpQP/2HO8LjKoar3dbJQDDyEuUfy5BVi/514k3zXWLuoBXBeUD5
         4jq0tfj9w0xG8Ol172Wz5voyVZC33rDOVlG6MXyUcko+2t6LP/oQchY3uMRKQPacTxUX
         aLoGzNm0IhQdmyhB+LCNOvtgZk2lQ+6VrtpRMEwC9BuA4lx0Zc+DO5sBnCj8tEjPb+yT
         7mgw==
X-Forwarded-Encrypted: i=1; AJvYcCV+33Utu7yBZMI/2Ze9MOXLhDCTUzPpvu9NYy+OuE+doO6qZ6328ncTifr6ypFp/VU6xOfMDMwq3OTiBIxnn2fr@lists.infradead.org
X-Gm-Message-State: AOJu0YztmUy9JTzSs9DYxv8CMMasHgtsZP5eiEfydbGu4XN8Y+HuNbwb
	6GUPQuuEgHjmT+Xe0Q3Q8a680XrTtnEFxP/hbW1/koSEO+tnz23+Rqs9pepRGHlgnejsRPhEWaM
	xeSjOCI4XxxXBVBnR2kFXtwa1o0c=
X-Gm-Gg: ASbGncudrDOV/Wqhpgy4nrmRDZOtKUsV+q1a1WUWoGYT8OX2zR+0egJ1L2OCdsnimn7
	Q0waVTPYSmFVr+FNfYjU2V9tzIb7GTIFCeIImRnYZL4rnLo0Wbx0vOUphriBODAsORxX+TEynYN
	3KQA0fv8N+R/nJw6p1KYx66AezHOU6UkmZPymq
X-Google-Smtp-Source: AGHT+IGNIEeEUu6SigCoTSpIj9xYEpEWYK8C0NKYzoyZvgcjwlTLD0/P82xVLjttC0KKK2MAJ8X+XpE4+SSRkHydSjY=
X-Received: by 2002:a17:90b:2647:b0:301:c5cb:7b13 with SMTP id
 98e67ed59e1d1-3030fe552f1mr23024928a91.3.1742896509787; Tue, 25 Mar 2025
 02:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNi4rPaPeVWzBve6Toi8hhrxP6GROAGRug7+c3zg1crDeOt7Q@mail.gmail.com>
 <875xk022wu.ffs@tglx>
In-Reply-To: <875xk022wu.ffs@tglx>
From: richard clark <richard.xnu.clark@gmail.com>
Date: Tue, 25 Mar 2025 17:54:58 +0800
X-Gm-Features: AQ5f1JqYEwNRR58lzDarOJKfOrvacm-ZDrKE_UsmaKh3gsTaUsm0aGs3qM00oss
Message-ID: <CAJNi4rPtsUohpXgD28Bi7K4Y0G=ShgNuUmf1L3E4ze7txj_z0w@mail.gmail.com>
Subject: Re: hrtimer precision issue/question??
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, richard clark <richard.xnu.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_025511_189464_4FB4CE61 
X-CRM114-Status: GOOD (  25.79  )
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

Hi tglx, Thanks for the explanation! I tried run 'cyclictest -a 0 -t 1
-m -p99 -r' to use the relative timer instead of absolute, now the
output of the same diff as:
[   63.824382] [ 0- 0]t0=3D63816686720,t1=3D63817689248,d=3D1002 us
[   63.825387] [ 0- 0]t0=3D63817691648,t1=3D63818694144,d=3D1002 us
[   63.825691] [ 4- 7]t0=3D63808939136,t1=3D63818998336,d=3D10059 us
[   63.826392] [ 0- 0]t0=3D63818696544,t1=3D63819699456,d=3D1002 us
[   63.827402] [ 0- 0]t0=3D63819704352,t1=3D63820709120,d=3D1004 us
[   63.828407] [ 0- 0]t0=3D63820712448,t1=3D63821714976,d=3D1002 us
[   63.829413] [ 0- 0]t0=3D63821717536,t1=3D63822720032,d=3D1002 us
[   63.830417] [ 0- 0]t0=3D63822722496,t1=3D63823724928,d=3D1002 us
[   63.831423] [ 0- 0]t0=3D63823727264,t1=3D63824730912,d=3D1003 us
[   63.832429] [ 0- 0]t0=3D63824734176,t1=3D63825736768,d=3D1002 us
[   63.833434] [ 0- 0]t0=3D63825739168,t1=3D63826741568,d=3D1002 us
[   63.834439] [ 0- 0]t0=3D63826743904,t1=3D63827746432,d=3D1002 us
[   63.835445] [ 0- 0]t0=3D63827748832,t1=3D63828752576,d=3D1003 us
[   63.836164] [ 7- 4]t0=3D63819412064,t1=3D63829471328,d=3D10059 us
[   63.836452] [ 0- 0]t0=3D63828755936,t1=3D63829760032,d=3D1004 us

Now I am wondering if the cyclictest will have the same result using
the relative timer instead of absolute, suppose all the other
conditions are the same?
Also the '-a 0' set affinity to cpu0 and only one timer thread with
'-t 1', don't know why some cyclictest migrate(?) to the other cpus
than cpu0, any comments about this...
Thanks!

On Sun, Mar 23, 2025 at 5:04=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Sat, Mar 22 2025 at 11:20, richard clark wrote:
> > With diff below under the 'cyclictest -a 0 -t 1 -m -p99' trigger from
> > the arm64-based linux box, the interval is 1000us and the arch_timer
> > in the system is: arch_timer: cp15 timer(s) running at 31.25MHz
> > (phys).  1tick =3D 32ns for the arch timer, I am not sure if those
> > durations less than 1000us are expected?
>
> With your method of measurement yes. There is a german saying, which
> describes this. It roughly translates to:
>
>    "Who measures a lot, might measure a lot of garbage."
>
> But it accurately describes, what you are measuring here. You do:
>
>     t1 =3D ktime_get();
>     arm_timer(T);
>     schedule();
>     t2 =3D ktime_get();
>
> and then look at t2 - t1. That only tells you how long the task actually
> slept. But that's ignoring the most important information here:
>
>     arm_timer(T);
>
> cyclictest uses:
>
>            clock_nanosleep(clockid, ABSTIME, &T);
>
> and T is maintained in absolute time on a periodic time line.
>
>     T =3D starttime + N * interval;
>
> So the only interesting information here is at which time the task
> returns from schedule(), i.e. you want to look at:
>
>         t2 - T
>
> Why? Because that gives you the latency of the wakeup. That's what
> cyclictest is looking at in user space:
>
>            clock_nanosleep(... &T);
>            clock_gettime(..., &T2);
>            latency =3D T2 - T;
>
> Now what you are looking at is the time at which the cyclictest task
> comes back into the kernel to sleep, which is obviously
>
>            t1 =3D T[N] + latency[N-1] + execution_time;
>
> But the timer is armed for T[N], so your t2 is:
>
>            t2 =3D T[N] + latency[N];
>
> You surely can do the remaining math and map that to the output:
>
> > [  165.555795] [ 0- 0]t0=3D165550399226,t1=3D165551394303,d=3D995 us
> > [  165.556802] [ 0- 0]t0=3D165551398751,t1=3D165552400997,d=3D1002 us
>
> Right?
>
> Thanks,
>
>         tglx

