Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D0D116E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9flMi7/5VzBKH34UEW11jeYwNrnMYSQvwb1Uqw31I30=; b=B59f2KfCJMKMQL1Xs0N4WAu/hK
	SNsb2BDdLptfEzfYoaKseU8cObHK+3t+qC5AwHvIhl0D5tm8EwtaSVBggyhh1KTL5VE06DKw1Y1nE
	Kllnke73BiKfHmKK0JMxLcpSHLCk6LpyOjTi4H9GipMIqVsE9VwDErZrrfSq3vksC1p4HQlV+LQ4s
	ytQlN+QzO2HI5MJANNHWQzLVlWAdJDb008fe6R1/7NZNNqrWFuT9LF7wbd6xjLNfVKOn9ICIlbo/7
	1gLeommnIFn2m7kbGG05kBMk5OnD9lyrwvWSqnsf/OjpSCPD+uy6pwxH8E0L7BwfwGaPaGEDu8tHr
	m1P1vFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQVC-0000000FpRu-0CeG;
	Thu, 27 Nov 2025 01:08:54 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQV9-0000000FpRZ-3Iqr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 01:08:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37b97e9d6c7so502731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764205729; x=1764810529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9flMi7/5VzBKH34UEW11jeYwNrnMYSQvwb1Uqw31I30=;
        b=RCkguaR6XRyhYRWOtRyGLpZOo3VEfA5V+08JhkijEnUFupXF7HrEhjjo3XenpwzyYD
         3QYLW+EcDfZHfCgWYQ5hEcOwyf4mMcaxGAEBAO10Y3iUCnPkUr0phxJEs9WIQ1Lxji1c
         lmwJzefWyc0GLxFrMBenzQOouSTV+NcLciSVakej3LyJJfDqq2VLglqjcgG2PQRINxPn
         mmasBsw3Gpe8J0ST6aCG9vQVjFL3d/A/wI0a9KoyArGcoP0Gbg4wu3El4fEgAV/gZiCH
         4G6LH9G1TBK6oElSKh2qqxNq0zipLvlQjjVA4AhRUi6AH+OKOSM5UrS+Et0GuR3PLIpL
         lvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764205729; x=1764810529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9flMi7/5VzBKH34UEW11jeYwNrnMYSQvwb1Uqw31I30=;
        b=TMtfpNsxRENPU+REBpjqXxzCmpJmpamITRKZxdZ1vg/FEyxPEwPPRC1fk2T5yXjSLa
         csAJ0ehFalNaS7E2r3no87GtR0N9+geuAdwBkV2VmGkdlVrsWHqNiKJJaIJwGHw8WjNE
         Zj9/6xMTq/JUuXfGhSq2MLZIYyFQjjvsA+ybVeMT5p3HMkkMZRnxC1eyz7Qr2mXO/d2V
         eJks911Rsa7iWAE/MUD8WxwIPPv/XmFYh9vMddRDm2jY900U+rwKUReDCv7N3Op4KS6m
         vQGFNJrrAh4oWnrbBr0C/IfQvexbCGqD7EOA3nGAW8NiuzXIXSR87NK22XaOrIxXvEJx
         GZQg==
X-Forwarded-Encrypted: i=1; AJvYcCVAlQN0FEKJmIWMdYIxteNJY0sbodoLhF/BSJFx2E72UbthGlP7tNtP9hb72THMzeWrHB75n9ILfU4h99L+dJ43@lists.infradead.org
X-Gm-Message-State: AOJu0YzeHyyM89g/KjQUe+rmeysQcvFkPnO4zSncJOOFjQq9T6pWSwsi
	GmHvXgy+wCEBvLA177HmJikWPVzYtkhEE+NqCo44FfLltNaU+FNwWaakUvdnWsKHoo4=
X-Gm-Gg: ASbGncutdxb4pAMw3nYSVcQ39h8oHjAbjmsuzS4BbCnNUnU0xYqhUbS3vcVJtI5BTJ5
	qcaauVHo+LkelHrDI/K+gtnD9Havw67AZSbLQcgWS4eGp1rFIT0Lic9ftoQCIFz089p8SjHY7Dc
	15r4qpC37l4IAO5HCqfhO25Yb1LYLOAM1La/it7kwAlDtB1ZU0wsBX4cbln6hzhL/Ii4rAXAI1e
	Fxlcv1T5shd48JfJ5n3y2L3rli+K88N7/Sx71zu/TmgDjzRkxp/djLpepP4Gsz6CQd8rXAB6Jwh
	59BU0IY5eoE0vsS91fG0MDRbRj7oSRCohNoRGA/gMv1sb0BqfGR6A3DkN8qumHRHdY7tO12cGiv
	9nDGt6rT3OgDcd6xdQ70+D/NfGleaqjNthEYrEVufv812bOzuRbucFHrUx+o3pMnFDRtnBLm031
	W5BoOIvrtCAh089Zjv7RSYAlrOId7/ixTVoHsAPywyQQyVuAV43cdLLB5hKH6y5zwNCSuAqNHJF
	E8F
X-Google-Smtp-Source: AGHT+IFDH/XR3NRT1n7LHsJTXk7QlKfZED1AX6XQ26NAwXEL4FAdw4RWJO3KJTX/slAlIUYtazBaJw==
X-Received: by 2002:a2e:be86:0:b0:37b:9c52:68d3 with SMTP id 38308e7fff4ca-37cd9284a6amr31034081fa.6.1764205728875;
        Wed, 26 Nov 2025 17:08:48 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2409b07csm185301fa.26.2025.11.26.17.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 17:08:48 -0800 (PST)
Message-ID: <06138434-97a3-4363-925a-73b084524131@linaro.org>
Date: Thu, 27 Nov 2025 03:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: proton-pack: Fix hard lockup when
 !MITIGATE_SPECTRE_BRANCH_HISTORY
To: Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Douglas Anderson <dianders@chromium.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, shechenglong
 <shechenglong@xfusion.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 linux-arm-kernel@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
References: <20251117051211.16108-1-jonathan@marek.ca>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251117051211.16108-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_170851_862476_8B4C20A4 
X-CRM114-Status: GOOD (  16.67  )
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

On 11/17/25 07:12, Jonathan Marek wrote:
> The "drop print" commit removed the whole branch and not just the print.
> For some ARM64 cpus, this leads to hard lockup when
> CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY is not enabled.
> 
> Fixes: 62e72463ca71 ("arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY")
> ---
>   arch/arm64/kernel/proton-pack.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index c7d70d04c164c..80a580e019c50 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -1032,6 +1032,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
>   
>   	if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
>   		/* No point mitigating Spectre-BHB alone. */
> +	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
> +		/* Do nothing */
>   	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
>   		state = SPECTRE_MITIGATED;
>   		set_bit(BHB_HW, &system_bhb_mitigations);


If CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY is unset, the fix is needed
to boot Linux on Lantronix SM8450-HDK and SM8550-HDK boards, which are
otherwise broken since v6.18-rc6.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

