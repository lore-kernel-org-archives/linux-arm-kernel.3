Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fNSVLxNPQugL0ES7waBpDq4dtC/RLAEiprTcVXkijo=; b=aqwJSQKU1BjnQe6PYYn3zqp62U
	nfOQSiPPUxroEvzDocSCojP1I8eqd+QltxFYCtqnRkE6V3YSY3lwGO7JfeOkLXMnJ9fULijcH88lg
	Z3L7VfxNphaW8mP/Ca06gnzQFvT/mNpoL55ny5dRQcjPS1kFPvUuR2HaTcg+lzuT3QOUzJHx3ouvG
	KMg30qM1I5CG/yNdMPV9U83js5eP0EsFyu1QhCJ60VYm9iuSvYMn0kntFOVyF27C8FlFs3bT1qlwM
	gFNTDkzrCu9d6SNeXLZRajIZhFhh5wNp4eJc5e2CkNjucNpobnjRuqWe6br6JCQ4bRhAwYBzw4MkI
	mMYwg/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCf9-00000002rIt-49Kv;
	Wed, 26 Feb 2025 08:21:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCQ8-00000002oG8-1ULw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:05:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so1307720a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740557131; x=1741161931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/fNSVLxNPQugL0ES7waBpDq4dtC/RLAEiprTcVXkijo=;
        b=EkMJeSSECfcZmHRcRHDnRkRKQX3hXaDuRGRanuscHmNXe+zKPhI0xkEW6Q4MoJijW3
         9brCfhaUrHFWE5CTzdXB64FWIIWZ6TStblN9ZL0clPSQl6Dz9sDiT5JaGFfh9pEhOSEa
         9qFK14ZujQBWcwYbchoG08EC7t6bCul0e2uQvzA6Ya4tnhKuGDdPP3vbkLWpTfGrhvQx
         VAGuqQVilWtvL+7IvoNiewQ+zzbf5YzUAI6OTHkD7Qyc/2BLHv2Esg2TXAIbMKMWpmjy
         F6CTVbCktQ72psG1LEY9VWUfnzRaxZzy7S2L4irr76rJBEyioeDbv0/DluGQduVgFIeu
         vjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557131; x=1741161931;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fNSVLxNPQugL0ES7waBpDq4dtC/RLAEiprTcVXkijo=;
        b=ltOj12HLJqh2jJ8pdxbQlNZDikVJWURbnxprOMB31f6U6idcpKv68sgCYCDN+iFQ9h
         Cj60xWKWqowe/2Olxm5GUcGpJv7zwzc8L483dgWoKHHR3AH4ebh765Bb5KYVZRDhO3R1
         JfomJY6l0r8Ol9Qe4K9k7shhDxSIo2a24nVBRN4i8ERqS54dDnPvr4qjpKbBCKrMGI0x
         KjzGsjWMJs6in2uO5Q954mmhsV/crlkmlWf3fhMnxPjqrlRg+27SOY+P7jrsvSUEgKbJ
         P4O7IZPlBLV7UJ6wPaJ1J3t6but2V6Uvjo1geikRnQn+i7cgpl3XsuTpGzqOymmE/ODh
         kMow==
X-Forwarded-Encrypted: i=1; AJvYcCVXtpsgtzHSHqD+cyLS/LmXO2BTsMBZQ8SA1Pplx7YauF031bxrNg7cggrFv5ozICZCsejwDlC24gwCmTPXAg2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6n9V9zXyDWYi3L0ETAareSXt/3xyTahoV7tCEZrFnssbHPBaQ
	LLvajEjzwDaWGHNlHJ1Rb/IuwCJm4zW1NirY649pNZwLFMWSH6tW4FFaz42D+n4=
X-Gm-Gg: ASbGnctcEInnrOL5Mm4YZV8LxxalmRMxMQU6qlyKo4Ew0Pp5v/tioJyUXryZTq1/Y2d
	cnGvyCyu6wW1XK8LCeijfnx2LoxKSxAPO7XYXSU64cNAClpSbJhAp7mWTdgLLximJo/UDHVE+Qy
	8gGhMPEZ8KZta0TomZQlOSDyjEOzqNqqC/G6BhWBJVRt2g0T7ikdVe1f4SoHsAVT182QZlDx9xk
	kgYlp7GsMZFzKEck+Y3GQ0RWTSwjKK31Yvi4wuWj7Zcci/x6D4YN3IWNO5IF/z/YXATqPFdk9jY
	Hhp7bl6j4IOmrIAKEDNx0XiaCPepi8sJ3Z8jiJhtNCiPY8lflI/QKu7QdmmugZkvSoYiqKnAOjq
	489SC
X-Google-Smtp-Source: AGHT+IG4qnaOheyCv+MJeqWkx95kCVAptbbXw3G1prGoJ72puTltPsXq/tHJz74Jkg/PWIJbFTsKHQ==
X-Received: by 2002:a17:907:7e90:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abc09becfd6mr702503966b.9.1740557130759;
        Wed, 26 Feb 2025 00:05:30 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20b6024sm279976866b.181.2025.02.26.00.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 00:05:30 -0800 (PST)
Message-ID: <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
Date: Wed, 26 Feb 2025 09:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable HSR driver
To: "Malladi, Meghana" <m-malladi@ti.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: quic_bjorande@quicinc.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srk@ti.com, "Anwar, Md Danish" <danishanwar@ti.com>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_000532_405798_4E616492 
X-CRM114-Status: GOOD (  10.44  )
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

On 26/02/2025 07:18, Malladi, Meghana wrote:
> Hi all,
> 
> Apologies in case you are receiving this email for the second time.
> Any reason why this patch hasn't been merged yet. Other than re-basing 
> this to the tip, anything else which needs to be addressed to get this 
> merged?

I don't think you sent it to your platform maintainers, so no one would
apply it. Usually people ignore emails they did not receive, although I
am here an exception tracking missing-DT-patchwork things... :)

Best regards,
Krzysztof

