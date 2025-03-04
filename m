Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B830AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=; b=Adg1cSv5ym5ChPgukg8wOkmmpj
	3C8FyhM8n6tvaFIy/kQ1gx9foHzbtoYdhp1B8VjUjHiCN3t5LL61v+y2M/VS2KHL1ca9gw+K2bfcH
	wyGoxVqJSf0NXiZ1Iuo0pad5Flb4YygYg/8V+lZlBiKzC7k0SlUYcwhEbVKjIVOzjWqOdZ1OuY3+6
	0QJqNwogkGIdBUTCCUqcJwjsh/ofRihF3qggrfgpL2UaevI7LpmQ/DKtqlCzv4SZ3DmlMb9UaOygZ
	lu0P/9Jhd0u66etywxPPpnJTzUyIHTWbmfCDkrh/+QcWrRQXnYbKPij+37iRQh9P27zjkBjAFpPeL
	mZ4aeEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcPQ-00000006bU4-1Toj;
	Wed, 05 Mar 2025 00:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbEC-00000006TUo-39Bs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 22:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=; b=qk45eL6Hxrvm18f0FsOrfj6jo6
	4iYVeQwwvH0+Feo+OHFU9oZt8LWs642gxy41wYH3Ma90hFMnF23/B1D0e38BeRtqMp8cOd70gLPOE
	Uhx7B6foOwsVF3se6tlGsprxaoYyPEWFqETT3b2ucidcM6+bPGJzbO1+XbEAIB7Zz6gk/I2v7EL9p
	ghC0Xf+1pChG73nBpY58w85XAE0D82KelEOk+oPY47IGdaHwsI6iCWyJ3zHfyw2LtxukD/FnHJnva
	CrgMERgWR+LQDaRnGqlZ+6vYPuTBTV3wtKP/bo49ffsiYQQcnBLkch1m1t89xZbGr+FbzbkWH/bKH
	swbmwYrQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbDz-00000000GG6-2rpU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 22:58:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so55270485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741129132; x=1741733932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=;
        b=bbcMxwZ185aVRa0AK6Ha9TC+eSC8LmgPS6UbT/FXLnaetEbWkYEVr5vo/f510DEppk
         ddiLFBSvEyPBgCM6ofV5Zr3Q/oVqBZQxgphOSuIzvmfPJXBkd6olZy23yuXjBA2YJKGS
         gM1WP8XOtlthAuVykv2hQ0Yz98wSSXoIaMczRA1XMHuRIcn+HOny9+qv83VFHdiXKQgy
         fOhD9CBin0jt8ElGX2ADESXwavuEJGekVuqQrGqZXVt8T6e4XQGr8dfPngW/rJwgSCHw
         Mrjn7jrOWIQ/RcZLhYDkUKZtxVqfXdtkgTa2Yzy294UvF0CeTgETXA1ggPIVQVkFzAN5
         xU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129132; x=1741733932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euJMffvlvKCZA7VwIhx2ASa4VsvPUMdrYRd7gnRpu9k=;
        b=EKbvF3EnmIFGr5MBSpcxiW++H5P3myTsYzJL+6mPkHbAq6GId9eLmie9D8/aAOlm5N
         ZoggYJ8jQQuGlYbOBXANZZp53sY9RUvMotD7Y5wLvNfUiibgUTAUYO8yVbSfGojRtnUU
         pFOleTsurXdTH91ImyK2Z12jByiIJRZQswafyl3quhkWMAaajnbD0ogbSr6sOJpZobX2
         WDsk5Cjl5+mjEm3/bPpkmBlcx2N7/kYy76HamJvBIFFOyS35fjO/ommkPZ8vSmDaN2TO
         54xlWclw5iqZbGOePca4uSwpaPvXJRzB447wl2ecYHUQxw/CGYTZyxwOG0pHQLYLmMSj
         57Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZb4+sJL3TWMEwhiLmP4tjBYHu/J3h5MXbH4tuH3CVwClbbqa2wxLXQ62OKiB5fXJj5kf5sHmQefEBVGouVFq@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1Z4rpteF/RG2A9WGbTWdzAiM553JTij3Gk5yhL7ChPlHcCFY
	bxf7rCIKOB13xaqnv51DjTInJlmW9mixYMbg3rCfmY0aST21ivmo
