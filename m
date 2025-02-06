Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C8C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=; b=dmI2wU1IwNm3REl5IBvfeWaN9v
	c9j1NlcgKBWfJrp/qdHAmtI4EburLMB6VUsKqHoA4kUun2fV0pRM0jLXdrJCjYF2vBeAwA5MPLu2w
	X1lQ5JcgQO63eRohftLEOpY6R2QQoed1+BVZaADW5eqC5xsM9zlVRuRPC+jS8PEqi+5iymMBi34Af
	5vRDgdBbDbbSKZLlVm05QJ4IRxYP1j4Mk/8BEyJZsSLBgWSG6MMItR7NGFy/5aiinyfADqCk4gJRD
	hhsa6AB3T9ZL3Kpd01qtW7K4VJmVhj2BbgTEyA9oy1giEsg5NMVdWeTOpbBrkP595LPGxN6a2GSWk
	/LaSvLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2zy-00000006bqA-3gyl;
	Thu, 06 Feb 2025 14:36:58 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2mh-00000006Yjk-1LAQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:23:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5dcc38c7c6bso1959365a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851794; x=1739456594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=;
        b=zdE2MWGffMnq7DVpjWNXmykwnZXhoE9gGgswuXoTn7r6JspB1+PHEfoAWkZcVgM5vs
         96tr/K1+OB6FHEPHvyca1iKnoIC9CMhnGQ+NJP672qBqnOnuGEnTOSUJVjCJTDgV2n3N
         du0e0lFBWtJhZCZCXQeFN5d9T1gPN8EK1TQ00ARY9Pr2yCHSYWsLR4qje3NyCqkuJnmY
         LfNrXxPgQXZCfEW0Ds2+9+szrjYKCZNDhyvoAmAknMFSW9xqbNZRyLWXR88VLsfBQBkK
         F4P52TV08j9tNnCuBw95+VMIorXHf2+mxOKPjcpWSci2BEe0bJ5Z1YyilISGORd5Wkb/
         ArpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851794; x=1739456594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFMFd8yvXqVnAGCGrRETRe/V8KRYdG7T8ArDcX9VBwI=;
        b=adMpKe/+U/o137mYBbzlyGzbR2sJiaDntzuLZX5Y1M0vLuABgHoDmf+OYoiNkuh4rD
         3Y/of1/LPVEBT0YQirAPahHa6f0d9UXhL+xrXP463cTxlIl1yAiXii8OVmcGozDt8beI
         B9e5BXNhpRzkUizVtItq9yuJ2U8RNLXK/YeaiXE86fZ53jqk/Am1cWxhcBnblc7a9L6c
         feleTNTcwCmR9w0/d8t9vjhcULxn3Zs4nnB9BGp5DCvetVw7yZFp4hYriPR0M+aulHf0
         /NCreGw6cj6ibol9wJKNGdrSOOHrH2Se/g7v3C5QQkhiGs6laOBAyue1uKHJnd5CfP1w
         eliA==
X-Forwarded-Encrypted: i=1; AJvYcCXWc5YFmlBUPUJwd85WXKWzBqhAOOtLPgG7NoCIp2WEf4M8d0cRrZY60lkiOgimjaps9HCE+kxZWL208Cq+0+b+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+gsGssQUqtdi0RCCWU46Q3cO4MvrELEjWrW6CZgCGIb5gUOW
	KKlZNy0UEmuiqGELb8dyGFNsX+z/NpBTEfdu+PZXgpU7L0RcBhFdAjWPA0JY0KY=
X-Gm-Gg: ASbGnctoLpkO1K6OIRZwNOzRFTd7IU5Huv5uetBRQdlo+1EkSAxYtyorGJsBSA0CrM+
	M3Bmaw0FIES8BAACoaaH1pTvFL3oGOJ+8ojowq8M8svxfdYbikDZkFNVED3MkYXfQsjgpzBQ/JI
	Q8+a7ohZgRdME3d0+/LvyhekNtBqCTRwSVbM+Ceg5wiECCJyt8TB6P5EGnxFni2tpBOKNAl24I/
	TnXk8qubrMzA+KDAw9c/zzBw38u74HO2NsuGthInHsR9J1Vg+hCrjartr3Bygb0H8FSQUazUr9+
	wbuC2hakRhHnVKWYJMpWKsvVCNTwm/NEvQRcBCy7ki1cA38=
X-Google-Smtp-Source: AGHT+IFFyvQfINAl6lz2A01y9ohntI7gR0hYfp3ILlqctgCUIUMFbzNkfcNhO1QK5iS0p6NSxCJe9w==
X-Received: by 2002:a17:907:8694:b0:ab7:b93:f77d with SMTP id a640c23a62f3a-ab75e245be1mr816768366b.3.1738851793676;
        Thu, 06 Feb 2025 06:23:13 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f486c7sm106211766b.23.2025.02.06.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:23:13 -0800 (PST)
Message-ID: <5de6707a-6a77-41d1-8964-19667a0e91b2@blackwall.org>
Date: Thu, 6 Feb 2025 16:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] net: core: dev: Add
 dev_fill_bridge_path()
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
 <20250204194921.46692-7-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-7-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062315_373755_89D5D0BE 
X-CRM114-Status: GOOD (  10.74  )
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
> New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
> It handles starting from a bridge port instead of the bridge master.
> The structures ctx and nft_forward_info need to be already filled in with
> the (vlan) encaps.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/linux/netdevice.h |  2 ++
>  net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
>  2 files changed, 55 insertions(+), 13 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

