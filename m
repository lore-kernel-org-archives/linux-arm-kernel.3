Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE0BD41C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=; b=D/9mnNBfr0EbZLa9HjUOxYaWgP
	7jQ0eHa2R4F3+ZnLZX5SSzJ8i6B4ggLhHAPTA4tm3nPZ3Vife3dBZCTVC6qYKwIbunuNLSQ0AUPKM
	Kw13bkpIZW4XOgdvU8oRC6onIQgEygIp4XRDyUoGbUkbENz+PCZ/3qtZWfpspx2XpgxE9c4PWv4/C
	TUkGkuWCb4Yt3QN1hw5qRosJ838UXuOU0zoBgEr8m5J9wBCe2sCSclgQy29gozSOr/1kku/+aUr4Z
	W4solzOhTQvzUDrwvhwOVcy6SNdeg5rJ3mPaPYjuBWKfSJj7WGPhfOOjBFZZ3ZqHWteRvUQyrQHUK
	IegKmN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCTs-00000006laT-3xHd;
	Wed, 13 Nov 2024 12:28:20 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCNG-00000006kKo-2PU7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:21:31 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so6198252276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 04:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731500489; x=1732105289; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
        b=ic9LQ/IhkNWZ43uL/sDog1fZjJbcK2h28k2NuoyQT3tPwJtd3Qu64SuiS7eVkyxAOJ
         qXX4BN2E8HhAZIley6BbxZMM9tXOMLmjpw4PQIYuIwwq/ELyGYcAry0p6GFPJxLyNLnp
         8Eu3ZT2mjuhEQ8QCNY3HuwD59OkUc1RbHfMOUwipoJKC0ieYgd2aScfAfaYC++KSMpAM
         ublPxCz1VrFZkGLqfK2ltU15EMCMK/uz6Z/gZHqwnrRnDeZxeHV1V8mEi45K0bxc+lpD
         I8Zfe+Ne7CamR1Um+uVeKbZz+v+nvg+UoFolVwNsdm+Kup5RR//ISq/j6DzC5tMZEC0x
         Vd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500489; x=1732105289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
        b=BT70SHA0S0AwGNb9oYpGGZyoiiEGqNRtnwJf48Gw8tY2tr3y/B+QpbcBm1AJgrTq4+
         YiscyPXZ9JHJwHOg4yasFViTNJOFM+2/f2VA6yvZp79oUURvlmiPpKp+r0F63DyU7yMz
         YTFuVzPo+7SISeyfedg1DBpkLvVr6rR9PN2BQfSEXqXu/UEQgk+vB3ikSl6c1tRwRWUg
         bgnzhFkiBB0JjAqtlkVqpwwcU6pe7oTIjV4wIn/x1O5ytjWd3g27tYXc4VF58tKhyIxf
         2qMUiu7WSwoBZDH1zXX9k7+hg/LEGp6zFFR7jIG9t2UBM5q3SrQGRrYgMlTF2KG3lz6i
         IQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJq+unYO/EEZIApqGmS+vf78RMN3J+P7Qtifp91mu2mpLaIj3FI4dOfOr1dssQZtdiAl464fVcxYerBZEfoe6H@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2sclUGC9x+Z0P86abj1e3f+91f2LEp5HVzZjuUTvWjZd8y7Xz
	f+nRg0lgWIWCqlosH/dCh/ExmOx7HXEIbaAtJSgI5Jjss+JOg3R7EQn6usDojaWS31qFaSCaDR+
	zeCJG8jmc2V4XHc9ezaeh6kWG+F0fkXGV+oaAMQ==
X-Google-Smtp-Source: AGHT+IHlEW9Y6a6VKxz7Rj8wBbFwf85y1XuiF8DPZGiTfkNkpU73TSXFVeGlAI184r1k/vIlZa0la+oK03iLvn2Otwg=
X-Received: by 2002:a05:6902:1101:b0:e30:d443:8490 with SMTP id
 3f1490d57ef6-e337f8c6c9bmr18265860276.40.1731500489516; Wed, 13 Nov 2024
 04:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:21:18 +0200
Message-ID: <CAA8EJpok20-7HXJJbcJi8YZYCU68g_DGThR_ckjBEz0e+gGBSA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable SX150X for QCS615 ride board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_042130_641663_8E14FF1B 
X-CRM114-Status: GOOD (  17.43  )
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> For the QCS615 ride board, enable the SX150X to activate the ANX7625
> allowing the DSI to output to the mDP through the external bridge.
> The ANX7625 relies on the SX150X chip to perform reset and HPD.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c0b8482ac6ad7498487718ba01d11b1c95e7543d..599a339a19435efbee7a5ef80c093b0e8c65f7ff 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -631,6 +631,7 @@ CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
>  CONFIG_PINCTRL_SM8550=y
>  CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SX150X=y

Your commit message doesn't describe why it needs to be disabled as a
built-in. You are trying to enable it for all defconfig users.
Also the placement of the symbol is not correct. You've added it to
the section with msm pinctrl drivers, while the chip has nothing to do
with msm.

>  CONFIG_PINCTRL_X1E80100=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_LPASS_LPI=m
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

