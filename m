Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2840BD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kl5uFcJ0GrtpgcNBs+UKKjQLDugjInQyaq10Ea+44qo=; b=sttdio7gsp/HKOyCEvuaR0EHwI
	bWCp/AIo2WW0Bw5S3ojGaApll/fk/KBw0R3lEak8Br3Leqt/cvf+h+qna7qDVKo+Cm+HlGRJ6RVlu
	1MbtCX75UnvCc1FzyNWLtzDPfw1FIEbwqXMNjQeP4lYiW1z/FDl9d6EIlSDIHH3hiyWceBNkx69sP
	GT8zyjOH4W+ZXT4U4/2ff5/iH2og4XJ4v+3RnDkhd4orLckkd1ca0nX+DvYZfyJp92UhlpHsa+QDC
	wNM9v9Pt8eW6nWupzZBbRda9lkY9f4vlRRK6Vj9QkOfoweFk6/W0h5/dZD2rALgOsQmmjaMr/hEYa
	HvY4ir3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnX-0000000Dak3-2ZG0;
	Mon, 22 Dec 2025 10:05:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnU-0000000Daje-2C8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:05:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42e33956e76so1387551f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766397946; x=1767002746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kl5uFcJ0GrtpgcNBs+UKKjQLDugjInQyaq10Ea+44qo=;
        b=I8FimblcdeGtFZtuxBLuTPVa4rPx/d5waz5OuuR824mRty9iHUBA2FMnvrPNXOpCdx
         Ig9iTeZSc5pwYgCF2iE72bkLGn45vW1AqMK+vct2V80xUb0lr4WLF8plT8xYjU5kfu81
         NmE0pHcHR8e62vXjmlvl3IM/tb+vu7mqsoMoqUcPdcdDQM7c7Ah8oJaAh+EDsgN7Usi5
         /2P3JrgH8s8hLJB/RUnd+CiACGNgKzJrjQQqP29bnNTFMTUlFHk+K2MNximsGY9GDwvT
         1NW9IJEL+2Q2qaCazLH6Qs7mn+2N3KUANtoU3fYgNHlp5iLpCpOHPVeTwGBzc+Bep34O
         tUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397946; x=1767002746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kl5uFcJ0GrtpgcNBs+UKKjQLDugjInQyaq10Ea+44qo=;
        b=Y1/35qW52jWaA8FfqQ9Gf9dGmnV7cHWKqwWr437CCb7/GLodPkYuytmoxwsjHVvC4A
         kSBh78PTiuSst/inaEniRejGRLAal7dtOeH6fO07ypZwQpxq+5QYGABGHSx8886njCuS
         N2hM62dgOu+eQ1/pJYi4kVrwTA5FHh73DjlgMRWXfkWrUxHvZ3SpHUYETX8aP65T93zB
         WW8CmINduD0PK+5S6TWvvCodDUz/2aovAlbxEmrr8JOiHokU3uZKDQSOy6bQU1JSKsjH
         DkLBmUoyGHsUpTfqgKCbgktevMNFTyyde3Nojk9eZUBM6qH7u9LPET73kkIVJKxLb2NX
         OH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSUt22Ni6bsRzXRks73K0Gd65JPGnC/RL0kybClaG1DEAf2Xnw5cwnpOM3DZRY6eVF5J5QtC2RmuwsLFoQ8Lj/@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ3CoVaqxTIqJmYtAp7Hp+MXYa1nxXKNbEDh2P2VjxCgqU5+j8
	EwSy/acUT4TLtVd5Ob4MtNyuuHx+bacquRZrykmXUew1TFEEKn7Y58lRShfJ7sJkPdU=
