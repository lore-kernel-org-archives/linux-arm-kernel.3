Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD5BCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nzPUQ0/d41BabMrdFj7Ztc0g/CB1x+z2efsCXODZwQ=; b=xw+ToY3fYABk4M41v+N6o2XRFD
	7Zz45RWiO5ootpiJPNvrWJhqnFmXqwEtgsXSLeW+c9yhsh50oDb74a23RFL5FOmkNb4T5xEUbrrwS
	e+ZfDkKVRGsFMEpfitvRtlkYKEf4qA5TYDJCF8OX1jcyPR2t0u3uXGpfbFcDG65SnqZu9abAqP/Zg
	RounswhnPC/U69unO8tEOOD61Sen97MIztea4GTYI6KVMhkM8GX6mKISCHRiFmOa+2kUA2ZOQDeh6
	U5kaGmggfZ+tLnQhfkdFALl74w6Zpr9AzVcn7kkqiGn2ws5vcwdYcbVzECknHWP8z2GmGWVQMIhBk
	FMd19EkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHz8-00000009qXm-2Lyj;
	Tue, 19 Aug 2025 08:46:26 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHSE-00000009ltX-0QXv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:12:27 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so6815000a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755591144; x=1756195944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nzPUQ0/d41BabMrdFj7Ztc0g/CB1x+z2efsCXODZwQ=;
        b=aaXAdmbJ0YaAx3u59/TSksLD2vlQN0oKZELiYTVSVp/jKhCAxhGDDdTii40eZknbub
         hRRuGKb4RXi0mJkcaWTATYm/jOkXoCgRXRi8SqUMzBAn0+ZR+3t9dak3sXwNMqXMvAD0
         mrJX1uAg4MFOc17CkdDMPx8eeLnhLHSXg5MngBSRnwH8mT4797J9e6Y1u2Z7rYs5SdVf
         hs2LVQNyfCfzsin+j9nWis3fO8hQmHufTgUJ5MABQh82xKWPYJt/KTDZoO3/7yZjTI3I
         CapCsBoW9gdL/X1p/DGUTUSiQKfao1NhYZq4TMa2G4Njje8snRSPotcToK16p7/ok1CI
         cO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591144; x=1756195944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nzPUQ0/d41BabMrdFj7Ztc0g/CB1x+z2efsCXODZwQ=;
        b=nK5qHgInQg2QVi52tI8d80Z8q9RDJCfJlTXnnrT7mtNpPRWDlSR12t89G6U+V3jhSn
         Pn2nGvm0LIodZ9wY+COWgF+9uxwUph+eYYw/FziFnhxiSHPOQOyllqtZbGrNu8ndevlu
         xxXi7eDUq46O4xIsAPloQe6Bh3vvhvb/c79Se3QCGX7b3Cy3k67J51L3r9hraL21wDRm
         YfJALTxj+MAgHBRMfDRITZk7HG4e+N7kmqql6TaR+XnYdnQOWMx8/wuqur2EF10o+R5T
         GGxKAqHpegrdF2tAi8iibJgtY3xOMI17LM89SgG3mrteO9ZNEhEGkdsd4CActh7IFM2O
         bnqg==
X-Forwarded-Encrypted: i=1; AJvYcCXd04VIhmoiRJN/m0r+dQxlVX4LdetkMvXTs18Gc+rav9kI5iRNocdJejhQClbRNu6gLbrxhbuPHJrGhHVu9Ai6@lists.infradead.org
X-Gm-Message-State: AOJu0YzfgbYQTHgYvn4nmq2/SwtiK0hN0di+hWT9XMh3yjy4th3Edou5
	KHb4bo7bwO3FWo/5mdarmNGECdllbstfYDlvMxQEL14rUvnxulUzL6PjflCYXyxjdFArZe0XqPv
	fItFRLJ4Prw==
X-Gm-Gg: ASbGnctcQ0ZQ9S8YLgDAhY/E8yx1pAtemDcM9V1AjXPiWoFa8jlt1Er+N7tYSfbn5jl
	vk5irO5FQjNRBml9gI2Q/muVxBYP0jCvyO6y7c5oxSXXIvbou4KbzrbyHhcPmr52xz6Ih1wbG9n
	91pjMFwUlyLCEYJdayq8Vj1ENv+VvWdSvBrVVM1ra4v+WnlIy+/B7ogVk33L+Hc0EMzf5yz+3OY
	6Fwe7ELGT7EmoR4FP/VMzrOS4QbXKltsFu7Xsfv9FzwHX8Q8iGvRJW7RNBbAw34jL6o9VMVVHJh
	k/697yu5yPE/z/icQzEiiexnYQ9cODYdZjsEzq9AyjeDZYxAESEyqTgpRBRIqhZBdCDxeqj9jmR
	mzrcK36AStDBiILl8lcK+zAln1hQ/ducRRWirxZxSvAjSYtya0WyKfuEKlaWIPiCUiSZDrbM=
X-Google-Smtp-Source: AGHT+IFWUFHoGU/t7RtStcFRX+OfWnQMuoPAH5EIGoxs7IRL94PQgOjPHffK157QAOTE9MTriRH+/w==
X-Received: by 2002:a17:907:6e89:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-afddd0b555cmr143308466b.35.1755591143820;
        Tue, 19 Aug 2025 01:12:23 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm949783566b.88.2025.08.19.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:12:23 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 19 Aug 2025 10:14:14 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKQyViTbXAsFEuT7@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_011226_142097_0A4DD1EB 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Stanimir,

On 10:40 Tue 19 Aug     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 8/11/25 5:46 PM, Andrea della Porta wrote:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> > 
> > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> > 
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pinctrl/bcm/Kconfig           |   13 +
> >  drivers/pinctrl/bcm/Makefile          |    1 +
> >  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
> >  3 files changed, 1211 insertions(+)
> >  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> > 
> 
> <snip>
> 
> > +static int brcmstb_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	const struct brcmstb_pdata *pdata;
> > +	const struct of_device_id *match;
> > +	struct brcmstb_pinctrl *pc;
> > +	const char **names;
> > +	int num_pins, i;
> > +
> > +	match = of_match_node(brcmstb_pinctrl_match, np);
> 
> The 'match' variable is needless, you can drop it.

you mean something like this?

pdata = of_match_node(brcmstb_pinctrl_match, np)->data;

I thought that kind of compact code was not really the way to go,
at least taking a look at other driver exmaples: there's only one
avoiding the intermediate variable and many others using it (although
in some cases they also check for null, so in that case is fully
justified). Anyway, I've no preference on that so I can proceed with
your suggestion, unless anyone has something against it.

Many thanks,
Andrea

> 
> > +	pdata = match->data;
> > +
> 
> <snip>
> 
> ~Stan
> 

