Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB923C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PcFXhTaaFZ66CkGM3Q42t1waBxcXDp7hOTkj1v+y9w=; b=fFwWpt11WrtxP1BT49fsu2P+TR
	3oo3yNMqxC6Bmwt8pXVW0zvgC25LDrbrFDpgizNrCFa/8gyHAUItbAcTzSbba2QtuthhMvjJZOnbW
	9F9kotZkzvDTUxj610RvhmOFE9jtXc/AE5rpySlh2S5XXbEiu6Hgc7veqTp09FBQd7arpYcwv8QjO
	xACoZsEkYPaKiJuomV/EidfZ6bR4ZcimOH7SjEl7nc1D0OdDpfooND0i/6XrGyuB7D0Mc2wDOcUy7
	6El1Wo4RmVJHvwQUu40bn/waZXyVMKRU3WsHUO3EofqkCIIx+vsSpSxvzTr/MeP3VS7ox8DvPxoZi
	nTnTyOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLTa-00000005PrL-2GIn;
	Mon, 13 Jan 2025 14:31:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLQA-00000005PA4-1ocA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:28:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4363299010dso4418845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778481; x=1737383281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PcFXhTaaFZ66CkGM3Q42t1waBxcXDp7hOTkj1v+y9w=;
        b=zDXmpnYmwQ8ElEhX5a5sqt5YdA8YYdb8Tz03tb/dIRmfAtSReVllangRI8e0/NTwqi
         NgwZDYWXFegvS9LFUsv0dmtMNiusVWZgGdGng23qgWw+IZk4LkDK0e0u7LBct9VnwOJA
         NpIczMV0q5qm+oUQI8yRdKu3W7POP58WCx/4aHbDF79qLMg3yGeApIgslrzIBjEPTJoK
         HsKjgbARg3r8E53qxhnkCaRP41XAYihmVqu7zOHDzzfS9dqERGSYFb1Rpiox5pnGZQ38
         UVHEKxzgPB6BV748LyikNJmQx4tv6kNKVz+sIJQlcZ8sLc0wRVVP93t5xbCmx2JJHO/g
         2LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778481; x=1737383281;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PcFXhTaaFZ66CkGM3Q42t1waBxcXDp7hOTkj1v+y9w=;
        b=mCyECnVnOuVeFdL6GrNVjSRbT9/O9qNUJwHIUY8NiStG/HSSUtIHPYe/Rz3Ui0FGfB
         qw0JadqC94rvKmolOr6AVZXRPl4ZugUKRq2tXTbQkamPXWqLZlQPzWYzjgDtFx5u+Z/j
         GtL32uiQfwxOp5FWazkeW2MdbnIyCHSwZN0TmgtRPOVfCSqNOYptTAIqSqEroYbL5zK/
         4x1BBvuwpZhxMssduCbuO7w+obAgnpjA9DS89aGje29KKCLvXFWV0VI9ZIr3fnEXcX6m
         xHCs3fVlI/lqe07Y474xMnjeUzYpJJLF7tL5wPXvY+2tS8SaAXqpcbc/u9M++OpKqD3D
         Xojw==
X-Forwarded-Encrypted: i=1; AJvYcCWlddDmX3xP09RW0N3KEFx6a2s6tQAoVGqtNkFlAOEqCJbUvhHb9SctdUcwch4oDvh8e7pPwuPlc061Y1bZCGzT@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/ksviuHJC6dzaDu1/FZCQz6vwQOeQ8yuksJzuPv+iMHuywrU
	4L895V91ooKW4cWfpTp6Ri12u12ax1kQYiz1/l+EVknSRaSQeQIMBpIQZOjfWXI=
X-Gm-Gg: ASbGnctTd70OnGMXQXlwhhgwk66qHtR1cym6MdCusKoyA93AVYXfiaMd6lmH/nGqOdW
	fbF53Mut0q4aRQlQaoKfRsYQEO+iYubN6oWiDqwl9bBp4TtSByTs3Cdy0KMa8jLgR775sYzx78p
	mgOR3EwSdsSfV4pSJAXsMTZTxISROmbbSmWLXOCi++ld3BjpMleH3nNHe4vVYtBws+5T2/641vJ
	BhPNZLO69qt1Kq9M4dsN+2oFxhf/BMM83Iq9qfLmM9Y0WnxCAPdREqtEzXQf0sjO6RROMVoaEW1
X-Google-Smtp-Source: AGHT+IHhfnJLTe6hwtrplnlr6f4IsH8b02vKJyKSAk50FfjRZlPmVUjBMGl8439cG/f0Xixv8Y0/rw==
X-Received: by 2002:a05:600c:3d06:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-436e2691021mr84320245e9.1.1736778480768;
        Mon, 13 Jan 2025 06:28:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89de4sm177638385e9.34.2025.01.13.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:28:00 -0800 (PST)
Message-ID: <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
Date: Mon, 13 Jan 2025 15:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
 <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062802_476719_71141368 
X-CRM114-Status: GOOD (  12.01  )
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

On 13/01/2025 14:58, AngeloGioacchino Del Regno wrote:
> Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>>> argument.  Except simpler code this annotates within one line that given
>>>> phandle has arguments, so grepping for code would be easier.
>>>>
>>>> There is also no real benefit in printing errors on missing syscon
>>>> argument, because this is done just too late: runtime check on
>>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>>> static/build-time check for this already.
>>>>
>>>
>>> I agree with this change but can you please rebase it over [1]?
>>>
>>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>>
>>> [1]:
>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>> My is 2-patch cleanup, your is 34 patch rework and new features with
>> existing build reports, so rebase is not reasonable. It would make this
>> 2-patch cleanup wait for many cycles.
>>
> If adding the `#include <linux/bitfield.h>` line to a file would take
> *many cycles*, that'd be a bit weird, wouldn't it? :-)
It's not about include, it is about rebase. If I rebase on 34-patchset,
that's my dependency and this work cannot be merged before yours is.

And yours already have kbuild reports, so there will be v5, maybe v6 etc.

Best regards,
Krzysztof

