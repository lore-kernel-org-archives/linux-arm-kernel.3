Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DDCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=; b=GxCMw7J4O/nWtgQuXj6DWlr/TN
	yYXWtOEcdJkYcL13Ijel4LLP+PFH8qAxuW43kHmtZ/wpaB32tlvuDbkSJCzS0eA3JKT+oBXyouB1b
	P+Dfwea+q9aV/AF4qfFtOl36izUIyW0Y2oE3PcZP5+oewE3c2VoSFjzeuLptKzKtyoYqG+DTDEm+u
	XXQnKmOofX7fsGxvgWYrJLInD+0qL/g9KYeHoWEkvZ8WRxvbpa50AVI0RWTISWrTvSCZIG7/Iu3jv
	oGQBPF9XNs7NC6W3nikWg0iqyu1H7Aojql/tUQ/UbN8+0/3QBNlQKrL3fTJvxLThEBigM5H5CU+ds
	Q7VfmMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3Ai-00000006dhP-1ajF;
	Thu, 06 Feb 2025 14:48:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg322-00000006cF8-2pIp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:39:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab69bba49e2so144742866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852745; x=1739457545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=;
        b=h3wjT/Mcz+dvQp8q4dicDmYSJJLnQLUvev/qFS7gCHK1KXeQdWjwmZX95ZbNLtP0m4
         7tZ1xwloOQI3HfA4zBKLOv4wswY8Oh5i+haTmsPaLiVqC0vHfKt2sgoC7e5PgiIcbcnJ
         wbw70elyTvDv2y1mtMMyAwN4VrqJ6Uq2lf+xySEueV87b0ygcekmbLMra9ZdGeW9X+wy
         1DnFnuces12nGhVzKq+2J2OAbNWl4e+TWXZcNkPGqlcX1f4TYOok6wpoF5VRfgQIFkqP
         ZdUgxwa683PCN6cWyQm7MWe+PTT6Dxy5Ymv9a8OMeHoMMNhYO2BEqW6/NijWia2Ma1yj
         vUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852745; x=1739457545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0JkQI3U6f+a8v60Ya7beYBhUDwWewUAZsXtUyTx0ac=;
        b=D/obndZXjv+tE/4Ylyfqt218UoCFRdF7vOOb0YXQCZYx6l/DdDL1PBXU4C3GkzHyzF
         q0tfv0X8l0i+Z6bc2HwwGxm8FvKH2sxoLccCFs50P7aecNIFbFU14fZaEjjo951HFBIW
         gaSGijI/zVo4JjjYnl4wh18rRQ0JRaSLGAwF2GOTpR5DGuy9uRJUF/akk4S51F6C7CNo
         OYeGuebCEhka2AQhuGIgSjb0kFQxX0Rdoa/o/pUbBUCnLjeraFMoM4hgzMKlaitlLm5j
         SZB6S6VdG/KAGjSl1s6h5p0ViNKqwivMV4a6YRyR9VC8H8b9uZC8YIEitCAZes5zlXNe
         KOyw==
X-Forwarded-Encrypted: i=1; AJvYcCWGaL95DQr6cVPw7hiAWKe8yrybiRejsb1Y1Ll+Za6Q5tgQDU6y3dZFgTID6kRWgOCcCQ4I4SYmAYFjz+QE2wsu@lists.infradead.org
X-Gm-Message-State: AOJu0Yztqu74DdfXGgpkkpnV6O5dgQyJd5XlQZlTX3ZN7HywIlWXGk+9
	jQNIhJbNXbUMRH5nz6x91dafwwNp4W8LxzuJaxJxJQPQ5f7FFGg1gGNWJha7V8k=
X-Gm-Gg: ASbGncsLbiuMY0B6XAT6sXtCjaGTF3Ck0Mzaf7Ym6hdi+uy5Lqgq6/Qq7QygpO0T7IZ
	dRcWOURTo20mV7NfMY6ptfghEHVv1kuiqev7MQUC4VUURjHI8tMK5ZAkNJ2HkCf4QnMEun4sEZ/
	+a08v4MRiu0y+kULL43u5JkuTKF1hMh+OyfLrG4+/qFs27tzBUFmiGtVYY8GZ/sfEEyk+p6V/fp
	iUox/vwvWxetXSwGeerkeNK/cKio31bHLOWjQK4UwkS+IaBXDg0DzgOGMCJ8hsoxi6qD/2GWEfH
	btWOzQgdA2oj6H6IhjFnM+iobbYoJ75d/xDLizABAavI1SE=
X-Google-Smtp-Source: AGHT+IFfccbgqNHY4pVflwA0HY/1yvIqL3O/a0V1EXaUtiholMev7dwDOL+lRjcs6CbBMFf4cXAhig==
X-Received: by 2002:a05:6402:2812:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5dcdb762d40mr15968196a12.23.1738852744810;
        Thu, 06 Feb 2025 06:39:04 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339349sm107647866b.146.2025.02.06.06.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:04 -0800 (PST)
Message-ID: <98c8cbec-28f4-4814-bce4-e07101553f92@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 04/14] netfilter: nft_chain_filter: Add bridge
 double vlan and pppoe
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
 <20250204194921.46692-5-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-5-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063906_721183_ECBEC76A 
X-CRM114-Status: UNSURE (   9.26  )
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
> This adds the capability to evaluate 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets in the bridge filter chain.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


