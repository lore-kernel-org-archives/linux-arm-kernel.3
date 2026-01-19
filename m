Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016AFD29C45
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGRyge8mUxn1upWUm4+fpElZBMmBnwRd/xao08TqzY8=; b=AIwucukhd9g3Mmgn93HaLzWCk3
	vyWIp+/sgBLq6Iri8c8vRnZf6wFX9D/dKR1Oz2qtPb6PQhrCV9EHSCtwN46dph4zXC5wCVqgm3Aww
	ioyivWRrUT42ek7enV+AA8ESPczr2bbue4C2yXJT5yRjorfYrziWMAKYrh4zPybqOndCHl0Whv/VM
	TKY1TWmMEDwK71yI3O3E24s+Z5OyAzsyZPdVUiUYoyVvbujN1ev92pDDmLj4KWhNRut5jauXa2H8y
	ab2B39TmOSKFJyebJouht1JSV2pHavZrIvffxN2jXuOCTJ1zi0Dq1pz6OvnF5DWPI9h/wh7X9DDVW
	hhGxKguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsB1-00000002Vi3-273P;
	Mon, 19 Jan 2026 16:32:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsAv-00000002VdB-40hT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:32:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3983503f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768840340; x=1769445140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGRyge8mUxn1upWUm4+fpElZBMmBnwRd/xao08TqzY8=;
        b=BGaXJXFV0G4XFRh7/96prUOFTBXnYchWslrO68EiLg29NsyeF5lMo06rvUI/OCOd6N
         BufLv5X9h7A78LeNF8mP+q88dtPIxibxYP1vzW/18GMNaTyokHHm9FPfFQ2pbhI/p8l5
         ZNF2fAbZHS0EaGQQuJK19k4mTjUYsNJ7EGURbZKTIGG5rjg3PoyqV50+fM5h/OsUYNBK
         iB+iLIJERkt1oY7jeRp6PgnPDspCaZ1XXlb5dWlYYavQgztJE2P22FNqfv+P7NccT/uR
         Gp09FQgpt76gnKlOlzTuJpgMsSgKHZpuBDQ8w7ZbwzClTwFIVHlLYim/SJLitHcFcO2A
         EgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840340; x=1769445140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGRyge8mUxn1upWUm4+fpElZBMmBnwRd/xao08TqzY8=;
        b=a7lBHwZI5NETZhQAuJCWEUMzYPREGnJS9ZU99ILqMZQhj5epSBir90znxv7AVuanf9
         8mtsfsH1ldJy3SQD7PuIzf4694Ugi1eSGs4NBT3lYgDN0CZzRJdP+mkIs4o2JzzUySIv
         EURFcuVHMV+aNLrEPXR5/6wVIiQK1Yn22BNz2FuYWLXzYfkr53JoXjCXBKwgHZSs9+aV
         NE9XZRhOKUKb7Xhea8rrxISjDJPMb6O35iq9a+l7gHsBq/O2LDb84J3DDy39II/2g+Zg
         X2+88+GywgWSqAF5zjlOATZ90R00U81MAL9CopHEPGKIC5kRhiKPCmClUvzuD8BAXuBY
         lMrw==
X-Forwarded-Encrypted: i=1; AJvYcCUZitPx3qSLd4PH+/qemXLKmPjviiVj+TPiZ+oLPKybesAvAaadc6Co+p/Ho87zN1Y63dcKgK9B95b6bTKNT57t@lists.infradead.org
X-Gm-Message-State: AOJu0YyfybjlNH3f+KzJePRU+DHciNKQl32ba3Xd1HBlQzOAvYCvzrND
	58HUQljuQ/YYEaBUvj4J5cgjbeiLpGApVLcjweMKc5yS9Qh64wmnJxFZbwBGqxuLvpU=
X-Gm-Gg: AZuq6aKyGpQbcjFnSoNUzj4Uz+2MvnlHfiHbKrms4iGt8aJTcDiq/gEzwwXI2E5lHVy
	elZ7Uje2rilwm02uMRHMBIHJJbVF93WKP28sIQyaR89yHYMyecB7bpvGwZuw1sKUbgqPHC9ayQi
	eT5f9ayJKt5QaZEVZX45uYfrDIP0QAqLfKf4g0/0PqGXPb16mfQhUE+huIr14uT+bvN1Ur5HouF
	1REMbNCnegI9c0LDBOlxcd90S5jVP7aNpv93c4L/NLHVcHZgOw+9ncAJa0ls3vKM36FFv0DBsNr
	PBhhh2w5hK6NdjBG7ONpfcGqFT3yrq+3bjbPopeISlzvSC+gMQ8eyL+5aFVnN7dCaswSpo/iXLe
	ZMQ8ZeAseiNGZFJ3qTP6sZLedjLGNGWVvLqO+XJHuLjeWBe8FFx84TMXdneI2a0bMVw42IP2qjw
	GwI+Ay2XJp/gJSVq1M
X-Received: by 2002:a05:6000:186b:b0:430:f255:14b3 with SMTP id ffacd0b85a97d-4356a082ecamr13614502f8f.43.1768840339646;
        Mon, 19 Jan 2026 08:32:19 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm23594664f8f.18.2026.01.19.08.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:32:19 -0800 (PST)
Message-ID: <641fad10-e693-43ae-a278-1bf70d56b6d3@linaro.org>
Date: Mon, 19 Jan 2026 16:32:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stm class: Fix Kconfig symbols
To: Leo Yan <leo.yan@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
 <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
 <20260119154606.GE2732125@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260119154606.GE2732125@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083224_598717_C8E488FF 
X-CRM114-Status: GOOD (  19.80  )
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



On 19/01/2026 3:46 pm, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 12:35:23PM +0000, James Clark wrote:
> 
> [...]
> 
>>> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>>>    config STM_PROTO_SYS_T
>>>    	tristate "MIPI SyS-T STM framing protocol driver"
>>> -	default CONFIG_STM
>>> +	default STM
>>
>> The help below here says "If you don't know what this is, say N." which
>> makes me wonder if this should be on by default or not?
> 
> STM_PROTO_BASIC is a must have config when enabling STM.  While
> STM_PROTO_SYS_T is not mandatory, but it is useful to build it so that
> users can select the protocol dynamically at runtime.
> 

Should probably change that text to say "If you don't know what this is, 
say Y" then? Otherwise it makes the default-on look like a mistake.

>> Also everything is in an "if STM" block, so "default STM" is a bit
>> redundant. It's not that obvious what the intention was.
> 
> They are two different things.
> 
> "if STM" expresses a dependency (the module depends on STM), while
> "default STM" means the module will be selected by default if STM is
> enabled.
> 

Yeah they're the same, it was just a minor nit that "if STM, depends on 
STM" seemed redundant (and obviously more error prone). "default y" 
would also be the same and not repeat the same thing twice. Don't think 
it matters too much either way.

> Thanks,
> Leo
> 
> P.s. I also tried using the "select" and "imply" syntax to enable the
> protocol configurations.  Based on testing, I did not observe any
> difference compared to using the "default" syntax.


