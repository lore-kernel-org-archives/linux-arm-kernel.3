Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=; b=LJea36GKR3etPQ/0xH6uYyBlq+
	A3gczQWsY2YKm+TeE8MT9JFgGkQi9nohj3szQnR15IfpnVSCslsViIuo2MBTnkhr/mhbFcX0p+VGP
	I5wpsMbIqr4rwm129NPbLFA1adDm80QGrdhBCqPxUyhQwAgEcY+5gLuqI3OV3zMQ7L+2cMVHDEBr8
	6++ok3zO9aIX4Caxqnv5aJ8pEoFNn8JTZO01ciCYYX00FyGSqpCAouETjv/5Ql6FiuNce8VHZWyd0
	DsZXF/op7RcfoFVxOXAqHAo+YqMzO008K9SPbeGBC6MBst5/LhWXnB5/tv7rwsSZKVjLnx4536TIq
	UHF4Sc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu91-00000003BXN-0TvL;
	Thu, 07 May 2026 08:31:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu8z-00000003BW3-0iAd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:31:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44a5174670eso323504f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142699; x=1778747499; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=kvq9cbtmTwzXIalNQW7ZzlZz/5k0hgQjXoc7fzhLDJJzOeZTNQU1one8kRVvxcgM7C
         pMtNCJCbn0x46S5DsW+LJwMBYWliGlsxK8vRn4txhDTxutM3E6Ogu+UZGwLaVnxuCg1C
         Mjb6ckQ/4uLRSPUH9qREdGrZFIFRawsWHVGQZiAVinbRU5a8viadwqYBnIoUzeTqG6PH
         AJbFTzbPlT7HuzdrkojGp/3vzKHIdf3e0lkvWD37yyeM/A9s11kQ2JWYEEL+aegl2+SB
         BmF5lUvtC4JGZN9edtuHCz4rPSZfptdmvpzqZIiviPKVFJr6C7NUStN/OUI/G36JA23t
         8V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142699; x=1778747499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKBAwkvhtjuXDyDqChVpUmkpaBFOZ2EpVTKNNIDAY9E=;
        b=FxQ32k4NhQWkpm5f6NO0FlQh6BnXGFKv7UCeZ0/qArySrLtezuvoI7kFvDTcGVbXmg
         nCM5xZ7V5UoklM9HEWrvQBTjHPJOgl4ppdkoYh9srf4eLj9eSxztxXRxm1RYJXkLi5TY
         A3jDqUL8cQo50e5HoUu6cw2lwMOFcAIhdC6L31qEtoaeWUScQuvn6eL5RG4ws7rfcOU8
         LB6BIGO8WG31FzjqXRKbt36a9xftRTLl6Yv7eEewY/HVub1Q5twg/b+MfgnVX7WbvtlP
         XDARevcCIUC1HEx3aDiLgfr/K3uAgeEnuVm2fVYOGhhMCdanHDwMvnw+unEiT/H1oTDl
         P5cg==
X-Forwarded-Encrypted: i=1; AFNElJ+MXOeWCyIMbhRbuK/sUU5qxUkiMiLY5zgOgpuan/Kf1jFvJBZYA6oMat70lR2iAaJM+b61JM6USYHMuCXeoFzX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz7SWhS9S8EkbKJp1CxrixX8+geIcAhzzCB04rBMlZ2YMf5xNi
	jksyBAB2exo+WZ5GunY1rPj/2OcZ9NMQ1HDeFIF3sLy/wNCs7KvAX3td9mq0XlrmJvY=
X-Gm-Gg: AeBDiev3hXom+7Ujog/Ci4VFXJQuwb3V/Vj9EnYtEMHF9KNftzzknQKx5venOsR0IVe
	cKTjMikB/YqWFB6wdoNNA7eJ8fW4+YjAIfiODCiwvozu0mXXx/zhnYmQmJh53dPFd/+5DQrmcz3
	sXdQqOvF9aHFjRih6/sFkg+nQXazXrcQRLFU68NmovnUZ5Y1LJbdsy/c7shnLbch0Y0O5aIIiGn
	19XDsweUPzIJQaWHF1tHo5GTCaInsNEqp1H7ALu6nWj9x5yIc/6/bq8T3DqZ/g0b+Ihvf+lnpDo
	OBjYv+I4bEy2oZ7gMofWcCbO98Ha34yEBjzfDY7P0oHfDOIPZpDSaLwZJmThPULvMMZMgUgTznu
	FzsCuELv3K9ka9w8p+aPCuc/ALIZc7RyUrQUrO/jz5LZiDRJ4zinNC2vWua04wG8keClxJJ3nl3
	8Gb1yR8le+FihFy0EyzpWvf7MzaGSu16K9Whr9TYoWkq0=
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr110121985e9.29.1778142699031;
        Thu, 07 May 2026 01:31:39 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm103806205e9.3.2026.05.07.01.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:38 -0700 (PDT)
Message-ID: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
Date: Thu, 7 May 2026 11:31:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_013141_233929_1E782FFD 
X-CRM114-Status: GOOD (  22.70  )
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



On 5/6/26 6:13 PM, Alexey Klimov wrote:
> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
>> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
>> through a hybrid model shared between the kernel and the Alive Clock
>> and Power Manager (ACPM) firmware.
>>
>> Add the protocol helpers required to communicate with the ACPM for
>> thermal operations, including initialization, threshold configuration,
>> temperature reading, and system suspend/resume handshakes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/samsung/Makefile                  |   1 +
>>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>>  5 files changed, 298 insertions(+)
>>
>> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
>> index 80d4f89b33a9..5a6f72bececf 100644
>> --- a/drivers/firmware/samsung/Makefile
>> +++ b/drivers/firmware/samsung/Makefile
>> @@ -3,4 +3,5 @@
>>  acpm-protocol-objs			:= exynos-acpm.o
>>  acpm-protocol-objs			+= exynos-acpm-pmic.o
>>  acpm-protocol-objs			+= exynos-acpm-dvfs.o
>> +acpm-protocol-objs			+= exynos-acpm-tmu.o
>>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
>> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
>> new file mode 100644
>> index 000000000000..c68d60b4c0b3
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> 
> [..]
> 
>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>> +{
>> +	/*
>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>> +	 * capabilities. Treat zero and all positive values as success.
> 
> ACPM_TMU_INIT returns capabilities inside designated error field?

yes

> What about other messages/commands? They just return error code there?

all the other commands either return -1 for errors, regardless of the error
type, or 0 for success.
> 
>> +	 */
>> +	if (fw_err >= 0)
>> +		return 0;
>> +
>> +	if (fw_err == -1)
>> +		return -EACCES;
>> +
>> +	return -EIO;
>> +}
> 
> Could we map these return values with better granularity instead of
> returning -EIO for everything else that is not minus one?

I think we're good as we are now. The firmware returns either -1 for errors,
zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabilities.
I can't tell if there are other commands that return capabilities as well,
or if there are other capabilities for TMU_INIT, I don't have access to the
firmware code.

> 
> Is this error code convertation applies only to TMU protocol?

yes

Cheers,
ta

