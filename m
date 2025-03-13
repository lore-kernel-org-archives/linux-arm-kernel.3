Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBE2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/aqvoIKuR6wHeO9Dw3liQGVZV24Y7M6R/uaPC7XW8g=; b=oLWNASEHhrgg1QSSw2Ty4ff+ds
	Ylz4yNVO9Ju8754lD4GJPjPHtx4CwDA61dTOQD11B6U3e/AhNcVBKg/f/xeZoci0kigIGmCPG1uy/
	VujS0YGZs0E+xMGTYXhiaNBxPxgls/Ht4vwuJRccX0VVAduiidt3tx3SRStkntXZUQegFCIFik6ZP
	Mo/27pxC8AH+fO+wi748QyQME27Rx4+bAStC3xm5kliBTG5O0uXN+8N4OErjxU9OIqzJXpVmTth32
	6gx+QbSZ1gtlw383aHOsVyPkaUmI/4C7IiR0VO4V2JvJUviwHziI023YrlLahQWhbLVcHVAr/emIA
	rbiPpw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn5V-0000000CALz-1llk;
	Thu, 13 Mar 2025 18:15:21 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmsL-0000000C6G3-0sJU;
	Thu, 13 Mar 2025 18:01:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so2316331a12.0;
        Thu, 13 Mar 2025 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741888903; x=1742493703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/aqvoIKuR6wHeO9Dw3liQGVZV24Y7M6R/uaPC7XW8g=;
        b=eweJL+/wA4I2Lz+tr70l+93WRnR8w+9wv7yhdkLp0uY5VLoioARDiUkjzW3Z0fA0ka
         n5FP7xjovNWLz/juN+t/w+437WKSolSD6oPbkQAv0iYT+1X0QQrS81goGd2ZCgc10f9O
         UYIIwMwVab1Tuf4LRJmvySxQTrYKJLXBlP/05/1YlAckLLFGY8xUgo7vF/Jk6gJRuFWl
         4g9aCTa4NkCzYus8/KVpa+x3npaxoVe+5u9lmHQnyukHsFxZ53J652L/5RhSCJZ/mXgD
         /w4o23mD0H98vidEI4x6OgFqNXYzMuljvzMSSUqcPECYva+DdlqrfS1iJelEtlzfubE8
         D5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741888903; x=1742493703;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/aqvoIKuR6wHeO9Dw3liQGVZV24Y7M6R/uaPC7XW8g=;
        b=a3KOeWS/fRCkolyIRSnQw5wF0eksvTa4Vnu+x3BIT7dQRVOzr9+TDzp2Ya4JY1jqhA
         fBYRArO0OeTog04RtZRHBQ8TFF3n31JfgVJ3oEC6bhKH3ZXdVZzR1nXtqQp2mnKlkZmO
         U/fSetyP8DVAgUJhXTd55nowWsG9rAoYJgy+8VNNGepIRKLXmP663i9MVH/H0qu8OI/a
         ibQyK+H+y7IVCor80huD3o7niJgEiFd25l4KJFviSPVWJFM2MhbJUWybtmhdVWuT392z
         n0Gz1xYQssnLAYKDpdqqGLkKlxToJbP/WK2m2Ixj11rj7yzaSjyNj0Tytg1509G1Y709
         g8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbwh8GIGd1MjLekMULpmX+nyTsdbVA7j1e9oAe/+RwF5DCZ6yLYSJZCfP1qg/CDv22oEGHVyS7oLpsvfKNZN8=@lists.infradead.org, AJvYcCWSTGUc+rmmP81E+2o2u1TfCGeiAsPnal84z2P8b+RaE02QLxgCGHwGkvtFVhFYY83hRZ9T7qrAUd4JfGV1Jn4A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1f9mlGuyLFxFKI40gxjANa/OjGtb3F9fOTvMkdTV+TNMKfckb
	He+yfgda65u7pjdPFPnghfEKMACzUHbUye1q5+9H71WGLKYBJTU5
X-Gm-Gg: ASbGnctCeRQQrvQQoW6pZ++I4OKEQIGUYzPs0q49QZyUVkvFIi4qI3Qv6bflcOcqZqI
	4jNjxwHAifa2PtGmMmhFbzlZVEPfXFKVaxWw85IFWFU9ctdg0O38qYyRDH3SBgCqiOzBcW5Vhkk
	QjlVpJg8UEVSjqrOD2PtafrBAb+cpYvEO8rpzb25WTzYiezJrvgk4skI1Hvd6N5JhhTPfcRAPcB
	00E/1SYrjx+nHiK/wK/7Kne0XClkUj75gDC4uzxSeOsceCqFV5D97fEEXcUdoq7/M3KTX95hu4H
	TmxzFdrhH8IftACfC68NiNVtMbdcvZyGqoGTrei5d+SxSxyJtbKQe2TUPqkYzXvQqty0Ig2E62q
	TYH2AgLewVYKCaJFg86n/1gwDfqdR/5cow91vW6F7FVF8yegDMT46j7OnJIEacF6DjC5kZigEdz
	3Ac0z2UWVreVGkAg/U90I=
X-Google-Smtp-Source: AGHT+IFuZtAhl/EeTwlESgZEmFiH1TMtmKl7RGfRolizt1DBUCNDPnPwoWBarCBAea1UlBVhaKlHyA==
X-Received: by 2002:a05:6402:2550:b0:5e5:9c04:777 with SMTP id 4fb4d7f45d1cf-5e814d805b7mr3320106a12.6.1741888902566;
        Thu, 13 Mar 2025 11:01:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm945413a12.9.2025.03.13.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 11:01:41 -0700 (PDT)
Message-ID: <02b97708-1214-4fa4-a011-70388cff8f79@gmail.com>
Date: Thu, 13 Mar 2025 19:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Roopa Prabhu <roopa@nvidia.com>,
 Ivan Vecera <ivecera@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Ahmed Zaki <ahmed.zaki@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
References: <20250305102949.16370-1-ericwouds@gmail.com>
 <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com> <Z9DKxOnxr1fSv0On@calendula>
 <58cbe875-80e7-4a44-950b-b836b97f3259@gmail.com> <Z9IUrL0IHTKQMUvC@calendula>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <Z9IUrL0IHTKQMUvC@calendula>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_110145_253682_78E17632 
X-CRM114-Status: GOOD (  11.93  )
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



On 3/13/25 12:11 AM, Pablo Neira Ayuso wrote:

>> What do you suggest?
> 
> Probably I can collect 4/15 and 5/15 from this series to be included
> in the next pull request, let me take a look. But it would be good to
> have tests for these two patches.
> 

These are not most important to bridge-fastpath, but it gives extra
possibilities. How about concentrating first on patch 2/15 (with 1/15
removing a warning and 3/15 cleaning up), adding nf_flow_encap_push()
for xmit direct? It is a vital patch for the bridge-fastpath.

Anyway, I will look into writing selftests for conntrack-bridge setup,
including various vlan setups. This will take me some time, which I
do not have in abundance, so for that I do not know if I get it done
before the merge window.


