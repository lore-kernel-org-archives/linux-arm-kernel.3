Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47831C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPbLR1Y/RGDLT3IFIFuCqTuW/2Jy/AlFcSJHBKSvw54=; b=ulYuEv3/Ns/jjle79HgyF+o0VH
	qnzFf7paLml+gO4siR6S4cy2iknMRFdUlg6STOJGO/uTPDrCyOMkAqK6TI5FOrrDY1/lAPduhahdD
	bgt+70EfVGpiFYEgiZocDUlq7Z9sN6xDNvjPONwuzhMkNtQ4MFLzyTz+Bilqj0wSs+FH5iMdouBNx
	++gXG4yi5EXHwiMDwSHhgEG1um1EeyqaWVHCYDgTd5PjVTtYHebmFz7uJKhD60RomQmdzjYUwve6m
	lgjoqth8jIvyPNOYCYAeEL6TJfYLQ8lIyvy1HfWWFdVVEBuXhBkbxn/qLJjg6CPuHFGa/MtJDl7a7
	Z9lwv37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRk5-00000008FqX-1CFF;
	Wed, 09 Jul 2025 10:09:33 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPn3-00000007t7N-1RVK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:04:31 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250709080423euoutp02a0e0b10616e47b1526745f57bd632760~Qhpz6uTC32489524895euoutp02I
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 08:04:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250709080423euoutp02a0e0b10616e47b1526745f57bd632760~Qhpz6uTC32489524895euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752048263;
	bh=XPbLR1Y/RGDLT3IFIFuCqTuW/2Jy/AlFcSJHBKSvw54=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BejsIL3EWsf1nvFXXKXEDc28c+jKSqRqzVnXTP9ucKRVOC83T+YG3NJGwW6f0y31H
	 sEOQ1TrvM/NSYn1JeF4uK/DDivm8Uh6yUFPp+lWJCgQfNsrmCLeCdcy6r4ceDlSxeQ
	 p7/W5+y4zTJr/nqLxzDGNlvV+N5HtKeTajdw1Ng8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250709080423eucas1p2cda340188c287620d72277f9f667ccb5~QhpzPtyr50478804788eucas1p2O;
	Wed,  9 Jul 2025 08:04:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250709080421eusmtip10fa864a7ea9517a2b891420091998289~QhpyFWvlX2552125521eusmtip1E;
	Wed,  9 Jul 2025 08:04:21 +0000 (GMT)
Message-ID: <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
Date: Wed, 9 Jul 2025 10:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, Anna-Maria
	Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
	<sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
	Cochran <richardcochran@gmail.com>, Christopher Hall
	<christopher.s.hall@intel.com>, Miroslav Lichvar <mlichvar@redhat.com>,
	Werner Abt <werner.abt@meinberg-usa.com>, David Woodhouse
	<dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao
	<namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250709080423eucas1p2cda340188c287620d72277f9f667ccb5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2
X-EPHeader: CA
X-CMS-RootMailID: 20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
	<20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
	<02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
	<CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
	<e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
	<20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010429_950131_631B6D5F 
X-CRM114-Status: GOOD (  21.98  )
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

On 09.07.2025 09:34, Thomas Weißschuh wrote:
> On Tue, Jul 08, 2025 at 05:49:18PM +0200, Marek Szyprowski wrote:
>> On 08.07.2025 17:17, Marek Szyprowski wrote:
>>> On 01.07.2025 10:58, Thomas Weißschuh wrote:
>>>> The internal helpers are effectively using boolean results,
>>>> while pretending to use error numbers.
>>>>
>>>> Switch the return type to bool for more clarity.
>>>>
>>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>> ---
>>>>    lib/vdso/gettimeofday.c | 58
>>>> +++++++++++++++++++++++++------------------------
>>>>    1 file changed, 30 insertions(+), 28 deletions(-)
>>> This patch landed in today's linux-next as commit fcc8e46f768f
>>> ("vdso/gettimeofday: Return bool from clock_gettime() helpers"). In my
>>> tests I found that it causes serious problem with hwclock operation on
>>> some of my ARM 32bit test boards. I observe that calling "hwclock -w
>>> -f /dev/rtc0" never ends on those boards. Disabling vdso support (by
>>> removing ARM architected timer) fixes this issue.
>> I spent some time analyzing the code refactored in this patch and it
>> looks that the following change is missing:
> Thanks for the report and investigation!
>
>> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
>> index c5266532a097..7e79b02839b0 100644
>> --- a/lib/vdso/gettimeofday.c
>> +++ b/lib/vdso/gettimeofday.c
>> @@ -344,7 +344,7 @@ __cvdso_gettimeofday_data(const struct
>> vdso_time_data *vd,
>>           if (likely(tv != NULL)) {
>>                   struct __kernel_timespec ts;
>>
>> -               if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
>> +               if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
>>                           return gettimeofday_fallback(tv, tz);
>>
>>                   tv->tv_sec = ts.tv_sec;
>>
>>
>> In my tests this fixed the hwclock issue on the mentioned boards.
> This fix looks correct to me.
>
>
> tglx:
>
> Are you going to fold the fix into the commit or do you want a proper patch?
>
>
> Marek:
>
> If a new patch is required, do you want to send it? You found and fixed the
> issue after all. If not, I'll take care of it.

If it is possible to fold it into original patch then go ahead, it would 
make less noise imho. If you need a formal patch, I can send it in a few 
minutes.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


