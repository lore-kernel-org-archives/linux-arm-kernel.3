Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD0CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=; b=HIhMlJnWL+iwa23+wMOr5zJdJ1
	KEq2tqSq9zEYCkBpctQmCvXjojSjuxYQqnDIzN6b1KbLIxzeoW1li95ij4i1qR8gZfutmfDgMsCkA
	3G9+7xpQNmISScl2JvzMYEq5KvySLSuSoDfktEGSybaqeUoTU2a6DF+vIMdpIKJK3UnPGCzy7FXAn
	I1YSEWLVxaPM6+ivpKbAYq19cAWg6Mvv9W6zek9bcTgtye3msvZw8KUQ2SNB/xYx0syN9Ed9g7SC4
	5RHIfaj9GFpZpbmQXluL8aS37DMcywGsn9EVxlNbNfs+uzS9tgbNUI/IpzPEcaWl0CUm8yE8t9W6O
	qNAqqKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvsT-0000000FNtL-0pNz;
	Mon, 18 May 2026 11:11:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvsS-0000000FNt5-11Sm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=; b=KoQ20FL1r2MPMqTftfApZ8kpbj
	1B5ZbHBPZ/JZmXskuAnZnTuSeza/M2v6uh9gv4ja1+fNH+lwMVb2txbZmt3OCOcodFDui117sLppj
	vWpZWIrN6B+4+ATIqIOKMl/+KPQAz+sL5ZW0HeHXunPmiBdz1rctTNFvuW/PjWo3kTcbtG1+Ii197
	kS4aI12zDr5heTMAdSM1lw7DHZfWTueWhpV7UFjqgI5LG/VoTrih8q9yR4cO1wS6Sdhnj9gN+0NgH
	inBmjnwjcSlerR8KGhuBBTUEpdBISBLsTG1alCwqtcOqmLw9GM9JaJWz/aywxChVjZaWeRqQRBTPy
	t6HtHAZg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvsN-0000000AtA1-35Di
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:11:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1702850f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779102670; x=1779707470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=;
        b=YWzhAoLh7CLeYaJzDph6dBTcC8pVyfhgUMPCbXmv1gfn4KwKfNFVQ9gyekI6WInU/C
         1GJ9J3VsF9OEBGZ6aNuo8aYydqD0e8O+497RoLylHVxabXKzEbckSJJ192h1+8BuBXgw
         nAwTA9j+oLFH3KzWo8f/KihMN6T7JhkRCIXCMzlLUbyKIbKGpUaedeAWIWM7YgWP0sOB
         JSls1VWKdQ46iftbiABZEJYfdg+AEefJrOyx0b4X5ooywdk93xm1JP62CuYEq7yJAQWM
         2dFbZLzbAkF2dWkZB/1RzM9u+JYGUZgi2NdiUMNYxz9vJstuO43gGTz1zJZDUfCTamkJ
         HnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102670; x=1779707470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=;
        b=PBOlk6JzPy4yUJ5YMb5wyL9t5gB90FXMBB68IUBHfTor6uf9KJoqs2i1cwyytmHYtZ
         I0BlnlDgOyBOcwXAd7yIpfKn5rusoBy5amETlOLtC6C72G6/pPIJeo/tyWIHXb/wzmkg
         YRuihYWF2AWAAIZKAZLzAUipb3z2f++mU9OzmtIHWHy+rL8lxj0c1T29t109HApVKMDh
         0pXlKcZyQuvZd3YbjiGVuEYxCv+A2kBJ49oD2nCPxVLM01aBWUfAOtHMVnLXdp7A7TEI
         xBq7QmopV+ziHUe6wmW9G4Gk5Rp3JqKQbxaX+Ryf/spZ3LLIeUOpM79YA5vpSIl/STaj
         Plfw==
X-Forwarded-Encrypted: i=1; AFNElJ/ljcod9Uxp7aBUDBKxfurLm5P+2XjlWfPrG4qqBhx94w4j3RcSZQmO6N1M+Tn5ap4aiEk4/Sh3VbeoazMe5QWj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy+SaRwy2C7L0S7inwMn8rV0l8dP11mXBVOCGXXhnKQCy81v34
	0bWtm8wY9adbHxRmsCFSd5n0CS3IqYVv6PCYnRB2aV3FTzBUJq69f0oRNZXmbaimclU=
X-Gm-Gg: Acq92OGJ0vPUIj2oels5gYPLgJxVP/BIjWb52epUBMKjP3ebEa7aJZL9+BA0fSMspf1
	7RXus+Hf58apNaIPFdkz+E9NlJguN8cBQjhhpVWHyr65slQH49Vl/MNDO7tVnEhdYfBG3UrARQK
	iwo8LiPCw8VwoB6ZxdBSmjJ2OAV1KDu428Sc2zyC+H23v50sYQ7jFY8VvIdpD9LcB2sQArPb/KL
	FsQIU0yd5Yf8+RaUWtxM1TKppz1nXrCCafk5f/HY3RYTlvLN+P+OSiwGGabUUYkNdmLP3wQOm7v
	sBXjPazB4kExxQJqHNn64YFEhKfRAAy2Zjmc2ZpbdC5WMOT9TKlrh32tZB1M1XLtfWrn9DMtpzT
	IA9G0tWgpe84TkgJUChz/Gc/Nzmf6dOHuq7y+OOk7HCP/Z0wZ6l1t6llEW6Ub4Li4N+ZLd3CK+U
	Nx1TE/RYQB+NFSG+6IgHhvOALtsRj1Xs0=
X-Received: by 2002:a05:6000:25c4:b0:452:c246:ab79 with SMTP id ffacd0b85a97d-45e5c5894b7mr24451750f8f.14.1779102669836;
        Mon, 18 May 2026 04:11:09 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35689863f8f.9.2026.05.18.04.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:11:09 -0700 (PDT)
Message-ID: <52063f07-626a-4f60-ab62-66f5df5f837d@linaro.org>
Date: Mon, 18 May 2026 14:11:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
 <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
 <b1631f32-aafb-46fc-86c8-daff0d6dc2f7@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b1631f32-aafb-46fc-86c8-daff0d6dc2f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_121112_236260_9DE7037A 
X-CRM114-Status: UNSURE (   9.85  )
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



On 5/18/26 1:46 PM, Krzysztof Kozlowski wrote:
> On 18/05/2026 12:27, Tudor Ambarus wrote:
>>
>>
>> On 5/13/26 2:12 AM, Alexey Klimov wrote:
>>> The Exynos850 SoC contains an APM co-processor. Communication
>>> with this hardware block is established using the ACPM protocol,
>>> which handles IPC messages for clocks, power, thermal management,
>>> and PMIC control.
>>>
>>> Add the "samsung,exynos850-acpm-ipc" compatible string along with
>>> its associated match data. This includes the specific initialisation
>>
>> s/initialisation/initialization 
> 
> Hoho, careful, that's a quite hot topic :)

:)

> I think we do not have kernel-wide preference here and even if there
> was, no need to resend just for that.

I wasn't aware of the British term (thanks Alexey!) and I already gave
my R-b. No hot topic for me, thought that it's just a typo.

Cheers,
ta

