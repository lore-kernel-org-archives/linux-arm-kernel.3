Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C8CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWMPfD94+i8hgSedUupwy+oBy/L05al+1UgGs2wQG3w=; b=y5bW9YlpdcxKSftCO319yt3ML9
	iXPCMAXT/upd5G8udancyfqaj8NyIkxVvN9zhkHmLXWgSomXux+D4tLpMFAQbthKi0ccOSfRnjFJI
	MH3OhQxGQ7rq/TU0+WTHRc8aKubB+iByn6/vDZjvqGdLkn5Qi/rkL6xXev+H+gPF+VF5bDAoES7rU
	ibxtNbA90uJhZQqT/TpmqoZ7o0yO2kKYFUzZTUmUsmLXZHHM3311Mfw2PKdgBQP+7PF45JofPxTH6
	hc/th81k3gpXVoRHgmha0+HfLn2hzt6brn6+uwsldUL4HdxCrb2ZxbrhZBLfDxztodvBR5ytSPWHM
	CkFdLJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y0L-00000009XWl-3ZZT;
	Tue, 08 Sep 2026 15:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y0I-00000009XUu-05Y3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB551477;
	Tue,  8 Sep 2026 08:44:52 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C3123F7B4;
	Tue,  8 Sep 2026 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882296; bh=GxMGnXYQeONzqdK6e7ly+Ryxj5+TnaiGzWadzF9ASqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LcW3d8Y9EnhgIb3Rlfc88EUwA1NZjt8vavC27AHR9l+iN18v85ITcyWSQsN/UPN4o
	 OLvqyDegHcjXhNJgmbuN3xh1uOIo2IZyl07gOyc3Vx/FuMblFAjLyZXrWSOGkxnxbI
	 JdSzw6d7rWBZnzC8KL9Vxzg9oHG/Ck26o9OgGRrM=
Message-ID: <a2a7d988-339c-45f6-b910-5d7dd893b45c@arm.com>
Date: Tue, 8 Sep 2026 16:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
 <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_084458_192574_C07E4AE9 
X-CRM114-Status: GOOD (  15.59  )
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

Hi Reinette,

On 08/09/2026 16:35, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/7/26 3:44 AM, Ben Horgan wrote:
>> Hi Boris, Reinette,
>>
>> On 04/09/2026 18:36, Borislav Petkov wrote:
>>> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>>>> Lemme have a look.
>>>
>>> Sashiko has comments:
>>>
>>> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
>>>
>>> Please address them: if valid, fix them, if not, explain why they don't need
>>> to be fixed.
>>>
>>> Thx.
>>>
>>
>> Regarding the first Sashiko comment.
>>
>> The documentation change in patch 3 includes the sentence:
>>
>> "
>> The allocated bandwidth percentage is rounded up to the next control step available on the
>> hardware.
>> "
>>
>> Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
>> test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
>> the other.
>>
>> How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:
>>
>> "
>> The allocated bandwidth percentage is rounded up or down to the next control step available on the
>> hardware.
>> "
>>
>> What do you think? Should I respin the series with this alteration?
> The change looks good to me since Intel always rounds up. By itself "rounded" may thus be deceiving.
> One concern is that "next" seems to accompany "round up" to reflect forward/upward movement.
> How about also replacing "next" with "nearest" or "closest"?

Ok, I'll go with "closest".

> 
> I think a respin would be most convenient to ensure the intended changes are made.

Will do.

Thanks,

Ben

> 
> Reinette


