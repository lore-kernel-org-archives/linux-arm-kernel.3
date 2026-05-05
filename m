Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7365CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0r85uYEBvFZwjw3nY1w+QDsZrIZzp0BkVyYOYWi2dY=; b=tp3tGCofNyoBJT34ix9gcGZr0Q
	sV0ObhR9P1TvtF+9ixHJ8LB1uXkU/TpBte+ycBb4P3tbB8tEfrM6P3FxzmjLLEfuhYnItzTBWBFFr
	Fr1DTiDP3+mdDlMNeG3FYtocSMQfBjUpJDMzgouuCQq0kxQK2ZFQHZHY/ViwDDVQzttxI4VCErqrI
	zTD0Lz6Pp491Rj8LoLyp1dI6P21RkkN+gD8QVeeNxky46Ximyr+PDneL/DQxr+zCEs5QFcCWNO7hp
	dNf75CMAgQVakBTHAebF1HdlXZ56855LPMAIHn5cocpfY8XXm8YyeamMkpcguVOmbMFxEe3V0IX+j
	9GpFylcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBch-0000000Fb6k-3yBF;
	Tue, 05 May 2026 08:59:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBcf-0000000Fb5v-2HRj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777971560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0r85uYEBvFZwjw3nY1w+QDsZrIZzp0BkVyYOYWi2dY=;
	b=AFW0wkPcG+LgWIuSco+vrsN/a4B0H5sveYoHPJW4W7wboxO/2VWiQnYrR5oxNRXDaCwxhm
	olBx3yC7YvIPGas/b5Pqyuy7qm1mJjL9Z16Gh4xHd80lr4upnOGCasox6g5jCqxcSWulqn
	LM8VmDEneQ40L9hSmziW6Os5gRMXdoA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-0GUFmyhhNI-IovcVruK2PA-1; Tue, 05 May 2026 04:59:16 -0400
X-MC-Unique: 0GUFmyhhNI-IovcVruK2PA-1
X-Mimecast-MFC-AGG-ID: 0GUFmyhhNI-IovcVruK2PA_1777971556
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48d127eb013so6630995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 01:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971555; x=1778576355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0r85uYEBvFZwjw3nY1w+QDsZrIZzp0BkVyYOYWi2dY=;
        b=eRv0pKRIaBbBL8ver+gBRXTdJ/X+LzofvPUAKqjKix4d0QAGC2W2hdwMvlEiGlJhSL
         J41+2XOzMlczZcMzp1g5Yn6qzBSWShO7IoDnCbLDivXKBRgEWIYV2AR4njNCM/rfNDtT
         T0mwaX5Q+NjaZl+sCYnlmR0/Pvk9vSuJP8cYIcSxbwIN7xFaDJRu1DJzDp5Jjb3gW1oK
         s8Ni6fIakWEH6z+wtOkObq7SffY8IZCTSZa4s1lnvLAjVIVOr1CmMF2AuyqkI9dyDPAi
         0by9qNG3e1EGSbE7f5dxRqWUhs02054RzFlcV7G40RhStDRfOmSlok70Qelio4JB9NZO
         WYxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CxFnezK8wSoDv5Bx2s3kLeHiApf+5O1k4O61dh1vvdZLIqgyxD5LN0SEJ5SvMI4aTDGsHqt37YZNRiFUpXh2B@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpoex/HArw2QGUZu4J1POg6yNfOF3sBkQdD9Qdd34Xa0t5hZXe
	t9tgcnObP2KEcEkjO0WU+B8ROjoLl+bWgJ3X4tcxEpP7Y1+U33A9KP52IW6Kf8Xc5rm1gEGTD7f
	/shPJDi8umMPS2ai0J4TgYW+w1G/wrcYDGprOXhYtxByiLx8HvUVtsf+HUXYsb7SNx2SChO0LnO
	Wz
