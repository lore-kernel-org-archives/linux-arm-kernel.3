Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C98E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO2asNsqNAL7eluvpkUku2CKoDCb8/glpml9Aw35CM0=; b=yp/r5FkykPqLy9rGd1kepSKDSC
	3wZ+t12Bld6SfSlVcsCzyy+XpHQUXokvmpe1R4mFPQIYH+yTv6LdOZTfHI7huqULJuL2rUTeL844N
	85s4P4wouh79ii0ToWxE4275UVrJTrHKXoh4JRxfiDc6Qc+DLnWflsw/xPTJ/PjDI+R2YOcyNwy7P
	RY9WQFmo3zsBM9c/3iV+f1F6ZNf4gYAD2xLBhkME7v2PTMo1qz8yjrrOr//DO3N6sEPXbgx5XEJIQ
	yNTGt2gXmWYL5IPEK1o5RkYjdPOXhwHOYoQ/PplwiPhKj3Ejz5qSIdVLrhViIoyA2/U+nDKBMnczU
	Qw2MaMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn0N-00000009Xah-082Y;
	Mon, 09 Dec 2024 23:17:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmwO-00000009Wqn-2gOD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:13:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53f757134cdso2380911e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733786003; x=1734390803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kO2asNsqNAL7eluvpkUku2CKoDCb8/glpml9Aw35CM0=;
        b=OUwW2CTBnUAYFuxZnREBhoLacEtjm5/5HSFfzFNLBR4uvPmIN5HAvl9ZmB4GRH+DY9
         AvveTp/pOlgEyzUMC+c+pjRa9EGOwIve84ds0NVspLHkx5jUMsbA3nzfvNq1p5zlLIdh
         yDr0p9OtINAqZd38YAq8/72FL9fpgAPtjTQSPvP1Dtq6sD6FN1RPOIwvXTlfj7mWLbC9
         lsy+c/ePQag4sPO68W+TdxFjQwNpoDMJ6Q4rIi2NNeQZf6pWaCnu1Tjn7ybHy2Nl/ohK
         9c8Y0mkX8BM1wLmaPVdqZZUXL6l7rDoxQJwtH+J3JdibH0DsCh5F4m2yV6bzCUOGo1aN
         rBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733786003; x=1734390803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO2asNsqNAL7eluvpkUku2CKoDCb8/glpml9Aw35CM0=;
        b=DQpLp74jHsKu0dGq1Kd9SwbwiVJGFik4zUWJpK2J095Uodty3by5z/LQ0ze/FuBcUk
         icrKFwZ2wHwteKvprxyLnM9WBuW2I9c6nhudbmpW78DEApSlScmHBxSmkWHPmZcAxiSL
         BwYrl+3AebDi3pQRtUbRf58gMPnkVXcK7LOfpqN3jJCixgktFkSffO2UbIyFYxC2jyDH
         TQyhjowdE6boAfH5uWS+u6bcjeLmPEjZiQqap+n7CKcTp9iYxzAJjj7sbWWpvOyMI/Ax
         Lhc8rr41toJeNI3C1Bftkd1DBpajA5pPWO0DSnKWg4+6Tet89uBhCghylIArfuU73doI
         w5EA==
X-Forwarded-Encrypted: i=1; AJvYcCXqjv5aNFRmT3JSVKzaoeKY/JwDtCKbIVrr6R0PoHgo99h56OT5glvZIuJFSpEgtb7rFY2aZ020M64CzvRn9AAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Rl8NbyWlq6+ONn5ypGZmu5QDP15Hau1VQwaU/eYk3esEtF6k
	YqCQXgXIjYrA3JVKxR6+3obkRhlE6KEwW3qHE/eWwFJO6JDrk954yR5AyjavLfo=
X-Gm-Gg: ASbGncs7Q/eyRhjEm1ChWIx7nXRNFue61+FJxhpL/vY47p0+7oyuTqlonGqPqQeMbLB
	MkuYSTgQshI3F/47//iHhBNAvOgOacsVg3sfWpBFYF/Yoo7CDTDK70LbmymxDq8KZpcShGLqk6g
	8z6NRtqhSEDJaJCu3vR2M2AV3BGqhoqx/myt1bsbEPXmCRjp0/nOWACIcxNYvnNFkVh/ZfTg/SD
	P3wKxxHoSsBGE0Hrdb/Z26qjQ7dHyt66xMbqEZIdbb/qkJ/T7qh76zaFrcci4nPEeEWR+8gzhgC
	wzg3zrS8Crg2x9/X3xaKGqjDikj6Alr0ew==
X-Google-Smtp-Source: AGHT+IFAS1Z5WHgZqwBvaxSaopm+k8xTxDSEi+kuRvqKIcQUqZkIivnLzU/azdEntpK3zuNH1hE4yw==
X-Received: by 2002:a05:6512:ba9:b0:53f:afae:7367 with SMTP id 2adb3069b0e04-53fafae74c8mr2641232e87.38.1733786002822;
        Mon, 09 Dec 2024 15:13:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b25b349sm687436e87.271.2024.12.09.15.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:13:21 -0800 (PST)
Date: Tue, 10 Dec 2024 01:13:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
 spectre_bhb_firmware_mitigated_list
Message-ID: <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_151324_698442_919A3911 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, Dec 09, 2024 at 09:43:12AM -0800, Douglas Anderson wrote:
> Qualcomm Kryo 200-series Gold cores appear to have a derivative of an
> ARM Cortex A73 in them. Since A73 needs Spectre mitigation then the
> Kyro 200-series Gold cores also should need Spectre mitigation.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't really have any good way to test this patch but it seems
> likely it's needed. If nothing else the claim is that that Qualcomm
> Kyro 280 CPU is vulnerable [1] but I don't see any mitigations in the
> kernel for it.
> 
> NOTE: presumably this patch won't actually do much on its own because
> (I believe) it requires a firmware update to go with it.

Why? is_spectre_bhb_fw_affected() returns true if (cpu in list OR fw
mitigated)

> 
> [1] https://spectreattack.com/spectre.pdf
> 
>  arch/arm64/kernel/proton-pack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index e149efadff20..0437be7c83bc 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -925,6 +925,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
>  	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
> +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
>  		{},
>  	};
>  	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

