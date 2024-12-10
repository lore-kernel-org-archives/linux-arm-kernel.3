Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7019EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtkbOnbOImJWM921EqNDpx2/bp81PNUuwOmgAcMVe0c=; b=0rwuGGgIPzvEbuXoCvbKC2or/u
	ymaXL62G3soi2R+ku452EIfUlDumrK3OxDcSofei+Vyi4GVhac1KH5H3G6r/oQhcd0jTiW3tC3IaX
	4IRWAsnD80UmiX+tPKF1JO/ZX7olz76QA/mYI2uLqw1/rxgokIsUxTBddbL7Pi/afkZ2ycKvzTt+L
	GsPTKhnsCnx7wTuTY15umNhq5l0sNfaSVyB+zEbP/UASj1TT9ORpJMi7YLnTMl7fdJhS9mZq9N23C
	wDMU8S7fMgbUzDag7XJ6NPVm/N+3H6BZnyltL4b3QKysxGUM9+lGo66rYdqXRlk9VWvB736QEIidq
	Sxk5R8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvs8-0000000Al4H-14gV;
	Tue, 10 Dec 2024 08:45:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvr3-0000000Akm0-23iX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:44:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434f398a171so1974395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 00:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733820267; x=1734425067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gtkbOnbOImJWM921EqNDpx2/bp81PNUuwOmgAcMVe0c=;
        b=BIWzpYU6IE1B43BCredqTul0Mf511vuaXCladaO62d5n/QibhYg/UsMaUk5xIk+p2y
         NHObtyEfNJCrqKcXRU7vacL7W1HK+fiHc6TlRmUEZ1+f0ByqNiPZ+DbhHat1IZsAuglb
         QRGpAq3YLUe+fEHoYlhOggG/ZkmIoWXGQKWgsvPkzlQYsYhTTpEO+OIbJ+c9TuRK0VCH
         FqE1Mw+vdgxcVWgXZysSBrfgTEezzP7uE03vbl3elYfJm9y1owBAtpKPbZm6FVvSp1Cz
         lD9HwvRjexqBRAe+pp1/TacGvj1+PzaAMOrnOusnwWRS1QFOgn0L7nFM8Z4dp0abRotC
         HfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820267; x=1734425067;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtkbOnbOImJWM921EqNDpx2/bp81PNUuwOmgAcMVe0c=;
        b=ksJsJw9gSl4yJZt41TuWVE6IxadV2IK/DkUftghFL4oOBwHTpUTsuNeUV789VrqCnL
         32Oz3sGnd4+j8SnoSy+VkollDn8g5sbfejJr/T8WeeDxWm42Krhp3FZbLhsnRH/BxRFj
         wvvBCRyF7Cgln8csj5MkEkNBRCM1tIwtpR14+8iZVgusIiXhwdHbucMUERFdZj8pjSah
         Q+oOXpL4BjNnBG7AqdftYlGwjwj/ySqlgcukdMVwZzqZ3oa60YxA+NPeelaUg3CWaqAT
         9F0NoohnPnXxQGjSsAi12gSwIxJlt2+rDoBESN7/ehfsmYdXbeQgc0FqGufmUPgwHjSb
         WMDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbKUpeFwq0Xrd5CEtPfDOpiTRo0p2fO5iMN+3hWv+A/SXSwp4sTvXcAtz4HF0lHKFIDyFUZ+2GzNBue/DVJFv3@lists.infradead.org
X-Gm-Message-State: AOJu0YxqTKr2NTFA6CeK18JMwRImAztOcyLxnM+TshymVudxLau6USiV
	lZ2TNjSvaO560PSQzxeznoHHEKDkauPyKj/qRyXy/gsw/2MSBsx1i+CY7pDzSXA=
X-Gm-Gg: ASbGncvlBnhmwCXaBTL3RI0nZQVD2jsl0kCfsV/M0wtb4uai0XVgoZpkTJMJV/Lv9GC
	hlyBnYzt6ak9OHk9cbnV0WNOrU2dOc2pJoRT1Tofu76IS1JGhnpydCmgPYOadoKAzNDL4BafMds
	IrSnr0TabpQc5JDHGq9EDmUmVJ67cFjBiAQJWiUPfnJmXyGJtMPRoQtxaaoMD2aaflTLaY6NZpT
	uu4xba2vVhWEAOU6C9pVtczwwrbslcQlxVVDGrFOfK0oB4ecCjwrRJ2AEbIuHIFalpx5zyT9A==
X-Google-Smtp-Source: AGHT+IGPo+343UL/XQMovJpUM2fs2wVtTJ2f6VeXfpBxnUXzR6Wmli37wiQCf2jAuAJMbmj0bMBcWA==
X-Received: by 2002:a05:600c:1c28:b0:434:a0fd:95d0 with SMTP id 5b1f17b1804b1-435019a81abmr8538055e9.4.1733820266783;
        Tue, 10 Dec 2024 00:44:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43502fef1f9sm17875605e9.1.2024.12.10.00.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 00:44:26 -0800 (PST)
Message-ID: <0d23ccf9-3420-45bf-aac7-5c1a075e031f@linaro.org>
Date: Tue, 10 Dec 2024 09:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: =?UTF-8?B?S2FybCBMaSAo5p2O5pm65ZiJKQ==?= <Karl.Li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?Q2h1bmd5aW5nIEx1ICjlkYLlv6DnqY4p?= <Chungying.Lu@mediatek.com>,
 =?UTF-8?B?QW5keSBUZW5nICjphKflpoLlro8p?= <Andy.Teng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?Q2hpZW4tQ2hpaCBUc2VuZyAo5pu+5bu65pm6KQ==?=
 <Chien-Chih.Tseng@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>
References: <20241024092608.431581-1-karl.li@mediatek.com>
 <20241024092608.431581-4-karl.li@mediatek.com>
 <083c8f7b-0969-4ca3-8a91-35f5767c5f32@collabora.com>
 <CAGXv+5Fw+qZhTTgJq0QdiQHgiQP2ByR1tgae2+k4erx+0fp61g@mail.gmail.com>
 <a3c3280478bf86eb97a422782ce60ec4eaa35224.camel@mediatek.com>
 <0f98405c40530d81c342af06dea593e7babedeac.camel@mediatek.com>
 <cf75f3c3932ddc50f5697bc4f394bd77fc16cd39.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cf75f3c3932ddc50f5697bc4f394bd77fc16cd39.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004430_344654_532C7198 
X-CRM114-Status: UNSURE (   9.97  )
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

On 05/12/2024 08:32, Karl Li (李智嘉) wrote:
> On Thu, 2024-12-05 at 07:05 +0000, Karl Li (李智嘉) wrote:
>> Dead maintainers,
> "Dear" maintainers. Really sorry for the typo...
>>
>> I hope you're doing well. Just a warm reminder that we're following
>> up
>> on these patch and really appreciate any feedback you might have.
>>

You received like 6 or 7 reviews/replies for your patchset. What are you
implying here if feedback was not enough?

Respond and implement the feedback instead ignoring it.

NAK

Best regards,
Krzysztof

