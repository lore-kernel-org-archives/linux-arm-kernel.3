Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D204C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DPdNi4T7V/yvBz4It+xorfOv4L6Xc1BemGmrvImCwg=; b=rvo6LGBhls6bmrYJ9Y9vTm6RyS
	b/1RZgDAG5Szjheo17HgCAJ4rpWXyg13eTRBWcL9Xjy23rV2kF0xvt2XcwMA7/XDLzRE4lL68dFTa
	F/i38wY3Q6TMc1yhv1SPgH9WwO5UFfryVhUpr7XWEZeeyBXPd76aqZV3smHruu8qBcES5r+KSFb2U
	FnlvwkzCVmIO1NxoRnu/DmyIRwwMk8uQkA0mMDU4q6XgLAL+xBjAZpHh5+GvI6kZO8OfvwYqtuzQ5
	WqFbI5Op0hhcayDvqdCkBqK6/PiYQMdqg2OJpVmefcIQcFqpgQQn+z2CPAPbQToUBvbsxKC4umVlK
	5FEZCLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwiz-00000003niY-147m;
	Fri, 16 May 2025 15:11:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwJQ-00000003i24-0xto
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:45:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso13003975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747406723; x=1748011523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DPdNi4T7V/yvBz4It+xorfOv4L6Xc1BemGmrvImCwg=;
        b=qqXOYb27YR+2gsJ9TE31WMrxS4TmKidnJQyGz6KB/yVrSsrMKnUVbIdG/n9N50gTmu
         cIraXuZTmdHQdH7JHrxz/LMCQqgTUP17cO+BI2HSdmBPXqy1Ws9SLfDJE9mzewoq53V9
         VZzMG85I4nIf+4kLCCfvouyr+/NVg3j6ES5k0RB2fGmPB7mZy3rVKU1XqfGLngqrI3Us
         Q/KmrGdx6Djc/A8aV0d/Rms+05CHUAqTHDqAxuY7TsBmWPetlo3AJ7i9hjjswn/lkqcn
         lcR1RhTZN7eP9oYqCBlqjoHzdtumtfozx2PNpbW35uisTyNiYX34vrC4kHUCzFujfFQ3
         nuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747406723; x=1748011523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DPdNi4T7V/yvBz4It+xorfOv4L6Xc1BemGmrvImCwg=;
        b=ZMmbLL6T6Tcbu9FN+HazNuGQ+XBrJiL8aryBhgbQVRH9IvoMXEzi/BOSSuR47QYKSH
         sSrLrm2sk/ts4qco0Mh+9aCSS6HHG1TSdWMXI5BK/13GIc+7PMpI/wj+HrMwh9pe0MJo
         j6i1WfoVvzPVvAR7buCmxyArY5eES0AhTeQzuBPuwpKwotDF1L1KE4sAnWH49BR9RGpq
         wlbjbhg6aNlEbc3YVgRj0DykQxNwOM7T1RZuoaNzjeA0h/7HJ+GG/G0E8E3U4VIe+8ZA
         bxs0OWbGIGomIi93WcWv+En2phiX+Plv0a/wl4JmOmTZzNJI6AGJVbLW+gUNbHB7CeDA
         ScHA==
X-Forwarded-Encrypted: i=1; AJvYcCVRMfEGhvK3CPZ3eOaMfyFL16w39CEdYNsUbC3AyNBS0WbxKOPrkMB+bAMEKgngO4LmpLQsskUy1vmEbeJIA99+@lists.infradead.org
X-Gm-Message-State: AOJu0YyS+mX6/xEmsqZ7vr6fMFgMu3k56ij+XKF1WPbolhnSiWNTyuA/
	6TEyIl75Az2xdXjZEsGEkBmpUXFvjM0orLfMhnHPhJLpf36+jUjIMCnSXj7WkBbnGWw=
X-Gm-Gg: ASbGncvUeTimfrI7zDfdW+CR1okRTFQf1SfhC3xv/kTauATJ9TeAKMtMya6+9hezEwt
	r+uEMV8cvLj05SapflQhT/lhqegbxkJER6oXaiqVGsjUIUPRsmRZq6s4o7JDmjmmHiPJxMMGuCu
	71Za+mqjQ9HPcDE7PEqRAokZ0P4rCxIOffo2V/YrLRUoM5d+tBx0OQsCySxR3jCfhBBxJEJpQ7b
	q+BeP+0HbB0dGdgRK5PmTy5YaixaIx8lYVDhxOld5hhMtx/jOXvz4A5O0V+dBsQdDr7xl1wx7EZ
	q9eFsP93GSNE/kcfi5H3bMMc8g9EtShA3Ds0Nuy0xip910mJRjDpzhGinCWWWKduEQajZMvDiZw
	65EdgzCORpegO
