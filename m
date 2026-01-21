Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56679C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=; b=LXEqzmvKLBy7b/3kBF18EOgOGd
	JxAzhNz0SLYeDZMyIB8pkFsjoDQPjqLRY9f9whffaxAJpZ0beJbLLXisG1oq0Z64Ozms1pfpgsGAy
	j987V5BDUP9J2xUFO0RuNNIAeUWh3d7HoCnDW2tdVc61ZtactkatEyAbAk5nc6S5yikpTBZl4xt5L
	KwjUdl9abGWI/8TwUj61fvgcCroxfVQ1+sgtLxk6LLBAl2rxhljAJOHIFX9rhUjwa/v4bpNS+swB4
	Igc1ILP2eo2GWLwhtcU9gEMVO47RYNWgu8IN/9gSaRrRxeeYIOvOQfOBi+7Fgwb309PIrsTlPPn7A
	T9OONLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihHH-0000000695N-12s8;
	Wed, 21 Jan 2026 23:06:19 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihHE-0000000694L-3w5X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 23:06:18 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5f1b9fe06b8so321969137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 15:06:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769036775; cv=none;
        d=google.com; s=arc-20240605;
        b=Ydlw81WqHmbGg641gYHb16VPkoteYk3R4J5PDFCvP4/DxaTM3pmlcso0oufNEGsGfC
         oS5sCjxzNYJf+AVlziG5ybnj/JE9KCCs21heLy15CR3msJOhrS3M0ucvQIr5rH7eHphA
         1vGP8WHNwfwzh/vjQWg8tfAH2Is0nmcatfyE5LghDs8NESMGjQPVoU3zUwjeimquSc+P
         iP351cXOKXNez4r5YPOPMvUCWjhGHRaWPyiIyVarBQMEL5W5p8rEq+uEy7OUsMc+1Nrj
         edDlKbJiAjke1biiFvMKQ7aG81hyHA3aMejPotdgEg8J/QtXOdq5OJ2j6t5U0Fnf8K9S
         VtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        fh=Y8p+8IidUXyeK13t7JbZ0rGhO4BMBAbhqSMQqM84DAQ=;
        b=ZtF5XjaK3UNeXeGOgqc/umeEF8us7l4bhzG/H/pFSx/tDQKd7S/Y0U/tCAVcQCebTM
         DHnM2Q+E5ZxguEULGBJb/wc7z5/V2ekX+ozjIDUac9mwx17FwU1NFYT8NksEkG1x5pj4
         ue9T5iH4R6/te0LhgWZ1mvnFYlscOL8RhPbSNW9KkwLZ4Swgsow6brU8Z97GuqiQLn8m
         mXeGnI6xe4YAj8xRE03u3+lqxUrhyGly9iLgCeywRLkpbCBCb1sJfoGDEsytOzBJ68JE
         anLcYVSJkCDsqBJUWpXAD3UyoDINKNuZdOoEGYXiiuNrCUj3h/xd7QSnjMxNbBjwfhmS
         875Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769036775; x=1769641575; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        b=Dx4S+xCThGmdXjb30QwAxPjEgFVWNJ3wAqTLcnIj9p4Sk6oFpslR+2MtTSo7JvJm8O
         4QnnYl1qJ5TIKc0ertIykyWQjMH/i9GFG/V88E+H7ublPXWYTiQgod4ckIIgSYTrQ2b5
         UZBinSSpy2gl2oNIwDClbrmvEOkHTWoH0qt/PtDLDovhZJe/aaHjbP8y38MuVxHHuQNL
         HVsjxxehJ3DZxXeOVnynxozK0GOOJqprwJ/2LBWXarxlOrbms5Z57nUTmHpkrOQxZsVM
         ZzIqm/109wwtm656K6eZlaLa24FtFB9fTHMxJBNICm8AUmR2TG2sUo21tmQC5EYWmVc2
         B25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036775; x=1769641575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCZIOzDe3Q3k/SrYrYvkP+nvqTXceKLMx7SE81CvD3A=;
        b=YjwIdSQfiId9bjvcGMbon0YdNZRnhJzIBGmIzzn0W0KFoeiugB4RNYTAjNSyh7vW3X
         WSbmsLThFJaV2RA/L7j7gmG1MwY9jPRWXawRjpI51Bs9RqwxR/2LQkPN7YYiLuDJ0dee
         rYfELhHhyBaEZuYWttvBi12VzPD+jjhoPh7rMohyxSSCtehwXcs+Dd8/LdbCm7/IOBzV
         nUS5jJ58W4zkmHqUI7ZoJ6LJF2EF0a2kDlB9GbpQ8ZuBFOIRNJcIXMs8MAzjRT3s0ckD
         ry62R5UJeFVAor1Ov9kgh99qcJ3n9BLwtnYe1a3zlluyGL7f5EpOL1Gs648QD1njIP1v
         IMJA==
