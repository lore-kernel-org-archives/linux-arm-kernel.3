Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F41CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkZxhv/GZ+0mzfo95Y14AIl8zEVZ7txWfcdhXxNhCg8=; b=TUugHcdpkjz/evTm95fciZ9G9+
	fU41DWwpymFBvqD4KpALgEYl3k1LujOvcCxE0H37FBEcIbn77+t4Qho7ng/KSCMxGG8DpbwD2mbus
	sWAnyE23q4w46Cx7Jqn9te6rtt9HfhLHv/mv1APwcxQGaz/HCj2UJxxVUjzcTiRnb2xc2AYULqvnt
	J7DvHX3nKTNq5AttXQY2gO8NdvcpaucsCgcR3a0qdYpTMSLgfT1tnjfMH3Z6/7QihB3SeZclDWj4n
	8nalSaRpLuDD5e1QE221KH3ZAZs0krYUUHoesEhwyLv6wkjEtxaRJfrBTEAnLTIMR6oh8H7K5aiH6
	93OstrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH0K-00000009NeT-1hBm;
	Fri, 24 Oct 2025 12:34:48 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH0H-00000009Ne7-2T0i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:34:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso412708066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761309283; x=1761914083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkZxhv/GZ+0mzfo95Y14AIl8zEVZ7txWfcdhXxNhCg8=;
        b=ObGKe4ImC2G13Lud75cRFDvdIMIIHq8YVgTQIq3yjQ5hi1ydyzmlcqqIFRaItCyEDv
         ibawYclvK/dHXg4vxXeGsCpUwXyGaYzRZev3znQaKqEUgMZe1kXDCZmwM2m45Y2tJL+3
         I+/2PhAnncFdn8crradn/9yLRf/trJJptUtwBmkP60Zk7GO2NwpKvuwtcsNjzKKBo8v1
         62K9oiCnQOEqCjmTYukiShFcfBd4jvl6WPX4lZuW9Kqo0yPPLd5WCRtIU3B7ZKLgPMmt
         LxB6rY3P2exwNY07GW2s6SsUbcZi504fMYKvCEe7jp5t1pSIYr6pJfHazqolgVxMVf7L
         t9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761309283; x=1761914083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkZxhv/GZ+0mzfo95Y14AIl8zEVZ7txWfcdhXxNhCg8=;
        b=w42CYYGsqEwkkXh4EbfmLH8eg5lDdIguLpMOiL3zPNtd7RFnnlXrtclA7W3a3Udvdh
         Qigpivr2gHkHijTRSaDxl+vUDxhdo8w8ooObnSKA1vlwAzvKOrBTBaeUt7i2pWR0US0s
         qwEWyWcwKlL8uRhe9YXkjD5MAK7nPRYERwdOjQbEaJJTD/rE92+QpMkUWaXsQ21fjGgu
         dH1rRMflWsKVCx31uJ725neeP3+YybmjGAYtEE4WTCvp/eaTeK7qeOv9lhMuaHbfh4Db
         NWtQ4l2b1JoznN9asL+xmxWMLTyzYoHZ2YGl81UcIjv3XlVplnQPSOZjkokdCS5c32ga
         jCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJx3BqCW1pjchQiEbo/0NGMxfESBScPdF4VddhNFCIZLggYNk/oRpp6dGqrvbO3tlt+esLf6DLfNk1bqk4ARAC@lists.infradead.org
X-Gm-Message-State: AOJu0YxCIVl8uVxVhsFlrAcXUaZCQdfZjlXTrxIjkpvsxiRY0LFYFY34
	e8kFpEmw5lIRwE2oPDjfytc9tmnk9q3YUiAjva1viOATUwqIkPPNU74i
