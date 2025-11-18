Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE29CED265
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRe7Y8ocCSJA6puSivlnRO41KrL1icg2QDSVsxKnu1E=; b=1iXYhMKvh40oxxAVOkUokPFTsL
	YDSb/HJSPEMRIg332LArkhiISVF3RrJuOaIlZFn43fkgkSzwGuEeNVjGw+RT9SQgqvZ4MGt1ptr/K
	tIxuSjcYhG/fCAZ60k+2MiKfyRttOiLCZAOV25S0SFyKrbJURJEEj7DaSU+JYpzmbO8hb0ziwcNBm
	jvQozC2jlSIcevprU2iIhEpx7t5SvH6RfWWnpsUqQphtsO6ioAGhwKTU+RyOpjhNMUFvYzBz7dDDC
	TQ5jKBNCK9/cA89O9ATF7MveGuWvm31OcRDDdt6rdYO0o9JOtiB7wzlZuxQHhEI8fQaYAkeI2STCs
	RP0JDDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIsW-00000000Elx-2WA9;
	Tue, 18 Nov 2025 10:24:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIsT-00000000ElG-2ye3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:24:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso20582255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763461439; x=1764066239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRe7Y8ocCSJA6puSivlnRO41KrL1icg2QDSVsxKnu1E=;
        b=zvROjZV4XbaJ9D3BQwr5rQ87Z5FazVpoSmS0Kyp3yc1VFTFrnPMVDdA8JZMnUviAbm
         Q9jVrlzglK20yuUtBIPtdcoiKEwt08lGqQ6MVC6fqLDaaT8dtE9CMCfrsalPhRxw5lYW
         JDtDWxjJnRtcSuMOT5f45Nq7HvEGSCb6QOLikTYC3V71uZB/7LsAjYezj7ysU2z7Rt3v
         /JzLdM2Zu3C1i9TmMH+/+sncp3fdUU5zWI0LUUfqWJ+8f2QTQO5PRytYk9opqmXV60BO
         kYFQ93pLBs/4cOCjgBdNbxNwx6BzSYwOr5E2LUkMEWbq27sAjpY0BywzJo9YYEcVTFjQ
         71tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461439; x=1764066239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRe7Y8ocCSJA6puSivlnRO41KrL1icg2QDSVsxKnu1E=;
        b=FYUJfO+M+eJfaDSP8XVPDKNR4gwbN3M2eibd+QyLJwlSZ9oK3ke7L43Enxdyv8yd4r
         s/7jT7BQVhcFJMhPdCqQuT9TYf6J5THxHUnjenaA2NbGLCGx8LUBGnKUvbzQxUNpmzZL
         vk9t0oiDJuTDoAvWky91vT8mIYfjYM08pdJU8hsapHi7qB1wfgDevh/7suPzJdwIW2Rg
         2r3Kgw9gCP+JcDYSGRF1O590SAN+aXOy+Ie6zqGbiu0tWflfRJgq28KP90QOdcwvN+5q
         DDK4+p+2g8pgq7Z6mKpboR1N8O9kpCvyq8Ux1MUByO0m0F9m0yCs64CBUJ8EApbzG69k
         9PQg==
X-Forwarded-Encrypted: i=1; AJvYcCUugYZJp9EwqhzSJk3rQh/a9MDaWOalZy5zitg2HKd0nlprNDMTIP4hdXXQVdhwPaBXvPp1UU9jehQeGa59epDb@lists.infradead.org
X-Gm-Message-State: AOJu0YzOKcQDx9mfEABGtkYzsrZw49ItgeXhdsFfHJZY2h13il0mfHrb
	2HILnYzohpchGt0nxFkWPESgiLCOMWao5LPt+7ZKf90N7YME9vsngVWt/d6nw50u+yo=
X-Gm-Gg: ASbGncuH8dlsVcOCPSGLkLZyTBWPqJrLlTzgWc9pxv84YYvDJ+SWw9XNC5H9sPXTp8q
	eQ1PKSm2qIMejWGcWknEHy/1tizFGoMt2ysxJtMyAhlGibLkC/pB1hfK3214ChvYVp+V2++uqEo
	a/eo+rBuvSnVRCrbfxfDbtrmhezjhsCEKeTGwsUzalys2e2L/XazBGWy6Ab60lnIP2gZY68EmGE
	dYszym550XgoilP927WMTwHGbmx6D+aa52c4FXM1CO7YyHa0Pc726T3u4afo2mqpScP3c5Yfm9u
	oXXNcueWDvdcgHcqEhwiVFbZa+D7wkpQqwWf1Vm3W26meNmzRx4f83xxGKg1wUKFtq9whl8C7AS
	ATMXtsRGZ7PYWeQTKQ6wuJUlDXoxPbJqPPp6T3DoEnQ4c3Yix7UnraF0l4h0Ypa/AAGTjOjwNYo
	f4HyCBPH8FMjLlbwGG4TrGEb0G/46bUIwql5hOww==
X-Google-Smtp-Source: AGHT+IHByaXCWxWKXsSKTnDrpBen1+oA5DT4UG+T31+rRD84A47jeCA8TubUZjv9qKUynHDVgn28Yg==
X-Received: by 2002:a05:600c:4695:b0:477:7b9a:bb1b with SMTP id 5b1f17b1804b1-4778fea681fmr136415065e9.32.1763461439369;
        Tue, 18 Nov 2025 02:23:59 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm31548043f8f.41.2025.11.18.02.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:23:58 -0800 (PST)
Message-ID: <ed4a5e23-f2f0-4f02-8b0a-e97329cb313f@linaro.org>
Date: Tue, 18 Nov 2025 10:23:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/25] perf arm_spe: Extend operations
To: Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
 <CAP-5=fXiiWRDPzONNNZQZc4QOBQoz=kRnJq77on5r4w9aDx-XA@mail.gmail.com>
 <aRrM2y4O_3aaa2Ee@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aRrM2y4O_3aaa2Ee@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_022401_784301_07E58432 
X-CRM114-Status: GOOD (  15.30  )
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



On 17/11/2025 7:20 am, Namhyung Kim wrote:
> Hello,
> 
> On Thu, Nov 13, 2025 at 09:01:47AM -0800, Ian Rogers wrote:
>> On Wed, Nov 12, 2025 at 10:24 AM Leo Yan <leo.yan@arm.com> wrote:
>>>
>>> This series enhances tooling to support new operations:
>>>
>>>    - Support for MTE tag since Arm SPE v1.3;
>>>    - Support for Advanced SIMD extension and SVE operations;
>>>    - Support memcpy, memset and GCS operations;
>>>    - Support extended operations for atomic, Acquire/Release and
>>>      Exclusive instructions.
>>>    - Enhance the data source for associated info, like floating-point,
>>>      conditional, data processing, etc.
>>>
>>> This series is divided into three parts:
>>>
>>>    Patches 01 ~ 06: Support raw dump for new operations;
>>>    Patches 07 ~ 17: Export the operation info into records, so that the
>>>                     information can be later consumed by samples.
>>>    Patches 18 ~ 25: Set the operation info into sample's data source and
>>>                     SIMD flag, and updated the document.
>>>
>>> This patch series is tested on FVP for native parsing and x86_64 for
>>> cross parsing.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>
>> Reviewed-by: Ian Rogers <irogers@google.com>
> 
> Can I get some comments from ARM folks?  I think I can merge part 1 and
> 2 before changing the kernel interface.
> 
> Thanks,
> Namhyung
> 

Reviewed-by: James Clark <james.clark@linaro.org>



