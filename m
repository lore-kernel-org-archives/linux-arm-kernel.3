Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38FDC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=; b=hv+pjDe2di3vOUrOcv0KK2QcfV
	KTQz9DomIQ6dsnQ5X3+Vh9dnsoMFojUnRnVdp/y4g5JdT5luzvxQUfTceGDXCK6gScgK+VL5QCRK/
	rOtbwSO6KMlCEHcDuFnU+6QJJ6lQ20adt1jLdBSK/uAgYOH90zIU4VihrVxu6uQPHGlH0eIirsrR3
	wWBClYjjmqbB1VUm3nT/Mp2ID9/npECPH4u04JD/HvY9WnbdO6atoFcrJ4Bn+ZnwTNQkl8et4iNh9
	n5Xm9MQaRiW7pmYv3i3NhF5QzrF5mTXJ8gAdSmliHphCWRFrrrztei0wIRa9WPnMgu4U0Q65FoKIy
	BBS5mW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTp-000000063rk-3uSg;
	Fri, 01 Aug 2025 13:07:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhozU-00000005zU3-33Yv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:36:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4589968e001so12384195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754051763; x=1754656563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=;
        b=VJB0Mtl684Q636i0h8SFutqSlxBIEV1NnK03DXZKzj80jqDu3fzoSX6RkmQNAN5kiZ
         j3K9jCluZuYJJBEwEfFtmZahRyaWj+ChduqD1UXQ1aJUG4JbrgRhg5Zg/G2vuDAIrwxl
         b9ZOTzBb12r6EdP/7JbMfYN53Q+tzGOXYSMENEffos7oZrXcaEO8mtCObCvD49RYpEiW
         2OtJA9UEz5epeuYCUzNbo3vEaSCwMeqRvCRnMRr9mb8caWYMVT47yf1SNZBm1HBgcs/1
         8hkAaSIAqY75zTavce5qB2RQ0cAv7nrruehf2wKhIc468x3QdJ/X7PmF2CqSY1bhr+dV
         CzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051763; x=1754656563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76YrXol1VadaVpm2rSKGIHqgcLtD5umJrfw747ixCOw=;
        b=piAhAotdhWMhg3faQWWmMZJEs9rMisJp57fzipmVg2EDH60N/GDdwTR/POSYRye+je
         y0iv69qk21DCtvDizgMBr5LV2ToYXCJGCWCF1bycO2y3Sr5Na73llFgjp0zw4IAjxNDX
         z/Jv+Y4iAQ719NhOF2mpD6LrWhP3FM9xOLu8Ikc96L7WGy+y5G3NBJFVsS4hs9ng9Wfk
         7JkDLXgJS4iWaSfv6yDjoHDwP19ULzoDwqb37FuWkg3iJ9enAx0r/X0R7r8Y30riQ8IT
         jo4lZFZXosQSppeTuKBJrFKfgQPRLKT7QkT0gOHlhA8zYPABTpR00TvpvNVoc62dpU1g
         Q0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZDKVGOgKk5aFZxKfoyofYnbNKkMT6rroRHBJcRHi4YndKMJSqIUCqKXM4gKjHQjwvlNq2QeZ/7r9x/4rcpP5W@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOUIGErAdDAfgGtzfhQdlhF8S5wvX4byEO7xzwhcs2WQNIOCC
	XINpGstnWVzcR+JdwWxKXStAOdrumG6Cmweh0ZRZRIO09hhqZ9HCax19sk6fWqQi
X-Gm-Gg: ASbGncvcEW4qfokEVhrRtx2lCIFNnE2SV2/p3CnVwtQMHgI3j9xqtGlZT238QBiLhte
	JUfhLNk6uGsUXworXhjx/DBqbYHOcsHQ3l6Drr/GbNdwm7CJ7fVwpJMSONwu3+6feK5VoxEeyxY
	YurJcYsdV02AGAlVYtd2FBy8uUfEhGMqlNQaW4qhTDuJMc4gZO8SbX6Uzdcawsq6ByTopFzBlVS
	4PFbPZXSva/em7HAdJhU7AhCfMA+2mpSNSfRk7b8abLqjOr7akE5wf6SkuiqbpZQ0y4aqTGbrZp
	bU2ePUC2rE0Br7r5uRBn38t/X6PlaEpQj6qiUXPwKMkIQXq1l/LapnDP03vgm6neaCqnNy9hy/T
	36tUPRVibNCRvm5nmtuRDkDhrK+qhlidt8V5h0h6+3VFVXdor1A==
X-Google-Smtp-Source: AGHT+IFaCtYVTgRwZ19nJjwacjiBxot+B0gOHr5d7RezG9lzzdi5O12mr/cv+SRU8eaUlfGK7m1eYQ==
X-Received: by 2002:a05:600c:4f09:b0:458:affe:a5b5 with SMTP id 5b1f17b1804b1-458affeab35mr15788205e9.24.1754051762846;
        Fri, 01 Aug 2025 05:36:02 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eb7acsm100098665e9.28.2025.08.01.05.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:36:02 -0700 (PDT)
Message-ID: <69f6a044-be90-490f-b0ad-e7867a4825da@gmail.com>
Date: Fri, 1 Aug 2025 15:36:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-US
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <aHDNmVE23O4V4rqJ@dragon>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aHDNmVE23O4V4rqJ@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_053604_777830_3F72F76A 
X-CRM114-Status: GOOD (  17.41  )
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



On 7/11/2025 11:38 AM, Shawn Guo wrote:
> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Shawn and Mark,

> Patch 4 ~ 6 dropped from my tree due to the regression.

How should we proceed with this? The fix for the issue reported by Alexander
Stein was already picked up by Shawn via [1]. We also have [2], which is meant
to fix the Verdin issues pointed out by Mark. However, I'm still unsure about the
EVK issues reported by Mark, which I was not able to reproduce on my local setup.


[1]: https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-3-laurentiumihalcea111@gmail.com/

Thanks,
Laurentiu


