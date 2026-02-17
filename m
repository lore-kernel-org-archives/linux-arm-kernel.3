Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B03FE909A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0qm6wSg3YMFqBYaKKYJQYHdgXgOxUBgkA3dGoL/vl0=; b=B9Eu9F05RvQkhv1BeM2nKZhSB1
	K02+Vkqz40zwGxYwSlsY1BIwHo9rFarv93J4OqLAfwxOMJ0nodCO4pmVBaUNco3XC7TG3ym1kcO5C
	NcfmXpQ+XG3AhqlFqKFEKMVb6/048j/NeAItbUfym9GywlebSMpo5VWf1cdD5OsBKKH0WYVLCW2ri
	paC4U4nj7/htGwXI/c81y8fAQU+MzG9UD0uaKDWzLtiJyqL5LsAibHOWMVUhYTbkgVn1MehNDpkXE
	RV3zXE6/zOWi7y3wYph56e8u0uKeOS9619y2H1SwfUF1CXMtl2aP6HgbioUHyUtZXFItcfl1Ylv40
	hnIfLcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLbV-00000008Npv-3gse;
	Tue, 17 Feb 2026 13:59:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLbT-00000008Np5-1W3L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:59:04 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8f992167dcso521475766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771336741; x=1771941541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0qm6wSg3YMFqBYaKKYJQYHdgXgOxUBgkA3dGoL/vl0=;
        b=YSzNii7uy8Dr6rqOMRWHws7KeklkPpqLGCbFXBItf+Lj3VTUk3n/sw6zdoGZJP50Fx
         kTAJFZF4Fr+IYjKpd8hHEcMMKzquCnyqrFCqb0tKN5vnvH8e9f1KgmffvPNKjMh9hHGc
         XBzBv11FyAvNJecMui1+HYYHIVD81bQBW+qqbRAva7B+Bb4+SnMqoUbVgH8SV43tps+b
         e/FeiF7toLSBbv11O5cZzKr1/BlkMakIjSJQ84jXj3CW9/tPJWjWP9mhAKr4/Al0/lVq
         xACKoqNLD/NdTvk5PGceKwuzNPRRC4SeydJDBhC/nDwVncX4+cfX6kgBGgNclofdWR8y
         tqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771336741; x=1771941541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0qm6wSg3YMFqBYaKKYJQYHdgXgOxUBgkA3dGoL/vl0=;
        b=DzGyPbAL7aXjYaajyAxzhDGH/KH1fE2KnsOBiV8UMEkVEWGfhh3NB/wnkALO52gn0Y
         dYxlADU2zf+dkW2YVbRUZXKJl9jZoDgyoPhHk1AHBUHUn600KZj85qSxcC5rCAMLxZpz
         jMcb2ii9O+tCtvoRJvhns2WEkHXgXBhk7ysHmZbj8wUXflfiEONdwFGQ/wsd8YAXqCXt
         n41+//h5stMpAc0AKQeDZSetX6uvc/AolTY/3spgXYvSO1C1dmiSq0CCEzb4T1L6jW14
         I6cRoOnaXvXGj7jkm9T2Y9T9cjdGfyvMVIVQoVygMDntGjZnSwUQwl3LXPIFsEbSvZt1
         osGg==
X-Forwarded-Encrypted: i=1; AJvYcCULbVY3HkQRoweZrq0UqpeiACAz7ARkj0cAlzj1zpkYSoWGcfgt1A2zGfdI507YjR2KgHzCUFJAwokTzsjg5iRc@lists.infradead.org
X-Gm-Message-State: AOJu0YzhEk7PllS7vB2WO7S4Q2eI8Eteb93UrMI1Mw0zA/wL5L80QpWV
	gVEwkfjWfh+ayAjYbdmcEy7X9J1JJEmykSD95bdnz+M7r2py7iWIasS1NqAn8wyCfU8=
X-Gm-Gg: AZuq6aLF7a+qJrix9eZjHJO/YudcqjNnRUs3ZOmUCqRrBrKolQgB9KDnvFX9rLusl0y
	DiDpdki4vsQVc6u5yC346dH5bhwkUmcnwOivueO7e6OLztgPY3WxO/tdCKATtmISFEAeLChsyMu
	Vfwrfu7J7xp9rRMHGKM1JIzV2HF/6LmNCL+b9Xw/a7hGOc8b1d0INIk4Kx33gwTM/vLUJ3LD0N9
	EEcatFYboh10eWbGJEHXItCrpVTsUnKhu22hI0QZjHFwG1/rt/LITEdvuMXuz8LErMl4LBw+N6D
	0oCf0410WaaB3+yGbCgkvuz77rallIWAemH7L2XkxsnJZouE4XAnNDgFj/MzJjgodkECxNWAAoK
	oVpq5DHdRL0QBW+JIxrtnU7vngdGFVGUPjpwhayBkOyhob1VbGCWGaWtN0geiU7WIOkeXUxJRyJ
	DOU9ZFg5+/LMKZXWH06zCdkITU50WP
X-Received: by 2002:a17:906:4795:b0:b8e:12f9:5fce with SMTP id a640c23a62f3a-b8fb4574ebamr726740266b.61.1771336741232;
        Tue, 17 Feb 2026 05:59:01 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385e60sm350983766b.19.2026.02.17.05.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:59:00 -0800 (PST)
Message-ID: <b4421029-54ca-41e0-8055-56f9f525170d@linaro.org>
Date: Tue, 17 Feb 2026 13:58:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 Oliver Upton <oupton@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Fuad Tabba <tabba@google.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org> <aZNUqONyOUVd0opW@willie-the-truck>
 <cda4e111-29cc-481c-aee2-811f4178f54b@linaro.org>
 <aZReWRme4InoSa8M@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aZReWRme4InoSa8M@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055903_434877_DBDF5380 
X-CRM114-Status: GOOD (  16.52  )
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



On 17/02/2026 12:26 pm, Will Deacon wrote:
> On Tue, Feb 17, 2026 at 12:20:14PM +0000, James Clark wrote:
>> On 16/02/2026 5:32 pm, Will Deacon wrote:
>>> On Mon, Feb 16, 2026 at 02:29:31PM +0000, Marc Zyngier wrote:
>>>> And even then, I'm tempted to simply get rid of any sort of
>>>> guest-only tracing, given that TRBE is not capable of representing
>>>> exceptions that are synthesised by the host, making it the resulting
>>>> traces useless.
>>>
>>> I think that effectively means reverting the series merged from here:
>>>
>>> https://lore.kernel.org/all/20250106142446.628923-1-james.clark@linaro.org/
>>>
>>> but then we still need to clear TRBLIMITR_EL1.E.
>>>
>>
>> Removing that series would actually have the effect of turning guest trace
>> on in nVHE for non-TRBE sinks. The reason for implementing the filtering was
>> to turn guest trace off because a user didn't want to see it.
> 
> What I meant was, revert that series and then also ensure that both TRFCR
> and TRBLIMITR are always zero while running in the guest. Is that not
> sufficient?
> 
> Will

Yes that would work. Although if someone is currently tracing guests 
from the host then obviously that will break that. I'm still not 
convinced that tracing guests from the host is broken enough to be 
completely useless. But there is a chance nobody is doing it, or waiting 
for them to scream might help in understanding their use case.

It doesn't seem like the combination of the TRFCR filtering stuff and 
zeroing TRBLIMITR is too messy either though. I suppose you could also 
skip the TRFCR switch if you've disabled TRBE if you wanted to save a 
register write, but that makes it slightly more complicated.