X-Gm-Gg: ASbGncukXvdE5cdnRURZYeKOIawDSTQw38Z0dqA+MDX7plillQqhZNlpuvqCC0nDFc/
	2BhJuy81PSKiPa1KzADpPmXaCsp9NaCTyQ8ojk43t62JyvlKFYQVHWPyj4rCe3TEnnjpgePf9BU
	XF4fRQfNR3U5rW9z6St6tFE3oOJjVyhFPOEwUKvLwETSWTSjFG4KdwNB2KMjQjkjM+uOaRiVYGD
	Cv7MiEOb0eGgjowvPbe2ei2xqryxEjEUtxUzUJ7UAvKxajDJPcAZfR0+L5qYgmE8Tn8bKdlvKro
	smYCy37Y3JNB6N5icQqmRngHBHITsLVJRaJqKHj7KVhuraCY/rIbObtqtCLEdxIxlfXUrxMeGw=
	=
X-Google-Smtp-Source: AGHT+IEnZTNGMRVDZWEmNMh2Ly2iO00Yysf+lVJrqtBsE5l6FSnrdxxlk5xiRwD/bXG0pp141DVtRQ==
X-Received: by 2002:a05:600c:a409:b0:43b:c2d7:44d with SMTP id 5b1f17b1804b1-43bd2adb09dmr3443515e9.21.1741129131631;
        Tue, 04 Mar 2025 14:58:51 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ddesm18952075f8f.41.2025.03.04.14.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 14:58:50 -0800 (PST)
Message-ID: <541539db-0015-41de-837f-aabbea68486a@gmail.com>
Date: Wed, 5 Mar 2025 00:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
 <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_225856_764284_D420BE0E 
X-CRM114-Status: GOOD (  25.18  )
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



On 2/27/2025 1:28 PM, Marco Felsch wrote:
> Hi Laurentiu,
>
> On 25-02-26, Marco Felsch wrote:
>> Hi,
>>
>> On 25-02-26, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The AIPSTZ bridge offers some security-related configurations which can
>>> be used to restrict master access to certain peripherals on the bridge.
>>>
>>> Normally, this could be done from a secure environment such as ATF before
>>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>>> domain is powered off and then powered on. Because of this, it has to be
>>> configured each time the power domain is turned on and before any master
>>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>> My question still stands:
>>
>> Setting these bits requires very often that the core is running at EL3
>> (e.g. secure-monitor) which is not the case for Linux. Can you please
>> provide more information how Linux can set these bits?
> Sorry I didn't noticed your response:
>
> https://lore.kernel.org/all/a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com/
>
> If EL1 is allowed to set the security access configuration of the IP
> cores doesn't this mean that a backdoor can be opened? E.g. your
> secure-boot system configures one I2C IP core to be accessible only from
> secure-world S-EL1 (OP-TEE) and after the power-domain was power-cycled
> it's accessible from EL1 again. This doesn't seem right. Why should a
> user be able to limit the access permissions to an IP core to only be
> accessible from secure-world if the IP core is accessible from
> normal-world after the power-domain was power-cycled.
>
> Regards,
>   Marco

I'm no security expert so please feel free to correct me if I get something wrong.

This isn't about S/NS world. The bridge AC doesn't offer any configurations for
denying access to peripherals based on S/NS world. AFAIK that's the job of the CSU
(central security unit), which is a different IP.

Perhaps I shouldn't have used the term "trusted" as it might have ended up creating
more confusion? If so, please do let me know so I can maybe add a comment about
it in one of the commit messages. In this context, "master X is trusted for read/writes"
means "master X is allowed to perform read/write transactions".

Even if the bridge is configured to allow read/write transactions from a master
(i.e: master is marked as trusted for read/writes) that wouldn't be very helpful.
You'd still have to bypass the CSU configuration which as far as I understand is also
used by the bridge to deny access to peripherals (e.g: if transaction is secure+privileged
then forward to peripheral, otherwise abort it). See the "4.7.6.1 Security Block"
and "4.7.4  Access Protections" chapters from the IMX8MP RM.

Given all of this, I think the purpose of this IP's AC is to add some extra,
light, security features on top of the CSU.

