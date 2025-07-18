Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02B0C83F3B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 21:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGhXZyOJNCmIt8fGNKAY+r1NcPVJKPwyIQ57/sp4SqQ=; b=2PPE2klVujOdSRO+FcgF42Ey3/
	ud7631H8JHf9F20L/YRFvTrebIWpGSkJVmGAGQq7EpcqwSV9+UCL9KjQtEH0vNvXeNjMHkavJb/6W
	mE/8HrXNkXIK6LMk3p5cv19GSvQ5RXTfg9yVYytMCjDQkMVupF9XmNP6DOgNCnih0dIX/cx+iv4V6
	JlhAtsPMSfqMHdfbiB+Fsw7tGG/uZA8iA6qhnbktgxy8kNJxb+KDL7NAMC2ZRXxfLbQBE9kDeJmbw
	tQpmhevReQBD8FveLfKMi5mPROxctP6EpBfOIDS3vLWqCpCVx5tyduQO1Cfyc07YohdsX6MAWyqVq
	CklRAylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsOR-0000000DScy-1hvA;
	Fri, 18 Jul 2025 21:13:23 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsLk-0000000DSOH-0JJx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 21:10:37 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e28cf0f464so12854765ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752873035; x=1753477835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGhXZyOJNCmIt8fGNKAY+r1NcPVJKPwyIQ57/sp4SqQ=;
        b=IJnxLpn75camCR535fWD/FZENFvRdgkdbltl76N3OvkxsNerMm4+63dHoMDVkuo2o0
         JUhjg7x47LNBiHeAHr66O5Lnr7oizzddMY+loDtPuPmeINUOMMCuSiJlmppSr8IuzfA3
         STUR5qGgKczrL2otjpYnvmFmftDXNDIeTRQdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873035; x=1753477835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGhXZyOJNCmIt8fGNKAY+r1NcPVJKPwyIQ57/sp4SqQ=;
        b=vjEs9UwjNhKbAh6plinTozmyD3Pjrx5IQFcA3hPbaUo3Ls4+O6ScJoZdMZDFg6geWf
         1srNm+qT48J9hyP1Nhl65JaakYhovOdQyj4R4P8kPyBaFYYbidEOfsDMgdW4xmCmCk2r
         ATRNIUBIn46R3euxIJjMy9yuD9o7hulUPnzjSdhUyzT6p/6d94foe2qA0mpeYZgPeA7k
         J3KQNQgmTPquIcLLXZjCTg07BCoTAEQIKw5ynB+aOb1gDpZxhUKV5XJ4fg8X/IB8inZM
         XtB/ycRazrKMhSLtoSB/7x0R5ONYd5ya5xaWsiFv64ov8YjWklOpfieqkZhaKJYH0Vmx
         /T+w==
X-Forwarded-Encrypted: i=1; AJvYcCW48B3TwXzCIsiGV4DmoedE/85Vrfn1mDzbeEx6zeiM4Zai3ZuQys6udbunLVLjnA218WAhrmHrVSOnvkg5ZbqG@lists.infradead.org
X-Gm-Message-State: AOJu0YwIVgsiqFHprJs1o8qyWMFcKprEJ+cOpjgSpIuhjmRlXbC/9CVP
	GKAUpqGLSOoqlpqPeRIzZckaTyaLc7jwpgqsMmK4J1Zc66EzDaM5xxF50oCHEPDpiPs=
