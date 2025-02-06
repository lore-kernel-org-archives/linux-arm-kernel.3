Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24DCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGl8f7Yf7qIHwGS9qrFDj3Wy7/eEHYp4eEWPnG5nI64=; b=j5935UuO5FasqzzPS5aMWVJaoa
	/jP1NaOrx43155skHBLA2QelmN2/XSA3lrgS4IoFHV6CiQd5g0n7RWJjeMNuGr47m6ct+m+LHNA7x
	mH9sL6ePTcJsSApDkBf43ZJj1MrPYPBXiGuxE95qa5R/9jbJ+z67XguhCMHBLejNjCE3Y/HGz6Gcp
	GOLcPU3a51hk20JPFL6WQmyWQJ057pzABTIE23SJK/Zu/Y9BJKgN/VokpU+Q2AStPufTk6xIBcV3m
	VRi1wIsMC5la6xK6MLkUfeB5M5CfXNAfkGVVUGJEjYYYRxXONBO9XRg41bqWNgnOAEzvMiHreZr37
	XSKKEngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg382-00000006dEa-1Qol;
	Thu, 06 Feb 2025 14:45:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg31J-00000006c4u-27jA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:38:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dce4a5d8a0so1695801a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852700; x=1739457500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGl8f7Yf7qIHwGS9qrFDj3Wy7/eEHYp4eEWPnG5nI64=;
        b=pUPuwHgvQ8hTkqeTZn2DKV+yrYa0rSM49TBvXKZB6TbJ6MeiZG7XhERkULah8vH+lc
         nIGNsZoxkdxD/BwhO9bdwzs/l//a324t9fTAzsXT4CWqzERvFJbVe2AAfdQP6SmVFF8y
         kx4k2JYmtYVyUx/tYN5o0DjzeBAJpZ9yPGLmO4GSNn4dxpoh41+K7Dccc7yKs3dNFmtK
         PMj9REl6TT8/SJtf5yM7xNhx4PFx6BZSK/bzR7M1ko6RQSn8W0ALzVe3fzYyl2wyDSVb
         SSyhnP7uFZBkvxYEcGZAc1gDgSIjjwtq1aCxblzVmrOy9hNUY9e938E5sg4ipG+8wEIG
         cRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852700; x=1739457500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGl8f7Yf7qIHwGS9qrFDj3Wy7/eEHYp4eEWPnG5nI64=;
        b=lz2FszRHnjNl1Vx9ik0pkJexEl8o1JDS1+Oj+ocE2+lAsLOc3xe2H5zFcVC5D5jQTg
         Y/N/rfkgZdr8HAmTk3HSfB2DbWYhJM+Zbz8WMcwmu3KR6ID9tIy/qgu+MDPlNhydZdtH
         E/58bwRh4Sivlgutq4vuN4hPoYof1+ERmOvPnL0xU6UfWLi0ZqwGKKzNnQBSxgC/n7Zn
         FYI5JC15/d5sC54lXZC2FsopNYDpXvI32xeEgwrEen8q58SJ/XBK9vnYu7dItYobGzuN
         ZMveE1ZzW556tvVOTjxSt/6NPsY+pYZGXboE3aeB4kn1c/GkXDVsm4Bt9IIuipuqIVlR
         jkDw==
X-Forwarded-Encrypted: i=1; AJvYcCURq8/q1oVc7db8f7H1RIIr+MwXi1BED4wDDiFYpqSudFBWiAZRjPhtkw52/8Sy8WSQcmxOtYGNagB2/ShCE4wm@lists.infradead.org
X-Gm-Message-State: AOJu0YwbgrYc5ox6qHX/CLdm+TD3qWSE8/c126uONXkvIMDBvi7noyd+
	VpvZiQCE7beQbu7EU6B3ePnUBeaDol5Y6BIHus2g7b3vJW1iamDk6F5hxYjPbA4=
X-Gm-Gg: ASbGncvlIlVHaluG8+r+46SOCO9dsdPYIC8CDdzOw2jy5gO9R1Seectox1gcTpR+iAx
	Do9WkKwbjM8/DHqdcUG5+thzMhu1hNU8Kev/XU1sa38WoXuup33bTwMbTFmFz502OhrawY1Zdcc
	QaqSzwk1GFbL/ecgubnHnYcCDHm0L0QeSDH+cagVhZ8SXyDe26i8NTa1Jz4bjUf28GLQRrC6Oro
	htRrYGbskl4LvGASrwgv8ii68z3tGtC2sVBoEblNWtGzIN76T78xbsHwZG7SOmSUgZ2v9eLc26Q
	Zg3i0ROOuzJ4y2DqxyfbdoF69jrYTu5zqAy2whw9JWXMDkk=
X-Google-Smtp-Source: AGHT+IHtlKzpr7zCul0guNkxORZKS7E5zmeQUNtvu4QsPr2PA2enKb+nYgF0UWob2xBe5euOje74bg==
X-Received: by 2002:a05:6402:35c8:b0:5dc:89e0:8ea5 with SMTP id 4fb4d7f45d1cf-5dcdb6f9f8cmr18518934a12.3.1738852700066;
        Thu, 06 Feb 2025 06:38:20 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7120sm108661666b.91.2025.02.06.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:38:19 -0800 (PST)
Message-ID: <568586b4-aeb4-43b8-b645-a2a0517e3fc7@blackwall.org>
Date: Thu, 6 Feb 2025 16:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 01/14] netfilter: nf_flow_table_offload: Add
 nf_flow_encap_push() for xmit direct
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
 <20250204194921.46692-2-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-2-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063821_550988_246749DF 
X-CRM114-Status: GOOD (  15.40  )
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
> Loosely based on wenxu's patches:
> 
> "nf_flow_table_offload: offload the vlan/PPPoE encap in the flowtable".
> 
> Fixed double vlan and pppoe packets, almost entirely rewriting the patch.
> 
> After this patch, it is possible to transmit packets in the fastpath with
> outgoing encaps, without using vlan- and/or pppoe-devices.
> 
> This makes it possible to use more different kinds of network setups.
> For example, when bridge tagging is used to egress vlan tagged
> packets using the forward fastpath. Another example is passing 802.1q
> tagged packets through a bridge using the bridge fastpath.
> 
> This also makes the software fastpath process more similar to the
> hardware offloaded fastpath process, where encaps are also pushed.
> 
> After applying this patch, always info->outdev = info->hw_outdev,
> so the netfilter code can be further cleaned up by removing:
>  * hw_outdev from struct nft_forward_info
>  * out.hw_ifindex from struct nf_flow_route
>  * out.hw_ifidx from struct flow_offload_tuple
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nf_flow_table_ip.c | 96 +++++++++++++++++++++++++++++++-
>  net/netfilter/nft_flow_offload.c |  6 +-
>  2 files changed, 96 insertions(+), 6 deletions(-)
> 

Too bad the existing vlan push helpers can't be used. :)
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


