Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbdDOQ0AnP4Rf55zqYAzOFqcv0dQXTgldFGn2OhR1Xk=; b=WZRXCEuCPv+fEukZ1eFb358gf1
	FChkOL+YT7Ke4N9COKF02JcMciY+1SIxGmvVZ38wqct0vJdE3LAb4dBBEPdhx1laDbGNDeDBfoPun
	KZOs5zCkMx9rLUu5NKPevD3jpmR8QdDCog/EcIkRJ2kY5lVPLCUtT8vDBE9KF4tDeTLBRxBVfYII3
	npv3scMPimd/IHZHvJ8yY4Nxl90Zc0pRiU8Q5rXzFjTs6C8rUzFRFRJGGidwYXYbS1hFXMLMW8mB/
	zKqmntwkYF/a+obZHao4kq22SuILY3t4wswtd1SQFS9ZZTgskltqMqKWIeFlyei86sWAGu1LpIk1w
	60Jl5VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0za-0000000Fyfx-205K;
	Fri, 14 Feb 2025 19:04:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Uo-0000000FtKd-2sOT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:33:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so2528420a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739557980; x=1740162780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbdDOQ0AnP4Rf55zqYAzOFqcv0dQXTgldFGn2OhR1Xk=;
        b=lrhgRXdgv60h6aAk51MBcf+3+TxXliZtdAp9Sfaqtv7lDXmICGrHQc7k0+0/OqHEnT
         moDMoY1/Kq8+NybAVIdR9b5BL8Cs7PGPhArmjEvit0r4/AZu3GRqj7CV7tcVhOJH1/KV
         5LpuYQZFIeO6P8if4jsbP9RUKElm5OMEDy4NUpukwLDT+HH7GNtSltCB5sVWyPN/SMLS
         pQksB6S2hk9FOv1OuCb3/64tF0kvPsNSKidVpkWBNBo8O0fIlKn1UYTvjvutlP+ig3Pg
         RrP14G6U1CR+nizwx5KnlRfKmhy9n/0P4CN8lH9QnT+IUxHxgpXJ0ZP0M8F96DsuakN3
         gO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739557980; x=1740162780;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbdDOQ0AnP4Rf55zqYAzOFqcv0dQXTgldFGn2OhR1Xk=;
        b=OF0MNvK/IOaJeNQpaURplA5/I6Ugk+yS9ZE70WM047/cMqSgBQaxlyPlRmOBRVsALX
         gVi6IR0xe6oWp6O7ingaPl/4nBkr5jB1dqIRK4mT4QykCdnxsIxIH5g9Sk2e5MFzPhQv
         bD+EUMST6bf+5ZYvU1TpQkWeHrUtDrP839KCFf8FfQnhETHV/pvp2do+KwZhjS1/9BS+
         hRIo9wyG9dm22LNb2c7UCPkSzaWiKrZe7xs+2OxITUrlfb93saTZ2PKYL9FkY39o10+6
         H//muWfeyEbTEcfT/JFeidh/yFE7QwgV3nv9LvW+Ob7x2CtmL7f3K4ixBILhNvYVU+N0
         vFvg==
X-Forwarded-Encrypted: i=1; AJvYcCUpDBLCS85Ft1b7il3FbDggSYDUdOHbh1KJcv9nD0T5JnAq1XQNL0TT/3tZrFscKlHBaoQWhwjwGvF2zCv2vp4E@lists.infradead.org
X-Gm-Message-State: AOJu0YzvjJt5lbgboanMuHsj0eEheYgh4wflfzDmjD3FIif2agDZzHSw
	sH8mOeHTCSKQCQl+lY9cgoB3MUsCGgN7wtIjTqe0c6CcaqKGqlsc
X-Gm-Gg: ASbGnct8DwVFO9DFHPFvCR1raKav/eAe9GWDFTwPjJ0TX7vnrpiTx2fX3T1VW800aj+
	JWD5DIlsN1Pt86nMxaUHtPSyd9dbzUTmaBpD0lb6jrGR/Ganw244oOPwKIULVqWzOsO2Opmd/XR
	B/8B7m5pPzAKXYrBawt4TvLqLpKIUF0zp/p9r2OliOtd7PPoBu5sGbUI01A5zF11oObWczB4gDk
	bAjibQJHSG2FTqKJs7IxDrCfI0chi/TN9o9BWoA/E9WJP4Ftz2pOhQR+gfU84m4qdJ490kx7ZGh
	iONRomRIuoM1voBHxHX669vp/0CPvAGV+2rQGDpJKUdggE6jt6S1PSC1/i8p5Qbaow==
X-Google-Smtp-Source: AGHT+IGAmqQcNVs3j79OGPjj0iiEgipG+7uUlLGnwdrB/uxsXc/DrOZaoQIra7ijKjdssLi9bJXvJQ==
X-Received: by 2002:a17:907:2da0:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-abb70d67772mr18427366b.35.1739557980167;
        Fri, 14 Feb 2025 10:33:00 -0800 (PST)
Received: from [192.168.50.244] (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2880fasm3248852a12.78.2025.02.14.10.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 10:32:59 -0800 (PST)
Message-ID: <7a055e68-e72a-407b-bcf0-5f2ac43929f7@gmail.com>
Date: Fri, 14 Feb 2025 19:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers
 value
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Christian Daudt
 <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
 <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
 <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_103302_722225_85948C6C 
X-CRM114-Status: GOOD (  13.54  )
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

On 14.02.2025 10:03, Linus Walleij wrote:
> On Fri, Feb 7, 2025 at 9:02 PM Artur Weber <aweber.kernel@gmail.com> wrote:
> 
>> The max_registers value does not take into consideration the stride;
>> currently, it's set to the number of the last pin, but this does not
>> accurately represent the final register.
>>
>> Fix this by multiplying the current value by 4.
>>
>> Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> This looks like it could be causing regressions so I pulled this patch out
> and applied it for fixes.

Thanks. I assume this means this patch can be dropped from the next version
of this patchset now? If so, which branch contains the patch so that I can
rebase the next version of this patchset on it? I've checked the "fixes",
"devel" and "for-next" branches of linux-pinctrl.git[1] but did not see it
in any of them.

Best regards
Artur

[1] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=fixes

