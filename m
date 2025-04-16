Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3FC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg4oqpJxNbQphE8w3P09Er5v6v1HmNB/fe4vd0yZ3wY=; b=wHydEuJNlj7WvvZEZhEmDEh1DT
	ukBGquQZXIs1aet86eKinufGsnehnawWbOy0Ur50nCWCPZeKaVv6Xzrt/4ePJU5gfN/9HuDPfWkMa
	ZS38Q6U1uOajElWX4VRKX964GAcD2ZTs2Br+Cc2QJgQj5EG3BzCcyEECekvmM9XH3A6DGsO0iRabo
	T+h7xfNYgXs08IxrsRrzmf/ClqL8YcUCEWe0qqfpvkLC1qrLGcujm93obtLcfQEGxLEsfNyEAU7H4
	nsV4ysaWNAqeDDi9HIAPNzDZhivxmnkzsy4mTJpKBXP18OjhWtb+qbtLiPZGiXj2Qi4/lRKxRLNgS
	LGJr/4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xNb-00000008eyI-01ax;
	Wed, 16 Apr 2025 07:40:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xLP-00000008eQf-3RpX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:38:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7098af6fdso118134066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789082; x=1745393882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg4oqpJxNbQphE8w3P09Er5v6v1HmNB/fe4vd0yZ3wY=;
        b=hMrKoyFzXLk85zL0Z/ml0Zf3n4Jh55nH/C0WGnsIj6vJQ/TPYvRPC0EGNMpLQxm94B
         3mIa0VKpCPyalZ2NWR5x5B2xPphdT4FWDazzcavOZqHTKhdHbmo4javg8occiGM5qPeU
         t+644hBpT4WW+iOg42aWvGaDbXv1cLesvtWT4genrxBS/SETLofl9cszB1SjsfOFjN65
         z2Flk8Sx1MCIEJhkRZwWCRSr1uTFAnKPLjJHgOMjAXaBVCNvzi3EFhZdWrMjc+W1sQpb
         Slh6QvVWqsBut3kSZ+QEB4/3bxbjKiXkwhzNnRfoo4EF/clKxXOfFyRgPZ+UwvHu0d+J
         lc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789082; x=1745393882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg4oqpJxNbQphE8w3P09Er5v6v1HmNB/fe4vd0yZ3wY=;
        b=vK7ZrcKMAKePYnL1dQ45pQRh3GZvmioF6cYizAlW3khT8vryAlqWtLvqwin+NTCApE
         EVngYJDPgKSp2uYtMPW7e0aZWztjR9fp/vwVH0guNHd3ObiFxr6BF4ta9zvd/6xy/A1i
         YP4N9Vs6E4dfc0G8Fiu/rQcdYw7iOASg64zIsMrE2jj2673OasLdK93GV05bIsYVQFYu
         tOJkgNqcmBbCTcARAaHaE00MA9rjWw00SjUx056VZcVBYGGlz/9cWKX0OD2UnuyRfuMT
         Zp5Dwyy2YsHWTMQ/7xRhlGuVQ49izq4lFVrgJ2dLFL4/II9HltvtSC5ziiPaB3zyXnEX
         42Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUA5d+/mvLJFn86pIRe8OFATi9vaPsMWIX+M5i7f7cv28ueYsb9pwy/pKiNgMylpDPSCs5x9NAbPvN3gtUcUNKP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Yq5x+gjKG8hQCkENLaTgj+HDV+97o5Erp6w8VS+9b/YS4gU8
	D+jHD7s/tL0c6uSFbpxm6bom38LonAPqkeIvutG6Yqr+LZQwxijd9fitMA0hus8=
X-Gm-Gg: ASbGnctM7LNno4zKI32xUmgxvXlCIKK6uQkcSjigrM/JNfBPmeYs7wI3EOhXNG0Jfa2
	b9j1bQ16jCu2a8PFUb2cqIllkvVLLliQwMy0zGaTu/T6EMUzDerxiGv1uBuBCyxcxPhYXNKV8Xe
	MgPFH7cKuWlE+zzQwgwyHiHQsH+IcuSw8qnc00eotmkzbR+ZtdEjydUBvZWP7ROaADvn7nm3gSf
	qVXkGFiotQMXrdHsYquoC8vDwXQzvRjZxobc6Me7dKnUrcNlM8e2cod7B+jHTeVH7oFymF//euk
	7CHnLErfQYP4gmhi+26QoLgiIVYIPHKFCgVfQAeUgC9X+Knjk1q3PobXVruLKImGjCuaWUqO4eb
	/X/jAXyDKO0ZRaYA=
X-Google-Smtp-Source: AGHT+IFCwzD1uLGHlpgBLDXgOr28Wi28CRrVeE8s5ucDmzLKsmEThGiTFjedg4pD9VW4nX/azD+msA==
X-Received: by 2002:a17:907:2da5:b0:ac3:f6c9:4856 with SMTP id a640c23a62f3a-acb42573791mr22447266b.0.1744789081517;
        Wed, 16 Apr 2025 00:38:01 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm75397066b.32.2025.04.16.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:38:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varada Pavani <v.pavani@samsung.com>
Cc: gost.dev@samsung.com
In-Reply-To: <20250307092403.19742-1-v.pavani@samsung.com>
References: <CGME20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203@epcas5p1.samsung.com>
 <20250307092403.19742-1-v.pavani@samsung.com>
Subject: Re: [PATCH v3] clk: samsung: Use samsung CCF common function
Message-Id: <174478907989.19245.4738835908469009809.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:37:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_003803_864645_FC36AC2A 
X-CRM114-Status: UNSURE (   5.22  )
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


On Fri, 07 Mar 2025 14:54:03 +0530, Varada Pavani wrote:
> Use samsung CCF function which registers multiple clock providers using
> single function call samsung_cmu_register_clocks().
> 
> 

Applied, thanks!

[1/1] clk: samsung: Use samsung CCF common function
      https://git.kernel.org/krzk/linux/c/62120d819f5b5818fa07d3121f7693f6bf18d18b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


