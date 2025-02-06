Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2C3C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=; b=u24xZXCHASKUYYnuYl4rNyNqNN
	t5IGtL0Pxx6bO9lgCOSIXOLVmfBwfnZLQMybTLzYtRoIcwBhhP7Zi4Nzj/ThgMr7V4pAsSILaQbW/
	aRAymJxnYSVUzQpa5fV3OFRifDWssZzKKPMiepajX45h1x5COCxSRNQxx5IHoCxeis84pfvMVh3ig
	QwuoVqXyLDwBfnVzFmkbh5crktjRpe4mtAshaGMAe5U+e4N3DK3rz/vJkcp7a457mDi8OjoGiVeow
	5xMOVbIWvuPMbQDeC0rtXx1WLno4DIjVvNoWEhzVnLsAq0n2T5exOnWCjp2mZbIbN/XLTYI6qGRgu
	LpaBSjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3DQ-00000006e6p-0VOC;
	Thu, 06 Feb 2025 14:50:52 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg32d-00000006cNX-1dqR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:39:44 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so196402366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852782; x=1739457582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=rjPebRG8YpinCDjqqcF3BLneuf9nSJUi3D4tJ8/L11MTudfdmSKhTYFrMKF9jGBzDz
         w3F1QbntJGKkovNAuvep1lOKjR5iVjvgF5FMY26bm01Nw16u299SaFvMUI4mo2QjV3Im
         3SP5dMqf7C7SNIe96+gH9Mge8c6TAAtD7GiUmp405JP09rHqAONrnNJI7V18FE7xuM3M
         2ND/joaLDj9OFP7dnePlw3uzATMn0rieuYV44ESjOHW5Nh+WNmEDmVQRpescKQqAFsMH
         9u4+EvKEor5L9iHuZhx3ErXypqgSTQMuNqFz+2y3REnRNDC6ve2FqU4xZzY5UZmfXzBf
         Tqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852782; x=1739457582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=wh2qBBrxiWbQWujPc6fnT9E7NHqTIzetLC7RH5XAVR6gt4Z+fGHivd/LHcOAcR2QGj
         3t69ZPhbsT+C3wJcIJtAUxvs5H1vZIJF8dlapZfeqDyn9CqI44mhWRXzlaGUQWHhSslR
         SBLrFoqYMwsiu3LrGZAUGTt3Nc7lrSWaS7R4LVpJJSxcwf16YNvCUYozI6M79LZAWN5/
         o55mKOrqS2liztyBbk/6zb7GBWb7ZG0hYYQwVrW49b1R6fRU/a4Rw2wKAoodGuWpPlfX
         PJmGjGpSraQqFpX24iqWXBrXTdupuzb9gKRpuKl7TCKiURwqjniJiwJ9msBBkrRsjAF+
         HNZw==
X-Forwarded-Encrypted: i=1; AJvYcCWtFBlDrTG6qaxgV4pdTaPsPDF3BZaXHSeHR7DVe2mX3/9lr5kOmZJ9wGF5i71GY/xfHqfSDOckOZQGvrsr3baM@lists.infradead.org
X-Gm-Message-State: AOJu0YwU86iNNj79v93WHQiv98cGMvKfDMcu6tjTyqvrmVLBqY2YJMFv
	Uvs0Q2e22CVzoDQTCRvOQ8/jLji+Zd19MpEe8VPGBDDXAnMhY5lffd+nIpab3JI=
X-Gm-Gg: ASbGnctiR2nZx2e+yOcoOH8K7cE8ctBiQliqlR9Jcx8Mn5BHrOWkT1ZMon/k0AqSBUV
	W7m+Jj6ZKXhGD6GNneyGWxnkHrbd9t6fAfXyl48or2A57v6QauDYVVDByA8d/yWEFP3qiHQ1AQ+
	m8RjounuVm4BULCb5MliVxi/f7cnTk/np/QvmxuQwpQkPgf3rXFczHmNLUDHR7xEAiiW1qCbLR5
	e+d39IJGrfqRKCFEo82g+28MtulpDHdlGo9bWeMRYA0kZ7lJrx+qQc0FojvId5ARl6YNoQnTDdC
	Ct69b+I1P+NYcu0uNxqFiZ/SbCBJ3tqnr/pH9khcuV5+OJg=
X-Google-Smtp-Source: AGHT+IGWp5+1BVne358ySyNOgZ1qVjbCgfUJUnYbiNP8cDVB4maBnu+CTyhvHYo+RSuyGyXRNdH4eA==
X-Received: by 2002:a17:907:9611:b0:ab3:61e2:8aaf with SMTP id a640c23a62f3a-ab76e9dbe8amr395071966b.25.1738852782052;
        Thu, 06 Feb 2025 06:39:42 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70e7sm108777266b.87.2025.02.06.06.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:41 -0800 (PST)
Message-ID: <46b7042c-8284-4523-b54f-38f97e70075a@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 08/14] netfilter: nf_flow_table_inet: Add
 nf_flowtable_type flowtable_bridge
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
 <20250204194921.46692-9-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-9-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063943_432010_03B5A569 
X-CRM114-Status: UNSURE (   9.77  )
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

On 2/4/25 21:49, Eric Woudstra wrote:
> This will allow a flowtable to be added to the nft bridge family.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


