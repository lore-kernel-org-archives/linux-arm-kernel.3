Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E915E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meQf3tOwA9v3KvEUX4FJM9sq2n/e26PkRGC26HXFjcs=; b=y2A47PuKNzDHfDzkgfWKSQVF9x
	xAVlIhbsvuxml9xyivtgrKU14sJCE8X9qTgDd957JkQnw6Q0PHeftTKHagpiDz0guXWvZu8gkfaA0
	BwZ3WFcJYPAbwcbxy3AaqVOKzu7WJrJ9Spo9BAZS+dB+YEILftKA83C+eOz3MT2dbvV4nkVkjRWJi
	SmP8R/BuUlclz1H2Aaq10IA7VeBXdhLb4K9lU/9uV1/fbchBkuz+KerJfQcbA8QOh7gd+6q7fqsuh
	D6LWD43Jquh53fBxH9CH8QWGJdIZWTtAnavbC3u/NVcfIh9Ll8s1k7hV8pkj9bwf6QVbthXAScxr2
	iQ58krzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjVd-00000000i2u-10Ia;
	Mon, 06 Jan 2025 09:34:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjUQ-00000000hjc-17Hk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:33:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622267b2eso148652995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156016; x=1736760816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meQf3tOwA9v3KvEUX4FJM9sq2n/e26PkRGC26HXFjcs=;
        b=FcXUEyyJWLS3XWS00RYT3iRr7OTRSzkvs9Oo1gNaf4jlcdTY1Wmmfznqo7km+RZzq5
         Id/fGjy3AhmrVl2NbbY60+fDVyFcsJFVksLQ7MZZg+SRELiPzg79Te4MICxduDnu2oRF
         a1sxC0zeGcpykZV6N6PadbeNRtbku0M+BZHc9eMV4m07ttVOWgOebFcDey3UddC1UCoQ
         vk7XcCD/EhcKlWtoDMr3VLK5RT0l/UKlx55lCXYs1DuvkgOJu3gk0bjITuCyZjgkleRJ
         LUurIhBE9fsY3kMas9yUlpClqJPbcuN3co1BYj8BT1p4dBVWjKgscdbPCwr/0G7glHS9
         YESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156016; x=1736760816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meQf3tOwA9v3KvEUX4FJM9sq2n/e26PkRGC26HXFjcs=;
        b=B4pkbR+J4Sm4Abbq6ArPtw5jguC42LA8LIUDfeWI7FSh/BZPpREvXDjfYA6K2FYa6Q
         hGdhfKrbufuXrpBhk8Emaxnqhs5HzdL/9m2r6v+7qADCZ+pslB7KeKhZPbdpgTSlwVeV
         PKvVOMCiARnAwZL8kea7wjHInmQvas9ISSLhvQt19YIwfr61s9WJXRZtqhvknkBl1Ome
         V8iMVG0Z8TrStzCWSpvHInk9FrdTN8cxrHSIuFOULK5/IFU4bInFXpIY5T6Umz0gK0yb
         VeNvC9Lr3Hrof97jg9cIZ+fOmZc8MahJJwedS2BV8CGvNbvuPjq42TTY6n6/5IHFv6b5
         XRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCULea1COMh1a+Jgf6BiEzuMF2jXGxeztAfxF3WEwo1PnIdl5sEqW7L0IR4qoUiQP9FdUSt6ljQQjDc5Q72ktB2r@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+VsC1itA3P4Tck5NclEXnOfz5icqtwXtaT0tifWAlZxMbiRh
	wPDDCDyx0bxt0oeLfyVZiDKugKS8IXulczh/DgB/HckhDE8rzpohsAs1rXeg3Vg=
X-Gm-Gg: ASbGnct/Igtpv/mC6wCXkB/GoU2V4xuSUpg0+6rLMk4tRbwkjbkAvDTi9GhGYMQAeOw
	4ZtITujQ1y4iLw/Yx3iIXb75cRI1XnaebjdqMyXpKuIF3/poyy6/X3GjCFtu4Uoza6ANpD2gPov
	QDNFDQslcE0JKgp0Bfg34HeAFY+JTn4Y2+IJTE/OtDq+RxXRJffNkOXANa2udkRB4leyxv4q+9S
	eqvGo7CeKZxVTg9pqBK4/ro6O9kIFKOZ//1tOOPFJaCwIeqsxOm9xuLa08NKrqP
X-Google-Smtp-Source: AGHT+IEICTKjwcxXOZH5s08dwKlYhgIvVtZ84xC4XqDe0J96RAHSiziM8JeT7xKen2US0pmWaX6DzQ==
X-Received: by 2002:a05:600c:458f:b0:431:5632:448b with SMTP id 5b1f17b1804b1-43668b5e0c3mr428467285e9.25.1736156016496;
        Mon, 06 Jan 2025 01:33:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm570962605e9.21.2025.01.06.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:33:35 -0800 (PST)
Message-ID: <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Date: Mon, 6 Jan 2025 09:33:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Language: en-US
In-Reply-To: <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_013338_312702_B254B834 
X-CRM114-Status: GOOD (  19.62  )
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

Hi, Krzysztof,

On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>>> new file mode 100644
>>> index 000000000000..750b41342174
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +config EXYNOS_ACPM_PROTOCOL
>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>> +	depends on EXYNOS_MBOX
>>
>> Is it build time dependency? No || COMPILE_TEST?
> 
> There's no build time dependency, I'll drop this line.
>>
>> Is it fine when EXYNOS_MBOX is a module?
> 
> Yes. When the EXYNOS_MBOX module is not loaded, and one tries to load
> EXYNOS_ACPM_PROTOCOL module, the later will defer probe when requesting
> the mailbox channels, but that's fine.
> 

I'll need to select EXYNOS_MBOX, I explain why below.

cut

>>> + */
>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>> +						     const char *property)
>>> +{
>>> +	struct acpm_handle *handle = NULL;
>>> +	struct device_node *acpm_np;
>>> +	struct acpm_info *info;
>>> +
>>> +	if (!np) {
>>> +		pr_err("I need a device pointer\n");
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>> +	if (!acpm_np)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	mutex_lock(&acpm_list_mutex);
>>> +	list_for_each_entry(info, &acpm_list, node) {
>>> +		if (acpm_np == info->dev->of_node) {
>>> +			handle = &info->handle;
>>> +			info->users++;
>>> +			break;
>>> +		}
>>> +	}
>>> +	mutex_unlock(&acpm_list_mutex);
>>> +	of_node_put(acpm_np);
>>> +
>>
>> You also need device links and probably try_module_get. See clk.c

I find these necessary too, will add them. try_module_get() must be
called when the module exists and is alive, otherwise I get a NULL ptr
dereference. I need a module dependency between acpm-protocol.ko and
exynos-mailbox.ko.
	select EXYNOS_MBOX and
	MODULE_SOFTDEP("pre: exynos-mailbox");
shall do the trick I think.

>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>> perform both operations, which I think is necessary.
>>
>> I think you could also avoid entire list and mutex by using
>> platform_get_drvdata(), see of_qcom_ice_get().

Using platform_get_drvdata() will simplify the code, thanks. It still
assumes the platform driver exists and is alive, otherwise we get a NULL
ptr dereference when getting the drvdata. But we'll be safe if I add the
module dependency.

Thanks,
ta


