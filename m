Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFEC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6tmmaVntluIZHDy4W3k37bBnP5TDFLyEDatW3+vp8s=; b=UzSRK0PPAJ929BUNsAUWbjil1n
	6q4nWakmzl+nEmd8PW0P/SleFbm31038Wd8JkzMsrIqm3O1RHSo0yVo9/ICplsWwnBuSYxDvnxIHF
	QqCa0pNQt+jRnggpLQqreqJIydi7q3dgkpokzne6IsCFzQg1Tl51u8J0oXfGMeEOGfKUCa843Z9s6
	aSIgxrfVeYWlYHabnfiX1C4A2GveXEAw0uOuAlGB0DVHUCNDAbPBACYPP9HWOKfJ+5mSYA8gthReU
	1bJztzK3NsxSS1MfoTEnBZJH0ohISjVOb0udlIImkZy4p8G86C7kNWWsIQ1wnWj8KQ7gnxOEOk5IN
	HDAG82LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyS9-0000000B2I3-1rDh;
	Wed, 15 Jan 2025 08:08:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyQA-0000000B1xd-11Ze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:06:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so8143785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736928397; x=1737533197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6tmmaVntluIZHDy4W3k37bBnP5TDFLyEDatW3+vp8s=;
        b=SNpNjsxGC1eMV72WzS0trITddvBqDqQNjJhPcyZF7Gp/F6CBgo7sjoCy0INUx7oy8t
         h7NNmj+VGaWHl+jK8jr01Vxqt5+KZKQLdRMccnffmdCbvUwiUY/bkk0U1w6PsQrH6lu6
         LhX6vKDf3vP6R1bqVVAHyr2uIEn003s11Ow1nP8Ul5rg7xzTF/vf9mDsJegvIDAM5WUR
         uxEVcaMSW90l7yJ7j3rW6QnJjt6l0B5hdERoIClF96doqnWbyD7kx6Tccfvpc+1kte//
         9cZ1k/SU30Krb8sTzVyr2hZ5wzDQzzz5fMNq4mxF63e2zJug0eHq2iSabSFjipHRBP6z
         R6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928397; x=1737533197;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6tmmaVntluIZHDy4W3k37bBnP5TDFLyEDatW3+vp8s=;
        b=EUhgoUSs0/fs3IBYkKr0685yERA98zpWSKQz8+giTB4s8KthG40YNvYvis5arqRko4
         RlbyFP0zofG1ft1dA1LYomw79lm4eY/ezzji1l1xatm+EfQ4ApP1kU1DLL6Jfc3v40d+
         8VtqzCS84b0Zf0+9ptE0uBN6X2XEqaP/UIsV3UyhO6VuZbnJG9IDXp51nC93vIDFMK98
         sYLuUvHko0K9JK9h0KnQ2wub9Mp9yI9jYqRYwLZr/pT8B16ewmoqSvYNLP8LQxjt2Q+R
         drmqt2tLuCRHwl4LnEii/Cc/b/9jpQ3RhkT3eFngN5aDS7i2aq9y188DYQcxPz2SetRk
         4ygw==
X-Forwarded-Encrypted: i=1; AJvYcCVb+YYyzevdlB2oSaOtTvVJNXqHwl/2z8phTxmti01QNZI4dDrPFm0qr1e+yqGSeG9stPkI3E0INe9of4UBz8Br@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZ47qPfHd24PUqGc8Q8Oj4w3v6HdHqPHpR4zxaGdfcAGY0pJ9
	XyfVwREpDyOfM5KQayw+Ep2KjxghxOtVSDS+y7ccaNKF/KQAusPQtqs3sVzt1pN2gvVCt75bbgi
	f
X-Gm-Gg: ASbGncusWxTZcmPeGhQCPS0Vzk94SqpUve6MhfekyKMRjjNCTruYxipoyhL69tpVhgC
	r7Ebqq2lwnxCpd6xViU4ONMJzBVYN3U9jG156pLyD5Q0HJiq9P5sTKBeO9Ndm3GOnEUTcUDimoY
	4maJOa+Ckkg3UCvAxc1VBnEwfhy3cQXCAPVML9OHAzgrTShQ+HmL1V9UPyA0gdENy2kcFjMmOsM
	eljldbzMlyjfXquKwO4w3Dhm9vyvJVTZ/hvRXGpDctnONJkKpC7ketY92q1fy4vlf2TDsA74IzF
X-Google-Smtp-Source: AGHT+IERkrSq6zfrDfiGjxlzVHToRu9to7KUnw+e7J8Elokl8vRWR9VD6r4ks9l8S3yf7KEoDEuEjA==
X-Received: by 2002:adf:9ccd:0:b0:38a:69a9:af95 with SMTP id ffacd0b85a97d-38a872e5eeamr7782610f8f.7.1736928396613;
        Wed, 15 Jan 2025 00:06:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74fc57csm14318475e9.40.2025.01.15.00.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:06:35 -0800 (PST)
Message-ID: <55df5f1c-a429-4fc3-9857-c5580090a690@linaro.org>
Date: Wed, 15 Jan 2025 09:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBwbWRvbWFpbjogVXNlIHN0cl9lbmFi?=
 =?UTF-8?Q?le=5Fdisable-like_helpers?=
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Walker Chen <walker.chen@starfivetech.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
References: <20250114203547.1013010-1-krzysztof.kozlowski@linaro.org>
 <ZQ0PR01MB1302D40B42B69887842A7377F219A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZQ0PR01MB1302D40B42B69887842A7377F219A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_000638_302236_B2236F77 
X-CRM114-Status: UNSURE (   8.63  )
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

On 15/01/2025 02:55, Changhuang Liang wrote:
> 
> In jh71xx-pmu.c jh71xx_pmu_set_state(), maybe you can also change this line:
> 
> 	if (is_on == on) {
> 		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
> 			pmd->genpd.name, on ? "en" : "dis");
> 		return 0;
> 	}
> ====>
> 	if (is_on == on) {
> 		dev_dbg(pmu->dev, "pm domain [%s] is already %s status.\n",
> 			pmd->genpd.name, str_enable_disable(on));
Sure

Best regards,
Krzysztof

