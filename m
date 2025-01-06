Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJYv/irnbrKeOm2SO/WNaq8WLKXYN6WD2CpadmiwPYU=; b=lFh+Yno1V71tv4dluoDGr0ojlJ
	qJDrUkyXj+mhp7owFYkWY+gxtj6gpMMrLpEAzoTdYKgHix5qGdFd0L+YLviz8jpfyLd1xf6yYoeUK
	iHgzXX4wES2cMdboQDyMDvO8CBfztXKNrcQVaHNTzIwNwgNccOpAhpSg+FrvknqPHNFCsziFjCrMZ
	7nrG+lIx5nf+7Mj/qB5sLDw1VaJ6g19+sD5vW/Kqt+HL3ovsYD0s8oBLxEtKjJApxXeOI1/4SSHbw
	eqIUdde5DzHzgkKnmu+f+D1/b9p6FKGVttZk1XDL2DOXCd6hR/yDXzujuxUbFi42q8oGdHKLY1Wcr
	g6kgwn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhG2-00000000Mks-06SY;
	Mon, 06 Jan 2025 07:10:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhEp-00000000MaB-3CNZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:09:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaef00ab172so1521583766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 23:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147362; x=1736752162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJYv/irnbrKeOm2SO/WNaq8WLKXYN6WD2CpadmiwPYU=;
        b=mardYdi84SEI/9Km3pHooU5zMsx4MKljZOoG+NjEhi/xbQnXLd8byrH0m2yH03ufA6
         eKer92zprNx9KG6KY1SCrPrui+k4yWQYsTQj8a+GEWvi/LAQUQKezFqS7/IBDKA6X1c0
         r1VvZGsFJaziefrM4e5w8o2uYMZ3+K3P/2bPMrAvXlNWei+SGj8N1B3BDyeXIXWKzYKC
         oHX0nPT4PxjfC9UHc//sB9fdnyNdmyuL/r5HYvOF5JPeTn6IPCnh3x3IxyBpGUdpNIbz
         oMHbsKKEmY7B3gDGq7LX1q+pFtwXWgyN8pb0ibwDPuICStv24Ymn64PPZhTE33Gy9K3E
         7+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147362; x=1736752162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJYv/irnbrKeOm2SO/WNaq8WLKXYN6WD2CpadmiwPYU=;
        b=VyFBhqaDcgtpZvIOhWzDnHUx78jx1iUYHfl5Kgg2Jtt3v47xHV7koYVyRUB/S8v4kp
         lVBolFi+zU2wkTK6eFy3Z5+C8fFvU7eqsfrGaKMZtsJQyoNbVi5jrmQpt5HVnhmoQVN0
         i9WfHKn1FfqjbsMRk+wC0xH7sT1MLk/XNhCeGVns7Z4lS8OsQoCzXNFYmWE5EXTWtKks
         NsB6ZlsdvhMQ9QFhwQ669/EVdTRTiXep08ol5kU6fVZ5nXPsho5V64inUNwiLsmsfZlW
         zTNCUS2d4xsvJRY/s3OxFkFMIXS3CW0uZ10i5BLqmFeGP0rrNO33w6pemzI6QN+2npw6
         7ekA==
X-Forwarded-Encrypted: i=1; AJvYcCVizi1lgUyBN/7WrupaSJ+qUaoBQ4dXgmab8oObjTRF4PnamNf0WLK5m4UMAuvNEgaJJIi4mMDJBhBsJRQbzGxv@lists.infradead.org
X-Gm-Message-State: AOJu0YxKx+dLFrzwSJo2yn92g2+McIaV4Uajvsvtl9aSyOPA3UcXTvm1
	bc2obQbS7o6gDSpW7dq2uWN4cj/WnWeft7Ewsge1YA0sGQbHomFL
X-Gm-Gg: ASbGnctjKEtR/NXez0wBVkI2KeQcysCpuKlJpaibOTOxSUY7PHhQBPSGoBeHdCulnag
	Hl0nEcyXhCwJDKMKIU8Um7nQBSAQD6vTMXfo//q1w+uz2XsO3AdIWAc/LrYX3Q5vSBj4IgsNB+H
	Xv9cL+6Z7qDwNRWNNy3PfPWJHcMvGoz+In2zt2ELyvnAIp069SZQ4wq6v06FSkcq1FqId/wWdRH
	2/ovvL46z6H5NTxo+O2fPthCoqtwB7iEG38I3tNVda3Uo7KmIMlIN0NeYJrK1dU8bOLJS4=
X-Google-Smtp-Source: AGHT+IHAFiPgS7sJrwvSXFyKpUNQUtj2SLgzf5q4uaJz++G0a5zVLij+EVZ0lC9fZ58fqkFtd8u4lA==
X-Received: by 2002:a05:6402:3604:b0:5d9:d58:bcfa with SMTP id 4fb4d7f45d1cf-5d90d58c161mr32069852a12.27.1736147359958;
        Sun, 05 Jan 2025 23:09:19 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe49e2sm2216603366b.97.2025.01.05.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:09:19 -0800 (PST)
Message-ID: <8d7670fa-ff4b-430a-b188-778d3922f905@gmail.com>
Date: Mon, 6 Jan 2025 09:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <lvi72dmucagm6cxotqxmvc2yjdin3dvumivrfxjcsth2djaf54@n3i36ul3zkvl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_230923_829040_8A7C12D1 
X-CRM114-Status: GOOD (  12.22  )
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

On 1/6/25 08:24, Krzysztof Kozlowski wrote:
> On Sun, Jan 05, 2025 at 06:03:43PM +0200, Ivaylo Ivanov wrote:
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..b7c1406f3 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -9,9 +9,9 @@
>>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  
>> -#define USI_V2_NONE		0
>> -#define USI_V2_UART		1
>> -#define USI_V2_SPI		2
>> -#define USI_V2_I2C		3
>> +#define USI_MODE_NONE		0
>> +#define USI_MODE_UART		1
>> +#define USI_MODE_SPI		2
>> +#define USI_MODE_I2C		3
> This breaks ABI and does not build. You still need also:
> 	#define USI_V2_NONE 		USI_MODE_NONE
> and same for the rest.

Alright, sounds good to me. That way I shouldn't s/USI_V2/USI_MODE/g
for the other SoC device trees, right? Should I also mention with a
comment that the V2 constants are deprecated?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof
>


