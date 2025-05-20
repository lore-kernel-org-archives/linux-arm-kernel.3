Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21AAC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88lOLN3//BdORRDyk/6LjlOBy9fkXDogVmGs1sgPhyI=; b=uRbWOomKAKA6XSxrwKv7Mkzw9P
	aIS/jwMiu8uH3XoLimfREgaG+bioaTCIerdgfJ5jI8Gems6XBZP1foIEWVYLnm2exPDg+REgBpvnz
	dO8etyt8cu8503cubKIrQyWDaOpdL8Ph0BD/4XlqihndOPHUmdo0bNK0D/ErvqE7rZ+ezh9Gt8szT
	1Byl0bXn74xm29vb5zrrX6tWOFidUG+FzXz3KzifZh+UbCOVttc3znmFCab5uF3cRSAOv0ZL5t0B9
	qgFVEWhCUdDwWa2Zj8gEAYRB/WglLHgF1twAKARB5fWBFP2UzGV589FCXTLyxt7s1gAuzzcuB0am3
	5pezKZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMLG-0000000CuVD-1AzG;
	Tue, 20 May 2025 12:45:10 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMJ9-0000000Ctuy-1nSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:43:00 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e7b85f1cbacso3247451276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747744978; x=1748349778; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88lOLN3//BdORRDyk/6LjlOBy9fkXDogVmGs1sgPhyI=;
        b=uJGVsVu5beKG+6hSJ5wwykWfPXyDr3sQ/ZGUNqw4LdiehiRWJM1i05aZ4SgnpphSAo
         i63ry3CuKjnNGAlsElf3MYLLZvIdLxl3Bb3gQTYkKShZ6vdGE+VXGDepEVyIy2Na47W/
         c9u8iXZVuBXJxnO4Iw3Lr/A9bRlkNeuQA4toS42+PEfztAV3Hh4lmsKx/P0PaS/jVKv9
         GM93UTSCZfp4HXD+DDFbEKxR05/RrBByyu3YabHIjCdI/gwDrSu/umbw8+QLRSfIaSGY
         ck7hZkGCVwW+Mhr86xVGW9Ou4JeI+M3oM3DrciNUOGPkiPkkZc5AimSPAc5w7H4CdK17
         fXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744978; x=1748349778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88lOLN3//BdORRDyk/6LjlOBy9fkXDogVmGs1sgPhyI=;
        b=TblXhKTYQYHqcooBfPdPaIxVBrMwVHONpnq8Dya3GBa0xLeGhN3andKltPgTku5eew
         F+A4e/PKmEpIgfPW8gyyWfoVZUBnB6I7KI+miQeYHaBrE01Qt/n03uMUw2D29+yUiJef
         GOy5C8pVame4ekGrDUt+9BgSobyr6mSZxok/hYzoGZtMZzbQRvjsj3IbZJLg5iPJGehg
         0LWLFCWJYSws0qdkWJ6tkzX+3oowQUdB6NeyjT6o6w26sFnwR7k8M9u02f/EefWeWvZV
         VriegzbivqgLflIA69DBV0BxK3mlBNhaWulmoWTwWFuzAoY0oWKoSRy8e9Yp0rpjLulT
         9owg==
X-Forwarded-Encrypted: i=1; AJvYcCVcU1OgUSGv7oLP4MreH2DoLKu7/UUcs0bq+4w1eZdU+OT3fOb+hCAnP+cwAJYcYH3ZM7px0+BRQDDPSEDwycq6@lists.infradead.org
X-Gm-Message-State: AOJu0Yztke6I2N7ANevVoMrzdM80AubBFjYqo5UxdR5PH/6PHL6A/gdK
	trM2RSD/cnaA0+o5/YR+wL6IHDO38Kr+8+ZxqFcxxOUCufYd6R07mKT4JPFIhKU3as0tBJNkqwn
	AecUzLqTG8SRMAauZ3PG8CXYqUgpd3133hP2gE1yzpA==
X-Gm-Gg: ASbGncudJCULou08nf6wfx8/JJhHpuuilkWQY6SnLQxlFVGcFOqbGbl3gT9wtT7d3tw
	EbNOLvMavsuRzp468B4GKQPp9iCPxxaXo1j84fARD66AeHB7U9fNRJfs8+zaG2QjWWjRVNqb3aL
	GAjrYWKXTCxrhq+NBdtSZalZShqOa4PcnPYw==
X-Google-Smtp-Source: AGHT+IGhT+v8r+0GZsiYhs7CHph95cb2P8MRGP6RGC8fZ7dFYUwqCE9+mfUsNw7SyUvETHMbFtvpOAcTqK/Ng1hl+qE=
X-Received: by 2002:a05:6902:1201:b0:e79:774:866f with SMTP id
 3f1490d57ef6-e7b69e80915mr20083103276.17.1747744978059; Tue, 20 May 2025
 05:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250518220707.669515-1-jonas@kwiboo.se> <20250518220707.669515-6-jonas@kwiboo.se>
In-Reply-To: <20250518220707.669515-6-jonas@kwiboo.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 May 2025 14:42:20 +0200
X-Gm-Features: AX0GCFs3Un2EF18YwTSrDKI84LtGeBLBa79SYyXbjLKaJiwIZzX41KzumIQh4bM
Message-ID: <CAPDyKFqu-ox90dEnK8L0C8CqXJDsvgGwH00__nfQcOYu8hNM9Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a power-domain
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_054259_471432_50B183B1 
X-CRM114-Status: GOOD (  16.15  )
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

On Mon, 19 May 2025 at 00:07, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> The commit 7e856617a1f3 ("dt-bindings: mmc: Add support for rk3576
> eMMC") limited use of power-domains to Rockchip RK3576.
>
> Remove the power-domains: false to allow use of power-domains with more
> controllers, e.g. with SDHCI on Rockchip RK3528.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 5fb347167004..f882219a0a26 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -120,10 +120,6 @@ allOf:
>        required:
>          - power-domains
>
> -    else:
> -      properties:
> -        power-domains: false
> -
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.49.0
>

