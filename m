Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37297CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NY5PIARKbpIdf6CoFhX2UEn3hHI/O9Hdjy4EAS5mHE4=; b=eg9ci80PiJzLh5k1sFPKiYqLay
	VFnfDH3Ejx3AmJE02BNPHDa1lmmR/JdceIo3UNaFwrmqDmYMPtGcJhdbE+5J7OWiiXpxVwQbMgbki
	VMGy0oiRzLvgwPWApO/aWL/qY2xY8SfD9jJxWrX6QVQKNXz0X/UEkGiXyZZ1qiSPN6w3RlQ49Yn1y
	k7ty+1ac8sDPnqf6g7KSnZIXkvOtfYNwVeUIf9Wa1zi92ZBqJusRjEXlLILWKfN1T39rgcxCw4vPe
	lDZbp12Px2Kh/q3LIaFNdert2IID+CE80JdLe2DHrkosxrkl0Q4UKkRIAsUrabblJogG0ePQDrMI/
	5shqC/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDzI-00000008rnB-0ews;
	Fri, 24 Oct 2025 09:21:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDzF-00000008rmm-1Py0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:21:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so10479065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761297687; x=1761902487; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NY5PIARKbpIdf6CoFhX2UEn3hHI/O9Hdjy4EAS5mHE4=;
        b=Nx41I1UOr5r/gOsXEfeax53xhB8bX/G566Mypjz78SGhOZocTcBYHe0OUToyWkx2dU
         /9aqC3uK5eTyGajZR4JSbw4rV5yHrtw8y8poxBVP4sHSQGBdas+uU82pWBoJuKe1MLt3
         3CzBNEkx0wNzowsC1denFpn6ryDWEPIpUZdRQ8XbvKYT8v9cAe1LXd3PR7X268fbsD20
         w31if9W9ug4sB+LsxY3JSxcQftDonn/NSjVCXtMR3nfo9U52Dm450DR56GnDJcJXuzjd
         jmwyjbt0tV+1JfmUKPsxtBdKP8dji86K0jezpgVflEdBQ3hGBoDjtNaTckpTCbX9raXj
         M7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297687; x=1761902487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY5PIARKbpIdf6CoFhX2UEn3hHI/O9Hdjy4EAS5mHE4=;
        b=ZqPuYW/kGAZDC9XPW0v7Kj+2p2Js2aPTg2V/szzNeavcugHJqZ+bJ/nlVcPzo78aFO
         vvbh6VYvgw4Y+G1A3ZUrzicy/ITRdW2IdyrEOJObQr7nwU/4Aj/ucSkuyzRWCE8gsoyx
         TTNgFxHW+X2J+l9zyzaU6lhXY50Jmlr92ZhpYf8eUvlPEnWMpg6mAXvyiiTIaMR0I3ja
         7RPnI4MjaHOdKAd/Gpchp3eU5MABYwxSNb195h+MTi1LaPNEA4FBnoPWfFYPhdpZxzn5
         ZhunEZtiUFButWOd8JAIfoBnALzRz0m0TM+PRNWD1ZTj4poRLAXpo3rKZ1B8v3alO8Ps
         7TUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPEcheKOyCNdAR1YRHSUuxEIRmIqli4ULCUqivQ1OAmHkt12RKaOwFCBMQzP9xFldzuufc11j71D74t/FpMM0T@lists.infradead.org
X-Gm-Message-State: AOJu0YzggXvnCm8GAmZ5yFFSAZnrwUBCrirCnTHJy7XZugPErV5Ybm7j
	/epZLHYH3l8X78D70YUuCE/aHMiBmp16fS5axYz/K0DLRLIh4BGPK2Bf
X-Gm-Gg: ASbGncvsrwzsnHgvcLGz/f2ozT3grHq92wV85jCwq4zUV/YEakvQcnGItF/juFtKZ2G
	1g46UffpHwp72/3lBr0ZjfvZe0I+6rl1petUYUPeQgYF1Nu9i0rXvP/oSTXyQ2kbPvhfyCa3G53
	7Js9R+QQgDGXoTgCTkJt5wypsdCmzELA38OWHrRxMdVJLZAXxX6w8Wcao5axHpqZ3C240MB6d5N
	cuch9PudH8GKAb6riPIQHfSyhY8MXYiDCoFXDp09NjmoxPTAY2AzDnMXvoF9cthCi6j/XphC5M5
	oF0yH5tpFjiV1v9D1eTWrM8U8rzuegptN3DVbmyeY7aG/yFZFuXMyQ/6TUy6ejuYXFq33YhP2G3
	DLQc8MV+pLuj5UMDGkTSfBqURFFA9/dlnFeBqypx2u/MTiIR0H8C8eaa/pBxw0w7E7+BYkopsQX
	S9wIACHzF035qJwgdq/zMEm0HmZZfyJxco0ZsD2uxCIuLTEj7XtFILG/JEk/GlFIRryYI37KQs/
	YvvN4zD4pT0RWsY6QShSWBtjTFDFVMfiULPqiqkLfOs
X-Google-Smtp-Source: AGHT+IFN2t4M6Qoj3pIFSsEj3r77vKyY565/HfDPakReHx4yAtJAuSEBAgmRyjYHNwXMg0iJVqrMIw==
X-Received: by 2002:a05:600c:4f08:b0:46c:e3df:529e with SMTP id 5b1f17b1804b1-475cb03021dmr42329985e9.19.1761297687076;
        Fri, 24 Oct 2025 02:21:27 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7132:30ef:ba02:7a36:289:dc72? (2a02-8440-7132-30ef-ba02-7a36-0289-dc72.rev.sfr.net. [2a02:8440:7132:30ef:ba02:7a36:289:dc72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494b02475sm81213955e9.4.2025.10.24.02.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:21:26 -0700 (PDT)
Message-ID: <b3accac0-d02a-4b92-848c-ada62377e440@gmail.com>
Date: Fri, 24 Oct 2025 11:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] dt-bindings: memory: introduce DDR4
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
 <20250930-b4-ddr-bindings-v8-2-fe4d8c015a50@gmail.com>
 <1877f731-1599-414d-a40e-38aec05a33c0@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <1877f731-1599-414d-a40e-38aec05a33c0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_022129_389910_71BCB009 
X-CRM114-Status: GOOD (  15.34  )
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

On 10/23/25 15:21, Krzysztof Kozlowski wrote:
> On 30/09/2025 10:46, Clément Le Goffic wrote:
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
> 
> 
> If there is going to be resend, then please repeat here applicable part
> of compatible format, e.g. why it's like that.

Hi Krzysztof, ok

> 
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
>> ---
>>   .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>> new file mode 100644
>> index 000000000000..a2eb6f63c0ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
>> @@ -0,0 +1,34 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: DDR4 SDRAM compliant to JEDEC JESD79-4D
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +
>> +allOf:
>> +  - $ref: jedec,sdram-props.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,20},[0-9a-f]{2}$"
> 
> Why double ','? I would imagine last ',' to be '-':
> ddrX-YYYY,AAAA...-ZZ
> 
> Sorry if we discuss that already, but then please remind me and this
> would need addressing in commit msg.

I do not see anything against that.
I'll wait Julius's review, if any, and I will send the next version with 
this changes.

> 
>> +      - const: jedec,ddr4
> 
> 
> Best regards,
> Krzysztof


