Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A15C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5i1dRgXFuf3vzjl9wEv1iGRWAKm5KdZqKsouJtzpNQ=; b=SWwEUQfsUdlMe7
	n/K6PIxOrOYXItRCkwZvFtKnRintrS+zbEii9eWmxSjRJlFuWx6jXGYfcwn8oRpKk7QrygCmRA834
	38kksfQcKk1PG5UmWAnyXY2J+6+ktKIlfIPUlk5fyOd1PMzckO78X9GYyg31Mtog3f1MsSSM5Jldt
	eFRrv+71kilKNmIigTU81nEx27LDX2m0qMa/wh3oZ533xXsdohJU5slDhRX+6C6Oq+llKx9AUcuOP
	QSznfcrdUiQKCpP0SPG7J2hijC4WDD1KFxJYGTGeHvUJLvoBE73Zu10O/H7Lewmg+63s94QwkmKAu
	/1YfDnvmMnzS9dYHj5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKX7-00000007gdL-2whc;
	Wed, 26 Mar 2025 06:46:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKVQ-00000007gUs-0Jr0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 06:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 996786112F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841E3C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742971490;
	bh=N+Le9MFtc/k1LZ1LVkIPmZk2oGdIyqo4T5HKb+AHZPQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mGexHaIgLbSTRVHs1aAeFQlPGcyoCZW7ra4H38PmdGzDelCOcdKx1PSXmCzV7zHg4
	 t4BXlaPJZl4M++7SmdtJc6OS8JjvQRphtWZwBCWtmx/alHR1Io5/u7TZToVoyJOSou
	 96VjLRob86BRO7cjMzROfgRLhBnxIvMMr+R4vtlIUeOGTcng2xdyftnauroj5ZowGD
	 xzqLtB/oFZyge5ZZJr/oxGRcBJ2TtgorNnVd6M4vPVwtA8/remvhxw2JO6w5AmNBGW
	 LWfgRtD9plTNy/EtRrTL21OA4Ltzhsl8gLg9J9a66/mPT8tJvI+frlHwy6w6//C7jk
	 Cj6THAiU6V/PQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30761be8fcfso67777991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 23:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrHXpIFQsebouxU7D8h5MKi6tHf5DeQg6/9JTbk3Fjx/V83V92Boz5UySpy1MIJVgHS53W2M30hR3xhJc62YjU@lists.infradead.org
X-Gm-Message-State: AOJu0YzYq55Tekmf18CjeCmhkyqBSkx6V7eHZo1oijH0aRZKUx/mUtTV
	g6yS3aib7KGx+w6ggG0cZcGMQDXpX2ZY5xe6pP+6tbe1B1LPWd1QBjZanFQXOKjrHzRnt6HXojx
	rrQMypAobMBsivYXwpxtqjbuZAyk=
X-Google-Smtp-Source: AGHT+IGMF6j2X+Jr6WCvccPSUBNATvTU7YZt+i3mWvl9VVSwRgH7cCtIrbRrCInxLepNvpLKepp5tmas4mw+ODC5pdo=
X-Received: by 2002:a05:651c:201c:b0:30b:f924:3554 with SMTP id
 38308e7fff4ca-30d7e236c49mr59160551fa.21.1742971488912; Tue, 25 Mar 2025
 23:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
In-Reply-To: <20250317232426.952188-3-robh@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 26 Mar 2025 14:44:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6AIDujd8iNXwgSFrroWq7EbdFM1zyiw-quoSbfHrKnBQnEEqsHIIoRaI
Message-ID: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
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

Hi,

On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Simplify of_dma_set_restricted_buffer() by using of_property_present()
> and of_for_each_phandle() iterator.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/device.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index edf3be197265..bb4a47d58249 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
>  static void
>  of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
>  {
> -       struct device_node *node, *of_node =3D dev->of_node;
> -       int count, i;
> +       struct device_node *of_node =3D dev->of_node;
> +       struct of_phandle_iterator it;
> +       int rc, i =3D 0;
>
>         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
>                 return;
>
> -       count =3D of_property_count_elems_of_size(of_node, "memory-region=
",
> -                                               sizeof(u32));
>         /*
>          * If dev->of_node doesn't exist or doesn't contain memory-region=
, try
>          * the OF node having DMA configuration.
>          */
> -       if (count <=3D 0) {
> +       if (!of_property_present(of_node, "memory-region"))
>                 of_node =3D np;
> -               count =3D of_property_count_elems_of_size(
> -                       of_node, "memory-region", sizeof(u32));
> -       }
>
> -       for (i =3D 0; i < count; i++) {
> -               node =3D of_parse_phandle(of_node, "memory-region", i);
> +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
>                 /*
>                  * There might be multiple memory regions, but only one
>                  * restricted-dma-pool region is allowed.
>                  */
> -               if (of_device_is_compatible(node, "restricted-dma-pool") =
&&
> -                   of_device_is_available(node)) {
> -                       of_node_put(node);
> -                       break;
> +               if (of_device_is_compatible(it.node, "restricted-dma-pool=
") &&
> +                   of_device_is_available(it.node)) {
> +                       if (!of_reserved_mem_device_init_by_idx(dev, of_n=
ode, i)) {
> +                               of_node_put(it.node);
> +                               return;
> +                       }
>                 }
> -               of_node_put(node);
> +               i++;
>         }
>
> -       /*
> -        * Attempt to initialize a restricted-dma-pool region if one was =
found.
> -        * Note that count can hold a negative error code.
> -        */
> -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node,=
 i))
> -               dev_warn(dev, "failed to initialise \"restricted-dma-pool=
\" memory node\n");
> +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memor=
y node\n");

This changes the behavior. Before this patch, it was:

    if a restricted dma pool was found, but initializing it failed, print
    a warning.

Whereas now it has become:

     print a warning unless a restricted dma pool was found and successfull=
y
     initialized.

This change causes the kernel to print out the warning for devices that
don't even do DMA:

simple-pm-bus soc: failed to initialise "restricted-dma-pool" memory node
simple-pm-bus 10006000.syscon: failed to initialise
"restricted-dma-pool" memory node
mtk-tphy soc:t-phy@11c80000: failed to initialise
"restricted-dma-pool" memory node
mtk-tphy soc:t-phy@11ca0000: failed to initialise
"restricted-dma-pool" memory node
mediatek-mipi-tx 11cc0000.dsi-phy: failed to initialise
"restricted-dma-pool" memory node
mediatek-mipi-tx 11cc0000.dsi-phy: can't get nvmem_cell_get, ignore it
clk-mt8186-apmixed 1000c000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-topck 10000000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-infra-ao 10001000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a04f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-cam 1a06f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-img 15020000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-img 15820000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-imp_iic_wrap 11017000.clock-controller: failed to
initialise "restricted-dma-pool" memory node
clk-mt8186-ipe 1c000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mcu c53a000.syscon: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mdp 1b000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-mfg 13000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-vdec 1602f000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-venc 17000000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
clk-mt8186-wpe 14020000.clock-controller: failed to initialise
"restricted-dma-pool" memory node
mt-pmic-pwrap 1000d000.pwrap: failed to initialise
"restricted-dma-pool" memory node
platform 1000d000.pwrap:pmic: failed to initialise
"restricted-dma-pool" memory node
mtk-svs 1100bc00.svs: failed to initialise "restricted-dma-pool" memory nod=
e


ChenYu
>  }
>
>  /**
> --
> 2.47.2
>
>

