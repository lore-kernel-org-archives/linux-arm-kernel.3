Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E510CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EF0zDFUflzONesty7VuCi7dpM8v0C1RgMUVQ/Huc38=; b=1nniPTRIz6PwCc3k2TWfW5ODNq
	0q9mOhMssB/Ad9togDHnyya6NOA9cHKGBStohZ2JcqWfFPkX54v6LowpjEGKMcGYVtSU6Ul2tDVjE
	7my20HNEQok4MHT+miF5ZIKzzrIdcy5uBKW0rs1N6XTYmBcMLOmRoybWkqba5aFyIGv3uKZ9LMjeW
	zUNkrLoUabbqabX9gp0bIAJgXBtB18yia5n+8BFrSLuNdFGMOX8gXYEQVASVvP8vDe8QQcajl3S49
	fPnpork6KpofrRvdcJ/1iO1sxJSOIyz5ZybJtQdrei2yKy7XymTrv5SybL/lA9/m46UG+bQXaRWxq
	XjbP+uCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL2Q-00000008Nnl-2ZBS;
	Wed, 12 Mar 2025 12:18:18 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKDD-00000008FNY-03d2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:24 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6fee50bfea5so33358327b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778722; x=1742383522; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EF0zDFUflzONesty7VuCi7dpM8v0C1RgMUVQ/Huc38=;
        b=OdSvUm2+S1NXkynaWCPxPFsFwZQ26l9t0iavsLerFwg7h8ziNaEKwHLjMszg9QYUQ1
         tI8IzTGVGumsvFDzbO3Uf8AETJOmwTMmjT+bWaRmCD9WO2FZwQ/EqQfq9vbdJYo0TdV8
         eWIFXNvEdzihF84Ef7pBx05mXiB4eGSEywvSMUcLRmk6kn83fLm4Z7zFRNDcRsHRRIE6
         xwKWr73jJd6azjIZT+whtQEhPyxywWC0aLCCfhQ/zZmPcZ+vyCwIKtT/xxrbigNHsR5R
         hVuOwPbbKSbrZ7WBXXYo9UO63k8rfsRSmDhiYtaqjet30/F4hEtp7VFbTmls8PHZt3Hr
         nWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778722; x=1742383522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EF0zDFUflzONesty7VuCi7dpM8v0C1RgMUVQ/Huc38=;
        b=t7zrgn6YTbBYSML7KZSeAdiYwrSguuH8CCrkrueg9SY4P2jOAQB+3GpB6Kv/ccxG7q
         bOV1TWhozbCgJWmCLUCa1hadtSfquG6e23Q2FpuRuzBX/i05NiAOLXwE4GmX6JnqQqR4
         tJp62zHOX6+MdrRhj0wJRxhipKqtvOweRQBKFAUsZaWhxkTSQia5ae8/wPAEjLZDdvkb
         yk9GaVemRKA+Er+IWmrHpsjyrMwjU2SwMImOZdyp54Nkc2jrsAwre1OgEAN2Im/3sO8b
         P2UMuQdRLklYy4iORB+jMF/pFUoUjV/rrYTj0MIP7My71Qmzkvw790kAF/FpUQO68NR2
         09kA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMEQXnz2PGHCEDwMYbe8h2s9NWI6DyotHdrXzJD2MqZayzxZn/lnt+5QCLRLiJBNFGSvHhhfANdgtK2PgaXZP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8SYOA8XQevK67R6aT0MIYlFbp1bO4O4SSSbaJdKTfRXUEJTNa
	1ypEuFG1X6JJDpITWxl269QTLHMdRYnqNzh2UWdddN9PfpF8IOCyBjGxl2YRSRYmpJ+XFfMiLZP
	E0TTmHcemR2ZwYUgTCiWFLe5ljQdRoF6xmk7XwA==
X-Gm-Gg: ASbGncvU+dFC2BpLscwaK3WcQ47GaEfJFWEPKtmPMn4r3k9kkvSqt9xMVf0Ew5LyJEQ
	wlKDLmo1LnvECHvxmLKG8QGnrC8yL/2IIPiMhqBC0kJwzQbntQMolIsxMLPl/fON1k4nq7ScQJa
	O7NCRVydZeprY7wRT4lX2xhJy/cdM=
X-Google-Smtp-Source: AGHT+IFqygKUb22qwAr7SdPFa0reMvPuoDMxSiqht7LJBAA6dNVB//vX5+hUcQlzt9SsFOYTACa28ZoSjTZLQK0COho=
X-Received: by 2002:a05:690c:7441:b0:6fd:385d:5f10 with SMTP id
 00721157ae682-6febf3b354bmr296734367b3.35.1741778722003; Wed, 12 Mar 2025
 04:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250227111913.2344207-1-kever.yang@rock-chips.com> <20250227111913.2344207-4-kever.yang@rock-chips.com>
In-Reply-To: <20250227111913.2344207-4-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:45 +0100
X-Gm-Features: AQ5f1Jo1-FHRoh7DeYJjPWlq5FRe7dVaoDojoDTMYnsv82KnWlepC9mm2gadUoA
Message-ID: <CAPDyKFqZeup0hKqeHFV6qOMpFYZLQOdj3xT_6PdSNWJiW48fsw@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] dt-bindings: mmc: rockchip-dw-mshc: Add support
 for rk3562
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042523_045571_C88899CD 
X-CRM114-Status: GOOD (  15.76  )
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

On Thu, 27 Feb 2025 at 12:19, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> The dw-mshc core on Rockchip's RK3562 is the same as the one already
> included in RK3288. Extend the binding accordingly to allow
>
>         compatible = "rockchip,rk3562-dw-mshc", "rockchip,rk3288-dw-mshc";
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v3:
> - update commit msg
>
> Changes in v2: None
>
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 06df1269f247..772f592291bf 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3328-dw-mshc
>                - rockchip,rk3368-dw-mshc
>                - rockchip,rk3399-dw-mshc
> +              - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
>                - rockchip,rv1108-dw-mshc
> --
> 2.25.1
>

