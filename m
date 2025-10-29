Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A65CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y7IaEKl9ZSpE7jjzq1dSeS8kFbTxAEVZQkW1AF3jcE=; b=htpDx7Q4cDCU4+0aVCCiSYQv6t
	mMMvSorAMv7Uj+aMurASdQVkg02fkU21JO/M6OnPLxhPrLW0xxubd7J6io4nANIA+lacS4AKkK16t
	M4BLN9KzTSFtzPrNUWQkgQQEfySSodrC29h1k5/soj2/N9UkNA1KP7YgQ4tn9TBmzZpoNK0HN3lw6
	S9NsghWK5uGbewDmPViR5wnvosFRj18wNbV/aHMiFWN6L1jqpomB9tg+lKOLZb78Wta9apy0LcSLk
	ZX7/oanv8DWeTM6+nZvvScEd6vhs4yiUXnqXf0pJUJ1T25ZP5xp5Krvr9K87jDuES6LTAdcfKcJ5+
	4nrdhQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7ST-00000001eCw-12Ax;
	Wed, 29 Oct 2025 14:47:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7SN-00000001eAx-1ZZ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:47:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so4603616a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761749241; x=1762354041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8y7IaEKl9ZSpE7jjzq1dSeS8kFbTxAEVZQkW1AF3jcE=;
        b=a9R60LO7/OtlO1VAJl39K/OUfcq1XaonMgKrVQdQwiupYbSmDTdDXIi8u2jo85kcjj
         2Qp3dHRSoTEXg9H2T7rwnupVoSjSU6XdCPSZ8+C89fYT2VxbM3277vyTFei/7KSb57Yl
         h+nnmpeLp8zMXxSAQH2aSj8Wa2f6N2orxMOWIhUSthlGE3e6A90AQOBQ+OGYWgjab5UE
         8RzOoPJ2sppjAuXgt4LclAAeRihnyYTwiQeZe6HHN9ZtHDlad1q07E/98/Q69TU9tiKc
         WxQs47CbTYBC/68OrSKY0bS7bpuVpdjh7PtrbjN7etQqWUpf3pBdtNC8832GAAh1YZs/
         jsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749241; x=1762354041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7IaEKl9ZSpE7jjzq1dSeS8kFbTxAEVZQkW1AF3jcE=;
        b=ve2mhXsenvTgy5KSDTajilSpR+gUIsj2N2Hlz7rW+3sQigJfY2OB9R7hM6aYl2WVyz
         lq7/yRtcDhyuZy4SewlJtiwyGTZnyzWj+fDAJea+W3noUiE8qYLa5pvr64rgvSDs60hm
         FSyTyWWIrvY3/Ab9oyxYKk6xSr5q4mD1NEMKuaoJbEm/tsZ7vZC6NLp9bIF2YxGCn6kg
         laX/InYY7DAVQpxb1HFllxo8yQTI9JpLfbcvhaoP4OibHJrPIt4TlfkDhjChNdnGEqdp
         HLH+RpZH3avOzQiwkON7QarkAQCK7xX2GAbuLVvA/SqY6QxeXOIQHM1TolCp0OST7jai
         SuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKTNrgIAk3GOkkzPssNV/1yFLWm3OfEVq556AT29JofIXLUoRATOtScLlIBAWUml5Yzj1jq9I0g6MMOkObl0hr@lists.infradead.org
X-Gm-Message-State: AOJu0YyYNMwJAmTzNGRpmaTpRk7KZK1Lz+0eeLBdZ+jweWYc/btFYQUy
	vpr+g6XGvB2Mcv1TsYGDAVyi7j+JyGypaRW2OMnb/FUUDCwTHUW9hLCo
X-Gm-Gg: ASbGncufSO+8rPzn5YNFmeV5AxwdJN3rJ6Sp+UNcbPiQBvclji5b5sVP6YdEb1pOjWl
	qx9avy43p+dY4akL6gt4tG46I/6JZy+zcZfcKSaonjVSqeYC9U5cYUxI0WwrICu8nhCM19yiplv
	gE5ka4RvuLq/Y4O8tMgMFEhsGIDxNCrjBiq2L/KNF9FuxtFF9DGzAE6CoeOp9nwf7xVtZIgbN8T
	/r5+pBOLw0lKT1L8OzgyggTVuiyfNxeDlqTQE5qrgdTZQefiEbXVdbscVUQf05oOBA2t5tJ46Xl
	6AdIzf1Dqfj6WjK7PbRvq3psHAGeCOi1glZ71nzQpVOj40OjQseWEOd8ZVaIh474bdnORuYekMo
	sJ4tOALp1hIPncGe/KOJW2Q86mkMsYom9lcnPoNwGtpK2TMW+44x16sdDW4ngYHN/91NUbPG5df
	5icBakcapf+smAIrS9Ifz38D4e8VpN4c3T
X-Google-Smtp-Source: AGHT+IHgORKDGPw+ITEWuAutZRKq+hGzvmS0B08lzp6+SYDYojWyhecKTsUlp7KruwEoQhiFvx9elA==
X-Received: by 2002:a05:6402:5207:b0:639:c9c2:3956 with SMTP id 4fb4d7f45d1cf-640442692d9mr2330509a12.28.1761749241215;
        Wed, 29 Oct 2025 07:47:21 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef9a5cbsm12168527a12.23.2025.10.29.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:47:20 -0700 (PDT)
Message-ID: <20a3325e-d8be-4a1d-890d-bf112d170bcc@gmail.com>
Date: Wed, 29 Oct 2025 07:47:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
 <20250821105634.1893-3-laurentiumihalcea111@gmail.com>
 <e25494da-9d27-4416-ac79-317c8b9a6653@kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <e25494da-9d27-4416-ac79-317c8b9a6653@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_074723_432532_248AE0DA 
X-CRM114-Status: GOOD (  24.34  )
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


On 8/24/2025 4:29 AM, Krzysztof Kozlowski wrote:
> On 21/08/2025 12:56, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Where did it happen?


https://lore.kernel.org/lkml/Z+xY4wZ8ZFSOJhGS@lizhi-Precision-Tower-5810/ <https://lore.kernel.org/lkml/Z+xY4wZ8ZFSOJhGS@lizhi-Precision-Tower-5810/>


>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index bb24dba7338e..b62bb821cf61 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1396,12 +1396,14 @@ eqos: ethernet@30bf0000 {
>>  			};
>>  		};
>>  
>> -		aips5: bus@30c00000 {
>> -			compatible = "fsl,aips-bus", "simple-bus";
>
> This breaks all the users. I understood explanation as "it is better",
> no real reasons.


sorry, a rather poor choice of wording on my part....


the reason we're doing this change is because we need to configure the bridge's

security-related registers. If we don't, masters such as the DSP core won't be able to

access the peripherals connected to this bridge after the AUDIOMIX PD is turned off

and then on. The configuration needs to be done before any of the masters attempt to

perform transactions to the peripherals.


yes, this change is not ideal and we've had problems caused by this

(see https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/ <https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/>)

so if you have any suggestions that would be much appreciated.


>
> No, you cannot do that.
>
> Best regards,
> Krzysztof

