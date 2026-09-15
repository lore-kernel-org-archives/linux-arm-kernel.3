Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDC9C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=; b=tPpB+f0TMi3i9gm99g8ttk9puX
	TA6Ej5BzMy359wFyTS6xHbj3TlUa+2u/pDdRbRHjWP/mpUEtQLspCXFdSoq3CqkP/3s6GEzdCIG5J
	xb4U4jBViWYcUJufRs7z1Ov4IS64lX3SZVPWimc44u0DXc/P0hseDOjv4YXkWokoSXQu4s4InNxdw
	bGVTTb846b4nujo6l0yx0n46IVCs7z75/QNhmrBEH3XxYNP5EemtnSfGvQhIEUn9jhRoF7L5X3acn
	HYUOYvDpTMsuukF5qZyOiYl+2X1ftARBJ1e6FXp2tuwKo6N327bjByiIohh1FuzhJdCqe6+biOWg/
	/exH3SyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UWV-000000071a0-0Cd4;
	Tue, 15 Sep 2026 14:52:39 +0000
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UWS-000000071Yk-13mT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:52:37 +0000
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-46556b9e02cso683604fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483954; x=1790088754; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=ovgvDxZOu2hoSUlWY+zoMtbjjEKfe+aYzwUbBy4pjrPTEDAq0wDj4DI/IFWn0PVEdP
         FQ5TjEJI/Pm0iJ/B3jIOpBrNrswArwVIZWEhElKVkVZJuHbJzJbQAQQEU26zwKXuxInL
         X+E7aDcXVLSxhG6mGobxYGdCS5ev72ETXemxkJFlmq6nMRxZ8Zv7TDKsBRgk28mKUm+8
         w2SWV5a5skpUK0kWjxMRic7wCOFkYX9EFc6vIF/3LT251Mpx0bxd0U/AhHO8r9R0f/Gc
         W/Vmz6942ozLJTo7wnOVNF5S8tpuyV0O4STe6DUksWKrAo+0bF8cGFRIdzIXeCpv7Oxn
         xfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483954; x=1790088754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=DGn3wl3/RmHJx2L+OsnPHr7UuR/XCteiYe0cPRYf6P6QOczpYKkwJx1QCsAMuMCYGX
         RvV7wC/yqwo8aQrYFgka3ekI4D1VnqBBVTjST/TyyWjC3cybA0itQ8al+S3tyS1NYujB
         6K5pM/7S92F+BuVVT01Zx9jCfS6XBMSDN+2PRw9uzhMdaoCvYIAWhyJHIvbn4s8gKrr7
         Rou03+VIU6Svtah/Vnfy22o2Sx5omhi6fkPwYZKS3l9UJ02jyy95U8GVvyZrLM5ZuRF+
         ShOevIXkKXiIoxYLvsotmH8zqWURuHhoSP5DZEip/UHjuFYcUznyewfVMW8ThEqLFXWP
         /tbg==
X-Forwarded-Encrypted: i=1; AKwUvBx7s0c5nbSvHSM7XhMsjVYsHFzLvneD0h6k/w2LMGwVEiial4uAJGPwa3MsKix21jb/gh2AXoTYCwTx2v8UHlvc@lists.infradead.org
X-Gm-Message-State: AFuF++kXUwmPLvQebUQYf6MEXLCvo5seV/1MPrBHahgCAhGWZ47T64Ha
	+33U5vnVRRZPaQolRNfnC6DHKxmMxcqTliFONwGQXXaSrQjHGFFZVj61
X-Gm-Gg: AYBFou3VGNb/BiUgMq7wV0Pss9at8Z4P5/u0WArO/Nt2Erq+mkeaV7MnFwNxyMDI30Q
	FwuqQeoZ8pkvCxgAsrdGJ1m0k9F2m2AkijPGnWXYNnX1uFgaAiHcSe71DdKUDZTpBMZlmdKNf19
	GtDd3XgH4uax0vtcr+JrGq6d8/LQcOE+WD0qgmRHAFF2wc1XUtzWhUk52suIel4B4XT3IVcnLVK
	yGox9NQmttjhQxvB6fGSWg/+fP+XJtvqgGFf9+edlsFGGsqudd8LmwTvATkMdDF45JFbtd40n2J
	1+73mpDAFeC4v19bkFRuvUKuVMoVc8Qm8kLDVlcIx8/KVaJjpfGUUD+E/Vdytu2841n3wr/AgL7
	gi6swBJAu+2hJKRRbbL2H4HjIXKEcvHgdfkHyfw4Lf3YKTREyvB9Ztyuz2m+XT4Ql1/kSuBoS3U
	eRuQxzcwujh6P3dCldan/mQZpyFjhmqlOZ7OQl5hQmoveI/KIgZeHzutq9e/Hq9hXuSuMp2QtZD
	nMUbIZU+O9TKmSv
X-Received: by 2002:a05:6870:459b:b0:462:e12e:c561 with SMTP id 586e51a60fabf-482e39ea87amr2549366fac.4.1789483953749;
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df86995d6sm12588398fac.6.2026.09.15.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Message-ID: <2791fd80-627a-4353-be41-213240e207ed@gmail.com>
Date: Tue, 15 Sep 2026 09:52:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
 <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_075236_293279_FB9375CA 
X-CRM114-Status: GOOD (  13.12  )
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

On 9/15/26 5:39 AM, Krzysztof Kozlowski wrote:

> On Sun, Sep 13, 2026 at 12:23:46PM -0500, Ryan Brue wrote:
>> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017),
>> boe,tv101wum-nm0
> This tag is applicable only to one patch out of tree, so just respond
> there instead of causing scripts to get this tag to all patches.
>
> Best regards,
> Krzysztof
My apologies, I'm new to kernel development, and didn't realize, but in 
hindsight it makes sense. Thanks for being kind about it, it won't 
happen again.

Best regards,
Ryan

