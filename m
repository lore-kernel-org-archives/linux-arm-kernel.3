Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABDED5CCA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyVmo4JQBKeEzxnePKos+ThEBHZ99otuDsHDx5ry1v4=; b=isrpl+PpMg+O8P
	bgwAeWMj4YUYJADAc5kOxE1kC2vxeNnsWioEU/hnwk2X9qXALtyrsP0fjq/xjN2qpT034/CZS52V0
	CF2OA8A1k6/qzQahQPCdidjbV0YE5OGsVZ274qeQ815NNk5HzUyqIGc7L+K5Z5G+e4z9sTKKBt2nQ
	FEsvUrwosrPDbx83T6afsL2hA3vrykh/fEeAH3f4L/Bua/YjrooRVtg2bPd65lEUzxTidDOklI13P
	aFYI65HBxq7hoieiE+qOij8+qU5YSSsEUi1E6cv2ePEOvfDVghBxJ+V1SnicZ5DiqOaU2BZSMz9AC
	GxhG+cWQK7LjCJ6um9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68C7-00000000NXz-2OMg;
	Wed, 30 Oct 2024 12:53:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6893-00000000N5D-1jV6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:49:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so4750866f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730292591; x=1730897391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyVmo4JQBKeEzxnePKos+ThEBHZ99otuDsHDx5ry1v4=;
        b=pgZxXzPz8KM7Ez7CWA111MG4NpENvrpAdTVLoCl5RkRK2J02CZ5JHqfiqK0EupFwKQ
         qneRQanmUAO2/39aq+sBp+/m8wC2QOEuNAFv2aKthf7/RyqaPznPvhpIeLtAEnko7dLd
         zHIW51mPyzcU+pnPBMvYOPG3I8QAqbTSAYlSSLsY5M6A9sD3ntTqdGqRhrILVr8SnQz7
         XupE087qTFlX0Y4kFBHTMrMsrmw4A2JvPA7ZrBEk+uqt1JxxzXvmdC1tTpHyd676Q+ZY
         CqGItRI7e1spozCjlv8v3bBhpAT42fHRsqABuet8uZTHXjaGzjX8Nv62xPRU7w2l78h0
         0x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730292591; x=1730897391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyVmo4JQBKeEzxnePKos+ThEBHZ99otuDsHDx5ry1v4=;
        b=pHbp2aWe2nfvyb/5E6bSqJp2+Wio8H5f3VvY9MdGkGyPbiyekiLPwb2LVGo5aK5YHK
         wdvd2pD7X3AeIgAxWweM3pHVRX4zyrYV6fWnT0p6LPWfXqcXt6P7DnKQ3/A+2HtBCEId
         C3dAb/npJel8hgFSUdsKXQQaNt/hioqY6yL8Y0hUC8A2Ju2r2T//5b0s5sW6q7H8eOLG
         wN7vOXN4O1eAgS/7kpT06mEJDzLwx4x74ixOgjz8UeOrSU6vqwmWxReZo7ZV0/hhXzgF
         /XrEW4giRGIFg+HNn5DSIYek3+3+o6SVxK133a6YXs38pt+BeZLzm/bxfZyosUo6/FO4
         he+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtxhrIPl7rIsifGnt7ssXZrD6lyqyc3Utt8Ai980b8eN1RrfWJVU/cGWgGWeP9t8AK6132C9XuXf56oXCCIH4O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5tqz3lJXzMAyNWOoTv2Q97CzO0Pbjb5SjZERd/Y9vRpYWMRC/
	EYl82j/ujEa39JUewm/PA70HkrpQ8sh02DURSu0iBv7BEHxsTev2X1UafugqxK8=
X-Google-Smtp-Source: AGHT+IENv7pio/IJPFsHAGkR/WlrAiR0sRTKsv+efTJpMs8r1AenabTe5ZXSkASO6Q+2w1i9twimHg==
X-Received: by 2002:adf:a45d:0:b0:37e:d2ba:6f11 with SMTP id ffacd0b85a97d-381b70effc4mr2397016f8f.47.1730292591257;
        Wed, 30 Oct 2024 05:49:51 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm15427544f8f.70.2024.10.30.05.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:49:50 -0700 (PDT)
Message-ID: <2634dc58-84fc-429e-9e78-1b8a6a757483@linaro.org>
Date: Wed, 30 Oct 2024 12:49:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
 <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
 <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_054953_475428_104AF0D1 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 10/30/24 12:37 PM, Csókás Bence wrote:
> Hi,

Hi!

> 
> On 2024. 10. 30. 12:09, Tudor Ambarus wrote:
>> I think it's fine to split sama7g5 addition in smaller steps. But please
>> add the sama7g5 support in the same patch set, otherwise this patch
>> doesn't make sense on its own.
> 
> Well, actually, we're using SAMA5D2. My goal was just to somewhat
> harmonize upstream with the vendor kernel so that we may contribute
> other patches that we have made on top of the latter, or in the future,
> take patches from upstream and apply it to our vendor kernel-based tree.
> This patch was only meant to lay the groundworks for future SAMA7G5
> support. I can of course send the "other half" of the original patch if
> needed, but I wouldn't want it to hold up this refactor.

Do you have a sama7g5 at hand? If not and unable to test it, it's
probably better to not touch that code, unless you get support from
someone to do the testing for you.

I still think that this patch on its own doesn't make sense without the
sama7g5 addition because nothing guarantees that sama7g5 will be added
on top of this. But I won't stand against your patch. Maybe others from
Cc find it fine.

> 
>> Also, if you think you significantly changed the code of authors, I
>> think it's fine to overwrite the authorship. Otherwise, try to keep the
>> authorship and specify your contributions above your S-o-b tag.
> 
> I don't know if it counts as "significantly changed", I split out parts
> of a patch that were relevant for our device, and made small adjustments
> to make it correctly apply to master. I didn't find a descriptive enough
> tag for this, so I just went with Cc:, but if so desired, I could change
> it to a S-o-b, Co-authored-by, Suggested-by etc.
> 
I think it's fine if you keep your authorship for this refactoring
patch, I was thinking more of the bulk of the sama7g5 changes.

Cheers and good luck!
ta

