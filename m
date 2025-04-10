Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F152CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHyb6lhohF2wzP2TRq2BN9NjbPL3ptwOR5h1WfQqLIY=; b=V5yq0EbrkczE8VU+AzBZABOWhy
	sN455RzlZbtZQ4WVBdSNZ3lMoF9xDb+n9V/QyiHLF4BsmT0aH5QRkkW8xeU/UvT+h1hOrRheJN/C0
	wGknFCJHFTJnn+bbipbxGWB3e5+3XH5W/N6mb4fFMWRppX4kVxTkcPcXC/kJuRoptwbXQzt4o75Et
	26IWV7cotYl4c7p/heU7VSh6QJLb1JlpfBL4ByrFcvE2o80Ikq5VdUzi5COpQBt7uGLoChp1jxj1r
	r1wSZvA93UKz1wKmlwds0x7BVeqxe3nTnoCiKBpXMYNTJi4LS1kMIfSaI2S4IqEmI+1GlkzQYY7um
	SwoN6Org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nc2-00000009oM1-25nI;
	Thu, 10 Apr 2025 08:50:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2n89-00000009iMK-263O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 08:19:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22409077c06so7151895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744273164; x=1744877964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHyb6lhohF2wzP2TRq2BN9NjbPL3ptwOR5h1WfQqLIY=;
        b=Zrb6hLOVWqKNJ2/U+FXt5a8sipxBN7X0bsKSknv9TFNk1TyewM2ldWTtxz10yFrJdC
         FzLoqD2oy+dS5cIJFWbQW8MJJqID3vXRV3M+gEWsW15uwXrAIyCvFstOX7tCS+OzrBh+
         2EQlBr1I5WuMBjPCaIgzY71bDnU/BsVHZt6ZhwaIuxFX79Fa4jKzbYhLtLNu+m18S9AM
         P2Uo4ggB40XwX1xV5C/+qFYHKrYnZ7tQhFrW6byyOTExF2eFEcWqzmFVnQ9GS6sXSBC9
         ZOiR92dz897R8eNP/lrlUJ6JMpQ3/yYHAW6fN4HI5ipQgDH4Wek+fJhqCoyrg+LqjXDj
         pJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273164; x=1744877964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHyb6lhohF2wzP2TRq2BN9NjbPL3ptwOR5h1WfQqLIY=;
        b=GrO2lw0eYYJsHsdnc2ZzOuRblpHtOn5WMBGPZ5mMoiMpIzbDF0OowXxRZPWAhEzCVc
         vnhiTDsiGSADGwe+VV5CAoCTrRJbaACFepksKvV/fLg8vREupIzhfOFcDuJ3SIz4EJwA
         rpQT3p8W99nJfRQePA5IxqMEc1iBo9bISfvIvqYdwMkIZEmrpy00oNCxl5LZaCwSx2F5
         pAAoVJQD6tSG+KlqNj0HhQkbSILdO+Puws1rRHudLT5F0vrTA9h/cj4Jbs4I+4aDznWt
         cps+NN4L5RsxN/8n107PBJ0wYrQdFN8QwZlic0xTYJfqnK9sxB6FpRTrMnApVlw5CBbv
         xNXw==
X-Forwarded-Encrypted: i=1; AJvYcCWF5n67zIKlvLDB443HPqYTbbl0dIxMkXuwueA8m8r50tWIx4jNaK0uwSGY+KwmqBYhpzfAz1/3cU0FwlCdvpHD@lists.infradead.org
X-Gm-Message-State: AOJu0YySJEpZfHcvvI/Wff2ROAH9E0T4n1YLg5qepCKbOC7Iyi9YJT3i
	RUqMmBwyZ0BRfG6Nok1iR/d+v+6yZq4NKewBQIXGN4GocLUSA544
X-Gm-Gg: ASbGnctfov0M4HgilvsBvAdNpenZJ7hA9UpLR5dZmfGKQCdyQJaEghVTv2cCy78+4nl
	8rnA4PZk7ekN0aJwIPN9zd6etfOr731u/SQKPbrTNXiX4HNx0dAYPfSr1dz9hvup6mLODbIzR5W
	3WVSV3ZOwBjcmA9f9z01y48NqXutVSchh942ZOti5guludRkBkvljJWNps3ExdZXyDsRTBny2mH
	i5Bg+Gmsg0DelPBqyd63mA50mUpTECznk4zjWFlN8DCE1ArlWfB38s8hfZ+N3Z0oH43kzRK24WH
	7HlhSIJR1AdPIuNqE6zUUPRrlMz2rtrAiA==
X-Google-Smtp-Source: AGHT+IH17ATIoN+yDWaOFwQRSqTSShuXuEFiLJbcGJtyBxMLgeMII6OtBGNiFxLsRBJFPmmRKIiE9A==
X-Received: by 2002:a17:903:22c5:b0:224:24d5:f20a with SMTP id d9443c01a7336-22be03f19cbmr22298095ad.48.1744273164355;
        Thu, 10 Apr 2025 01:19:24 -0700 (PDT)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2afa9sm2669045b3a.22.2025.04.10.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:19:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:19:12 +0800
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
Message-ID: <20250410161912.0000168a@gmail.com>
In-Reply-To: <20250408081354.25881-2-boon.khai.ng@altera.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
	<20250408081354.25881-2-boon.khai.ng@altera.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_011925_541758_19A0410F 
X-CRM114-Status: GOOD (  19.70  )
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
> +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> +			     __le16 perfect_match, bool is_double)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	writel(hash, ioaddr + VLAN_HASH_TABLE);
> +
> +	value = readl(ioaddr + VLAN_TAG);
> +
> +	if (hash) {
> +		value |= VLAN_VTHM | VLAN_ETV;
> +		if (is_double) {
> +			value |= VLAN_EDVLP;
> +			value |= VLAN_ESVL;
> +			value |= VLAN_DOVLTC;

I can confirm that 802.1ad (QinQ) has been broken on stmmac for years,
and it will be so nice if this refactoring includes some fixes for QinQ

> +		}
> +
> +		writel(value, ioaddr + VLAN_TAG);
> +	} else if (perfect_match) {
> +		u32 value = VLAN_ETV;
> +
> +		if (is_double) {
> +			value |= VLAN_EDVLP;
> +			value |= VLAN_ESVL;
> +			value |= VLAN_DOVLTC;
> +		}
> +
> +		writel(value | perfect_match, ioaddr + VLAN_TAG);
> +	} else {
> +		value &= ~(VLAN_VTHM | VLAN_ETV);
> +		value &= ~(VLAN_EDVLP | VLAN_ESVL);
> +		value &= ~VLAN_DOVLTC;
> +		value &= ~VLAN_VID;
> +
> +		writel(value, ioaddr + VLAN_TAG);
> +	}
> +}
> +
> +static void vlan_enable(struct mac_device_info *hw, u32 type)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	value = readl(ioaddr + VLAN_INCL);
> +	value |= VLAN_VLTI;
> +	value |= VLAN_CSVL; /* Only use SVLAN */
> +	value &= ~VLAN_VLC;
> +	value |= (type << VLAN_VLC_SHIFT) & VLAN_VLC;
> +	writel(value, ioaddr + VLAN_INCL);
> +}
> +
> +static void vlan_rx_hw(struct mac_device_info *hw,
> +		       struct dma_desc *rx_desc, struct sk_buff *skb)
> +{
> +	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
> +		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> +
> +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);

So, as the comment above, ETH_P_8021AD or ETH_P_8021Q shall be set selectively
depend on the frame type.

> +	}
> +}


