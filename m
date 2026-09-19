Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9D1C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=; b=aaHeg4/yBp2M+7bsCf+6HtSFB9
	abdHKNQeeRYElGCKXNIB04JFHa29Bx30J82n2deYKWyyFHc0QzOS486O8UYpWD5yb8rcj3tRsf2hi
	X1hBn/I/rBOTryW0JYTPVvf0NHvIVoLPP4RSQk2FL5QPMcs0T2auu/t4xJY1qcw8qT7yf3sqfoUJi
	4A63SsAQGEIXq9pYW1egJAU7k7adgyJ8rK0TpfZrX9I1jzIWvFwXsEZEbaMMoXubql72JIur651We
	53AJQhSjzOmbJ+n0FpIkjY4m3HtZLRWCP1jXtj3+i8SMtLoG0tndod0JxB19eWOIVe/QIMpnzPDyY
	bCWYvyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w0I-0000000GMzt-2T6l;
	Sat, 19 Sep 2026 14:25:22 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w0G-0000000GMzH-421t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:25:22 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so12336975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827919; x=1790432719; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=oXNikk09GqQsxAgpuVEd9aD+rOe0vDxkij7wJ2ICHgV0NhCLerBJcaGSUUmS6/GJfD
         l4N7/Z8iQbsew6VrwmouTuqiu438eT2PpDOIGKeYimxTRH9s7E+TUdFpwmgMS4HJavRr
         rGZVIlIO9brRamNdKiSaS0Ml8J5u0oDmtTnfqmITmX9p/Mdn+CThW/n/uf2u+uKKpkcU
         cfB/zE3pCGp3pZAAfjxu3AF+LTIDTjXfvyhXV/AH3Qo7R4j4bWqYfMCw6CmNVebP9qUl
         c0fWtWffKItgIg2olQwt67lw++HM8BTxmBbaUnr6xTRYhsD3oRWp8om0ddBSSgniGQvH
         jzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827919; x=1790432719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=MH5P/ieAnku+iKYplOw8RhRPdqMyMK5CIXMDIafD79AN78/i84qV+RVCdR5FUQxRqk
         YabIWeRnmQRKUOl2jl5w0n6t/fDRuRhqgKASQK6tyTfZnz7L04dTzQK9d+E8Yy9YYfnS
         RoK/ri8bYvmNsEm9i1CKKdSV6FFuhMbzwsuE1dpfh0RSD2MPwTInzKzN/aDX0zN0I2FE
         bn90gNZ9cTVWCyo74MqI71vIEKQoC6MGOvxmS+Zi013bw/Fw3D4UhFRTkDiwMut0ul/y
         rTrIkifNHFGFGDQongdzYR+4AhRNWVaLLV3okiSjcXrN2ke1tzfgrDRf8VuLRwjjjdaA
         npdA==
X-Forwarded-Encrypted: i=1; AKwUvBwMj3ApZnO/MhSJGa+6+heeeUApJjbAAUVKOFcKFO9jgs3e50eAtDxtUi4135nixERI9XX5FmRDZjvP+Afu/IcR@lists.infradead.org
X-Gm-Message-State: AFuF++nxid99FswlxidHrsP7Em5OsB4ox8I0yVJZx2JVwRRpTcYp3YLa
	8DYFf6pFH/x8pr4ImG4T3pJnpwM03WfJaxAqFFi0WNQgfC4Ls2MI19EveLzf6UJgCLo=
X-Gm-Gg: AYBFou0K4gHJCbK1evTF0U/ANfgjEedyGda3vkFTVt4cNbI57iqZLpXlrdKqtU+5l1j
	GXwW7KTySEqswTNH3DEJWj2dbKwqDmilgNdjnXtfNBJZGKVkudfTZCfdKsH8/0WKXNN7tIIO1to
	5fF/v+L6Wiac9kksAOH8YlB+zkrHoXuGYBQAHMORgDnglJVR9nROWpqpLFN/1vX/nRlifqsRDVE
	xWDPA6zMyLYzgxvHGuz1LwC+IeAtlrTwEDXNRwNFAV0EAebD7o4ffzZFu8VSUjNisDvqTKCvb2v
	7o5eKLxzZVs9WHbrjf94r34bKHV0UwQ3rr2uk/pWNaMsKXfs1fAkw0dGxeM0nvUp3c/5Topu+ak
	qj2O6P0vpsNnzevePJkXrFcN13w6dH1xiTHtT6IRiyB/3Aef1deuSIUz6T/HUWEqTQzWzCJ5bU5
	qWp3EeUZo8pWcEIJ9x3DiETzBpbTK3se0kdByUpFki3XNCrlb2dPXrZeGxH0mYHyRSH9DBtj7VE
	ABmWQgNAZhxLzC1wjilAl+W1Pnz2l7jbnisuUO1u5Vpy7RBGgEp/jU4
X-Received: by 2002:a05:600c:19d1:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fc5743bc4mr79415245e9.23.1789827919214;
        Sat, 19 Sep 2026 07:25:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm78403545e9.7.2026.09.19.07.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:18 -0700 (PDT)
Message-ID: <c2c649b7-0f6b-4271-974e-a84559c10231@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072521_003142_7D3587AD 
X-CRM114-Status: UNSURE (   8.43  )
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



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

