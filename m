Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA960D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmlE3ocaQwI744iyoEKb0Mlm8+PfDOrWjfONTieFefw=; b=0z7DMq59yc6hwuvihdMsq3DExM
	MS04OwytCRi3WLhGsePoI7mhn6CplFkVOmPZHVI1lvrst5XBnPlJLV61g1BarfJna2fra3zurQW15
	8zi7SxYciSB6YBFBVIRdvJeuzH3F+JTyrLGtePih7VjTnJRlHydNkNQqIuprTuy7tdkzH+/UM0ed/
	vzvd43s1eaWIQuNWno2DRXXxql2nSc0CmW0A369unvj+s/44r2z5nly7QHp0myIhO2D1xxU7Z3nT2
	ipeq3xh0hU1i0c16UlNoEyo3xPdtAzAEDmmXOTg4GqEL2ilX7XegWiHSLpPJaKudISCcAHi29Jedl
	w+WJ67+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvue-00000004bdT-2IR9;
	Tue, 12 Nov 2024 18:46:52 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvs0-00000004b4w-3rm3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:10 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6e377e4aea3so48044107b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437047; x=1732041847; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmlE3ocaQwI744iyoEKb0Mlm8+PfDOrWjfONTieFefw=;
        b=OrQQXbobbfe4MJY6VdeXtRoT/jPRZRMp0h8vQKsQ+cawV9OqvgMDfrVXzin35TZemz
         dK+qKqVMjpBIxC91zX4Uf81EuX/k2+OiEueOOsI75qVSJbAbuFdsZTieU1M+cHD44MNu
         ZG32gB3z1XQ8w66f/eYEG3Vsqgh8iWnYHSVT1F3cniPwxO/IQIQJzyGAFzrBPX81fJ1X
         h8fAHdk0etnisaarYyuf9CJ/4KL4aGgUQDt65KVeMSFs/3O6C80I5N935A61NfoEutV8
         ntvhmSw139C5fmBiocHJZixneJIPzQn9n3gMz2WiSjXC2l48U3dMMszQwdKrbE9p7LgJ
         dmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437047; x=1732041847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmlE3ocaQwI744iyoEKb0Mlm8+PfDOrWjfONTieFefw=;
        b=Dgk+PkTy3Py7sKs/gM4+H1cnUfzciHcVOd0lZMbuIjWn2otbTXimM2EygEP1YFc0c0
         sItmUR+3lHObyyLBMC73WgjG3U30eUpX5P4KzsFakloE8FgmtOzedgQnwQTXDKYSbdfh
         oUxzg5YhgMQLkT5QuQLpNuTCK4ET/kMEqqvSs0V63qA3LtK/bxJbzFs23fQwKcepBVQU
         IgAxdrC6ONMEfpUzHVdjZH/6jJe3v405T5/G3xAdxRHvaarS7sXczWni6QTiVMQdzwkf
         PR8ne88wSRoNsyyafM8cnrqk50Tbao7OguW7sROJkbQg74F+NbDMmbI2iWe13+MGqRdH
         W1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWMiLiFTrc7Y35QbdXRfju5mzvAQPCNj0fFEt1K01WADMaDetX6OSVJ7/33luHBE+aI6f08Ts913mtssjO4SPVp@lists.infradead.org
X-Gm-Message-State: AOJu0YwDx8TpaM4Xx7Pqo4jtSVh73aX6GXUP/0OwGSzPCakzVrsuXoqR
	EsTVTOIy3pwBKwt6pYrCXn6buvOjpB+k8Ovyh6aP0VhME7UW3TZk5CXryL1SVDpBFg9TGF8dnse
	qWEd/uY4rhzq1GBug6vL2HrAAKrQCjChbNVa0fg==
X-Google-Smtp-Source: AGHT+IFh1YSNqJrUyWFeYrySj4puHrtEywEG7OT7qiq8/ABi/USrmbl/pgQBx5lmlFIuZUP2a34Q11eyh0jgarstWi0=
X-Received: by 2002:a05:690c:998b:b0:6e3:3508:e32e with SMTP id
 00721157ae682-6eaddfb97a5mr155863057b3.41.1731437047401; Tue, 12 Nov 2024
 10:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
In-Reply-To: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:31 +0100
Message-ID: <CAPDyKFq9uQcDsMpYXKe=8f7AGybZaUsvMVU9RDxv2SZpYwbdgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: host: sdhci-esdhc-imx: implement emmc
 hardware reset
To: Josua Mayer <josua@solid-run.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104408_984527_63E55EC7 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, 1 Nov 2024 at 12:42, Josua Mayer <josua@solid-run.com> wrote:
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v3:
> - reused existing control register definition from sdhci-esdhc.h
>   (Reported-by: Bough Chen <haibo.chen@nxp.com>)
> - placed both control register mask definitions next to each other
> - fixed timeout write register name
> - Link to v2: https://lore.kernel.org/r/20241030-imx-emmc-reset-v2-0-b3a823393974@solid-run.com
>
> Changes in v2:
> - replaced udelay with usleep_range
>   (Reported-by: Adrian Hunter <adrian.hunter@intel.com>)
> - added comments for delay values
>   (Reported-by: Peng Fan <peng.fan@nxp.com>)
> - delay values based on JEDEC Standard No. 84-B51, 6.15.10 H/W Reset Operation,
>   on page 159
>   (Thanks to Bough Chen <haibo.chen@nxp.com>)
> - added a second patch demonstrating a cosmetic issue revealed by first
>   patch - it bothered me during development but is not important
> - Link to v1: https://lore.kernel.org/r/20241027-imx-emmc-reset-v1-1-d5d0c672864a@solid-run.com
>
> ---
> Josua Mayer (2):
>       mmc: host: sdhci-esdhc-imx: implement emmc hardware reset
>       mmc: host: sdhci-esdhc-imx: update esdhc sysctl dtocv bitmask
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)


The series applied for next, thanks!

Kind regards
Uffe