X-Google-Smtp-Source: AGHT+IE+e8uUfU2U7RrsspDQy+hqfnS3XZDgVHe+ewX3FxYMCsEn5Vbv/9CZ6GBFRep73wxKvvMGnw==
X-Received: by 2002:a05:600c:34d5:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-442fefd5e7fmr30145935e9.1.1747406722689;
        Fri, 16 May 2025 07:45:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e84acsm112377585e9.25.2025.05.16.07.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:45:22 -0700 (PDT)
Message-ID: <3c44154c-7261-4b03-bd12-bddf4d493e74@linaro.org>
Date: Fri, 16 May 2025 16:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
 <aCR9RzGMWEuI0pxS@mai.linaro.org>
 <CANAwSgSA-JHMRD7-19wijOY=TSWD-sv6yyrT=mH+wkUJuvxFAw@mail.gmail.com>
 <92c2949e-2fc1-40e9-9dea-e3d9f7aa571d@linaro.org>
 <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CANAwSgQryVLdRVd9KRBnaUcjtX8xR9w9BBTCvoqKH6funkj=2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_074524_284432_188A96E1 
X-CRM114-Status: GOOD (  21.38  )
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

On 5/15/25 20:01, Anand Moon wrote:
> Hi Daniel,
> 
> On Thu, 15 May 2025 at 18:59, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> On 5/15/25 13:10, Anand Moon wrote:
>>> Hi Daniel,
>>>
>>> On Wed, 14 May 2025 at 16:53, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>>>
>>>> On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
>>>>> Hi All,
>>>>
>>>> Hi Anand,
>>>>
>>>> if the goal of the changes is to do cleanups, I recommend to rework
>>>> how the code is organized. Instead of having the data->soc check all
>>>> around the functions, write per platform functions and store them in
>>>> struct of_device_id data field instead of the soc version.
>>>>
>>>> Basically get rid of exynos_map_dt_data by settings the different ops
>>>> in a per platform structure.
>>>>
>>>> Then the initialization routine would be simpler to clean.
>>>>
>>>
>>> Thanks, I had previously attempted this approach.
>>> The goal is to split the exynos_tmu_data structure to accommodate
>>> SoC-specific callbacks for initialization and configuration.
>>>
>>> In my earlier attempt, I tried to refactor the code to achieve this.
>>> However, the main challenge I encountered was that the
>>> exynos_sensor_ops weren’t being correctly mapped for each SoC.
>>>
>>> Some SoC have multiple sensor
>>> exynos4x12
>>>                       tmu: tmu@100c0000
>>> exynos5420
>>>                   tmu_cpu0: tmu@10060000
>>>                   tmu_cpu1: tmu@10064000
>>>                   tmu_cpu2: tmu@10068000
>>>                   tmu_cpu3: tmu@1006c000
>>>                   tmu_gpu: tmu@100a0000
>>>    exynos5433
>>>                   tmu_atlas0: tmu@10060000
>>>                   tmu_atlas1: tmu@10068000
>>>                   tmu_g3d: tmu@10070000
>>> exynos7
>>>                   tmu@10060000
>>>
>>> It could be a design issue of the structure.or some DTS issue.
>>> So what I found in debugging it is not working correctly.
>>>
>>> static const struct thermal_zone_device_ops exynos_sensor_ops = {
>>>           .get_temp = exynos_get_temp,
>>>           .set_emul_temp = exynos_tmu_set_emulation,
>>>           .set_trips = exynos_set_trips,
>>> };
>>>
>>> The sensor callback will not return a valid pointer and soc id for the get_temp.
>>>
>>> Here is my earlier version of local changes.
>>> [1] https://pastebin.com/bbEP04Zh exynos_tmu.c
>>> [2] https://pastebin.com/PzNz5yve Odroid U3 dmesg.log
>>> [3] https://pastebin.com/4Yjt2d2u    Odroid Xu4 dmesg.log
>>>
>>> I want to re-model the structure to improve the code.
>>> Once Its working condition I will send this for review.
>>>
>>> If you have some suggestions please let me know.
>>
>> I suggest to do the conversion step by step beginning by
>> exynos4210_tmu_clear_irqs, then by exynos_map_dt_data as the first
>> cleanup iteration
>>
> Ok you want IRQ handle per SoC call back functions?
> so on all the changes depending on SoC id should be moved to
> respective callback functions to reduce the code.

I think you can keep the same irq handler function but move the 
tmu_intstat, tmu_intclear in the persoc structure and remove the 
exynos4210_tmu_clear_irqs function.

You should end up with something like:

static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
{
	struct exynos_tmu_data *data = id;
	unsigned int val_irq;

	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);

	mutex_lock(&data->lock);
	clk_enable(data->clk);

	val_irq = readl(data->base + data->tmu_intstat);
         writel(val_irq, data->base + data->tmu_intclear);

	clk_disable(data->clk);
	mutex_unlock(&data->lock);

	return IRQ_HANDLED;
}

But if the irq handler has some soc specific code, then it should be a 
separate function

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

