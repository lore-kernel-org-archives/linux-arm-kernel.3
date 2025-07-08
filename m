Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10210C83F0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRQojeNIh/c0xVNMyFi0Xa2+y4Z8KdXoOS6org20cU4=; b=Fe/he6JVh1WpM97rRj8qcRFUkQ
	G2CvGplDyXZidBbGV4IOz5s10QDy/3dOG6DQuoAR0VwTI+Av/pXOJVp0m3ka/LHvYfUdaoJ+wYwxC
	quUC5RudD/ypz0ZVBDgCaZmZmpMGqSRerAIrvZq1EDRx+1YrNlm2OEFzZgWZ+fpIesAEnEnPshbuc
	hEKAkT8bTaao7tAAfpE+Kmy/H6v46wZEnjU+7BhNs4E37TbHmnW8XCxXU8s/Xf/fT+4Ub+396d6jl
	AKwZJmwrMZthuBRiQDZ4TPgl0EWGUqVy5fzdZm3pq+45RpM789y0oqEKMUjJHgG4a0JMdAznUXLPx
	ksq1BTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBMB-00000005zm7-3u16;
	Tue, 08 Jul 2025 16:39:48 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAZT-00000005sCF-0c4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:49:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250708154921euoutp0293fb5a3a261fc7734ffa1d7bb73f8827~QUWfj7q9m0998809988euoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 15:49:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250708154921euoutp0293fb5a3a261fc7734ffa1d7bb73f8827~QUWfj7q9m0998809988euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751989761;
	bh=YRQojeNIh/c0xVNMyFi0Xa2+y4Z8KdXoOS6org20cU4=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=TxCY/fXjMSTRUtkeE+3B64GRtRQoj0oYT5vp2iVPT8uzLd70mhnLYLWJKog5/oL8x
	 pQ5+1ihOBzXFYaJEVo6B8406M4K2Oaq3v+sel5G0+6z2Mbjwd/5SG3LTebbJ6G9rx8
	 tRI5InYwfaqgXj+440nF3P2oYYxrQF6gOa1drY8E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2~QUWfJfUIN1114111141eucas1p1G;
	Tue,  8 Jul 2025 15:49:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250708154919eusmtip2ef36a1a3bcb9c35cd5efc533f7040c90~QUWdgPcdj1707117071eusmtip2d;
	Tue,  8 Jul 2025 15:49:19 +0000 (GMT)
Message-ID: <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
Date: Tue, 8 Jul 2025 17:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
	<shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic
	Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen
	Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
	Cochran <richardcochran@gmail.com>, Christopher Hall
	<christopher.s.hall@intel.com>, Miroslav Lichvar <mlichvar@redhat.com>,
	Werner Abt <werner.abt@meinberg-usa.com>, David Woodhouse
	<dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao
	<namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Content-Language: en-US
In-Reply-To: <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2
X-EPHeader: CA
X-CMS-RootMailID: 20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
	<20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
	<02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
	<CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084927_762781_327F9F44 
X-CRM114-Status: GOOD (  23.57  )
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

On 08.07.2025 17:17, Marek Szyprowski wrote:
> On 01.07.2025 10:58, Thomas Weißschuh wrote:
>> The internal helpers are effectively using boolean results,
>> while pretending to use error numbers.
>>
>> Switch the return type to bool for more clarity.
>>
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> ---
>>   lib/vdso/gettimeofday.c | 58 
>> +++++++++++++++++++++++++------------------------
>>   1 file changed, 30 insertions(+), 28 deletions(-)
>
> This patch landed in today's linux-next as commit fcc8e46f768f 
> ("vdso/gettimeofday: Return bool from clock_gettime() helpers"). In my 
> tests I found that it causes serious problem with hwclock operation on 
> some of my ARM 32bit test boards. I observe that calling "hwclock -w 
> -f /dev/rtc0" never ends on those boards. Disabling vdso support (by 
> removing ARM architected timer) fixes this issue.

