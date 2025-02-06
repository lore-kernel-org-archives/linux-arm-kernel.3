Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438BAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=; b=cuyJMyS/RW6GZs/+21oXYw5cvs
	iVh2RbE8EWBatswEL4cn8j9uAAa6kLY5eO3hdFH0pyQsGTz4453VejwPk+Ut4LRFdID3LTziBS1Ko
	JwqzBKc7XLIxFRcVpk1sdT/MmxlT2seVaol//7zZGPtBJHREfC9BiYHglkTqc/bF201J6dSyyWnEH
	O/zA4pO23l54WR71Xg/QSwRmAVDDkw/KKQL8/Wj8ll1gXjObuO3jnwSbYjTYYrnb9VOXuKGBHXMe0
	hPfNiKPuA/sIl7KORqFTF4k6FMBWm6uZONhBColQWyQJSx9oxJMn+d4hWnev5E1wakE+eljGf7KAa
	rgcuHBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg39N-00000006dRp-3X8m;
	Thu, 06 Feb 2025 14:46:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg31b-00000006cAB-2eqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:38:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab69bba49e2so144678766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852718; x=1739457518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=;
        b=YwQENesNEFrsF9yRTG5byUGuA6lTVKSdBgY4x23nVy4hdGWaJWNgDAhq8M/udIFJzo
         Jsoiy5plnOlWv6kGguu14YmaA1CgDyjMTjs+V2TpGhugTCfVrQa2X3XC2KZz0mXVZ94Z
         Pqnwh1BY2ECgGajkyZOBrg7ChM7zCwS7SpJJZmkxvm8tWh8Ru44lZX4Ug9gMB+iuw3GQ
         h9RhJCd3onxw1kgvJgQoqBOeVsR61yHHk9H9ndiZ1Abx2VD+dyjWjgDzyhd5IUp9Lv3l
         yeKqyDmfGuX8b44w+NX02KcGDVRuPvnJS4qDg6SyhEaE2RsyUsUkrATXfIsHwFAHvUBo
         2/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852718; x=1739457518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw/h4QDTlZnL53fcJ2QvA+6Beq+Nqrk3rFi+DoZZ9Nk=;
        b=Zntf6bsup+PSYfD0wBXuuHA67z8oWE1Tath2+3XNXnygSjL0X6WxegKCdr0XW5jPBN
         PnIXUVxBhMghLn5k/A4+WMd9bZRfA+QbFy8Sn68EJXW/PH3yL0jDE3IQ0aOwywQ1l0XN
         K42f5Dy9qbwTaGkrKZKF/a8NVqMyeVgYBgSWDFhhflxntpLgjozZ9uAR17gtnCXQIDl0
         jn0IuDruwNzbXigvFF4cTilMLl/iuYMKB2dOeH8TsdWyxpfimmG53cxS6/4ALHH6o8ze
         kI6IFU42v/AL8oOmfzw4AcM+EwjnQ21ra1LgVTjdphFHXzTqIUlQIomVZJFb3aDmQRU3
         UYsw==
X-Forwarded-Encrypted: i=1; AJvYcCXD4jlz+Ahl7XiMZPr7eLX6QKngcQMHfn2FD4ruNIhMZagdWnxmRkJ6jekfCMOOvFlW1OLcbBUp+z5B64AEcn94@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOQn8s1lPwmn4KwBJmmmC4QAjftM4TNA08/DIDIK2I7DSz2fC
	1xEi4reav1ZOa3tWqB+kwUNJygGxbQrtCr1YGoPHsvr7VOi/xTWHO7+rEIGU2QQ=
X-Gm-Gg: ASbGncvukveueC3jXgJwtpUBv91YFejHMG+mNt5dJNfEsGqcwJxU3A4BJijuGvAGZHq
	4rVJbOJmXxW7K1fIVzND6HFhje4/VD9Nr+bnqACUsAemtQFU1ig/H+VMZZnZS5QhGUOiRLWDlvJ
	cSWp6rALhEkCxi15Bt+XbHEd4RURQNOk9ItemTLxYlZ/hZYgzRgioyaGPzo9Z33bmOZmxpzvx0u
	6N3e8QXhn+zNDCSW0Jq0AZoVK2/g3t4fbHmE+eKKJHezloqPx5h9TiLFzq+2e6IFDyEdWQVo47L
	7TXbYeIUIJYs2TVjZs+yLT6l2WdHWtr68zG2cg6q7rZerKQ=
X-Google-Smtp-Source: AGHT+IE870Ofos2AH3n3TMWHfx6tIRQtGQ55FfR3imiLRJSMot66fT9h5iAgoSCOr6Lm1A/3Jqz+PQ==
X-Received: by 2002:a05:6402:4486:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5dcdb762a5fmr17852032a12.24.1738852718101;
        Thu, 06 Feb 2025 06:38:38 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7196sm106659366b.89.2025.02.06.06.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:38:37 -0800 (PST)
Message-ID: <2f58633a-83a4-4128-9a1a-bd0612793bbf@blackwall.org>
Date: Thu, 6 Feb 2025 16:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 02/14] netfilter: flow: remove hw_outdev,
 out.hw_ifindex and out.hw_ifidx
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
 <20250204194921.46692-3-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-3-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063839_680332_858A7672 
X-CRM114-Status: GOOD (  11.45  )
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
> Now always info->outdev == info->hw_outdev, so the netfilter code can be
> further cleaned up by removing:
>  * hw_outdev from struct nft_forward_info
>  * out.hw_ifindex from struct nf_flow_route
>  * out.hw_ifidx from struct flow_offload_tuple
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/netfilter/nf_flow_table.h | 2 --
>  net/netfilter/nf_flow_table_core.c    | 1 -
>  net/netfilter/nf_flow_table_offload.c | 2 +-
>  net/netfilter/nft_flow_offload.c      | 4 ----
>  4 files changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


