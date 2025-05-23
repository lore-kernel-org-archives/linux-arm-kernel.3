Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61329C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbvz/uK2pr2MI4jmK6EDAPEU/Gm2+BjOciuq5aXVONE=; b=EI5Hio3fG5OxZI5cIdlbS+6Fdz
	h8jkmPfRngGZrSAbkAQIlS/CUaIsu50aOzZISO1IKnaQIB1SEZru8CXWQ22cbOFNGlDqcQBlmT90q
	vss4PEE7WV8UfviyV7cGDFDz95Wju6k2zP4UOQhjoYenCdkOcBpgZINRuCWAh5u3xJwl9VfWev+FG
	5gDvygYCOI/PacsfiBlyXHsh3VEbN0okWxbM7NBiL97u+5Y3K4K3R/bLR+OeRGOHRmPPdqU4NxISh
	1wWLmQI3SAwzgTloWpxrUp2ZmFxId/GauoytqGNRw2SdOL9cnzvW77HyBdRmQwu6EmOPv57zg9TtW
	oH7IeVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU9M-00000004E3W-3zZT;
	Fri, 23 May 2025 15:17:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITvz-00000004BZl-2yPj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:03:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442ea341570so65030665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748012621; x=1748617421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbvz/uK2pr2MI4jmK6EDAPEU/Gm2+BjOciuq5aXVONE=;
        b=TtEy6UoJiS+BSpNbnpJfvDj3Vf4QXUdlRLvZ257MrdiQLGkJkviirEuJEWGwtH3tPN
         irtTk+jqWX++wgCGXBdgo8ErUUIaFrXaxHRCIDxv9eM+9doO5kT0MqRwoQuwF7jsesGb
         cS3uwr6gN5MrRkJb8+FGGc7J+yqSHUNWsP3aut5NU+keBizV7HyK4dzUSNxYQHt0bzP3
         FxS3IOnY76HTIsQF5GG/aWcJyaHMgKIr7EOK6qNx6zCBt+UOtVFTORSoVHoemfsuZQtg
         YU67zend2jSgnBAOVPazpgalAXNqHmJ82xyVwFR87KvFJWCOzvVKP/M7gposhWE5hwRH
         80GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748012621; x=1748617421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbvz/uK2pr2MI4jmK6EDAPEU/Gm2+BjOciuq5aXVONE=;
        b=KyX0Yk/gPhUCnuAF/A7KvVgoyt52R/0SXVAex1rBcZ3yA3vBbVLyrMlduc3Rr2Tflg
         M/IyKnrrYbeZtggQuOHLbIhJ/jtK5wwd33zQMQNnE0eS/RO8tsnKumknBkAYs33yoMM7
         Xk5ktzlgPdU/tMU/W/QXOozeO37wmGFCIb1C94pBj3UhFiPx3FxGZ0Llebl4jxiOgZsY
         IFY1DpFMwnnsqMM87yvBESm4Y1o8xtyxXRL6CXP5X3cxQQ1tnZ8mS/N4fFVr68muM8by
         tHmKPLwEuL/rQ3/TsuZiLVls/2Y3hsPlWPcCqNAOm2d/XMJDaaqahbQslf7JxzigBdsB
         DzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC7ms6AMExk7XssrDwcZFpWxg5HT9x/A5b7YhmzVLIhfTRYKqMg/Ux1RikzO56wI4ihWWg2qAqKDh0q7ZIr+06@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1e6aklmofJuv/KQ7yHs+l7uTpf3gLyj8lh2tEiu2N9T10Ce/c
	w9Ckzo6PVvkAuHedGHsEUL6+uSO7BNek/L3+kL8w60JE6W/2XibR1NhuDiFX/HfO5evHQ9Vzxl7
	VkoSYjfU=
