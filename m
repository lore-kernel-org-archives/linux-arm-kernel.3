Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF55C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df+4L1elpYvZQ2TC5vTqzd+H8qoM4CFkwhii1CqFDDA=; b=xOldNDLLMV/GyZkvG0K99mEbvd
	QoicR+i48Tlx1v14dTVDnMFXq0TmKXNJroEqPN+vf/YRQipbXFbpDUwMnOlgTCdQ2U+GsMOXeLd1+
	VQlJKf9O8vfxREP/Ux/XD/iZLn0b3MBHTDgItpF2fnJamx8p39Gwjbc91s66aWHn4ebiCEBRx+1Ki
	nSCguddADj+qtj5Z3ZOMkvwoMPxbMIeCc9RI0Jn1fZ+DEMjU4ns+00WIjgXeiPPjopRMnFlfP1C6x
	z9LjDHFYm4bFCItRduO+QCYpygD9bQxhKk4ExxfvR2gC/RQSAwxYvqc3gGGY8idab32y5S/bTn+WY
	q/FNOL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnFO-0000000B45O-3Txi;
	Thu, 27 Mar 2025 13:26:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmwf-0000000B1RE-2WD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:06:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so502695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080811; x=1743685611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Df+4L1elpYvZQ2TC5vTqzd+H8qoM4CFkwhii1CqFDDA=;
        b=vuCgehB7ZvaPql0zKPeL87/MK21yfpnyMLekWKeSUGiHsfm1YT7xYmLXVe8H0qnkKw
         /goxgk2lrp9XtJtWweHXU2pPgdlCcZqYYIWsfDPtq3pT9qAqc+vzmgGZ8hnaomK04bhs
         rQWuC66435Dd80EMeM0bxxAr7MyzOmm4xtXFxkhgiSamXAezxqz6njYwZtr5OrkwKl6P
         i41AIDs4Up7+C7JHCaIpHECRZZk1wC3r+d087T9agnwbBEbbgj0uAItFvR9XCJBihASS
         OIXS9ycfhVZ2tz+CKaIfJLvGJtZOr9SRwh5AubnxVzRbCs/UHZ6fLQOIe6cdKKSeQUsP
         OTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080811; x=1743685611;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Df+4L1elpYvZQ2TC5vTqzd+H8qoM4CFkwhii1CqFDDA=;
        b=g6K//aykJyF2QUZxOf8d15kYBll8n/D6D/DyJIeVPJR+b1ytHBTvXe8YuVSykL523U
         gvP+Sv+/lbKgZ58RJpXpqU3uitUD1dckFb3ky6Io7xowrb4eiYkFARYVpzYMESuHm6ic
         rDa6z6eM3LTq40e3498h3tsEUY2Kx8vCG/bRq1mVDCBIvh/U7GXaGF2aKRkeQjctziBT
         Dm4XwTx4QZLSJncysoCClqa1ktMcEeCuHDpqQF/Xf8He78zdRrlITs14F1MbAWoDlx1c
         xw360z+asL9yxh6bQxktZtB8Q4Rf3LfANOdbbAvT7vb8ylQfj5gLzf9blQW3dRHGsbaF
         cYjw==
X-Forwarded-Encrypted: i=1; AJvYcCUt4rDtTyDN06GywY4gHZjp9CPXfKQGT0qvnMeDE5Nh8AlWZipFe5og+Iq8Ryb++lMXQIBE2xwP+QBAqzfdYdRe@lists.infradead.org
X-Gm-Message-State: AOJu0YzX6//Z+A9v0NumSDfDcjUHxJXeJdaXN5Hg5mJZUo4FckJH09Rr
	61m6Q266xjEDWczJd/sdIdG2Cm99CTU3ZHP+p2O9LALeQyiyv/nx1BtWM3jr8qzwKHCFEle2s8K
	T
X-Gm-Gg: ASbGnctlzKUVJO1QLsJ2fMBrdgE9hS/YgSb3zWLRArf4WiwtnlWuxpLAKnhqQf9I8tM
	9T62acwECs49NXpGCB2Nd+EghZ8l1wJFYKS15cNW4TlqfQrgM1kuCxDDu4bMh4Dg/BXKMRBAhKv
	uncAbMm07vLFfcM6yJqjz30B7JZyPCNGV/95Tv02aQNdQiJ/MrPUPAxiiD162hpKvkoiDTHVrzs
	wzkJBp5hAHHU33kQZch7dBP/RfMGVsEqHE4iENEfYVVGTKPKD7tXD0Skoq9+EkL6QmHOzlg6iWl
	p1pAU8dauNoCdd52+3/bNVrAiDjmGcB0WSQmXAilfYcUqeZBIHENJn3REbh8S/A=
X-Google-Smtp-Source: AGHT+IFAxDWavcatGQJ+zlLmbtRY3kC4YK9xaSKAOvtQODs+VlNjiHwpMWJxGB/CTTasTcwhn8wPlQ==
X-Received: by 2002:a05:600c:3509:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-43d84f0e854mr13468175e9.0.1743080811001;
        Thu, 27 Mar 2025 06:06:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ac9bsm36639915e9.12.2025.03.27.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 06:06:50 -0700 (PDT)
Message-ID: <cba249f6-5552-4538-a2fc-4fcd185fefd0@linaro.org>
Date: Thu, 27 Mar 2025 14:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
To: Peter Chen <peter.chen@cixtech.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl,
 kajetan.puchalski@arm.com, Fugang Duan <fugang.duan@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <Z-UNufwSNmZreKya@nchen-desktop>
 <b2e1da92-0dfe-42c6-9f36-32486b768220@kernel.org>
 <Z-UeoIe4CPD3LwJv@nchen-desktop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z-UeoIe4CPD3LwJv@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_060653_652825_8AB3D378 
X-CRM114-Status: UNSURE (   9.73  )
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

On 27/03/2025 10:47, Peter Chen wrote:
>>
>>>
>>> I thought we need to move one step and step before, and keep clean
>>> and avoid warning and error for every submission, but it seems not
>>> the way you prefer.
>>
>> No, from where did you get such impression? Maintainers-soc-clean-dts
>> explicitly covers this case and I WROTE IT, so how can I prefer
>> something else?
>>
> 
> Krzysztof, I did not mean soc dts, I mean the mailbox binding checking
> warning which depends on this patch set.
> 
> https://lore.kernel.org/lkml/174290730775.1655008.14031380406017771195.robh@kernel.org/
Ah, right, true and usual solution is:

https://www.kernel.org/doc/html/latest/process/maintainer-soc.html#submitting-patches-to-the-main-soc-maintainers

point 3, but heh, I am repeating myself.


Best regards,
Krzysztof

