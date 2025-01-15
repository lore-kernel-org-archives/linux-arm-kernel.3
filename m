Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77828C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSM2HZluyONZrn3gXP7oqGlR+tWUwLkG4z/EG2USxK4=; b=beg5v3hmlodjb1xGDKFhDZqeS4
	W6KXKZx7rm1zHtHZKoe0yV5/CIUgiIBT8a+vEeRxOdBKpHZPbltVocks4LgdRE0DaHcEfSmbxdOfF
	A/CmdF0DIX1FE0/WLQpzHQESIwYzyzo5yK5eAZvTykpIq63pFP8FsmcC/t9Rgs9p0OATCGTWeAtNy
	/jAHGYv6LAglLEACVZbNUnGOn93qERM8iJSReyvnTBZH3kYrbGEFR1gRScnqMS4gL+XTEWyjy/qEY
	aDD/OAMX18MNd/Kq8Fnr39QyCT1RYquDWLFBGDZAaa2XW2yn8ffSd4rjpRFbuHuHzWJ58BC+jA+jl
	J6Yt3CyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Of-0000000CdjP-2tIq;
	Wed, 15 Jan 2025 17:41:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7NM-0000000CdSP-2ZIq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:40:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166360285dso126648665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736962820; x=1737567620; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RSM2HZluyONZrn3gXP7oqGlR+tWUwLkG4z/EG2USxK4=;
        b=TDQ2WqH4yZ3e8uX7D7L7Tl5sbS/BLGGw+JCf7G9z78OSbUsdQ6g6fqAWbl3NIaosmn
         40ZtXTSMncognbdULS2sXxmMBatGmNFsV3KyJAWOiwzEnmCv2fAPOQP4/Vc+FRWYagnZ
         jO4JtBFFo6PZoujrUXM3l0Q8OKUS5EeQjQBfj3cD5BSXtFajiDtjjEV5NucnY5/xIuDd
         MlS3QhjbE9pALM4YQJE7VlBOiESemzUnR46hdJVQr/yvNIfhcxj36pcY/WB1r90rM8/u
         mUeKC471ychjezuNvi1Az1Bz1ekyS6VNNWVyWEF9M5V+upztYhESFkwgUPWwK6vVYN7a
         rF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962820; x=1737567620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSM2HZluyONZrn3gXP7oqGlR+tWUwLkG4z/EG2USxK4=;
        b=k3QCk0oEM3KS95EcrQI3SceHLrCuKpLX23LJWkjkxP2ooxR/NVzCt/gWgldSSzZWpS
         DgLw3QvVhtbBdiZSVkculNBV7weIUGwNFERH3oR0fmZpYXLFothUJVDMGxbQ8/gXb1wo
         o8ZbHsJOcwcWVZrMTAg+d/hzWK2w8NmGR3a/1wzGBQpHJ+WnR9kGXfaNxmrJngJ+hUNU
         YerAUkiuW+QJ01ZVOfAIvK9mAQ2SHaXrRWA4Mg7pSZMpTmLQowfTeUjnpvKv/GTrKw9E
         0G7lxXPKUzgmkx092lmaggLG3484y7+1AT52D7ufwOBa6hoTxIu4gbxfuSa9ZsgEs7Sl
         TljA==
X-Forwarded-Encrypted: i=1; AJvYcCVeUKR3t0j5FXNGC4VZeVu1EAUeYAif6vx5l+EN4MaAuRitLQ8OkTKxs/WCoAP4e+6nYX7We5YVdUeY8elFG15s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8X6uTknx1Ys9u7FaJ1Op1g21ear8IkobtikXnSpQihFraRs9u
	zmKJk6Hs/bP7EsTm9SppzRao+/llNpFwCr/QALo8ZRWFfINtvtkPRrJE2KkI7A==
X-Gm-Gg: ASbGnctPpbrLBGFGM3TuYrR5mKyS+XkDmcjDdm19mSLVoFDSogDz/aovM++Ful601Ve
	IZgoqRHjQS1C46aMvvfaHDVrTa/wBpsOAdPDjS3ahPtsPuzyO2fq+16ij7U09SmTgkM+Go6vvct
	onnBrTBH0wcAT06e1eOA0VEEeP5Uo9uDQcWpvORiF+NWsMG48xK0nXlzNmF8DIfPt5uzE1v5Z7+
	u/YJeLX+KqFaN7VQYUKa+EfXLaBNiwXnHwBluXhoIcpFDnnCgRSvmCdL0k1hF/Yl0o=
X-Google-Smtp-Source: AGHT+IGd3FfUImkbuTIHualSl03iWhPCsK272UsBzIXbKjGtmziydc6ISX0oPJIXEIB8DvlCJBFtQw==
X-Received: by 2002:a17:903:244d:b0:216:7175:41bd with SMTP id d9443c01a7336-21a83fb0b26mr432450835ad.39.1736962819934;
        Wed, 15 Jan 2025 09:40:19 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12eaadsm85327695ad.70.2025.01.15.09.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:40:16 -0800 (PST)
Date: Wed, 15 Jan 2025 23:10:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next v1] PCI: rockchip: Improve error handling in
 clock return value
Message-ID: <20250115174012.bdny6nxxr4tuzyis@thinkpad>
References: <20250106153041.55267-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106153041.55267-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_094020_679173_5BFB9450 
X-CRM114-Status: GOOD (  19.25  )
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

On Mon, Jan 06, 2025 at 09:00:38PM +0530, Anand Moon wrote:

Subject should include the word 'fix' not 'improve'

> Updates the error message to include the actual return value of

s/Updates/Update (imperative form)

> devm_clk_bulk_get_all, which provides more context for debugging
> and troubleshooting the root cause of clock retrieval failures.
> 

Btw, it is not just updating the error message, it also returns the actual error
code.

- Mani

> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index fea867c24f75..ca6163f9d2dd 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -99,7 +99,8 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
>  
>  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
>  	if (rockchip->num_clks < 0)
> -		return dev_err_probe(dev, err, "failed to get clocks\n");
> +		return dev_err_probe(dev, rockchip->num_clks,
> +				     "failed to get clocks\n");
>  
>  	return 0;
>  }
> -- 
> 2.47.1
> 

-- 
மணிவண்ணன் சதாசிவம்

