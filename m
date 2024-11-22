Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16BED78768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=; b=efygb5ndDZWMVj0N0VLW2txsv0
	lV/UzCc2PUYU+GQQw4a0MKOtGfB3hXwE8TUsbgFxbXeVIDx9Y5g1kDaLPIidxmQgow/aWJoY7hU4a
	VKB6mDzNnwQ1zAwG9Ua1ptheA9WkPvE8eetMbGWsYWw1iLt67g0dasdOZwH7NEYx7IXwnUEUbATgX
	48LQzzMgyBkMtwhA6AJ1hG9DXZh/hvDqM9YPPBr6ZATy9HSiR+xuzoJ2yRPy/FS7+gklACpwjzb11
	o4vCT4MOPeBeKCOb/aqsbQvzYsmoLDRCZTLT/dr7qisXRx3TGN8wuGoicGnrTzH91Mftj+5c5cnAm
	y7sN2J0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQl5-00000002EUQ-31Hx;
	Fri, 22 Nov 2024 10:19:27 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQVo-00000002Bqc-38TV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:03:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2203392e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732269819; x=1732874619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
        b=O09n/LdcClc1fjekjOK1L7htfQfyKu+vmolq+0pxm/NuaUv64THwTGQwMRtnHFbgvj
         +DLLFD8SySXa8/V5SscAskL5nhoz2RWwHkR5gVqbNLuTq0ORXWZwPJHak92PPhyHN76R
         E7NQ692eDPv/pLi8v+2oBgjnaab6D4x6F4rn2Qp8Qt6NxkFJR8aEkfCL7w4XC4q4mVEd
         vzMzvFZoSxyrTv9Dgstzd7QxFXJcmp/KajIM1WNWRGFKyKNWxg4cnboNbmbTje9gj73f
         +a3WPyeQ1m9pL1jMAi0K/HzpFR3afOEWIuH2sJxRj7XYphRY1wwkQZiqMtQt53BwwzAJ
         ow1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269819; x=1732874619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
        b=sQMMdfri7aTETn0q7XVo+JAfYTm754Djg3cQLvr599UQNQnzcqu7SXgo7D86SdZMJB
         ZclMzqW8JNe5wga2+JrQe3GSrHW7TnIV2bWxwJS2X0Rjx04j7es0WV5x3Ww/XXcSmEKJ
         QX3R6uMkj7jn0Dr05vbJSAaOP82U+le40CsveVbuXe2hFAGwcYblZsVVHWAex8Uotuug
         Meu2oZwV7PHYS7WJyBftBKUMx3fBjF6RLCixyU29gtB7pOjosI+sWFCktxL+yT7CF43o
         ZdgWe18oKXmnxK+jqdfV82xL447i1jD/xt8SPk3p12CgHu6n/P9Er+dDsv8V8kIp9zok
         kL6g==
X-Forwarded-Encrypted: i=1; AJvYcCV5ukXFO4ek9TLE0p96PRSoKkD6RJwzF3+7V8I6D6Y5uvxJSbs5iBMYxwg8/LQOZL8SVY8FOYjZXciR+RFe4k42@lists.infradead.org
X-Gm-Message-State: AOJu0Ywweakm6J8KDPF6NxpyuNpmQsKJw6vFw2byE2m3V+xR6IVY3NdS
	AZRnjDxCZxP4HrE8Br3pvpsFa0+ZDOMTIg0B/0heYFoPOAf5auNVw0ZvfqkDIko=
X-Gm-Gg: ASbGncv716EhZ/WEWE2qsOLjV3aLAPnklMUdzflaYX+kwltG3hFIKgm8iLxO1eXGOtp
	Ct4Daix2OUiawMSUeIvstd5SOzHsZ45KaCP/jI9R/sBwb8xfb8UYeeIdT3sP3ANYLmIhhGcrl8g
	PscNduElQ3WL9G/3aTG+rcTGeQo0BhR3fyQD9rSk04fhMneKCN5KlKI5L2n/7Hfh0p3FqirtW/a
	R8F1YyG0HPdLcnKm5DaA6vCrthM4+s0O4AENnlZNsDMVAfss4vE/sMZiba6aN+DjbrJdOmNqHRD
	ovp7oTnkrGTUmqC1ED7Vo4tR4BowSw==
X-Google-Smtp-Source: AGHT+IE3PHq2qPNqY+QbYoKQGe6R086mqzI0wJSLMJ+g6h7CmPQMNZmjuqoEun+JNczYZAXDctuzeg==
X-Received: by 2002:a05:6512:2311:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53dd39b2dbemr1081114e87.44.1732269818813;
        Fri, 22 Nov 2024 02:03:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24517e8sm318249e87.91.2024.11.22.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:03:37 -0800 (PST)
Date: Fri, 22 Nov 2024 12:03:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] drm/msm: mdss: Add SM6150 support
Message-ID: <jquwvnj7s3n5ki63ooz52ys3cbenuedr7mkrdkdujrnza3ewa7@i4y2uhy63yvq>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_020340_834380_B72AF933 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, Nov 22, 2024 at 05:56:47PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for MDSS on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

