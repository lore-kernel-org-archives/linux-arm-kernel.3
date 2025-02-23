Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6393EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 23:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=; b=bLSMjUPB1VbHMfS/7wvxquD6bc
	BOy345x60+2+Sn/PnXWrihBcWPOAgF+r9g/vwkdsfuZL0/MXmw33sQciBQaa0BptM6cgFce9/4Ueo
	VIurz4NR7NgZJ/G/tVIjuT0z9OvKGlsgAfEZXa9lkQ9aOLjXOzSiVvsPyHRjbt3PDcm3zF4ANGYFg
	h3hyAopEamjeYMiqyV5Cdk9eiUauEZLSgIHuUBh2vEQL09cDoVAvtavKDd58ZaiRmSpaVQbyyphQg
	jqd0LE3ap8J9f18rGz83tyRWr/d1oVKCSXROloNpwGjZun/1c4A3DjkzY1pTveHIPipBLNmBUKLnV
	V28rVVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLjE-0000000BzTY-01Km;
	Sun, 23 Feb 2025 23:49:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLhl-0000000BzM6-0P2g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 23:48:14 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4285078e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 15:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354491; x=1740959291; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=oCvCtweQlRFMIqOFgr3Ml4mK7U/vp8B14Hv9+iHNOiJGUsMuInu2USSMMEKsV/bQZR
         lmhjUgHTPFZCu2pF1my3QKbuR75M7G17xg9ATMJW1GIcbIWUUQhRpsiaR1Hzq72kuyvK
         mnWfGZUubmTlHW5M1nceVfclteyGDaIH2ddlyzwJ8ovMjbrpy9jqc3IWoD5seXkrbN7U
         vbdPrXNnCgaODimj9mMY6HZTkqY5GI4VbyEohoAdGO+WZl/cZvO8vPbFOesL5ABH4AeQ
         ken/U7GZpkNg+TtGw9jVuej63f+ndLwY0+KjlzxmG/XDF59Z4tols6tD9sgu+NjvjjDG
         N8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354491; x=1740959291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=FDNb1SM/DtZHMdTzzHyB7rxA6SAox7fnpNMwoCT6yA5LeUT0rKeITl0O0yc3J/NNCI
         N/pHkceC4/byEk8es2p/9mHPdSOZOmXkLCowOQF2a3pc2soyu++9uQlMQZjEcDlQ8oZL
         GAw4N/xMidi6VE/3XX1chrunEqw2hwzuB1bSp0onMhXDzmDosZEnIxID5l0LShktSDYU
         X6WCA4WcY6t2+iMzzcX6BrMROgegZlL7PRsGT5hNoIPDQAJWvi+WJ0QsXY9a4JUQwEbN
         m7xPCPUXE8Nzuz6XEjUC+UjLy6bjhSmuIOhZ5pmY08eBhYKbbY3dXRPh93dNa/yLk8Ag
         iZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVs65s0hCk5BS1iUg71tkrwdTJfu2Um3fV2qKKO0J3w0Gmrpk39zS4HArIpXCI6X/QHRvwIci0Wjhg8Qgczi2Ea@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ZuF0bG7dypwmAX4YPnJ7vqKajnAUa8ijUF8ZXuPb3Aa4Rcb0
	3TWsbYQffLWmherurc+MH4IQRNwsC0FilTMSjnDMgF+kiEneLtxfoiADpWn7+kc=
X-Gm-Gg: ASbGnctFPjrNWnhD0c9MNJ+adRrzYBmXRNiOtHrksdwuXm0ZtSnAHuRDVm8ShQvCAXI
	lZOgrgUC80OIdbXydL9bj2+bM3SFsjAr75A4WATjoms1bgM+mDr7iAWoWyjw8QN3nxcVuVK7ev1
	FvXIxaa5f0SviAhhjsbLaS9zhOYBRWtJZ9TkrB1XCWU7uhdzLvEQCqMbp00mXPZBoRZYdafoRWz
	Sj+gK/Vdj/2+e4vZwFcEH2RmTQ2jHVyaMvhaUk0n47vsKyrdlDQJzDDmgai1u30/2zQfGjKsLPx
	U9wPZSY4OSLtdIe2uArG2PeUfbmXWHauYqwQ2WzJOraEbGbpXI1hW/BOd2o/qU6MuCCdugl8by4
	Xgh37qg==
X-Google-Smtp-Source: AGHT+IGXmEWcaphU72erBHimrC5JqF3fr1E4pBz3cUxisqWzEmoQZicuyftwCeCY3akeN/V+TAZxhg==
X-Received: by 2002:a05:6512:3f29:b0:545:1049:eb4f with SMTP id 2adb3069b0e04-54838a00232mr4288474e87.0.1740354491225;
        Sun, 23 Feb 2025 15:48:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452a67e6c3sm2955721e87.1.2025.02.23.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:48:09 -0800 (PST)
Date: Mon, 24 Feb 2025 01:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Message-ID: <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_154813_143136_9CAC5804 
X-CRM114-Status: GOOD (  11.47  )
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

On Sun, Feb 23, 2025 at 02:22:25PM +0200, Ivaylo Ivanov wrote:
> Some SoCs don't provide explicit reset lines, so make them optional.

Is there an external reset or some other signal?

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

