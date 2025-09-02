Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF11CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjN6fz1puhwRkO/DsCAgBce7KYAheDsJqQlff5/9as0=; b=PpyGZdQ5vHXBpJOkgBluGGV+9F
	z4+dI01T1Lofmg4pnAyyC5Zsk0nWjgmXIIo42kpfO5FDRP+qABKNLYCF7jpX2ef8gjLTKSfChoLcV
	xaBV6Vop8wTghQ+qn/DLW38eYhCs6EhIgoBg17oPf0fg8lCUqI9Xh8GTcTzX6bkqwMSUzZkkznDXy
	/e/6JfAJzQOwBNy0Gc9GKWhYiHgBZqEhbpTHX1OionfY70z+343baVF6kiBdx7z06gP5crYPKMCzY
	o+KuJQQc+NDXb/12U+53j6C9RT5bqUw7BF4TCN5o6SZsoAcKb+UBmspaUipIkA/0TEjkp6cHW9sw/
	3dCWamww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utL5v-0000000FfJJ-3aGx;
	Tue, 02 Sep 2025 07:06:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utL2z-0000000Fed1-2JiS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:03:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-248df8d82e2so41172445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756796596; x=1757401396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjN6fz1puhwRkO/DsCAgBce7KYAheDsJqQlff5/9as0=;
        b=LimJcCs8hyR9yAJzytW3hJFWopC9eq+H14zLS83aFTFyMTAg6CwbVhsroNvzmXt0DT
         eldGtNenjoPy8hbjXsS1zvdOILdwO/ILBmOFndTBhkzICBLuSBDGiXo++Fov0N/YIk9c
         fGwa7b85HpcPPQD1mQbrCfwH/LajbY2V9YYAvkVd8cCfHFztdlmCSXHPy8DGbGYQodi6
         AmSMqLW6jZZBQKlsUlCzN+wY6unWZpbgs/OXMr4JW1TRwgRukzjqmRy0wZrh6w/EVf9Z
         WMJzR5QGgQNDhdC9Nze11j8z5C+1V/KOMslIh2y6dvM11J7YfMeycP49NjzLaGN1Vw60
         9VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796596; x=1757401396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjN6fz1puhwRkO/DsCAgBce7KYAheDsJqQlff5/9as0=;
        b=LcfN+2ZX93ccCMhyjAlEj7XjJ7rGmxVbzurpgnjeM/6He8+UGNfXPvcy1QjlNGtUZb
         b2wpf5okqxEYSSCdPv5WXLIHKEM4FBPlr5Q7JLONSbcfEqR0Jj0AUtq21Y+rqJWCICMe
         zKEWkGmtIpFt8YscMAbiMw/HLZCatscGILHWB1nvtAO3hAe5j2Mg4vSA9N4of8CEALGq
         jSvy83XEKTGNG6X0E45pkNgq2rlZBdcSGuiFyKZLDO7y/1yQX1IWOvbRgUdhmVwwp7Lz
         GMF5pq6qpgZKdMAT7lwJUEN+i21QqC7enflVR0NGbE5o0jHodGrez3vjNUyXNcsx1e52
         eVxw==
X-Forwarded-Encrypted: i=1; AJvYcCUyzSdCw2ltwzhzGAiCqrOdbxVM8hfrBZvhQfeHhxpsI1uyZW8WnB7w23s/Pr8xpFznxoP6kJwUQ+KdBRyYaF8C@lists.infradead.org
X-Gm-Message-State: AOJu0YyIJOY4LTdvTSDKMU8lQcb2v/JJN/F7gLbAhgMdvIeAqmwhnqxa
	EqByyfehJZ83MI/fHFKpoOFyYKiAhRea8s8qZJTEIM7QqRIEG+0wnJ8J
X-Gm-Gg: ASbGncvTfsBzEUa99ZT5/QeSuaSe+9E3V/tDsaaInemidexkNIhZbCxxuAxHpl2SX7o
	cI/i574UAJPG3jEXW0GY4Srn7SQUSub57Tk2uIoeR4fuTX4TTCMXr1RgzU1QAS5+lmyhnrk6OJ6
	ZiNOOU/vczq8smBQf1+zn0rdZ/AW7ykSQYWO5JWI2Sx9qkali6JEOzDnW1CjdHn3AKtDJr5Ybm0
	NZ5s1WQT0uXxV7sxzD73/kutfgmIqmU3D42xUnCi8Sh3rIJB0DJ9PCOxpdx8EEqsv1EmCv+d2En
	Z6WKdAG2r+mhgeOW8GoqVm93jNdWT1vY+agbHcBBt+A9NpX6JWLGOBkx92b6KeCNgbDMgeNWM8X
	spfD0e52sknD8Fsga8zJC/qoeV3F5lBZ9g4ln11M3Xkfu6KtRUJqMLODdTKXZHlWuncNcSs7qhp
	7cy5sdFeoIsw==
X-Google-Smtp-Source: AGHT+IGWJN+5Nv3M/5bl4i6U+8jbOOzjkDapkuLfiTYn9/7iKshcWpGgJbYsFlVBs7ZMMtWdXG0Rwg==
X-Received: by 2002:a17:903:32d2:b0:249:3ea3:61eb with SMTP id d9443c01a7336-24944870a42mr125000655ad.10.1756796596287;
        Tue, 02 Sep 2025 00:03:16 -0700 (PDT)
Received: from kaiwan-dell-7550.. ([205.254.163.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490375b6d0sm123187085ad.62.2025.09.02.00.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:03:15 -0700 (PDT)
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
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
Date: Tue,  2 Sep 2025 12:32:13 +0530
Message-ID: <20250902070253.936687-1-kaiwan.billimoria@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <871pp14pkr.ffs@tglx>
References: <871pp14pkr.ffs@tglx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_000317_656602_A0BE20FA 
X-CRM114-Status: GOOD (  24.81  )
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

Resending, as the Subject was missing...

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

