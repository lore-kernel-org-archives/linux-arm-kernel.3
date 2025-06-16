Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1519C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lfnLj0M65lIIz8l2ArV9cQwaq0ywx1I5Ll3Uz7hkVE=; b=eQpJTjqWR7lIwY9VgcSqLbdvOy
	4xpx006PGacXPycaxn2Mj5WtzD8Oi/33m7Lu6ueySeIk6K5AHXzMmvQNvYDj6R/jjBrWE/oI61rOo
	JkujiolNiiCuSzg7A1CK/hLiNFrhJDJoEVIKkUdq6uRk6I0ZB6Eon8DPQfLMEv0+sgr9YdFwqayvs
	eojC3N1jPUBTBzpPS9mxgEdFAMNWZwQFyCX0s2ybi8pFmQmJhoafHZfbLjwBzAhmPCuUgBaVwU387
	NsNHK5eO6kzlHRDMwHzjB0WTKYKp5NRzIOxq8cBCvw5bgzRFl5WpHD+E3/xu6b+26EyIdpdsBk3Rh
	KO8C3XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8nW-00000004L3z-3ad6;
	Mon, 16 Jun 2025 12:18:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vk-00000004BZR-0NOH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so135999f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072990; x=1750677790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2lfnLj0M65lIIz8l2ArV9cQwaq0ywx1I5Ll3Uz7hkVE=;
        b=laQANGlmI1GRKAkHWcCcSxq0plctTORmSceKGfyyKA1vVeEVDEp71FOVwnERALjyYd
         Z6+HnMK+B+DodR/23pyhwMXKDED0QlGSh/fx99OL4qhpK7ZoyG7cha9ZHLxXImvDG1W1
         FNjIPjtSQ2OtNfpqTidKVLo148tmu86+aclDUJup6ropiSeIWjgJToE7mTADeSI9/ux4
         pYCcM7Zw3rsXyZCUmuP19cw5lPPCkJyV58MqA2+k1XxP4Va//UvuJEG9FwzvUWGPLn2a
         T6g4WfM4VReD7PNiyqO6iKoutScsANONobHoxziMAdkUSEkxZ+US3+x01v8usXA9rJkQ
         aDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072990; x=1750677790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lfnLj0M65lIIz8l2ArV9cQwaq0ywx1I5Ll3Uz7hkVE=;
        b=n5P25LWvocUSaCugYgSsk79YmshOBtnoWxrzzgbxoiCo/cBatJK7bsC9XICk3vD57O
         A0D4pvYqpB7u+aHa+/J6nm1pW1mLK+rgGciV1uHTde/jTBMQe2cwyjA+vJQWHvdyZTLR
         cV3qpfcxQePkoJMTQOC+sdehpwcaXDAst7OQvNeJYkY3EXyopTDiD8OnbQ81WFShv6GB
         hsWjWBYzUUPKYpy8vxlrkDXbhR6D08kJ+z3qzxvQfv0HfbeBtppdNZk8QCTLB882LCIR
         gCg9sU3vFfuHBV3PIt2IVeV0uUum1kQh6u3b1eaJ3CynHzxN0eZphyh50y4QELS/mQh+
         0D9g==
X-Forwarded-Encrypted: i=1; AJvYcCUNefktAPL1bYvx5yZjd4HSs/zkKVuRlG1ruwx++6ls0A9ruPcuGEaxhq64fT4jBWSvFeWhUNXbkk5bhE5ThOGc@lists.infradead.org
X-Gm-Message-State: AOJu0Yye7AsYSPzWvyfH5Nh92PyrR3LgP8QPeEHny4or6UOuKBtT4bG+
	ZGBVpyCTwH43nr/ZNdgoxpUHFZCAkkW51UNuJtwUpQZmmmXMO3p5PdMRuI2dZbs7bL2/w5A4Mh9
	AIU4CUj9uiw==
X-Gm-Gg: ASbGncsTqbI9eG8O+Dje1YSQKfeYIjRaF2AbjSLaT3rd29WBsXAYz0sARJuxZFk4mNl
	ukVvOTr+je//J+siXKOQ+PGlKw7X2jbPwOyIJHEHFDrO2y9elmSZYFfOgnrmDJMmZ+eA5hzHL6P
	hAJ+MIxEVm9j5qGpZV4bGHrDPyjqSGENpUy0T+DAHkRyX9ds08PuGobfbmBtv1QMAQHbxuYmdT2
	eOxILwOTNvDWW7YkssWyWYW6HW1OEFVpw0ZxpuZrAveoV5V+Qm6vUAE5fMy1j7b0BOwDKM2O0LY
	Pda/oDzej3LGFDFpg0c2ouJeZ6GJLY1wAgLgFgPuUM4/IX6PHLQBFMd3IKCvIeGzmwI9Qockny0
	zDKXrC3M=
X-Google-Smtp-Source: AGHT+IG5vtOhFMtmACAMxc1csTvRVmwkDe3M0Ca3uK/TQLNKVNimgzJ9jqEqjXWfsZ5zQ2okWkbh4Q==
X-Received: by 2002:a05:6000:4313:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a57189709emr2830597f8f.0.1750072990395;
        Mon, 16 Jun 2025 04:23:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe85260sm143710155e9.0.2025.06.16.04.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:23:09 -0700 (PDT)
Message-ID: <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>
Date: Mon, 16 Jun 2025 13:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Vinod Koul <vkoul@kernel.org>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
 <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042312_142257_FF19791C 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On 16/06/2025 13:20, Krzysztof Kozlowski wrote:
> On 16/06/2025 12:32, Johan Hovold wrote:
>> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
>> its Kconfig symbol but the defconfig was never updated (which breaks USB
>> on a number of Qualcomm platforms).
>>
>> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Thanks. This was sent on the lists some time ago and since a week is
> already in pending-fixes. Should be in coming RC as well.

Uh, now I noticed that due some other work I put it on different fixes
branch and that fixes branch was not feeding pending-fixes. That's my
bad, I need to fix my workflow.

It was in linux-next, though.

Best regards,
Krzysztof

