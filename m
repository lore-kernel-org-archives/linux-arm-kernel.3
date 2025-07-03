Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB1CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=; b=IKn5+Mty4PmwmV8tZALuQT8brz
	l0F85BXZs10SJOzBuruLaWTj/bixptIc72YEMXRdRqGUiKZOWKJxYHl2Jm+UjmU24n9GdOAxc5zHe
	WFadc4xI3OpHcJIn9eaoM4bvDdfanGrALK2O0RoKCWLFXyd1v3VMxzLrMvjcLCeflPePteS7PadHn
	NUt+WKXk6E3oduircqOOFfA3Ur7Gw0AehfzPCacvrIz9VY32ovckTgT7kZZgPO+TCllCXx1LEugYc
	zdt/JWCwHIEOE2XkJa8xX49GExIPMsJhiMw8gI3BAhakqE9TMkm2AmQnjs3Sr+dBZB9o6Nql6CXi7
	ZLPVmhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFhi-0000000Ajw4-2ZUu;
	Thu, 03 Jul 2025 08:54:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFfM-0000000AjYy-17Sb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 08:51:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so13028833a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532694; x=1752137494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=NKYipykSnM0ERFHjwREjnX90mBsvE3r7Bu+4515mP5AwRjDeJbH0uosa2jj4G/bO1f
         wuB8xtj0lao/vFBRoF/We8gGWIglrmjIMjPJVjprst6tAUYOwrXfiwupgR5x5hEze07n
         Ubfzq3HPzDkIxYydq/pfBFmGHlsz1WpAEh2VQsCTG/C4/1Cmi2NknHEfi5NG84cEo+Ms
         5JjANWS3ARzhjFULOD+cqd95ZBVaZO9PIfKsj0/uhw4DENYRdW2+qIckprZTjb9c7YRf
         ZVfnYm25lA/4a0oBcsAimoriya++sDimWGe8iyPLIvFRkUueYdbn0d2kBETo8ihv9XwH
         m7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532694; x=1752137494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=BOYN4eHOsWkEiep5v3g0THDYztmNYLoizlazH+uL6vHNp6jn1TVJ+cfiJGCbelO8TS
         wh6petknEEsEUF9aiZV/uF46m/6+jc5RF0+snT2F3vjtcC5guHAMQUwyJymmfh9ysWVu
         rgRhxqc2vbR/nKBFsUi9qYmcipAwYY/mxIthWN7nrU/LXMXjzB7q0kUxJN6q7dld1qBX
         rTgcs1Rfn5tKtc9pbC8p+tWdG7Y2C/1ssCnKhyJ7cS7fHJ+UJAnQhm2hT1P76ZmiP0cj
         DB7H4HgLFNuMOpqSiqmoLqRkV+7fGHpor7Ba5qfPq4kGYeeNhf0Brakty7xV8WQAuPRM
         fYJg==
X-Forwarded-Encrypted: i=1; AJvYcCXVvoC+PYOpRSV7IhkSIkSrph3KokMVJ6k86LBaU2t/tR8a0BKasXjOhWrubieO4ZcaJOTP40vlZj77gKwdSd91@lists.infradead.org
X-Gm-Message-State: AOJu0YwyqAor6jeC5INsL3LzY35lXXqVlEcZ6ZzoW5FP6N6+uVdcriic
	ukyBoajbVkPIHjrqADW2eCT8hH0Q/soBMQ7V2yP3aA0+vTmTo+fsk9p/
X-Gm-Gg: ASbGncvJqY4XtM43n0aahEZtnhBpOMbpf/rWRlP6gV5IPEf/r6xz72kC9fDk/o/0dBp
	g64vyPtJeBIlj0W5NdqJDEZ/Kzvo9r4MZ2Fl/lbNRrCGlZjhN1e5fh6bARYoT8V60h6AILCtvf4
	9TgIZ6HokzzeiOKaL0wuAk8MZXv3PnPXvqH5ffqgGbZA4MfxwDnQlwpswqLpzcKTKO3crcdq3bk
	kauyA+7s30hgN0vBuAjZ83ry12SjQKYZBRpUsnBx1Q39PfX+00H3KSvBYVmQ0aQgDGPE/rhxs3m
	RAbFpmc9hTx0WSHrZJdo2mHmddCLmBrWttCZbd7624TCO3vngNeeXl9eI8rR6sqnJ5/OLFMfqzD
	YjTwYrmPe28U=
X-Google-Smtp-Source: AGHT+IF/15k0UhDJHrTcrKwLdwkzfbrEugE0iaN0gMVkMiQ4Upn4VgFsHeYzGWOfl44lDF56ZG+LGw==
X-Received: by 2002:a17:907:8b85:b0:ae0:cae0:cb35 with SMTP id a640c23a62f3a-ae3c2ce87b1mr512443266b.37.1751532693871;
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Received: from [192.168.7.84] ([92.120.5.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3b94b3b2esm388690066b.62.2025.07.03.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Message-ID: <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Date: Thu, 3 Jul 2025 11:51:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_015136_306132_998C3203 
X-CRM114-Status: GOOD (  18.02  )
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



On 7/3/2025 11:11 AM, Ahmad Fatoum wrote:
> Hello Laurentiu,
>
> On 10.06.25 18:01, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The AIPSTZ bridge offers some security-related configurations which can
>> be used to restrict master access to certain peripherals on the bridge.
>>
>> Normally, this could be done from a secure environment such as ATF before
>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>> domain is powered off and then powered on. Because of this, it has to be
>> configured each time the power domain is turned on and before any master
>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
> Sorry if this has been asked before, but I hoped the cover letter or patch
> 3/6 would explain if it were.
>
> What is the default configuration for the AIPSTZ before this series?

the default configuration is the reset configuration since AIPSTZ registers go
back to their reset values during domain power cycling.

> I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
> changing the AIPSTZ settings needed for the DSP to work?

AFAIK SDMA transactions to peripherals don't go through AIPS5. They use SPBA, which
is why SDMA works even w/o this series. As for the DSP: transactions to peripherals go
through AIPS5. With the reset configuration, the DSP is not allowed to access said peripherals,
which is why this series was needed.

