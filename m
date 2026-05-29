Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C4BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQzxiBtnUr7ain8V9TqP5xGod1EBAScgia3DVab5ruI=; b=IKhFv64YJDHv++FRVMQmvLeaT4
	E9hDpxM10XSllrmadHULjP462wYvmsGs5zQvXKPRR7xBzc2SEWM7s5DGRGjr/2Uhzvl26vGQqEuJ9
	wmaU9SdKysnkH8Qrm2sWKm8jKDVYEyIAStQ2LyjKIsa5+KquGQmStcmmRT8VYltUQjn7Yj5rJQW4p
	Dc+vv+fDE8bc1VBe6FTdQcwolOTY5/yRTIJLNaKdtQnCuqfy+XvD64l3EhkmWuDrEyAFA7T/llPxi
	98GeSGQvlw+b8CMnm1HgnvFjNNxGCVRWDIcE+4EU4CUs0o2BgvPtkiXJLytiJKx5IUEn4dim7fvxI
	9CYP7RUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwSm-00000007OL2-0cIt;
	Fri, 29 May 2026 12:37:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwSj-00000007OKb-33Qr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:37:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef616daf6so124707f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780058235; x=1780663035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQzxiBtnUr7ain8V9TqP5xGod1EBAScgia3DVab5ruI=;
        b=zBEsyjATRIqCLwvWvuXOw0E+vg3dCN8CZb5P8boxGfz8PxJ32cVnKN2FXLE4j4YB6/
         uLfeE1GpL20mHFJMTOJRGImDng5TZOeCI1ypOMl30oGkirr3oRIUSLIL1Y7hCWx7hY3R
         Hy02DHRfwNHPjtdQkQry6Zwu60cHhdmfE6rgWhPFQM8W3b0G/b4BTtkyb1NKA8yZk3j4
         5ydnpOVOM7NUTbFosLPTLWBhQAkTu+/vqGCp335UrDFNVA31vykM9bA5DD4c/4B5g6E3
         cbFKU41fQ77mxDaKBT3NaGLYyC69kGck53rxtZ8B+xBN3YR30lOKGY+3V0s5YuOLJjcb
         fX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058235; x=1780663035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQzxiBtnUr7ain8V9TqP5xGod1EBAScgia3DVab5ruI=;
        b=TH57V3o1pYkgTuUQQpgH00vbUyRUKsOGjK8Xqvy6oBPbIj7/KPmmfOE2qKzlbDe78A
         K9tQ+wFHTRrparckf5JnBw3+ubGuSTqjraByJsZ3VCDbDan0oHC0XrPHV3tkBxmbKQfF
         U2v60fQF6e5VsUxLpZ+gwZIjyDeQAFmDdv2meRBY6eI5P6ft7Nt4I74cpYFvQpsKLruo
         Ou5203SxW7l/Q6BwBgsU9CsFjribpBfM+tuTmm6LZWK9m1bXbUmTBCOtzy4IuhGBN8Yt
         +IU97UNBBNam2ACrf100qsJy2O7mg24IF0xKH46Pnl9A4VutNtj5/Cx66ThYyzeke4gv
         o7HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u3WqfsTaUWefbw/H8qA3v+t8LSGTU27blPQktxp9226cfzC5Wm0LJ7lv0Bf2MVQF13R0jjx6fwXGCShjba++1@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdSp2pHDvNgl6+hzKeTsBzyoSOyPxeWO1suOPObp3d/YGLeky
	ccWeNw1nnnEP1qwVGphVND4sf3nN7OncK6KNE+JAZ/N6w5fzaoA3AZ14VDxhDU+40WI=
X-Gm-Gg: Acq92OFxc1aoJHBmcCCVoviwt6rbZhLuuaaM/212oU9IhV0yIgEyAlMrUi3tVeUkk4m
	HPER/e3MO4yvO1Yx+f3mhuYXYhErQeiP9dtYFTX8hmKSOeOp5Y4rrqcIuYpwu0wvwShL1GI1hml
	+VXma+rug8SfQGs1s9KYuBA+KpLYBVcy2nXpyXWqGSmIiRzPxIZ0c6j2ozNxhhdunyS1NO/7/+A
	RHeoSwHEdgtOnHu1C8z9INZK9oiKvkPad6lmQ+CLOTLl5H86ENgKyQc7A2kTj1oDFZ+DQcYwI1p
	wLGcknIlIvV+WvAMkZ5W+s6z/4wK57eofcivjCHfAoQZuY9sffHUvrZUtxOAjCMxc7ZlBRmBtPK
	gVA1+KzTGrqRkrDgFspnceFt3y6PMuWeEz3MgdMdyQTFqlO5nzp0knvR6SZLHDDpel+Zj+DZvRr
	2hK25ORs8/LVpx+MptJQMf04KuZrEkqAhfSEN4QaKU1A==
X-Received: by 2002:a05:6000:470c:b0:45e:f2bd:2b16 with SMTP id ffacd0b85a97d-45ef2bd2d41mr3802790f8f.18.1780058235304;
        Fri, 29 May 2026 05:37:15 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm2981872f8f.2.2026.05.29.05.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:37:14 -0700 (PDT)
Message-ID: <a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org>
Date: Fri, 29 May 2026 15:37:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
 <03dc9ccc-d819-413e-b8fd-23ccd85675ba@app.fastmail.com>
 <6c77d706-5944-4e7d-8a4a-b3a6cac6a83b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6c77d706-5944-4e7d-8a4a-b3a6cac6a83b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_053717_796855_ADFD52C3 
X-CRM114-Status: GOOD (  19.02  )
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



On 5/29/26 3:09 PM, Krzysztof Kozlowski wrote:
> On 29/05/2026 13:51, Arnd Bergmann wrote:
>> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>>> Sashiko identified a potential NULL pointer dereference [1].
>>>
>>> The dummy stub implementation for devm_acpm_get_by_node() returns NULL
>>> when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.
>>
>> I meant to comment on this yesterday as well.
>>
>> Having stub functions like this return NULL is a common way to
>> define optional interfaces, where callers still work when the
>> feature is disabled, though this clearly does not work for
>> acpm because some callers have a NULL pointer dereference
>> when compile testing.
>>
>> My preferred solution to this type of problem would be to
>> just remove the stub helpers and drop the ||COMPILE_TEST
>> from the one user that calls them, see below.
>>
>> The point here is that CONFIG_EXYNOS_ACPM_PROTOCOL already
>> supports compile-testing itself, and all (both) drivers using
>> it clearly require the support, so this just simplifies

I confirm that the ACPM protocol is mandatory for the clients to
work, thanks!

>> the option space without losing any build coverage.

nice, I didn't know this. I guess it's a "greedy" algorithm in
allmodconfig, if the dependency is met the dependents are enabled too.

>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
> 
> Sure, I am fine with it. I'll take your patch with a bit adjusted commit
> msg.
> 

Thank you! I need to drop the devm_acpm_get_by_phandle dummy stub from:
https://lore.kernel.org/linux-samsung-soc/a59c6e3a-6092-4114-8961-c2a71a812959@kernel.org/T/#m0ac077507129c37b84443513eecadd70b5eaf8b8

Shall I send again the entire set?

Cheers,
ta

