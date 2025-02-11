Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA59C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpvPLOOINv/frxyxwmysjCgFErFPhWO/M9fCpiOC1SQ=; b=NGAkI1qAyHu/T1EbU6NodlI7sq
	pknepEOOj0cScN2lAO2xFdcWTo9lNV+5IIUrcsk8gtS0t7XpR0D9gdDN8DTGdqpoKRW3TiQBBqkvf
	vMTE0KKpHtBOR5ZhDpOw24Q1tg6ZnixR5Cj9lxrm4itf02k+XcrLmVo3yqW2wwTdWBb2uFNePwu46
	W8fyj4IlmfMQJDRzV93aut8htQJqxiUdvlWP3i0QCLTPv6DEoKEM6OIGvK+K5iRNTilKQW4WYckxG
	tJEjRunR781dxonBnDJUK9z/7qpiel4JYDo4mT+RjWxr/q8YMZs7X1QqdUKddqadnKyA/QZxlCe37
	a2bXqUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqRl-00000003yj7-41nv;
	Tue, 11 Feb 2025 13:37:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqK9-00000003wyh-3NWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:29:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab7d58aa674so203127166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739280552; x=1739885352; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpvPLOOINv/frxyxwmysjCgFErFPhWO/M9fCpiOC1SQ=;
        b=l/BJnf0RdWxPF5Ym+C1/7j5plF9mX8/7rC5f9IMLXcsKQhBkq4gl1c9nAns1ljbET1
         GGqyRWMcZ2RNOTsmy8drUedaFjDzwGr9Rp3SPvJsTNTL84XZjWFZ93/moT/8ih+DJO/R
         amyDLaEm7p40Y17Y+NGWVeDsvPfeSExES0hE2jC5eFh3kQpkqR9VdcqjvNDQm5GILTMo
         ehLvGWnn439m+CPKYV05gdpNjvIJ5KLDimgOhF2aCXaXmgTnj/MQHVjforg8zYpSndvY
         +YPEjXfDiZCA7qYL8aJEI2LAPufm3E3PGIVVl7IQCkZWACpHV2dAXGBnF6rA2pXiR0fP
         vBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280552; x=1739885352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpvPLOOINv/frxyxwmysjCgFErFPhWO/M9fCpiOC1SQ=;
        b=tJuxB8IIUahBg4++T2C3TPsneObSFfRSAYafsGuOzV0zcEl6dc01GbQOafrTirPrpQ
         jSyoTNaO8r495eNBodkFnMeFBrq/ws5A3vqV31JQB/Ya3pFqm4eZxnv/kFMEjEH3sDDM
         5CbNUZFcKc0uQwnfrqhLeSk802z9ErGF3ghG4/p+YeRA0ubJVQnlPUJ4a267ZoCjrs42
         x6yBxjTu6ZzOHkqVIw5ncQdeUJFCiMdkYDwdrydqHwOKUHFJwesyEnhiLnvjMtR4Xo7l
         woeBSdk/MEexyvIA8nhiyrUOZwV8Tvvqpl3lQgnbTwUKyaivhBWMCNQpqf3Czr6vcXar
         xxPA==
X-Forwarded-Encrypted: i=1; AJvYcCV0lVNq5IvXCfI/ye5BF6dXP1JkfpD3CFs5Fqaqd68P9EprzGrQ5dAcsW4OI/tfIM4MhiIS/2LqzWsVJn4l+W7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjq4EapwESCWadD9DHJrqTh5C4O6ldrVsdpIN2HvBzx9Hvy5Wp
	hitXKzEDbymEO2RSjbo0uJAZrkz9f95h1pl8YXlPp8fyvYCuva3Pb3gJE+H6PYg=
X-Gm-Gg: ASbGncuBoFzj+pyR+TtDnm2SvJMsEr/SorOey3F2XGYdrD7Uc8k+9o5f8gFlRc3xdeG
	GR+3XXzvd2Ax64/y3pSd2yBdh9oXQ7Rke6262h6lR/wHPx9uN2iTSyDHqbIBhjGLHpeYZqZ4xhf
	5JCt0wISODRTKG6kFPhJVb4UALuiIuSb0+QLiv/CWB8KzO2RwDaxvkIH9PoVr85h9ljYSUW7UyW
	5TrW1PnXAwkMfrkHCFvDtY4pnAz+RuHVlNCRX5O9VMvoy7BNzppFplJZcThTlw8oOmnCx0n6IRB
	aLgDDY7IHcop5EAt9RibY64k
X-Google-Smtp-Source: AGHT+IH2uOyoJcA50C+YALBKh/r20YQ1PlbDUm5tBy6s+a85ihdbDttjIy36Ad5qWXPkClRkh/FA4Q==
X-Received: by 2002:a17:906:4fd1:b0:ab7:6369:83fc with SMTP id a640c23a62f3a-ab789c3dcd0mr1900912066b.38.1739280552096;
        Tue, 11 Feb 2025 05:29:12 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7832a02fcsm970546366b.94.2025.02.11.05.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:29:11 -0800 (PST)
Message-ID: <1daff001-4769-4aeb-83a6-dafbe84fb39b@linaro.org>
Date: Tue, 11 Feb 2025 13:29:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
 <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
 <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_052913_851897_D37F908E 
X-CRM114-Status: GOOD (  13.38  )
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



On 2/11/25 12:05 PM, Krzysztof Kozlowski wrote:
> On 11/02/2025 13:02, André Draszik wrote:
>> Hi Tudor,
>>
>> On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
>>> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
>>> everywhere as "GPL" indicates [GNU Public License v2 or later].
>>
>> No, please don't, see Documentation/process/license-rules.rst.

Indeed, thanks, Andre'! The tag shouldn't convey the detailed license
information, as the only decision to be made is whether the module is
free software or not. I'll keep MODULE_LICENSE("GPL");

> For the rest of suggestions here I also recommend rereading docs. I

always a good suggestion :)

> don't get why we need to change "GPL-2.0 OR BSD-2-Clause", but maybe I

I reread the docs, LICENSES/preferred/GPL-2.0 says that:
'''
  For 'GNU General Public License (GPL) version 2 only' use:
    SPDX-License-Identifier: GPL-2.0
  or
    SPDX-License-Identifier: GPL-2.0-only
```

the two are equivalent. The downstream driver uses "GPL-2.0-only". I
think it'd be good that everything that I derived from it to have the
same SPDX value, for consistency reasons.

Thus I'll amend the license on the bindings file and on
include/linux/firmware/samsung/exynos-acpm-protocol.h only.
I'm not thrilled about a new version for such a small change, but I
think it's worth it.

Thanks,
ta

