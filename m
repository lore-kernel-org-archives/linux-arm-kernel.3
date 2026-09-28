Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D600CC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlSvak1ZymKa4HkDZecqOMouAzwaOxw4YrsSh//cFbo=; b=UL/+9KmiYowe1v
	UvuFj7cyQXbgQ13fHfZf3bc8M387wvxHE+CK09iEHX5vkiV+NYbMzJPUk1U5Kaznowt9eoy2vHZLv
	6GEugMtrnW5Bgrc49c/Qri+GpQ+Me06Esx+hew1GLayppZu/4Wk9HnJ1wh1ygwKjcszMVs3YVV9NJ
	6XPCWgskxSmj6Smwo9qi5gTv+SF9APOZrX8/Js6/G2F3emJnRrOg13zV02c+b1qqwJBA2gk03Pn48
	wV7K42cwyfsn2WCAgRwE2CgjD++NJ/AXlQvwxH7cqgVNqIxiKtn3NsQThHKGFaKwW+9cil9C2Pam2
	XjQZ/slK7IjJqt3g7dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0WJ-0000000H9Bw-1zvh;
	Mon, 28 Sep 2026 01:51:07 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0WF-0000000H9B3-2rFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:51:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MlSvak1ZymKa4HkDZecqOMouAzwaOxw4YrsSh//cFbo=;
	b=jXAkxBobyGxGl33CFWtPr+m5NrB0PXofrOayv7Y36nOMUwP82QgjZnHk7p82uMAqYOAKKpDKb
	9J5LOKOsR10NLIb15FaMrOgokskOYABGrxpJOAcieGk77xYRr7Gj9MECe4Ui0VSdUVkC2O7bO9A
	oTmpgJFlBvhiZgV2SCcwOI8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4htP8v6cP3z1prN4;
	Mon, 28 Sep 2026 09:38:39 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D84DF4057F;
	Mon, 28 Sep 2026 09:50:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 28 Sep 2026 09:50:48 +0800
Message-ID: <7fe9a0d5-6b82-4ae5-bbdc-f74d797b2e0e@huawei.com>
Date: Mon, 28 Sep 2026 09:50:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
To: Kees Cook <kees@kernel.org>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <202609221129.B5E13A7@keescook>
 <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>
 <202609241703.4AF69048@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202609241703.4AF69048@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_185104_364082_AE695978 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, will@kernel.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/25 8:05, Kees Cook 写道:
> On Thu, Sep 24, 2026 at 05:32:14PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/23 2:29, Kees Cook 写道:
>> I tested the rr test cases on a Kunpeng HIP09 (with minor adaptations,
>> since Kunpeng CPUs aren't supported by default), and the results showed
>> no regressions.
> 
> Great! Thank you for getting that set up.
> 
>>
>> |               |    7.3-rc4 baseline     |   Patched                 |
>>
>> |  ------------ |------------------------ | ------------------------- |
>> |   result      |  87% passed, 190 failed |   88% passed, 186 failed  |
>>
>>
>> | Failure Mode   | 7.3-rc4 baseline |   Patched  |
>> | ------------   | ---------------- | ---------- |
>> | TICK_MISMATCH  |         76       |   74       |
>> | TIMEOUT        |         68       |   65       |
>> | GDB_SCRIPT     |         34       |   37       |
>> | PERF_EVENT_OPEN|         3        |   2        |
>> |   OVERSHOOT    |         1        |   0        |
>> |    OTHER       |         8        |   8        |
>> | -------------- |  --------------- | ---------- |
>> |  Total         |      190         |   186      |
> 
> GDB_SCRIPT failures went up? Are the tests just flaky?

Yes, you are right!

Those three tests failed in the baseline too — they just surfaced as
tick mismatches then and as GDB script timeouts now, so the
bucket boundary shifts with the race. That's flakiness, not a regression.

|     changes         |               testcase              |
|  -----------------  |  ---------------------------------- |
| OVERSHOOT -> TICK   | clone_interruption                  |
| TICK -> GDB_SCRIPT  | checkpoint_prctl_name               |
| TICK -> GDB_SCRIPT  | checkpoint_prctl_name-no-syscallbuf |
| TICK -> GDB_SCRIPT  | clone_interruption-no-syscallbuf    |
| PERF_OPEN -> TIMEOUT| clone_newflags                      |
| PASS ->  TIMEOUT    | pid_ns_shutdown-no-syscallbuf       |
| TIMEOUT -> PASS     | fstatat-no-syscallbuf               |
| TIMEOUT -> PASS     | futex_exit_race                     |
| TIMEOUT -> PASS     | futex_exit_race-no-syscallbuf       |
| TIMEOUT -> PASS     | futex_exit_race_sigsegv             |
| TIMEOUT -> PASS     | futex_exit_race_sigsegv-no-syscallbuf|

> 
>>> - MTE: I didn't see MTE in the cover letter's test list, and it seems
>>>   relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
>>>   ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
>>>   on the reworked exit path. The MTE selftests showed no differences,
>>>   but a third of them don't actually run for me under QEMU, so they'd
>>>   be worth running on your hardware. (Testing MTE under QEMU saw
>>
>> Turns out our arm64 machines don't support MTE; I was testing it on QEMU.
> 
> Ah, dang. I wonder if we can find anyone with MTE hardware to test this.
> Any volunteers? :)
> 
> -Kees
> 

-- 
Best regards,
Jinjie


