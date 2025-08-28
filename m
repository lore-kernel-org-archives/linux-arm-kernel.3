Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F0BCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQxssGI+raI+XkRI8ea9mGLdtxL/7Ytn0lgOA6dMPAE=; b=HgPPuyAJke0wX6lwYgq35PDgp8
	l54PF+CdG+h9kFsec9zdQHnQKjNIrSawRmIuqLFL4e9RQ4tlaJsencxkd1qrARb0LvTeOwxkSE41T
	P6aLCDuQ6RF/Qv4Z53HXcY+kXy5mdr+1nErFHpz2dC4HCb11X/PMRqoidIww/G6doLwfSHM6YSLyc
	wmH9JhydwNAcGCsVxnw+w1geDHOO2YpmccyLL5FihiwxvSYurVgPkPrcZHqQN/9OVz+Jv0FpCa7hy
	Unnl0cTvhvTrhlqUMMs2vdJepkML7LIlFCTVKZcEVXU9eR/vxTTZ7xRak98TKfx8q3d3SRR4jdqYW
	uiW5Xk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndN-00000003xOV-0uNn;
	Fri, 29 Aug 2025 01:10:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhkl-00000002sHl-019x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 18:53:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso1385655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756407221; x=1757012021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQxssGI+raI+XkRI8ea9mGLdtxL/7Ytn0lgOA6dMPAE=;
        b=mvbcldv4wriR8pBQVXfPu791drBGMhFp78U6HmlLWg4o42fVvrQAxujh7p4iuJueIv
         1cgGXdB8QYurP4KNNa7zxag24HVmJT00aDPmWSyvA84DD3x1BwG4lYwzX06eV+KY6Svp
         ffBpV0XTqrCWJAIpEs1jKi5qvGqfIi9jtmZ3xZFrPqFjXjkYbLMW1vLHBUGiJTxTW1bg
         XcLVuonVhnSW4rz8CA2V5GlKldWdx7uq6GrekEa7TUFJ37on33tCb8DDojLacuUWYk3V
         1Oyng9N6DDNIGivv+vMXjBr/3xyox3v4sttcQoxW4zRsbk5jQhV4s4E+Jez8fWZ6vzYo
         xVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756407221; x=1757012021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQxssGI+raI+XkRI8ea9mGLdtxL/7Ytn0lgOA6dMPAE=;
        b=J0KDEYDjmWcFbQtSnoem/o7olhL9QZ2bGUp718aiMH4C16zw30fBaIoQGwVz5MeRtG
         B87mqUZGuaizyuQ6CwpaducYw+knkjUSpA7EJHEhBVSHKig1BehwSWl942ox6+T75J8Q
         d+eQIEoSP+OJs3Uvmls5JYN9muLqbwJmIMhtiV/m2nZR7gh89c2OwbWg9IFfTj9ioxpL
         c3xqkRGGQK5t8pFEJJkHSk5wU7qcFVzaKP3RZ2UVf8gn642bFVw3pmI++TN5jOOiGl57
         nbY6751S1JpkKcLvRglAVYQrtwt1ZvwTobjECfPfo/Bgo9/kMpm6OqYiLfnQ+Pj5rEnk
         IqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgUnPJCoT6wPDcbFZWRgH7QW+3mCyVidudWxvpmjfEKGWQefNcKjIfqdmBZisQm/SzY3Jg9H9lJNM10ZFWYLfu@lists.infradead.org
X-Gm-Message-State: AOJu0YyRsQw6Vpab8LcpKHjLGDag4ePSqtkCkiBNJCA6aENyu0wcL6nc
	sA7xSu0bhJxYAJPCF0OKitGoFEoYnRMaPCeLjlDDCrux1x7oJqPugt53hvHcc6boFIY=
X-Gm-Gg: ASbGncuvvUvSFVwma31+hKkGHKvfLmwMybqm0bs1soXzgOghAPP8LNPChYpwH1NIf3h
	EQmkFa4hLkqSMWt1hVu4Tj87dio4s1TyyeUpTl3AZnE9DRuOWmI3lepiaFAbQdCeZ591zHWGUss
	/K25DTXazt/suE7DLHqDBeohJmDdv/QX7NwdcatmKRfTo1r9SmrPNKDDNEVEq73ZybO2xgplUUZ
	Tb4G6/ooLcqbzkKhIHvMikgnJ1BUgAuKMfbMxmuXLTdQYv8KpQQ3OSyYwFldcQ7GeLBG44CUBrG
	rt3O333G59tyVJs5BeIbkuym3U0vohMgWl5dn4HJVOT7cE2w2ULN6VKztMZPKgtDtmSS4E/oZ4s
	uRc097vL5LRgVieFh1TLdL2gHPTzPYNHyfxhFMQmA0yX4YGjXMbrHfxzD/0GHUH1yCKwWI1V1y3
	gaAg==
X-Google-Smtp-Source: AGHT+IEsQ4LuJqJJ8bLH2sEiTn/a4xu8JBjHjhH5JH9gsrlNMbO4Yfh55Kjm7XpwgoiSOdsGhAur2g==
X-Received: by 2002:a05:600c:46ca:b0:45b:7c54:7518 with SMTP id 5b1f17b1804b1-45b7c5475a5mr21923185e9.13.1756407221350;
        Thu, 28 Aug 2025 11:53:41 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd? ([2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm85978075e9.14.2025.08.28.11.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 11:53:40 -0700 (PDT)
Message-ID: <a27c5e51-14ab-4f6c-8da7-3733c1c89abb@tuxon.dev>
Date: Thu, 28 Aug 2025 21:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund@ragnatech.se,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
 <aLAWLZBenSWWqqkK@shikoro>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aLAWLZBenSWWqqkK@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_115343_044391_21F5AF58 
X-CRM114-Status: GOOD (  11.40  )
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

Hi, Wolfram,

On 8/28/25 11:41, Wolfram Sang wrote:
> On Sun, Aug 10, 2025 at 03:21:21PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> This series adds thermal support for the Renesas RZ/G3S SoC.
>>
>> Series is organized as follows:
>> - patches 1-2/4:	add thermal support for RZ/G3S
>> - patches 3-4/5:	add device tree support
>>
>> Merge strategy, if any:
>> - patches 1-2/4 can go through the thermal tree
>> - patches 3-4/4 can go through the Renesas tree
> 
> Series applies fine; I can read the temp (36°) which increases
> reasonably over time (40°).
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for checking it,
Claudiu

