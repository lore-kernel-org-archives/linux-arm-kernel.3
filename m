Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC93E6403D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=; b=4Cs09rYcJPkOGGp9aGTFsCgc/r
	u+1gU6PC65qxXU2EbqlA03E6gYDP9TOP76NjdOqHNhNH7kJsktS/pUnVuVcdl+UxKm0qyXeNKIhKi
	UVGMsdVNvhW1DyXmKVb4csZ7uWkMrJBsoqNS1BAC5VlRE+G2vVUTMuBdc9plBTRlLJhmLOtSXcux2
	iJddTWhE+1iAsAhGYXhl5Qr2398CO+A4jrHOhUxZpZGHGyy8ksRpfqNBgfNaPwi0WCfGcMNlpCnfm
	incVq3n9Vn22WyKhnTtGbz1RzFBXlrPSHX4YSQE841BGS9D3hrb3O7pP5N8FhvobjtIjS4UbvcaCQ
	UjkMz8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQta-00000002Fb6-33Tw;
	Fri, 22 Nov 2024 10:28:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQsb-00000002FV2-0OcZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:27:15 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ffa97d99d6so3655961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732271231; x=1732876031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
        b=t5yJiddpzj+2flB2jsRhy0t5nxuYoRydEnVrUcjyfAaLgKAkBm9E4yLj18s8MMt37c
         cDZHnuqWQlls0yJlAniucZDSxRQ7BXUJHTJD0aLjuRF0An0ol2MFjoOn0fHa2bHg//em
         fYw7V+h5+FOYP5l7N6h3RcHwydF4Ss5uAKOXDUhfX6PlXqogSVix+IkDcGqFKEn2WQ3P
         WPmhsqk3l4u4eVEs2RzyXQ5cex2WfcFdADUM7ytuJcAd72RIhAzMkSOldmz8d3kxswEN
         mHO4e4krUoLR2GNSxz82UiisHEPj37oM131iiIxh/jefb02y9kuGpKmPVDtSB9/FI3ag
         oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732271231; x=1732876031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
        b=qpOWt7kW6u0jAJijNMJtisHcorwqMwykkJIDa4NnwMYj9p2uVBTUYyJFPIiPqdMDFP
         iX1h5doeHhetn0P30BCzGxZ6E2ZA6yzmAFpwyLf4u5lF4RSjSOX0EYuGIGEsFJ1V+au4
         UnfZGWz2okgPthkXy7BoIwVBrF1WpGlIZKN0u5dXXljJ2dGyX0xqsh40agHEgn+hDJX3
         PQc6QxeZpCa05XKCRb4bT9Nb90rjQ/BSWvkrbzZZAJkku2A4D+T+wscVbjSvwn8S5zhj
         J0R4FXtAdmxCIlN4GQ3iSNVOpjrF1zOlMscPqip2R/sgqZqAa9frC1WlNr+CtjLDzV3X
         FVKg==
X-Forwarded-Encrypted: i=1; AJvYcCV1JtdTa1RZDNtf0HJuSsdypZdWzIzbiZI+Cshu6XzoGkk+xEcfzbKtgVO5Bxk6SQ2JnZl/hZiOUrPta3Q0fhAY@lists.infradead.org
X-Gm-Message-State: AOJu0YxKR4owBVH0lSTJIGBFC1HTM+dDEd8dEyfAVGwHenXDki0wU3yW
	G+uGt0gENPSGAjbYLvlvsZYCoOODY04d1lwKRL7nDELRPwprVJ5OAuaitGZ71UY=
X-Gm-Gg: ASbGncsrx8pz2/WJzB9bKcJTvNi/P+fuEP28b7m8SY1zqA8a9bkT1YK0ixWZo9QUiO3
	j0BiYny8+MypgiFT+bCQX12uVUWANIKpP0m5Ye5prf0aDQVEYYuwGadF3m9UHnqmBjqV1J60Jfo
	2MQy9TTcoF4IUhmTPOn/JzDhbrnl3oz2wjbKz7awZJm+0AMLbdlEGZthnhPs7HZQEIwwbjBEOmp
	/x/j4IOiao+uygsj2TEc3Evlbq1Xh+/mSGcvGczN0zpp7/s5rdHGjzu5jJFJjod3TQDcgVePJ4X
	ejfu/DKe0JjjlxpJxp9/dgGMLH+0sQ==
X-Google-Smtp-Source: AGHT+IG3oQHashA6tpFb+9+NmJi4GpOI+M8h9JPqYyxeNcEzdxQdY5O2kg12XYaqyKtAV7A8h+5UvA==
X-Received: by 2002:a05:651c:198d:b0:2fb:5b23:edba with SMTP id 38308e7fff4ca-2ffa712dcb8mr11465241fa.23.1732271231158;
        Fri, 22 Nov 2024 02:27:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa7a65786sm2280291fa.63.2024.11.22.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:27:09 -0800 (PST)
Date: Fri, 22 Nov 2024 12:27:07 +0200
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
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: Add display support for QCS615
Message-ID: <n7mnldqd2td2cm4uup6mlnmbzyg7unbzvert6kyweopplbfssz@vm3egater24k>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_022714_752049_85215232 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, Nov 22, 2024 at 05:56:51PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 186 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

