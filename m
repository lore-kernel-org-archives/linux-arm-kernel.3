Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C38C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WKmer3uqjgZGaTDqjRAjLU77woVMUtTbyfOFW4Hj+g=; b=zLeYOXCQObSwGB1WkQNsBdFOP/
	GY2OwP9gwytrlLMnHW2Dm+Xs8NXz9IT6h9D9MgR8OBQR4x+YxX0Fj/F2x07DeL3ZJlhDF8jIHTWcK
	TjsRXWA18zhMHy7argnkFoEXq6UDnn8PVPqOz2W51dcUIqueVil/JsfWstmXJ+Yd/u6tmLd4P5hC2
	AiRGtecTr4ps0ED8DNKirnZMC2jp6ynOLe5vdsLutI71AXnyBjeavT8T6U5JQEq3rtyBUVSKJB388
	8RFEeWEUVledcAI55024LwomSSleBpplNMeh4q3VmSdYV5rbY6dbIvvBzCAGwYP8JX5l78Qv6iQLV
	oc3hhviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBw7-00000009igj-0fe8;
	Tue, 21 Jul 2026 14:59:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBw3-00000009ift-2S8M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:59:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso15356585a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784645945; x=1785250745; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WKmer3uqjgZGaTDqjRAjLU77woVMUtTbyfOFW4Hj+g=;
        b=gkKUntaqh10DsxpoagiRVaUnEZXcdt8XgfK5yRxfByu7h/MPZeGqJauo0GIXZUJ+fb
         jAXnl2DuWIRgqa9gKjljZzmhqtrKGRxfQGuQl9r8IiIscMbLWfiE3ZAgY+raJZdYRAdV
         q4P9/GvG9/y0E9Dod2dh9hvvvkLczOPZtL9tOP8XzocbFmzV293xIHVcxwQTZWuqpMzO
         0GfvdBnDOX5tUKCYOhglDxPw1iDE1V2cKCmGuwjrYUT1/rYCDQPLSGTOVnrj6Op2Ow+7
         1r/JmKI4LZ77SkvXZIoPccpcyu3ToeCRhjtEvFt0DhOR59QKCQ+Ovau+nVUa+Z1aNQuq
         KQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645945; x=1785250745;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WKmer3uqjgZGaTDqjRAjLU77woVMUtTbyfOFW4Hj+g=;
        b=hTSPwnSdHKgLv7wduqMSoR/asRGeATPbzLg9kn9VajK0BU4PbV6wKla18i2E0cZwsy
         +OnbBGDHAtf8vwS7dMnYXlfv3Ykw/hjgXjIzWlQfMP8wVdKLP4tdeuf4WsC3Nd5cujrP
         iIwLVtSU2a5mNmtMpEcyqRigLuc6juZCANcGapqf/dmJNL3OSOhPF/Eho3NUWVtbhDz+
         3l7ulM/JxsLlfd5wqaaxYa+kfgkdul8YAzPwLIYopQCKAPX+n59L13KPb/G6/6378N3+
         UYaFMwWiJP860YVSJfHVzZGY+rYQ8RYvxFveqs1OB0dEaVmiIbeGl5OQdMHvtjxJg17N
         E9Jg==
X-Forwarded-Encrypted: i=1; AHgh+RpfZrlgxfOba288beSKfp62gRVRNql1ImoDZMikVJlcalTUqLkvlYjwC95XjHcd/oNQ04BmBkvQQ3R19wXgk8pb@lists.infradead.org
X-Gm-Message-State: AOJu0YxhoMaNMht7uslhBwSdBvEfgq235OVNA0GPl8oXWmGTjcBQwKrC
	XtFtVph4+xbIU0QXR3Fycsf6tuseTuRaAZ4NZTodab9Cv+eQJoV6azvJ2hdOJw==
