Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Tx5cPW7mZjp2byL6KcYB179kLmiMyaom1bGbtVbnFE=; b=iEbDg2K+8QvH/glFWDrsirl5UH
	Ww8k0TuATuMRaM8KeC2YkAa90xW+uKtFrOX9O1ghu4OzqnYwIvERDM3991srhxscY0Yiq0NSwGf6b
	Z6TFMH67WwFcjrKv4x2eymFEjvNxg2SLrVi9IN+U7Ovg+P7KbH5YfWTLkIIEz72GoOwnWnk2xXSYj
	xL2dKo1A6LV+nL7Gxa9ATA9hBDdjaNIvi2WRLPzc9eumtC7Usv34zz+uQ+EFtrnyT0KIjJmEalkcu
	nkxyo2imXUmoK7jSB6Ei5171Q96/kK+5WMVJywpODIQp81pe15R+weCoPvthcRCUdFTDRsco7VeND
	EynkUzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoxe-00000009sGJ-15RU;
	Tue, 14 Jan 2025 22:00:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXowL-00000009s1A-0VXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:59:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso10629566a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 13:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891951; x=1737496751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Tx5cPW7mZjp2byL6KcYB179kLmiMyaom1bGbtVbnFE=;
        b=Lg3Hh45CfDfaoT7PcTdLqck0B8HfPrvDY3l2bUDZhf0a+ZUN7H9rhxGzimXQqi9dYr
         V0U7epRvfaK3qSvLEtZYQLNYL9OXRzbFLLdV8saoFTDd7hGDkEWe2nKw5UYJj3If6Vh1
         sxJ5s5Qri9IfYqDjKkhvwo6BFwwOSkOAkxSTeshV/EFpPUuNPqL8sDFeVIbrCGTK32qb
         G5EbSBUHKx65YmpOtz+AGnTTDYf9/PzVppivItzOT2IIpFU8B4zIouGoiGWVIxVRNVLF
         pCAE1giKnzgQ2EfNok7gRXP4EyVjMaaNkJTWjCOYGoRwraOyUFuP0JDSoMWN6D+LSekb
         NggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891951; x=1737496751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Tx5cPW7mZjp2byL6KcYB179kLmiMyaom1bGbtVbnFE=;
        b=PyY+tzBiGToLyfRqkZcJG86e/qVUidVBkNQFx/kPguR19dnG7KVs0zttCVEarIAHHZ
         LsApawQlrjHfjIc+vtklQljnNOLekDcV8WuKkrNa4uVlaNvaIFDNf95aD/5nKxtDYzrt
         OnqaskuyrhJDRm3dmJwG4C0Up6M4lTJKB2BYpOLsZ0OHsPuClptFJBLWdON2q8AhhKxX
         XcHSS/7Dmf8fTcXG+bosMbPCI2DlZy7Yux/xVNL5wfv6XWjYdlFvT665TEpL3k5HUEXs
         +dEnTLD0Uv4KmGjyDbB63yZQQTGq+lzSjKC3vvMHayfpX0hEyhEV7J14UlFWfLEVDT2F
         A8rA==
X-Forwarded-Encrypted: i=1; AJvYcCV9rtFQLMJCoBdjavtI++fDmndhlYMdOOFqQ2+leDopTAF0bPoO9DZt2jRPkkHiAhK9/Mq5QPOddXKwLfPjeXni@lists.infradead.org
X-Gm-Message-State: AOJu0YxD5YYan4dzikGgtW07XuZJcdlKZHlB4ps7Vs70wbdW5npcvfdQ
	qXacvZEjE+fY99bPT97C4Es4Y1oM8LKsflXyK0Oz+CykB4lilpfU
X-Gm-Gg: ASbGnctGot7mCHKh1NWjRTJHReGx0KsAOqkAP79/q036EjBXV6FDEAPVVXSkcaX2rKH
	3zBoIiKx12dNCXA07glcHGrM+ReHPEkYedxzIwOjsGKySUpQZY5kO7k8EQy/Tp3aGf8YlIQUpCR
	mMvO//AYNbqtIwxUNPquK1IculgG/CuZZs9HOvYMcFIJ59JXAiJXz+QkG3yoRd8NDMQxzIjT6FA
	pIUqgE3Kmo2hhbX+qjywG1RPBDfgMSQKZQc/wbtFf4qJ/aNo6DN0eUUg7OHrr99qQYb2cBartoI
	5RuyO1ogP+FsxuI4EltWd0zZE0+c499W5fU=
X-Google-Smtp-Source: AGHT+IHTUgwmvI+n/QJgpjA7ic8+1DMhG5ovcobNcW2aiVFDny7CFv7UZWlT2Bj1wOcE+v17sCID0w==
X-Received: by 2002:a05:6402:430c:b0:5d3:e45d:ba7c with SMTP id 4fb4d7f45d1cf-5d972e7148bmr24049816a12.29.1736891951312;
        Tue, 14 Jan 2025 13:59:11 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c469sm6729176a12.5.2025.01.14.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 13:59:10 -0800 (PST)
Message-ID: <23d2ca03-5578-457c-ad80-778ac4347c04@gmail.com>
Date: Tue, 14 Jan 2025 23:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring
 the ip
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
 <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
 <26aa96ba-36e4-400c-a982-48344f2096e4@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <26aa96ba-36e4-400c-a982-48344f2096e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_135913_171186_8227DB06 
X-CRM114-Status: GOOD (  12.76  )
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

On 1/14/25 19:59, Krzysztof Kozlowski wrote:
> On 09/01/2025 10:03, Ivaylo Ivanov wrote:
>>  static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
>>  {
>>  	int ret;
>> @@ -251,6 +268,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
>>  			return PTR_ERR(usi->regs);
>>  	}
>>  
>> +	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
>> +	if (ret)
>> +		return ret;
> You should not reverse the action before the action actually takes place.
>
>> +
>>  	ret = exynos_usi_configure(usi);
>>  	if (ret)
>>  		return ret;
> Registering cleanup should therefore happen here.

Alright, will fix. I'll try to submit the next (and hopefully final, if that's
all the critique you have) version in the following days, but I'm currently
focused on working on exynos2200.

Best regards,
Ivaylo

>
>
> Best regards,
> Krzysztof


