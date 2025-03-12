Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D0C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+vFr6C40IK/QoHRZZXYgKsZ4IfXSOBUm8PFsyPbVxQ=; b=YTPHkKZlRt8zBig+OEQDrxlp2j
	6tda2ipLMbBNDPTQ+n1WolpBSythbM9ByI93/gpGgf2d59xtabbbN43ws9WeIC5zcULDJkWeoJTmw
	bds9GxsdEMrX7T9mUXlmlWW3dLWgn3j0CohKqVDYY1PeJ3O+1sh6V0aFCXxCPhTuiu5zZpw2tYW8q
	1Jib2izmNJo5UTq2chNlZQcLqNGo5vuOz4ziehxbtrWbnUcXMHdh6S+w4hG2cnUc4XBa6oIXvhlw9
	8aAqvBbqV+BJLfwdJ2TFUic8GZdQ6jNPxDdXFjDcINc+zqOLfMhQyUkn52x5tkF9f9+b3ZvUcqHKX
	NMQY09fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOrU-000000091CO-3cTl;
	Wed, 12 Mar 2025 16:23:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOpq-000000090zE-0Z67;
	Wed, 12 Mar 2025 16:21:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abec8b750ebso8980366b.0;
        Wed, 12 Mar 2025 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741796492; x=1742401292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+vFr6C40IK/QoHRZZXYgKsZ4IfXSOBUm8PFsyPbVxQ=;
        b=bT1TgcTZ6EGi3u9S0euRhLJeZVzyfTXssu87LtzUvCFtp/dLJsCdSdoo+7iW4GKKe8
         aa6MvQnOtcQAEpCnSmB6Ie4b9FUdUF8zP1yhmUb2RxCoZyFMA2/b8ltZwE/1qo6yLjHD
         YID8YievmJAHhf6aUK1zp6aN+yqcY51AcgGaUPlDIfXBu0Ax38XbTgUsH6aZvEJs7VVK
         +2XDuKsIAEf1ARbWut7VFvnsnVbIiicQShwq7kocETgZD5wf76gibViTwFYf1M11MHwy
         UcASV0vF4g7bxMAQdO7tEX3udBQ2HmIewY4qKuMDN1APdjYhgfCH69iq67wWQW5Rxhns
         GSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741796492; x=1742401292;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+vFr6C40IK/QoHRZZXYgKsZ4IfXSOBUm8PFsyPbVxQ=;
        b=nXfAAEyWoAn6XbnTPspN+Qfx+Af6n82rbSbBtswmGkZklgC3Zp7PIYimXoWv9YUIdr
         OlMy0foN3PqhENuj/bDe0yafHKcDiuQr0YTr/x8RROyNhrrU0TuzI0wDJf7P3WRFW9Sq
         UjDEKBGRIWI+bsBDIIpCyBC6DGvZII2iFYyMZdaxVn910h0g4SaUAnmP6O3LTw4xovZ/
         WfiP4e3vP/vr5ybQGAsC/g9nh3oJ8h3QSUTPEVZZeA9QYhvDgbgYS3Q6S9/J1ty3JZaQ
         tU4MvtrXSGlo5pd4zYBMYccrqP2zHHqF7cGjBnP79SPpCfqTmQt86W6txo/Q+8JzUfy/
         mMgA==
X-Forwarded-Encrypted: i=1; AJvYcCV6aCOIN+EV3ux9DPol3dq0dR0VdwfoGJ00qYaCBKT162EcRKclkhjts91/fDRg/iTTSwEQsXGItAMYfFg0Iylj@lists.infradead.org, AJvYcCVUtAYBKfoYqhFUoxCEAwv+iOUb1ubp0ZPs2gsdjzRjJnM+TGP80aD4/1SL2C1EnWmOtK8vzFTpsfsStPk7c5A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF0XWwaSqIKV5KZoMbsK8VIY3CCgeIj+Z4UJzY3UNtvg052n3l
	6QDZHpg84LTGYLvhuDH+1C4gT2jQDQx33xPFVpAImgjk4/BY9UR1
X-Gm-Gg: ASbGncsriHQNi9FEJ0yAL5WvjN8ud3FR3WnOGeRPUkvb0BCMMB2JBwVojls/L86FDxW
	CyCe80rdvS+Ii/jr0oLzVA0FFNQ3VulB5nvs4gYM6CZh3YcWVGyZObAgWEyfTrjzmSMii3TaqWm
	vQ2WWr+6DKQAfk7k7FAeamMRq5XsgUIxrggIwvytiTxej3ogo5LU7UJAqc/btWVyWJ+98f8c6Ac
	WhrQrzaxTuWMN2zBsiQ8Cm+dReyt0n4ZPZFI1tyocNLMXn8tZHgNJSk5KT8kWN16Sf6iM949eeT
	2DMpttolkO8f8Oa4IVm5GWU/0QSlzCJccP9oUiOEilq65W7qAC4JQ5PbxFE4O40I0TjaLZ82goB
	std6BmqEAP7Ge5QItP9i1PGEiD6g0USZZua7+cTrROiQuWD0g5XHd5c4eVBsQi/oL1UQ5JOUib3
	35zxQyBuX6L3H0N9JqZlzW+MYp85B//Q==
X-Google-Smtp-Source: AGHT+IEaEC38X6pFHkhcOdl/BcwH+TXUrXY3YHVZyCJc94P4HbdEGDzPYfpH7BevKXGOFc1f9RUFvg==
X-Received: by 2002:a17:907:1b16:b0:abf:607b:d0d with SMTP id a640c23a62f3a-ac252a884cfmr2996838866b.16.1741796492007;
        Wed, 12 Mar 2025 09:21:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943945asm1081554266b.22.2025.03.12.09.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 09:21:31 -0700 (PDT)
Message-ID: <58cbe875-80e7-4a44-950b-b836b97f3259@gmail.com>
Date: Wed, 12 Mar 2025 17:21:29 +0100
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
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <Z9DKxOnxr1fSv0On@calendula>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092134_177291_70737240 
X-CRM114-Status: GOOD (  11.91  )
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



On 3/12/25 12:44 AM, Pablo Neira Ayuso wrote:
> Therefore, I suggest you start with a much smaller series with a
> carefully selected subset including preparatory patches. I suggest you
> start with the software enhancements only. Please, add datapath tests.

Then I will split it in:
1. Separate preparatory patches and small patch-sets that apply
     to the forward-fastpath already.
2. One patch-set that brings the bridge-fastpath with datapath tests.

> P.S: You work is important, very important, but maybe there is no need
> to Cc so many mailing lists and people, maybe netdev@,
> netfilter-devel@ and bridge@ is sufficient.

Ok, but my main question then is which tree should I work in, and
therefore which tag should I give my patches, [nf] or [net-next].
I think it will get more complicated if I split my patch-set and half of
the patches go to [nf] and another half to [net-next].

What do you suggest?


