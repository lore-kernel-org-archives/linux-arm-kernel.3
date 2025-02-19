Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3CBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grVqY1qROVcqXbe9nYwk1uHL1rEHylCVGnje1QZKs3g=; b=XHlwjWzGG/9R7xtWqYTAU3Y+Aa
	ODcaKLy7sNTTRcNTBUDy70+QbD1xDqJHECSYcGQQ1QHDneco/tuXQa6sTPV70QUrCjQVLnKpK0nhx
	AmVUoSWnILoo7/viNKXUMAH20C5FnJyJ4bCYifCWmdZt3fscr9oFxb8sUYJJIAaEL4zLGemx0mUhB
	Y2NT5JB0Ya3U+PwVeSL1I90QWHiSWwALbSr8K5DuLnMgbuiwETNMy6h0OlaA1GERIeFyJtG8ONfD8
	hV/sGG+2KvGyQfTudDnvG6NOtpbk79iteXP02X7wh5KWHTT/1RBgYRvA9eGH7/g8sUgB2AzMrKnZY
	SqjSAThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiYE-0000000CVJE-1Tck;
	Wed, 19 Feb 2025 11:47:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiWg-0000000CUm2-3N1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:46:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948021a45so66786045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 03:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965561; x=1740570361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grVqY1qROVcqXbe9nYwk1uHL1rEHylCVGnje1QZKs3g=;
        b=bBSb+qFT7ohIBmCzmB84gN2Mep0sB7xgG9qGU98FmaACUhAvcUPGNSKscRVXrXyTcj
         6nu5ezlCaYY6YsDHdjGRa/rsFBOWQ8oZdbY16SoSmAlEvIo/N1vM88rI43OVAID6Gbc7
         7cq3nfw9eU7sJDWnNbN7Cf7hLGgRaCzUvONgPEXli9sEZKTmIk5q4YXoLtiSINBF2MK9
         RQMqN+z9a7nIN+voAy8rOAhZczIYX+AUXpeRCin5I8aEiFgJRVb2gNy8ekxJBZYRBnLq
         Mv6Qtr9A984co5eg5ExHxfYHrrrmFPB3dJDpIPXDP7bkCh6izTJ1tC1fUTT49V5cp8vF
         Ey2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965561; x=1740570361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grVqY1qROVcqXbe9nYwk1uHL1rEHylCVGnje1QZKs3g=;
        b=MhGjTmTow4gl1iwrQD28JB0ZL+1mlncuXZZNnj+yely5VjEKaBBuuzqzGZsDsrS1E3
         TraNM0+AUHyTqqrDKX4UZoPhNEH4Rw2RPZni7MuVHMgtZBxsKP0ddYkGmh0x9E01P74l
         pJSuRZuoQyzutPq9pBBqXezQYaA+45L/yxdjkmus1eYQ7V7gWyJ+2DSxHJILvAMtOxAC
         WzsfuHZgeaifjZGC55glivwmC5JHRfiHUsIQxtt5batdm4W6hL1mqGO+p4wlvthC8L4R
         460VPL8I6yAA4DwGU3tKgtegqenOoQtk2C6SvaT9++gY3Cg0dmav6ZakYeoA2/aTUrqZ
         QfUw==
X-Gm-Message-State: AOJu0Yx+qf0Nq4EdJc5XaaWNRHN5iaVJRcgS30iduWZtPANg2AIdJFm6
	lslxBTTnmS0jLOklHmqQOzUY53i8RFAF1Mg+Tcyb0+2UJ2nhfcxmHJL7ORkbdsg=
X-Gm-Gg: ASbGnctRDIAAwbg56mZTFqG02kq3e2RYs5JrrTgwPFtV+ye8ICYsCVKcKSREMAFYfac
	duqvEmLzvzuAJCDFiTUnQbt3Azv9yp3JszeDecXaJv/btbHAIO8Dm8+j4sNjhVJDiztV5p6238d
	sn4rh61vgcsT+v1Pa/EHU2z6sZ/xFgc+IVL+MFXppM5ZlLq481l3nMxemdusUGOjRadJ9btVSuV
	q6ZzFk/8RmUZuqE1bnc3n2esZ5KAP8kSDaDmd2O6epfDXQx5yyG8+laOHx15dIQt6yjDaCPMMlx
	IGClD+lz3JtkaG+SIMdqdmw3by/39NlXtuZMjEcUg3HqKzHILgbs5fs=
X-Google-Smtp-Source: AGHT+IEPrAp7TfB1wuRgwHmXZYaORWGATsE4Btm3PHkL+64VjJn57We6CAzaMyjRJEOlvwankmW89w==
X-Received: by 2002:a05:600c:3110:b0:439:9985:6984 with SMTP id 5b1f17b1804b1-43999de0cc2mr33956895e9.30.1739965561108;
        Wed, 19 Feb 2025 03:46:01 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43989087517sm77002015e9.8.2025.02.19.03.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 03:46:00 -0800 (PST)
Message-ID: <47c11da5-6235-4e13-ab91-580cfef508c2@linaro.org>
Date: Wed, 19 Feb 2025 12:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: timer: exynos4210-mct: add
 samsung,exynos2200-mct-peris compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_034602_853703_51CACE62 
X-CRM114-Status: GOOD (  11.08  )
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

On 15/02/2025 13:39, Ivaylo Ivanov wrote:
> Whilst having a new multicore timer that differs from the old designs in
> functionality and registers (marked as MCTv2 in vendor kernels),
> Exynos2200 also keeps an additional multicore timer connected over PERIS
> that reuses the same design as older exynos socs.
> 
> Add a compatible for the legacy multicore timer of Exynos2200. Rather
> than differentiating it based on the block version, mark it as the
> one connected over PERIS.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

