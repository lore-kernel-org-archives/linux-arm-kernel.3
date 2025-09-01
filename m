Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E959CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhVnddQyo/Wb+5L1xwZUny9QGur8ry8ZcQT+esJ56DQ=; b=i9TtBCWbIPRJNFdeFYtqVGGvOs
	MHW/f1tB+OtLLkr/4+d9vLxA6lVhMAcIZbGvjwYf5xUvr/x8XJGjlSeEkIRuBHKYBHQ/GtUB5e5me
	ool6uoOQQuaU8ubwTihwadDz/cijXhzr3u01EAhEzOxiZ2TUbqsrbWo8GhTvXTtJlHCt/MdG717Pk
	d283o/jKboXiUWwOqsrjvlZyDhJ5i+iDs3ynBnyNh6UEjurmZeCDH1rZhbta1xRvm5ng+mHb/c9pD
	ACj+rkqnxanyVW17+HdpcIfHs+lWdN2PYPtUQcMAlDz3hF62O/r43l2rP8KHWxTstdLP9I8DlmHGo
	YsB3d/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usw5p-0000000B8FJ-2qUy;
	Mon, 01 Sep 2025 04:24:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvnv-0000000B6tK-2qxH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 04:06:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso1658382b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756699562; x=1757304362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhVnddQyo/Wb+5L1xwZUny9QGur8ry8ZcQT+esJ56DQ=;
        b=KOo5DLm5d0DTrWgFImgJRlu6u7YlFu6ujyOAbvi66zeT/MJQrPGJLE5L+PpIMP311Z
         0/xjT0bgwQqIMJ92LsnBJaTUXh4a+8gDVczICu8Gnm0BdBak78BXfG1XobAhnQfZRXLi
         Kye/4aeorXg56M9FKbVM8BD5K0Lmp1hTi7yDswEycyDQ6sMgwc2anZWdEFhL3L4BsGIe
         j9VMCrygFZAHrvXLk7hn03SD/GC6YyAffiC/pfgIQu+nf5bD1f9P4ymPkJVbWNwpP9TW
         GdKUipdGvJL4zTDEKsflb7aPo4snyGLn9pwzklNzec3JpfPg4giDfzVP6xYBXyI2qH7K
         Hw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756699562; x=1757304362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhVnddQyo/Wb+5L1xwZUny9QGur8ry8ZcQT+esJ56DQ=;
        b=Nr8VXaI6MZRyOwhd3ZOQD3Fw2DXzrzFUYZbGbIP1Q8ZUJFNGO5r6lKUhZ+QJZPRaV6
         jPDhJ9mva/sgSC41L1msILdUfkH+XQ+WzHNcZq0rLZwAJI3EhGQOUANNPJxldINxMwxL
         1EaSPwOLgttcjqPJheTF09RekqwlnqD5C3GEgSMxdBFcFr/Xl+Bzvv348fTlnw/Pf6LN
         1ORG2Xfddc7BcD/6F53uLo5kXU7KW/2AmwjEnRcVA2qd4NLKhd7ZkH/apX+XcUt77ZAW
         4TN2y1sjy/9TzzHC+dnu6jclFX2WVTbaZHHxeH1PAli2CDStIZ1nsy9JDoHFtT/qP1v/
         TzHg==
X-Forwarded-Encrypted: i=1; AJvYcCW5pPnkx+eldPVuAHUQR05phcB9DnEzUa4TLk/O4xYlPQEsKzI6dBGcxgwqmVJeldp4ffrB91BomLSNbdnwd87D@lists.infradead.org
X-Gm-Message-State: AOJu0YyryukeKpra0btNy/QI2fKBatFk8JGYSSE+Q4URlO8vltk6la/F
	aCCgX3ZT8f+/Dym9bRYMTKajjaP8aAPNb4mR09X/OImfIPzFex4/Si3pTM/wdHAl
X-Gm-Gg: ASbGncuen/q5PUUtiFdKZbgdJVohmFE0wl10TtSfK1azNMYUUviI2dNuTeveKN0SeKJ
	JSuX65xHMaJkuk4BSj0TOqTFFYbGKPx8fyVe6tRvpRWC/IfEjhvWazYYHxEAXdcaB3uf9yw38R9
	WhEifLCNNjgLBc1aOD7dQ3bUYwnbPsTOq32BqfjZnKgU9HnXXK3ResGXzoV8S3z5ZDqpLMHJI8u
	L5/ER8j7N2wEXfeUgGXPR2/Rrbl4yC+sNBqnPUhhrrv2ff5HYTC3wW3oNMW6gB0NKnOveFCcTTo
	azaT2hN5B/GZdvxpa41BOiDPG3eLkeZw49AP8Sa+G20a36nS1Bo0+cKe8MWFBVgY2WwXPi8xz2O
	nbPBL+jMYVxmmQK208hQ09fAaxERRhx7Wc3jJ91mWTG/qPDUuO+pE98wzYGmwWEqTQpbt0Ue6FN
	s=
