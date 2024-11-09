Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63BAD5E376
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HFu6d4lO7rqvd9CtGtNgYr/2KPNT3OuXCo4vOZrFRY=; b=VdsGvKsRa1QaHyTYUms2XuMDda
	D2KQCUjtoT6LBMjkxjyihocfINI1XGd1qEGBbaKix1RhtlzFR0i9n+Fqaa8ME7hgSWYOREyKJ1x8r
	Y7smMxDO1H0h9jHpzC7luKzk3DVmY2al0fbcvvCv0EpP854va3OLAUuYP2wEe5mOwb4JJRE2v1WYY
	wnOSa+KDKrtb0Aa9IK0/98zc9D0z55NomMvmLMy/0RnrLqtZUOfnYqfx3RGPU+MaSusc2AFSMOgQ7
	izoCxY4t9DBOMf1lCip0NINIbv5HF7y1JamK0qj4eRWQcoFhfiNi8HajxYscJxD68Z4MfYPD0Oucj
	2PPP5Xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oO3-0000000DeEK-15cD;
	Sat, 09 Nov 2024 16:32:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oMI-0000000De5q-0Q2L;
	Sat, 09 Nov 2024 16:30:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cbcd71012so37616925ad.3;
        Sat, 09 Nov 2024 08:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731169845; x=1731774645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HFu6d4lO7rqvd9CtGtNgYr/2KPNT3OuXCo4vOZrFRY=;
        b=du9SAHPH2RjDJRJfW2MDlqnRWFvOx9jR1kTRW4G4vnWvrEb1ATHTmXtysISyDC1SiB
         +65wx0zg4S7+olzFGQDuKSoyDCcJ4tRW23c1/FBIJzua6wulHJe05ucozEuuCXzrH1yC
         N5zai3J/GCLnCjQxmkBwgB9Y/6XEo0umrOTAJOG84fDx0WsZIdCGedK6shOiNik5ciXZ
         8aURaWcKanbCQeYkvu5Bvso6AnvnmgY1Mh6ABubVObrJBDy44CLXRFdMuihey8cnZEl9
         HIp+rQhDudD67JjqxaLJNvvZO+nlBaPglgEoCJUM6HcN6iV1b4w2/OJt1waxf42RLUat
         C9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731169845; x=1731774645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HFu6d4lO7rqvd9CtGtNgYr/2KPNT3OuXCo4vOZrFRY=;
        b=d8KnNiTgqbwNQJxpBFjEUdDsdR20+kGUNQx/DDjyXcv2gRJxyddg1/vBJbmpzoyhDc
         1z5AUNEPM9cWKN75nPEn+gBMfsPe2sroiikNk3LiC8Nn0n35aSp8X7TROiqt1Q3zFH2j
         xgZnZc7ygcCbz77v8jmcaEQYUDIgZLwIKkC6AKYl7+7Jl104jiWF0S4gPS2YWt0zktMM
         6WIB/OUQgplKAl/2EITBHGaAEW5k77LmzaRynmORxR1M89fTILsYw7FCTIhAcVl+Dp3R
         svWP/dCWOJC0GcRnRWxXCXVfge2gw1xthUAjk0rpA/97bTjIoBw4fcZWabQf3zC/D/EN
         dCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUFJgxQizFVS0vEmBSlS3gr5Kn34U4v2w6oa+TvjAWoM7u6XvhnjyHJaXXyBzn1KJW75ktXAay3bWVm40a+qB99@lists.infradead.org, AJvYcCXly+7OBxv5rh/uE9xUAHJI3lwewfpFg69vgJPqRaUR8OF4y3pUqtlzjMT5Vqn+YDs2VPtWpyEP/vrByscJWEY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy07EqgnsmA8JK+MbJQM2SL24rikZe0B79RNdF3nAIHd9mK5X83
	ABLjb/uxO4NZd79nlsrkJ7cJg1hLsnUeD3mdBWJHr9OI1C2EK/2Q
X-Google-Smtp-Source: AGHT+IGGs2S0yCDvHRz6lhphL26+ZgfU8grAgZs942pwHOPtldd6rtgtD1s1xn3JASfB0aCkY4pxLg==
X-Received: by 2002:a17:902:ea10:b0:210:fce4:11db with SMTP id d9443c01a7336-21183517ca8mr100546255ad.22.1731169844727;
        Sat, 09 Nov 2024 08:30:44 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6a3f4sm47858475ad.234.2024.11.09.08.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 08:30:43 -0800 (PST)
Message-ID: <3be2547e-d987-4987-9d75-30bf81cfe6cd@gmail.com>
Date: Sat, 9 Nov 2024 08:30:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org
References: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_083046_164225_0F748E97 
X-CRM114-Status: UNSURE (   9.40  )
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



On 11/7/2024 6:57 AM, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/memory to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> A few white space changes are included to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

For the brcmstb driver:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


