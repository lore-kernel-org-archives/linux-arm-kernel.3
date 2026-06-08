Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE6CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M1RcBRd4la/fLxNsDGz3QeC1KhXloFpR5ofR1BWNrk=; b=VOIEUD5GK7yEoyjUcruJnVQGx4
	+WIPcs3XQvR2JW229txkbfvEIBU2gNdXutiEkx9qEK6RcYH/nmGOcZnPa9XKJ+8394PFOMyxgN7qv
	lXh18iU4U+dov5Wn0xYF4a8DCF3uqzUBOzNBdHpeROMoxIhThwGk6v+n5Big6cVKtuKBOiBsovjqH
	lhH63+mhkgr8D1YD+8x8OY+/ZN3bN6gBg338GRMysLoaRClI8Qx6h2VRPs/5YP4dIIluaKay38+40
	AgcjRCfrrKPUaALJnR61xkWqNrfZCuajZ1RGJq5jipdW8evdUBPT2Qq0V+X688PA1hA8hr72wnD3M
	RrGbGLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYMa-00000003ReV-0Pxa;
	Mon, 08 Jun 2026 11:41:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYMW-00000003Rdw-3OFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:41:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so2094550a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780918908; x=1781523708; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1M1RcBRd4la/fLxNsDGz3QeC1KhXloFpR5ofR1BWNrk=;
        b=bcj25myBq1lIfI6wB8w6KPO91ACEl9+f2/9AUfnCK0sSxqwSV6Sd5M6MhS/CIhtpyR
         fFSQ/A/ihJKF6r90wbKN8ZxVjii4nnNqrG9U6ey1Zes146nhBN4VV4WU2Qs4Rt0+hi1L
         D305hlOB4hGWN5TRpCXFBdrZ9ua+SRR7YNOI9kIgeY7BTu+RSTJ/QkwWMiRhkXBwScX1
         5AZutpNiuzCD6ubM3vxVwklExj4zp/DKwRDaCd0j1cQzsuuY360H2f1GK8OUmHEypCcm
         GSK5Ky0OxAtAMguX459Q1rFKpO14OQb+STGvPhKhnsGLvp645yt4YrFJnqLkDaZUMbr8
         4MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918908; x=1781523708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M1RcBRd4la/fLxNsDGz3QeC1KhXloFpR5ofR1BWNrk=;
        b=oqBuQ8Khbo0BCamCP5TkjTF/NxkQYWz5uTUM1iLvc3V7vbGGj8hLY2/Hu1+xJasDom
         //DQ9dmx4R7J+bjcKKCV9kDEVx0Jht8yxKZUjtn8WumGGpQ8k5EfaF0t3y7R7cwby1Zw
         s/+qXJMm7pDR4Lf0m3Gg9oVjESGYAlAWvQ6HziTlHQUK9UbsbFXNpAysV1RBjnzkHTEe
         xtSzfSa9LuJniskfmFPxKZZGx9/kjcEUC04G3ms8vLkOvmThWB+YjLkYsxX1Ize8jd8z
         8uG0K8LsFkjKd4PeMuQajOX29r474tdP88e5fZZpcbMJ8PBGO/g5RRvlZXPBvzqA7JBn
         l8TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/q/P8AsIDhir8Uucee/DBw86ZxsH+p7W5fQNSDT1TZFRHnAcVTVO824LHBlqZSLZOiv3vnvXD7hNWQpuQL4xL1@lists.infradead.org
X-Gm-Message-State: AOJu0YwE1CWRkOn8f3z3UONSjHc76i2K87Ufanq0bgDcEH+F6ScTkOad
	wHqVaGHuRE0oaHJ4xZpoaFHgky3vkBYT8ND6v9L4mu2cIa5VHej6jlZk
X-Gm-Gg: Acq92OGIAH9aycscv5LAoie74DfJrh/esJfnUybN3KyxNSFpdN0JQ7LLtSEoC0BwTrh
	Pg2dYhnOQN36y7v20jzjlwW/s1C6UzfScSr/KBVi/HbV6Rbl1pMlM00qyWYrPM7bA8KYXTk0Q9e
	DgHNProZzFB/b71NUTtE1qVuC2YXFAlzAo2pyr7brm+71X9R+X+CIoOSJSQLGA9abLAj3rGR3BP
	pTyRJt61vZAqnYHwkbG+AslTYpyuiDQg4RPVh/iJB7gXhA8yeMXbr5cspIVPDsEeKRKqixVtlxR
	3fnjL/AAlJTMOBSmZd5+z3crfSGm69cHb5nDURyz8jW0kFctdt+rPDO4CwCl1fP4p7wcOxGU3zB
	SG54YKI9APPzxk1QwksK5zbrwoFPDTIONx8i1hjQ7gjHcstuhjwpFUFidDZs1rjkxX/2oDWK8DY
	xvpFPHI7u9nsmUbuLI2dHF+K0Umke0XtHEnMpjO/TfeFVwiBh8wQ7RP4nqgRifNop19B19HoK3k
	Uyy38ydAh/ffA==
X-Received: by 2002:a17:90b:280c:b0:36d:70c8:3a1 with SMTP id 98e67ed59e1d1-370f0480fb5mr16381695a91.13.1780918907971;
        Mon, 08 Jun 2026 04:41:47 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm7074534a91.0.2026.06.08.04.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:41:45 -0700 (PDT)
Message-ID: <c8df1abc-5764-4ff5-9229-f3ac9bd73a6e@gmail.com>
Date: Mon, 8 Jun 2026 19:41:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton
 MA35D1 QSPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
 <20260608025009.1504971-2-cwweng@nuvoton.com>
 <20260608-aquatic-alluring-asp-b5fcb6@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260608-aquatic-alluring-asp-b5fcb6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_044148_848128_658C1B03 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Krzysztof,

Thanks for pointing this out.

I will fix the DCO mismatch in the next version by making the commit
author and Signed-off-by consistent, and I will also make sure the
send-email From address does not conflict with them.

I will rerun both checkpatch.pl and checkpatch.pl --strict on the full
patch series before sending v3.

Best regards,
Chi-Wen

Krzysztof Kozlowski 於 2026/6/8 下午 06:02 寫道:
> On Mon, Jun 08, 2026 at 10:50:08AM +0800, Chi-Wen Weng wrote:
>> Add a devicetree binding for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
>>
>> The controller supports SPI memory devices such as SPI NOR and SPI NAND
>> flashes. It has one register range, one clock input and one reset line,
>> and supports up to two chip selects.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> DCO mismatch.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
>
> Best regards,
> Krzysztof
>

