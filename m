Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF360E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMeYVXWn4rNsdtLa5RrkjJUCcdAtFa2v3GVS4ivXFT0=; b=DsY6AvttN1SGQ9s8st06LAnLXn
	ZJxacKAtD/LVBJcUiqR6ExnMIs0U/Oga2gMN8XTn8jPOrAgeRTmokrDOeh1xsKKBQNWKJ7pZNQtqd
	+657WUaudWRdyMKG11rtl/E02jiw7C0Tc64SkRRdhGqtcZJrkRCeYAnLwkTdhOGbXnIAF4rh+faA5
	Yv6ueGFftQ0dNHPmBhTkWs17imLb+cLvqzNhAejAHnE2Ax8DVBWcq6uONke09cwjMRUpa/1ALJP+0
	34OsKRWOnU8YssXFTkrWltB/0+lDKmzY7Wt3yObBxIgthhSyKqomGsssMPns8okwad69VHH8jWja2
	HjMshkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4RJ-0000000BQ0W-28uN;
	Thu, 19 Feb 2026 13:51:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4RG-0000000BPzm-3Jib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:51:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4807068eacbso8587985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771509088; x=1772113888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMeYVXWn4rNsdtLa5RrkjJUCcdAtFa2v3GVS4ivXFT0=;
        b=o7iPCsAoguahHg2MY16YrFUwdkzXaz2xjC1iP9sFHe1CpYs/5oOjgYplAo4EQsWcPV
         aEQRHzqxNwzrueXPWTPG12X8HkOlvyoY3sP8Xf08kbTusglDz87vcrDronSokKIHRNSb
         r2aHhsH8eJCwKVaX3sIKZ1SW9fKfYPVHMWO3mluWDhPImOMmZMaDDHSOP96lMORrzfu3
         ZkmL0+ZGFoy9GUNecux3woZFq69ux4YkBKdw6JgRZCgKzt8yfG1EmncN6Nw06COTX+rz
         9/13M5vsmKYzxtET/ClHr/BV9bzqw3k+Li+xITLadylHWxLTmvUEvJ2Zo95vYeO+gwoY
         gXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509088; x=1772113888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMeYVXWn4rNsdtLa5RrkjJUCcdAtFa2v3GVS4ivXFT0=;
        b=nmjLXinyrsoPHjuJEDUIXQjZJU42wvJGKrF0/AUMLcbWwu7qdERanHezE2BFi84/nc
         yUoKmhrsWokMLdVuQhpusAtVB52DzHyZn3gFl3h8KAy3bpDx+spv4NAKc7Lba6STTBRu
         TqJVnlmeK+q8Mq02Rg3uNFif1Dx28fVWme/4u+24vGnYhT2dIltMtnEgJKvqZ6+ga4VA
         fG1Ob8ZBdplfD+2A8dYDcOWgBVkwAAiB504ZTvVZ65Ubm6cX0GErC96w3A6PBCO0X01q
         L05zltWJWUVY97GygDrIdswLhNVtads91MQeUNb+leLJCxCdMd7snXeUnjeVDmiv1aIN
         d/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUjjcP1emIXVmLINUVSLZ2EYik0FYvpKC5544EM2oo8VU1rIK2TUASWftjO7+AiKizBzYHMU45uDapV78MJNAC@lists.infradead.org
X-Gm-Message-State: AOJu0YxziHWVnFo97beNqAGHHeAQ7ctgTjmOMaPpBkurwKbMDubYV767
	p9FWeSkLFhClr4uK9ISBdoVTwnI2J8zkr8DE5wEsWPD/RE9CfTH5c7x06I4WVxiZnag=
X-Gm-Gg: AZuq6aJGTV9zaERxZObR15AgBpXagG5m/bt3Q3Lrs4FUvyoG/IIEpiwip/L6QDk0VbQ
	Kvnr1jCy88xRzpmjGeJi9w4Qxb5F/yQhPgg14hjc7B/UCYBpTZpBxp7aSEJWXNUvU/L15nHnV/k
	7Aw0V/sFv1IdPba8AC5DsTBdsqaNgKppTZcwi4wKzUMw7iTqCz/94cyfCZsn3WNoZgkG21K/T0Y
	5Ybbo0lG7RXhGsV3P/U0UAJ1smmCgtvm1tCR9nkjcDlPFd3MAc5tHeLDKRIBqTC3+uRaI5a+ceB
	a8mkx+suI92o4eo0xKnTEtX74L0xCLkzn8z1Rxw5oIBP29AMcMXOHrXWXCI9QHSUeTWv7vTVhpe
	Y/6kDbDs5nOZlDvy81+ysrXlRe4IFyvTV5LSDNcvmJhbaJJOEyaouK2mm7swJaDJ6TWCNp5b4gf
	TVZ9Z54X1iYJ161Fw1GNL04ZcLj/A/
X-Received: by 2002:a05:600c:35cd:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48398aefd55mr85918085e9.36.1771509088528;
        Thu, 19 Feb 2026 05:51:28 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31d82a8sm5742475e9.15.2026.02.19.05.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:51:27 -0800 (PST)
Message-ID: <7b692e5c-d376-4023-80e0-76c9d9c0604f@linaro.org>
Date: Thu, 19 Feb 2026 13:51:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>
Cc: Michael Williams <Michael.Williams@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
 <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
 <aZcIy1Or4c5-i7Tm@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aZcIy1Or4c5-i7Tm@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_055130_885186_32AADB91 
X-CRM114-Status: GOOD (  21.52  )
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



On 19/02/2026 12:57 pm, Will Deacon wrote:
> On Thu, Feb 19, 2026 at 12:08:27PM +0000, James Clark wrote:
>> I'm back to drag this up again. So I think all of the above discussion
>> relies on the ordering given by the indirect read needed for the "might
>> ignore a direct write..." part. But it's _might_ ignore a direct write, it's
>> possible for an implementation to not do that, so there are two possible
>> implementations:
>>
>> #1 Where there is an indirect read to give the write ignore outcome
>> #2 Where there is no write ignore outcome so it doesn't require an
>>     indirect read
>>
>> For #2 there's nothing to force the ordering. We're writing to two different
>> registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have the
>> PMBLIMITR_EL1 write come second for the buffer to be considered configured
>> correctly. For example if the old value of PMBPTR_EL1 is higher than the new
>> PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens first then it's
>> misconfigured. That's why we think we need the isb() here.
> 
> I thought profiling was disabled in these cases, so why is it
> misconfigured?
> 
> If it is misconfigured, what can go wrong given that we're either stopped
> or pmscr is clear?
> 
> Will

It is stopped in the interrupt handler because PMBSR_EL1.S = 1. But in 
arm_spe_pmu_start(), PMBSR_EL1.S = 0 so it's not stopped. And with 
PMBPTR_EL1 still being set to the value from the last session it could 
be higher than PMBLIMITR_EL1.

PMSCR_EL1 doesn't affect SPEProfilingStopped(), it's only:

   boolean stopped = (PMBSR_EL1.S == '1');

The conditions for when the buffer needs to be configured correctly from 
R24557 are:

   ProfilingBufferEnabled() && !SPEProfilingStopped() &&
     PMBLIMITR_EL1.FM != DISCARD

I think even if PMSCR_EL1 is clear you can still get a buffer management 
error, even if no samples were going to be written into the buffer. It 
just says:

   While the Profiling Buffer is enabled, profiling is not stopped, and
   Discard mode is not enabled, all of the following must be true:

   * The current write pointer must be at least one sample record below
     the write limit pointer.





