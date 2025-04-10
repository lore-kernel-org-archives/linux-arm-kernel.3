Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7773C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuVL+jTm8BlM5ZpgP0Uojq+Y9nMX/V5q2TiLQtlvtmM=; b=hRq4vcz4S7iM9UgmlaCOMENn6/
	XIBXaJVy++AYaHsfvPH1VixYUrdZQ0Efn/Uiv2DnAl3tlZ72bA1q1qY7jJFO79gEWhCcOAzn+c9zU
	vwB+INTc+A65+wezX4IlQvl7Nuha9BoqPH2HUPwjHB7GSaDXDBT2GEK7RCXAWmil4hTLMUSvklRjo
	6r43NnDKg35DVddO5MLx9tSzMfXSCkwGE/TdOdvWmE+Yx2xIUCPSK/JrBjgIvwRjwuX1tBRFpSO0j
	79ZoBnSWlo7AoJknSYg1mdWSl4Ys3jcSCD/A1cZpiZbY1q2JByjb+wAM+STCA4LemdYn9HYY87dJC
	leRS3lqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lz5-00000009TGO-0cM3;
	Thu, 10 Apr 2025 07:05:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lYZ-00000009Oci-1Aoh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:38:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso504127a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267114; x=1744871914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuVL+jTm8BlM5ZpgP0Uojq+Y9nMX/V5q2TiLQtlvtmM=;
        b=ltNRXBTOHkyuYVQ7fYTTo8ZOKFuyEEJxdwC4QDxOgdM2EjPBdWODMw91ouonlfSE90
         NHK7OHhGWDghHE4F0XWxPFpKs9GRt32YxIR1TMFJqk6lviz0Np46kfT03UFfv5iEGBFB
         ml3mMSRHmpEZHhLPE1OBhHndoUUKnQ4tfeUAk9R5QD7bTwvJGHsKEWDSSRwL2p3JsU+b
         nocC8kXCGuibGHtmmrL9M96+lW4p9vEEV7Fu3ydGzT7k7HjAkI+Qnuv+Wl0Gi/DJHtxl
         HOqA70mbEYcHLfQE1eDNBnzb78K1l6ApERzRVGeC5qyhjraYDw8H2k4KbYq6y8Lyvybv
         Qw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267114; x=1744871914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuVL+jTm8BlM5ZpgP0Uojq+Y9nMX/V5q2TiLQtlvtmM=;
        b=jzQOm+zQTa7CLWg5t3w9rGU2bZEaCczscOELe3RClZI7ka2x7WQp50XBxZuiE9bGkX
         WBt9uC3RrSnZTJCkDj5xelVNRYiwFyCrVf9ct/90gy21g+V1OBsJEDd3u8DmNVBNEY3e
         DnSL8gxIHD/AQVFCOQ4I6byh3fhOIQpCSpP00CLO7OIqTdFvXgDofB/S37LIBdn99E1N
         xKk9ktuLL0EcJRcJfCyu1Dvzon2YJamGCTNzQbBXfs3XzeEtnZ/HeE7gWZ8b/cG7ynud
         xrzshKTlr6yPAlL5tI74iWheViWNnxHvGHzIC/oukodFzxIuPhLC7eHsCHd3FTqpBn33
         F9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH6TEH4Dx+Ol1ziIv6NwPWhYODzkY26B+QAoRFpri+jLrUsfEFiK3vUUEAztzP9DUwxoEkUmwvTjauPTD9sv8A@lists.infradead.org
X-Gm-Message-State: AOJu0YyDzD6oQdvJ7sIXHVa4K1FYQxMbH/mDijRh5t9Bw/y7FqfpSH00
	8z2cLbJL7yIui8x2tsKaNyb27/5V/rT4AABYErEYvlBMp1oiWsoYbx51kA==
X-Gm-Gg: ASbGncsjiZ/onuBdICq1uUydH/UrRsY3UXVjXqDIn/9jqvpP5KbyGrglSvr2Etjw5zo
	nWrBG903WqZ1cIAX0SNXbzWQw+/kwGrbA9DyNCCUAczUBSZiA05sizaoo92cys2M0WyCyL4zDtr
	y+LFRwEkXZ9xBW2xmrOdmExvlmKcNN5Eb0vvTEHHyyo4x3Gx9ROCwqFsbeIzzoo7L5YEMiWWFdw
	SiJERbThWJ3xrTKBN3tZrEw+prpL2I9c6IMMXZBq7g9ycNP47KgeIEK9i/wo/XcpZQsuuSM2ew0
	2ewXwwoB/Blu5bXjDcSfdMBlpYcpXB6yD+WwYsLejT74
X-Google-Smtp-Source: AGHT+IFoLHwW+yB8ugnhtjq/Zm+3UsyrrhpRcH51GcUutNiq2TfCMkej9FiKynCN6f6ckD3TqsaTYA==
X-Received: by 2002:a17:90b:2dca:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-30718b82e6bmr3115309a91.17.1744267113628;
        Wed, 09 Apr 2025 23:38:33 -0700 (PDT)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb554bsm22850725ad.199.2025.04.09.23.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:33 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:38:21 +0800
From: Furong Xu <0x1207@gmail.com>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthew Gerlach
 <matthew.gerlach@altera.com>, Tien Sung Ang <tien.sung.ang@altera.com>, Mun
 Yew Tham <mun.yew.tham@altera.com>, G Thomas Rohan
 <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN
 implementation
Message-ID: <20250410143821.000002c0@gmail.com>
In-Reply-To: <20250408081354.25881-2-boon.khai.ng@altera.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
	<20250408081354.25881-2-boon.khai.ng@altera.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233835_320614_7AFDEFD5 
