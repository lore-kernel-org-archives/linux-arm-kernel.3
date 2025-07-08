Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9199AC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCCSM5EGfPIeP6kZ4qXJFewXUNSwRA78to6oWgtBl/o=; b=mU7e+tIdFj6qNLM4dWnz0if4qy
	BPm2wAZtl+KKB72VksSZ7odb1r0aK9IC4x5mrPrxBISOsXPuu5CJ25dT+5no4pGw4rUqNZcsNrCVV
	wM8gBnJhU0TWf9G2BDKQV3Rsf0GPj9Ha6MV2OAndVyfftcv4eDO0BnLW+zK5FiFR5IBiCHumrRzX/
	UEEhsXibGitErlmhjiCH0KuH342psyJWZJqbjpzc4oxvuduwZJu5ck+TG1WCHoVUxzqr+0pKBkn9W
	IHoMCIKwbgTxgxOAbbDFOMEXoz2CoMuAIsvca3RC6LnOnJbx+iA9d/4gI0xfRrURlVeCSd15zrDSo
	jf7K9BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6TI-00000005BuW-33RU;
	Tue, 08 Jul 2025 11:26:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6E3-000000059k8-0bsG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 11:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751973061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCCSM5EGfPIeP6kZ4qXJFewXUNSwRA78to6oWgtBl/o=;
	b=A4OXAbejDPC7LTyaBEsqAbyElZopyb5Hdwm6zg2bs3iYVmtM6tgGZfx9Wdx0t3oIgSn/tV
	PQcf/wcnfkpZjgixiY22LJAZp27kzKxOn798m/6BC1OzpM3BWx5/N2ZYbRcxYwH3SPqgct
	5A2dMWJdSwZ6akddV/Y/CPHyMRe3RTI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-_dTFefg-MsmwEJ3kKXjC9A-1; Tue, 08 Jul 2025 07:10:58 -0400
X-MC-Unique: _dTFefg-MsmwEJ3kKXjC9A-1
X-Mimecast-MFC-AGG-ID: _dTFefg-MsmwEJ3kKXjC9A_1751973057
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so23845505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 04:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973057; x=1752577857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCCSM5EGfPIeP6kZ4qXJFewXUNSwRA78to6oWgtBl/o=;
        b=okDRMchAetuwqwyPX5VZgDRfP2V23u1b77CkBqwcDGtOowtUVNmd6FsH+RskFAWXLN
         W0TgIvZ8zzkDQrKY48mwhvHUTDjGhxC9icsn7hyDRCutv/PArG+5GTZoXX8dzBXAsA1x
         7c7iCyxo0+/mtjSqIcSVw9zRQyoK4Vt3QfBiO2POhl3pKGPmtw6d12AKKhGUEW3mNiiV
         ofEFAML+xK5KqB9L+SK9mOaQfHLXJYbAPL2qCDvjGtHHzJ8wpItva+5b00ogDBUH99/S
         EERDBqc7u8Ew/cB4FfWaRLa9qndFk46iVGN8zMpmzGrFoUDxgjlB3prZviKpeyeLtP/T
         8mJA==
X-Forwarded-Encrypted: i=1; AJvYcCUwmelz0r/ZWmaABVvYJJDHIfALfy0608At+44Vv2FXQo4lyrPBxgiZimPSYmYUwD1RIfdFiBQIOjmntqFUV2Ey@lists.infradead.org
X-Gm-Message-State: AOJu0YxWS7De33vxZtjruYJr4UVX54MWkEwRg/WDB+7axvC4SUNOciD/
	S0u4pDAgGM3wFmYodzDcnOohKWcM+RwTXBUUPjlcqTdoLU/usF2dTn+4sJM8qMHTPOIwcZLkyuj
	poI1S9xPA7zuom0zVI3SWqj7PVxPbF48Y/Y1K438OoWGgbKKcew9n4M15RgYVrhQ0Ex6VsZDeg0
	qh
X-Gm-Gg: ASbGncuGqAPA4zJGFO1zXrbfyXcYQo8MJcokJHcKrdTVsODPiMICTZEqoZ7JIu6N5He
	1j567khYE9mGqr1o2xs66V2g/S8IkhCCvAMRItTlDS98kGdeoXtqEFrL5hNzrRBZsZgBj4qXFxf
	te04On6X0P5uOuq/ydl/x/A+JfGpHAqQnJvYVwmmhouR2M3toYaPrdTbWTeQ0ysseBljsCQp5fJ
	8GCjdVCVdhhOxfpDTC3lrs0RJcXG0kyNmBIQ5jOVLT6HX7RmD74TEjElxRvPZ6Mf2FDNT18CNpc
	JN8A2x084khZvpUokjZguW5Jt7wuC8ZrsT/vi4KdhHk6JJhzn/gvJUTwFKeltxM2YpcGWA==
X-Received: by 2002:a05:600c:1d8d:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-454ccc7ffc5mr42390575e9.10.1751973056826;
        Tue, 08 Jul 2025 04:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaNulokkynI0xWQ9J9Q5uhDXLP6/QZtP79j6yK8Ti/Akkv8f7oR/DstuNuGnFQRRxDD3e+uQ==
X-Received: by 2002:a05:600c:1d8d:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-454ccc7ffc5mr42389995e9.10.1751973056363;
        Tue, 08 Jul 2025 04:10:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd3dd1aasm18697345e9.39.2025.07.08.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:10:55 -0700 (PDT)
Message-ID: <617d064e-99e4-491c-8fe7-d74d8174d9fb@redhat.com>
Date: Tue, 8 Jul 2025 13:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 04/12] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e3aZNZg2taJoQ96hgGPEiEHo9oSycPE59Vy_Mc1AVDI_1751973057
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_041103_263396_EF37FA77 
X-CRM114-Status: GOOD (  13.77  )
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

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> Changes for v14:
> - Increase the maximal received frame size to 1536 (for VLAN)
> - Use spin_{un}lock_irq{save|restore} when altering dynamic table of the
>   switch and mtip_adjust_link() as both cannot be done when switch IRQ is
>   potentially enabled

Why?

 (the previous one alters entries in switching table
>   the latter one may reset the whole IP block)

What really matters is the scope (process/atomic, bh, hardirq) of the
relevant callers (the functions that do acquire the given locks).


> +/* dynamicms MAC address table learn and migration */
> +static void
> +mtip_atable_dynamicms_learn_migration(struct switch_enet_private *fep,
> +				      int curr_time, unsigned char *mac,
> +				      u8 *rx_port)
> +{
> +	u8 port = MTIP_PORT_FORWARDING_INIT;
> +	struct mtip_port_info *port_info;
> +	u32 rx_mac_lo = 0, rx_mac_hi = 0;
> +	unsigned long flags;
> +	int index;
> +
> +	spin_lock_irqsave(&fep->learn_lock, flags);

If the _irqsave() part is needed (and I don't see why??!) than all the
other `learn_lock` users should also use such variant, unless already in
hardirq scope.

[...]
> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change = 0, idx;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

Same here.

/P


