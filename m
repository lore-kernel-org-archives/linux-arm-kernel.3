Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=; b=IXksAqLdRhveBTcb6/FPxIakEk
	p9ZhtNL1Zt/9OhyrTcVSeT/LwzzdZF8FvAyf2PZvAFkozPRSW6bRgDa0kJ4aPUhCVCJZqbv6lmMsa
	hfgdfi4zwfXE7vkGc8dKdoCyUH7q29GAa9i9RKVDUv2YSs8+XqEf1LHs4FQA/btzccxqtfULrOi9i
	MCV/TNhhBKRK1RiMZmPyqe6vCsVZo8cxJX53n1mf1unKDRmyhx4rthsag3YQIuI6yEguD6s/GK9js
	flUSv4S3rxMS0iBAvF8WHmXIgzqHMm0RkG+bWjX5twfOsZv2qBpt+P5fnZUuon17rjAomM+tH0Agj
	fTARQhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2sr-00000006aAd-224p;
	Thu, 06 Feb 2025 14:29:37 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2lG-00000006YPn-3wXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:21:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab777352df4so95058666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851705; x=1739456505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=;
        b=a9JmQQbMvWIGEMIa5lYqYoOZ9AnQgPKFG5W+Du6akSsPErozUe6vkTB0uk03PRMH3s
         mtQo+AO9P4w2anF7ULcNDvb8rgJvAXiKgu1sv6dnXwxlD0moc2QMLGBvzlZUfzXo68i/
         J5PfMhSkE4SQbfOktafdlbaFEx8EjsFH0B3EDw8ytaeD9gIW3G5IHXvBbMbCHpy24Jdd
         JUSJXOVv7q+wsQz5hnKjF98utzX1aOfQQyUW0P4kpliqO1GyviQQOlCQ7H8Ne4WtqdBu
         RzBdmNXViSY+TL0QWmL/frIrR+B7dCSDn9hhbbP0IMitns4mL/s9c61OwxHqgsqJl3mz
         3pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851705; x=1739456505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=;
        b=qOUE0CSHT01Osht1zX03m7CHxU+XaiLB8V10ao9e9obVEdl5x1OqQGMf69BC+G8T7d
         RdkUXB4tcQXbciIOm7ezZVoT8RVh2q3vaa+UXwD8jPTrjyPTwJNvcWU/Unvw2gkDMl12
         L0xP5gO9bLWpK4XoD40ujCGGi+2tegttKOM7gHopCYp7l3FP0XEa0nZffT7bFCzo4Tew
         TeCvLf1iupJSy1gTTXwdxzHbISTe2ujNNx63K3G/IXyPfkzwRmOQPkRHw8WcK/GdtZKD
         Z0tF9akGQoD9JBYk/46uCA1YLsM28FSKehuArEqZ0RmO/YYZFdrnDZy0GNZSYJL8ZuKM
         HNyg==
X-Forwarded-Encrypted: i=1; AJvYcCVPwWEcCgcuan0ukew+0JoWhNpjsPck6L3vkSGjbSzDJAVmR1pFXGjejd/yX2v8LHz/1SJpddnB/98MJgDK7ULo@lists.infradead.org
X-Gm-Message-State: AOJu0YyaR9T0602cKu0oyKrzam2/yxIwQtiZ1XCrhfWLfxkhhB6O41MU
	F3CEinoAI/U3sPbg609AwajVHpsfO9tbM7U8JNULpfnmXNACQPJmbwNWZz0CiIw=
X-Gm-Gg: ASbGncuVobdUtyKMbHVzZeveIeEuXVsiioLvjZrQxQ2PFW7SP1asoOwaZvQoqKKkfxR
	R116dWS/isO5rjvxV1foNHXzLCOmHJp87QmebLfQuV73iEEbKnqjQzpQMz7o6X5Yapu2i8HBcK6
	6bGU45WFnXC5zLdfp0NFEnwXGxiRA/pw6Dopi29seJRe3kLUA3ZLjmsT4zvT8MH8jAWtIw1hGx7
	Gh3jmYEd2P6xI+qif3C1mesyZ223LAQn7iiaKqqQyRhqO+Lk6lVKUWE4N1/gDNLwz53jYTiUk7g
	WZ5Eyj5eibrVpr2Xgp3Uvn21NChpiE8fU/1Xt6uYofuxAqw=
X-Google-Smtp-Source: AGHT+IHYDakGj/X5YiewxYiKiang3LLrhidWY47Oe3DTivu/rcwezti/yOY3bxt3zD/zpLuTb7KrqA==
X-Received: by 2002:a17:906:6a16:b0:ab6:f59e:8737 with SMTP id a640c23a62f3a-ab75e262320mr699358866b.27.1738851705010;
        Thu, 06 Feb 2025 06:21:45 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70bfsm106144666b.104.2025.02.06.06.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:21:44 -0800 (PST)
Message-ID: <fef59299-aac3-41b1-9783-3a3f35dbb7ac@blackwall.org>
Date: Thu, 6 Feb 2025 16:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 05/14] bridge: Add filling forward path from
 port to port
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
 <20250204194921.46692-6-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-6-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062146_983341_2ED56E87 
X-CRM114-Status: GOOD (  12.56  )
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
> If a port is passed as argument instead of the master, then:
> 
> At br_fill_forward_path(): find the master and use it to fill the
> forward path.
> 
> At br_vlan_fill_forward_path_pvid(): lookup vlan group from port
> instead.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/br_device.c  | 19 ++++++++++++++-----
>  net/bridge/br_private.h |  2 ++
>  net/bridge/br_vlan.c    |  6 +++++-
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