X-CRM114-Status: GOOD (  21.21  )
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

On Tue,  8 Apr 2025 16:13:53 +0800, Boon Khai Ng <boon.khai.ng@altera.com> wrote:

> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  40 ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 295 +-----------------
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  13 -
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  87 ------
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  61 ++--
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 294 +++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.h |  63 ++++
>  10 files changed, 401 insertions(+), 463 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> 
[...]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 31bdbab9a46c..0a57c5e7497d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -9,6 +9,7 @@
>  #include "stmmac_fpe.h"
>  #include "stmmac_ptp.h"
>  #include "stmmac_est.h"
> +#include "stmmac_vlan.h"
>  #include "dwmac4_descs.h"
>  #include "dwxgmac2.h"
>  
> @@ -120,6 +121,7 @@ static const struct stmmac_hwif_entry {
>  	const void *tc;
>  	const void *mmc;
>  	const void *est;
> +	const void *vlan;
>  	int (*setup)(struct stmmac_priv *priv);
>  	int (*quirks)(struct stmmac_priv *priv);
>  } stmmac_hw[] = {
> @@ -197,6 +199,7 @@ static const struct stmmac_hwif_entry {
>  		.desc = &dwmac4_desc_ops,
>  		.dma = &dwmac4_dma_ops,
>  		.mac = &dwmac410_ops,
> +		.vlan = &dwmac_vlan_ops,

Rename dwmac_vlan_ops to dwmac4_vlan_ops will be better,
just like dwmac4_desc_ops/dwmac4_dma_ops

[...]
> +const struct stmmac_vlan_ops dwmac_vlan_ops = {
> +	.update_vlan_hash = vlan_update_hash,
> +	.enable_vlan = vlan_enable,
> +	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
> +	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
> +	.restore_hw_vlan_rx_fltr = vlan_restore_hw_rx_fltr,
> +	.rx_hw_vlan = vlan_rx_hw,
> +	.set_hw_vlan_mode = vlan_set_hw_mode,
> +};
> +
> +const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
> +	.update_vlan_hash = vlan_update_hash,
> +	.enable_vlan = vlan_enable,
> +};

dwxlgmac2_vlan_ops looks redundant here, another new struct contains
totally identical members.

stmmac_do_void_callback()/stmmac_do_callback() handles NULL function
pointers so good, we can leave the un-implemented functions as NULL.

Are you trying to avoid something undefined here?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> new file mode 100644
> index 000000000000..29e7be83161e
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025, Altera Corporation
> + * stmmac VLAN(802.1Q) handling
> + */
> +
> +#ifndef __STMMAC_VLAN_H__
> +#define __STMMAC_VLAN_H__
> +
> +#include <linux/bitfield.h>
> +
> +#define VLAN_TAG			0x00000050
> +#define VLAN_TAG_DATA			0x00000054
> +#define VLAN_HASH_TABLE			0x00000058
> +#define VLAN_INCL			0x00000060
> +
> +#define HW_FEATURE3			0x00000128
> +
> +/* MAC VLAN */
> +#define VLAN_EDVLP			BIT(26)
> +#define VLAN_VTHM			BIT(25)
> +#define VLAN_DOVLTC			BIT(20)
> +#define VLAN_ESVL			BIT(18)
> +#define VLAN_ETV			BIT(16)
> +#define VLAN_VID			GENMASK(15, 0)
> +#define VLAN_VLTI			BIT(20)
> +#define VLAN_CSVL			BIT(19)
> +#define VLAN_VLC			GENMASK(17, 16)
> +#define VLAN_VLC_SHIFT			16
> +#define VLAN_VLHT			GENMASK(15, 0)
> +
> +/* MAC VLAN Tag */
> +#define VLAN_TAG_VID			GENMASK(15, 0)
> +#define VLAN_TAG_ETV			BIT(16)
> +
> +/* MAC VLAN Tag Control */
> +#define VLAN_TAG_CTRL_OB		BIT(0)
> +#define VLAN_TAG_CTRL_CT		BIT(1)
> +#define VLAN_TAG_CTRL_OFS_MASK		GENMASK(6, 2)
> +#define VLAN_TAG_CTRL_OFS_SHIFT		2
> +#define VLAN_TAG_CTRL_EVLS_MASK		GENMASK(22, 21)
> +#define VLAN_TAG_CTRL_EVLS_SHIFT	21
> +#define VLAN_TAG_CTRL_EVLRXS		BIT(24)
> +
> +#define VLAN_TAG_STRIP_NONE		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x0)
> +#define VLAN_TAG_STRIP_PASS		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x1)
> +#define VLAN_TAG_STRIP_FAIL		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x2)
> +#define VLAN_TAG_STRIP_ALL		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x3)
> +
> +/* MAC VLAN Tag Data/Filter */
> +#define VLAN_TAG_DATA_VID		GENMASK(15, 0)
> +#define VLAN_TAG_DATA_VEN		BIT(16)
> +#define VLAN_TAG_DATA_ETV		BIT(17)
> +
> +/* MAC VLAN HW FEAT */
> +#define VLAN_HW_FEAT_NRVF		GENMASK(2, 0)
> +
> +extern const struct stmmac_vlan_ops dwmac_vlan_ops;
> +extern const struct stmmac_vlan_ops dwxlgmac2_vlan_ops;
> +
> +u32 stmmac_get_num_vlan(void __iomem *ioaddr);
> +
> +#endif /* __STMMAC_VLAN_H__ */

It is a good practice to only keep inside the header those definitions
which are truly exported by stmmac_vlan.c towards external callers.
That means those #defines which are only used within stmmac_vlan.c
shouldn't be here, but inside stmmac_vlan.c file.

