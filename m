Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97675C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=; b=eIdUnoMgTtXbZUH7oosZPdb90t
	hGRFquRnBF3x3jIyhpquzay6F0pSMQOaNNl9AjMvFE9Ast9kVx45LMNzI04B9jyh5coGN/rWfkeIM
	w/NUPTFl6YqBnxGRqAH3WGXsSd8LB13OwDG/0gEgyebwy6H4RFfMbT3En/MWPCWBj8L9TFCCunVH3
	ah7mtSE/+A0BYTGkXnwsg1ZgUa845WRH7KE2NkWHCXf/NJ6+QVq2pkRoDLr8AQ+qRq6XXpVZt5HnP
	KsoKMA6Hsii5vQWDfI0ZSEqJAXzmJWiXOZ3smTFE4thnf9/w5orFat7SgQQMmrmxwhrq4XKghM5jC
	58IqP4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeGp-0000000CnDM-0MaU;
	Wed, 22 Jul 2026 21:14:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeGm-0000000CnCm-1YQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:14:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-471eeac43bfso12218772f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754862; x=1785359662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=;
        b=oHZBIsKNjr8i/OeWSPKiR4U1yUdfFP5VYHdGWFIUMh5fJqebGTuM0vohxqVsj5yI+0
         qL0o6Rt3r26ESv5uhqTO6Zv+JQ9TsXddjes5Ht8yFm0muVKULaK8MrhRn0lfldlV1dip
         CaZCQPJMrULHwfFHRQcKwm8PkutAHEitUYmBmERwxz5xSdheKhAzWthBOW9koumIQqTO
         R7bKalxY3EvdQMrHL7FydUVp0NMjrARUXciTqLbuucBioNzEOUhk2gLk686ejzCeeOTw
         eYxVc6dlgzbofScliqHWb79ioRN/98/Lusw2sytOGBrN3ChNXqDMjbaKtGku2E8DCJMv
         yw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754862; x=1785359662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sGs0rfz9r6IQCOxNIuyFl8cjjmJTI88JpUD6LUtWFpQ=;
        b=LFR2wcvzuH229ZilD6dzvgmsXn7D0dfHP7G5tNPXCUwHUk7+xjKZQU4boJk+bXCO/3
         /GmtvuQJHr4nbeuahxtfDXyYxknmcy0BPN+oj2IdVb2q+Ph5qrNzJjs0A0PM6JRwJWdk
         V3CWBGp6SSiADnoqMwHzP9T/RguZTh7Wi5tlkckDAqlQfDFM7fHBZYnD51uQkbh70IKA
         xqpLno4YMvsZ/eVAShyx26x7kFN7ttppdlB96JQAi3tDt1+JE5TkNES9BVNti3/1EkrE
         RvByQwBM9acpuOAseihL9GVmpem7wxYw/PkhfJjH7aV50K++/cES0l/L7TBdONB5QKKV
         EuyA==
X-Forwarded-Encrypted: i=1; AHgh+RqSNwkflAXjqkyiA+q7/r28B6rdhYiDc4OYXzeLj+oFDOLphwFVEq/lWQVVdlL8vXkzjJ7O85nxzsTQVIE8i6jL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq5hUr7NbEBUJAgWcp29nv2/FFdjCyvxG60cEsrbeK65gS6UnE
	lYcvgbh754PrftFenpeOS7e+AUaXmo/qK7I1cNfNItTRUge12cshoiYS
X-Gm-Gg: AR+sD10FO9ABo3zzfoECtk2J25BxrWUhmzDKXIKLZY6u5m9wb71912LqEtto3kJYMiE
	Upwxd87G7RNc9DFyE9PhDKiXm7vXd5AZqDHiCtXVT3vhmLH/BDvAiqbsS9n2klW4YMidlUflfQg
	p++VQLyzXnVlX/eorairWG0b87Y8ESNhZhP7BGbRAImn7zMDbhQIQ+5FRbrWGLRBhZ0ftZqfwWb
	XuOjt5/SaQvf0xjoVeqC8yBjzK782V4Ni/qmdqpsHkxs//Yw/uS/08wX5Yfb2SWUc31vOV1hh8V
	i+EmXwL49fz2CBC9w3uXiSG1hUKYbTPOBXVtWHaMfRLRwfkAW6XLJhnFpI7Lg5mNML1IZ5RA7Kv
	p444Fr9CXNtxC+n3kvqCEcv5cDUyWmHaEeLtmQlvkn+3WEOU65+HRGv95n3+SbQzd75bHU7yqbh
	MUMi2FhzpCbTOoz4JdSF8my5VykJ9KmEwrEZSv4WCpaH4r3aq9VuX8mMbaDZ8cMaoyTb3/4A==
X-Received: by 2002:a05:600c:46c7:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49573cb966cmr3744405e9.5.1784754862459;
        Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b021fa6sm66296175e9.2.2026.07.22.14.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
Message-ID: <9b2d40b1-a21e-4ccb-a80b-27f1a24afc82@gmail.com>
Date: Wed, 22 Jul 2026 22:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
To: Arnd Bergmann <arnd@arndb.de>, Aisheng Dong <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linusw@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260722202638.135277-1-julianbraha@gmail.com>
 <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_141424_432584_5225A608 
X-CRM114-Status: GOOD (  14.29  )
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

On 7/22/26 21:39, Arnd Bergmann wrote:
> The patch looks fine, but I'm curious about what type of rule found
> the mistake. Is this a heuristic that found that drivers/pinctrl/*
> overwhelmingly uses select instead of depends, or did kconfirm
> find a circular dependency that was caused by inconsistent
> rules?

Not a heuristic, kconfirm-smt is the first complete SMT solver for
Kconfig (as in, all semantics of the Kconfig language are used to
automatically encode all Kconfig files as SMT constraints).

There have been many previous SAT solvers for Kconfig, and there was one
that attempted to detect unmet dependencies (Kismet) but that one has
both false positives and false negatives because it approximates
everything as boolean logic.

In contrast, kconfirm-smt uses SMT integers and strings to model Kconfig
int/hex and strings (unsurprisingly). I believe I am the first to do
this.

So, to detect unmet dependencies, kconfirm-smt runs a check on every
single selector-selectee pair using this routine:
1. Add the constraints to the model that the option is enabled, and its
selector is enabled, and its dependencies aren't met.
2. If Z3 finds a solution (as in, the constraints are still satisfiable)
then we know that there is an unmet dependency.
3. Reset the constraints back to the original model, and loop ^^^

You can also use kconfirm-smt to do better random config generation than
randconfig ;)

Also, you can give it a partial .config file, and it will randomize the
rest of the options that are not in it.

Give it a try, I would love some feedback:
https://github.com/julianbraha/kconfirm/tree/smt#usage-examples

- Julian Braha