X-Gm-Gg: AeBDiet5Xw0PiNWYQZqYczGRDm1/attRE3Qyt/LHcfu5WS55w06mJrTyCCZyNbBtFHa
	6V56V43bnfRB0F1dTDg4g0WdzNWBFdO/6ylxViTP79hTyL1ybWqQU8CMX2K8w2xy51TSVy2OnPM
	6IXBnZ6rh5IPZs4a/jPDpr1RUJET+LVJyqQ9u0Ngkwna+ECPA8egiSoln+1fMzwPqtbXzuU6DBu
	RqbdNS9Cxn7GGasTqRabhW5qEOkJih/Sp8VeHkY9I+Yl35JBU6WLtAlm8rOzbZZfkj7KV2bbU+B
	3XIgL4wInYJqNrD8Y4k61n1HjHBpsQYTJJ3bxjBz/slByrTZlF0/b/srG2l+uuICbbjQy/G2asL
	zAlYlh6khiVfec6ih9nlzx7RFXck3EIeNjliRt8nQDWgMROioNLvsHa7f85VV12dLLEI=
X-Received: by 2002:a05:600c:5308:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48d03b401f5mr161071365e9.22.1777971555630;
        Tue, 05 May 2026 01:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:5308:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48d03b401f5mr161070775e9.22.1777971555194;
        Tue, 05 May 2026 01:59:15 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d184ed3b0sm12329145e9.34.2026.05.05.01.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:59:14 -0700 (PDT)
Message-ID: <6324783e-b5c8-462d-8cf7-f6cc9c01ea89@redhat.com>
Date: Tue, 5 May 2026 10:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 04/15] net: enetc: add basic operations to the
 FDB table
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
 frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-5-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430024945.3413973-5-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xn1EpRlnbHhcV-zrYCmtiSv4Ke2lGA-oUSyghsuMhXw_1777971556
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_015921_660917_9B9BEE91 
X-CRM114-Status: GOOD (  23.18  )
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

On 4/30/26 4:49 AM, Wei Fang wrote:
> The FDB table is used for MAC learning lookups and MAC forwarding lookups.
> Each table entry includes information such as a FID and MAC address that
> may be unicast or multicast and a forwarding destination field containing
> a port bitmap identifying the associated port(s) with the MAC address.
> FDB table entries can be static or dynamic. Static entries are added from
> software whereby dynamic entries are added either by software or by the
> hardware as MAC addresses are learned in the datapath.
> 
> The FDB table can only be managed by the command BD ring using table
> management protocol version 2.0. Table management command operations Add,
> Delete, Update and Query are supported. And the FDB table supports three
> access methods: Entry ID, Exact Match Key Element and Search. This patch
> adds the following basic supports to the FDB table.
> 
> ntmp_fdbt_update_entry() - update the configuration element data of a
> specified FDB entry
> 
> ntmp_fdbt_delete_entry() - delete a specified FDB entry
> 
> ntmp_fdbt_add_entry() - add an entry into the FDB table
> 
> ntmp_fdbt_search_port_entry() - Search the FDB entry on the specified
> port based on RESUME_ENTRY_ID.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/ntmp.c   | 203 +++++++++++++++++-
>  .../ethernet/freescale/enetc/ntmp_private.h   |  61 +++++-
>  include/linux/fsl/ntmp.h                      |  44 +++-
>  3 files changed, 305 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> index c94a928622fd..4ed8d783a9a2 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
>   * NETC NTMP (NETC Table Management Protocol) 2.0 Library
> - * Copyright 2025 NXP
> + * Copyright 2025-2026 NXP
>   */
>  
>  #include <linux/dma-mapping.h>
> @@ -21,11 +21,15 @@
>  /* Define NTMP Table ID */
>  #define NTMP_MAFT_ID			1
>  #define NTMP_RSST_ID			3
> +#define NTMP_FDBT_ID			15
>  
>  /* Generic Update Actions for most tables */
>  #define NTMP_GEN_UA_CFGEU		BIT(0)
>  #define NTMP_GEN_UA_STSEU		BIT(1)
>  
> +/* Query Action: 0: Full query, 1: Only query entry ID */
> +#define NTMP_QA_ENTRY_ID		1

Sashiko noted that the above comments looks inconsistent with the update
code, where NTMP_QA_ENTRY_ID apparently uses a full query, and 0 just
the entry ID.

If you have to repost for other reasons, please fix this. Note that you
should reply on the ML to sashiko reviews ruling out invalid comments.

Thanks,

Paolo


