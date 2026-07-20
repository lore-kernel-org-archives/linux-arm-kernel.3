Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23799C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q88Fl0V/0lAk/+TEzcTUp/7qPfUq146zXnUT1jSEMMg=; b=Xh4eyqd5tVFFie
	hIF5Df5/3mxqW1ypQccmg1CqNCO7vvoWzN7BB1Cyu5ikVcOFJxCSKjndSTQPFN6AaAzXqJhzp1yKo
	E/xlJayNkjPKLmGn6OfAw04G3sK6OdXnCWYKdN5qVOxP4MtWdAjcVPE3DabqQTAUPDF8GIufMj7il
	6z+IEyFTGNIKQS0Tz0ZwyxYWNZ3c56LPpHQUt+nMemjWoNKngYv/9kf/lMxOEraPj6x7TKZMdcNUJ
	yyfK8r2gO4e+aj9KCWScpJ/cj0ea2k0JhdgfS8i51zn7ekrsYvOBqIdUwIxhoaY9MSWq25P3vEWeB
	bkwAykqnk6Nd+0+lwrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNd-000000072ec-0lFx;
	Mon, 20 Jul 2026 14:54:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNc-000000072eE-1dy3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AEA443FEE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C531F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559244;
	bh=q88Fl0V/0lAk/+TEzcTUp/7qPfUq146zXnUT1jSEMMg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IYxPWK1rXxXdN5Fa0G5McnH/9BE30oH78m16049eaWAiGZ8KFbBDN/sHiRVE1A7Zv
	 eFRGTduevMm6chvQmkSybIEz2N24pDqIi6vN29/+4Ja9MOALWqfDeAhRIHhc/SARFc
	 WH4OIKCLUdaQZ5Kp724oR1HLazIfLgCtnIAki7qvaiZpwMv9uVyuvZtDBobdpVH/41
	 /mg3Q8+PKK5dbkke3ea7NtAkjnECokiBTTKva0nHE20cTX2FLTLulBNtLoxTzYJzsi
	 7qwK0tduSA9PqHlWZ/gxQ/0Cw9ujsL3VIWdBRdUmH2k2EOQrwPL0jm3F5nLJ0vjxeI
	 9W36YSXCxjo4w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c7fd45465so83882741fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+PhL1220q2tXy9A+CJF1H+FsToiVJ08cXfMFUqIIS4xsYEZ0VFodf090ySSFu1NW4tAbVCnHfGEfIvWrSDNwd@lists.infradead.org
X-Gm-Message-State: AOJu0YyqthOaDGkcsCVcAcWkCtrvRHkIjlxp0E9QdYWDgBnH0jBjuDW2
	GsDqaiW24PkvmYcvsMhWm3Ltbz8tGPDgF/v7c6Pj41yJaWPFyM5nVFETUiDXIBzniq7TYLOYNVz
	6sg/6OIkcQ78Mw4gLn/+HOZT4tC4c7c0=
X-Received: by 2002:a2e:a902:0:b0:39a:fd6e:cac6 with SMTP id
 38308e7fff4ca-39eb2891a7emr29265181fa.25.1784559242360; Mon, 20 Jul 2026
 07:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260716025215.33592-1-panchuang@vivo.com>
In-Reply-To: <20260716025215.33592-1-panchuang@vivo.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:53:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
X-Gm-Features: AUfX_myDUKvf94v6L6ujyRnopyyEs37-MefKzA-7jWlx7IViNmraOkkn3GoqGCQ
Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:MAILBOX ARM MHUv3" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:RISC-V MICROCHIP SUPPORT" <linux-riscv@lists.infradead.org>, 
	"open list:QUALCOMM CPUCP MAILBOX DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2026 at 10:52=E2=80=AFAM Pan Chuang <panchuang@vivo.com> wr=
ote:
>
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq(=
)
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/mailbox/arm_mhu_db.c               |  1 -
>  drivers/mailbox/arm_mhuv2.c                |  9 ++-------
>  drivers/mailbox/arm_mhuv3.c                |  5 ++---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c |  4 +---
>  drivers/mailbox/bcm-pdc-mailbox.c          |  5 +----
>  drivers/mailbox/bcm2835-mailbox.c          |  5 +----
>  drivers/mailbox/bcm74110-mailbox.c         |  2 +-
>  drivers/mailbox/cv1800-mailbox.c           |  2 +-
>  drivers/mailbox/hi6220-mailbox.c           |  5 +----
>  drivers/mailbox/mailbox-mpfs.c             |  2 --
>  drivers/mailbox/mailbox-sti.c              |  4 +---
>  drivers/mailbox/qcom-cpucp-mbox.c          |  2 +-
>  drivers/mailbox/qcom-ipcc.c                |  4 +---
>  drivers/mailbox/sprd-mailbox.c             | 12 +++---------
>  drivers/mailbox/stm32-ipcc.c               |  4 +---


>  drivers/mailbox/sun6i-msgbox.c             |  4 +---

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun6i

