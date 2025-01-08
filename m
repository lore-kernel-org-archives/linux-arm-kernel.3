Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F34E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtdjdENjpDlREgBVNAk/GURw9RLq4teFMIc2Gk3yyCc=; b=0VUeRO918TCOBPtNo76G3xSmZ3
	On5bcjagvpb5udIPMjqZ3LXBZLi4lr3jaiXluG1hsNqItt21IPrLe7OzrYISOeDmCrws6faezm9xn
	aWQbR1iTM9CntQaBBjlLnHugCFiFcGrg8XcZdALkvgfhW+VduCcmKiicyQhYOUzydnKrXdJquAu48
	63VLl6p+mqmMlGfWKVNA6mQZnPW6RUA5n8Tw22pzsEFwIjs8mgETbJtTEDwRNDeW2k8DHJ7RtQixF
	qjrXeYrRL63LeuUKtnPOHeOmNaN0xllIb4mAlAWH2APWWMb4GfaAIuE7RuXGrZmtdDeUHWEFOg3I9
	u9MCxZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW6g-00000008c0z-29AV;
	Wed, 08 Jan 2025 13:28:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVhS-00000008X4R-34pS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:02:20 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso16523795e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736341336; x=1736946136; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtdjdENjpDlREgBVNAk/GURw9RLq4teFMIc2Gk3yyCc=;
        b=R/BLUDtyI1WJbouJv8Az0EZi+oO6JY4RlgV/H+OSoB6I0gvUFO6PnAhK9DuFAubqMV
         uOGE6hS+smHxYUv9XAzx5wTtc4cxL5jX2H0vJ9tHccmRoOYAwmgGq87UBaojPJA9Im2g
         5J2i0TrQ1403yH0sFqcay35+kbCqVcBrbsNyvQt6PLZNmbRcs/ZnPuANmT0iHkHtvFq7
         r5mneWC0xEGFX9wrH04YUpeLsuiBBI8TRfud+qPr7DoLjCpdWRIgQC7A6yl5cKxwY4pM
         brFNYS/rPJm2gzTRMav6ul4d3Ger3ru3vaetDH7wthfa4uj8zCmQhjXBRk4i5mQ8d1fo
         BWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341336; x=1736946136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtdjdENjpDlREgBVNAk/GURw9RLq4teFMIc2Gk3yyCc=;
        b=q7kNdMWnJ01VYZfjPgHgjSh/dQw/U4fWkf3Ni61xP9OSkQzRwA/Ql+f2FmYlPQqyd7
         3F4uP7udDx8rrZ2EEqaUPfa681awC1IHx12q/vUH/R6Jbiv/eL9eNKnpN+XawDp/y5ui
         7eW5FwStThzmG2mjImh1zR0zUGPHyo/cHUZ0q3unwNloDP0GC39w9CvWvpSsOVDw+TX7
         sfr4zeSh+4KDKxmCsarF4NHBUIDIVIczW8UKdfH9fQ0IR3KcRDHfmiCAopigOKccO4Xu
         QqR5Ab+t22RnZDij6XJdFCEPYdcLHCWvfSP9nv8x7rlY3t/RpqcrkxSL/ypKw5mtX1X/
         TWxw==
X-Forwarded-Encrypted: i=1; AJvYcCUUPYriVfqKuW8fUV7dTyQPFMi9e+twYFNMgl2gWNmK6x8Ez3KU3tBZhL/4djFEsj5f7YJh9TfViAghQTbMfTXm@lists.infradead.org
X-Gm-Message-State: AOJu0YxPkUDDaVAS9jDwbAFir5LxWlE/YlU6AhL3d2ay/buDBZvMuw1S
	7algKcrNMrMo94mGThQBnJTIb+k3119hXZ1t5rT7keX5N+tcPFty2DA+avLmF6Q=
X-Gm-Gg: ASbGncvZM2lkPc91qzrovo6VSKRciN7dklt6vcbaNNAiadsT6NCj9nQWOArLaZB0Mjh
	+gjdd/GDo3RVAG7m1TZjJueRvoREiU3hWrJxr1HRoBwLbDEQPYep8H8fGY7Tg2e0/JGTIvBkUrK
	weBefdCsjVBiLMd8vrk3zggRQnQmi3KVomPQ9aGt8LU+goy0BeG1KVhTDokGNEwPbh9JUmpqEPs
	Ascz+efEt8oZtKH+KhdxwaTN2zd84UARN9oO3rke+oKC646Ny1cAn6DeLUNgIkbcnCza1IJfuAx
	GPohjwSS3yCnebRPeE5j+WapI74X9SkjAgpY
X-Google-Smtp-Source: AGHT+IF11Wgw4NNBGE9Alqz5c2ikDMgSytLQymr22qioeMYiszQ6HPLJGryvXEb7CVA6I7N4H4lGkQ==
X-Received: by 2002:ac2:4e08:0:b0:542:23b3:d81b with SMTP id 2adb3069b0e04-5428450707amr631936e87.5.1736341335696;
        Wed, 08 Jan 2025 05:02:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236000ddsm5590003e87.82.2025.01.08.05.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:02:15 -0800 (PST)
Date: Wed, 8 Jan 2025 15:02:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
Message-ID: <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108012846.3275443-7-swboyd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_050218_791091_C7B85597 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
> Allow an SoC driver to probe for these devices. Add the SoC specific
> compatible to the soc node. Leave the original simple-bus compatible in
> place so that everything keeps working.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 76fe314d2ad5..257890a193e6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -782,7 +782,7 @@ soc: soc@0 {
>  		#size-cells = <2>;
>  		ranges = <0 0 0 0 0x10 0>;
>  		dma-ranges = <0 0 0 0 0x10 0>;
> -		compatible = "simple-bus";
> +		compatible = "qcom,soc-sc7180", "simple-bus";

If the new driver requires this compatible, it will break compatibility
with older DT files (and it should be avoided).

>  
>  		gcc: clock-controller@100000 {
>  			compatible = "qcom,gcc-sc7180";
> -- 
> https://chromeos.dev
> 

-- 
With best wishes
Dmitry

