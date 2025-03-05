Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=; b=0ZoH2HYnr33CFrDce7nIdoucm/
	KzM3cEZB8nHS66SzZZB4at65W2hrWBDdTM+TWsNZWRsv85KoB24sVALw8sSskcIBeqbBS2UFR24EW
	GpPAwXrPY532MzicDkoe4xa23+vopFw/5giPReliVtD57eJFthrJW7Qg67xrIfBygg3mihsWtVUpY
	P5tQlWd0h2EYxvlfSHy3bZ9KqJTFwfeO6YALGjv228/908V+n8OaEnm6Rhlvj8eFnAt1NhD9JXtaH
	V/HGxoWdVXRiDHFYIPyQTSCrGI3nJnldscxxMj4GC8aR07N/VdF2l8szdErXyglzXGqtc0AieFrS4
	KVlrZERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk8m-00000007NNn-4Ahx;
	Wed, 05 Mar 2025 08:30:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk0b-00000007M5R-27B2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=; b=thLhCXZ6oj2EuGyYSPlVvSlLF0
	08v42EPFEaTTlK5fJ7wN4J7n/v1ZbUIiXETI6K/dqMHVzNPGcjCbg7Vqiyb7bLniM29uLyxBkykAt
	j59EPaemRBzmhe9krL9DulQw/Z8ntR7Yddz/T8ydgRIOb8RgM0LpIIAt94WJnNmvAJwFPPFG3hBZ6
	d8n8xQ2ch3AGPRGe7F0IPA/UtRrdx/VVofvkESa8W2W+RQDzhsO2dOtrIo6SHpUsOE6UMGYkyHphP
	XkmUQphnU3oMBni/AL+shiAEPsaJhebZiiAWin2jfuItsZJU2wVoaLepE2WA9muK+9cBrOr+q7Wfw
	8LfQu8/g==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk0Y-000000055y0-2Aa3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:21:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac0b6e8d96cso431720466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741162896; x=1741767696; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=;
        b=ZhtijU+kdq8FgNi+x6h6D0tGFZRoqWK3/l3Wkw8NYm4LN9XBNYyx2uQK925sEYbT4K
         thj0cG8knKAUI4vLf+NTkSD+QWlhA6BAk1vKxZ8z6g5eAso/Mo+QJLeQQ6V9AsZUM711
         vWtv2wdZ6qOpBZNTKl5MclPgmA/5Ky2HOjmkfgpGzFBPPMzRr2U2K8WIdNjTcQnrTYmP
         kcCeMvVRpTafOOVXapSbPwWTNwO5FkYbnm0QVLgGYghoZfHyYlJagqD+PvIc6CkkBpYS
         ETIW7NR/kOr1tAczKb4pxCtSSgstuqhVc1GpFpkoz1NBSQcT5P4mRFj0sDESIl6u4Ki8
         HJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162896; x=1741767696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsv6iruxF/55s5GG7wPPBagKb4juSNlpcghKgAFq1qg=;
        b=FAADFVBXsumTDMQYfN4QTrU6nP10M/MaoW5WJ5ZbijYwORgI3jAmZ+tx/5/TrTgzOU
         plba7olayVH/J5Tb+MU56de9ZlVOKP+W8e70/JXfJV4/nQOwpsXsBjHBmPDn8plg6kfX
         kF8lDwy7EAlQrBvUo8tLGvkSujKWgSMRnZOrlJmP1IzzKTofXToAqT9iB/AF7yjC+06w
         MNuovcnUkZR7Vi+TXZ8ykTN56DJ6g3onf+dA3o0OOvZ1N4NTuYIWnIANAuVH632ZcVNy
         xKVbbRBUieDymhniIY6zSvAKx1IHz0lXLxYuZFrc/xgo3J5fsul/FPmREpQMgccYSHmV
         nEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoaPVxiVAqermlA2wzzH7hqJ/vT8BT6QbsOPtL3Fljs+2XmmN1QWtPFoPww0xpRRblxhob87OfCiAxU5mI+kFA@lists.infradead.org
X-Gm-Message-State: AOJu0YzXwTeYMsQHugAbel+yRZ02U/m+uLisHUm1zX+afCIUNqJHLH+g
	T10f+FwcYbjaujxC7ZD52BEDHP17DFTJqBURrzrGiww8c3NxCOjT9kdNrAb1cdQ=
X-Gm-Gg: ASbGncsyQfD4NUD3Ono1hasypmbDEPNr2QzKTlmdE/U6zsxrFXVzGXO3FRzsQKlpw3c
	a5uieV472BgS7CJrWU0PmioPMuy2ZrWcgzplkoo7OwzSreZx4t3oCIPfCPphx88p1JuFyWJrE70
	rjHJSH2ylvRNWA9gJJXXgqsockW8N/X8XR/TZCiNbPcco9fEx0RPelMW/PyKy1r9asw6Gufqc7N
	5lZylUP5HTZ1HGt3z2ui0XBVduaFWbbKR88QIrO5go2hnqE9MhrE89jOaPs2+80pMSEBiuQX0kB
	qti/RnHMH7jPNa2xn7menQtRneab9An2a2M0vR06Us4kdumGwOZTo+RTVNld76FNq396T9kRWHO
	i
X-Google-Smtp-Source: AGHT+IGaoXnq3lSxzaaUwAuVfK+jenlYaXFrv+TPSgSHSnmbmoUQLeCI462sahYSphebEzq/qYnUHQ==
X-Received: by 2002:a17:907:7f0b:b0:ac1:fb60:2269 with SMTP id a640c23a62f3a-ac20d925048mr217259766b.27.1741162895402;
        Wed, 05 Mar 2025 00:21:35 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf58804b49sm693744066b.26.2025.03.05.00.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:21:34 -0800 (PST)
Message-ID: <b3b5418c-65d5-48bf-8868-2d9abcb4f758@blackwall.org>
Date: Wed, 5 Mar 2025 10:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 01/15] net: pppoe: avoid zero-length arrays in
 struct pppoe_hdr
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
 <20250228201533.23836-2-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-2-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082138_568911_56164F38 
X-CRM114-Status: GOOD (  12.74  )
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
> Jakub Kicinski suggested following patch:
> 
> W=1 C=1 GCC build gives us:
> 
> net/bridge/netfilter/nf_conntrack_bridge.c: note: in included file (through
> ../include/linux/if_pppox.h, ../include/uapi/linux/netfilter_bridge.h,
> ../include/linux/netfilter_bridge.h): include/uapi/linux/if_pppox.h:
> 153:29: warning: array of flexible structures
> 
> It doesn't like that hdr has a zero-length array which overlaps proto.
> The kernel code doesn't currently need those arrays.
> 
> PPPoE connection is functional after applying this patch.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  drivers/net/ppp/pppoe.c       | 2 +-
>  include/uapi/linux/if_pppox.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


