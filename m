Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEE2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=; b=syNdEGZBacO8DK4WTcTT8u2VfP
	ReJ34Ls8JOffr6ffIdMKBMiq8AZ69ZnjRsP+xNuKmEggzmmc4jtRVRESeIv1YEil4daSfxGgCFzrZ
	3+Xuayt8RQjKv4qB0WOuW1TCsVMCb2NSfE3zJ1MEpTSxd/16MAdtYew7L+A9r7TgsNJ1G+R7KNUyh
	E+nzXifeLLzZGRXMW3yMfnNhW8yXrFozqPO4l9/zTwhTzgsAxOgWSMyA+c3x05/jjaX+WlHA7YaIJ
	zzK/ENMZz1/SBJeXY6LwJUO/FnxucD1p9/LAsSX02iS4pD8ctflF3FpW43B4T3V5M5/9WtPFwYyot
	r03BLllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeRb-00000009U4L-40j1;
	Mon, 26 May 2025 20:29:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJePP-00000009TvH-0mjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 20:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748291213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
	b=jJdjlQOrZMc6VIvq3OVLaypup/+U4vY4/Tu9aattgruQyCYTM0vrgKC27u0HrUjQuxzvTd
	NCXVhXUjV7B+hsRxBxIi5layaWBS4ttkHE84yazvfpSP+POc0HwnWGHlVBMff06KZeXx1v
	OxBYi3/D/OlGIhSEVzw2PVMN+iNZ4w0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-H6e98EF-P5Sr3t316Sujtw-1; Mon, 26 May 2025 16:26:52 -0400
X-MC-Unique: H6e98EF-P5Sr3t316Sujtw-1
X-Mimecast-MFC-AGG-ID: H6e98EF-P5Sr3t316Sujtw_1748291211
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44b1f5b8e9dso9496165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 13:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748291211; x=1748896011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
        b=GtBaGluDuq2goJ10x8JCF88iuWSSKHKlEvkjQ6eXK3DzlRbbxAgo0YQpvVsXR1Te5M
         rrage0bLkeu940Al2ER6jz2NQIGInNtEp+VgS1//2FpUDKH/5vyISuQTK6LctQZf54TL
         3Nn09yiKoPUX8Du7LOtPdnDDMxjIlGDeAQDj4+jpOQr8aNA73yGiEPwnvTkd9O7RRny5
         woY39yUIoIzqUnF2sx0xCaBkSe12Uv0b/iNm+CbjZ1xCVvVk0/Gu3uM7cbMiuZeSRuIl
         RSNZqWvr+QfvUcB/Z2m8q/4Oiv/UF9cWc+HxM8AQmFeR2ZZMa2GuLZR5+qWMX1tTs1nB
         OySA==
X-Forwarded-Encrypted: i=1; AJvYcCXB6bCkbggLuc73jpnoZEMLQjRXVt0tPAcVOJAvZlpW0K3BsvLYtloY9NbN9KjZjeCqyhhjiLD8Mw4ScnBCb7fF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Ka9Ak0/bo28zlNXlReWHLz6ZRaM7OaTnuwCcYCWNLPp2/9Ob
	YMpCeBvFcDDg+dd0pp1yzB4K+Hx6iHFjFiWColcmWRupLooGC53W89bGwJuRlR3GJgDuF3XhquC
	P6yMXhnyERpS7AivnHGlK6M/JPc0FJHLjwvaFWOAFJijkvfmQ9gFtCG1wpKd4f/RcmznuVMPO4z
	Je
X-Gm-Gg: ASbGncsgBdfssYTDqdRW0g21irfI5AwXyAKRStTG7TKx4FmrBfOSdqnvyINtRQnZyn6
	NlBCS7eBAlPwkfzi2wGAqKRz9ysqLG9GeyjW0m9hF5IcIE4tBAKlH4h8Yj3CuvP+TfW/rwi71Wg
	0dBx9AulTHzZFwk165+AOI4ALhzC3u2J+rDKixlrAv4tHGn6dMZjrE7I3CbD6Rjk7MjHUq9izRx
	tT5aytUQ+frV2TdCBY3F9iwZHRMGXB1s9m2xvFoLyCYpDRWpR8fIveljF3onJx4KzLRz9Ln+J/G
	2r6fJti9plcVDmV1DQIMOL+xKjYEumBvoQWeowEx
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-44c93016686mr92837515e9.6.1748291211233;
        Mon, 26 May 2025 13:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSrD54L0gvE46Mtr1bEDCW7JZuh1RueZXOjVf2VgxDZDxuwPNbxQGifhSFMWHJcVtKTkfH2g==
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-44c93016686mr92837385e9.6.1748291210810;
        Mon, 26 May 2025 13:26:50 -0700 (PDT)
Received: from [192.168.0.115] (146-241-32-247.dyn.eolo.it. [146.241.32.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cfcece9dsm7354854f8f.5.2025.05.26.13.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:26:50 -0700 (PDT)
Message-ID: <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
Date: Mon, 26 May 2025 22:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: platform: guarantee uniqueness of bus_id
To: Quentin Schulz <foss+kernel@0leil.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HlqZHiIjKIMz20OmUK6lh-Ay4DIV7O4Hk2gD6G3TbEw_1748291211
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_132655_312099_0CE375EA 
X-CRM114-Status: GOOD (  17.28  )
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

On 5/21/25 5:21 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> This is an issue because the bus_id is used to generate the mdio bus id
> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> stmmac_mdio_register) and this needs to be unique.
> 
> This allows to avoid needing to define ethernet aliases for devices with
> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
> stmmac devices to probe properly.
> 
> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
> alias is set for the device but that is easily fixed by simply adding an
> alias if this is desired.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

I think no need to CC stable here, but you need to provide a suitable
fixes tag, thanks!

Paolo


