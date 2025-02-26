Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E45EC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1AUDkIYHFTiZDH2tacRrFnFij+C4loBMjOCLBHx+n0=; b=skyAh/AF5QZZjqTIUSbzOZE0zL
	EAxlbQyBirQoFk2z2anGeYRBTnT3Jhc94ABGRHP+1dskW7IRTLc8ApV6Owfk3K1NlqZ0Fi06GNd4N
	0Pi9klQAZpniNc8VyYFbwBXQca7YZtXTNV79/m3eETyz7ICPG7Xf7ZYkkQZmSerJ0lkWr3P9dof9k
	iuRbPTZk6+o72mhr4IOF99SvBy9JjcLzXzPrzfR+FuSb/e3LzaD+vHwS+0mt03wOaVxIRX2rGl/89
	3DWP9mpVuN4aGT5GTHLmYLZzhZOu1DV1y0XP/vdPVD+KOacjL/AVAWfAJKBGb32SfysJnVGjbR03E
	B1UyX8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG34-00000003ZRB-3fZR;
	Wed, 26 Feb 2025 11:57:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEyC-00000003MOg-2QOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:48:53 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7f9f57192so89827666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 02:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740566930; x=1741171730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h1AUDkIYHFTiZDH2tacRrFnFij+C4loBMjOCLBHx+n0=;
        b=Hbt/lyjK8t926vnYz4EgJdLMxrXLv1lkjEmLpb79vi/P2k5X0BcsGrL9qsAW4quRGd
         HVJBYUOZAmlb+aDO5Jfiuey+p2KEfJRuRMLCNignZyff3PhdE94+7TMviqGf14AVpPke
         +XyGLyKNXI4/1PSOTsGAQ9w7tCWEcoBETKhoMQ+njJZoxe2JD+mYVXmhgvSHq6koxT0A
         KVSTdLbtit+V5iiBwRqtfb/PlWLtGHRQWsEf1hb3GDl3yA1Je88aD9I2+mLb4fYbmook
         XMBDlWhZ+ROTqWZAi/Hfo+lk8p++sI6FGQDU551yZK2fgtL5oia5bNIWsRvoNRqGJ4Eb
         McbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566930; x=1741171730;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1AUDkIYHFTiZDH2tacRrFnFij+C4loBMjOCLBHx+n0=;
        b=fB1iAR/X5on171dFAhTfX8BdFu7RA3YK6bV2+f2R+qBSkpoBN/YzOBUNDlGbI5iE2e
         vXsY6HG65vq+sX3sl4GAkgWXseAJbqrXjq3eaHsYoGIwpNi3coTWnTTwVFN/sHax2wLs
         n+AXuFiqfdg76j8qUZxtq5z4mG/SSvlb+SDlwY2+GR26Wrzx0g4HGZY5acPF/mH39WpH
         bxdSK0GPGvM3sONlVjOl/aH1hezs2m+YbN4tWbV8qtN6dOOxyFdz+X1dQQY6Ks098rMP
         yFDHYzBP0kIPJtJ0t5HiW1glVq/jHKeHR+ESlbXa0/bz7SVKx4m9wyqbJlXfgKT4AfZh
         svTg==
X-Forwarded-Encrypted: i=1; AJvYcCVeeI22s5kyztb110t8ndSh1JQsO32ELM/yh4cqBlxvA3o990L/Hrn7ony5S1E+9x+iJ1sJz2L4D/gS85Fv1YwL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz92pYqrCKGBj08cHauVJvleRtr8bniy1kyaQCJybNwqs76+S3C
	fryUNtH1UrfP+9MMnjrArPVVOgvPunAsSAfxxX7nQlHEe4MAFn0c2yPZiv+lOKI=
X-Gm-Gg: ASbGncuQbDeQCV9r1RMuDblxCmN6GM3jNVKnEn0NmWo+bQL2USwpv+KPwD67fy5f5Sk
	FCmD+Ta1iEUfBwm5OBfXixK+2+wLTU4ZG8anP1+UoIHQ4oobsuycEMf6n6AqU+xmDSnIWxnExfT
	6YkP3OJPixCAxyrg1YtBBBwu1yDD+30NbOZxAxsM+k5p3cleGPfHUDFLIJQxiyVco7VKH+nFl6O
	oGsK7XOWMMGqqpCQ6fbrvwrFwzklFx3sugXemrZbUvf6596+T8Lx4Jmb9IbABFyW6CZ+hSwL7ze
	60aG9VbJaUsAU2jEkjtRLmHpL+rkSSqb4LZ8fWdhRNL09e4a3Pvfu00IhovGu5qO6zHXhGdrI8K
	N9UUxCA==
X-Google-Smtp-Source: AGHT+IF28ykvCmrGea/BULemib8daK1hgEdFIdJ/Ik+aL+jlH5A0UxcJcpvI1m83PeEUpmPWVXPeuQ==
X-Received: by 2002:a17:907:a089:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-abc09a43223mr851814466b.4.1740566930545;
        Wed, 26 Feb 2025 02:48:50 -0800 (PST)
Received: from [192.168.0.104] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2013348sm300626366b.89.2025.02.26.02.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 02:48:50 -0800 (PST)
Message-ID: <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
Date: Wed, 26 Feb 2025 11:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
To: "Malladi, Meghana" <m-malladi@ti.com>, Arnd Bergmann <arnd@arndb.de>
Cc: quic_bjorande@quicinc.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, srk@ti.com,
 "Anwar, Md Danish" <danishanwar@ti.com>, catalin.marinas@arm.com,
 will@kernel.org
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
 <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024852_623001_7061D2F9 
X-CRM114-Status: GOOD (  16.32  )
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

On 26/02/2025 11:44, Malladi, Meghana wrote:
> 
> 
> On 2/26/2025 1:35 PM, Krzysztof Kozlowski wrote:
>> On 26/02/2025 07: 18, Malladi, Meghana wrote: > Hi all, > > Apologies in 
>> case you are receiving this email for the second time. > Any reason why 
>> this patch hasn't been merged yet. Other than re-basing > this to the 
>> tip, anything
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source 
>> of this email and know the content is safe.
>> Report Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>> updgnZav1ue7gKXOnHOpH5hg8gLmw9Osqsqh- 
>> KTLRTnBEurV_VetrG7mzU898vB_5xFrYgbRkkuuFMBobM-uhFAmUgccRSk$>
>> ZjQcmQRYFpfptBannerEnd
>>
>> On 26/02/2025 07:18, Malladi, Meghana wrote:
>>> Hi all,
>>>
>>> Apologies in case you are receiving this email for the second time.

BTW, Arnd when responded with Ack described the process.

>>> Any reason why this patch hasn't been merged yet. Other than re-basing 
>>> this to the tip, anything else which needs to be addressed to get this 
>>> merged?
>>
>> I don't think you sent it to your platform maintainers, so no one would
>> apply it. Usually people ignore emails they did not receive, although I
>> am here an exception tracking missing-DT-patchwork things... :)
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hello Arnd/Krzysztof,
> 
> Thank you for the replies :)
> Was having ambiguity since this is not TI specific change. Wanted to 
> confirm before re-posting. Will post v2 patch including TI platform 
> maintainers.

It is not TI specific? Then which upstream boards benefit from this if
not TI?



Best regards,
Krzysztof

