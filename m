Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E000CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njapoqUW468MWxICa8jRinTKfR2SVCoFBRR2d+cCtuk=; b=S9sMPQS/jTlKUGDGALKVdYIeDJ
	p3dkcNLAfQeNI/fbCdFvCYAHkweGLN06M7uAzgFofYqoz2CBpC3/a0KL0PE76te7yjHgUJ97gdto/
	S3ZAIrALc+FddVx9ilBihNEeKyCppuu6HCZaysdzAT9gAjc/2Xi53rMGLHOxuvINfZuo2G6IU63hy
	Wz4wqJySaPWoOQsuM0zr2VRmuiKB2Xac609XG+LpCthYV9B206dhvhF2IPvU/pHGpjBTF1WhYbHbd
	iqtv6UHygYjiWIWnmc4XeLlzO4GGcg2xKkwrOoBH1osm+MQ3SX6IO1AmRH4cfBNlOwICn244qoNkB
	WRoSTz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCj5E-0000000BdNf-3yoj;
	Sat, 25 Oct 2025 18:33:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCj5B-0000000BdNI-3g3B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 18:33:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-475dd559a83so3442415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761417220; x=1762022020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njapoqUW468MWxICa8jRinTKfR2SVCoFBRR2d+cCtuk=;
        b=HgK6x9tza6omPYTm4tpGUzTuIipegBH4gt7Rh32vJxM0gWcwCWI5TPHgcRcW/RBebi
         AYx3JCU6UZdv+nwU0bJCri4cvxJksQcULsZuBZN3nmPVCzb3JnmAls5+PYtNZbJ5i7OB
         WGRvGoiJrjlXa1g2Wbk5zpAN9z629Qej2MHO7/qggPXTLH5WhXEFtF6SDafjEANgGDyC
         0SWRnvHHjZlXuZpBx2PanVyQZMp95ehkJfkk2MXMhAgcCLUrRT65AJESa8QZNfpNWmkr
         APicxCePNpNg/sPRbegp5HmZf1xi68I13HzyYWHu66UTI9kjcQZMqG+bZzHAvm7Bf4c+
         UtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761417220; x=1762022020;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njapoqUW468MWxICa8jRinTKfR2SVCoFBRR2d+cCtuk=;
        b=joghB7F7cEkcaVLAvjr3U5VB7MQGnB3H6UvPaTS5g9AkUy/UOjuuHeb6NQYf6t2upK
         UTGDviwuvuoJfEzQe2mWLYZDp3hFAhInkNpc3XxXFXrozK2IyBJM/M6PrkHsGF8sZXBY
         GcBq0oIhEjWeINuF5LkuUov7hRTbnYdOoqeVt4j+XaNBvm8og2f1Zx6YWLy+OT/bXwHz
         Lqw1Qvw8A72qcJhe/uTvImbTNolyBcY7e4eAQHbfEHVE4qeW0ZGf33eukD7hFawfaByY
         rBqlY1TSw8G5AI6NjGfj8F9Vjy5hlSPt75n6feAE2aH4MSWNVSxNAQhegKFzIwSG/Tdd
         b8NA==
X-Forwarded-Encrypted: i=1; AJvYcCWs5GsKLiB/B++24JIS2BA2ut55ZduqobFAwN4pVW9HD0PzOcBkSJNIbcoUv8j+wil+gctMO2C6oY9Xh+R9uHIc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0l/ceLeCFBQiDqPjIblLXShTjMh2snvnamEOjWpS+CgF8TR5W
	0sXAi0Kx4dtTAeRGqJyxMp28kv2vvvwYsKTDKP2hPu++/Xg79PimTuqU
X-Gm-Gg: ASbGncvG/Ww2qjrHk5RaidOe3fNEQ5jkHbodls1dAcCFTvJAl1UKp7aSVgez8nFViOR
	/QUAR+OIpQVMBigrr+micpSexrD5FW1suzU9Dm0XQIb78q4FKqlsAjrW08i2KV33drVAJTqHWGs
	OkH0ekCgQKkG2fbg+9YTTN7DOoZbdSrMYcZHuzJYqKtVjBVw7DNL36czNFURpBJjAzbmumwUP8G
	XyBF6dmas5fgBLwuZQ9ge+eKX2ciDUbmdGgJ67BaahomrCnAu3ThfroiKzZM+IetOfGYFpvTC1q
	3wBV/Buh/H4/HGzk8tdvE6e3kJDRxR3dUBKk7WLvm7vDcExVQBihrNZna0mS5J3Bq9aX0ZOrzDv
	xnIM5mODkWqdh3yRoui5xQoQjmtugVnRsuhicNP7fygdozhNHBErQEPtvj/45YYZdCfhCRH/Auz
	Qzqd31/mGGUnDVEE+giWLzRF4g/tH+JBGVQpli5XEklfPAldyDI9yB0jxXfqQp6W09hoZXqnWeh
	Apyq4XiCb8u1jkx0gU+l/+rG4XkfMmYqS/wLQEwCZI=
X-Google-Smtp-Source: AGHT+IG+DDe5oIMet8KWoLY/Yop7b4xsXXWiOxNNIX75KW86rgVdoPT8ZCbdmaSertyJd08nHYeHmA==
X-Received: by 2002:a05:600c:1c8b:b0:475:de80:bb2a with SMTP id 5b1f17b1804b1-475de80bc38mr21178885e9.35.1761417219771;
        Sat, 25 Oct 2025 11:33:39 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm5012085f8f.29.2025.10.25.11.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:33:39 -0700 (PDT)
Message-ID: <2d840dff-60d1-4b7c-bda8-04704fc4c81a@gmail.com>
Date: Sat, 25 Oct 2025 20:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: mdio: fix smatch warning
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
References: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Content-Language: en-US
In-Reply-To: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_113341_930377_F3FC72E5 
X-CRM114-Status: GOOD (  10.77  )
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

On 10/24/2025 9:26 PM, Heiner Kallweit wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

CI complains about the patch title, so I'll change it and send a v2.

--
pw-bot: cr

