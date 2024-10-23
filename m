Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA854D2E01E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOcl1zbrWV41lQLwKEPX5/jOX1h/qbYm5s+hKtfKEZM=; b=TJvzQ/D2iFm7a1cjDJ5nZ+sx0F
	MVIvgcQ7JdUUBd+G5D9IgLb3Evdh8QzRp2LD8Zba9hfasnHxwqzE6ZlkbAgVIf1Q/J/HyMnV5YWzT
	6Q6FDN3iUU9tq9FvNYges6to5/yuFZnqqglVp5kJOO10WSHRt0xBJC1tuiDkBhrDroVRcFD+OFx+Z
	DTgPY9R7XKBkSRwRjOT32MhYFdOPZP0LKkOYN6SF8HWoytgXhTRAudlNhWVC/pcGoNedeL7uI7zw9
	pe8idoSG+d7jhVURIc1wq8nxqwx/PUUsYUH23UcZ0ksMzLllGlekGZQwRtimTN1eBGnHaYpRgNkgk
	ziV53Yhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WlI-0000000DZUp-3gTF;
	Wed, 23 Oct 2024 08:30:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WWA-0000000DWYB-2GAA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 386AF5C5C06;
	Wed, 23 Oct 2024 08:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63F5C4CEC6;
	Wed, 23 Oct 2024 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671297;
	bh=PCYN10kLm7y5N3zh5gY4Cdbwis2bzdQoq+BQVvVyqK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YctDnfDmwr3IK2pisJqLuLBy6/gCIerF7wUKqqa1CfH2RjXTxnFqmPHa97AiuVFd3
	 +ddngVuWmLFnZp1uToHCHMBNAWffgj71hZDa9YBrkfFEPbBFdQBV2cmtU+3464Kg1n
	 Upg4n+S8N+j/dGA33zrClI+TpwJ2BkRWNHKOfdYuUyU+9yjTqpySd44d9Jv5tkFTEt
	 CMWg5e6ir7KfkDF1J+yByJQVXs2Im8O+b800ZScK77zjYghIqrKXzNzOvblPVUIVAq
	 oflJ+JpOVdUmdzQU+kN4xLRyPmk6DDB7EeHT1MoRHDHHm7RVXK2xwny0n3MxFCvF6r
	 ZxtgVoE9nqRrg==
Date: Wed, 23 Oct 2024 10:14:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, andrew@lunn.ch, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, horatiu.vultur@microchip.com, 
	jensemil.schulzostergaard@microchip.com, Parthiban.Veerasooran@microchip.com, 
	Raju.Lakkaraju@microchip.com, UNGLinuxDriver@microchip.com, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, jacob.e.keller@intel.com, 
	ast@fiberby.net, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 14/15] net: sparx5: add compatible strings for
 lan969x and verify the target
Message-ID: <cetor3ohhg6rzf3w2cm6hqxsqukh52nm54mp7tizb2qc3x44j4@n53v6btq6t6r>
References: <20241021-sparx5-lan969x-switch-driver-2-v1-0-c8c49ef21e0f@microchip.com>
 <20241021-sparx5-lan969x-switch-driver-2-v1-14-c8c49ef21e0f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021-sparx5-lan969x-switch-driver-2-v1-14-c8c49ef21e0f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_011458_692187_5963F197 
X-CRM114-Status: GOOD (  27.53  )
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