X-Gm-Gg: AY/fxX6W2VhQG+xLvmbSluUStImyFxTLuusi9yirH/YjWJTXFcHiHOkfo+bg4dR6Ax0
	jHpqes8VDHQAOjMAHE1185Hcmk7YBXDva7eK9r11FAsnMLp/yrKJatISzDgRKEFjRPFrNXH3Tin
	1s1MoRrlEbzdAy6TC00piAnSpxa6ICf6B4MoiJ8X0cF5K9RuKH1kCtYFEc1Mzr6BTXYDAhYgI+x
	wJR+qp3vtVVWMBV7swQgyLjEZQzTpWQ3fEYSl4VHLopsylmMcVrY8k0DnQ099rZ3BzxPiQ6WHQi
	5tJYbyBYSdvFm3+6dB0nwvcZ9oQqicdZS2eigflf0LjqSflrf+ILe3wrVnJiqUYWOqhHi5NI6uI
	8ruluwivh7M365xMbAoTz9p+IIh46HfS8bALz5qu/L9ExLKkJrTaJlJTEssZKb9UicZiWedswew
	0wIs5hxd5/vmbY8k58
X-Google-Smtp-Source: AGHT+IF67HpaRIF3/1G6XClevFUfHywcv5txn8AhTLwcPL4utyYwjIWW+2cQLFwZbcn/BkMHwnSGdQ==
X-Received: by 2002:a5d:5888:0:b0:431:307:21f1 with SMTP id ffacd0b85a97d-4324e4c22b3mr11119730f8f.1.1766397945892;
        Mon, 22 Dec 2025 02:05:45 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm20644260f8f.8.2025.12.22.02.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:05:45 -0800 (PST)
Message-ID: <a5448524-a147-4edb-9359-bcee3d780eb6@linaro.org>
Date: Mon, 22 Dec 2025 10:05:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
To: Joel May <joel-linux@jmay.us>, Leo Yan <leo.yan@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ian Rogers <irogers@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <c8161700-ad9d-43d3-8c45-cfc110ebcd49@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c8161700-ad9d-43d3-8c45-cfc110ebcd49@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_020548_658801_8668FE31 
X-CRM114-Status: GOOD (  21.23  )
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



On 21/12/2025 9:48 pm, Joel May wrote:
> On Mon, Dec 15, 2025, at 03:28, Leo Yan wrote:
>> On Mon, Dec 15, 2025 at 12:52:24PM +0200, James Clark wrote:
>>> On 15/12/2025 11:33, Arnd Bergmann wrote:
>>>> On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
>>>>> On 15/12/2025 00:12, Joel May wrote:
>>>>>
>>>>> Hi Joel,
>>>>>
>>>>> There is a similar fix on the list here:
>>>>>
>>>>> https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/
>>>>>
>>>>> I'm not sure if commit 1 alone will also fix your issue, or we'd need to
>>>>> collapse both of the commits in that set.
>>
>> We need to apply both patches in the share link - we need to apply the
>> second patch to revert generating unistd_64.h in libperf.
> 
> Yes, applying both of those patches will mitigate my problem.
> 
> Neither of those patches update syscalltbl in
> arm/arm64/kernel/Makefile.syscalls though.  Based on the context in
> scripts/Makefile.asm-headers, it looks like syscalltbl is always intended
> to be relative to srctree.  So, my patch increases consistency, even if
> it's not fixing any known problem (after the other patches are applied).
> 
> Whether headers are dynamically generated or not, it seems like this is
> something that can be improved anyway.
> 
> This is my first time contributing to the Linux kernel, so please bare with
> my ignorance.  I don't know whether it's acceptable to consider patches
> that conceptually improve something without an actual problem they're
> solving.
> 

No worries, thanks for sending the fix. Yes I think it could be ok to 
apply your patch anyway. I just wanted to make sure we were all on the 
same page with both fixes fixing the same thing.

You might want to drop the fixes tag though to avoid confusion if Leo's 
one gets accepted, because then technically it doesn't fix anything any 
more. Keeping Leo's fixes: tag is a bit better because it fixes 
additional things and targets an older commit.

James

> Thanks,
> --Joel




