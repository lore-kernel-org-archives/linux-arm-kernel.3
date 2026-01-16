Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC93D4A609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXXyXgD5w4PG1Vior3rmQ9g78aObU3Raj1nrRdpjO4M=; b=FTwYGA3kojSeknpqkbkg/afkab
	fbtD+121Pg+3lpycSZ9ybRqlVMmB4tVYwNUmyJ/cxVDJMNP7ab3Dq+qt5i7tMnK/NTxbFUc59PD0R
	mYzvrrl5V08ujXNqQl1le5XOiOGGd/qRhNhZHp1F8VjGC0bCt4IgAlbSw/3Ue8b8uwwx8NPaI2sZW
	lUV+GbFiMsKq3zve7MBjRfcwxzCfN8wjGl9symz9Hk3Nuy+1asLBg+5xBtrIIYqFtLo9hqvjXKPV0
	6i1yqKlEZ5rDC8fN0ev2dLNwe0FzTotZieTzeayoTH3IofMsUzXjCKrFHNUtQqfNEkyCwMFkeRP8L
	QgsCbcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfXh-0000000DnDt-49My;
	Fri, 16 Jan 2026 08:50:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfXg-0000000DnDV-0Wua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 08:50:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so15127405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 00:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768553450; x=1769158250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXXyXgD5w4PG1Vior3rmQ9g78aObU3Raj1nrRdpjO4M=;
        b=iV/qEhDAblPxC8XhHMFvVzfhyDDpg2v50G+QTLeeXp2nM0ZIPWKLWd/Yn4RH2cFQuJ
         9qflD+bq39h4cvKN4qDUJubc8xtKpWbha5j5oAv29+eLCJAIGax25fGuEsEv97nSGmyP
         Ajla71SN9fn3QhMyT9ekmcZJNHcSqGuvqso99wRIKDvuOz5OmIgzdDBBDUCtIUvd1j/Y
         sDwgza/c8rGk6rqBZkAQ2XblP+TwbRo8DtPgghQVFBr3ZWUkqy77FBDDwRmG36pFe4+n
         b48pfOxLoVZCvoTifwTuoa679x2sjqKn6MnTDV1LJqfBQ1/2Mdf0Xzr7loIlf76YdeFG
         CO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768553450; x=1769158250;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXXyXgD5w4PG1Vior3rmQ9g78aObU3Raj1nrRdpjO4M=;
        b=cFzhc2aKIZpE0++GwqJNtD7Kesc6ibUgb8ZzA/Ui74UHZkE8etiRYfKsm7lD6DTW4p
         1Mh6fzgCvUKqAxq4DuaXvbt7lffrTYPK99QiN/rlNRod1WrtXpA4RVxVguBbZ+8Go57B
         M1ZKcv3Vx4KZ++DyOcrJpGDdDgyCfo2PM5niOp/JIAthKRqlFskNddCrykTNZJRFmk9i
         DZA+257A/TZJyTZ5AiQqGHNSIQiiMbprFfZmUH54CMJFqQ6wPXBCTE7AaGGN4iOdhct0
         LRPkSk/+6yBM1slqgsmSdVgimkIBY06SlJ24SiC7e1Q3LF6YG5rt/3pELF5Sn/mLi3XU
         6LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3chjG1gWTc/dy4ZmvYLdj1NEHYTSZeREYB83za9QK+64k5bCxsQJrsDyyQoxLcYUabA8sRBmAPg2N1N3zgFu@lists.infradead.org
X-Gm-Message-State: AOJu0YwsEVEgz/0dASz0OO2xeyg+fTE7w6FTuGRVbFbhh/q6FC+Y0Ia8
	OdBD00o8xLzZPLIUJ1LIzUpm/fqezSoX6GH6aInm1IdptpwsBxEuborb+b212KQJYXo=
X-Gm-Gg: AY/fxX4//EqzgJjGCbJM29n6AbwneqPEwocgtqLfBNWhij6A9t4qrQbGyv9e1fIggFv
	u33y3cwj3OR5y08IOo2ueuGQbH4zZbyDVJ+XnRvpGeCnUwklg8CwowEJB0yd1WQp0G+ULEyWeM+
	C5TPF+q9ueuCbsdcwtGWFafvCUYxjNO73Gk7RNPDACH/+KY4mb/n1CVaZMD95x5UkrWWEW8CBzC
	S1nzYoYHdLIVCxJ9OSxqQMR5EMGnn4tuTPlsZfg6Vl1vXxWiqwPQkfpT//ApxdY5JppDKHAc9jQ
	ux1MqcibPfgD15n33jddkDoVi/EVHc4Zb7Q7DodOXGkPp57LNcZnki3uSqqlau1x5I+FU2hEeXz
	7fESg8bGF/ZDrPiv/W7XDqS5s0IM3PdjB7gWeCULB1mqqPU2ubODc1oZub861M9q8bjG2TG+RkT
	/lyt1+GMbR3w2RdAIo1w==
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48020f17c12mr10430535e9.31.1768553449885;
        Fri, 16 Jan 2026 00:50:49 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b267661sm87966875e9.13.2026.01.16.00.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:50:49 -0800 (PST)
Message-ID: <26d86470-aaa2-46e3-9940-010a903df4fd@linaro.org>
Date: Fri, 16 Jan 2026 10:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
 <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
 <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
 <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
Content-Language: en-US
In-Reply-To: <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_005052_211947_53242203 
X-CRM114-Status: GOOD (  12.52  )
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



On 1/15/26 6:10 PM, Tudor Ambarus wrote:
>>> I'm going to link the ACPM TMU child node with the TMU node via a
>>> "samsung,tmu-regs" property.
>> This could be fine, but I actually wonder what's there. What registers
>> exactly. For example modern Exynos 88xx, already with APM block, still
>> have exactly the same TMU unit at 0x1008{04}000 with all typical
>> triminfo, current temperature and thresholds.
>>
> It's the same for gs101, the TMU instances have all the typical registers,
> it's just that everything is handled via ACPM but the intpend registers.

I could still use some guidance, Krzysztof, thanks for the help so far!

Based on the current feedback I was going to propose the following
description:

soc: soc@0 {
    tmu_top: thermal-sensor@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
    };
};

firmware {
    acpm_ipc: power-management {
        compatible = "google,gs101-acpm-ipc";

        thermal-sensor {
            compatible = "google,gs101-acpm-tmu-top";
            samsung,tmu = <&tmu_top>;
            #thermal-sensor-cells = <1>;
        };
    };
};

GS101 handles the thermal sensors in a hybrid way: it uses the TMU IP
block to read the INTPEND registers, and everything else is handled via
ACPM calls. There's also the abstraction that one ACPM sensor is comprised
of multiple physical TMU sensors.

My concern now is that the ACPM TMU child node is not hardware per se,
but just a firmware abstraction (One-to-Many sensors).

If everything was handled via ACPM, without the need to read the TMU's
INTPEND registers directly, I would have describe the sensor just as an
ACPM child.

Because of the hybrid approach I'm arguing the ACPM child node does not
fully describe the hardware, and it's just a firmware abstraction.
So option 2/ would be to have just the TMU IP block described with a
phandle to the ACPM IPC:

soc: soc@0 {
    tmu@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
        
        /* The "Firmware Phandle" approach */
        samsung,acpm-ipc = <&acpm_ipc>;
        
        #thermal-sensor-cells = <1>;
    };
};

Which one do you think it better describes the hardware?
Thanks!
ta

