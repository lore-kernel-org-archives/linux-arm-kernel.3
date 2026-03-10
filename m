Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C3DFCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzxMpRKo+kD/8OT4z6Err1RirKqv8QKgvuKombc1CLY=; b=5AFMDAm+7Ak4V7
	uMLp5nzfaDkMu179BMCVc3wJi6Z5+H70PnzQzllinyp9g3lVhCpVCqpDn4gqXer14HIzzXTQ/tTeh
	IYCwSZza2yqNRNljn7GfeZv4qnr177GZhJ0wzZZAM/Q/2GKq2TDKiga7KdRlcz4yS+IvVJ21d7F/P
	5AQwQnKrg9QN5bSEGJcdMFlGGAgiDKmv4DwsFCYTYv3PrfwIeAMD+YCpiuLpyuseubg8uh3B0Vq4N
	2BHBZtI7mR8yBnATSq7HCBlOWa3esYc6WZzyU6V58YpOU+yqm4wTd83mbbhkCQH6Rnz0pPhzhWas+
	7p93D2XDWORYNMwTZhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn60-00000008aOE-0tre;
	Tue, 10 Mar 2026 02:45:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn5w-00000008aM7-2vpO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30DE34458D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165BEC2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110716;
	bh=AiuSbGc4gyF+r0NsVvYBegnqTPdAIt4V0L/szs51RLs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=deu669Z9bCAa3MHzmq85IHa4IIybHro01N3INe+ETq7xl2XbjqfVmZtHlbKEs3Rpw
	 tmDIW2kRFqJXcxnteRZJq11Hw220gZXTp/2BYB4i36vmN3QlYcjnB8SKQqD/eYiveS
	 kdCfsege3WAIPqGpWp0aJs4k8pxbZ0GvI9LVkl3kqCeagxiCHPMyZQh5WFMwuv29jU
	 r0SkhBw5sUyj4Wd28Ft87E8doiuqor0WxSYfGuRbKELjs/txoCHc7aYpv4jk4tB8A/
	 duwiqpP9JaL54dfvTeud0bobzW7DtU/TskHR7IvQ8+D1CzPaM9SU8UO1JxP0q5x6zt
	 BsA6px45ozMxQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2544b52bso71084241fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 19:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlHmw8GwTZIaHZzDXFe+gb/F89jA9Gfhu2SoSekOtQhdYFcnuqNnFjxTVjxKFskdWd2DWCE5gLz0BjDQ5OHDN1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ozOPEQR7ht0Edw1zZX4Nhlo/ib8hKftCmmPwVfwOngQD5fDc
	3PUDvFLSzrNEXxtYkahYjnmNxMVQcXLFqFKWuIPLLmr7/DF5b6UilziYWRJddlEePIvTQ5uTS20
	8c63KXom4S7eyWF+8IN+yiTOxCovv2LM=
X-Received: by 2002:a05:651c:1104:b0:385:c21f:37e1 with SMTP id
 38308e7fff4ca-38a40b6a2d2mr40186201fa.15.1773110714064; Mon, 09 Mar 2026
 19:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <20260309190842.927634-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260309190842.927634-18-vladimir.oltean@nxp.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 10:45:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v65surpnqrmv4tbH4TSrx6SaTpdbsQtCsNqwse5xwdb8fA@mail.gmail.com>
X-Gm-Features: AaiRm535EaFxYtCAjq5FIkHiBmgOxc7_e434rO98DZfg5NrM7RTttw3IOCzqW1Y
Message-ID: <CAGb2v65surpnqrmv4tbH4TSrx6SaTpdbsQtCsNqwse5xwdb8fA@mail.gmail.com>
Subject: Re: [PATCH v3 phy-next 17/24] media: sunxi: a83-mips-csi2: include
 PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_194516_781690_635571D9 
X-CRM114-Status: GOOD (  21.17  )
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

On Tue, Mar 10, 2026 at 3:10=E2=80=AFAM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
>
> The introduction commit 576d196c522b ("media: sunxi: Add support for the
> A83T MIPI CSI-2 controller") says:
>
>     This implementation splits the protocol and D-PHY registers and
>     uses the PHY framework internally. The D-PHY is not registered as a
>     standalone PHY driver since it cannot be used with any other
>     controller.
>
> However, this does not matter, and is not the only instance of tight PHY
> provider <-> consumer pairing. According to Vinod Koul, having PHY
> provider drivers outside of drivers/phy/ is discouraged, although it
> would be difficult for me to address a proper movement here.
>
> So just include the private provider API header from drivers/phy/ and
> leave a FIXME in place.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
>
> v1->v3: none
> ---
>  .../media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_dphy.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy=
.c
> index 24bbcc85013d..1143feeb4fcb 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
> @@ -4,9 +4,9 @@
>   * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>   */
>
> -#include <linux/phy/phy.h>
>  #include <linux/regmap.h>
>
> +#include "../../../../phy/phy-provider.h" /* FIXME */
>  #include "sun8i_a83t_dphy.h"
>  #include "sun8i_a83t_mipi_csi2.h"
>
> --
> 2.43.0
>

