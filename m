Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=; b=YP5LEmlR0E3SFMySWGWREpO33J
	M3t+lGhN56xi6c/RQt3plpW+j9ZuK6Rch54XZTTBuxFbLaLtMfJ3EHOy5Op9yIpsrQjAt3Ribvi0v
	yeVnLEgwgSzff5TXD7xvVyZHB3fPqCNmUg/AX1efqL0Ob7EAVhOIz7wHKqQ9X7noqIp51wt09LL6D
	OBFg+GAoxrscYH/tIqjGVppQlk+gRppvIgP7rtbdlK+EsK/Cfm+HIk9okdE9xZ7A1+61+gV1rOfYM
	+4s2Nxl9TBfQg3tiRYuZUAWvHsNF1mL8zE5xYHxdjUpnFf1ufPeS+8nPT978kIa0EggpzwMPAzO3B
	0aimxfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3El-00000006eJF-0NZp;
	Thu, 06 Feb 2025 14:52:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg337-00000006cW3-0FDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:40:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab77e266c71so60919466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852811; x=1739457611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=Gzym8A2Ibzt+wn3IdQB0NzoYeJAuKNJsEiuO29boJyKlQymFxSqqShjJrfgQa1q+I+
         srvySRbYNosk9TcZJCvjvzmt/F+EQ2i2155UsJoYCFBbwgJIU8An4HWpAEayzdLa9aZh
         p75E4PFnflurKlG+enEVTTLmXNJ1iLbMaENDbr4tDcStYDN/FKyJOA2vucNL0TOTrYsA
         /xa066JYkmLHeQm+IgQBCUC4unR5ZMFjCQVbADksWKD3lBNZXa3BAauplxL0R9iNoJ92
         x20Kv+w+5jTdtfdQZsYWCfmPUwWgET5LjAcuO0bJoYq+CoXNVWUD5aJYY5YRJrEJuRlN
         2gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852811; x=1739457611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=YBdNIOKVhKFnFTQbzrpwGDvjGO0dRJHhPfjINxE7n99ovK7zpuKtFErVpbpBd6pCXX
         A0wKk0yzYKhvt6+Rrr4PyB2UOUwinTrnZyIvZ8SgQ9eiKDmRQc29KzZNhFoxgBa4f2of
         dG3y/61T+fSdFtpLHlvkh9UxiVTwtwmNVh+7oSCs+ajrTSXXhN3kMUnwc4PR2YNU9Ubd
         QRIuB3+++GB/ieYQjPon5DKTx/Cy4ryucxIrThtdc1SjIrHCGIIf936Hh5PZ97cTzFH4
         A0OO3nJazDVM4cETCgXnJTwB07vU02STn+LSPCiO9BcTUXno4N0oHvzJesmM7ED/A4lN
         cFjw==
X-Forwarded-Encrypted: i=1; AJvYcCUQbkeMFFANXSSv4EKIIp66ME+2JvFsoLpdLE/STNjxPBZXhUbAxpRPwvxRpSl3nBNK0bBl6mN1eAJQ+Tptqswl@lists.infradead.org
X-Gm-Message-State: AOJu0YyU9yPQAqgw117IZ/vzjfmfHGOEwiwRTabtGtv7DdOY55SYhPBe
	SV2y7wUA67XLGatGNZAltO5eiY9sfIJTNwyc2ZkfeQa0gsg3Zj2IsGpEWUjvv5Y=
X-Gm-Gg: ASbGncv/i/rIsZ/btdabXwMOa9tKyUvgirl3xq805avAX0aV9Ylsc62TnAns/ylI2FH
	OtmdvsR5eszbIP/Cf1qlJ+4ku7xT39Mc1P/Ez+RObN4vlsn0j+I9PFQYi3AlEtyXpS1Ulcqpr+h
	ga1GUIhCppr2BL/C10GbCjoIdOulY8cLd/JJoAiU8c1Op/Zv0L0184PgDdBKrtcnP5Tp9EU2E2S
	cCTMr4jXXanFk+LKHs1+GjIZdG72Y4ZA7P5NzCx1W/PDGABQB4Rh2rugcUKgWqHZz5C/wo2zzbv
	f2R8byTu+ErLUvoY2n62/4cNnLHX0aVWa9RHuyjaVHOH3wA=
X-Google-Smtp-Source: AGHT+IHgsuIEgT7GkKcahm86w7XZdDg7vZ/AvkvTuqQKdmdxISVptZgStfdEuYmSzkdA2CsT8SZ/Jw==
X-Received: by 2002:a17:907:7d90:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab75e347a2dmr784608966b.42.1738852811550;
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7826ed43esm24954566b.58.2025.02.06.06.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Message-ID: <6cd38146-aec2-40ac-9372-13064dd99363@blackwall.org>
Date: Thu, 6 Feb 2025 16:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 09/14] netfilter: nft_flow_offload: Add
 NFPROTO_BRIDGE to validate
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
 <20250204194921.46692-10-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-10-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_064013_115392_60768E99 
X-CRM114-Status: GOOD (  10.21  )
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
> Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
> the bridge-fastpath.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


