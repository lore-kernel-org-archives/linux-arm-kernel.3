Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B603DCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IugYQww6ZMP7fZxYkyvyMGRoB8H1RfKni966hm3Oic=; b=MOWNj/V7yE7zSkADc+JtRGndY6
	ikdNCw7B1gdnDSDugefkdumRq9S54IeVVSQe4v3iqRhiDQwkcBsyt8etjTnYJQYXaUm3xLOTwFGSr
	h/atuCFmuDn6Nq+3W1D+rBTkHg+5XHAGxG2gBrA/IArTJ6MS9HkeRPqwPAN1mRpD01P+EEuwuJOp9
	c8wyTCvbxr7t1r+UNAQBXa3Jsf40DGqct0nB2+wvTVVyYqE6vjBZUJgzBNb/Mqy9fSsZwzaKSlQgq
	z7It4bybCClKMx9pcWup99LbmzFPBJkccqqxEe6gBIBs71cvb49oKbbGmx5++iNkdYFLnGVewLZPk
	rOyKwDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38YJ-00000001eY8-3B6w;
	Mon, 29 Sep 2025 07:44:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38YH-00000001eWs-1mhA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:44:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-279e2554b5fso35974845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759131844; x=1759736644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4IugYQww6ZMP7fZxYkyvyMGRoB8H1RfKni966hm3Oic=;
        b=EtQGLl+bAupkfjFyn8+7Lm0eVQHhUnwIRt2BNQOGV+dXMMRFDsWA3eIhtuCOm34hUR
         /hFqnZGws4e+4YWbAKMfW9VcZY5tVEMweAfmdDJVovqkYT8mAEQRlKOcwgRTaJL0WHVJ
         Wy//SAMqCqnJIxQBg2P0DyWfaVSj//riSnqzGFcYkUjhCLKy8/uOZPuGDtK28lyti4+4
         brB/rGqGjxUCMFsSW2mRjdgBG/QXpVQR3VTTrcyWvxrEghD0lzXgWnhQkaEfkUfe+5in
         dFqsvbJCp753OT1+QUY2Splvi/56kylbXZfsavNxJQyETYty5XJpAndxNDPgj2NUiSrO
         uMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759131844; x=1759736644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IugYQww6ZMP7fZxYkyvyMGRoB8H1RfKni966hm3Oic=;
        b=j2UhZGPrlmockCB83Fpr2rYUM0y7sK9IcYyEQKUpxF/suQUUT1FqPsI6ZMSVUHwtfZ
         b6q+3UvWRl7+kDw3I7Sb8if432wf4HWb0kIi1bIJij85ijAtLpdY3V9+GM37eT7cVF23
         kPwBQWoPDSu4EzzqIX6qs3UXGaZUsZwlJSmWk3CewoSSO4CcHr3yajMdAu5u6RZIY3Jp
         heIeuC6pEDMEy96mGnoxhhLHrR5ZJQninFts9LleoU6B84IcrGtK+9EbB3ff6/RthNwh
         B436pjgLrDJCmndUXiHGlpaROmQgOiChzVAXJFQCtO0KMDuafHt/FUnYKEqlkZvbj4KZ
         AB/w==
X-Forwarded-Encrypted: i=1; AJvYcCXk7TgK4Rcx1m9yC+GnY7LnFdgmpG0an5Mxes5YkHz2WSihUOaZpf00OPLGqq1SSBZvTMTF+0zfYV1skx+zaWZT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0swOAilFRo+n3x3u6jo3I8wzP5n/YfKgB9/QRplFlsp7oBpE1
	ZoGdXIRvWHEoDLO/2awq97NVV1+3fBlB2AuwYEoh1Ntghpefqjd9d2/k
X-Gm-Gg: ASbGncuPI1McJvXJz0MogZs7H81QuwYryxu9BrK1qV2+zTrlG9VmzLY+xxJF3jgx09+
	CUwbbNpKunlH4b0ui2PK/m6rk+AnqcmsnCLSDejvIWKLzdnBs/4wOAZeJwiwCHReXhp1cDyg/S8
	ZxpdQlt9i4ADmw2t9vSqG/dCaTyOKtbpypZM/nGHiHPzGgYaExj65tYLTBwWFOFeB4a/BDDrNLl
	Z585YI8sJ9792Ox99JUErsfvjcXHDBlGMJR5sx1kVqws064XVuRUKn4EwA4qfxuBMEf6XNPEygc
	NKYaUK9T8lSHMsbG6gmF8lqCeWRhwqhXuC7Gt76hhCV0O3edclJoQt1GbIxbHtxOplmtwAp/cfS
	kjVoRfsP499Z7DUkgAFvDZOvYRdmb/B1B5Cp5KTwucTyEjDECYhWcuZBNK6CoeRDGA/zQ1qVK8F
	9y
X-Google-Smtp-Source: AGHT+IGYbzLtndPlp4Q3FPkBFfn1YLlMmp9JRJofGAotrhQINUZyvBL0AAPnW2NjXrzXu64Iv6JAsg==
X-Received: by 2002:a17:902:e84b:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-27ed7222952mr159612065ad.29.1759131844132;
        Mon, 29 Sep 2025 00:44:04 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3fe7sm123321985ad.7.2025.09.29.00.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 00:44:03 -0700 (PDT)
Message-ID: <b01ed528-8b29-4a6a-bdff-88f2e3b5dd2e@gmail.com>
Date: Mon, 29 Sep 2025 00:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
 <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_004405_485491_681A00D2 
X-CRM114-Status: GOOD (  17.72  )
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

Hi,


> Thanks for submitting these patches.  However, please expand the patch
> descriptions, because their current forms are too terse and, as such,
> simply not acceptable.  This applies to all patches in this series.

Gotcha, will do! I've added the testing that I did. From 
https://docs.kernel.org/process/submitting-patches.html

 > The text should be written in such detail so that when read weeks, 
months or even years later, it can give the reader the needed details to 
grasp the reasoning for why the patch was created.

It felt like saying more than "adding x sensor" seemed like adding fluff 
to me, so that is why I kept it short. Let me know if there is something 
else I should add beside the tests I have done.


> I'm also under impression that you're submitting these patches upstream
> blindly and without researching the rules that apply well enough, which
> may not be the best possible approach.

Sorry! I've read https://docs.kernel.org/process/submitting-patches.html 
a bunch of times during the years I have contributed to the Linux kernel 
and inevitably forget something. Please feel free to tell me what I've 
done wrong! I've corrected my mistakes in v4 (and undoubtedly probably 
introduced more, but feel free to tell me that ;) )


>
> Finally, please refrain yourself from sending multiple versions of the
> same patch series in the same day.  Doing so makes reviewing the patches
> unnecessarily hard. 

Sorry about that once again! I'm mostly a hobbyist that loves working on 
Linux over the weekend. I wanted to get correct my mistakes so that I 
can get reviews over the week. I wish lkml used a forge, so I didn't 
have to spam you, but I digress. I will keep this in mind moving forward.


Rudraksha


