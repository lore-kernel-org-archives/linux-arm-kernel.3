Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17803CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=; b=KWya5a4Cn2h52uzml72j2M9G6x
	POt8Kf8TzfniTRR8Pv+VB2eCXzn1ysb0aXMQB6qM8kz76QWkJIea8+dTE+9KtMMlB0BGB7krSF3ak
	eiqeDXJY24+S74z/rwiK9z8M6unzNtpBb3TQuFWoJxWd/Pb+7oS+mXOelbs5wBnpebGk39A0QbkAv
	EGz7a2c9egUqSiP3Nck+p4xS1MdaiXI+X2k/J/CBb+m8Tp1vNxkQIwbNkF0UhgLqrSthmnyQs2mtW
	7ghetGeQH0esS5cJDDD29SOzPZeUhM1rJc9QVYlBgQEg2CBMEjP7EDM4v7Ay3ohwSrHgdBLNJ45e8
	f2GtoLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcIv-0000000CjDd-2nwW;
	Sun, 14 Jun 2026 04:18:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcIs-0000000CjCt-3lXc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 04:18:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c2d792c8so14102465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 21:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781410714; x=1782015514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=;
        b=RtX+oO2AiOHHVSX3BIC1DcHAMR/jii/wWIeJdiLrdrUftVFjG0166L6lxaFJo5yrkt
         J3zFp+y5T0IXtafyEDrTZJ0b7elxvB2aQT/pudcIWZY/YtRkk1hErdmZzU5VtYbbz/cS
         F6o28J7AjNl8jsrwuh4YLV+MTjpU+SamnYvOU/rtf2qyTi2UNCniLflUfUsWNg54W/pl
         cbd6TV9cNQtMs5Xqeln2QZlawcWm0qmesOJrEyVyLu+ApueC8+R78tB8jH+GqFvWb+44
         kLD17Cso7YVrXkeb7FwzBg0aVKEI/acRSRTikjlVckpEFpHqR873U5CaKfqNxpYSno3y
         BAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781410714; x=1782015514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=;
        b=Ai7jv/1Y4qlwdH56KUaAsoLi3f4K8CbOdBP3ekV9Nl/YpgqII/c2mCpzRht2/Cvnwl
         P2BDxRxsHAA7Mrek2eluEvNk72y/vBx40FZSurHb53yWoWQpGbM+leNdcMCAg3EnDi6j
         GITgEQsP4VbeCE0Cwj7CINQXhiIk2Y0Fj9Y/x84bvEPeSA8xDFYHdp43+qh7FT75bqUe
         6SQqJLjNm4N1pz+BeyZWWE8qVCdxoTsBTdvNf4WHZwT3o1bYYQR4QKaNJYLipoQOKB2m
         an6NZaREhWGe7ZcFi/5ZAdZ/DE04msldRW+en35go0hWLUG+JLSShVYEI9l2tgPkECZK
         bRdw==
X-Forwarded-Encrypted: i=1; AFNElJ+FcH9GvSvER9run30eOATCUoA63JbjhX7hgtiEsqdAnamZPk/1VuUUoOLKTHPOfAWP9Mj8b6n4eSbrK4ibVJBv@lists.infradead.org
X-Gm-Message-State: AOJu0YwBHzS+ShnM2ZtyDE9C5g9NXUqZbMFzcai+z/BYt3FpkVXNLTRT
	9TH+jVTk6zEXR8iGWMKmqBEcCc0dAfD6GdbAOwM1dXNbM7GI0RhU8jZC
X-Gm-Gg: Acq92OG2+7N6ojZk5YKo+2C6zn+w5orgFkOVxkYqZ73igYvFOYEFj2IfTTLPSfZf6DA
	QUVGNIcrWI9X4FYEnyowKDzciHzlLtEyd9nCW/JDO32WeewaJql+27A9bgngwwLMWyOucz4skTY
	3QNkai0lrmJlKHr1+Fe/Qw0Ds0Mgz1hwaorQBXbkCnHKnSmJFtNm2Rj1TdjfjMpkEo9yIH59WXs
	EV/9wW6pfxB1flNwHFExguNunLw7O2OCMZK/FV78FEcTxOEGQY0LudvIxlUcDjgfsRFoB7V+XAo
	jCWsBi8UQJPLakH9unGBRPhxConL/+3vZzUNzCSTV4aWWxCTzGjvM0DMJkxg9USI8WdOyvfttzU
	elTb65bmZA3vi4Vjg8DdL79jI64II5lkzwSWP0dE9Gr1otVJbJaJgxkLXQO1wnKu4BZ09z4Ofow
	rqa2lhjCfkea/jfgdBNiZqw8bRmHyhMIs4v9NLVNY=