X-Forwarded-Encrypted: i=1; AJvYcCVWt4mbGUjIrRNYPnBtlJmZp+xCV/NcuazV3WpXfIleG6MI1z/TuSk4ioHMv01L+cd/LSsxOinQNw0nsNdjW7SC@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfLYQUxoHOHOjd8dzqJuvbjR/PMwANfLRYJ0y4/LxlHwWtQ4C
	563+m0mvJqxwKDI+ejO0CEVW+dxXQvp7GOyHwNWB4HNWZdFwBS/ACE71YrzpIuc4uBrrQ5T+tSt
	DPQLEmaljUvPlO4d8g4D1kYiOMbUrT8umHhTReLRTlw==
X-Gm-Gg: AZuq6aLoV+kZa+kYwvio9vMiI9Ee+UcP8PhdHg0TosVspIxRWqNKuxl+9K3tPl0v7Pe
	4dW9f1H0il9gd8uZcbFRc51cOarcNW4bDzcbIi5HGLdzG2EFUFf35OtfYv6Y1atsL9AkMd7GSkV
	p4oe7/c7stytO0Rmyvnclc3DB1XOhjSjam9JLP5y9eNLEJ+0NJErEUu+t8nrzW+y+3bpgbQBJWK
	MdG1quaSsNAzJnduzSwejhTtviLNt0Dg8bA6AMsMNZjcf62ldMCi1/zyYkhKsAUoqAvrtBJoqJ/
	RiuAxh0c6bQD+ggTUhU+XHs6rCWY4g==
X-Received: by 2002:a05:6102:5094:b0:5df:c33d:6e3f with SMTP id
 ada2fe7eead31-5f50a859a68mr2453508137.13.1769036775040; Wed, 21 Jan 2026
 15:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com>
In-Reply-To: <20260121-next-v1-1-c18068b091b9@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 21 Jan 2026 23:06:02 +0000
X-Gm-Features: AZwV_Qg1KISvM-ClVEpBsc4G9GUZQ6ApbOpoJthKvEVHb234AdgfKajgJQDM_Oo
Message-ID: <CADrjBPqj=j84PHf3HYR8dtxDkAVRC=2tBdTQvZaq4wHY05_M6A@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_150616_994260_1985F959 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, 21 Jan 2026 at 22:21, Roy Luo <royluo@google.com> wrote:
>
> The Google Tensor USB PHY driver uses the Type-C switch framework to
> handle orientation changes. However, the Kconfig did not specify a
> dependency on the TYPEC framework, leading to undefined reference
> errors when building for architectures or configurations where
> CONFIG_TYPEC is disabled or configured as a module.
>
> Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> required symbols are available during linking.
>
> Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@intel.com/
> Signed-off-by: Roy Luo <royluo@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


>  drivers/phy/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3e52d4a57b26a62d8d 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
>
>  config PHY_GOOGLE_USB
>         tristate "Google Tensor SoC USB PHY driver"
> +       depends on TYPEC
>         select GENERIC_PHY
>         help
>           Enable support for the USB PHY on Google Tensor SoCs, starting with
>
> ---
> base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
> change-id: 20260121-next-b949189cacf4
>
> Best regards,
> --
> Roy Luo <royluo@google.com>
>

