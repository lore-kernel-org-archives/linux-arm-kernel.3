Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFC0CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fga+lbodUmPAZazOf43yy1bTgzdU2LByeFqojuOQ83w=; b=Sd6UpLFiO9PS98z2LD/9QhXGJJ
	MvGrjElxkgpNj3qsVF9SK7r5Mbbv/5HkpGpXKNBnbpRwO0w3RgOzBqx0MUF96egDOXIdXKdQl1UKh
	VsAjFTEXWS7ruEmsDimEqwOtTlgpEbADW9ZGa3xxFCncwGyCMB/9LS1J0EVzTGiRDn18sPpuKAmnR
	nRPnl11vJ4Im1+kDP7gVVem9eHmLX0Mk6JKgJh1NjYuZi0zebaKoHUKN9qgsnSQcwLyZtpH4YMi2i
	f/+2ImWpAorbsChWDQzBwBd5lzTy+Qr0/ro0TDbnGdsij2anX90ZPCjDu1bgDJ5jfq1UA4YwHykhH
	MoqUam/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEbh-00000009PYJ-31XE;
	Tue, 19 Aug 2025 05:10:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEZ7-00000009POt-1Nd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:07:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so24397775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755580039; x=1756184839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fga+lbodUmPAZazOf43yy1bTgzdU2LByeFqojuOQ83w=;
        b=fGBpbrh7qpE+r1p0RwbFBF65Gd/DCqr79q3QlI/gANOm2rKh0FjL5CUwl/bTbmq4yV
         juM2zMRz0Y+Hf2Lg21gPofjzvzlctVGHnD5HskohSeM5+PAOZ+epFziqryxZ55Sya/qh
         vTX2kx59byg37Z2nxjoBds4Orc6WXyV4pB/2TiBccwDK6+m/FdcuVNdBg27ypre2s19x
         wsH9ZOOMPheUGHlAjlAC7afwyV6JE/4ggEltfVICXgBkyxBo04sGRsp0GgR1pDQz91BL
         GJ27nMq3ZkfV2JDKdlo3hilNB3TnsrXQBrsvLrkKtVwANBO1mPqjiLB107y0v2ZFdRkE
         fQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755580039; x=1756184839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fga+lbodUmPAZazOf43yy1bTgzdU2LByeFqojuOQ83w=;
        b=uGNEeylW9tl4Ng3tXfuVZUjLDhimxOysKSGkL/vl8w7TNxA2Ph7KCkNTS6AFyO+0Ij
         +cVHedpBG+SrGDNztGgkah0FlGpa558StfCuhPYCD9yVbqd0k5Uh1OiHQN6hipGtrnP3
         y/g18BYo00VjgMZ388hiSYoHH82/eaRJYRTc3Br/DBboxILk0XFATFWHwk8fP4cXxBJN
         G08yw0db//UbZKhXseuh9sd5K0liH+OOWKLlZzlePs4tuKiWKlA45mqNS0gfH4+P9JjJ
         DnRNRS10hP8//7ZiqbetkGGFhtSOBIXhbe8Wd8FedVfQesQB8MVFocWgAHdu/NKxoC4v
         Wlug==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5aicfD9WErgVahLhxB+kpnazPmaBYmRTI4Jc5+7v8tKzmAAiJK/yODJppY7IjQSKDq4MYZMHrLqYDCw3p82M@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhyxuS/E4bkBx8E0jSn3QgK+xUbOCttxNat+CDZwAX6eofXEQ
	50SgTLU/aJ3F3j7brIDf6alzQknu5U8Nc7Z+xYnBNizWdBJTa5TQBUCTZ5DKKSHDsx4=
X-Gm-Gg: ASbGncuAoVXK0tHPuyC1yc8DfDzJc0WqfmMDgcKzaCmdabyH9HqtT16gIxtyyEDQ8oA
	1ApdlRdypkMREdG7PVy6+o04GSCoLyc3m01cANVcYz8Cf7/dK9yHhNk554Y5mVfF/kvNcl+tVT0
	9bGu5v2mYvfkafKJG+61Om/M8cLMZAj7UJ+DCTPB+QLAJj1OopKh8ARYMmOcsctzFPlsPsmWPl3
	xfR+9PlInJe+2k9LebMgF9EKH4AlvU3ALP/45Wta/p3OSWjCikja1WbHg9IYm45bI0IQy8BsWpp
	As3wsurZ+QykBI1yVwTr+nd0BRXH1Me5z6MWXBTkIuqFDq9dCLxFFR4MmPMqWEsgxxQXXVEv8jQ
	QqFMUnde+kiQUZWTXPUdL5aCffXfiXpABv1iMzWYKnfKiakjCMTSOsrWEXQjnbp3RzJRofjUPtN
	S2kw==
X-Google-Smtp-Source: AGHT+IEGAIFSV01YojFxZG6ti+gZSOdnTisUwlACnGc8HPzYTSLd/Yrx6ey+bzDVw52KF6DYn9VA+A==
X-Received: by 2002:a05:6000:2485:b0:3aa:34f4:d437 with SMTP id ffacd0b85a97d-3c0ecc31e8fmr784959f8f.37.1755580039233;
        Mon, 18 Aug 2025 22:07:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:620a:8b00:4343:2ee6:dba1:7917? ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm2018512f8f.2.2025.08.18.22.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 22:07:18 -0700 (PDT)
Message-ID: <d00ce701-2ddd-485e-8bfd-12cddec62fef@tuxon.dev>
Date: Tue, 19 Aug 2025 08:07:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] soc: renesas: rz-sysc: Add syscon/regmap support
To: John Madieu <john.madieu.xa@bp.renesas.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org
Cc: john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
 <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_220721_484639_2A7F848C 
X-CRM114-Status: GOOD (  11.32  )
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



On 8/18/25 19:28, John Madieu wrote:
> The RZ/G3E system controller has various registers that control or report
> some properties specific to individual IPs. The regmap is registered as a
> syscon device to allow these IP drivers to access the registers through the
> regmap API.
> 
> As other RZ SoCs might have custom read/write callbacks or max-offsets,
> register a custom regmap configuration.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>
> [claudiu.beznea:
>   - do not check the match->data validity in rz_sysc_probe() as it is
>     always valid
>   - dinamically allocate regmap_cfg]
> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S


