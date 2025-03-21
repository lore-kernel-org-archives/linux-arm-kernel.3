Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B27CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs+RwcS9h+V2ikhjyQECAnVV51IDsPepgkZ5ImH1XsI=; b=YyzSZU0OeFhlLkj9g2/tbTJmQ+
	k8hvXyxNQTpAWOeeAIovJuk1MrXIgpqjw3aSdjv3wEdd4HtwdHFQzsQT1QWXNm85yMRfKpQv8tFke
	CPqU9eGMXKVXUDlosOcRcEpyzHDEUk8aDigGhpkhgclUO5Qtv8wxh4RXKZie07Fh+ez16LuoP/KYR
	LG771NlkD4y1Mrb07ergvN5UNfWVOAyUwJb/x7WyGVpQRhjuDneD4+71Vy87eJeMDxrFg0lyF0wEC
	s3Mz1gy33ftOVFntZqQ6Gk++EmvvhnR/VUILrH7Y6KP0l1/+KFLlONKqSwp9FDVgLUbZQyRBZrSD5
	/zCvqNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfKU-0000000FWaE-2Y8g;
	Fri, 21 Mar 2025 16:34:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfHJ-0000000FVoD-2wUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742574682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rs+RwcS9h+V2ikhjyQECAnVV51IDsPepgkZ5ImH1XsI=;
	b=FfP7a2kBYhrvq/VhEVR6vO1LcX5Amfgf9YWa4O4emOoAyiE0vtSLK/oU3fJkQq/ZGdM8Bz
	Y7rBqdYsUD5YgESj8Q4YDhFXU1o0otcMXY4hgsdZge5suTQsVbYVkMGLoc3wJRKPoztVvY
	XScpJlhu6GgK20uLDInCCDvBn5tCCwU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-VbU2kfmVO8GmeYitLfEaZQ-1; Fri, 21 Mar 2025 12:31:21 -0400
X-MC-Unique: VbU2kfmVO8GmeYitLfEaZQ-1
X-Mimecast-MFC-AGG-ID: VbU2kfmVO8GmeYitLfEaZQ_1742574680
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912539665cso1633637f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574680; x=1743179480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rs+RwcS9h+V2ikhjyQECAnVV51IDsPepgkZ5ImH1XsI=;
        b=kTp4YkUqbb9LojjhUGtvI5LBfHj1awFLpBZRA/cBzWI8rI4xmLRAeA+U0DOE35nbgL
         oXS3g+E+267IkeWdWQwwkTqiO7/lVjN1SF6Q2eIgFfYy/2RmYfQ3x3BNi/i7kCqKTWye
         YTQz9WdQp54gm0ZEiot+N7kCFplHNHWib5fgPdZmHGjSep6WuxKdwIUwhRP1J+FHH8e1
         mFoG1l1h4dJdlYcolaNBT0ibo6jsCkSh3pxoeIIJMROls4cyl3ZN65HwI+pueQfTdg63
         qiqRtO7g6UlMlrcndpMrY3j/BOuZKR46naWwWXEZs9jPFLwAqbKG2AM8/Jzet6yK+sp1
         N2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWtd6Vly4dPXGXOxFLwa8izduoLBSqJeVcU4PyKg2Co7S1KOHPyVUximGV4R+4rPQgEwlp9KRhtOlUgKIFO6uUO@lists.infradead.org
X-Gm-Message-State: AOJu0YxjbuCzzbqHn6A0fyaX72rGAxqW51zn0wcPusqhsfsuCD702vqF
	c/0BiJX6PATqnpXuug1Okjf+0eQqrKs2xxFjvHeMnNGsNHkSYEEw6TxKWjzVLmafSCR8vDpB6DJ
	cEwkeaBL4WlgUz8LHixbgXt9q9TBpMoEomUg+R0u3a5yt/uHjFfSF3KhmwgbWyI3KxSnPD+cE