X-Received: by 2002:a17:903:1b47:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c4111b5cbemr97182875ad.3.1781410713730;
        Sat, 13 Jun 2026 21:18:33 -0700 (PDT)
Received: from [192.168.89.2] ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm57407845ad.45.2026.06.13.21.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 21:18:33 -0700 (PDT)
Message-ID: <f34dfb84-3aaf-4094-ada7-b19e3449cdda@gmail.com>
Date: Sun, 14 Jun 2026 13:18:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/7] net: airoha: add EN7581 SOE ESP packet
 offload
To: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_211834_971163_3D7D7500 
X-CRM114-Status: GOOD (  21.77  )
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



On 6/14/26 13:00, Jihong Min wrote:
> Add Secure Offload Engine (SOE) support for the Airoha EN7581 Ethernet
> driver. SOE provides inline ESP packet offload for native ESP and NAT-T
> traffic, with the Ethernet/QDMA path used to submit packets to the SOE
> block and the PPE path used to bind eligible ESP flows. NETIF_F_GSO_ESP
> and NETIF_F_HW_ESP_TX_CSUM are intentionally left out for now and will be
> revisited separately for feasibility.
> 
> This is posted as RFC because the code was originally developed and tested
> against an OpenWrt 6.18 Airoha tree, not against the current upstream
> net-next driver. The original OpenWrt commit used as the source for this
> RFC is available at:
> https://github.com/hurryman2212/OpenW1700k-test/commit/7c1b5e662f7790b3d23ed143beadc1dcbf6d15f7
> 
> The SOE part is intentionally linked into the airoha Ethernet module
> instead of being exposed as an independent crypto or platform driver. The
> user-visible ESP offload control is a netdev capability: xfrmdev_ops and
> NETIF_F_HW_ESP live on the target netdev, and the feature can be controlled
> through the usual netdev feature path. SOE also shares the FE/QDMA/PPE
> datapath, private queues, DSA conduit handling and netdev lifetime owned by
> airoha_eth.
> 
> Patch 1 adds xdo_dev_packet_xmit() because the existing XFRM packet
> offload transmit path does not provide a hook for hardware whose ESP engine
> is reached through device-specific packet forwarding. SOE needs to consume
> the skb, add a hardware hop descriptor, steer it to a private QDMA path and
> return the final transmit status. Drivers that do not implement the
> optional callback keep the existing XFRM output behavior.
> 
> Jihong Min (7):
>   xfrm: allow packet offload drivers to own transmit
>   dt-bindings: net: airoha: add EN7581 SOE
>   arm64: dts: airoha: add EN7581 SOE node
>   net: airoha: add SOE registers and driver state
>   net: airoha: add QDMA support for SOE packets
>   net: airoha: add PPE support for SOE flows
>   net: airoha: add SOE XFRM packet offload support
> 
>  .../bindings/net/airoha,en7581-soe.yaml       |   48 +
>  MAINTAINERS                                   |    1 +
>  arch/arm64/boot/dts/airoha/en7581.dtsi        |    6 +
>  drivers/net/ethernet/airoha/Kconfig           |   13 +
>  drivers/net/ethernet/airoha/Makefile          |    1 +
>  drivers/net/ethernet/airoha/airoha_eth.c      |  668 +++++-
>  drivers/net/ethernet/airoha/airoha_eth.h      |   40 +
>  drivers/net/ethernet/airoha/airoha_ppe.c      |  606 +++++-
>  drivers/net/ethernet/airoha/airoha_regs.h     |   16 +
>  drivers/net/ethernet/airoha/airoha_soe.c      | 1896 +++++++++++++++++
>  drivers/net/ethernet/airoha/airoha_soe.h      |  126 ++
>  include/linux/netdevice.h                     |    8 +
>  include/linux/soc/airoha/airoha_offload.h     |    5 +
>  net/xfrm/xfrm_output.c                        |   11 +
>  14 files changed, 3342 insertions(+), 103 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
>  create mode 100644 drivers/net/ethernet/airoha/airoha_soe.c
>  create mode 100644 drivers/net/ethernet/airoha/airoha_soe.h
> 

I noticed, after posting this RFC, that I forgot to include the
following trailer while preparing the latest patch series:

Assisted-by: Codex:gpt-5.5

These patches were written and tested with AI assistance, although I've
reviewed the resulting code and test results. I'll include the trailer
properly in future revisions or submissions. Sorry.


Sincerely,
Jihong Min