X-Gm-Gg: ASbGncs9F1oSIdGemVRhZ+ls0g92bJQ2QUdCk3l+Njhv1/nZjikGKmBbTv+eHvNq9vv
	qppYC2J+SJO3xR5AenH1FYqxF+3+JRyTPIvxbbOjEASBFlhS857qYKRQL9BOB8gsSZTdq1sFRR/
	YFWDyVktTtBwqdv4vTlqhqJ+NQNm8KLGoIRPjBfDOnahPEyR8LG6UpYZtsFNMcGOl+x54rIElqp
	1LkzcQqlHjr6097rWKSUVdjURCIrejXKDuwmTeFe/01SxqqBuB2Ey1eX3t9vEGKrUOt8OEBqqsy
	bDQwc/M1DbxStiCK/Z7xT1wOLQIdPFNFMtMPULr+1rm3m/FYj67qqnc4LHRawPGl3aGsUTcIONM
	KexslP9jn8mQlew4=
X-Google-Smtp-Source: AGHT+IF6xxRKnVQPDNFgsmCYk0Qf6SwE1QfyL2jwEhJSor+dcRHsUaLRMrkpLvb8B9U+ZEe9KiJLBQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-442feff05b7mr289497065e9.14.1748012621210;
        Fri, 23 May 2025 08:03:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a36835ef41sm22867132f8f.94.2025.05.23.08.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:03:40 -0700 (PDT)
Message-ID: <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org>
Date: Fri, 23 May 2025 17:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
 <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aCUkN301jWUkXJ3_@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_080343_761122_80F126F6 
X-CRM114-Status: GOOD (  30.30  )
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


Hi William,

On 15/05/2025 01:16, William McVicker wrote:
> On 05/13/2025, Daniel Lezcano wrote:
>> On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
>>> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
>>>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>>>
>>>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>>>> source for the arch_timer.
>>>>
>>>>  From a previous thread where there is no answer:
>>>>
>>>> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
>>>>
>>>> I don't feel comfortable with changing the clocksource / clockevent drivers to
>>>> a module for the reasons explained in the aforementionned thread.
>>>
>>> I wasn't CC'ed on that, but to address a few of your points:
>>>
>>>> I have some concerns about this kind of changes:
>>>>
>>>>    * the core code may not be prepared for that, so loading / unloading
>>>> the modules with active timers may result into some issues
>>>
>>> That's a fair concern, but permanent modules (which are loaded but not
>>> unloaded) shouldn't suffer this issue. I recognize having modules be
>>> fully unloadable is generally cleaner and preferred, but I also see
>>> the benefit of allowing permanent modules to be one-way loaded so a
>>> generic/distro kernel shared between lots of different platforms
>>> doesn't need to be bloated with drivers that aren't used everywhere.
>>> Obviously any single driver doesn't make a huge difference, but all
>>> the small drivers together does add up.
>>
>> Perhaps using module_platform_driver_probe() should do the trick with
>> some scripts updated for my git hooks to check
>> module_platform_driver() is not used.
> 
> Using `module_platform_driver_probe()` won't work as that still defines
> a `module_exit()` hook. If you want to automatically handle this in code, then
> the best approach is to follow what Saravana did in [1] for irqchip drivers.
> Basically by using `builtin_platform_driver(drv_name##_driver)`, you will only
> define the `module_init()` hook when the driver is compiled as a module which
> ensures you always get a permanent module.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1-saravanak@google.com/

Thanks for the pointer and the heads up regarding the module_exit() 
problem with module_platform_driver_probe().

After digging into the timekeeping framework it appears if the owner of 
the clockevent device is set to THIS_MODULE, then the framework 
automatically grabs a reference preventing unloading the module when 
this one is registered.

IMO it was not heavily tested but for me it is enough to go forward with 
the module direction regarding the drivers.

One point though, the condition:

+#ifdef MODULE
[ ... ]
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+module_platform_driver(exynos4_mct_driver);
+#else
  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#endif

  is not acceptable as is. We don't want to do the same in all the 
drivers. Furthermore, we should not assume if the modules are enabled in 
the kernel that implies the driver is compiled as a module.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