X-Google-Smtp-Source: AGHT+IFq2jLk34VvRWtzlZjCL91aTLS83lxLzIiGeGP0F0Y9Bbn2PLy+Kd8ygAaYNricer1Vq0hRBA==
X-Received: by 2002:a05:6a20:a11e:b0:243:b06a:3d5e with SMTP id adf61e73a8af0-243d6dd0204mr7665309637.1.1756699562333;
        Sun, 31 Aug 2025 21:06:02 -0700 (PDT)
Received: from kaiwan-dell-7550.. ([205.254.163.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8cc9091csm68457a12.19.2025.08.31.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 21:06:01 -0700 (PDT)
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
To: tglx@linutronix.de
Cc: Llillian@star-ark.net,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com,
	anna-maria@linutronix.de,
	bigeasy@linutronix.de,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	francesco@valla.it,
	frederic@kernel.org,
	guoweikang.kernel@gmail.com,
	jstultz@google.com,
	kpsingh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@kernel.org,
	pmladek@suse.com,
	rrangel@chromium.org,
	sboyd@kernel.org,
	urezki@gmail.com,
	v-singh1@ti.com,
	will@kernel.org,
	Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Subject: 
Date: Mon,  1 Sep 2025 09:35:25 +0530
Message-ID: <20250901040538.381976-1-kaiwan.billimoria@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <871pp14pkr.ffs@tglx>
References: <871pp14pkr.ffs@tglx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_210603_726591_8BF2E622 
X-CRM114-Status: GOOD (  23.76  )
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

> What the heck is BOOT SIG Initiative?
Very, very briefly: it's an initiative that plans to measure the complete or
unified boot time, i.e., the time it takes to boot the system completely. This
includes (or plans to) track the time taken for:
- Boot from CPU power-on, ROM code execution
- 1st, 2nd, (and possibly) 3rd stage bootloader(s)
- Linux kernel upto running the PID 1 process
- Include time taken for onboard MCUs (and their apps to come up).

The plan is to be able to show the cumulative and individual times taken across
all of these. Then report it via ASCII text and a GUI system (as of now, a HTML
file).
For anyone interested, here's the PDF of a super presentation on this topic by
Vishnu P Singh (OP) this August at the OSS EU:
https://static.sched.com/hosted_files/osseu2025/a2/EOSS_2025_Unified%20Boot%20Time%20log%20based%20measurement.pdf
As mentioned by Vishnu, the work is in the very early dev stages.

> -	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
> -		bits, r, r_unit, res, wrap);
> +	pr_info("sched_clock: %pS: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns hwcnt: %llu\n",
> +		read, bits, r, r_unit, res, wrap, read());
--snip--
> So let's assume this give you
>
> [    0.000008] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps
>                             every 3579139424256ns hwcnt: 19000000
>
> Which means that the counter accumulated 19000000 increments since the
> hardware was powered up, no?
I agree with your approach Thomas (tglx)! (eye-roll)... So, following this
approach, here's the resulting tiny patch:

From 1e687ab12269f5f129b17eb7e9c3c5c2cec441b7 Mon Sep 17 00:00:00 2001
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Date: Mon, 1 Sep 2025 09:17:57 +0530
Subject: [PATCH] [sched-clock] Extend printk to show h/w counter in a
 parseable manner

Signed-off-by: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
---
 kernel/time/sched_clock.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..e4fe900d6b60 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -236,16 +236,14 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 	/* Calculate the ns resolution of this counter */
 	res = cyc_to_ns(1ULL, new_mult, new_shift);

-	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
-		bits, r, r_unit, res, wrap);
+	pr_info("sched_clock: %pS: bits=%u,freq=%lu %cHz,resolution=%llu ns,wraps every=%llu ns,hwcnt=%llu\n",
+                read, bits, r, r_unit, res, wrap, read());

 	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
 	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
 		enable_sched_clock_irqtime();

 	local_irq_restore(flags);
-
-	pr_debug("Registered %pS as sched_clock source\n", read);
 }

 void __init generic_sched_clock_init(void)
--
2.43.0

Of course, this is almost identical to what Thomas has already shown. I've
added some formatting to make for easier parsing. A sample output obtained with
this code on a patched kernel for the BeaglePlay k3 am625 board:
[    0.000001] sched_clock: arch_counter_get_cntpct+0x0/0x18: bits=58,freq=200 MHz,resolution=5 ns,wraps every=4398046511102 ns,hwcnt=1409443611

This printk format allows us to easily parse it; f.e. to obtain the hwcnt value:
debian@BeagleBone:~$ dmesg |grep sched_clock |awk -F, '{print $5}'
hwcnt=1409443611

So, just confirming: here 1409443611 divided by 200 MHz gives us 7.047218055s
since boot, and thus the actual timestamp here is that plus 0.000001s yes?
(Over 7s here? yes, it's just that I haven't yet setup U-Boot properly for uSD
card boot, thus am manually loading commands in U-Boot to boot up, that's all).

A question (perhaps very stupid): will the hwcnt - the output of the read() -
be guaranteed to be (close to) the number of increments since processor
power-up (or reset)? Meaning, it's simply a hardware feature and agnostic to
what code the core was executing (ROM/BL/kernel), yes?
If so, I guess we can move forward with this approach... Else, or otherwise,
suggestions are welcome,

Regards,
Kaiwan.

