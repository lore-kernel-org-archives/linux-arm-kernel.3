Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5208BE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 04:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=; b=o0kqAbqD2t+tGIKBsyPt1aoQRy
	0apr0Z1MRnt5ujVrkHWfZR7o8bFEEeqnpsoEXK7vqEcfbucWQ0CpNtumQ96OdfAqpGXAJXqXP17E7
	jH1XTDNdeknZeSqRhuT/pJgQkmIrD3zkfq8jLd3LrWBqiCTrrLk1tCd7qhslUU1KLgsP/qTLK8IKU
	SM9nG7qwRQuA+yW/Bz2ObdvD/VH2GKv3Tr0NWlfveqEzdvM5qJa3vNsnciq1NdpObz98l0XfdWUgS
	7ibTRLH4tO0D3E08ukSByqao/kPe2XDxqVrPE1ipUDA2oSTg90Rim2Gp2kVjPSVAVI1hyVyudsYNF
	zU2L6Rkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwO7-0000000BEUa-2LgP;
	Tue, 24 Dec 2024 04:19:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwLs-0000000BED7-0AgJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 04:17:01 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5899323e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 20:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013818; x=1735618618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
        b=fvgxX2T1XZTTj4GAGLakTo2wG/U6+vfDhnma+PvHMY5Gyfkftsqvp3GHPLUh58puIP
         WIbaI2u+BhlFrywsWzatvjLS0Uu7BFhbwmB15a5tM++cHHEJ6BSV43wGHhG97Ao19Y+m
         5NKoSzLYj3UeW3CeFOMfNRysXCXRILwvYVO84NvQLcD0HQeahPMmY6VlW9XHWHBi47h/
         REZH4iG4bUlFeVenQ/IvA0ReGxie7XtgV4mSPoTFfRiFIssF+gR3FKNWoA8AlEUPLg4x
         NvO4EGSVXvL2SCJrHaor02Y3D+8Rz5ike6QQDbJh8x7HaTSuCZ0veSOCXFecy2glx8KJ
         Ho4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013818; x=1735618618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
        b=DgykrJ30cGQUBgzhSx3ND+1Ym1RBMZHNh3NMNJpDrX+m9N4qGsbfg051O0lYjHmObO
         ALBcpjIRvBxAsQ6cN4dgNfg9y7AaX+lAk82LBUkZW0PmKmiPRT2JmpHt39glV8d5UQSZ
         bXMJ+BHSx1AMvXp07ME8xI/0E+rKQcuYXmaWls+qRQJbtq6z1YcXEX5LOijY/UZc8V3R
         PwunIpbGm/oUg0A/1Z46ZabUJ0OTU2bWe7B9kMalP+Ndqg6C1rrYwvjENld5ZdclIkdE
         /W7EVmbUqm8eYxgb8o/iQrx6t7KAmDayugM9ljr4cGrLLU8gRDD/y5Dg2cn4c28VQ2Ys
         6ddw==
X-Forwarded-Encrypted: i=1; AJvYcCVMIQAHKWAPdkW+57Yz1l1mgefz8iWjPicXAZ0O6rp6nDiOE1Nj3Uu8ZfvLSEjXx692m/rIPOiGTn4eXVRBd2Vw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZhb4TbzQBg1PEUa71/FkgSeSZ/syXS1Bon+x098cCQG+VTA9t
	PJhDXKMMxkKfDKf8oapJ23xT4h2wEJDp6amtWrK6J9fbV3cchNb7TakpPnNq21jMfC9H4jI0UB3
	5
X-Gm-Gg: ASbGnctGtfVhqcvdihzwNGc3g1IFGaYETTpkhJOlwMHxPxdy7R6tYeDu3+UozGBLhI6
	yyUVleIaRsC01w4TWGTGZBsAy1WTRaCFzmySAr+RHTAUAkLvGx/VIecdsekPJi46gcv5vCFZOwU
	34AwWihCWQ0bDIiEUtvzayMDwMvkiFXa9D3oIL5Ef74Rt/wV97NUiPr25mifDgonk49iKnpN3uR
	qkelSHQmP6HNokYoQu8RuAqSAvSt2KINaoxR/imk61io4JfGEhjx0aDRDJCCcW0Fz3sgALqP1hi
	FT47DFSvRGDn4M+L42lVUf/w1xXWqXhw3PvO
X-Google-Smtp-Source: AGHT+IHMGmYGMF6q2MDHua7nxv0GhA7FnjWIVG2kKpKZJ4CxXoTwmdLNVjxPUwAUj8j/ub8sXpIJFg==
X-Received: by 2002:ac2:4c48:0:b0:540:3579:f38f with SMTP id 2adb3069b0e04-542295821afmr5451612e87.37.1735013818146;
        Mon, 23 Dec 2024 20:16:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214b5sm1486186e87.187.2024.12.23.20.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:16:56 -0800 (PST)
Date: Tue, 24 Dec 2024 06:16:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
Message-ID: <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_201700_088950_3F5FB3FB 
X-CRM114-Status: GOOD (  15.37  )
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

On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> compared to sm8150's 2.1.2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> Changes in v2:
> - Update the subject for the first patch.
> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
> 
> ---
> Yijie Yang (3):
>       dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>       dt-bindings: net: snps,dwmac: add description for qcs615
>       net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+), 4 deletions(-)
> ---
> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b

Which commit is it? I can't find it in linux-next

> change-id: 20241111-schema-7915779020f5
> 
> Best regards,
> -- 
> Yijie Yang <quic_yijiyang@quicinc.com>
> 

-- 
With best wishes
Dmitry

