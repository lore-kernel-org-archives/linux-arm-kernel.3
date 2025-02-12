Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIWQ1cYFsKmdYVBFw76fShsZ0oqbQapNfjENnquqJYM=; b=reZ+UhYgUGboJreiYmBlmR/xfN
	BSiu+RwbsJSyVmQlmy1fcNBLalWsPo2fU2SfhAN24pTeiK6sd15rIqaIHcXvFo4+6ahIrzEzI1sRm
	175KfR7RW2ZTj9Q/Kl2E3AZ7DwZHRYp2kyExvXo3H9dslb2fQLuSAz4JwXZha22yX3pHEIdppcjSR
	YX9mLQIDDiFd6v6QVRLWSw3c15dOSIhp8k2I0xvOAjzzz7EwWLN35vrvBSM8rB1wryQedreDZcM5D
	O1w/A6KhnqtIH0F7ZIWPrZyFE2gLoPjDslJY81ZPJWu1VtxdzQXEC/2ClvE3e4P6HjkM1n2Hq1w1I
	l0WMt5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJRd-00000008nIb-2T5L;
	Wed, 12 Feb 2025 20:34:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJQD-00000008n8R-0AKI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:33:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so12502a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739392403; x=1739997203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIWQ1cYFsKmdYVBFw76fShsZ0oqbQapNfjENnquqJYM=;
        b=yDdgWCtDfFEVjfcz9i3z9WnJta+g5voaUBMXGuRd93uX02zCfvThVHWQGYZNXpvjjz
         dSv2OMXmL/54rb56f3oK8JSJuvWLnNcNk8DlZnUHfxh0+1lf2zyORMvvaHc7Ceknowqs
         LbOSYYf70EsVBpfQpS7FZi8SNuzNOKvK/rGtpErjNwjHyz2yDkaW20EhpbZ9lxgs+os2
         LP2/eXPaQmdNr3ULEXkIvIXoF1sO/ca3Wnj6QqHC8eNQb7WY7cKkYGJ9hhhbjtB9RqcS
         tTx/Xj4kyavagAOogO6lPYhCHKgt8VgWvi0tjBCsj0mcApU5f9WXLQuKb7Jk1Ig9HpOK
         UC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739392403; x=1739997203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIWQ1cYFsKmdYVBFw76fShsZ0oqbQapNfjENnquqJYM=;
        b=CE1nhQvZPD6hRzOiLUsmGtPMllOGGgFqynAbvk6dy1B6Ui6h9cHzK4Ui6nlb90/0MT
         4js9g507tczWqpG15fOiIVVUmc3Y6sew5N3ZmUl6brEUmPDoTdkTs2d29MhFiieKvg6l
         G0QocgG52+66cRbiew1pnk3Tk4U5GVblE2r8W1YVDVM4FnR4LJcdLYrAl7f/WP1TXvMw
         bCmYGTwf92CqlIfpWW0dPHOooSZ78EP5WZvXDxxse08WYvulyheQ46yZ+G9gh+B1ngq4
         RkBHdP1afxV8cVFBrU5QJxkkKsxsPb/IykTpCsVYhKACUf9xW5xRp551T6ttA3jCUbAH
         gL5w==
X-Forwarded-Encrypted: i=1; AJvYcCXoCuunOzKxcfA8ygiRPMrAGh9SNuqgjxhPqbiQMbk2HidZuVP9N8SOdRflzovhayERXYDecPluos5ThbZ9Ypk7@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJxNVEa21L3ud9RNyFxe5HFni0fVRj7kLzCxDT9A0Na2mc75S
	8iUvJlB9IfycAV13dsZ/ks9kzwrKbzOBOUBsHEdGIjdzh/B02EAU1pah2nuVwjk=
X-Gm-Gg: ASbGncuTZPabYMfjHsnxCnpGa10icScOEb3MtXPKut9wgnzIN2Q7Gp96SsBq2mKDWi1
	dyBzI1taK33eVkJTncO7tQ8pp8plPx4OejIGU6ivb+9lL/HEBRzbTtC2jrVgE/cyZfPefcx6Ngg
	AhQYnc1vfYSsaVnn744kPCFtaVYe6nbCB3k7WKtVonwbQ23+0RmUPtb+c7Y7PNnRx0uuvjoNAFx
	hgTJk4v+kuoh79Gb4nO0KpmcW8HXbEcmkzy6XKCXbYeWPW268i4rwX2d+f1xFQ3aDnzy65hm3pr
	jEqxlMwwvGRTTitleT71ZAMq+xV90aaTeQE=
X-Google-Smtp-Source: AGHT+IGeDMm9h5OyPOgGl/JpRPwFojPaGai7niCiDvwSAxEh7i84pRRG1VSKCLWjp1rMUxxzCdw7xQ==
X-Received: by 2002:a05:6402:51d4:b0:5dc:91b6:10e6 with SMTP id 4fb4d7f45d1cf-5deade2734amr1424141a12.10.1739392403390;
        Wed, 12 Feb 2025 12:33:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa21sm12002595a12.68.2025.02.12.12.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:33:21 -0800 (PST)
Message-ID: <7341db6b-aed0-4da0-a5b2-6992d86ffaf3@linaro.org>
Date: Wed, 12 Feb 2025 21:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
 <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
 <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
 <8e8e3eca-dee0-43ab-95d9-aebd636245c7@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8e8e3eca-dee0-43ab-95d9-aebd636245c7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_123325_231178_9A53AFDD 
X-CRM114-Status: GOOD (  10.93  )
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

On 13/01/2025 14:48, AngeloGioacchino Del Regno wrote:
> Il 13/01/25 14:07, Krzysztof Kozlowski ha scritto:
>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>> Use dev_err_probe() to make error code and deferred probe handling
>>>> simpler.
>>>>
>>>
>>> That's already done in [1] so you can drop this commit.
>>>
>>> [1]:
>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>>
>> Eh, this was first in v3 in the middle of Dec, so why you cannot get it
>> merged first? Creating such 34-behemoths causes simple cleanups to
>> unnecessarily wait.
>>
> 
> Getting the series partially merged is okay for me, no complaints about that,
> but then ... in v4, there are two minor comments to address (one of which
> is a one-char nitpick!) that might as well be done while applying, depending
> on what CK thinks about that, so there's no real benefit in getting 28 commits
> out of 34 picked instead of, well, just everything...
> 

OK, month passed, I waited, so is your big patchset merged? If it is,
then this will effectively rebase my patch, as you requested.

Best regards,
Krzysztof

