Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA54D6DDE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFKvh8X0eWRG0GFEe/XAbitN4YrNcuJmHBxKKcIml5E=; b=3EE6lba4ThAPCH7Cqj30Iwd6m4
	iOR9GTOGU3FixC0BHwBXq3sTSrpWSwvooCPdpn/u4j15StpJlb0uM5rOd81yg03lv6qmNP7rsW1MS
	lQAXzHunLyZ80NUUZggblqo1+LVy4RsESo2JUYLuivLQlkGUCgYCrzXJmf3Sw7/HoOZS9W3pYqR35
	Fc+OPwLX3moux6rWqEWLRlI8UiJBGhcN+xZxcvwOFqFvMks9VGSjkRKj+jDS1AxVgzDHTJjdEpHky
	t/0I792hWAXtV3hwZ+AYSdIt9deKS1Q5hBxh8ooeaELKvT6OZOEaEiNAeCJQmoIHxhB1Jgv/8XlnO
	V+CUCh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwbA-00000002s0z-0mwh;
	Fri, 15 Nov 2024 13:42:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwaE-00000002rp4-27DR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:41:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so221941666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 05:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731678116; x=1732282916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DFKvh8X0eWRG0GFEe/XAbitN4YrNcuJmHBxKKcIml5E=;
        b=eR9FfUL0OfciFt/d3l9Ttv2eonYTVbvcFJmJGLHnHBeMpDtETuTmhyLUAjJ6cxvP3E
         f6yWUz6h9wqMNgUNUDWZHzIeInVuA0dPzD/ozCeWp6ypw7VO5F2NHleLcH0u12Hn1oQA
         /M9kQApNgr3oNuE1avX+ApriLB/SD6YBpWUEHo3sOQzB1X5QXAbaL/fQDE0jZvPesUts
         PJrsE8CTtvdbGWNncmEch3oO9XIvOij41U1GgfNYJYPcOwpseTCCcMViQnlItcFPQ6PP
         VEwTzXRmDs/iAMXNCd/SA4hlZVptnac8/tUNvJRueP12xN1P1dP9wY4R6O0BjGSeEs8f
         OS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678116; x=1732282916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFKvh8X0eWRG0GFEe/XAbitN4YrNcuJmHBxKKcIml5E=;
        b=sUsvcUsfCDs16hqqqK/5tiedjirVkatUw4hPoD1Plhg8YbLbyltuEgxQQYfV//Wxzd
         ZGAZRFMv+C1UuY49qrd75BLkin9FVwU7qmZmqnk5u9w7igPcPJb+Xbq4ctav0eECC7rK
         p0OaSIKiSdXlTMCLehIDp5xvIKkfwypeMWmx8UzZ9V/ZyNZBCE8kiwJcbssZTAv5xNGu
         JFgkg2XDQPmuhE+HEkijMZVrCQI17rXB6rQhc5OYbfeawTau6Hn+6+U3sDJLn+CoU/4l
         9IFM7mKQuzfsvqruaqPHfpdHbNY9Uhxbi2iuCon0h81wscgXeu+cTKllenkjGq0H0COU
         C3gg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2h5BTG4/Xiq70gTGeta5ygEwkE6khAvxgDREVelrY/SEpYrSIZBakL1n2xaWSfK4OpmU1iej0OwJ0N7jcEbN@lists.infradead.org
X-Gm-Message-State: AOJu0YyWLK1bDnkh43eCU+FqUL63g5B4qfqqIkDDEe5Yjxg/IzdSRt1P
	qWRyDtcCRAHqyVUowb0+fgtlS3+oob+6ZzMeY54FxQgLAliEZMzA
X-Google-Smtp-Source: AGHT+IEoHu0EWFGsk5B5nmRU8tr0m7Q8f4H38YW4o1/LtZol1g9TFT30zrsCH3v5q410wB/tfXRjMg==
X-Received: by 2002:a17:907:9802:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-aa483421c64mr246131566b.20.1731678116100;
        Fri, 15 Nov 2024 05:41:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:b259:e900:7566:ab7c:4e9b:5c72? (dynamic-2a02-3100-b259-e900-7566-ab7c-4e9b-5c72.310.pool.telefonica.de. [2a02:3100:b259:e900:7566:ab7c:4e9b:5c72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20dfffc00sm183182066b.101.2024.11.15.05.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 05:41:54 -0800 (PST)
Message-ID: <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
Date: Fri, 15 Nov 2024 14:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_054158_548919_805D953F 
X-CRM114-Status: GOOD (  17.19  )
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

On 15.11.2024 12:11, Choong Yong Liang wrote:
> From: Choong Yong Liang <yong.liang.choong@intel.com>
> 
> When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
> the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
> the driver side is disabled. If we try to enable EEE through
> 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
> matches the setting required to enable EEE in ethnl_set_eee().
> 
> This patch series will remove phydev->eee_enabled and replace it with
> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
> will follow the master configuration to have software and hardware in sync,
> allowing 'ethtool --show-eee' to display the correct value during the
> initial stage.
> 
> v2 changes:
>  - Implement the prototype suggested by Russell
>  - Check EEE before calling phy_support_eee()
> 
> Thanks to Russell for the proposed prototype in [1].
> 
> Reference:
> [1] https://patchwork.kernel.org/comment/26121323/
> 
> Choong Yong Liang (2):
>   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
>   net: stmmac: set initial EEE policy configuration
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
>  drivers/net/phy/phy-c45.c                         | 11 +++++------
>  drivers/net/phy/phy_device.c                      |  6 +++---
>  include/linux/phy.h                               |  5 ++---
>  4 files changed, 13 insertions(+), 12 deletions(-)
> 

Russell submitted the proposed patch already:
https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
So there's no need for your patch 1.


