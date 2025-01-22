Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F75CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSBAii7BK2gaCNHWIIUjjrclWZDFTKQN8taZzBleOGc=; b=AgRpDBgMT/uFY/9nemvMId87Ci
	0Yh/wcOgpY2yDdXkAr/K+5haVR1YQSFGMK/OQIOxHLWzziReILCBPaFs++kuWXiPJJ/1mdm8DBcxS
	hcRtIUyIP+rLFEl51emO88lZyYHRMtWpZs3eVMp0zxSNZaZFEy2WS7/adtEI65ikExZYgFBCAtw3B
	PCeM4XehZIzGCPBAW3eeV/ERnlM4BcJygtAQ3esk2GY7HOK/5LQxHiU2ACrZPGlZl3M9X5v8krlXD
	wGC2L0x27U0sK01lo/aWo1gbScDhYP9yUX4m6klR8H8OvKafUJlgJu0Q8fSSr9EM9BU2iUzq2/jcQ
	VhiqPDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taduI-0000000Al8V-0T7t;
	Wed, 22 Jan 2025 16:48:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadsz-0000000Al03-3Ptc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 16:47:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso50139525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737564444; x=1738169244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSBAii7BK2gaCNHWIIUjjrclWZDFTKQN8taZzBleOGc=;
        b=kacJ2B1ZQXdldruDscnvYtfbw1XK3UQa8dG6uxH7WORnZBptRzNKwSeO3xLRFIXNzt
         NqKqxcQ00FoHKR5D9SVk9tion+2a90xLo6FBp+d23Rk6UHCRxvF6GDsGpT4InxqI8aJj
         vQLactRMhevzizCL0e4dPQPyOoeIrWtEmHPgQWEP9zo1KEV30Tpyd4/PQd8tERPMytpR
         ZIcEi+42wzyQeGRMwdkvqZcOICX1D3zCgrPuaAQdbr5vzuiEPA8JUrcYsR/kt/d8xAnd
         3kasGnC38h6XLyq/dK0WXh19EhT2ZwIOdr3vsRFofDfTv0hz6t1wmdu8uU7UzQdM2RbS
         BMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564444; x=1738169244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSBAii7BK2gaCNHWIIUjjrclWZDFTKQN8taZzBleOGc=;
        b=fXWym7anHS8LMG1og2/gNqgt9ziyqjYYMzg84R0b3s/32VUbMf7MC8zzmuTsDYO1eF
         C6nVYBxOJPpP9z7glaCq0XJ6kFkngmU7u/i4TaL0vt/T8Xqu8TbmKHtemJjxVAK2e0nK
         PjXHU3YWuLWmU9ZuVHokPTEcj4gkLKy7iYfhxxeVycw5uzKFbsSVhnqupFHBjtuagkUQ
         Wo+X09n0dCVpeHGYnRxD5YJjLHpeyeQ3go83+rSmROKKN7MDeD8bgSU3zvj+CS/OVZVN
         6iC7RKk3u7QNJ/QicVXgTHCv9rcXlBAY4lggQ3S3sLdvEsy9f9xWFQVG3S1MgJajcPTe
         mWNg==
X-Forwarded-Encrypted: i=1; AJvYcCXpqiiLydm392owRUJwjW+bCRLIKkVqO2xXXygfLuyJj+m4CV+pQRzyJjFXS6PksuZcy7ThXmZG0fQwARl8/TMO@lists.infradead.org
X-Gm-Message-State: AOJu0YwQX5tvVnkxuNQCjId/36YjRBQmADXOQDJFlyzv/M74iBcVfMWz
	pXno7LzAAjVDNpanL8gcTQaGwbNrg3BwLrQ8tQFiaAsAH8j7XF6UGbi7RCNaaz0=
X-Gm-Gg: ASbGncvmZEkLpk7CgSp8awmj3PIeLuXFYMnCVJXvZdh+Nu7wqjMmlJk17iBt/sAl9jx
	5id7alV3/EVGbxAfAD6x8EOPj5UIjXA3gCIVCSb1PjRn36Pv/iN8+gAfV+S5Loc27ZrDfa1GbEg
	/sG1J7SW+Kl5aiI9cPJ2XF2QwMym+mLFaYhG3CskNViRq7UT2AZguZeoGP8VETuTcBlGjkrjxgT
	+n4QzixozOUmYXa/U22NyYLmBmMoMn228A4HZkFioxFUmA1/oVJU4SMnKb/L3khnFR/+htRZLZn
	Rb1c
X-Google-Smtp-Source: AGHT+IH0bumv8/ep45dsbyJ3w/bgIbCNbZvWl8ImNKDmIS37q2b3Bybg40Q9enSZb2jM4zdqkXOTng==
X-Received: by 2002:a05:6000:156c:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38bf57ce963mr21812975f8f.54.1737564444187;
        Wed, 22 Jan 2025 08:47:24 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf328864esm17087269f8f.99.2025.01.22.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:47:23 -0800 (PST)
Message-ID: <ca8de228-68c2-4b2c-bb58-30f275afc49e@linaro.org>
Date: Wed, 22 Jan 2025 16:47:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] A mechanism for efficient support for per-function
 metrics
To: mark.barnett@arm.com
Cc: ben.gainey@arm.com, deepak.surti@arm.com, ak@linux.intel.com,
 will@kernel.org, james.clark@arm.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com
References: <20250106120156.227273-1-mark.barnett@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250106120156.227273-1-mark.barnett@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_084725_846482_448BADB6 
X-CRM114-Status: GOOD (  12.65  )
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



On 06/01/2025 12:01 pm, mark.barnett@arm.com wrote:
> From: Mark Barnett <mark.barnett@arm.com>
> 
> This patch introduces the concept of an alternating sample rate to perf
> core and provides the necessary basic changes in the tools to activate
> that option.
> 

[...]

> Changes since v1:
>   - Rebased onto perf-tools-next, as per request from Ian Rogers.
>   - Removed unnecessary code that truncated period_left to 0 and restarted
>     the PMU.
>   - Renamed variables to use the shorter 'alt_period' instead of
>     'alterantive_period'.
>   - Added patch #5 that addresses an issue in the x86 and PowerPC drivers that
>     caused the opposite period to be reported in the sample record.
>     

It sounds like it would be better if patch 5 comes first otherwise the 
feature is introduced as broken.



