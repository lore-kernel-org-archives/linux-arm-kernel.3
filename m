Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80589C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=; b=hWfohSeG3tFq+94+A7WMJgtLRp
	FFN5UK+h6sW/wKdoPiyIy+v1L1dgbY24iEBx8XzHqt5G3DECsKwyZ1U9Xd002htqii0IPghLH83PH
	E0mkNWhAAzsfN7Aa2dFTOAwq4jzvQ8LYbj6DpFvgfd27rvL6ttRCTg8T+CsRTEu+4ojEyEWZQcme2
	J4d5XRSYUjlRQkZ6eV8if/uj3F+f4lFqK4PZNX5aJjbrdoIR3dFrHkiIBbB1oCj/Nd+gszvS9bqza
	RjBcqan2wS99dkce1+CpGFFXNWcBg6yHqzGpFEPmdle3yAhtVkLSIIb7jQ9elYlgFnAvqVCsKv7PF
	lOKNg3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghAv-0000000CJLm-0DKq;
	Mon, 06 Jul 2026 11:07:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghAs-0000000CJKK-1PYD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:07:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso19989195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783336060; x=1783940860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=hcQAGws2hndZj4mz5fQ4jl2Gms0xtBDs0QPN0Jd3cqmns0apmMbdapt6EooqMPv7JJ
         NzVAh++PimTjj3+FNns1m5xoGU8BNvyyvBGF/KxlfQs4szs8p+MXMdQDRKStivw5L8o6
         1n9cjtTdp9mE8LkRq85Xk6ykJEZitt4CdC7NttEm4EhRufko6/qMo0mcmJshH76FDEbX
         VwnEssD+mMfQ+vFeYeFnSBRa7zpq+MVnSnan0agGqEWI8Ql8suEYPrbYU2Jcz2+i9ug8
         btflA0JyVsbLlEiWgB3pVB/iEgRWZE9wCXehY+/4p/ZWul83kAntYn8NdE9db9MxnotK
         SCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336060; x=1783940860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=inwYBzof9AEbB+tTD32s0cR/rREDG0N+jt7gk3KzfUtVNMOQjbsH9JAX5fp6XsJqHA
         Z/IDFeWaXs0alFwLpnePcuR337gvScPzVswY268z8qUW3rgjQjCjnzzUoDAfvW4XaDpo
         6r7KEfVv2jjJKRBIEFV01mZ2zsd5UCR2ldHqf97Q6QmgkI5SQ01Fwd7OKzCCTsebNKJC
         M1yAcD2plETJFPgdUUOKbP0v2Z7GVZh131FWbZQ/NF5y0k4wkgFSubILquORGaumFu5V
         yTezvyTeZx5Tc8veFZG8LuH6C2OFgSGEVE9QANQVY+HVf01pmkLgppEAL/d7SilxYBHo
         nzaA==
X-Forwarded-Encrypted: i=1; AHgh+RqXjViF8K7/LF0Goge/PvxtQucJBhSSCTBtFOZWSWEN0duHHWmJH/xFOTd97/ELqQSGlTss+PbRiFgv6ZoG0o52@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2s8s1vTXDuzY75DngCNC7V0zgBVlgb3AZKNg1MVIsYjTHeGGh
	KNuPS9lZPdzW/lyWpRikDCewP53vXtnu1ui58S1Svk0i2AkbQ98/Vrc=
X-Gm-Gg: AfdE7clpvM7rO4clXp/JaG5DfTFy4wh5OjPvev0+DQ3Jrd+cYyNcaplwZsAF4TJ6RUa
	y53ruMi86DSDhLSTNRPlSGahOu3Haa3iWDmUr9sfEPYDwbl5+/O03yL+oRILAVfBN7e5l/x4d4q
	VSXq9JYRiebz8vzVj1sBa9EbKqzKeNb9dEmw9AhqS0gCQ9jv8rTm8gTf6LfXRhjTFenW4vMtjeV
	UsXFi/z2Sr7d0n0n1AVSKHEQjMHe3qo+bD72ZVeINQ2FstVlGWefd8XGjtE8GDQyaikfV9Gu0Jj
	fN2zOWJyAsjFWxZONkgh1dwtQyrpxa2Z3qBbYtnu6LGRTnrsZQ0gKM+6IgXnSnBRZROq2ZZ/FgZ
	C8gsepSasIvR7OrJFIwCRRRODcRExQeQrVQL+VLhS8DakbqKStMJBHFj2W+rKqER6VEyYNCJENQ
	8S/+54yaZXQFbKKjjOitltIL8el/av1g7mtcsntimiIhbBB5drgid4eyxhBw4Fa1IuHnRoRg==
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr90419125e9.5.1783336060307;
        Mon, 06 Jul 2026 04:07:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm463102745e9.13.2026.07.06.04.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:39 -0700 (PDT)
Message-ID: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Date: Mon, 6 Jul 2026 13:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040742_405053_A529A27B 
X-CRM114-Status: GOOD (  15.16  )
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

On 7/6/26 10:44 AM, Konrad Dybcio wrote:
> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>> Program all the register needed to start up LPAC and send initialization
>> sequence.
>>
>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
> I believe some/all of these writes need to be guarded by if (has_lpac),
> as many GPUs lack these registers and there may be side effects on
> others

That's correct yeah. I'm not sure what has_lpac should be though.

Something we add to catalog? Or checking if it is a gen that has LPAC?

>
>
> [...]
>
>>   		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>> -						      sizeof(u32) * gpu->nr_rings,
>> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
> Should we rename nr_rings to something like nr_XXX_rings
> where XXX is some uarch-generic (i.e. not SQE because we also
> support pre-a6xx) name for the main number cruncher?
Qualcom calls it GC so nr_gc_rings perhaps?
>
> Konrad


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


