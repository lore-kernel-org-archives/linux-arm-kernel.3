Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C45C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=; b=UW7pCXJpieHDVQlSdA/8KQNJc4
	EyuxJPPmNoI6/devuJUIdAjMjgmcVjwjt++WK+OVPv1VwyhiLvHdzn2fhmXWUmsc8lVu3RUZorE5k
	5+ZoVxlrAWEdjc/F/PjVI9zUAMy1wnRhuhtHLR16GTAIVswEZ4HIuxf6Etsg1cNIauKzgYi8AH1RO
	3w2dK3RmnqnHRttcf1no0zR5f8Zh4DdXfE5m/rk7HZ/6YJLbJu3JikAfy4pkXodSthcPCJq6+eOlC
	u7OqWC+81WChvzVjmFJxbCicWyms9uPKn1pTkwbfbMPe75H+rhPE1ckd8aklpZB7uI9eUbzr81gg8
	pV+0Us5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNzj-00000008QhY-358C;
	Wed, 25 Jun 2025 11:08:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM7r-000000084or-0SKJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=; b=Xt6CngV2SGlcHluW+yeJb9Rr2n
	YwoFMh8uWiQGFWNYIza8cNDQrIZQEmq5E/eUucn0ZOKSoEfKNQHCYZflZCE2GHyK9ZRnXa8BF/qe2
	0ewSkkaJUMeQbSMt+zN0rqne5LsW2+glvChL42dcW8gQix77v012bw88I98EQ64NiXgtb0zSHJADM
	uc+nM36rGclnD+L3ACN6HUU3u7CW7pzn0sRCbcIbfocWv9eCnMzsFgtGNiecTPqrDjT1gN6fZaypl
	GvDDmBn2MQDRdo3QawnJa+PG0fpKCOoxgcdqSr0YZnL7G0MLT5wWwMEiz5aXjBjIm0S/UN7C1RNj2
	O7Dm4IzA==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM7o-00000005idR-12Wl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:09:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad89dc2d8b4so94959066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842537; x=1751447337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=;
        b=s6Ria9T72s2QPlFk+FlrfVKm3m/mPf3PPE2eXeGE40HlOooPMCDn6AQqcbw0E1co9O
         VgUe/1syTyO+Ke7RUo/OFenDNUk+xDJ0yi0mWWf0a4gdFxDbS9lxrbPeUn47JsupastR
         GYXC9m0tgEXLw2+Ak6YXj2s2jd7sDZeWkplcyT5leZICymfdwgKZ9nP3WKuJiTsMj3Y1
         RW914I4+v5+lIfCHNRh2XXj8a9RHtfUVkKRPcPwH5Fvg8qIgMt1Cc41vNfJ9qd6lEvZe
         e9CIB3LVWEi2nYzz3/nxyMr8IhNcs3qY4/Ob7hmH6u44ZBY1jt5i76heHC18aMxpkkM9
         hqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842537; x=1751447337;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=;
        b=jSkh02EkbaqlrFWxADEjmrhm/dx/tAg0e054TlK9EBI48kNdBldfZjCD7qwOOztD27
         zHHRfAKjbwny89MOJ5l6xAQMr/+OMtD3vf96Chuh7xHtvx9x49/yMbfDPR+58ZY3AFhy
         wBC/rwVK7edc/58+Y6JrIKeYSo0FPflDYMEydbJlRtSzmsqrdV8KWYGxvsrBx5ST8t7y
         xDMKqL9VSwZLNp4E2RBr9FL2mmwY/OlIYHV98o+XeeenOCvT5p+TaB/LSqD68TpKd70K
         cASy5NPGS+xEZ8AMU+xKJK3+hstKSU6FvcHYMOWTX1FbJiZsDKscFhkFxPOftLFJo6Ja
         ondw==
X-Forwarded-Encrypted: i=1; AJvYcCVXRK607X0PJXKdqBaW+mabp7Lvz6bXlCvj9KgKzC1ZyZ0smR2m8Zv99pvEVeD5mn9JDeGFASv+aSxudbttz717@lists.infradead.org
X-Gm-Message-State: AOJu0YzE51JJuBWWFKZfxmdpIqLGfxoxnZF81b5Q3slQpJUERkcsQNNt
	ZCFhzixe51F9pkSBQHByPFhWReT3rePQE9Iw6ojm2f/qz9KYL2m7DwcA7NoItYjbx7w=
X-Gm-Gg: ASbGnct+BHOpdBoumNJBXk96yfNEH8lBZktoIFerd++Gn6AuQtTjgpIkL5XobHt3Vf+
	KiUudowrHhFDE80Z3gjUNNcYnA5VAzg3V4d8izIAc/9XC/p2coebl+icRLU8n7aKsfTWySd5Xzj
	nRxmfOFp7wCY8Tfw4lDxkEcV9nohcuZsJ/IgfcAUN9WtfpV8aDqqAP4MNmgWw48i/71ath3rInV
	eAi3/wGklkyYTznGpAZe9Ley72b8fV6TnTejsVeNEkLda9h14XOEydwW7wLyCxTi5Qen+bhQiGY
	edPW4hT6qIj/EFPACB7hV2/esGaeQhpRAVLsqGbi3klvf6LYCFoGMW4uwthHlXauomydSYeFJen
	ovVnUrw==
X-Google-Smtp-Source: AGHT+IHq4OLHwef19JUx4B3qBHj59T7kHFZYiQRPXfkNBv4goVa8y63ULfzDUAYvAqURYTsCkeQqEQ==
X-Received: by 2002:a17:907:97cc:b0:ade:40ed:9f3e with SMTP id a640c23a62f3a-ae0be531812mr74085166b.0.1750842537468;
        Wed, 25 Jun 2025 02:08:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ae6ff383sm246172566b.172.2025.06.25.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:08:56 -0700 (PDT)
Message-ID: <8438a336-94d3-44e1-9e92-1fac0b2a602d@linaro.org>
Date: Wed, 25 Jun 2025 11:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
 <2b32b8ed-c841-4862-afab-c583da644217@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2b32b8ed-c841-4862-afab-c583da644217@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_100900_378879_D6D19D95 
X-CRM114-Status: GOOD (  10.72  )
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

On 25/06/2025 11:05, Krzysztof Kozlowski wrote:
> On 24/06/2025 12:21, Daniel Scally wrote:
>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You changed the binding significantly - adding new properties (which do
> not even follow DTS coding style).
> 
> This invalidates the review. You cannot just keep growing it after you
> received a review.
> 
Although if it is conflicting with my earlier message that some earlier
changes - reset properties - were trivial and review should be kept,
then apologies. Adding new, custom, vendor properties is not trivial.
Adding obvious existing properties usually is, although I understand why
it could also be a reason to drop review. In any case sorry for
confusion, but this needs re-review.

Best regards,
Krzysztof

