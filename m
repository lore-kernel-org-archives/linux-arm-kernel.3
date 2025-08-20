Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C81DCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=; b=Omi0c5fSq5i0sCvj5WtgrrcG46
	KqhigH44BGeurGNOiOD1Y9lXDjvQuGOPqKsyLcv0ezfIs5BEq6NHjiC1R6KUWFE770O+7/d9QTHXW
	dpAbGt/VwpcwexonhEGX+2qt1GlU9mhvhQa/kEmw3S/JtL8OIY4bG8Q3GFWSLvciQIlXwCUmS6bBZ
	Y/n2auep4TniZ8E8B+3bSB5CIHCzucCoYuzSMqDL3Pit53pJTczroeyuNZSjPMpv7YfWeton4WtoL
	1h/8O6Vj4QRs8smUUtN6IRJPp0Fvv/m4jIG6I9LjRMO47fmrddBv48gw7MeFGkS1oHleTRARWmQre
	RLJ0u9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7S-0000000FdU1-2W2x;
	Thu, 21 Aug 2025 03:37:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkL-0000000Errh-3KW2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 20:49:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so346106b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755722964; x=1756327764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=XcFWXHnf74R/QNh4R7T0JseqYoIUxVQ9UdCC3M4Zw5Z7bC/xhVwAALwHulEYalkICF
         a9TZQUfmsBs93fauGfN2G7dhrzfz/YMrVGZoByQp/TupxDe3DkWgoAEh10zXWplc/7HH
         /Hoh2Dq6XOwnUlzEwMW0m/Td9kH8x/qGWWXRtG4jxZyXfZYfDGKafbQo0F+idnFgcZdV
         rEDv8kHuAvlkT1CZP+tERgWUKI2HZOvbG3jXUW51TtVYUmzYKOeXTaj23G4yYCn19eOn
         Hzj8vln4oAIQxctysGo47OA7QaIqdijMIDIrp491WdBZv3jYPAnfGNIMhsEXwg/5uF9/
         so9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722964; x=1756327764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=nKQIdhBplqXkEYYv0UFCA4VX6NqnR88DNAlCFodYNzXjRMzBUf8tmMWftyZwfkdqzF
         1sL99fDqiThwXXsRlJQDNkV6yo3UQ6viZ4np8BdVcxj7lZpykjD8hVd/qFhPFlnipyIf
         94BahzOcCo5chVq+QQ5FuROOppJ/XTgGkT3CAhau7CUE1XXWwH828RYTpV4D85Kfu8NA
         d8J7OKyg++XPjCCEQFWt450REVLR6N7Ntudc6AYWjE4vXekqxrIOgE/SJ2UgBpCHw1IH
         j4EiQbpAM71zaFAuUIG+p6mPVFI9kOUVUmd1Rfh29ZwvZXl7JUHByZGf5qYhbIOBh6BP
         TjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw/ki1OKKIiHkRwlHNP9xMvUpCyouRuJNo+LoctCRB9SkvmjYD+jj/BBAjRLZMf2Mc2YaetQ/cl2aMB3QNvK8I@lists.infradead.org
X-Gm-Message-State: AOJu0YzOFnuOTxZ/HezHML3Nwi0d2PpkuQMppmFCbXEOs7jzsY3wpyJX
	DzfvtQpt4UyI5pxf977ADxJK99mGWFgMShVaIsI4/mVlNH02edO2No8xr5s/S9zM38c=
X-Gm-Gg: ASbGnct8dEgbd2+ohoks2yk0ujOmAayeGheqBF1+PMEzDgE3O5dL6ea8oK0l5P21ThR
	jvZ73tPh8H5Kezj5yF/Y67j2lJKmn325ODmoHOM52uQZ12eCROyNAUKEhYANq80+VCYJy5UmU/J
	afvD0wHbjsUWZLwPeWkF3ngMXmlqo9X3V32pZPxpanm1snB3lkko6FhW1wygsRTuyp20buC5vYB
	lVGQeCjytGN0O5LsXXbI0f6s2bY6qKueccA/B0cQqHCz9H7GSuZFsMO/WMMAQ4wsYcRtKajaNWD
	QWbR5sQzUoPshhbSv64hHdXIac4et0OevyeqnW/8eBuILAIBixUP1b6vBm1PD/gueCjJiECa3Fn
	a2CUFE/wxk8z3ZjiK0Giq3IWJug==
X-Google-Smtp-Source: AGHT+IGhgPqqfmRMNGx86fAr6FlVuQIPW8YOrUg5lPs2NO14D0x2SMo+UNh8zB+5H+CHAosyVL/RUA==
X-Received: by 2002:a05:6a20:3ca8:b0:23d:7a30:a82d with SMTP id adf61e73a8af0-2432c196a3cmr1194253637.5.1755722964369;
        Wed, 20 Aug 2025 13:49:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed3c:56fb:c00a:205e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1522sm6263547b3a.18.2025.08.20.13.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:49:23 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:49:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aKY00cmV0NnOlAmx@p14s>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_134925_837748_560B0757 
X-CRM114-Status: GOOD (  14.83  )
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

Did you send me a patchset that doesn't clear checkpatch.pl?

On Mon, Aug 18, 2025 at 03:44:16PM -0500, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> The expected DTS layout structure is following:
> 
>     cm33: remoteproc-cm33 {
>              compatible = "fsl,imx8ulp-cm33";
> 
>              rpmsg {
>                      rpmsg-io-channel {
>                              gpio@0 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <0>;
>                              };
> 
>                              gpio@1 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <1>;
>                              };
> 
>                              ...
>                      };
> 
>                      rpmsg-i2c-channel {
>                              i2c@0 {
>                                      compatible = "fsl,imx-rpmsg-i2c";
>                                      reg = <0>;
>                              };
>                      };
> 
>                      ...
>              };
>      };
> 
> 
> Shenwei Wang (4):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  11 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 559 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 125 ++++
>  include/linux/imx_rpmsg.h                     |  55 ++
>  7 files changed, 895 insertions(+)
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/imx_rpmsg.h
> 
> --
> 2.43.0
> 

