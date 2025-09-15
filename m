Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC28CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 23:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+l7LUQcajOsjM5wGJwbkfQJik4Yq7alB7BOereQy2VE=; b=2IkfmKqYF6TyApt6knllrhTU12
	qd4Ge6gRahY0IAT0Yf6gYzQ6414rA5ax6qpMS4kXMuWcLxgWLAlxTIEz16XaFfcsdNPQF6ymAcBjK
	Bvmq3pyE09mmhrXbwg4OwOtBdhSiVUjFtPxN4/j4hTbbqfE3jtcKAxV+Ty07OerZb2vMxDeuG2Tx7
	D311ETDUgDQLMvmTboENsfNbL90StMMxn7096lVsRaJceu7NDGYnHNW7UQiGmEI0aitufIEHosiOn
	UJCaOde34BB8Gv/Sq32lm2roZ8o3ahoYtqWAHP5dofcRkPnZRom2ZhSSJBhD/VKMo7xOw6gm7Q+WC
	AK2X8gDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyISq-00000005rvH-2gGx;
	Mon, 15 Sep 2025 23:18:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyISo-00000005ruW-0ZHw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 23:18:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-777ea9fa8fdso1314863b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757978305; x=1758583105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+l7LUQcajOsjM5wGJwbkfQJik4Yq7alB7BOereQy2VE=;
        b=U4iFA1ZTJ8cX+L9GyAvnfURcLCZxLp7isFaC1fHF854UB0jnKSoTJkm9GzolaVDgGH
         gVlUDlDMJ+kpvhT29dbGhQ3trOsWcIxkYH8jLu+zqB/VOPseC+IpS3L1Wvvd9mqeJKM1
         eEIAoNTS1+g6UDStEDCXkZurJLEyP9TweLJ794Cbjw/8bAWwADEMh4a8/9xSTRrshUjY
         ucpw4Q8n38q1CkhKz+rfySgfP9ta6CSk7+CFVLmzRi53F2sZdWJyvu9o5Q7QfiS0YZ43
         w5Za3XCUITvbkA4PNFk1yS3mTH4NdTkzbWDJsf+GG6nIu5TsTqV2MOOtaLOIUg6wQJw5
         4Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978305; x=1758583105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+l7LUQcajOsjM5wGJwbkfQJik4Yq7alB7BOereQy2VE=;
        b=rLsSib+8YzwoJyNQwXK7BRlT3LQy3cOaRYA6VdZEZSCDGx2ERMi40F0mK4edFnL/A3
         wkQLT55Ax9YCoFGq4Yy1VMQ4rRjRpTe3iP0UMQIjx4aNg4RllJvT/sWTK//NtuDqCguH
         9A7ASXLNtd8BuZDzmzjgyVOAHmxPc49xchPidQODbK4Pi1PPDO3OF4q0yHeuq6lUdzkh
         4HqfW8T9S2DM0aNziLTwv0+yCYNsjnySNiWKZWrqdk8XcQAMcEpX4vJ2RKOgeI8TatIY
         vTTB5B1hQedzsvHoqg7Usz3ca+MBQScvJdm5fdpzZR072zGDs7BhHr80lsjoq0miOuio
         EM6g==
X-Forwarded-Encrypted: i=1; AJvYcCWZMKef/GKbnLxY9SxZU2Tjybo4eFY9mH02xxCC9rkNH31wP3KZzWkKJ3HqPASgMMjoyKF8T0Kj9aU12jNtb0x9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0BYNcnZ6lM5TMmuO8pdNrrkRS1vxVeov8nqdruZnezL5gtmpm
	HmWxEyoof9BgHVDfwkVjgbe+TmQNwci7vu/9hlF6osBrJr9QBZOsdYjK
X-Gm-Gg: ASbGncvEqSNgqFSeUkARrsgTe1Q5JINUP1b+SQyeFXABWyTAjImzI5a8V/sjIfdYJKX
	ItNHjPJopLAZilG4/EusglXDNMQnd1uWrPRzullOyE0gOr7NR/C+V8mIvt0pWd7clX0mzVc6jzb
	ltxt+EUwz1yaqrsMaEGK2FhCKJyzm9Ul9aIla0O9BevQ7NRUemYx8N80TFsL9OKOIx615XNl9Bh
	xUWjvYbDis6WtqUlT3QhtuN8quBHpAlvOAOTH5SImZPjqWvJWnj/UOJ45+7OyXvE6zjxML69uuw
	m0VpJZgP0SgDbpEIqq2Bq73KobvKm8MPGqAWRMLRpF2QVUvvJDK+k02dd3niz7PQgkqwT09+BI1
	KI7RAH8l2dIBnUZutyCFSudKUICVDy77fuTySBEPGXKJak3frE3ZqZw9XWKDG
X-Google-Smtp-Source: AGHT+IEeWggDjh2aRCpx1suFPoqcxzvxrWOO8w9b7MPKM4IOfFG1MlxM/2ym7uq0iEUOJ01ZQNukyQ==
X-Received: by 2002:a05:6a20:6a25:b0:247:55a7:695a with SMTP id adf61e73a8af0-266ed65b2b6mr265970637.15.1757978305237;
        Mon, 15 Sep 2025 16:18:25 -0700 (PDT)
Received: from [192.168.1.105] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0859e20sm324333a91.0.2025.09.15.16.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 16:18:24 -0700 (PDT)
Message-ID: <2fb684e0-449b-4377-81a5-5be03cdf3e6c@gmail.com>
Date: Tue, 16 Sep 2025 07:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, Stephen Boyd <sboyd@kernel.org>,
 Neal Gompa <neal@gompa.dev>, devicetree@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
 <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
 <175794440092.2724212.9818605948916059174.robh@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <175794440092.2724212.9818605948916059174.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_161826_181707_6951C73F 
X-CRM114-Status: GOOD (  17.94  )
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


Rob Herring (Arm) 於 2025/9/15 晚上9:53 寫道:
> On Mon, 15 Sep 2025 09:52:24 +0800, Nick Chan wrote:
>> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
>> existing driver for t8103's spmi so add their compatibles.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

As stated in cover letter, the tags are dropped in v4 because the dt-binding patch has changed
significantly from v2. (really should be dropped in v3 though but that did not happen). And this
is actually a different patch from v3, the only difference is a newline is no longer removed.


>
> Missing tags:
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
>
>
>
Best,
Nick Chan

