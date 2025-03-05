Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD58DC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS635IvOc12Hbl5A1UFbpTyLqQYfDtGYrejudL0pBtc=; b=2/TKnQzTTz5z9bgnA7312qDLWZ
	Kncx+lXt7Ix5C0ojPXYF8iNGfHc89iDZBxWEZVkti5hwsqVnkr0JDVpMplufzawZMJw93a9mDVSFy
	xVI9y68aP+fh5DVmNTRBrslNPIJtpL8eUxjGK28Jw3tZ70ztEtl3i9tkbz+yMZwsPcdOpfKAr5zjs
	eeDBeDqpWft9InkOmOqVBKBuSFoSzW5MoVWFI2E4c6nItSdUKLBWM0uZCH4bzvwEYS/K7wClsoQCT
	K+6Z8I4nw+Xepn5NER3XkkPfHefbCZZJ7UG3ghgqf1y+UhBnh6kVmp5GEPJJkqiPyP2ZTXuGDr8he
	TcIoO3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkBt-00000007NsJ-46jE;
	Wed, 05 Mar 2025 08:33:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk8J-00000007NFw-0Pew
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:29:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso11424994a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741163377; x=1741768177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS635IvOc12Hbl5A1UFbpTyLqQYfDtGYrejudL0pBtc=;
        b=Qw0qHdVAjPfdMr3N/XoRNcKqgPGq5j5V0OxMxHFGZL9FrAeb/jVdta6eJOPChyYKiA
         LEnL1CeAx6Kxh55hK3vg3VNVe0CblsfYBdT5XrrPePjk/7LumbCBdZSbtzLeqU5F29LD
         gT+nSP1439EIN48gsCoFPWdkL2LMas+pZuVUb9ScfFnS2k0mqjKD51wYthuvqlI2Qf1Z
         dLVZtzwlu2cENJtkqF5oRkagBVJppSe6bKSqyyJ0MpRYy2GxYyQzA/hWtP0E2BA/1iZE
         mNY84fOvYMPUbwKV14Xh+qarDE6rmFV+nnpGV1xjHjDqLQ9Lv4xrr4T2B9NVv3oHFJoN
         4njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163377; x=1741768177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS635IvOc12Hbl5A1UFbpTyLqQYfDtGYrejudL0pBtc=;
        b=IAN9/ZLob8gK+uw7moryLXAW/iezXLjkRGsHdLP9YHx2a5oqiK1G5YBcFhpjwL8XYP
         0/NX4GS+bvQvMVAGIYQea0k89+dLQgPOABJhBGKaR8wxNuIogBO705MRY1H7yCRxQPl8
         sEUhFq4UuG1/B7HNPpX6M+NoWR7aR3RkpsXovsevETk6Lc7KTWeUf+a13wMaDtJ7nwrU
         DlG0f4+PxW469QAQkZ6g+VKvNaVBwtj4sNquRr/t1+4i2Pg8MCfzFuDE2MRgBJogRNGg
         RRBPq1NaH/bEvfdMJIYVR21jUPeNZWdMdSg7BXcLCV0LfbdTnRiHI953v+6XgNhHDSJH
         UftQ==
X-Forwarded-Encrypted: i=1; AJvYcCURnpjasXjUF0zshQvnam76a62BSDWxrDFsjio6rTV3uB8e9PEUmYBrr4IILkY3+GMSZuK/qoibarKy4NJwnxHA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/6cz19pyRqFAzz1SeNPoAbiGSiDW6+9B87fUhFPz67Ryo9wIM
	k2GeGdyVm2ec+t2yedAv4OrWTkXx/YqhmtwkKT4UHhLz0vO1lJ87LsrXGn/7w6Y=
X-Gm-Gg: ASbGncuQXe7Z6lUhP9npY4/Leph7ytlyonQKf0T5cVbDZVhzJX8R5H6hZDP9spZUnoo
	F0qZ6EzjVZD9bUXQlP9klVWxaNlvRSwdbFy8Z1WBDufEvhA6yXhg2wSaOU0puYZxWrZQLHkXF7y
	17ZsBSP748gskrpV+ymWiz9OGddhbX6GdY8rUyPwfz/P9BqM6SSkEeD4+yGxLLZp4anINWj4IOc
	K2gDsyI1t+cBbTblxLZDumaoblc92Q7AiEkMnguCs9eYYoIZ1vpeQ4U1W9/ptY/89l1ysSNbBeu
	iQsNlK0JPv2QEspEZCS5By3/+J7zyP0/43hF6554ZQ/C2559OtIQUYylew99aaE5CkHczHZ9oQ0
	T
X-Google-Smtp-Source: AGHT+IEjj5zOJcj1/OsRfe5VF46uWo7cJGLTZaHw0tlhP7T8cxub/kFHcc4MiHV1iodJ3D5MAmAOeQ==
X-Received: by 2002:a17:907:9446:b0:ac2:b73:db3d with SMTP id a640c23a62f3a-ac20da4c87fmr226467166b.4.1741163376857;
        Wed, 05 Mar 2025 00:29:36 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abfa393dd6dsm453290666b.96.2025.03.05.00.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:29:36 -0800 (PST)
Message-ID: <1975f2a1-9461-400d-8b3f-f40e8b94be80@blackwall.org>
Date: Wed, 5 Mar 2025 10:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 15/15] netfilter: nft_flow_offload: Add
 bridgeflow to nft_flow_offload_eval()
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
 <20250228201533.23836-16-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-16-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_002939_145633_101AC71C 
X-CRM114-Status: GOOD (  10.71  )
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
> Edit nft_flow_offload_eval() to make it possible to handle a flowtable of
> the nft bridge family.
> 
> Use nft_flow_offload_bridge_init() to fill the flow tuples. It uses
> nft_dev_fill_bridge_path() in each direction.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 142 +++++++++++++++++++++++++++++--
>  1 file changed, 137 insertions(+), 5 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