X-Gm-Gg: ASbGnctrP47S8Iw1HOO+DEvrGwg6jGVPB0k7xQ4MEhn7/OxZQvQKkHQhqsd6/E8muwS
	P1sR25QUZCcbhPso/MdQPkuKgQCYqMCAN/ee0aPd3+/PX1tvKmjm7MOUacf7RdYUBequ0ymgLTo
	wJMesPkJGTVf3Ww7QtTYjC9eNhI4jZ0e+STIQ2vdmaf2aWFxOdTqvWERUjuLMkcLLp0ygB/Tn5V
	Ra0m+DE0Dp1iU4X4/CEala2ftFuEFsdzwV/o48dhDS6WMJforXmqxlf++d6yBhhwN6eHxKyW2ap
	xXaTt6PEdPXRQDwzhHFHGn2yoW7ZUQ1S/pxkMIKNmmkHBQ==
X-Received: by 2002:a5d:64ce:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-399795567f7mr7617671f8f.4.1742574680072;
        Fri, 21 Mar 2025 09:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd4IZz5KXdcrX0+aF/TgGlXF2jzu4TiS7+n1daZwv+t8eYjf13W84OlRjl+h4tIxUwcH3iXA==
X-Received: by 2002:a5d:64ce:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-399795567f7mr7617598f8f.4.1742574679564;
        Fri, 21 Mar 2025 09:31:19 -0700 (PDT)
Received: from [192.168.88.253] (146-241-77-210.dyn.eolo.it. [146.241.77.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f6bsm2830317f8f.39.2025.03.21.09.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:31:19 -0700 (PDT)
Message-ID: <c4e5bd2f-6216-4f74-b677-46c79343eb21@redhat.com>
Date: Fri, 21 Mar 2025 17:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/7] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
References: <20250313182647.250007-1-maxime.chevallier@bootlin.com>
 <20250313182647.250007-2-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250313182647.250007-2-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: piSjeglKOFjYm2JhjT7vedmM9DDOG3bxSJ-WGfrRXy8_1742574680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_093125_811775_B576132B 
X-CRM114-Status: GOOD (  21.48  )
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

On 3/13/25 7:26 PM, Maxime Chevallier wrote:
> We have a number of netlink commands in the ethnl family that may have
> multiple objects to dump even for a single net_device, including :
> 
>  - PLCA, PSE-PD, phy: one message per PHY device
>  - tsinfo: one message per timestamp source (netdev + phys)
>  - rss: One per RSS context
> 
> To get this behaviour, these netlink commands need to roll a custom
> ->dumpit().
> 
> To prepare making per-netdev DUMP more generic in ethnl, introduce a
> member in the ethnl ops to indicate if a given command may allow
> pernetdev DUMPs (also referred to as filtered DUMPs).
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  net/ethtool/netlink.c | 45 +++++++++++++++++++++++++++++--------------
>  net/ethtool/netlink.h |  2 ++
>  2 files changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index a163d40c6431..7adede5e4ff1 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -587,21 +587,38 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
>  	int ret = 0;
>  
>  	rcu_read_lock();

Maintain the RCU read lock here is IMHO confusing...

> -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> -		dev_hold(dev);
> +	if (ctx->req_info->dev) {
> +		dev = ctx->req_info->dev;

.. as this is refcounted.

I suggest to move the rcu_read_lock inside the if.


>  		rcu_read_unlock();
> +		/* Filtered DUMP request targeted to a single netdev. We already
> +		 * hold a ref to the netdev from ->start()
> +		 */
> +		ret = ethnl_default_dump_one(skb, dev, ctx,
> +					     genl_info_dump(cb));
> +		rcu_read_lock();
> +		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
>  
> -		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
> +		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
> +			ret = skb->len;
>  
> -		rcu_read_lock();
> -		dev_put(dev);
> +	} else {
> +		for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> +			dev_hold(dev);
> +			rcu_read_unlock();
> +
> +			ret = ethnl_default_dump_one(skb, dev, ctx,
> +						     genl_info_dump(cb));
> +
> +			rcu_read_lock();
> +			dev_put(dev);
>  
> -		if (ret < 0 && ret != -EOPNOTSUPP) {
> -			if (likely(skb->len))
> -				ret = skb->len;
> -			break;
> +			if (ret < 0 && ret != -EOPNOTSUPP) {
> +				if (likely(skb->len))
> +					ret = skb->len;

IMHO a bit too many levels of indentation. It's possibly better to move
this code in a separate helper.

Thanks,

Paolo


