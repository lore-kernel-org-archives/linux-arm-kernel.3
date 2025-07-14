Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=; b=TawWfXLfr9Ci5jtSAZ20vny9Jr
	iOOyTl6A2ETcAxXIrTv+UWdtAQSupAWUZqyuXfHknEfWrXf/gmYx/yuJZ13pIilznDuMLkBhgiPis
	Cg72Lu5uQ2ecauZrxiN1HObMaJDmMJda7+co/XYSsO/XCiXD7eKHt6NT7nBLpTgqfgRW94HiLIVd0
	dPqEwlbAt01Z0boOu4k1zb66ZrJ/ULuMgDbS3/gU8sXu8XYsEJ8uDDLTEiD5US7XlWoZqf8mjsnB1
	v+Drpgkpgc3wf0oXmzqMF0CwxdOwmnK0P+FEF9HDn3xtlPoflFvFEfZY2OOyjq+icRJssZMlAFIMi
	RInOMUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN2K-00000002y4S-0Dsq;
	Mon, 14 Jul 2025 17:32:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLFa-00000002hte-2L1s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:37:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23dea2e01e4so47722225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507473; x=1753112273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=;
        b=mlBIj7Kh+aVoowBtQ2X9YWfwuKmsQoQSkXvO1f17/8NT5g2WmzIU6HXlh4ePZrgRuB
         uatS7CnuxhqDBT2fvE2Wlx44JJFL929GekH6R96U3namtV4aWN2dIsAgF3+BKF4G7Z09
         FMv+SaTOY5AU4pesyjntevTiFV3jUgVm3zkAfPyxIBztGo57DeqCqzf8WAD1l0tqUKnk
         nRFjpWcBRxN0aXnVnJw391eEr5zg3xmpiiwPBSweZM+AOfBVgglbciV6LjZLdAbeJGWp
         qVtVOcpuKaZezRpmdKqgRITYYS71KJBCDpPRcg5EFtXFezMIcqP6pITOlUUj+QFTI63a
         KkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507473; x=1753112273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjQ0UWlscOYrLTxqfo8jeI2W2cZqq+DP0CdXTDyGEcE=;
        b=i2DuwCQGR7B8WuU0Bc4X/mup1fkrjNkhioOqNfcjrQ3evvcRoPJ9xRnoObcGB8dqyI
         78+ocAWOrKKf7iD67Df/LjUyX7O000jjErLjfgs4iYtBZviKzBdERsu0QBjK8GaR9+bp
         QSTs4URdbbp8hhKahCGXIdJriDkOMw726GRXu3AyDzLcWl4I6U9rYskkcJXx+jNOauvR
         Q6S0R6g35pJKDwTW40Dta/mf3xYm1n29zGZJ8V1l5tPMMD++cCx1EMqjVIQ4lA/EOFBa
         tQlATYvIY5xLgUbrCpUYLlXUbr7S6CtBDARZdBgxC4IHvm2kAY5fdFVnb6f7o84oXTlm
         4IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNaf6L7e/sJOvZPaEIYfAAJU9trbJyba8CKgQi2gLungNdFUlIRox1rJSOlQ50dgTH1e8sHNFtHt5hnCud9IFl@lists.infradead.org
X-Gm-Message-State: AOJu0YyvqMMpIQVSXYW5WUwkzdaE+7b1VOgwtuDVecm0S6ID78x28aEO
	to6kYzDcbNf2HakZHsxrInOCjXuhvMVwn1wCRWLpIo0Hpx9zZvkZXVMT
X-Gm-Gg: ASbGnctzxq9fzVLPNPtReddk6IoQqg/92LYo3PbjQobfjFAI+uC9zUOmu5EwRoRWr3Q
	6EzfEiSCUXYHmigCepAT5XabghkhLiphHOJ8aqUgvcTR8H4qWZ1NchkXm8K71bFkvC5RyA0jXnT
	1Xslu3xcH2mVYkTmdheS7U97yQqrLCreRw+dNWY45NdjaB3H0EUitzzZ1/P58mRSwonmYlnzFNR
	TdFsWHW1crU5FZv/YdUU3VvfaiurOMrCaS2lvcSzXAX+RQyxIjeojcpzontsuE49i9hOKy20F5G
	hbQ7A8hC8JzE1rO47yDvDyH8nVH1FJUlY/PLOUe1UlUEPUubZlX3RfScDw8rEFSDMOiZX3SIWYr
	P5I4ZQFqk/M5Z8L5Cxk7i3pSIeR4KobPA4fV6OZodd6Xeq8pN7TuC6F7wTmwcsME=
X-Google-Smtp-Source: AGHT+IEMvnX379Cfqxjm8d/1Z5fQyV4o83jOtFXuWtyBzvMeYslcOx4WAebdY0n5WCMLCRYgzq0u0g==
X-Received: by 2002:a17:903:a4f:b0:235:f70:fd39 with SMTP id d9443c01a7336-23dede2e17cmr167967685ad.10.1752507472927;
        Mon, 14 Jul 2025 08:37:52 -0700 (PDT)
Received: from [192.168.0.124] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ae9f5sm95068015ad.66.2025.07.14.08.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:37:52 -0700 (PDT)
Message-ID: <81addd64-6ba6-465e-901e-05f9cb29185b@gmail.com>
Date: Mon, 14 Jul 2025 23:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
 <aHUeNpx6bsC5Gk3b@willie-the-truck>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHUeNpx6bsC5Gk3b@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_083754_593442_D351A709 
X-CRM114-Status: GOOD (  11.27  )
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


Will Deacon 於 2025/7/14 夜晚11:11 寫道:
> On Mon, Jun 16, 2025 at 09:31:51AM +0800, Nick Chan wrote:
>> Skip initialization of PMUv3 remap when EL2 is not available.
>> Initialization is harmless in EL1 but it is still a weird thing to do.
> Why is that weird?

Maybe I could use better wording but if the check is not here, then for Apple A7 which has very
different event mappings, it either has to use the mappings for M1 which is wrong on the hardware,
or declare an a7_pmu_pmceid_map, which would just be dead code since A7's CPU does not
support EL2. Not initializing the mapping in EL1 avoid these problems.

>
> Will
>
Nick Chan