On Mon, Oct 21, 2024 at 03:58:51PM +0200, Daniel Machon wrote:
> Add compatible strings for the twelve lan969x SKU's (Stock Keeping Unit)
> that we support, and verify that the devicetree target is supported by
> the chip target.
> 
> Each SKU supports different bandwidths and features (see [1] for
> details). We want to be able to run a SKU with a lower bandwidth and/or
> feature set, than what is supported by the actual chip. In order to
> accomplish this we:
> 
>     - add new field sparx5->target_dt that reflects the target from the
>       devicetree (compatible string).
> 
>     - compare the devicetree target with the actual chip target. If the
>       bandwidth and features provided by the devicetree target is
>       supported by the chip, we approve - otherwise reject.
> 
>     - set the core clock and features based on the devicetree target
> 
> [1] https://www.microchip.com/en-us/product/lan9698
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  drivers/net/ethernet/microchip/sparx5/Makefile     |   1 +
>  .../net/ethernet/microchip/sparx5/sparx5_main.c    | 194 ++++++++++++++++++++-
>  .../net/ethernet/microchip/sparx5/sparx5_main.h    |   1 +
>  3 files changed, 193 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/Makefile b/drivers/net/ethernet/microchip/sparx5/Makefile
> index 3435ca86dd70..8fe302415563 100644
> --- a/drivers/net/ethernet/microchip/sparx5/Makefile
> +++ b/drivers/net/ethernet/microchip/sparx5/Makefile
> @@ -19,3 +19,4 @@ sparx5-switch-$(CONFIG_DEBUG_FS) += sparx5_vcap_debugfs.o
>  # Provide include files
>  ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/vcap
>  ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/fdma
> +ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/lan969x
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 5c986c373b3e..edbe639d98c5 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -24,6 +24,8 @@
>  #include <linux/types.h>
>  #include <linux/reset.h>
>  
> +#include "lan969x.h" /* lan969x_desc */
> +
>  #include "sparx5_main_regs.h"
>  #include "sparx5_main.h"
>  #include "sparx5_port.h"
> @@ -227,6 +229,168 @@ bool is_sparx5(struct sparx5 *sparx5)
>  	}
>  }
>  
> +/* Set the devicetree target based on the compatible string */
> +static int sparx5_set_target_dt(struct sparx5 *sparx5)
> +{
> +	struct device_node *node = sparx5->pdev->dev.of_node;
> +
> +	if (is_sparx5(sparx5))
> +		/* For Sparx5 the devicetree target is always the chip target */
> +		sparx5->target_dt = sparx5->target_ct;
> +	else if (of_device_is_compatible(node, "microchip,lan9691-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9691VAO;
> +	else if (of_device_is_compatible(node, "microchip,lan9692-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9692VAO;
> +	else if (of_device_is_compatible(node, "microchip,lan9693-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9693VAO;
> +	else if (of_device_is_compatible(node, "microchip,lan9694-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9694;
> +	else if (of_device_is_compatible(node, "microchip,lan9695-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9694TSN;
> +	else if (of_device_is_compatible(node, "microchip,lan9696-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9696;
> +	else if (of_device_is_compatible(node, "microchip,lan9697-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9696TSN;
> +	else if (of_device_is_compatible(node, "microchip,lan9698-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9698;
> +	else if (of_device_is_compatible(node, "microchip,lan9699-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9698TSN;
> +	else if (of_device_is_compatible(node, "microchip,lan969a-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9694RED;
> +	else if (of_device_is_compatible(node, "microchip,lan969b-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9696RED;
> +	else if (of_device_is_compatible(node, "microchip,lan969c-switch"))
> +		sparx5->target_dt = SPX5_TARGET_CT_LAN9698RED;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Compare the devicetree target with the chip target.
> + * Make sure the chip target supports the features and bandwidth requested
> + * from the devicetree target.
> + */
> +static int sparx5_verify_target(struct sparx5 *sparx5)
> +{
> +	switch (sparx5->target_dt) {
> +	case SPX5_TARGET_CT_7546:
> +	case SPX5_TARGET_CT_7549:
> +	case SPX5_TARGET_CT_7552:
> +	case SPX5_TARGET_CT_7556:
> +	case SPX5_TARGET_CT_7558:
> +	case SPX5_TARGET_CT_7546TSN:
> +	case SPX5_TARGET_CT_7549TSN:
> +	case SPX5_TARGET_CT_7552TSN:
> +	case SPX5_TARGET_CT_7556TSN:
> +	case SPX5_TARGET_CT_7558TSN:
> +		return 0;

All this is weird. Why would you verify? You were matched, it cannot be
mis-matching.

> +	case SPX5_TARGET_CT_LAN9698RED:
> +		if (sparx5->target_ct == SPX5_TARGET_CT_LAN9698RED)

What is "ct"? sorry, all this code is a big no.

Best regards,
Krzysztof


