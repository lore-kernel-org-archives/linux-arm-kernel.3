Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=; b=ENJexT4OBLK+OqFZ9uZEiSxDm1
	cHX9lw1OM48zOBaHkrjg1LIT7TMW0Gd4zfAhkbY/pQQjXAb8pxzdOP00lMbo5k1tFgBi7acveCjYi
	ITwyeXT97R3uH/V9Px3TzD9Yp9plDvF3Z5/gbwGhkFr/qyCpwZ53fpqs0/nLHJThnOH+KDqQ8F8Wt
	nayq4o3vk2sPT9dSkzTot6UFwkrF7JJVQ8rAJUtZhmEslo7e5asKzcE92L52zWHM5EiFMq4U3R+CV
	pvPuPH+Z1LP5oa37NnJBvfcPdCfQO8FQGStmnxFjXuAAgn+UNuNxT2aNS7RCoQMXuLmZJT2lcCreu
	sRGdkOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4NJ-00000005qUX-2qf2;
	Tue, 24 Jun 2025 14:11:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3pv-00000005jcF-2tE9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750772238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
	b=OPMs8F7P1T6v4wCdjkwO5SfvwGN3yIH0lzpYp1mmQfDItwITb5bpKMtYgda9Geh7jzZkeQ
	fArzNxj3oNXvyHc2MUSUItJSf2vuhY0Ej7n8TarEx/sxF/AHBKiOHE2W1UEDhiAH/oNUPZ
	O6esktLg7gPsP23+i0XhdUROlDcIrQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-9BdYs7HjPgG64meJPpIarQ-1; Tue, 24 Jun 2025 09:37:17 -0400
X-MC-Unique: 9BdYs7HjPgG64meJPpIarQ-1
X-Mimecast-MFC-AGG-ID: 9BdYs7HjPgG64meJPpIarQ_1750772236
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530c186394so24001845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772236; x=1751377036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
        b=P2RNfXEN/zSKX/6Q05krrLzL/2UB7ZHzlMI2oM4QDFrJcOj7DmdKwpidR76od2FZdS
         LZNDzLZtHg92NOK5OU2ugsTlON1g6bBue/VPHOwu2B+FVAAPTbrJNdiMfvOqj2ARFMWk
         mQPDUELrDp7lo6XxkdNR3zuTkPRCJkrF0YnXz0CCUEUw/nQrgwi8U1qJWte5hEg0WOtu
         0rHptNXYwwIGObM3E+8xcsQsWpljETrkh2jy3OmEO0jW+vqqBlGRMuQwdDriqpNzT6BC
         0SCTAsul/KmTPe/dAZkyWHFKrXkiplmNUsFxOgb/+m85GpeJxj84UcP82hWq/aCY1FqR
         wyZw==
X-Forwarded-Encrypted: i=1; AJvYcCWYNgQnSqTCVYsgzIfp4MSf88XAVPQJ7p5ZSnXCRxqIVvd1ACn5lFkLL7U/X2UZh2w+BEgjyFGOmqm3VPLMs2lK@lists.infradead.org
X-Gm-Message-State: AOJu0YwTrpUtb1N2YByhAKE8H2KZyAv/8yP4AcTC7uzcnsLcgqhKx4e7
	iTMa8ER1RzS3h6RiqBbELnhU7HUETMkeCWvFX70f0mMGD3Ak1wwR1ZnUjUnbEd9h+V7bZk7SfcK
	BFbJQjfkv9/I4hZmz+f3BkBCUP2a/EHkgQhfn0H7p9kLQdo6kgYQXQ0Y8pN9DbXqXqlcte4aAuO
	Yq
X-Gm-Gg: ASbGncsG0wTc/CVfD55Th/+r5LvkMV4KaZbog9pe0ZoZS0o7phKCeOIiRqdFaNODMw9
	os8OvhO8q4b0x3/YOe28pXZkRGEGLf00x5Ej/h+ISsqQFmQ3rLbsqSK08qcFXlnWtL3WHcciC7k
	bUpzJCUs/XsRz7HxPMebIXa8/jXBYZ2FUEVgLSIOFi4JmShp0BG8W5RsepKeHDUDF+mwvU5xgBX
	lGqgP9gu0X/GGw35GbJdcDPOLePG+luX6YFc8z4o+3ZogV/yfRfqLcNJ53GyLu0vKOdsH4u3zkl
	l5OpnkRVO1kP6d4wy6QsfDhrmIvkAQ==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056605e9.10.1750772236037;
        Tue, 24 Jun 2025 06:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDctwjBQaSlAXYgDwmWAr33weRLLnC8b8hgrnzKmiQvzZklRmZK8SJHQ3VS2Chx7RMg6ong==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056295e9.10.1750772235622;
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd589sm142741035e9.26.2025.06.24.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Message-ID: <17f789c6-cf64-4940-ac7b-0107b7b96031@redhat.com>
Date: Tue, 24 Jun 2025 15:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
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
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOW_NOVW1wvJ4iqjau078s7r2jx2y-OaDdIXzjb8990_1750772236
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_063719_798536_0B4B75BB 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change = 0, idx;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

The above kind of lock look incorrect. In later patch you use
spin_lock_bh(), and the context here is never irq.

Should be spin_lock_bh()

/P


