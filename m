Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C3DCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=; b=aP0NVzUBPumXZ45G0Ww3CYijt2
	LXXxkeC0i4rLdJIzcV7B6t+AyJqzdhONyBww+VONuoYT1PVv3LJMJWNUChPYUkuX8JTNfhdCN24sr
	xZuOyOEGKd4XGfLjVcjzgCUUMnDAwx3sMVg2wJYjNSrV25O1BE6qg3tjPA+R1FY4VMZdzOkuK262Q
	YtPOyTfsgBLkSJIw4IzzuIR2p+lFhDwrTRRbouqhZvjFWluWM3prEVYiTOKdLQS8MJy/mLMzwKNHw
	1i8XKYgu+Y2YBq0O3sQJZbASZ2Knw9TMGMbl7v0y4nrSFkaydAvnzdlM+FJMsS/0GFl74dzB+bONd
	9XP7RJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfO9-000000014Oh-117H;
	Mon, 08 Sep 2025 17:10:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbd6-0000000HHBR-3MSd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:09:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3e2055ce7b3so2688558f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336995; x=1757941795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=xlAW6VuEsaNAG9+K/gc8FU103gmPb5ObI1dil2K3SntmYQnaWaIzxdqr38Jg2InyE4
         vD7PVPVn0ICb+utoVAdbMhYTZNrLicJ9hlvc9DJYLQb5fKBhZIg4tolhgWNglZo8geyP
         Ex3d3o6LLs3PoHmRdZDwNic6VUA4f+ut0XDa0Rl/H9przcBEQfOu0oVrWCJ/HSGeC27g
         aNw+uNniOtp6EGInOkl1gP/qBFJrvwe0zC5MXUpstupUQud9j7IOfIkMzb0h2O5y4ITF
         VWiU/PD5X8mnf7kQ8EIJ3ntNZMAgachxr78ZUYSf6jtGZa+XYbZaigPSz3C3M1lbA5SV
         hCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336995; x=1757941795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=Z4hEVvox6DfJKmgwIZulD0JcCYVHN2j2zAdksj5UKta0vJJ3ZWq2KWdBR/6hPBJXPb
         wk+XVtHTtO7+i0xEEtljAGkcutoobXhNZYT6K3vaJROQ0hmgfw3X5PmjxMFpdCU1TiBu
         4RNtYLaAq1DXzoSV2az6b+f93HziwL5dFBSyL9tt4iR/i+lpC/5JTTn+qD5QgE5pL8HA
         RlGMkLzgYodRaYLot1vsZmibivSfLaKBFOpur9IKH5bOlzTcozWdnrIXpwbqXo4Fp0ge
         QqRua4hIzhSkMah+9tSp/xxWTzQjD6OH/r0q0vuuC2JqgJbPa/neH9M7vfXXUfLsltqC
         wl9g==
X-Forwarded-Encrypted: i=1; AJvYcCVjjA4qPgphXiJI86tCRIS+ydH7s7bx/ZlBYnYBo7Be4Ey2JyRG3YpcZhF4jhozUrrTnhBnq4jKHYsxNuyJ91EN@lists.infradead.org
X-Gm-Message-State: AOJu0YypPdCcVg8Sj1evmf/ubzjza5mvt/fwf4JC4NC2jguJeYMy7Wzc
	ydI1R7Ij8Wa8rvF07zKewiX/D4ac82X6CLc5yYsA4B2BzffrBQVVwmnOl/T1z0dNH7Y=
X-Gm-Gg: ASbGncsdVkTh4wTIS1mXMxpcTz48Aj9A5I79SeW6qrTTlcqGj/b9yU9bOIoVuO49BBW
	Kp7KUxc/2X/z5+PlVg+WlLTrdibum/mqBbEdVsdSF0Nqoi1KAdyyTmVvpDp1c86K9to4sD3BYeZ
	hF4jQpvjgt5T5cnNtcEFEYzcNxnQdoi3w5hrD4jjg7Zu6XBGNb0wFe7RVa4Coxv9AM5P4KmkbC6
	7oh68E2Hfd8YlaIsGtbHcWKMWfNX50t+K0leAWxppmYkIVMwLfevyYDxm1lAN2RK74ZfGBeyiNn
	1NqOt5bHOBz3HdEM/mttHjy1YbIT9+FX5G9ihEg7eCTMTXeLLfHMheRe+hIBq/P/SMqQJrQgWzf
	GvNUjToyhnhBHTaNqswwhlgegX4KFfNTXvrgbyBPyX1A=
X-Google-Smtp-Source: AGHT+IGT3YByOFHcB6lC7G62qQvZRz06xWjMoRfPXsn5WeauTpW4Im04NQNHPZ7gXpFlsp4DKnDeXg==
X-Received: by 2002:a05:6000:2184:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e747c70e12mr2636788f8f.21.1757336995072;
        Mon, 08 Sep 2025 06:09:55 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb687fe4esm214421405e9.23.2025.09.08.06.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:09:54 -0700 (PDT)
Message-ID: <34b1ca27-8cff-496b-978f-24d2fb135c26@linaro.org>
Date: Mon, 8 Sep 2025 14:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
 <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
 <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
 <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
 <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Language: en-US
In-Reply-To: <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060956_860630_EE73A257 
X-CRM114-Status: GOOD (  10.74  )
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



On 9/8/25 11:55 AM, Tudor Ambarus wrote:
> I'll drop the sanity checks and use hws[i] instead of hws[id] so that at
> least there's no out of array accesses in case the writer really mangles
> the clock definitions.

Having the assumption that the clock IDs start form zero, are sequential
and do not have gaps makes the inclusion of
dt-bindings/clock/google,gs101-acpm.h unnecessary, so I removed that
as well in v4. The clocks are now defined solely by name in the driver.

Wanted to emphasize why the acpm-clk driver will no longer depend on the
bindings in v4 :)