X-Gm-Gg: ASbGncuxnPPSb+b0yJ5eVg5G9FqADZy0XggaApryk7AT2EfTf8LKAnlw5IcpITcOTaU
	f4TZpS6ORkZNMjYkb1oOE3FyhvyR3QcYdRtgiN2Atqy2hnxXe2Zpu05hEsa2p3bkkoV6GQD0Vbe
	fBFMEFAjN2TpRHCUTOaXfF4xvZ++EiiN5ugC96wR6CbTbcIUp3CoHHurPKqA1XUyzumiKnIJGyj
	CFCDLeIe2YVh+f+xyxGu/WJjuKnLeYTDcaAEPgA1pg76rtTpYICW3CJlCplmF9MuCAhpH5X4f1D
	Ea28QLr3k1fkH0+LkSzs1KRCbLpRacU4vqJmbJhcV4xMXc6QD8mF4QzM4l2jMmbnw2R9kLeAa/4
	qKKP/01CJkb1ZoZdb4c2xb4jmOwGnySPfrpDYLXLL/vyJuNd7wlE4TTxHOjKKNaoSfq0aahJm+a
	3Wa7mX56BNgkvYynlob7pvACJUS2FGCPP61gNHO4LrT5rMangfJ7ol6Q==
X-Google-Smtp-Source: AGHT+IFSr/XYwfRfLIFaIqsUt5jHZeJv+L9cUEB6LNpHnU0h5lq97IHAgFvmzs6a4QTfDaRVom0Xrg==
X-Received: by 2002:a17:907:25c6:b0:b2d:a873:38d with SMTP id a640c23a62f3a-b64749408dbmr3638894466b.43.1761309283008;
        Fri, 24 Oct 2025 05:34:43 -0700 (PDT)
Received: from [192.168.1.103] (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm518519566b.29.2025.10.24.05.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 05:34:42 -0700 (PDT)
Message-ID: <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
Date: Fri, 24 Oct 2025 15:34:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
 <20251022-savvy-sly-auk-a60073@kuoka>
 <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_053445_685546_51E6BF44 
X-CRM114-Status: GOOD (  24.00  )
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

On 10/24/25 15:07, Peter Griffin wrote:
> Hi Ivaylo & Krzysztof,
>
> On Wed, 22 Oct 2025 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
>>> Introduce a clocks management driver for exynos8890, providing clocks
>>> for the peripherals of that SoC.
>>>
>>> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
>>> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
>>> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
>>> bits in the same register that controls manual gating. Hence, don't use
>>> the clk-exynos-arm64 helper, but implement logic that enforces manual
>>> gating.
> For sure it isn't the only upstream SoC with HWACG, gs101 and e850 and
> probably lots of Exynos SoCs have it. Whether it is the "first" in
> terms of release date of the SoC I don't know 

Huh? Samsung hasn't released a lot of exynos chips and you're free to check
kernel sources if curious. Exynos 7420 didn't have HWACG, 8890 and 8895
have it. Exynos 7870 (roughly same gen as 8890, but budget lineup) doesn't
have it.

> , unless there is some comment in
> downstream code to that effect). Your CMU registers do look like a
> different layout though.

Exactly. First implementation/gen of HWACG == lots of room to improve.
Which they did, and this is what I implied here. I can word it differently
though, to be more clear.

> Just fyi gs101 also has Q-Channel registers that contain HWACG Enable
> bits. The reset state of all these bits on gs101 (both for QCH_CON_XXX
> registers, QCH_EN bit and HWACG bit in CLK_CON_GAT_* regs is off). In
> my case I suspect the bootloader doesn't initialize any of them
> because of the CMUs "global enable override" bits in the CMU_OPTION
> register (which is initialized by the bootloader).

Well, to be fair, without any documentations or bootloader sources there's
so much so I can do. The vendor kernel also force disables the qchannel
registers, hence the assumption.

>> Please CC @Peter Griffin in future versions.
>>
>> How much of this can be shared between this and GS101?
>> https://lore.kernel.org/all/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org/
>>
> It seems from the commit description Ivaylo is still wanting to put
> all the gates into manual mode, so is only initializing these
> registers to ensure HWACG is disabled.

Yeah. Not all CMU blocks seem to implement HWACG, so in my opinion it's
best to just keep all in manual gating mode.

>  Happy to help review it though.

Would love you to! Thanks!

Best regards,
Ivaylo