X-Gm-Gg: AR+sD12jw0xC8Si2vpwqd3VDoJ4nwgnaTN4CrIx3LUupdES5YJAe0AoE5xs1QTQrSun
	/fhGbvb3X1MHFSfGAD8NA/p3By+FQkyurGMhUKeJH/+XHzKtW+xm2pLSjM8XsXgpbVyuxvgVlLJ
	LCqhoYLtenhrd1rh3P8FEAb1OXbnfkYAWMXlrk+3/e5jt469kxXWdXK/fq58Aniq0+6BLjPEtkk
	NfBja9sHedesHFUFMukvSpRxQCly32KEUAdkkllS3DNWCnhwOrHdqCrAHctfL7D2KP6c2Z9Hoz5
	ix9M7I9kOeJDqpOGfFxJsO7zZMcE/vw9q2JurbDGrQx4V/4IN+pudJjuYR0YG05eSSSq5OwPFQx
	N1CyOhEbGkrW9W3zwrQ166dilZYxFUo+6JF3VP9vb1tx0f/2pMvyrcJcrmY4H5Z1iLQEL54H5Et
	azJyTP0yKl
X-Received: by 2002:a05:6402:40ce:b0:69c:2fc1:d4dc with SMTP id 4fb4d7f45d1cf-69e6532a1e9mr7211815a12.39.1784645945343;
        Tue, 21 Jul 2026 07:59:05 -0700 (PDT)
Received: from [192.168.136.254] ([94.232.27.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee248asm6113634a12.1.2026.07.21.07.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:59:04 -0700 (PDT)
Message-ID: <816442c5-88fe-49b6-92a3-cf924c056ae8@gmail.com>
Date: Tue, 21 Jul 2026 19:48:04 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add support for RK3308B SoC
To: Hugo VALTIER <hugo@ahdrone.com>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Dmitry Yashin <dmt.yashin@gmail.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
 <20260717075918.1869879-4-hugo@ahdrone.com>
From: Dmitry Yashin <dmt.yashin@gmail.com>
Content-Language: en-US
In-Reply-To: <20260717075918.1869879-4-hugo@ahdrone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075907_658999_45E288BF 
X-CRM114-Status: GOOD (  22.85  )
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


On 7/17/26 12:59, Hugo VALTIER wrote:
> The RK3308B is a revision of the RK3308 including different iomux
> register layout.
> Several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2, GPIO3_B3)
> have 3-bit mux fields in new GRF registers (SOC_CON13 at 0x608 and
> SOC_CON15 at 0x610) that override the standard 2-bit fields.
> I believe the bootloader sets the sel_src_ctrl bits to activate these
> new registers, which causes the kernel's writes to the old 2-bit iomux
> registers to be silently ignored.
> 
> Without this patch, SPI1, I2C3, and other peripherals that depend on
> these pins are completely non-functional on my RK3308B boards.
> 
> Detect the SoC variant at runtime by reading the chip_id register at GRF
> offset 0x800 (0xcea = RK3308, 0x3308/0x3308c = RK3308B), as requested
> by reviewers of the earlier series.
> When RK3308B is detected, swap in the correct mux_recalced and mux_route
> tables and write the sel_src_ctrl bits to ensure the 3-bit mux registers
> are active.
> 
> This is a rework of Dmitry Yashin's series [1] which used a separate
> device tree compatible string ("rockchip,rk3308b-pinctrl") to
> distinguish the variants.
> Reviewers Luca Ceresoli and Heiko Stuebner agreed that runtime detection
> was preferable since boards are manufactured with both RK3308 and RK3308B
> using the same device tree.
> 
> Jonas Karlman implemented runtime detection based on the GRF_CHIP_ID
> register [2]. Reviewers asked for more changes (constifying some
> arrays), but the series was never resubmitted and was dropped.
> 
> I run this patch on my Rock Pi S boards, the newer ones I've got in
> 2024 use the RK3308B. And thanks to runtime detection we should still
> be compatible with older devices (but I couldn't test on RK3308 as I
> don't have any).
> 
> [1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/
> [2] https://lore.kernel.org/all/20240604141020.21725-1-dmt.yashin@gmail.com/
> 
> Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
> ---

Hi Hugo.

Thanks for re-sending the series!
Applied patches to multiple boards and it fixes pinmux
issues for rk3308b-s based boards too (since the approach 
kept the same as in v3 series)

Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>

-- 
Dmt-Y


