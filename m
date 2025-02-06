Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C2EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=; b=S9C68dBo5ozF2fNN4vqGzn6PBM
	lrMgTBxSn3hMJm7W4jIYU8t+IZNkqFS+bBl+k5Yf0Ht1h5aUK9ko2mMj8U6cnycjhh6eAJg96QP83
	bVYmIoga0d6TfiG0r0ZFK1q9RMVMs117g+iZh0WAvOAFcxOQCFbPKyiKT4LlhuFuMcOzi7k0GvOSe
	VUM7XvDfS2SbRCIFHln/vwMpgPB+/rlPOIWJdPzM3whfb/UQZKuqH4+7T0g8A2+O8BDgnSbtm07M+
	F3x/FP5oq0r8CqgRo2fReQUUKoeH+uztIIdIbRsLVLDZmBAzTnuw7AyoNhiqDsffm0LFAzZxo6UcV
	xW/MC5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3HR-00000006ect-1b29;
	Thu, 06 Feb 2025 14:55:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg34g-00000006cqm-2Fgx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:41:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so202620766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852909; x=1739457709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=fUfF55mSMInKO7GVOPuStOHUPPk3x8KWeZZrSxpVroWDT6gLWgNzoGdjFzwS1uD+Fo
         5pPp9rAfuupjTxAcESe9yvj3fo4/oo2HPohzkXyk+md8d5sHcdN5xTN8GzxbbXBJYx8/
         1kku8lubvKDxzC4+AQBBiTek2cl1ziOiKVoqKD0VU0bB3Iu+lZOkM/SBfrQt5XGQrde2
         B/L0hodptfxfROznClJyNjgw3t8WGj4exUSCP1NLZswmAHiUZLy7cLDZR0wcD4gv6gCF
         g7MfXatMihqoxxGqXig51EP+J8bixWgxnq6eMYPhGyXj4PMvZNI6LSFY/arPYveDDCHO
         +16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852909; x=1739457709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=wkMYWdrQiCnwDb6+kXz0Tn5tc25vBHp+z+qvLEze6wY8Su5mVKC+TIAUQAjZtPFiOf
         IuCIUIB4G/blny4s48TKjLxLgidWPLlI7GwHu8sRLgDcpnyZKX2h3zTiXLKnPZY2rjnk
         ViuwLzq6PH/c0kUAaFbIfFjIK20OQE9rH+i4WfzMY/97vWsesWLkA39nSlYbMYTFHfTP
         J4dppUf2Vkycz+I9WfEQMMTZG+7r9pFJfjPO7UR7yH6xCwAl7/YpPgUGzAkHtc6WdM+V
         OsqKBFnIbe7jQMHqO3AgTfZbx0gdbAn9EtDNVUpqnQ3bCgMzEo65wM2b8lQLmPSfXpoC
         4fJA==
X-Forwarded-Encrypted: i=1; AJvYcCWwd5hOtiG4lFlEWW0ZPyKuTgYIGKYhGTbwPy80XIIVg1TVGb65hlZZZXGy5/4QBDxy6jbSF6yHzuHDyjpiioX6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk+CF0bSfuH3JuXRt7NOSwMUemCqcCFxrWeUqbiGghAsS2MRs8
	RplKCH7BrKHj8iafHvFUES8I6smjCnP2Hmao0kKJnXRp7P+K6wrEGVqAZOg7Un0=
X-Gm-Gg: ASbGncvutc6JmQtJGdJCisynEXQ9lPD9PukAz30fOPE7ziiSyWC2dvBbhrjRY2lX9FI
	CmTTK+84ulDyKCSlfjUXSFDj0R9rXsJhx20nyJxpxdPJAEme6M8cqKW3bujzr/zKcDzkCO7UGJP
	SZD8wt//9rjvaI0ilabhAeLTEP9PCx2GIZzlLX8lULsljr6Nzly/AnWQSLjn3kuyxORth5JRJat
	Krvrx3XheLgu1Nugj8PWwWq6bYZN+xlEX6IZaPxumprXlfXVX2Biz5lFFLHAUPHQ3I7INAQa+Pu
	445qlQ/8MtGstoHXX0P4X8iJTj7vS/uc1FU2DvvOn24peYc=
X-Google-Smtp-Source: AGHT+IGYS6d4HsD5MEqTfuQgUgTGOYMkujVYUnjTnyeKJRhPZPj1m191dnJjgGKyqlpsKlnGfxYIDA==
X-Received: by 2002:a17:907:c23:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab75e233e41mr751067866b.11.1738852909025;
        Thu, 06 Feb 2025 06:41:49 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f484acsm109660266b.11.2025.02.06.06.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:41:48 -0800 (PST)
Message-ID: <ffcafced-51a2-4a09-ba45-1aafc8f39081@blackwall.org>
Date: Thu, 6 Feb 2025 16:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 11/14] netfilter: nft_flow_offload: No
 ingress_vlan forward info for dsa user port
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
 <20250204194921.46692-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_064150_569738_815AA16C 
X-CRM114-Status: GOOD (  10.05  )
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
> The bitfield info->ingress_vlans and correcponding vlan encap are used for
> a switchdev user port. However, they should not be set for a dsa user port.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>



