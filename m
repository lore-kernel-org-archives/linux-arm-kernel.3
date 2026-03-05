Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7876F30931
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ide64iTfR6i/PYlaJZkcDz0C1ysI3oqgBBQglQllbQA=; b=AbhLNmjAFHkN2wlbA8yasbmSp/
	Wi9MSvPuqdOdzerfzEIUX+dHHGujF8/04lwUZrGhvM1hxLlUO42bDwLVbAs7GnybI3bP17k6M7t8c
	xEXNjLjd9UOSmul/WI59sbJZMwkhQhsMcGh2EEM29NTudWTWkDUfqepd5Gn9pPyt+/Jpi7kDKp9cT
	yXveIPOSZz9exh2ZRKjDg67wmX17fNJXReG5Qjt6hzub2sSpSpi+4kqL/NisTiQRIKwkIqhSjE6z1
	q0OznTvon9KU2FtbJktz1uTuOCW+tSdWzUth8em6h/t24RS6FUGBCuIVAW0d4o66ROF7GU+FRqqZj
	C4PAXBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy61J-00000001aLa-3YRA;
	Thu, 05 Mar 2026 10:33:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy61H-00000001aL1-16zp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:33:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy60p-0005YH-Bg; Thu, 05 Mar 2026 11:32:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy60m-003rpi-1E;
	Thu, 05 Mar 2026 11:32:57 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy60n-00000002Foi-2UBF;
	Thu, 05 Mar 2026 11:32:57 +0100
Date: Thu, 5 Mar 2026 11:32:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, 
	peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <azwbgxp4pl3m6klyvd5htmy7h7pc76nqvvgmi6pudvfl7zippl@svv7tiibyrci>
References: <20260305100149.722-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305100149.722-1-ming.qian@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_023327_322949_B5487642 
X-CRM114-Status: GOOD (  25.17  )
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

On 26-03-05, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> The imx8mq_vpu_shared_resources is referenced from non-init code,
> so keeping __initconst or __initconst_or_module here is wrong.
> 
> Drop the __initconst annotation and let it live in the normal .rodata
> section.
> 
> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>

This fix was suggested by Krzysztof :)

> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v2
> - Remove __initconst
> - Add missing Reported-by tag
> - Add missing Suggested-by tag
> - Remove comments of sentinel to pass checkpatch.pl
> 
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index 6f8e43b7f157..6fbe3c581032 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -343,10 +343,10 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
>  
> -static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
> +static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>  	{ .compatible = "nxp,imx8mq-vpu-g1", },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", },
> -	{ /* sentinel */ }
> +	{}

Unnecessary change.

With both fixed:

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>


>  };
>  
>  const struct hantro_variant imx8mq_vpu_g1_variant = {
> -- 
> 2.52.0
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

