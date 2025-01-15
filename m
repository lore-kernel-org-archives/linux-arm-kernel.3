Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0AEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=; b=h7kRoLt90UOSDe41VidC5DyXNp
	VTyEGm+iQer7xWqm9mlDkWOtz6aj5h2F5+Y5cF9A+2UJIuM/wfG4ie9grPExY1VNm7LfRTofhbxMm
	wiJXPS/KEywYchpDbKwxG/QMJZo6zRd1uKxHix7E+EgSbwwMsLLkdZ4fUk+yvIs3qZMqIci9UztWw
	oOPJNbw9DjD9H1RHMpnSF9JuB+P254bZwO6jjeKuf94WnmL1ht0WPEnfSQhObvEftWrChRuQtyBhk
	+7MjA9AyOCIOmRQfzszAY+D/iz3/Outwr51h7DHyFMJYwefStIpVF8LEvXZmVUQqF3gDx39Y5twOE
	+tB2ElCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8q3-0000000CrpZ-3qod;
	Wed, 15 Jan 2025 19:14:03 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8ol-0000000Cree-1Xbq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 19:12:45 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-467a8d2d7f1so1292681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 11:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1736968362; x=1737573162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=;
        b=CxhZXIdDBGbvOk3LpFKKptyg7++mxW2jK/f4l919X8cn/GqdWwWbLPdgfc0s1Yo3ML
         yvE6LE51F4g71XfO1z/prc3qJMsvovuRG+xUHvNi/7WFJxC6TNynrgJqVYRvENPyFch1
         1YMgzY6btbUp7ML4DkG3hjcOk3PWguf2F/P4CAFRE43uyBUph2xg9CpEdNCxvt2Y+k/i
         mehxWNJQHEjySZtRYsgvp7s3jrDm9A+wb9CM4XCIlQUNLd3bp0sorI7Wt9MIXDkTrTjb
         LaggSmihdIEuRGVWQIba7mqs62w2Icendr5EDNjg4oJunnkfiwskUjTfGAMv4xhz90Ud
         PKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968362; x=1737573162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4oGFxCwPaJgAdqTBVjzj8myjSC006R3VVcxomH2jWc=;
        b=DJJtL8kcVVcWJax9DpRufazUVnm76WB/mQ3ZojKQ1kcnZjUBA2w0iGF7Qgk18OK7bI
         1vHl83pjqtOVjTfRp7TXHV659Y7FJn7X0xd7SQ1IvzZfRCw6r+tHBkQm3Kc/2gcxS9bG
         TeaT/GFEIYus+R4oHFxjL9knz/SsQmCi7jg6gOb9e6Zx6YiDRWfF4IWbhbCkGXi+SRH2
         WsluZgYLXAsSN5nD2MSvfq//QFgaLA6mDCNE6QTmdP9e+wUGf7+jyLf0kVxAEYf6WGsx
         wXw+0xJQShCTQZ3ekQeufFbZzcYPxTxjES8Sg0nbOMEniP22Un+O6sOCogniqb5LMeJH
         dEzw==
X-Forwarded-Encrypted: i=1; AJvYcCW5M2nxuaoFcEBPybePkcLeVySOz9fip1Z2auaGHNkaaOaIBq4FMFwYIeeci01yjZqMnZA7KrK+Nbh3HdeqVbf3@lists.infradead.org
X-Gm-Message-State: AOJu0YwnbxrMOSrrkx7BZpk1cH/d124RJzUnMbDJR4FD15hy1TuupoED
	p1emAaYm9NRKkjGczlRz3+Vnn1hprWps+b9xOai/MY5BxVGKPzyuKCp/7KREOzE=
X-Gm-Gg: ASbGncvNhVvw5rfKV1PR0RiSDxsS/dtFXIhlyjGoydSp6jnKpsHogE3ofgxVHewzdpE
	L4FPb9lZczbtgFmSdOC8HTkTNoXCMd7oXJDw1h1zon1r6COnRu1Elxr7z2B8+RK2RkJmrasKyr3
	36Lwwjx0xxjF5htFSp6Kw8KzjKXtJYl6jWMl7FFSByJvV3/O4ql4Kh6eQNvJwyQyUbhdjiwrSuT
	zdWFoy9+aMzA4k7iZ98AOsIOJhgtTAB97yF3WI+JVYJbSfRjLsz2dtz/kt57OhZc7T3SmPNVh3s
	O127YFv/eQReKjxbWAHPNUAawtlQHw==
X-Google-Smtp-Source: AGHT+IGLgsr87VLlZ/6vxEgew2f6ev8/p69ziLEOON6TEwqWnOVVTirBJBkB/bFj8Dm/enP76kSGnA==
X-Received: by 2002:a05:622a:1a96:b0:462:ea22:33bb with SMTP id d75a77b69052e-46c7107aa17mr104417681cf.38.1736968361749;
        Wed, 15 Jan 2025 11:12:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873de559sm67648981cf.78.2025.01.15.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:12:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tY8oi-00000002pPE-1jhH;
	Wed, 15 Jan 2025 15:12:40 -0400
Date: Wed, 15 Jan 2025 15:12:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu: Use str_enable_disable-like helpers
Message-ID: <20250115191240.GA650389@ziepe.ca>
References: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111243_571779_0C07DDC0 
X-CRM114-Status: GOOD (  13.26  )
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

On Tue, Jan 14, 2025 at 08:26:42PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ++-
>  drivers/iommu/mtk_iommu.c                   | 9 +++++----
>  drivers/iommu/mtk_iommu_v1.c                | 3 ++-
>  drivers/iommu/rockchip-iommu.c              | 3 ++-
>  5 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

