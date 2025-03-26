Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F434C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WjwjGLl32A3KiDt34QpamT6Oni1xHmFU/Px0IbQnoY=; b=0qXM95xZ33dL86+psA5vCF+fdr
	L7MsEeyfwB407wkp1ultc/lD3R2EbxoalMByg2wFuCQDg6iPQyGR0w2u0edWy8okZ7Gbi+s2c/IMm
	xoM/HBSCoWkFrDGUsy02suVnqxY9gK9SgOT5xxH5R8B0GYeK+zvnYjHiY3ubEn+hHLR0mFRLj+k05
	uALFxfbq8nksesVVcEkue1qlhEJhih0rX3vVf/8gGGQuq+Ar2w8nPBfNNFy/qzoKBSCNlVDOaVRFz
	u8+olcVcV4htJnCvcF8Ix2mYKEKceCnFPeUYFNt+WD5DfVtsto4zFy0U2kMIYw/PFYeP9Qx03B+C2
	QPPshVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLJE-00000007nyh-3xFc;
	Wed, 26 Mar 2025 07:36:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txL7j-00000007lpi-0oP9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:24:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so44832735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742973865; x=1743578665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WjwjGLl32A3KiDt34QpamT6Oni1xHmFU/Px0IbQnoY=;
        b=r81xO4jjYCq/USmWJyRdIB+D0TgoPcLHMa2pxfvsoSkNuudjfQ0NQhVgaRAZNiRdwg
         Is/XUaHcW8CKxDHqJgd1ykxK8CutOQCcrBD0R1VWqAbOEJb3yZmskqkNMMioB8neAYFS
         HXdhf5S9/deTWSYmHhR711sYiUH6WTOAx2wwCZ7W3UjXAxhW15RMEzisnpZKnb2wIcqY
         1tcFIpkLcfvDx7Jy5nejZm47uE7xQsUu71HtB7pLZnue62Km8FApQoOIKFddyaBLYPZA
         4zr7yYVxupisrOYCLbQHFIUWiiIYD7sPKyvq+X/ymkrw+0XonJG4Djh19XqZRuBgBkdE
         TJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742973865; x=1743578665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WjwjGLl32A3KiDt34QpamT6Oni1xHmFU/Px0IbQnoY=;
        b=oK9OlhuuAHIAFJwZK3pLWfjzFhjOiUcWx0V1zOxuBqXHQqFDJy842+VBXQgBZaOFuF
         7vqvIxQj03WiComDP6Z1WOalx+z8tNACP/Sv4fX/NIOFxE7JShAYgw04hzsFc0mUiRnE
         i1jX07kMNEE158iVWrxaAVELXacRo1fPlTHl22OrDKbsVeYrTZ0f53BAyaZ8lRhURo81
         KRn7d2nyjm5U8d/fuO28tz/Ra0xwlwty/4EgpnSSs4ms9us78Wx1QoRwiWq6HslboGfz
         hgbE70lM4fu08+PK6MVaAGAY/lFraJLOG7uzgK0C17yRn3s6BZovK4N+YfN2Cij5n5Sp
         EY0A==
X-Forwarded-Encrypted: i=1; AJvYcCWlvj4mxMa++26+NmccYxDeJXFzmL4/0hbDSdrhqxV8vlEej9NDs2ci2mOAphcRSxwAiqK91hdoazsev1j06Epz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl7VUdmbZq5NDoo29yath8y0iRLmNk5zBLY//yBXgECK5envFV
	GYRLjuTHl1WBlMOXdQmkjwpJhJVeX0Izw5KVEDFYZ6diyriYxGfrTPIqCUN+GJc=
X-Gm-Gg: ASbGncuFqvmv5Uulv7hMa555iQC0a1TF7cd3uPQU8Azk2Ei9srpfgPt0WTfP4aWzjSZ
	Gh87GjJ+sXtFYG7dv0UfcaSU0761k0hljgpbk18yK0Nvp04KSLi60mSGS1TRQINd72NPr/5zr2W
	R1qP3XtYReIbP0ZThyfvg1ELoFchXTYSw8+aC6uP+FkPd1dtJ+ByweHj/xlQ/dDLiAsjeX5HDtX
	ZDKCnSLLFbwn5s6t0Kx7G43zxfMH4+Yk7X2Cy7Ym3bRiYntpZkvqePwM+EJdAeuU8d3CL41M4z0
	pJVvAnwtgLdFz2MefzyrnanLAGJGn74lHWFS+pu528fjP3AwBQPnQKU=
X-Google-Smtp-Source: AGHT+IFV7fd+M/H9BFgJClv0I0A4YnOUCaUBe1bBC0ZrrT9wb1YxMcUrftw6F8ycCV7VPua/wYkfPw==
X-Received: by 2002:a05:600c:4747:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d509e43e3mr184235705e9.3.1742973864876;
        Wed, 26 Mar 2025 00:24:24 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f33242sm225247215e9.5.2025.03.26.00.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 00:24:23 -0700 (PDT)
Message-ID: <42905f72-100b-432a-becb-7e1f835e518e@linaro.org>
Date: Wed, 26 Mar 2025 07:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
 <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
 <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
 <974ddabee5a2a43b9d32f382ec4b13afab066f1a.camel@linaro.org>
 <60732c52-7774-48c6-8ec8-44ae82d86267@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <60732c52-7774-48c6-8ec8-44ae82d86267@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_002427_249298_B1655FEA 
X-CRM114-Status: GOOD (  19.36  )
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



On 3/25/25 8:07 AM, Krzysztof Kozlowski wrote:
> On 25/03/2025 09:01, André Draszik wrote:
>> Hi Krzysztof,
>>
>> On Tue, 2025-03-25 at 08:57 +0100, Krzysztof Kozlowski wrote:
>>> On 24/03/2025 16:34, André Draszik wrote:
>>>> +static bool acpm_may_sleep(void)
>>>> +{
>>>> +	return system_state <= SYSTEM_RUNNING ||
>>>> +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
>>>> +}
>>>> +
>>>>  /**
>>>>   * acpm_dequeue_by_polling() - RX dequeue by polling.
>>>>   * @achan:	ACPM channel info.
>>>> @@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>>>>  			return 0;
>>>>  
>>>>  		/* Determined experimentally. */
>>>> -		usleep_range(20, 30);
>>>> +		if (!acpm_may_sleep())
>>>> +			udelay(10);
>>>> +		else
>>>
>>> ... and what do you do if IRQs get disabled exactly in this moment? This
>>> is just racy. You cannot check for a condition and assume it will be
>>> valid for whatever time you want it to be valid.
>>>
>>> What happens if system_state is changed to shutdown in this particular
>>> moment? How did you prevent this from happening?
>>
>> Yes, and that's also what the I2C subsystem is doing, AFAICS, see
>> i2c_in_atomic_xfer_mode() and its use. This is to make a very
>> specific corner case work, similar to I2C which has to deal with
>> the same issue during shutdown.
> 
> But they don't have a choice so they try to do the best to avoid
> sleeping. And it is a subsystem, not a driver, which means their
> patterns are sometimes special. Drivers should not replicate subsystem
> workarounds.
> 
>>
>> Would you have a better suggestion?
> 
> Yes, you have a choice, you can always use udelay. Driver code is
> supposed to be always correct.

Using udelay() is good enough for now. I see that downstream uses a
usleep_range(50, 100) and I'm concerned that we're going to waste lots
of cpu cyles once more and more clients get added.

If there's no concurrency on the ACPM queue mutexes at late system
shutdown, would it work to pass the don't sleep requirement from the
client to ACPM and use udelay only then?

Cheers,
ta

