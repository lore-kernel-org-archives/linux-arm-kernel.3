Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5607BD59D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BF5gJ/otAEoZ4clGqcYn+D/DhcYdPlTejIl8apYKJjg=; b=nwYOLyxFvtEudWbZCLwlfahzi8
	bOg5FxTDNCnveqNWCstQ++OHyGWu7Wl4vm/38W3yeVjH/+wwK56PIIjkM7h4DZOBS7jsK26dNuvwc
	EG2QeA/MDvvXIXg88z6Wbg6v0UHS7nKVlm1IHikWVneQmKtJWFNTP5nJodGvkT88V4OnFWV5eYkix
	x4G7NWF+1Z10mXQAyQtJNyfaLQkdGifVz3/9ruTURVwCifyfTGmlr8panFNVl5SYU8l9LfFPVjqXf
	FGThTbcLrBzvWg87IQgttX7WdkZMynZBZlTeyaT2p0J70uPmfEsncZfn25pAIbjXRHOvz9EeAyfFM
	uYRXU4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5RH-00000000m2n-3J42;
	Fri, 12 Dec 2025 15:52:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5RD-00000000m26-1Uxv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:52:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so15438815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765554729; x=1766159529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BF5gJ/otAEoZ4clGqcYn+D/DhcYdPlTejIl8apYKJjg=;
        b=BaibxVWq6KN/w8FrVUN7LH9mcmz6SIei4e/bsFI0kcBpmPZJrN/A/jbYAUE3r8TeLF
         oDfL2/DEJG+H9WiX/zUkUzVCkCWRfrHKpNwnxxIqUOxQXajo8Lyja9S0FnHhbzIf7jv1
         GPJAyWjLgr+YSSQRvYt80i9wkLF+R54s9vxEwViiSqTC5oyGTI1jcqcsIdc6MuI4ZZY4
         kcHWI5tyK/g2z3J9OH9WI9M24Z5CYGjbp772lRtHits5rH81aGcnXM9lWP5zaWLYYhXO
         BEqb2f40a5SUR/u/fOv8AS0PR7ZYmHeehkhqVwRcD29Tr2GG9l1IsrMND4WfMFzwUqru
         pSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554729; x=1766159529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF5gJ/otAEoZ4clGqcYn+D/DhcYdPlTejIl8apYKJjg=;
        b=cp+HOYNmt05Lvky2C4pNkkiXdIOuY4CMYpOTSYU6nqqEutTtReSMLkm1AonPMQvzSV
         wPeg0K6MUoHbVo4egMCmvX6rhA9PDZ9IGxmXY8GFlDYTR0PgucdLeAWnwN60cjzp6ke9
         O9O9yuMdW0L0ByQn/Qt71XDOYQG6SpRd5vjn/dcdrm/CArWCar3WZJd87B8U6FWmmSJA
         ayptwpPUtA7u7qEVhDaBY4l+seSZIxFQ7FFSYZTOUMFSym1HpAb1Le2/g+1erBuY3hvS
         ph7cN2pfb1g8PGoJDURqiQ14tXXhRnp0LFpQmCbrxUraLOJPZqYYBZjWa7Q9/AlfcVZd
         l/4w==
X-Forwarded-Encrypted: i=1; AJvYcCX2fLxNrG6SCUfMqmSRYCeA3jujvoWwCxqugi+PNcwO9kmSH/teWgzOBXInlQdO+UtrxIIa6FGyA+ldicCV4aXG@lists.infradead.org
X-Gm-Message-State: AOJu0YzTvUS6NcLT9/xmZqr2HlJOnjK1AXYe8bsUChtH58WsUvf3n1qu
	KHPVr2sj1vSA7vVMDf5mqok3w3hAn7HN9H6742ZtpJAcfDtn3L9yDth2IEYuOmDdOlA=
X-Gm-Gg: AY/fxX5E6VMkfodKLpWg4ZL8yrCdbGf2b7A7hxeLCQSy5+zL9M3fu3bIUGTVCDV7jy/
	cZmuXZyA2vfPQgNkvgQOvm4zuuqBfUgoXJ++X2f76sUzmi22oUGz8xB72E5ahpEjU/xsYVcy7ix
	c05YCcRvy1yN5I/3mgEUIRsK1CtWp9RcMI8jrbPlXn4UIeuNkvpvbzc725RT4Njtyxr08WMC0c4
	fRjvoBQFqnert4gHaRJEfpctnu/U9WG1dt69Q/sfUiwNV1Bdpvsim/8uK7jLhRIazzoDsaGMNqv
	qD6+BLoCi9yEuBjtLSDYramcK7fB42aIwac5waplSf2K02F2nxjGyu04Ak+BKjt3G/UwN2f9MuJ
	0/tEt3h5KovFCwuzcJu7oMKVEwpKrqgQbRoyd2SNdZnitk1Hk8MXzleHTo4DM1JbQmj13ioHQWv
	riVuXZaLtEn/qmvmz9Xmo2
X-Google-Smtp-Source: AGHT+IFyYqsJru0EerGFYFTMp90A+LMaDZcZ5Gsc9tDkxrzqI6XWJZKohcECOZHdf9TafH96HnDZ4g==
X-Received: by 2002:a05:600c:450b:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-47a8f8c0608mr25573425e9.13.1765554729284;
        Fri, 12 Dec 2025 07:52:09 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85f38sm12766586f8f.28.2025.12.12.07.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 07:52:08 -0800 (PST)
Message-ID: <26b61e11-1dfa-4be1-8d58-06e35fb04d64@linaro.org>
Date: Fri, 12 Dec 2025 17:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
 <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
 <20251210154308.GZ724103@e132581.arm.com>
 <27417fd5-902e-4474-8d60-356a94ac9590@linaro.org>
 <20251212152738.GA181228@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251212152738.GA181228@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_075211_440795_0E6D1725 
X-CRM114-Status: GOOD (  20.52  )
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



On 12/12/2025 17:27, Leo Yan wrote:
> On Fri, Dec 12, 2025 at 04:50:52PM +0200, James Clark wrote:
> 
> [...]
> 
>>> The trace can be stopped on Fill mode (stop on wrap) or Stop on trigger, so
>>> it is not (only) about buffer error.  In these cases, even though the trace
>>> unit is stopped, the buffer may still have space available, tracing can be
>>> directly re-enabled in interrupt handler, thus the COLLISION/PARTIAL flags
>>> are better choices.
>>
>> I suppose this is the bit that I don't understand. If there is space left
>> then why is the stop hit at all?
> 
> For instance, the buffer becomes empty in the middle:
> 
>     +----------------------------+
>     |$$$$$$$|            |$$$$$$$|
>     +----------------------------+
>     ` base  `wptr        `limit
> 
> In this case, the trace unit stops when it reaches the limit.
> Meanwhile, the tool might have already read out the old trace data so
> we will get some free space, thus no need to set TRUNCATED flag.

Hmmm I see, I still think that means that Perf is being too slow and 
disabling the event wouldn't be that bad.

Also isn't there a very small chance to hit this? I'm wondering if you 
ever saw PARTIAL flags in practice?

I think the following all have to be true:

  * 3 out of 4 sections were full on the last interrupt
  * Perf hadn't managed to finish reading even 1 section in that time
  * The last section fills up
  * Perf had managed to finish reading 1 section between the time of
    the previous interrupt and the hard stop

There would have to be quite a high variability in read speed to make 
that possible. Maybe it happens and it's worthwhile optimizing for. The 
comments could explain it better if we do decide to keep it.