I spent some time analyzing the code refactored in this patch and it 
looks that the following change is missing:

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index c5266532a097..7e79b02839b0 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -344,7 +344,7 @@ __cvdso_gettimeofday_data(const struct 
vdso_time_data *vd,
         if (likely(tv != NULL)) {
                 struct __kernel_timespec ts;

-               if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+               if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
                         return gettimeofday_fallback(tv, tz);

                 tv->tv_sec = ts.tv_sec;


In my tests this fixed the hwclock issue on the mentioned boards.

>
>> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
>> index 
>> 9b77f23566f6a35887d4c9aaefc61a971131b499..c5266532a097c06f33d12e345c695357d75abf42 
>> 100644
>> --- a/lib/vdso/gettimeofday.c
>> +++ b/lib/vdso/gettimeofday.c
>> @@ -82,8 +82,8 @@ const struct vdso_time_data 
>> *__arch_get_vdso_u_timens_data(const struct vdso_tim
>>   #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
>>     static __always_inline
>> -int do_hres_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> -           clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_hres_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> +            clockid_t clk, struct __kernel_timespec *ts)
>>   {
>>       const struct vdso_time_data *vd = 
>> __arch_get_vdso_u_timens_data(vdns);
>>       const struct timens_offset *offs = &vcns->offset[clk];
>> @@ -103,11 +103,11 @@ int do_hres_timens(const struct vdso_time_data 
>> *vdns, const struct vdso_clock *v
>>           seq = vdso_read_begin(vc);
>>             if (unlikely(!vdso_clocksource_ok(vc)))
>> -            return -1;
>> +            return false;
>>             cycles = __arch_get_hw_counter(vc->clock_mode, vd);
>>           if (unlikely(!vdso_cycles_ok(cycles)))
>> -            return -1;
>> +            return false;
>>           ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
>>           sec = vdso_ts->sec;
>>       } while (unlikely(vdso_read_retry(vc, seq)));
>> @@ -123,7 +123,7 @@ int do_hres_timens(const struct vdso_time_data 
>> *vdns, const struct vdso_clock *v
>>       ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
>>       ts->tv_nsec = ns;
>>   -    return 0;
>> +    return true;
>>   }
>>   #else
>>   static __always_inline
>> @@ -133,16 +133,16 @@ const struct vdso_time_data 
>> *__arch_get_vdso_u_timens_data(const struct vdso_tim
>>   }
>>     static __always_inline
>> -int do_hres_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> -           clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_hres_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> +            clockid_t clk, struct __kernel_timespec *ts)
>>   {
>> -    return -EINVAL;
>> +    return false;
>>   }
>>   #endif
>>     static __always_inline
>> -int do_hres(const struct vdso_time_data *vd, const struct vdso_clock 
>> *vc,
>> -        clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_hres(const struct vdso_time_data *vd, const struct 
>> vdso_clock *vc,
>> +         clockid_t clk, struct __kernel_timespec *ts)
>>   {
>>       const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
>>       u64 cycles, sec, ns;
>> @@ -150,7 +150,7 @@ int do_hres(const struct vdso_time_data *vd, 
>> const struct vdso_clock *vc,
>>         /* Allows to compile the high resolution parts out */
>>       if (!__arch_vdso_hres_capable())
>> -        return -1;
>> +        return false;
>>         do {
>>           /*
>> @@ -173,11 +173,11 @@ int do_hres(const struct vdso_time_data *vd, 
>> const struct vdso_clock *vc,
>>           smp_rmb();
>>             if (unlikely(!vdso_clocksource_ok(vc)))
>> -            return -1;
>> +            return false;
>>             cycles = __arch_get_hw_counter(vc->clock_mode, vd);
>>           if (unlikely(!vdso_cycles_ok(cycles)))
>> -            return -1;
>> +            return false;
>>           ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
>>           sec = vdso_ts->sec;
>>       } while (unlikely(vdso_read_retry(vc, seq)));
>> @@ -189,13 +189,13 @@ int do_hres(const struct vdso_time_data *vd, 
>> const struct vdso_clock *vc,
>>       ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
>>       ts->tv_nsec = ns;
>>   -    return 0;
>> +    return true;
>>   }
>>     #ifdef CONFIG_TIME_NS
>>   static __always_inline
>> -int do_coarse_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> -             clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_coarse_timens(const struct vdso_time_data *vdns, const 
>> struct vdso_clock *vcns,
>> +              clockid_t clk, struct __kernel_timespec *ts)
>>   {
>>       const struct vdso_time_data *vd = 
>> __arch_get_vdso_u_timens_data(vdns);
>>       const struct timens_offset *offs = &vcns->offset[clk];
>> @@ -223,20 +223,20 @@ int do_coarse_timens(const struct 
>> vdso_time_data *vdns, const struct vdso_clock
>>        */
>>       ts->tv_sec = sec + __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
>>       ts->tv_nsec = nsec;
>> -    return 0;
>> +    return true;
>>   }
>>   #else
>>   static __always_inline
>> -int do_coarse_timens(const struct vdso_time_data *vdns, const struct 
>> vdso_clock *vcns,
>> -             clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_coarse_timens(const struct vdso_time_data *vdns, const 
>> struct vdso_clock *vcns,
>> +              clockid_t clk, struct __kernel_timespec *ts)
>>   {
>> -    return -1;
>> +    return false;
>>   }
>>   #endif
>>     static __always_inline
>> -int do_coarse(const struct vdso_time_data *vd, const struct 
>> vdso_clock *vc,
>> -          clockid_t clk, struct __kernel_timespec *ts)
>> +bool do_coarse(const struct vdso_time_data *vd, const struct 
>> vdso_clock *vc,
>> +           clockid_t clk, struct __kernel_timespec *ts)
>>   {
>>       const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
>>       u32 seq;
>> @@ -258,10 +258,10 @@ int do_coarse(const struct vdso_time_data *vd, 
>> const struct vdso_clock *vc,
>>           ts->tv_nsec = vdso_ts->nsec;
>>       } while (unlikely(vdso_read_retry(vc, seq)));
>>   -    return 0;
>> +    return true;
>>   }
>>   -static __always_inline int
>> +static __always_inline bool
>>   __cvdso_clock_gettime_common(const struct vdso_time_data *vd, 
>> clockid_t clock,
>>                    struct __kernel_timespec *ts)
>>   {
>> @@ -270,7 +270,7 @@ __cvdso_clock_gettime_common(const struct 
>> vdso_time_data *vd, clockid_t clock,
>>         /* Check for negative values or invalid clocks */
>>       if (unlikely((u32) clock >= MAX_CLOCKS))
>> -        return -1;
>> +        return false;
>>         /*
>>        * Convert the clockid to a bitmask and use it to check which
>> @@ -284,7 +284,7 @@ __cvdso_clock_gettime_common(const struct 
>> vdso_time_data *vd, clockid_t clock,
>>       else if (msk & VDSO_RAW)
>>           vc = &vc[CS_RAW];
>>       else
>> -        return -1;
>> +        return false;
>>         return do_hres(vd, vc, clock, ts);
>>   }
>> @@ -293,9 +293,11 @@ static __maybe_unused int
>>   __cvdso_clock_gettime_data(const struct vdso_time_data *vd, 
>> clockid_t clock,
>>                  struct __kernel_timespec *ts)
>>   {
>> -    int ret = __cvdso_clock_gettime_common(vd, clock, ts);
>> +    bool ok;
>>   -    if (unlikely(ret))
>> +    ok = __cvdso_clock_gettime_common(vd, clock, ts);
>> +
>> +    if (unlikely(!ok))
>>           return clock_gettime_fallback(clock, ts);
>>       return 0;
>>   }
>>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


