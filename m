Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC76C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=; b=PsfWrJTz6p2zNwmj7W35NppCwn
	Yq/E9BDvVfKCZ/PnfSZ0wiFYhI8k+QVRhX4XmC1JTjZfYt+skPFEOQ1hNLss8t/wM4lYZBkiVR5JI
	TUOTTQLz329vx+km5zfWZpZRbM4pxEv7q3vYi8bo7/U9bwPZ1DZA2sqN+3p8/uKtPJiBH8bjB4iY/
	xwRbIonrsQD/nxJazfvlHH4NkN43vqZTAzwChzyfuu9SJBCORsz9RtT4HxaM/C3Q3y3I9ySIT9l2n
	DUdxnlvPhCLeQ8X5QiX3HbSwU8M8jRPnGrnflWFzv1hYvK6sF7oO5tsnIpo0+o+WKVXnMUU+t0c0j
	KcXRrkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl4d-00000007VnW-28iV;
	Wed, 05 Mar 2025 09:29:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjzP-00000007Lsy-3Uk6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=; b=iBH3UA2yg1hyMDs06sgaLQ64Ni
	vbP+UP77yyYdb2vVQ2OsigscuUrpLp6daIhn0ymitWnEGMUewxIEHFd2Bb0htOjb+JGuS2n6nQiG4
	Pt7MBVLSDC6eFs5lanp6khJEl6dym77nxxcPzqBBG04EQt4sVfaAUWibQFVUD9DZqWZRKCgpLrl5e
	uUQjSu8rBcVqIse3jG+ilS8PqIC91HlYXj9snh6sunDTwFzDE+yrrzOacUB7cP1Jnj7+tp3m9gjmI
	F0uZhkqchkcFXzrMMV2QdZISR69Tb/Uurw9z/ArRr+p1wuk0uU0Q8BnWFx5Ef/y9IrCTaNfEhFIno
	pUe0svlg==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjzM-00000000PuD-1oPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:20:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so423939266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741162821; x=1741767621; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=;
        b=WJHXMz+kxLbjJXMDm7DnDZl3La2GIWe4OLeCTYVvg0UaCbu5oyJeH6SN6XrWMjTAlm
         b9jJFwKdgnNAKjF+Lf2hOwKqzdhAwg5WG3wXXfHiIYOxrlOTh5Ouw9nfwjkYpBimKP3L
         0Ma9+zGy2NHEcmEBXvl/puxiuyqBngQibYUemagk0IJky3JArwQS3r7WMvP1rKs9SMHh
         arh7uJRk1dx6fU+w8EbHuzRa+YinnzFq9YVTV4UqPm6N8p0yNeRfLzogzjp0EDgMAoN/
         ETA/l1VWyBUpMUpGPWTKtq2b/Zxdvkjkh+8Qts4MAtpFPB/yOUeTs4sxU88ZubQvzwbx
         tIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162821; x=1741767621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ9TMmWBCnKwhuUOANBJp50uacRGJFZ/d6Ba0SS8K6o=;
        b=ITl4Z4q9+7nRQQG4X8dHyimVdnH37XNxxCgrFlzRwr7y42vgyUnLNsw0uSNa0CKgam
         gScLuPPV4bHtmnVWMXr8H/0/2WtcHIgEgmX4VsJTv95uXMUw2aZYoKX2rERiDUqtUvLl
         pM1pVubCrswi9gyx5dimNzRggbsYKNUGfM+jT+7n9ONqC3q7p29G7BkAcKgGNnYEAG1G
         T+xJTErg/N5RPDCXNP4ET16ZDhJ9S05fgXSxAI5dZaEYihwmCza/BeB9WDkSB3QKoXEG
         HBLHZAnt5GAdlowX4I3OhLcN2KdkejlOMRu5+P7aNnXTA2yJskKBu+7mhuvn1BZN1OLD
         u49Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1uuLKdmIGUFqhWo7o2+MgkmGZ1rI9MXV3MTpqdfC6KkhbbFc8Ql5DMbdjXXGMiPjLnhtU8UVMrMwtrl+eoSQF@lists.infradead.org
X-Gm-Message-State: AOJu0YwOEPd5tiUU4UUWOV93mf6ccfSEZsOQCHhfjHVBqNewDEuzs8FR
	aKAEE4gG8dgkZ9zAKM8ydyitjwskQWUAM9xomYtZQIW0ajVE3yUsp/hwXnAd41I=
X-Gm-Gg: ASbGncsgx0sgBQlaygjIUXmjfOc2g8xl5vBK3rN7IOpqHNBuwL5zEhzqoZujARe6XS4
	jIOEggxa1HKi/cSFBpsUmzUt2AbuNdSP8xF9QNufnWjFIES0yXaHtGpin/tMQPZs66fEo0as7E9
	YDTZLGOM4HDGDxKTZQrevUkHGZgKQw5iRq7hNjE/Evpx9B3CaMyQpYR+VEeCFToWdtxNdp0zy2U
	ni69MThnCyk4I/lobkfzxM1r18/nudtzV22CYvseSWGdsw4g+jzLENyOHOy9hkNOmI4+g7zl3cn
	Vrb9eYFN7wlchfnqy6sqiHWYwRPU6Agf6Kri3Okgq42wNDsyAZ7s3r/GtZyVlzynMSdXklfljVT
	P
X-Google-Smtp-Source: AGHT+IG3uX4osOFdkeIE8BVoOkaHQ2eM06ismAlJEsM6OrJRVb5spjiMCAH7SqlSZ6VKBFc01zjVCQ==
X-Received: by 2002:a05:6402:2714:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e59f47ced8mr4078134a12.24.1741162821234;
        Wed, 05 Mar 2025 00:20:21 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf3f3bbfb3sm845989066b.77.2025.03.05.00.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:20:20 -0800 (PST)
Message-ID: <2690fc33-0646-4aff-aacf-2760706139e1@blackwall.org>
Date: Wed, 5 Mar 2025 10:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 04/15] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>,
 Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250228201533.23836-1-ericwouds@gmail.com>
 <20250228201533.23836-5-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-5-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082024_733034_E4E0A38C 
X-CRM114-Status: UNSURE (   9.55  )
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

On 2/28/25 22:15, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 83 ++++++++++++++++++----
>  1 file changed, 71 insertions(+), 12 deletions(-)
>

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


