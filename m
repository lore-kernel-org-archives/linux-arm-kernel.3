Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CCFC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=; b=X0r+3WiHTCJ+7YpIdnwQRN9Ju5
	9+w7FMiynb0UIaKFYagn5TBQsjDICB4onlRFCCRIaKUaCgX8Sncq2gjNkxTvkIhke0pIQLzGewV+6
	opocQxK4QwVRra2G9/dmReZAI/+/RjuPob1x88Pzq6MgLthdckTm2gFGXuhwlpWx0PLBH4GOw0mp6
	9PCd1qIAdszJaqY3oRlPgZ+WvSkUZrd44oMHkFe02PwcRlGL4E2CXDcScZ+9PffHMS3m6sBDqp12E
	DVhOY+msfxX9xFPpD51gbQBC9RzesNUSczD12Awt6Vq6XnCk7WXCb5aOXtsTQcmcnhkUX34rNx2Ev
	+pQKW0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7lAf-0000000FtV4-0DxN;
	Sat, 19 Sep 2026 02:51:21 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7lAa-0000000FtUc-1PdL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 02:51:20 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso823319a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786275; x=1790391075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=mvKOqFx46VtzE3pJRdRBgDBTV1u19KTvMalTQrlhG7D2FGSUySQy/cKTvT/M5ToVQi
         Bucc2FesNDuwFah8zHjFjbiECmimjFeBcvrftMmTJYC3EQJHLrPxFfnoOxqO59LMRWTj
         Ofb2PANVk1zCf9mUBmk5fMINkfe07XSz6ZdGh8J7In1RW0bd9BXKrq+zXYGc6EIL+Ene
         6Pqy0EkUZXe0KMycIwR1Uy6whfnobYaUPMGwvQzNzU/N+GbwyRgwejVfo50gGN2SsewC
         2AxZ4ZHE+LDsKDLOXc2pGCj+Ywu0L/KykS/A8r6MuTiWk+UF35gA9DMGB0nVJp/XAcje
         H9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786275; x=1790391075;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=Y9Ijbh55OWJN53X2nvFmc6aaVdVV3BRq3KJeb0h0kv21l0RLZo62hvuX7DuNx6T2ZS
         +dmz8Ksxp/U6jhcu8ORiHLst1aY1pREyXRJiyOpxPIYrBdvAZU9tyvsVMGrD9nU9UnLE
         1LwbuOGg1VAJzE8Jjzx6BBU5B4Maz3ixMSldduq6NgyAb5Z0I4HIk9gSsjhEr1qIM/Xz
         nltr1JG7nG+0M9P0Rx0OGvx8KGuqyQ6/JC+b5mmq4lCkxM9of3GXkJMV6ImReZpBWweQ
         f+Ab9z1y0PyPwAwLT+YwEQ5sA7O/A6m6luidGpYK/Iy6AEPJPycBxFKF8FW/a46Msp27
         YFYw==
X-Forwarded-Encrypted: i=1; AKwUvBxSY7K9tSUyNmznbq3y28v1BwyJoJ0odG2Q+GPRh2UveFrv3FYfYNekrTphXiMlEOZ1LpFMQZmDpkghfGO7Etjq@lists.infradead.org
X-Gm-Message-State: AFuF++maRwhTfwdvJHrf3wz+z4V5y5dSgLyrH/v9OSrtF0qCyHxmCqbz
	4taQ3zesJDIZfbtD/Ynb2loBL4t6FmtN1Lu1qYSKkgDLVCZ+TPuiwRtQ
X-Gm-Gg: AYBFou0rPfAuqREcIXjC57nffx/Zq1Myj28pJeMAPafhTa8160cpihkBC78dNMEGJjn
	c5PofpVd6YCZxw4x609l6UvxvE90nsWDAPM9IXQUTBmuVYMUNrQdGXrnWsOdP0ffB9MwCGvAWUI
	FK4+5gpfcTpn5ReD7hc9MhXeEXP/WCNg3IQd3nM7tVJQc9m3rmK7fTLvVUs2q8rOOLFrNWzgmOc
	aDfpjF1w3DFlPSb1en5BsnKQl8DvegBTKFyMzuRNjR5pp2ZzJ3yLL9MDUNypzPjjGRcKBOOSdJL
	b2Ts98nl6tx6HD49BUYhJ+YAt2lR+7WZJWheXZ/F2HxF9X8ituvJgjZ37Afs7wNy9stii5nMscQ
	/JCQCdSi0KycBHupvV849cTr6JgM/NC7B3RNIE2XEPW6Oohs5PuXij2jjBmkb7pChw9Z9wENprB
	r2Z9gTdYGw+Tva2TTCeEvnafaPolf/+b24bdhBn5OeU79fJVyCakYXsKNBz230E+XMdY8/YVY9k
	bOgXOv5elcfIYKaiScp1HD72g21LV7DCyHUIvGA4gjqHbrUx7o=
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr8391467a91.6.1789786274734;
        Fri, 18 Sep 2026 19:51:14 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm2060720a91.15.2026.09.18.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 19:51:12 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
X-Google-Original-From: Jacky Huang <ychuang3@nuvoton.com>
Message-ID: <cb92ac17-d334-45e5-b5f4-4c299a1fb462@nuvoton.com>
Date: Sat, 19 Sep 2026 10:51:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Language: en-US
In-Reply-To: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_195116_381646_E5221ADD 
X-CRM114-Status: UNSURE (   5.89  )
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

> +               can0: can@403c0000 {
> +                       compatible = "bosch,m_can";
> +                       reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
> +                       reg-names = "m_can", "message_ram";
> +                       interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "int0", "int1";
> +                       resets = <&sys MA35D1_RESET_CANFD0>;
> +                       clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
> +                       clock-names = "hclk", "cclk";
> +                       bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
> +                       status = "disabled";
> +               };

Hi Zi-Yu,

The CANFD0 through CANFD3 reset properties added in v4 address Marc's
comment, and the reset assignments look correct.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang



