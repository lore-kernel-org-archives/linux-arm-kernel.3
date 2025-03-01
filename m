Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6695CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvcp/Ow9PKUt0GAoY+iQqvy3UdZ1k/popr5tmmzvjdw=; b=XoshiKs8nUnPy1ZU4CzQBuoPVL
	TwKSyo1ZDHE9KvPnYLIe9jjCi3EkyAnVDbd0FSaZH2h9wFVlRjbU27VE6Y6+H5gq0ffNkedYVxasA
	bKlJHdMltPt2VIo1zlrd/rxhDCC1EtwJplWVbZu7TYpHaODIwPo0ZB0eTr6EhmNgjLv6wwNGjHUW6
	7fWoAWVsrGRk2o90MeNGI+EfzQLUegmHJGXKbGG7x9ZkryZDZ907UWxWQU/emPHKa/Jlx3daP362l
	cO5mrqJ6JQvVUMjS0QxWMCazbHMliDA4bpCIYS7OxeUGVVnpr23EzBh7pozezEDGOittoZG0+e3T0
	VYIEpHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toP5Y-0000000EZer-3IJx;
	Sat, 01 Mar 2025 15:49:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toP3z-0000000EZV5-0MaR;
	Sat, 01 Mar 2025 15:47:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf5f4e82caso46818366b.1;
        Sat, 01 Mar 2025 07:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740844057; x=1741448857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvcp/Ow9PKUt0GAoY+iQqvy3UdZ1k/popr5tmmzvjdw=;
        b=N5m6UPJylhCy65B06MVKVYxjTqQqw9ZDnzaXMoXdMDlR2OK3hDt9H94yCw4VsPGRFl
         nipI4gXaXrZI7sYn+/GUq6ta0Cpf86AQ1hazgzE6OGOls4eI8SXRAPdyzJ8EMVlIcuZN
         HQjS+mbd3p2GTSEfbBfWNKaEEuEhBcrZ5XkYPtrLPxtmGbTXAVxUuYuGJRHzev5rvilB
         E9sRQ5fHsln+0PwUjgr5A6BlxDDhCEVyJQ2vR6oc9UmxdnN7up/dhjpwHjzXnlDIE0/N
         9xQ57NW4zktZAAkKyGAGFJ0xb9kodza9bt6d0zU6FGwEAGpDh1GDicALxAQ5AoC6AIE6
         rpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740844057; x=1741448857;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvcp/Ow9PKUt0GAoY+iQqvy3UdZ1k/popr5tmmzvjdw=;
        b=q2P10DLNENsSwEvJDJzBvIQwibXRu2d9feDuJT0cZyQ7H8KhsWaEfsa0YWV1ZZHSFR
         yEbTh9ER7HBa+TrBNjgBWoAMhl6dSyGGg7qP51/VXXY6hbsm13eNfGWItVdWyIKG7t9z
         qrgTblAxm9ouGCXKtdRlx2j0P3k5KJn2HrYpplZkDPYgyXzUi8pjBNhx0frRjZHH3Yf7
         3svZUCBrsLxUuK8UyUzezcuoUqws1d7q0INLgapitth+8Kd8+pbtOdaV1NbKaUJp49pu
         CLKANXDbVMkYzoRoLTWrVWdZB28VIKZSpqk2AyDMTE/pWMu097PKiO79RyD+p0ZlENH0
         wU5A==
X-Forwarded-Encrypted: i=1; AJvYcCUFUZoInPqb2xu2oHuL/ZrBMEVgjRwXYKDlIGSH/w8ZWTUEKJX5qKzZEUWbUIXo/dEIbf3ZDZhLM+d3UWeQ0bko@lists.infradead.org, AJvYcCXlzKT8q1oXXeQQxE2Oe8yPXz0c/WulPqamMGmLJGqJdBNPr8GTW1ZSgH6O4/n8Njg3OCWlaJ0Pnu/UlLiwdJY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuzueg5pLz8jPvs3Y8ZRjYi/WwEMaMliGZU1uD+cpE2RGsVmHO
	TJAgDsxzVX9zb+UUh0aFkiPOhvLtpynZz3f6vtGUyNJz0sAo6OEA
X-Gm-Gg: ASbGncu8I0OiHlj8nZy0H6BNNlt2IWlsr9ZGlHVWVOTCqfMCjp2IFM+gj8iqn2VyuKV
	P8IGQJoLdv1ex15uJT/f1pw/dGYIAJ1d2olwTLutyPLzgq0lpOLCguMVDhXcS97SO31QadaCwQL
	puB71M3X0VBeLh142r/UBFXDo0NU9YvbrfCYre18o3HDn1FiRx46zPFqU1g+mYfAw6gg+/8lSoE
	DXGtwOMyWWtfg17yTWocVKyfxgVUAsGc06rfhaAUjwf5tYmM3nGj3D6xKweA51HaAlzQVYOnDuG
	v3e+7L0fd+pttpt5GPRQNAfTUhcRhZ0p4md07mtnMbmYBtUBsT1GKOmuMkQxlQw4qtLndfm/rs3
	OFLu+c1/IGidVWSPHp7BM1YqcvTjg3GoBtGZgLc0TKZfCAYHMzUrpwcm9zsgJXmC5AP4bBOxm3+
	5gxYrLzqHVZMhjvsR+Ukg=
X-Google-Smtp-Source: AGHT+IG+eqrFeyO3A7KDD2S5BrzG0fkxCUE3rRFtAlmdPlWrBAor9q1vffWfk9dSAf3TW6qzlDGFvA==
X-Received: by 2002:a17:907:2d8c:b0:abf:4c5f:7546 with SMTP id a640c23a62f3a-abf4c5f7590mr317216866b.38.1740844057241;
        Sat, 01 Mar 2025 07:47:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d252sm4287355a12.26.2025.03.01.07.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 07:47:36 -0800 (PST)
Message-ID: <fc5129dd-35a8-4bcc-8e54-b8facda2cbc4@gmail.com>
Date: Sat, 1 Mar 2025 16:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 01/15] net: pppoe: avoid zero-length arrays in
 struct pppoe_hdr
To: Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
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
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20250228201533.23836-2-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_074739_135098_A457A58A 
X-CRM114-Status: UNSURE (   8.00  )
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



On 2/28/25 9:15 PM, Eric Woudstra wrote:
>  drivers/net/ppp/pppoe.c       | 2 +-
>  include/uapi/linux/if_pppox.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)

The maintainers email: Michal Ostrowski <mostrows@earthlink.net>
Returns 403: 550 5.5.1 Recipient rejected. This mailbox does not exist here.

