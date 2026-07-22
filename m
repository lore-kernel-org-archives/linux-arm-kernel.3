Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3833C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9uOQoYcuC+/A4J3Yh72l0gAD4P1upO+3pVQE+zAmCg=; b=kH65xDFgMzTFTiFms5FAUu3o1t
	2r5LqmR8nrDLHctxxcEJJvcht8J5bRFAOS+13FbWBF8xfL+3cr2pMRxEd1B+ur0mUXup7h7bypHY3
	HNb6jJcCZh3aRQo/h/nFc5Z5Vk1xrcVXeL1Nh7/ZWZKbvNPCHEX2xJGKD5am6LuVZUFUZJAzNzFU8
	HecbwJ/tGNah5dQFqcytsuI8B3n29yJ+5VqLB++lkFeTK8VvxpAWGTHsf3TsJ/+YRZt5HdH2v7GBb
	gKrec9tdnB+tFczE9YxmJOxR3pMH/mIeGN46q2l3FSVC8tFf9XBFH8u2I6ym/sKMCORUWVm02whtd
	bUKZTzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUPt-0000000BaCv-226i;
	Wed, 22 Jul 2026 10:43:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUPq-0000000BaC1-0Pin
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:43:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C85D1595;
	Wed, 22 Jul 2026 03:43:00 -0700 (PDT)
Received: from [10.57.86.212] (unknown [10.57.86.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595953F58B;
	Wed, 22 Jul 2026 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784716984; bh=avX17YujvNShW2/vZDJ2Xhz8U8M9SPol+g9H8Fsfkek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PwdlpcaLICCnQKTjVr/boQjIfDTRYauUxMkoR19UaYRGcUW8z4apZyLX4Nqwx2mUH
	 hkUDfmr9J9z3dp4HkAyBIc/lrLnEoPicvIvaqRNvt813QT4Ct60p74NOMRp3Q5iZHi
	 pDIDMtAzC2uFC1B9nuS41KGOGqw8glxlAuDxB6lo=
Message-ID: <c1cd8fac-9656-4f3f-890f-bcb8f605d0a0@arm.com>
Date: Wed, 22 Jul 2026 11:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on
 Graviton5
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, kernel-team@android.com, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 zeev@amazon.com, blakgeof@amazon.com, avivb@amazon.com,
 ilkka@os.amperecomputing.com
References: <cover.1782824005.git.robin.murphy@arm.com>
 <178466981527.100304.690835278646398901.b4-ty@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <178466981527.100304.690835278646398901.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_034306_192830_199F28BC 
X-CRM114-Status: GOOD (  18.46  )
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

On 2026-07-22 9:23 am, Will Deacon wrote:
> On Tue, 30 Jun 2026 14:01:16 +0100, Robin Murphy wrote:
>> v5: lore.kernel.org/r/20260603150025.30980-1-avivb@amazon.com
>>
>> Hi all,
>>
>> I'm reposting Aviv's series partly for visibility, since the previous
>> versions were buried in a thread, but also to respin patch #1 - Aviv had
>> fixed up the bugs in my initial draft, but I also get reports against the
>> original commit on my branch, so I ended up taking a second look, and
>> deciding the improvement was worthwhile.
>>
>> [...]
> 
> Applied to arm64 (for-next/perf), thanks!
> 
> [1/2] perf/arm-cmn: Move DTM index data out of hw_perf_event
>        https://git.kernel.org/arm64/c/56603c28d916
> [2/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
>        https://git.kernel.org/arm64/c/9d0b1714e1af
> 
> If you get a chance, please can you take a look at Sashiko's comment on
> the second patch? It said something similar on Aviv's v5:
> 
>    https://sashiko.dev/#/patchset/cover.1782824005.git.robin.murphy@arm.com

I did already respond to that back on v3 or so - the code is correct 
compared to what the standard CMN tooling generates. The main DTC always 
has a logical ID of 0, while secondary DTCs inherit the logical ID of 
whatever XP they are attached to (and in this case the main DTC is on XP 
0 anyway so it works out neatly).

Subsequently I did also spend a while trying to make sense of the 
generation scripts themselves, and while I couldn't find any obvious 
proof that the DTC domain numbers (other than 0) will always line up 
with the logical ID order (although there definitely looks to be some 
sorting of things before the XP logical IDs are assigned), apparently 
it's not been an issue for anything anyone's built so far, and if it did 
become one, then it's a problem for arm_cmn_init_dtcs() to solve in general.

Cheers,
Robin.

