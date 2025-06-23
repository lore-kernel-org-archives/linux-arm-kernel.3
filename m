Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31427C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=; b=fualQHmvWF5IZi/uos4a5KXcKb
	X9OekcvXLMC+j1yUwUHrNHvMmYFl5aaLVl1IVUb03FnK1xoFrmtD0Vq9oMGHakehnTt1vLRdPsy7m
	nTkrTI4BPIOTKM1FRcTaLh/vrC/y+jsSBngucB/dfT3V8zVPKp/cA4gUl+TXDudcCaAMZSLVTiwhK
	6jNY862Do9AKSXKRAKzaiBfWvUQPOrCnkcvHg5ioXMHJ6Yw0GWTUgjMC7q12YyGoFfS85BdS4x5sz
	bHQih/Jh1fwMrsh9QTY6/ls4nwHhAjQcvCO8m1U9AWsJPz56cBvjLG9ncCu139GdTEw2U5L2xAy7L
	j/z08Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbfZ-00000001sNL-1g3Q;
	Mon, 23 Jun 2025 07:32:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbdE-00000001rzf-0JOu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:30:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso561877f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750663818; x=1751268618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=gTpRs8FQ/s2XCjeokVAtx2eISHYYI2BoyGCsyTGPcb4tiVBIV3q8ISmGTi4iRcwbyM
         odlVvISmziv98iPsDUBv7iysOCxyOU8FSQnOzkId9YGlBth+DyBDEBIxcQaH4+8wnWL5
         IyI5ng5vBZ0cLr1KgewUPDiRxW8mdc8TTrcjpSsZDSJZFb+HNVc7vKx83QK/VQtL/xSJ
         bO/cw0cUAQcfK6xt/yVmS2Y4rLimCmlVIOTwPJDU39cPphm4K0Lb9lFSdnK7OxNva/h1
         EWGowUwcnrRsv4NW1i4aONyD66kle1AdAtfnN+LOyyWajGs8Q7pqGQ/oZXku00PZXmc2
         5yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663818; x=1751268618;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=hd+EV9cdygGMfIuOsbfW1zegfpL7Dx588y3M+QiTUw0rAcI6gGJ/LiNhH8cMCmvIln
         vS+XH8zYxJYblPwtJ7BUkvomvCdDoezOJ/54qd5VUuoz5bJu8RLfsGCtzS+my70UN3T9
         6U00tOzeNqGFiDV+jfgLMj6+B4krJp/U/5CJmL61vqeJc32EU9DwwA0B4Znz9PclCyEu
         ZK8iGm8GLWTFbU/Zb7nHLYnDle80IqEr3o7IujjhmXMNKMvRiWnh1be/y3GLfcsPfhe1
         MFKsJgAHG1ETigU5AvDQ60vtUYtXGGrQaynVaPlBcenDBAcf9JtFmgCuJ+cuXLvD76S6
         mTeA==
X-Gm-Message-State: AOJu0YzW80u83OkiMJSBv6oSGkluA/qaGcN4JT/alU4MpTrHzTmeNSpZ
	Xws7o8zFZMqSvhkbo3rCSDhVImcLfhKa8Wa29BVXQaXztla4NWKYhhdc2C5Yp6fkLLg=
X-Gm-Gg: ASbGncvW3RthHCRdy2/JbhwA//Ws4/lbg6kUfYkDu4AkcbnqFWzPNrhlaef5l9nl5jt
	ISlqTiA6mpj54KB/eL+bjya0qHKxydl34FiRHvIEVjNna0SQ9PgoOoxGpNqAvfujePARN9VrttE
	qi+zvPyIQ45tI6bVfZ/TnJwjWZja3eSG1vlbQ/k63l7Vn0nYjwaf4iRYgD3ZYEEggtA/397IZnX
	J0EI8SAI04w4ml8I9tblpeufpkL/+RfXe2ZRfCY+8byln35Lh1C2LHc+LXlwxUHsM1q3RnFsxh4
	xWzSuDe7+SzEnwjH+KYUAwH95sAc7yQbk30lYExO5rIwlojJJcbJE+Gz1XinPTfQw8ULa0SI1D6
	kHjG3p7vDx1IdcQYoLA==
X-Google-Smtp-Source: AGHT+IE5sAJn2EldwKQPeiP4adLRE3U5OsQwf6bTownItGgAHFLMi64HBwYJ6D64VqjEns0LJrnYrg==
X-Received: by 2002:a05:600c:3549:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-453659ddde0mr39535235e9.9.1750663818470;
        Mon, 23 Jun 2025 00:30:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd816sm101186905e9.24.2025.06.23.00.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:30:17 -0700 (PDT)
Message-ID: <16ae3a9e-4ba5-48a0-959c-4c593d1f90b6@linaro.org>
Date: Mon, 23 Jun 2025 09:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 support for MT8196 audio AFE controller
To: =?UTF-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-9-darren.ye@mediatek.com>
 <011093f8-85a1-4c3c-b3fa-7be9e6df8a25@kernel.org>
 <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003020_139077_86D1E89B 
X-CRM114-Status: GOOD (  13.29  )
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

On 23/06/2025 08:52, Darren Ye (叶飞) wrote:
>>> This patch adds initial support for the audio AFE(Audio Front End)
>>> controller
>>
>> Why this was changed to undesired 'This patch' (see submitting
>> patches)?
>> I think you are circling back to previous versions, reintroducing
>> issues
>> fixed in between.
> 
> Thanks for you feedback. Just to confirm, for the next version, should
> I revert the subject/description back to previous version and only drop
> the document part, whitout making other changes?
> 
> 
> Please see the following change:
> 
> ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE

Yes

> 
> Add mt8196 audio AFE.

This can be longer, but just read submitting patches regarding preferred
style. Changing to less preferred makes me thinking you did not read
that document.

Anyway, don't send new version just for that.

Best regards,
Krzysztof

