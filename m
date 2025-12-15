Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8055D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB+RBJ6RX6T3WRpIftetkYqL3dVBw+OmqN032iLl9fI=; b=PgRL2JM+16tleJIhHNEDdsJLjP
	jL0R60C22c1Glqltts3OqJaSMsKSa0zSk/368d/EXUsDDLbSUGx9rLa3ovVnb8zhF7RWKv+s+XU4x
	T1kLbEDoDS4aYp8nToM2AEMYXAAEULDjb9Ret/gz19+B+9EwlehvO+jeVDt8jOE8iq2amd0TOHA/r
	6kCZSSUZZCOCwsz/ZmIc/FhSs8HACr47M/5++QvvvVL2cUj9XzCBOmZU64UhhUBBZtK6y9QByzBsQ
	YQvynQB+0iqNsgWl6OL2jfEAUjO78luzSdOY+RnEBGdlcGNOJKR/fPLbzuOj6R00pcoqlIlSkANxD
	TMi0mLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Bm-00000003U0R-2zwa;
	Mon, 15 Dec 2025 10:52:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Bj-00000003Tzo-3XKg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:52:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-430ff148844so266127f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 02:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765795942; x=1766400742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nB+RBJ6RX6T3WRpIftetkYqL3dVBw+OmqN032iLl9fI=;
        b=PiLZvyHwkF6l+GjgUIR4RjDaFYuoa+PzSLFcIi+2k24En5jnqroSkCkTlmt5B/udKd
         iVG2PwIi96buzW/NCwqYLJcRzEaWHeXDeaftnMJWu2qI6KV8iMcj+/gipXECLmL3OJVJ
         Ha6kMoPfvaBGRGEPVdi2v3zME3ItHJ8Pki0XxZ1SqorPoAV+HmxucPlw+4BZhu3oBDs1
         BOP1oe0DRDekYuWL/FqN30Sx5gmoFfbdJUeQQK3WMugtAgFPR6qcQThASb4XBbrYtlqU
         H5tStr6p6Nz/ha8Stb3Dy9RC445SYmhtywccIhg8dDrgbFeTg1ZYYRDdkOMQJJnHFK+8
         1JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795942; x=1766400742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+RBJ6RX6T3WRpIftetkYqL3dVBw+OmqN032iLl9fI=;
        b=Axsk6XxHz+1xCf2F52Ai1P1tgEq9+iSo76NA8kdLWSlsELkTBa7c9wbZtsmNHuFXbu
         XhTRbceU0lnfhxg4Hl+W6IFgAkfOnsREBuFUEZBRNaahPSkcbO5gtEVXEwGDSMg8FLTk
         1aPBRMjm26hAab4J7mZ0/i14H9WAkvQi0LNG+bPooPuFneoMoj5cKP+bCUqZ9sEMPKFo
         EQ55OXY6EpaBCUIexNvU08phUBlW8L1kcUWwEXB7tzD2/Fu0iBRVhHuIjD4fhAZcjLT3
         WedIvw5A7SO+4l8wBX7syDIHxL8xYwkTcIJsuOfkiTmDlAybrPG0bdgd92ecWmYrwoTQ
         nidA==
X-Gm-Message-State: AOJu0YwW6l6Tp+Q33JAJlMqKvuO+TqJ7TRNRbmfSupQGuSXCEUH6JcEK
	2x3bHMvPigArh6/PxSwzXxUD7iNETrGTeLIMR6tE0TFtbEphru3cWJxh3KSyF1uV510=
X-Gm-Gg: AY/fxX4oDjnHd2+JBeILX4+yaJVb/Klxq8kt5/FIstZgrSQjbGIIZ7TUSG76oz126Mu
	/s2tudRkUrvZaSXLIebN82UQu2POzBDS12M5cYkAVL2aoXtvgX2agleAsvM8YdsHcPAwwle9CoL
	2Ve2S2jeXlA2EhDtDo2lOdrwmfHkc8iCTENuu8MBT6CccwdQQHm9RDz/2PWvO5/cT4kt+TP0vj1
	w4HBuglFKFrdPP4dULHgKyoDCJZTey/ObmQp/znNBUmoBgv6U/A3dLtp8xXzuF+IM80LMpIn/Vc
	dunKyOqUE76Mlp64oc17Xs7LtNAUS1AiQkfM7+o+hwL1Pv/wEhBEIfhNNknU/ZWQXIw8V0xbrCg
	efWLGwVqPip15LzNWM1CNMadcFL0AVNGp6yY6yW3Qq9A75S5a3IRmgct2NzQPr4lFEv+J4kI3e1
	zXYYHOl1l4yQ77pknVKVL3
X-Google-Smtp-Source: AGHT+IHIejLZ8yFwsZwEEzCINtAT3WHk822OpusGi4A5ihMbhmK9XmClAvJ/IZaC+/ow4gbl8lRFxw==
X-Received: by 2002:a05:6000:2410:b0:42b:2eb3:c92a with SMTP id ffacd0b85a97d-42fb3e65c54mr12756034f8f.12.1765795941787;
        Mon, 15 Dec 2025 02:52:21 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fbab2d3b6sm18412955f8f.23.2025.12.15.02.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 02:52:21 -0800 (PST)
Message-ID: <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
Date: Mon, 15 Dec 2025 12:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
To: Arnd Bergmann <arnd@arndb.de>, Joel May <joel-linux@jmay.us>,
 Leo Yan <leo.yan@arm.com>, Ian Rogers <irogers@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025223_911198_CA73731F 
X-CRM114-Status: GOOD (  22.86  )
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



On 15/12/2025 11:33, Arnd Bergmann wrote:
> On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
>> On 15/12/2025 00:12, Joel May wrote:
>>
>> Hi Joel,
>>
>> There is a similar fix on the list here:
>>
>> https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/
>>
>> I'm not sure if commit 1 alone will also fix your issue, or we'd need to
>> collapse both of the commits in that set.
>>
>> The first commit has an older fixes: tag and also fixes some other
>> issues so it might be better to take that one rather than this one.
> 
> I don't understand that other "fix", doesn't that just work around
> the arm64 build issue by adding another special case for arm64?
> 
> If we want the tools directory to have a copy of the generated unistd.h
> files instead of generating them, it should at the minimum be done
> the same across all architectures.
> 
>      Arnd

I don't think it's a special case, the other architectures already have 
a copy of their syscall headers in tools/ don't they?

My original commit that is reverted by Leo's patches is more of a "fix" 
than his fix. It turned out that running the generator script for the 
Perf build wasn't the best idea after all. Now it's obvious that we'd 
have to keep injecting that build rule into every tool that needs it. 
And it doesn't even respect this rule described here that tools headers 
should be decoupled from the kernel sources:

  linux/tools/include/uapi/README

I don't see the benefit of manually copying over the generator script 
and its input file and then updating every build rule to invoke it when 
we can manually copy over the output of that script and not have to do 
anything else.

Ian makes the point that we can run the generator for doing 
check_headers.sh. But at least that only needs to be done for one tool 
and can be in addition to the manual copy.

James


