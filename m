Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AC7C36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=; b=vrm4abwHSaJ5kEQ3jG5lnBjOQF
	ivctveEHwZ2VMiMfHlSXpeIk/jDEAyDP2yROKAGrqCAmky8B3JqWHm37Y0IUJQ8Ui+GX0M6d+Lz3a
	a7aIc4b719zUuJ4xNZt7qzmMvGJ+U3dnK+ZhaVIXxv+VErpY410LeUBQCBy41J60gQAr0Wr1YbdO2
	Xont3ZH3/MhACIvcdEJRh1U2cFdF7y4ZrungHDSSka/0qDb9TU1o9LORN0bAlN6lx10omhL/K1xRk
	dafSpXthgREf70MZlQw1D2in9X7vJsXGy55na3P2ukZGasA/VRlDGJKQQ7py+QxSUmQILL+VbqgXs
	YczgaAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAgh-0000000HPP8-2om3;
	Mon, 31 Mar 2025 08:40:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAez-0000000HPIM-3uXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:38:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso47310725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743410300; x=1744015100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
        b=Bhu8qUeQFhLkrIfxvZF35XFo1iSISuXFbLPBFEjJ5GCdsXn25gP23f4secu4V4aamw
         4uz1YMYU5z13luNdMhdqn9TyT+HEQPqTaj/dO6EWnMYlRGVeDH6FiXpXC/qPOZnsPCGd
         lboPUHXldHKUHte54Mf35fuikddvlTVrMHzHbuT5oW17eGeC+F8OJ6j+LWOBEmF/7Dpt
         rsx6lrerQF5dJY1d3O6fXFCQQZH9FXOvT009aus++nAKrhWGovrxAvwaOmzup5vF/IGl
         BZuyPLu4S3askQ3Y810tOOEJF7TgLZy5lYqXezclaNebePDXedOhLOcCsCHtl6fqkY9j
         qPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410300; x=1744015100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
        b=ddXgFoe8BRvq3Zn9lQD3ZibAl8ZBnw82YJ1TrbP6zIQnlaZ9q/ETSwiUZdSDj+DGxJ
         oNFnwxTKhRRrI8oTxJirAdCpdPk7Da/uRLoqZjNaVqyf/841o5XeDfa0kGr+1BiqraOp
         7QNTzk2LMoRsU8ZlmoYBmZ9df3iY4pQzpDdyNtHTAa/NsZno61OwHPAo8uDpPLYic1Ko
         uOe4z2ToBOf3bXdW/jXdV0rXiXBNTAcUCUBCS8sBL9REixzwm7wl6sWiQJ4gR5KJ/uNu
         gsEhKTANINx5k1Y+GCqix/PXoeGu3BNROCB1oZsVNRl+ZhSmJX9BDYfFyyVtsEfa5qo6
         ZHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE1xiATOnolEF/2ZW6bbBXd0pCNHMZH86ONxlwOfOqbukeKj0IET1xk8gcYzHXfLtK0BX6JPpYgXb2TfrG4an6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5aHZxpwtBCXp4ykT++o1oDnKUKnH6TjZ0LU+1fPPE4+3jioy
	OltrwE40UCqhJpQuzaoARtFkIFMoYbDxMDPqEtPOM9X/sqivCexYkLckt5lTml8=
X-Gm-Gg: ASbGncvNz1u2/LVRnMM7bgKk98A7oPk9GWgjy9Rccz4RYT45DYBi2CTix9hjvpmc9lO
	OQE7urSighjBJRpKQtKXlC8h8FEEXQ/HbxTz+VfCD3+/tcpVY/9Uudvu/92riZ3+2VO52CJZMf7
	pZl9wnGxHzdixEbrDMIkFN6rDrM0oTdziRFmJUaHFac5MIGAk5lePvJ1VW6TPrMrQx1cIaZ5jv8
	nMN0Rg/nQjwO61HI+grZSkJleQtKoRvhk2SovQmMLScr+OSwtqo/MVFL+9PpYosnznsT7c3sIes
	ZqoSO1hclKxtatpYiIFNP2DaTL3gjl6lQodURccd1wqWuiuCZlibnAxzq8oTTcGG5xnZv6tvmSO
	K8jpAGmK3
X-Google-Smtp-Source: AGHT+IHnymAzt9wzLtLJDSjlzRXQxVPcbpSsh6FvhFdIm6eixK9JeGM+C1pvqMUaMqG2vD0oiiyYsQ==
X-Received: by 2002:a05:600c:310c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43db6227ac9mr57538675e9.7.1743410299906;
        Mon, 31 Mar 2025 01:38:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82dedd6fsm163362265e9.7.2025.03.31.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:38:18 -0700 (PDT)
Message-ID: <6bca05ac-13d0-4197-b4af-5509884c83c6@linaro.org>
Date: Mon, 31 Mar 2025 10:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: Add NXP System Timer Module
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
 <20250328134208.2183653-2-daniel.lezcano@linaro.org>
 <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_013821_982298_5823391A 
X-CRM114-Status: GOOD (  20.76  )
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

On 29/03/2025 06:03, Krzysztof Kozlowski wrote:
> On 28/03/2025 14:42, Daniel Lezcano wrote:
>> Add the System Timer Module description found on the NXP s32 platform
>> and the compatible for the s32g2 variant.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
> 
> I got only this patch, no cover letter, no changelog. What happened here?

My bad, my scripts needs some more work :)

Will Cc you in the next version

>>   .../bindings/timer/nxp,stm-timer.yaml         | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>> new file mode 100644
>> index 000000000000..a9c0151d62be
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> Filename following compatible.
> 
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP System Timer Module (STM)
>> +
>> +maintainers:
>> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
>> +
>> +description:
>> +  The System Timer Module supports commonly required system and application
>> +  software timing functions. STM includes a 32-bit count-up timer and four
>> +  32-bit compare channels with a separate interrupt source for each channel.
>> +  The timer is driven by the STM module clock divided by an 8-bit prescale
>> +  value.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,s32g-stm
> 
> Previously it was told to me there is no such soc as s32g but they are
> named differently, e.g. s32g2. See other bindings.
> 
> Please consult internally and come with one unified approach to all NXP
> bindings. Otherwise, if this is a real soc, fix this for top level
> compatibles, because there is no s32g there either.
> 
> This applies to all NXP-related patches (which I am sure was previously
> discussed on the lists).
> 
> What is confusing: previous compatible was correct and I did not ask to
> change it.

Yeah, I think the answer is straightforward. It is s32g2 and s32g3, the 
two platforms having the STM. I'll will fix the compatibles.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

