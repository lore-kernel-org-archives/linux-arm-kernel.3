Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC2DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=; b=XdreSjQ4yV2M9Hi5+Oep22Ip0p
	7rv2lnawCbbI8jSJMwNOzNTg/keUbbStbjfcgqdOwv+3yFJtv6GHCnEmWsut31Mn6VvM6s5oGcM+e
	ePsVi2OT3lAExcx5SYUFHtiuS7uBknVfowN4gNVh4zkAQmnhAyqgAURNNdYUr71y+FU+oBSj39/1F
	NfJ3erREEqh9KUfNkUQNe4N7IRaw3UAkmf+5DLEpmZ2tP68BKV74bTaAlLPwtQTWMLDDjMJni5+7N
	miLfWe3EBfTll2MyKozdQeRIkA3eKtgWtzk01ikXoMvt4WnN90zMZCru9JqCBTE5E4utdoHskgeDe
	sXtRpmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40nS-0000000HPgL-2ZbM;
	Sun, 13 Apr 2025 17:07:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40kq-0000000HPR5-0NBn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:04:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3342492b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563863; x=1745168663; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=mUxGpFwJ0MLTUrMVarA6FxNCRhbuqKvcb31+k8uzUYTpcYOpG4de7D4GBjaLLESkmx
         tCXlxLaGxSVhHm90htSbA6nqZyFsEuRKoNNd20opLtx/+wSEuOz0y1NxbJkiO4ZETaYE
         mj0dj8eyhDevpUWuQ9tjrksxjGKSGvhFuEwMyz7D5qCgKfXwUAXsl/xCz08/vuH1xjfv
         nh5KF1769j/aqa6EEw1+XN7casjJfXrtdhkF8d/EDArxMpLdxSRR7ahNkL4geu8f6Qx3
         XWayNXdGclh77a8FO5xZXTc9c/v2Wi7TOIUphFXWWMVHnTYmzUNclj1rJOxEzokyzQwb
         LaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563863; x=1745168663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=Lna8blV60RgA3NJb1duYL9mQu3v/IsqzrYFztAOO7lLo/wT+JzsDSEUQMDKkuLeuWY
         EfQlSUyylM85i8DoM1jUtECl9VNIb/cnQZoO60KP+LriYTXODPBI7w3yXeCTbuqI5xnq
         x7bUkedvp8sijCXBaACI33/cBEIV5HA/GBDKibn6EzFTqGudZDK4O3zwuJ59dDev+Sdz
         IFnB8IbvVdYMoR7Kx9gV8mBc4ELqmNFASNEgPt27CObXhgSwTyViRXlmggjp8Lv5EbGM
         vtKC3QsN+plh2noOLuIk1sS/E41fBuIsES6BXazhX6KFuxaqqnKR8DJ491IR/rIiAp1z
         Ej8Q==
X-Gm-Message-State: AOJu0YzyEtRs4Bbmem+W4FhN5H0LajaYKV77GqvDAx5SLXCbKl0eIcct
	fa5bMVpMzsFo+6A5U4Ah3A4ybadOPAT7tYkPKEx1MVaQDd0gT0j/yYFLk6SOug==
X-Gm-Gg: ASbGncsrTZvbsbH+T0gXJ89rt8DIl+7VHCaZk8dZZxE4mc4z2U4EHaZRm/+PaKvd37U
	Ov4/yAKioAnQEW+vazqWEtn86DoljQkY4c2jzDwt0ssJxsWNcsrR51AL2MKUuhBd8Lj/Kt82zJc
	+txbEWQt/5BUWZIIyhnIwB4giIUa/bzOIMEQudTT1HOjzSACzTv4oj6pMzgNnYIjEeHBhf35Y+i
	MTIi7zDtXbLjUteMw4i/FGb0cBghMhmRITK5ERYkdBgOAcyPqXucfXSuGAvR5wckeL5bep06D4P
	mwap9d0QmwV/bCaHbLWfT7aQrvg9en9+FKGWAADU8rTMYfrnFrte
X-Google-Smtp-Source: AGHT+IFjyC9Nav51W8D+xJs56DEyrXe47gAj9cOlUzK/cynD/DwixHK7w/Y7LX+u7QpqEKkPzlHNBw==
X-Received: by 2002:a05:6a21:c8c:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2017999735fmr16680739637.40.1744563863083;
        Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199535sm5339872b3a.14.2025.04.13.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:04:22 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:34:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 04/13] PCI: ecam: Allow cfg->priv to be pre-populated
 from the root port device
Message-ID: <5nwjlpnpwh4yto6wi4nxcwumpd7iilpq4mblpfqsvdxg2bfdsy@md6ok4btonxz>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_100424_131881_47988104 
X-CRM114-Status: GOOD (  20.14  )
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

On Tue, Apr 01, 2025 at 10:17:04AM +0100, Marc Zyngier wrote:
> In order to decouple ecam config space creation from probing via
> pci_host_common_probe(), allow the private pointer to be populated
> via the device drvdata pointer.
> 
> Crucially, this is set before calling ops->init(), allowing that
> particular callback to have access to probe data.
> 
> This should have no impact on existing code which ignores the
> current value of cfg->priv.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/ecam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
> index 260b7de2dbd57..2c5e6446e00ee 100644
> --- a/drivers/pci/ecam.c
> +++ b/drivers/pci/ecam.c
> @@ -84,6 +84,8 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
>  			goto err_exit_iomap;
>  	}
>  
> +	cfg->priv = dev_get_drvdata(dev);
> +
>  	if (ops->init) {
>  		err = ops->init(cfg);
>  		if (err)
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