X-Gm-Gg: ASbGncvxVLOo3i/rF0fdEB2aYY1y2HLv84YRd8LJCYQ9nO3JV9cX7yrCpOVLEmJLs65
	tRP8XzRt7LgsPl975zkkZ6yKtCAf+0QbYMr0JUWdsLieWXyOtZKZoBaXFSVnUrczTqFOB7FSgtL
	TnDWunx5PrGMmu3DxsO5Ys7dEsySK5rVxVlhnYnhW45prVSLbd7fVgRwO3tf1gMUFwmUOod6vAJ
	jOwonXC+GOZJO4xULNq/dyHrF2mK/WX78yLHP1Fiaz5Qozg5ZmAZQi1ik/9M9ZhZeok4TG9kEv8
	SkOS/DvN0MZY/9PZp+GReV2vaJpWNN8JwDa3VOv7ZhODnmrDT/23NQbIgHHCcZnMc+jQ4SV83Uu
	nO4sqRtYwDiNtXii4djdjLzxd39bSPu4Khw==
X-Google-Smtp-Source: AGHT+IEzr9jrK3MqEFYKMgLIWYTjssE2U6iSeHK3JVv5WiuQYDYPp5VXlS4Rx6IaMtKrDNjdUXWfqA==
X-Received: by 2002:a05:6e02:4506:10b0:3e2:8e44:8240 with SMTP id e9e14a558f8ab-3e28e448353mr59141415ab.11.1752873034702;
        Fri, 18 Jul 2025 14:10:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5084c7bce49sm520209173.28.2025.07.18.14.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 14:10:33 -0700 (PDT)
Message-ID: <c6dca956-d0ea-4c63-a48f-d02f21d38b9d@linuxfoundation.org>
Date: Fri, 18 Jul 2025 15:10:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Shuai Xue <xueshuai@linux.alibaba.com>, brauner@kernel.org,
 shuah@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
 <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
 <0a8d5fdb-28b9-41f5-a601-cf36641bddbf@linux.alibaba.com>
 <821acc51-1429-4625-bae5-daa67bddc7bc@linux.alibaba.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <821acc51-1429-4625-bae5-daa67bddc7bc@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_141036_486038_2E2CEEF0 
X-CRM114-Status: GOOD (  12.63  )
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

On 7/16/25 01:00, Shuai Xue wrote:
> 
> 
> 在 2025/6/19 10:26, Shuai Xue 写道:
>>
>>
>> 在 2025/6/19 05:36, Shuah Khan 写道:
>>> On 6/15/25 23:06, Shuai Xue wrote:
>>>> The pidfd_test fails on the ARM64 platform with the following error:
>>>>
>>>>      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
>>>>
>>>> When exception-trace is enabled, the kernel logs the details:
>>>>
>>>>      #echo 1 > /proc/sys/debug/exception-trace
>>>>      #dmesg | tail -n 20
>>>>      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
>>>>      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
>>>>      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
>>>>      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
>>>>      [48628.713055] pc : 0000000000402100
>>>>      [48628.713056] lr : 0000ffff98288f9c
>>>>      [48628.713056] sp : 0000ffffde49daa8
>>>>      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
>>>>      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>>>>      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
>>>>      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
>>>>      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
>>>>      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>>>>      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
>>>>      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
>>>>      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
>>>>      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
>>>>
>>>> According to ARM ARM D1.3.10.2 SP alignment checking:
>>>>
>>>>> When the SP is used as the base address of a calculation, regardless of
>>>>> any offset applied by the instruction, if bits [3:0] of the SP are not
>>>>> 0b0000, there is a misaligned SP.
>>>>
>>>> To fix it, align the stack with 16 bytes.
>>>>
>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>>> ---
>>>
>>> Assuming this is going through Christian's tree.
>>>
>>> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> Let me know if you would like me to pick it up.
>>>
>>> thanks,
>>> -- Shuah
>>
>> Hi, Shuah
>>
>> Thanks for your review.
>>
>> I send this fix in Mar, but it missed last linux version.
>> I think I need your help to pick it up.
>>
>> Thanks.
>> Shuai
>>
> 
> Hi, Shuah,
> 
> Gentle ping,
> 
> Thanks.
> Shuai
> 

Will, Christian,

Can you take a look at this and let me know if this change looks
good to you both.

I can take this through my tree after your reviews.

thanks,
-- Shuah

