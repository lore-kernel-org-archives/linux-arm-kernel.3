Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50C8CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=; b=OWFT64CMPcA9FCvxIe14NdDPsJ
	Vkfc+/73OwSMnwZW87ZiCh/JtwXtu3DxapEckbbsk+Yib7aYccg3/Pz77MOd1O9ebLtSrWNJ9M7+b
	eU86y/SBI2DmBeijO4yDGGtXKcQQbvmaXMCDSeX8W6VkS44Tjp40aTkOqoHBQyEuW0cWV5Ub3UGXI
	A4kpor6aao+IPHu8raRFG+MFj7xsLzriPwvv1z7Ac2Ef8VqBVQh47O8wby2MhpmQeE5dScqalHCRo
	UyE52bWiaf1qtkLIQltCid+K1BJJyftCwGkatVAzccDvdPHvhcVlRWWB3ibNwaL+GUrrIqqTzPVha
	2hgPAdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa13-0000000C4YY-3T3E;
	Mon, 24 Nov 2025 17:06:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa11-0000000C4Y1-2sVd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:06:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-297ef378069so41445865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764003975; x=1764608775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=vXVG5JMBMegnB7z6reazZhTdgukZSaezt6JsQp5uSNXcnv44ob5q6Lsw0aOseT57Ke
         SDTZ4IDtwoacH9fbHnWTrpMg8LgrszT22xTTCvoIfnHNiXE6JiAREGCvVVfHj2+mNlbD
         2zgXujrlBuuEtnV85Jy/b1T2S4t7aHu53nc6DBv5IWUpN+C04tCTV/IwXAn+8d1ttvq7
         zGdDZqjGoFL+4DMswnYU+MrCmvo9JPsJssceZO+c7FoeaQcydD6fpNVupwUBGm3ySryt
         0wCF17JUaGoY1FmRA55tBFTcdqmkEfbSGt4ZZWFlPDzXyH/rtAIi2fzZGtrcxGVsJAD9
         VOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003975; x=1764608775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=WqxOP7O2+52r7Jscaw159IMk3EDCEAKrwd2fRVzUftCRea5gjSDB7hjYb6geCK49qU
         /0QLxD3pm0kfUhlvJypiDpYJ5tOzxB/5T3A+UDo4Xd2jpxhy0NczjI68/u69yMiK+GVS
         20WZ5zTO9u7gQjL8XewbbB7v/c5KZrc3fg0KRrxjBziyilHSlZJwh2bkLHqSkhOBCfqg
         1/I24DsDnwL5IqtzqGz3DOqCtCXpSlV/auZ6fj282yVcGLxswP7OQQADOXn0ZkzNqrO4
         pf1iDudsdmK1n7wtMX1i2gLbdzsz037xRt5pDtYEssYrewL5zqPfvU84cyml5mtMFIrg
         RhRA==
X-Forwarded-Encrypted: i=1; AJvYcCVgdJTSenSuCmE0xWq2q/yzOAVt4fvpJY8g9otLc2kHXj3IFo1ENcmwaWHIo2b2/QgkpchOf1GWp0QC74jNEmpj@lists.infradead.org
X-Gm-Message-State: AOJu0Yws8bMlnEOpPu94CoJkN1qdFAQWQfHOSocaD7oWn5MIson/7EEm
	5uRiMxEhAkKH9vzdC3ss6bj3lJfTRsMOyPQ0t8h4GZFVrpXqzLg/69igrM2kv8xLBUY=
X-Gm-Gg: ASbGnctNRBtFohr99hn2xH8kUNFjv+gqgjEwiJEFnJPgpTdexryOTuPe9a3+ZLlMTuK
	g3QmBODBU+g6Z57oJ6KoRsym+Bx7XxFUwHD55h2Nv21T8m9W8I6csaaNm6gj3I/izs58X3/l1D5
	hev9VEb7GYXoNfJvxC3THj3WCvEejLqljaAMlSft0Yzs3oDe0unmZXC6YP89QYZt7FoLFnyrhIP
	qqTPZ7IXGF2heO8xRlTFzl1K1D3MrauCkO/mWLoQRtLrdhrUNq0fjcmdfCln7XVmRQFwEq+Ceeq
	inuobEjcUTSsiM8ewy8qQYGeACGT+9NZFM1W5JvYTEyhoSCa2Z0N5Q55nGKAzdpknSj5oY/XaP4
	y94SRkb8gh1vLRtC5vRV+Uy6BX4IakSzF1mGDMcbQA2fRE6YM99vciberMIf+QXRL+h2y33uj2U
	YzCgsfa+EFRd3Torq86DABUXIX
X-Google-Smtp-Source: AGHT+IFFll1ZBv/7+NTNtf66eRKGB3OEh6EXFU3EYSb6koOyW950nZNuI/PfU8U/2nZsnDgImLDneQ==
X-Received: by 2002:a17:903:384c:b0:27c:56af:88ea with SMTP id d9443c01a7336-29b6bfa1f66mr134598965ad.60.1764003974768;
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aebb:f23e:8a7c:d95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13965csm142296595ad.30.2025.11.24.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Date: Mon, 24 Nov 2025 10:06:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aSSQg22Kt-565T8S@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_090615_730002_6AB71FA4 
X-CRM114-Status: GOOD (  19.68  )
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

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)

I started reviewing this set.  Given the size and amount of comments to go
through, it will likely take me several days.  I will tell you when I am done.

Even at this early stage of review on my side, I can already confirm the only
way to move forward with this set is by reaching a consensus that includes
Andrew, Arneaud and Linus W.

Thanks,
Mathieu

>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> --
> 2.43.0
> 

