Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFC5F436A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiSRutZE2i6BYCdYYnb6mg9P5OvuB1XSyhcSB7iODxI=; b=2dwxuAqgruTsT+WjehcqMCfo85
	TK4DjRfOUXeSgNuym+0Y8YHxlcLK2UG6Bqlt7+nOpRx7PSCNLH4tbZWjiG/RJZfCo+Evex1KgM9h4
	2N9YmEbf6Ov6p7jN4E9ufssrFap+voBfD2d1Ktb0vSt5ha2U45liIUH+WlSRCFAdIJ9Ci3F+xSB3O
	IM119ktrLOGWN64xoEPxa4D47VMcT6Gphp2pDeMksg8x2LezugwKQFTVc7svJPk0qF5TIpT0l8EhE
	ZuTieFej31QQDjhChWTNWhQ58JkBfqtwgAOsx5kaGQ+Rf2V219m9ccoWq9z6xwoxov4OKHktv9nha
	q6R5VS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjFf-000000045IH-2liA;
	Fri, 17 Apr 2026 13:28:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjFc-000000045He-27v1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:28:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488c2690057so7018925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776432530; x=1777037330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiSRutZE2i6BYCdYYnb6mg9P5OvuB1XSyhcSB7iODxI=;
        b=xjcJOiDb+FoXouYW2UELKhxPA1NkuOL5vJCnXoK3J5paXizlgGBFcfyiBZrkoJtSSA
         0Y0+RYeHaUgJIA43509iRNa4KbgfVdWsE5MOkPHa7hZ+9p4W6R/WQ4OJaymq29bt1GU9
         ma6Iz40bq+s1L98ZIhZjU8LLgoH8AdRWlN6GNpn7+O6+Q4kbmJR94Ysd/kcYLNvtEpE4
         4j02QUToJNk7zMRPfZANKcuKWZOr0gp9g5kcxbOJWjrCAOnQHS6TT4cYH0//abgJ0QJe
         SFi/oJfNAkROKYapo/3E3pXFAfo6ho11kmgc+D+XRXGIT3jSeRrCoD4ThJlk3nzZq2wp
         xPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432530; x=1777037330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiSRutZE2i6BYCdYYnb6mg9P5OvuB1XSyhcSB7iODxI=;
        b=lTyVqYP8zCK8Dj3smr9Bi1IpSZ9JPZsYnRORU4Bwtn8DbfCKZREX0fB5Fp29zfZ35r
         kQJ6om4EEbw9nkTvya4yb1E16tjAN5/jySENrdpNnduP1VPawDjmcL6DvFnVVmzwpiUd
         OnanUPP7U1MVqAVvvbZgrkn6e5OZmvOCRNJejcb85KiCoA+OxUtMlJY5y7w++kfMktoN
         TEx1LSxahKhw05zSc4sZLqOKmSoxRPtgiLXf/sWODFLxF6jgVa36psNTrWQx2yMNVoYz
         Tcz2zBSuHuDhGYp/fkcmHEsZrRbwRz2dxLLKiCbrRfWY5S2AOofZB4MoQedsj5BL0ZSZ
         nE3w==
X-Forwarded-Encrypted: i=1; AFNElJ+dg0hkrbMCe02sypMSFhWIleu3zeAw6KeQ4Blo7fA6wxTnigExKc9c4cbMf/TH+WyXNXpeqrUerSJ2kCiVJYAl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QkHjahqk9uln2kbzzcfFQAl+d3zibSLOW3L8klWp3NEOZpuJ
	uUjiWhTpw9hlCzJmNwxapwL+JaUc1Q1Nf/3jDfNRBP/rRgVwotEZ8hyfBMCnd1eJ/Yg=
X-Gm-Gg: AeBDiet1nCXo6egojTa6GS/KSFsiBEmEGPfOKUhzNzDUE3UDZLX9xLXxzS+8GUbh04f
	v7dM5MZ3BsAxw5FHSUQZaY3C15Bz/YOIkchxp5n2tA3gYoKU/R0CBK4R5fZcJ5tcW6DbyBSsp7c
	829Zgbdn7U9b9ZTM5gYy1t8lflPH6oKOvRR5VsGZSFj1iyj+oKPTbmnJdHMmmPunwYDumnL6kZ6
	lb7ZkXQL91vttW55bRKF5dUxSPzWJNyjZqQbOVmqa5tKTFOgKAp377IvK0PQXmaWNdhV9EP5mBs
	kwQRoX8Tt5SEcvvvx+ee2qSPQusksztRLnGXScV4hW5g1n19GthGPHlWeIoJsn8CmcQP4UtS1F5
	6Ky94+bJCKVnwO/YZmWwtNq8QWg8KiSQKedu80AUxAYSq5nstfNNDEABsSD2QCZJJzkaAw8wufv
	TW7TOWp8VsEYsgiR8ut3qqRyfwsz2vtq6iPT1ZVZaaAQ==
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-488fb784662mr31297785e9.25.1776432530464;
        Fri, 17 Apr 2026 06:28:50 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm40049075e9.11.2026.04.17.06.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:28:50 -0700 (PDT)
Message-ID: <3a36821a-4a44-4f3a-9f0d-5ce521b323aa@linaro.org>
Date: Fri, 17 Apr 2026 16:28:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
 <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_062853_383332_F616659D 
X-CRM114-Status: GOOD (  17.29  )
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



On 3/5/26 5:48 AM, Alexey Klimov wrote:
> Hi Tudor,
> 
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>>
>> The GS101 TMU utilizes a hybrid control model shared between the
>> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
>> firmware.
>>
>> While the TMU is a standard memory-mapped IP block, on this platform
> 
> this ^^
> 

okay

cut

> Is it Google TMU hardware block or Exynos/Samsung TMU block?
> 
> My understanding at this point is that ACPM interface, ACPM protocols, etc
> appeared on Samsung SoCs before gs101 (maybe even before initial SCMI
> prototyping). It looks like ACPM firmware, communication via mailboxes,
> TMU channel, dealing with TMU behing ACPM, etc are actually a standard
> Samsung Exynos architectural feature, rather than a Google-specific
> implementation. I can't say though what was the first chipset where it
> was implemented.

autov920, exynos850 too can use the hybrid ACPM TMU approach.
I'll generalize the description.
> 
> Given that this is a Samsung design that predates the gs101, would it
> make sense to use more generic name for this binding to reflect that
> it is Exynos-derived? That would save us from generalizing things later

The name has to match the compatible. We can rename it when other Samsung
compatibles are added.

Cheers,
ta

