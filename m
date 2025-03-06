Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E898C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHVzKBF1Q9KJq9LGRjL7gm9YWMcdaoIAOjd6Lj0rKZE=; b=cvPKaLgZqbYcsTeddkCGt+5Yzq
	yIhZMB9sH+uOKLn0DmpsDAXmYV6spdtyZKuiAbdlQ2zCZDfhnEJx0S9UE28G2ShZ9bKHEGnKgy3AD
	oDuU3m+Iuga18J6IU4QGjnsrRNxCNYbYDzhlDhEMq2/kzBrlMwBVZO/Aoymm4GgJWG9PWyqzuKcz4
	WuIpgTmIzAmPo1VvwALrIK4rR5UjTHREpSFdIcAHiqkOjjRXpGXMQNJw/XSJyByCu/6Vne/Grjv5K
	X5BFVS12HvnjR6u2lm3TudK5hdTAeRh4vxvdwrEtLI4V4KUVAlw27h9IVvDx+MYMY7vV7Pcy9DwNg
	WUMGd/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7DJ-0000000ARBd-0wG1;
	Thu, 06 Mar 2025 09:08:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq73M-0000000APcy-2dQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741251483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHVzKBF1Q9KJq9LGRjL7gm9YWMcdaoIAOjd6Lj0rKZE=;
	b=Qz/qXm8gHpTqkrN7tX+1w3O7etlKxtffLow2uQQDixT4TghTU7vBYhIB06HKO5JAsubyH8
	HWPDyR4bJnRkhceqCY4s/L0ZDybeGCVi12uaowrSxeZr3X6/bJpAgEbE36UZQXaZ9xNkDO
	VdD4B5YkGEW+AfPpmoqc4fk1/v4sWtw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-LKiQqHCMO0qTfyep34sJAw-1; Thu, 06 Mar 2025 03:56:36 -0500
X-MC-Unique: LKiQqHCMO0qTfyep34sJAw-1
X-Mimecast-MFC-AGG-ID: LKiQqHCMO0qTfyep34sJAw_1741251395
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bca561111so1430085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251395; x=1741856195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHVzKBF1Q9KJq9LGRjL7gm9YWMcdaoIAOjd6Lj0rKZE=;
        b=j4ke1Xca0uPFIyVn+RxhHfNDa0XHcmernooTV7Z2WN6RVGbu+FqEr/4vN84Xm2EMzf
         xnIfAvmjhhmcENcjBnbaiq/KG+7Ryd1paXX2K2NVTq51B1/4xPc5dzLE67fJE44Ulp1c
         ZdMXY4DZe0SFRg2zMUhdbTECa7OPde7zrOMe8bxtLANh3B/YIa+9q6PLPFEysdIWVlGH
         zgePNHVodNa7nfkvvKqEkje2JZvzDuWJACmjUzvGb9BPxldOn+Z9RAsSNdqgifA/dy4f
         fwGfIFo5WePx6/qwZNUIAZAtg2zKP5x7NCXuSjl9ScocjJbRL5i47bx9XSD8e9gjmnlQ
         9m0A==
X-Forwarded-Encrypted: i=1; AJvYcCU9q71jrsEn9+7dBTGBDk/eB35TZRGFnHzbMxuJsdmdAU0IMkrTThtb4p3+BsZGsDmrmHiBbLUIgNfCXuX1eRY5@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3vjHnixpDza/2kx+M56RT3hBwIcWvvvuXwF7Swk35momYRh4
	42072HFa7Q7u8YrOVrmjXLQvXYY9OkU8FfJDA5E96q+P2XxoxwkcL0Bzg8GIdiddBFuTirr5iIb
	a3e6TByLOdtFxHMyLnmFMHAl0UOkhneW6lYM4iSrzPiwpvM3fFoTYioBwvOp01rBoXUGMbJN3
X-Gm-Gg: ASbGncsHjwbl8HFL58d7ST6JF6k/JbqoWpq9d6qhd+uNpQ4v/7xVSG9JbvLkiBhYZ7M
	1qC8YhPAOTq5UyYueXzZ6ELj9hnA1jpEemawUcH7EnsCavAfEqZ9070Siwr9aKiaXhGpuo1c/Ul
	b/f4e+J/K7umI1/5p7ERt1MZNgJ4FkROMdi+1zkGXwNB8YhFJ/nn6T7Cwtbu3tf7tE2fKATlln7
	9nCaLFIyIB8+oweHRWAa7BwHhuVbnD6Nciln9ICMV6B+7sRMLzMV2/siS4DHtTdVxoU3qHp/SZ+
	6+ZLXRJgoO35P/r2eaaZCwBWvPqoupKdYqSbT004qVfGTA==
X-Received: by 2002:a05:600c:d4:b0:43b:c857:e9c8 with SMTP id 5b1f17b1804b1-43be0661ffcmr7598305e9.31.1741251394943;
        Thu, 06 Mar 2025 00:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfwGEtj9NaQs8CRvPvXsv8CwsyiViPjo3ntC+rkCUxEKfACGLB5V95GvmcnS2yafdbLJvCcA==
X-Received: by 2002:a05:600c:d4:b0:43b:c857:e9c8 with SMTP id 5b1f17b1804b1-43be0661ffcmr7598115e9.31.1741251394643;
        Thu, 06 Mar 2025 00:56:34 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcc135676sm57848145e9.1.2025.03.06.00.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 00:56:34 -0800 (PST)
Message-ID: <350bb4f6-f4b5-44c3-a821-ac53c8641705@redhat.com>
Date: Thu, 6 Mar 2025 09:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
 <20250303090321.805785-10-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250303090321.805785-10-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3K8aiMyBx8k7PEwHkTl3RyF19B2iXKVT_wuzOVnNBOE_1741251395
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005804_750428_DF59A9A6 
X-CRM114-Status: UNSURE (   8.06  )
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

On 3/3/25 10:03 AM, Maxime Chevallier wrote:
> @@ -879,8 +880,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
>  	phylink_validate(pl, pl->supported, &pl->link_config);
>  
> -	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
> -			       pl->supported, true);
> +	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> +			    pl->supported, true);
> +	if (c)
> +		linkmode_and(match, pl->supported, c->linkmodes);

How about using only the first bit from `c->linkmodes`, to avoid
behavior changes?

Thanks!

Paolo


