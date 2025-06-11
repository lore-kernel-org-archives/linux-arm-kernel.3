Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C5AC71148
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=; b=4t4K8/mt7JSp3dtCaRUps/10Lb
	CIUwba9tAMWg4VVmM7pEUKllLHf/BhFC7B4vEYOpIGi0quOXGSbwXOORG34eZxklGqbOf3857Zz2O
	2SSB6P2TKNDFrh4N94FqcqWb6O1eOJDsgmY5j9Jcc4mFhYILsNe/tnUngf5L2E7vkU0+LNrBdlysR
	dwDuu0NcomzX6OioU6qHLsxpdQd+ObJ8DfkqhMYn1wRf3iayFwpn+paLgwWiXgEj63D+n1ANY7H5I
	0E5XFPW0HnMWWK+N96a8SeVgZEOTQ4tOFxQhRI0vWQg9+izMDfilFBDK1WAw5xewQTc58FmIeJAew
	71fR+Gcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPje-0000000AljK-04Vs;
	Wed, 11 Jun 2025 17:59:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL8N-00000009ulA-44nK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:04:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so5528646f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647090; x=1750251890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=ABj2TATG1QiA4FbLg4otifDW02s+NC+yCBKQONY7VHqx32jMaDUI7X+BR77tvGGdjM
         yx5vGDBVcD4ClDzPRsGTrR0YSBmH3t5WyONSBIE3sTOwAEM0gmUIOIR+ceyf8KGojCg0
         N5e780aL/8+ES+BIxAUGIqfbTp6kvoOlER56JLpjh8kKVdA9/tD5f68rSipZFG6AnD+E
         7r2I5+OTQZANxjBpoGAU2CODk+MbZ6t/zA9UgDUe3oXYnlnOkGB6lbXvfTBm1VrjGgos
         h5K/Fu8RoryqjlT7UWFQO6M6Pd7m6e0LnbA3uB8jCW1ZCVdD74Z2XhTnHUscU6/aV7/V
         pI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647090; x=1750251890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=pyLQZ8vxrK+V5bgTJ5Bscx/CvKKrXznJXe5wpBfUTi4F7+7wbJjyOifd4I7Zb+TCva
         s6qmfPWF/aTy96x6AAa0jPQovRZPoRILiTiUmF2UxD4ZgbUCKzLHn9NUW0sBsaAUFF+b
         U25SDVeDEsV86sPMFdiPJdJxgDyfbnWTsnbvWsfYNdnyhMd9Dvbwhl/5eQzwWEPd9SK9
         2m5VJQ6270Vu9b4Bgy364lkdyQnjqI8te/98x0KwOH8snFkp6YuA8xr/pop/JKVK++LV
         UZrhPM1QU5Sig/ZctmA+oqsysJLHz6TtAijeE7wOGUWe70JhnHwq+U6feSUw+WTPmX3x
         Cofw==
X-Forwarded-Encrypted: i=1; AJvYcCWaGcFiRl7EiVI2p8pXWqhPfsZ+FlbrxvYbsMOgVe58GW17zazKeZd4v+gHgIwawnhu5NIvpYm0HMR/gZKsdYiB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+7D575GZPI3mI54Rfsh5XHzLdIr2NtNb1OJPe3HURJOLdi0R
	biK8NGoUjP5/acZtyyy45cl//u+9WEqLMH5azLUFKueTXQx3vOEPKmmweLpWCd9aqx8=
X-Gm-Gg: ASbGncvYup5HjLl9TnGnBtQd7BcrNdrf1PnhyWMov9kTjU9nuUACmVprYhKztn8kbet
	r94MYl6QqzlqU3F0Nd3B6ztSgpn1kYW2FL2kMsY8RBchTxXF0U82SgX4bL7sp8Pl/nhradJSUhh
	4vMSxENs0zA7zb7uNKZkU4es+KrY59e/Z1E+6sdzkBaZ7P8ddx0u5Fy9kLOURkNC+KZUNvm0vsA
	yydim5W0VCRuF9xXTuWOY5buzjLxiUawc5GK87RgnsJLs2QPpvhjYjJTPtMU72TG4an+M42eqsM
	THSEtDVC0Nx/qQG9ZmiilCAmzOrNruV5yQNYoP1MfmH+BMSWFkq/CXGq5UAQ/4UacFfpKWc3oGu
	lSFKCA9ZEnd9TcNuL5VAepsglqD/BGI4sK3mKkXC6cMZ53Q==
X-Google-Smtp-Source: AGHT+IFzkW8lPMC7tzTRiI6f7ckQa2Ooh8n8VNSW4sNQvkqTlYj+uMr4gzo2JsXa5wbaxyrrmtUcfg==
X-Received: by 2002:a05:6000:24c8:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a558a43cb0mr2754736f8f.57.1749647089644;
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Received: from [192.168.1.105] (92-184-112-57.mobile.fr.orangecustomers.net. [92.184.112.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm15211113f8f.74.2025.06.11.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Message-ID: <51e609a8-cea5-43be-9e4c-6790f7d40138@linaro.org>
Date: Wed, 11 Jun 2025 16:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
 <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
 <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
 <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
 <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060452_010136_7B639128 
X-CRM114-Status: GOOD (  15.57  )
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



On 6/6/25 20:48, Qiu-ji Chen wrote:
> Hello Eugen,
> 
> Thank you for discussing this with me!
> 
> In this specific code scenario, the lock acquisition order is strictly
> fixed (e.g., pc->lock is always acquired before vc->lock). This
> sequence is linear and won't interleave with other code paths in a
> conflicting nested pattern (e.g., the pc → vc sequence never coexists
> with a potential vc → pc sequence). Therefore, a standard spin_lock()
> is sufficient to safely prevent deadlocks, and explicitly declaring a
> nesting level via spin_lock_nested() is unnecessary.
> 
> Additionally, using spin_lock_nested() would require specifying an
> extra nesting subclass parameter. This adds unnecessary complexity to
> the code and could adversely affect maintainability for other
> developers working on it in the future.

Okay, this makes sense. Thanks for explaining

> 
> Best regards,
> Qiu-ji Chen
> 
>> On 6/6/25 12:14, Qiu-ji Chen wrote:
>>>> On 6/6/25 10:17, Qiu-ji Chen wrote:
>>>>> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
>>>> If the first spin_lock_irqsave already saved the irq flags and disabled
>>>> them, would it be meaningful to actually use a simple spin_lock for the
>>>> second lock ? Or rather spin_lock_nested since there is a second nested
>>>> lock taken ?
>>>>
>>>> Eugen
>>>>
>>>
>>> Hello Eugen,
>>>
>>> Thanks for helpful suggestion. The modification has been submitted in
>>> patch v2 as discussed.
>>>
>>> Best regards,
>>> Qiu-ji Chen
>>
>> You are welcome, but in fact I suggested two alternatives. Any reason
>> you picked this one instead of the other ?


