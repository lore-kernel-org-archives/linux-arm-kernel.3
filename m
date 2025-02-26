Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23858C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKWXxeyerycjT8mINlrePYKkJ8KjgafF3u1tMHpySjU=; b=D+6r3SJ/wPdlQt7GSRMKRxtbsX
	AfBIE/IOQCcbvHlDKhLt/Lr6Vb3CfOSi6WIY/KNwLFlQMuS/T/BDk+ZLlT2hwVC9FiLgbYEAV0cVk
	WnGEDpjyQfPmMaTjBY63jLbOnKd3Ek0dNp8h7LpcRg6oMPJf16JRshwnrV+kIuoRnCtwTVj4m38RS
	plz7eyy+Dxj/zGunu00EfQGlSUrJ6OYkYjMYxHh5UKPrAm156G+jx8CicNSUd5sxyf7UcwCJf2j2t
	Uyjtlg81KeuYDwB3Kq5WLa4yIcaTuBlw1UlzvARmVTUyiWr3eL1uQWEznhIYy4AyWjUKsdzPboyis
	t6jSPbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnP8v-00000005V0q-0M9x;
	Wed, 26 Feb 2025 21:40:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnP7M-00000005UdH-0zsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:39:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43992f474d1so381855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740605938; x=1741210738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PKWXxeyerycjT8mINlrePYKkJ8KjgafF3u1tMHpySjU=;
        b=fKR5MXYBqLSD/4VEr5ausjvGO4c396w/z7mrrPdOL6lnujaIqQM7fTx551egcG0kFS
         cotUFwkGj/PJb1OSX0Djvb0mXwex3Tcgwi68a7gohmQAzlKq4umRdbc8JGWxl007cX64
         l5KpKVNc4Lozd9lBaF2Tj7RlGo7Nf6uJQkrJhcv5HkRL6+e0Vx2Ggea7amsmAZEmRLUM
         68Rgn0Cb6Fk08WjX32mTv4CDI2738qjSRzrdCRRfN13AYNDgbkLQc+3qat9WIqy3dOZU
         vDhcYxySXjGESsiBNWH4yyohVcd9185Tp1gcIfR2bO0JWPWjRoC+Hggwa2Rh/plrzLQn
         AaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740605938; x=1741210738;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKWXxeyerycjT8mINlrePYKkJ8KjgafF3u1tMHpySjU=;
        b=AvheLT1vWCGOg1oO4LVLgASH08G+3F1waTsL3dvGY13XVJ6LcqtrK8swQu1/tFl0NE
         ISBBYRos+Upi94jUSVaZqGdOaCHlMFyE9ELMZCMTJoM8AqpS2R817cgYB/N2Ct5CvqBY
         1zFY1kYsXlC78q/efHgWebWgdU59Wf2d9LG45AdjaXpEclOy6S1PKG78wV8vbqUE9bYY
         VElCF5UHcFnBcQyGjSy4u05KM/Kf8jYjSBmGwzUyjljadgqJg6kEElFD0a18WgZGR5kz
         QeV1AjUC+DUGtXDCsUMSXyl6MYXUIU5H4GSga1eZl/qcTeZaKIxZpXyUzGM76du5Sf0Z
         3APw==
X-Forwarded-Encrypted: i=1; AJvYcCVy0kMf9jnr+Q/SPQpAD03dVZLLIRiKVoVSE3hRpJX0gq/L/LR1Dc4jTUnC9Uuv7A8fwMrSNLeSY70tErHkMosZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYJRKxdQd2/2AlSN4r9mreQTJf4wj3ufhE4AuUbDKrEQPZJFH5
	AZuAONvmdI8lk9+wUF4krEYPYbJtafUYvcKALfTNOugLhjb+aGVTugKXNZlt1uY=
X-Gm-Gg: ASbGnctP+5C+rCz1bN0cl8obo3aQMZWPEdc9Pgg56DpjlR2lKN8unMiSIR5q8r4BPu2
	3gL0BBVW1xHbrerQRIWXoXhR3hROX3arkD9gls1bWbTQ31VjmLPdNV6XhSEkzB7bE/QT1UJpYGx
	p+1FbyZWsFdrf4EehmW2Lz8Hw/uADgyJFUlQLgHbGrjL2V3lWqyV+TtY1sAD/v/ghaOs646/9oC
	m5J7tAS3RWR8LRtdls2Nd6PrdxPiznUNCFlbXtgCt0xywS6OLFk+obV/1ovLxUpyO6IeSh1nqDf
	Vi7PsywOft5MyfDTQHzf8eG29/cHPYWJi61d4ql0VbWi6g==
X-Google-Smtp-Source: AGHT+IGl7z2yXYQHS8gtgp/PqAYtjqjx8GIvMA1PyfTi0fvGywrgelfkuzD4zx0PHjsiR/DbwpgGzg==
X-Received: by 2002:a05:600c:1d25:b0:439:930a:5899 with SMTP id 5b1f17b1804b1-439ae22991cmr84882045e9.7.1740605938535;
        Wed, 26 Feb 2025 13:38:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f839asm2112905e9.2.2025.02.26.13.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:38:57 -0800 (PST)
Message-ID: <6db6b361-caed-42f4-b319-2b8cd43a73b5@linaro.org>
Date: Wed, 26 Feb 2025 22:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>,
 Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
 <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
 <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_133900_279316_3BA186D8 
X-CRM114-Status: GOOD (  18.88  )
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

On 26/02/2025 18:50, Sebastian LaVine wrote:
> Hello Krzysztof,
> 
> On Thu Feb 13, 2025 at 4:26 AM EST, Krzysztof Kozlowski wrote:
>> On Wed, Feb 12, 2025 at 02:56:53PM -0500, Sebastian LaVine wrote:
>>> Adds bindings for the Sony IMX728.
>>>
>>> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
>>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>>> ---
>>
>> Please run scripts/checkpatch.pl and fix reported warnings. After that,
>> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
>> warnings. Some warnings can be ignored, especially from --strict run,
>> but the code here looks like it needs a fix. Feel free to get in touch
>> if the warning is not clear.
> 
> The only output I get from scripts/checkpatch.pl for this patch is the
> following:
> 
>> next$ scripts/checkpatch.pl --strict  patches/outgoing/0001-media-dt-bindings-Add-Sony-IMX728.patch
>> WARNING: Non-standard signature: Mentored-by:
>> #9:
>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>>
>> total: 0 errors, 1 warnings, 0 checks, 108 lines checked
>>
>> ...
> 
> I can change this to a Signed-off-by from Stuart if you would like,
> though I feel that Mentored-by is applicable to this case.

It has been two weeks, so I don't remember what warning I saw (countless
of patches in between). It's possible I had in mind the "mentored-by",
because it's nowhere explained in Linux. Does it mean part of DCO chain?
Does it mean reviews or suggestions? This should be one of standard
tags, IMO, with all its effects (because tags have meaning, e.g. DCO or
reviewer's statement of oversight).


Best regards,
Krzysztof

