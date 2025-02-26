Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4729BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFbakQilfrCFdJzAsEkSswfsOnqR/LYLZZiUe3xWbCI=; b=KfJkzTH8VHO2fF5GtPBzvckNrC
	xyERNYowGskJ76e/aZJp8Zpb1RKZyM00GpdVIjx2KsgdaBP+CL9E0A9auDwbGD5F/ajL8n2oRIDnq
	8L+a8+jcF6jetLnRFXWwfxwBAWeDngOqodKyejoJr37Ny9T7xsMsSEujmv7s2ldeGenc4TKbkY7P7
	NtVbb50tGXZ8kPZ1VfPVZ3UWnBDFTnoWPN+Kjn6tu5qtEk9mBFvzl6BgtRFSBATL3PVefRwAgGz0b
	ilxKKrC96Xlp3nA8mPTLChxR1+noJtnhduccHQx0KCJrY2tZFoQBX1awed5PMEZ2INOrb9expHac+
	dpFXauwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPG6-00000005W9T-3NiU;
	Wed, 26 Feb 2025 21:48:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPEZ-00000005VwL-3cJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:46:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439a2780b42so356365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740606386; x=1741211186; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YFbakQilfrCFdJzAsEkSswfsOnqR/LYLZZiUe3xWbCI=;
        b=hRN0yApOw9YJmbUn9Mb13UsQr4YmwdlMojZWJC2gmd/ktT94OW1LwAZZW56bjJ6/sM
         G0AEZD+dJsVmfVpoPtpncEoTfO44f6rXyws/WU2Xu9mlUizqiwwv5jFo4LHMfnQqQ6Wq
         D9i2XLnlqCeHE4irpGZlqoZTAbW/Inj6z8uRspzFFMOHNnYYTMCXwaH1mDVi+Fhg+dTr
         KEJi3LCFgzB0gOrp3l/skiY79oymno2L8aGxAUHbJ4hRKKIK3sxaJmmj+bkRVwFAc8Er
         +XdPiTR5FiORdJw4Mt4nZ02nykndoLem+lRxRlsvdtZYQWWMU9YlWHxwzxe+p+HsqxNv
         eOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606386; x=1741211186;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFbakQilfrCFdJzAsEkSswfsOnqR/LYLZZiUe3xWbCI=;
        b=eyr6HzZc3ypuaDXoyuoCzI/cqRbnkjihkh+0fjGxOhzVohNEgnyDWRF8OK8NP1V594
         fwyl1Ow6f1PPG0aUiJAGEBQtRGUyGeLeH1olLLE4W+HEFHWOv+19CpnJtf6VekYtR8nC
         fa03Q1U4bUi88+64ob//XXBlgwmdhhV4lPSaxjk4sLOuSyEq4yK9nisaDRPwQ2yVvVIX
         SzzzissT0cJisW2iac9MgiOm9KHS5Zt/rPHaOkqbjoa4RPxDsV5IMMnO96/gG1xRqSUI
         kw3M1HQmkUhmkkyz+FdOp699vghNWj6UIr2kqQlrc0iOxBz91z9Wa/IqmcS9ajt2CaSj
         ZP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWNmkbAhQ72xvlq4OvL32w6PiB9GgpUdGtNfo/IXiI8R0w6bRXUn34gbFqpcq0SC4wCdv9wt6Y/NGW6MjPpuBgE@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVUivSxM6EteL/mmNtwDul/wseltW2n6YSKcBg3gf4X1BfId3
	yTl91M6sCK0NpFLYo6FKLb+dzGYPjpyrfvE5oYt9XPR6jWRU2XYeLBw9k+SiGNQ=
X-Gm-Gg: ASbGncu0yBRZAJxpLCfJJCJfQrVKkB/mp8gw9gXaX0JRtxlRCfkkTxkrJDyGuHLNwoT
	lmVGWkGLNik54m0C9319R7gSletP+LSJN5Rbqn4yoODCD6o/Ocj212tKKNVDwywniyi+JyKbQcm
	pRoSvCqGYladhL7FaX1ok5xOdrFg8vjbMJ0fWL0LPV5+sxqKTlf/7BcwxpYCWoEgQT7OX5wPK7M
	xINE5Hecq/g0vrtAG9C3JMgr6dgcCwOMS0X7iMU59bELgjQwdNvW56djYvFAdA8nxEIohko+KcB
	ZX4obQUGVwRLkTN6ZkwMxnh5chcsSGwYddjmd7YQ5cVD3A==
X-Google-Smtp-Source: AGHT+IEtK1mvKfE+Jrb2eiE9/ZRmv/XDdzfXvcs10OfwXomz3dm8J+yPkFC2Jsa9R+dhNmzu86YwxA==
X-Received: by 2002:a05:600c:4f02:b0:439:930a:589b with SMTP id 5b1f17b1804b1-439ae21e0fdmr78223425e9.3.1740606386090;
        Wed, 26 Feb 2025 13:46:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5329besm33666575e9.15.2025.02.26.13.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:46:25 -0800 (PST)
Message-ID: <455e8796-bf53-40d2-b3dc-13f583af0865@linaro.org>
Date: Wed, 26 Feb 2025 22:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next
 is decisive
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
 <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
 <20250226152910.GA2447540-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250226152910.GA2447540-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134627_913492_FCAB8FA5 
X-CRM114-Status: GOOD (  20.42  )
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

On 26/02/2025 16:29, Rob Herring wrote:
> On Tue, Feb 25, 2025 at 07:48:22PM +0100, Krzysztof Kozlowski wrote:
>> Devicetree bindings patches go usually via driver subsystem tree, so
>> obviously testing only SoC branches would result in new dtbs_check
>> warnings.  Mention that linux-next branch is decisice for zero-warnings
>> rule.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
>> index 1b32430d0cfc..5423fb7d6047 100644
>> --- a/Documentation/process/maintainer-soc-clean-dts.rst
>> +++ b/Documentation/process/maintainer-soc-clean-dts.rst
>> @@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
>>  No changes to the SoC platform Devicetree sources (DTS files) should introduce
>>  new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
>>  results of issues in an included DTSI file, are considered existing, not new
>> -warnings.  The platform maintainers have automation in place which should point
>> -out any new warnings.
>> +warnings.  For series split between different trees (DT bindings go via driver
>> +subsystem tree), warnings on linux-next are decisive.  The platform maintainers
>> +have automation in place which should point out any new warnings.
> 
> I see a lot of warnings due to dependencies (both bindings and other dts 
> changes) not be applied yet (or applied but not in linux-next). I've 
> been filtering those out, but maybe they're useful? Some are things like 
> missing labels, so dtc fails. I think that gets run enough a failure 
> report on it isn't too useful.
Maintainer-soc-clean-dts is an opt-in and so far only two guys in kernel
opted-in: for Arm/Arm64 one Samsung dude and for other archs only the
Risc-v guy.

Total coincidence is that these two do the DT bindings reviews...

I would say most of such warnings are very useful, just the question is
how much of false positives you have. For example LKP (Kernel test
robot) was sending reports on maintainer branches, but that had too many
false reports due to missing bindings going via different tree, e.g.
driver subsystem tree.

Best regards,
Krzysztof

