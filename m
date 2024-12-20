Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D25FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdEM25avAV3Wk0/A8V/RskskKqNdHIG3q8iPcW7Zhuw=; b=CrqLcXW1NWEupMQC5uRv2ffjs3
	hGpt13jm0P7zM+a0LDtDLdqD2JBuRMDfg18TnP6l3nn/v1b9TCVagI70Vi5Re1hiFFPaVyV7MLTGS
	6WarqDBrNuXSqgNfMfpbA08osRkAYgC8HuSCHUPbTMLrjWW3rnx7ZvFqfH9T+nIWqxnj+md2qXIBB
	ESYDBI2bEKhGxoD2SZ2qepkKTvxuR0LLayjESn8dKKVPK/UY943GHHIc6mwjXmmxV09F0fgM/nhDf
	YcLWl0dXCj2/eLCvVR2pJki/Ax4O6to8J7EQZUaKqxuiNmDFp3AYiH6rAddUypxD/d6zJ9iTFhS27
	iSz5U01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQlf-00000003SLI-0VAp;
	Fri, 20 Dec 2024 00:21:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQir-00000003Rbe-2ePe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:18:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54026562221so1254704e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 16:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734653908; x=1735258708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdEM25avAV3Wk0/A8V/RskskKqNdHIG3q8iPcW7Zhuw=;
        b=bstqHfkfqSuemiGFxEujZYN7DETYcKgRVlm3u8FMxG/FRGwC5yEgDMAoKwA5+IgVdk
         98R/P5Bih14thg95sSOH5/Y2qI8mp5MZS0MLyfgDkA/73sBFIN7w7D+8lEMeW+Qop67S
         XTVz4KDtAjmjSkW8zwiqdDBEEhM68CoOqDjkigdcR2pZBDb9C2c8Z0xYcLUWYEn/gOTu
         BFrLcFyny+SQiZAw+ug4dNvJNU5pDXvIEr/wcpF8NOvJsy5+3WrbPCFKnayFImTU6/5p
         y5ikXJzFkJCrX0Ms67CrvvvlQiLxvEFAfQ4BEoWYrFoCr42JmaglPF7aVQekapC/GcIe
         JQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734653908; x=1735258708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdEM25avAV3Wk0/A8V/RskskKqNdHIG3q8iPcW7Zhuw=;
        b=tHFEBHrGHhVnK9SgLLGwIFvrzjeXJwQb8b0uRguAEmSJIfa1jDIabuW+ZNVVfr+95j
         FVVRfDZN55YAIe1O9QsMMnpe5e7oy61aoRZShulvgEoXM8hEBazypsvXhJaClDzpoOCN
         fVtaP8SQlmQV2N5wos7y1MkK6tCrOvG1GH+PmFaFHYP4ljQVU/aiMVBlSmRDvR8EHoA6
         fHpFLn6WSYW4V62HQSvFqEt9QSf/ZJsgxy/lds9USpT1qDZfWE1QXIpFXcFVyR7l2TZm
         oLTYhUFtGRMaI+s/tsBKozMeSDsXXf0Ms8r/8jvolfnJodqQj1BoB3uqBSpBsgDJiXm2
         88Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUfcE7YAQEXr1FqpkNgSXKeTOPrk/ab9GSXikBuPwpIDkfUB9w4+iDm1erAhQlO806h/u3w9RMjyg+Q7LNUHhJ/@lists.infradead.org
X-Gm-Message-State: AOJu0YydAFrHIdkdzh6y0P1RkveS7y5kepl9Vob4dKIlNxi5+v2zkX6U
	TrlE1DDEe9AjLiXJTpIXs/yz8nkGm9C4uxwus34IV0KXM48UkztDf4M2g5QUFo4=
X-Gm-Gg: ASbGnctzAzlm9BgEnNRWoyhjX2+iS5Uy2W+QqvZJGf5td4yQ6sFjCJg0kMe9z4XqFg8
	5E3yNfmweIpwhrOtqdePcn+V4J2+zPIGdWDJn6S87SNPD96rZqyCDR3iHaEJGq4f2z8oPEn5qYz
	8LBSK7kyzfnME1WnJSPr5oolRWvynHAhdspQGROSv4Mt2xgVcIZSNrAyUuxDkoGAQasNqsrIGzZ
	5NeCaPT0VBJt+BbBm+w6psWDSwiaXeeiCNVnvdlKZWvpeBZmbK2VukYZFqYvsatRxyN+fx4yZqP
	EXFSeDxEt2fr1xTUVmkW9rH9DN5kez0ZJsDE
X-Google-Smtp-Source: AGHT+IHaBhOQ2F/tQJgKM89Gv/3h/pUJDiIxhbwnt6itHhtFdLYkVHk0tzYt/YbigfNxUGxwQcqftw==
X-Received: by 2002:a05:6512:3d16:b0:540:1b2d:8ee1 with SMTP id 2adb3069b0e04-54229522508mr159038e87.11.1734653907712;
        Thu, 19 Dec 2024 16:18:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135basm315388e87.130.2024.12.19.16.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:18:26 -0800 (PST)
Date: Fri, 20 Dec 2024 02:18:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 10/15] dt-bindings: display: rockchip: analogix-dp:
 Add support to get panel from the DP AUX bus
Message-ID: <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-11-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_161829_660611_4A183B48 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Dec 19, 2024 at 04:05:59PM +0800, Damon Ding wrote:
> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
> it is a good way to get panel through the DP AUX bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
>  1 file changed, 3 insertions(+)

Business before pleasure.^W^W^W Bindings before the driver.

> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index 4f84e8849876..c45d92a2d901 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -49,6 +49,9 @@ properties:
>      description:
>        This SoC makes use of GRF regs.
>  
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
>  required:
>    - compatible
>    - clocks
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

