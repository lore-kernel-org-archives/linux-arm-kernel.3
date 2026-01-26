Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3AFD13C2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=; b=hFvPjZ2XpZ/uzU59nCAGylCxvo
	UaPS6yf3zDDTJlLd/yM597XkZ1DvdiB/kXvGsjd4qG35pEn4s/nPw2IEpFNCbeS+Pcae0XRS7EixZ
	IEERYPfSjzXwREBqHpV/QsdAd1EZTxgroQKwwl1aSo4VWNK2M2XDf6T5zF9AVKw7isW8RnbYsB7DD
	6LKaLwTYJmfebHf+Tm8wwPVRauRPhdeclSD6WeaN0Uqe0p57ff7LZvPyjJA1KUPgexXnyuFqnPIZN
	xBBMTofyy/xIvwubLAnvB9R2+dkW0DZqqq7zVKqzwHBWtYjZzuCqqT4snsccHDqWJCoozgdqcISp3
	97qBlu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO7b-0000000Cjvs-23GD;
	Mon, 26 Jan 2026 15:03:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO7Y-0000000CjvX-3t5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:03:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so67717085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439795; x=1770044595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=FuFHEaeiX1jiMWtq00bwwF4/I4Bnbb2kdiuqCIeEMpyKUetP53bRzxOYXeDxVQxkG/
         74InNCIBhxVC4TRWhig1sjeHlmFjSxwwGex2tuOCgKzqv7mZTQZmUTCOjzv2asPEfw1C
         5NOBljEa9lcKnc4JHKQiQSudcEJFAlUKoTiZ77rVyFpsoF6sRRVKQETSAXBQNJc3VKsl
         e/ZICuH0euPSUUVK14IVG0ee36S15mJoq+aE4uH3F6OHiaqtjQ/Nv/l2f1mH7SVEg2Uy
         M+Ky/Gz3nYAiS6hKnhcECgu28Gohg8vDqSa71UwTc8rCK17hm9tUsN9xji8mgVdmXhPR
         9vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439795; x=1770044595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=VZV2asNGCr/t9iD0y2AZ92CFci82VSxL9XhgNwrHAOmm3QyGdy9ro5WT/MGVtNv3XU
         EP4bM1cGGqtLLIVU3zzccVWajVyfRIo/dVK9pskqKXEq/QcqNTwPd9/snMUIMizaZbVy
         AuLyxd3O/aJWblXWXIpdNrlchhf5rISEr6XHeUqCtoEhv65a7U5T6APV+WI67mz45tm6
         qLw9nKaeEZg6VDzG89qJ6zTU8xyesE0iSAN4R5wRu21FhOtOZG/JRe5BAbIIkccotsVw
         ApeVMq1m75wyhMvfj+rEItfBa8IAPMkH37pyTFWVGNJSSzHi+R6V+7BxeAiXIT3ZGPc5
         OPIA==
X-Forwarded-Encrypted: i=1; AJvYcCURf/l2GrFdKTxHgBLRC6VOUaZ11PKkPDxD7dICxPv5bt6/f0coAEENkEemmnvw5Y0bG9/FeQZYoyWXjqpjKRaU@lists.infradead.org
X-Gm-Message-State: AOJu0YwVxHIKUlvlVDJdND5vECf9jjMa9sPF8M+TOiZdnbM73/sXmEzB
	pQMYVIUmkfiBKFO9ru1b9sD4+acGDnJ0xPYe1cAoRVO50fV+h7vYE7FW
X-Gm-Gg: AZuq6aLPS+tXInbMn/kABie/2DFjzmLOyiV0G0wRfzYIr1mtsXDO31BNvY+te2OpVnn
	zlew6G2d0QwTRwxSkyCC7uzeqSkgGhwEuv7ax8WgNk24Jyf1lTJd20Z3L7kKis/NwauwJMGlA2l
	G8lVo2bxrNLZSQk5VcDfsam6RNoT05PkV/y47SQNtlpuC13gDddVOgnxCkj8IrGmQqcbOXFx1Wx
	BeF+CInOrNth/czdfN1vFtkLY1bpmdoI75Eyq2tqD/w78WHavv6VhCHhg2n9dSoaYFXdh14Udgd
	XgL1BWF16nu5jJs8r1AKwyaPBNg+gsJKKwco4oackK7Qv8IiHbC6ZJjubNh2BCFUz12PF1OgZBG
	uapZ0knYmwGAnimZXsJc3iOt9NnBQcBoljNiE+FFaxUOTdm4L91KB5v3g9ETZ1HKDfsrgwDOt01
	jz91ifKWHdRnstw8keGHiMsACmuU5VWWVWhAVgXAYzI74=
X-Received: by 2002:a05:600c:1382:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4805cf66a5dmr73588065e9.17.1769439793920;
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Received: from [10.25.211.45] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f745c5sm31743469f8f.32.2026.01.26.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Message-ID: <3e14a3a2-8686-42ce-8ea7-4a2380b2acdd@gmail.com>
Date: Mon, 26 Jan 2026 07:03:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
To: Mark Brown <broonie@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
 <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
 <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_070316_993130_45D19B72 
X-CRM114-Status: GOOD (  12.12  )
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


On 1/26/2026 6:16 AM, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:18:42AM -0500, Frank Li wrote:
>> On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
>>> the SM coprocessor. Thus, the programming model needs no handle to the
>>> GPR node. Make it optional.
>> "programming model" look like software configuration.
>>
>> Thus, GPR is transparent to software and does not need to be described in the
>> device tree. Make it optional.
> I was expecting a new version of this with Frank's comments rolled in.

Hey Mark,

Sorry for taking ages with this. Got your message while preparing the patches. Just sent V2 a few mins. ago.

Thanks,

Laurentiu


