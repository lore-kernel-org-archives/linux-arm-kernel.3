Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A54C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=; b=RJkU0bcCgBYO+CKFUObxKy6Tpl
	mtvjUVAR2xWGzMxzmh/l+oBgVhh3mKZUAq5uO9e+0H0N6jBcdadEuBwEPuP7HTUvhhn3oavaiEE0N
	REizdc80MLwO2cNIV0kV3VeV2i8PjSrwtj0Z2SBSxzNnAEEYJn3gcAvAvbBIPx+Rq3kwj/aFxAqy/
	GSjCDW6EQfQQdjtBSGX8p/pkMNQgAMrluL6sbQXdaGwDPNafwmpwZ+cVjNtXQ6DrZ5tHagt8jcO2W
	+XguTDyl/Sj1K9CqIKChmkcgQsDsfsZXXKcfsf/JIqoy/tGiB03NQY1zVjbv0gOHYB3JaB1YOm7ut
	RzAYVUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2uD-00000006aZa-1smf;
	Thu, 06 Feb 2025 14:31:01 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2lX-00000006YRz-37yz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:22:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dc75f98188so1789399a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851722; x=1739456522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=dQHCfSeXd3Cq7MyEmSl+4BXco82f1utsexiOCeDqwrygGc5qLYFZTuy83xKjGtIcUG
         L6YUlW4K1mz7H2gi1sMOmCHCnHdGAwgafUev/O8nqSsGLEfR75Me1GHW004O6l1LITVx
         DC3tVWEmXDcjow5IX87U+UjBGidsPan2EYrtzIiRggyg7cOLsPzjCYrtGs9Wm2LcOq0u
         yEqKhb8y137ml//cxJcuNxB4xMUikMmho8IRYuAQMqD+UQ8y8F+mreqsiAL3cdWcgMpa
         m05PaMJymiejk+ukGL24MV0hpCnNKKKAI+gj9ja9SPDMrBUSpqjpRpf6bis8RkDAIdQI
         p17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851722; x=1739456522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=T6zrCTOEcnK1IWYgf4rCxgJ7PYiO1ZCtXs1XLzoUA6p0AkvrPCY/NJdSAa0h/VjMvw
         Qh8ub+ge7u08yDp43Dwx80qVxkYnxXzIevLxEhuVpcmXI9AHPb993ENPpj9384d0v6Z/
         sGb49dklswUhHe9GV3lY24KIwmR3yu+cZIsrFT8m9UyEeom/Kes4rbVqZq3EA+m9x5ot
         si0qhSBLosMmRn+3PPAJt7klcUt9NL5UGmrp727bQ8UjQbxCNiGtvpANbLFf3c9ZehbN
         tzxp1lI3XF5XXZQ+kbjfrEN/exrsV6MQoyZ2pbr2DhS1F1jmgACwfvpSD7iW8JZqWIeq
         cELA==
X-Forwarded-Encrypted: i=1; AJvYcCW4W3yONvjG4AiOew0ldmRnhm760/u0T+GmP3tRFEFW8cnx8vxERnAEBExbPfxzMj48eqpi7rMaiV3imrgHFDdU@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ548ONa6YGwWZ7ZSP3Gg6sJRsOqERl6jKySKTSxSj1nApveLg
	0gTWOp79k2DbFE0fYgkm5IfFHU00gvpo6YT/g9KWKAh+Pve9gm9witeGTm19fO4=
X-Gm-Gg: ASbGncuFz7jmrrvbm5HGjaHUPUTQWbKdRj5Guifx0OE9mlorZlCELyzpHwQMoMudAAs
	om6JqH6iHeZLEGOySO7w5yQ2tqvFtuHcqmMnakRfSzslqzwZdrcOvpelwdXjzcJDkKnpHhWgKbD
	1T7Ex1hPNUUyT5yjmon15/gZzvD+0b/8AgfRHGX96p4+tQjf0vhf6C5l76sjoms3Xjkm54v6j8s
	4Hh6y/ZuWA4k4nVBHxIkXkpPoaExDLYlMw2mK7UIjLDTg8OD8Q4BHJhl0KmEEBPDxiRnBsfcXJX
	lowiigSTualOfyxT1aNGIn93wKRcfqH1Trh/gOYrSQWK6WI=
X-Google-Smtp-Source: AGHT+IEe7WdSsNkjgnty/HyvHskjlhljY6wt44W4IMiUaDBB3MI2H2nfwFKZUIVfpj7A/eSHa7SXrA==
X-Received: by 2002:a05:6402:4486:b0:5db:f423:19b9 with SMTP id 4fb4d7f45d1cf-5dcdb72958cmr8121194a12.16.1738851721184;
        Thu, 06 Feb 2025 06:22:01 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b85a3fsm941354a12.46.2025.02.06.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:22:00 -0800 (PST)
Message-ID: <cd2926cf-b32b-4de7-851e-97a3ce2118af@blackwall.org>
Date: Thu, 6 Feb 2025 16:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-13-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-13-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062203_787721_2952E42F 
X-CRM114-Status: GOOD (  18.17  )
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

On 2/4/25 21:49, Eric Woudstra wrote:
> In network setup as below:
> 
>              fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    |               +---------------+
> |    |               |  DSA-SWITCH   |
> |    |    vlan 1     |               |
> |    |      to       |               |
> |    |   untagged    1     vlan 1    |
> |    +---------------+---------------+
> .         /                   \
>  ----->wlan1                 lan0
>        .                       .
>        .                       ^
>        ^                     vlan 1 tagged packets
>      untagged packets
> 
> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> filling in from brlan.1 towards wlan1. But it should be set to
> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> is not correct. The dsa switchdev adds it as a foreign port.
> 
> The same problem for all foreignly added dsa vlans on the bridge.
> 
> First add the vlan, trying only native devices.
> If this fails, we know this may be a vlan from a foreign device.
> 
> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
> is set only when there if no foreign device involved.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/switchdev.h   |  1 +
>  net/bridge/br_private.h   | 10 ++++++++++
>  net/bridge/br_switchdev.c | 15 +++++++++++++++
>  net/bridge/br_vlan.c      |  7 ++++++-
>  net/switchdev/switchdev.c |  2 +-
>  5 files changed, 33 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


