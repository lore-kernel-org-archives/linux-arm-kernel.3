Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B980C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=; b=F2fzhC8Qi+BV1iDguC27g51NSH
	+4gSY6qYQ3q9e22DqX+ORtTqBSZ7CK33T+1ZCFzS7ZdKfN+wPphlHoeeTGDXrAyzoVii9wQq+ysaD
	gjUi9V2v/UbPoZnjoHw4HGmLU4G/0J20lP5fmxP7S0v+a8NtnZ8tX6fnUuPPPzzQL5HcHBhOQNqlm
	OnvztKStgvg5iz0Eg2smlTPEVGs3c13hOvI3kmeja9HMYRkYY+h7sygeyKNQuoxbY8ZvCEYYPauSR
	VCT3q+4wd1eA/1foVI07Ypu7W9NoCtT5QQvlI6+OAwNDgmEQ0baTlAW1ilmouQcyp+lUhf8MxQgjI
	0aJawmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tib5l-0000000BWW3-027q;
	Thu, 13 Feb 2025 15:25:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tib3q-0000000BWAD-20WP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739460209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=;
	b=VoAAzd5K4tpWqrJpVm3VD/SrtZX4sq3RI3Z/Qxb26xYeVS5zY+dhFGxbACpZw6lDrhgZQo
	EYyOpMtJhbrejiFmTIspNamqTzLGY1cqMr38DWIxBCrdsN7MqSIX+8YJX/36sb5gtD9yZj
	WtxD28EU4aBoJKltnU1Ly+hGlFCwcX0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-YnANWIEGNzuWmFC0ps8JtQ-1; Thu, 13 Feb 2025 10:23:26 -0500
X-MC-Unique: YnANWIEGNzuWmFC0ps8JtQ-1
X-Mimecast-MFC-AGG-ID: YnANWIEGNzuWmFC0ps8JtQ_1739460205
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4395b5d6f8fso5492205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460204; x=1740065004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=;
        b=BihFubo/cJpYiDeUwfjVXjhs1Vr0Zl2YnF0IQwJdoACShg2R89PVcqkOYE3MlCFyuH
         76BOhKRlo9mQ+zndP8QX67bPwXBI5E+n6tW0oXnjVDLqTXvmFP+/WwGraqKZhLOhGBo+
         GC/KIu7jdn7+d785Fnl+mQhFlmUT4JDWNFaW9q2r8WhCyk+j3w1xZVfJXr+IXf+dwWEe
         2vdBMuotFtKxbXFXB8/QUjx3p5jS41zuDoyeR+y0TMf6M4bPTa6T3yzEpJzJUyWkj5TZ
         qtZ0b2wSrJelZV3D75Daoh3HZlGKNDv9pOcX6+hpX7ieIfZZP+5z3z5m4Uvi64pWLfPq
         3uAA==
X-Forwarded-Encrypted: i=1; AJvYcCUAZiAAusCAPYFZelEi8kc8dlvCGaz4mcVmhh9l+CXQzYBSxaKWRsGSqtx1LYB4NNXpJ/RwGdIBTpZz+f+NilSE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5knQeCECABoux2uunbe7nTrdm2A8Hj0Uae7V4SLNMUWaKvIkz
	ueHCEQ3KmoDuvvRv6gXoOYcM5hqarV4Ba4uRu0TSk3WpLomYtePztsArJ0NYkkl2PQmsoAnAv5V
	l7aodLYgboOu4D6YJwOlWnL3AdZk2RNFM6y5VHMp0jec1I60FREzwL94hrcVNTaNsgPjxsE1k
X-Gm-Gg: ASbGnctz3KdO9i8V1uSVODYpS6Ini0+pwnvFqJ5ib4sw50v8Mz9cT0SwBrg/8PQVTlt
	brH4xvkSf16fg0XxdNWv3HuvdpgWj/yCpdiggtq+4B9F7iETqcsDqmiasdYL3h4VOUBlZcNZh+c
	uyi7VIRemxHUGx7Y/vAP0e+cq2x+sihiwDVUtMK1o1uHdlwsNNGw0v5V5yhD4gxg4IH395LOolf
	iEXnV10CehgsYYd80zYnrI3BDkyJ0aAfLkv2kC8PQ8RyAdhTP8lRcmj2qnD9SGB1Ik2zWMVNs9B
	yrPotcY4tMWZPH1r72xcNTN/9PlV7VkkuHU=
X-Received: by 2002:a05:600c:3485:b0:439:4a1f:cf8b with SMTP id 5b1f17b1804b1-439600fd7dfmr54743625e9.0.1739460204564;
        Thu, 13 Feb 2025 07:23:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGymZURXlriQ+0kCVr74FRJDVtnnFD1vedc8hYAtNzuqdxLQ8CZrwzTUv5N0m6aIs3OGJqbiw==
X-Received: by 2002:a05:600c:3485:b0:439:4a1f:cf8b with SMTP id 5b1f17b1804b1-439600fd7dfmr54743035e9.0.1739460204161;
        Thu, 13 Feb 2025 07:23:24 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm2157953f8f.77.2025.02.13.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 07:23:23 -0800 (PST)
Message-ID: <6032f70f-4609-46d7-bbfa-c29a63f402ec@redhat.com>
Date: Thu, 13 Feb 2025 16:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <20250210125246.1950142-1-dqfext@gmail.com>
 <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
 <Z623GQHI_FHyDyjE@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z623GQHI_FHyDyjE@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wfzUb2FTlvZa_8pZxKeQaYroOqUWCKacAu-gXQLbGhs_1739460205
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_072330_596457_D48A477F 
X-CRM114-Status: GOOD (  15.61  )
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

On 2/13/25 10:10 AM, Russell King (Oracle) wrote:
> On Thu, Feb 13, 2025 at 10:04:50AM +0100, Paolo Abeni wrote:
>> On 2/10/25 1:52 PM, Qingfang Deng wrote:
>>> Add EEE support to MediaTek SoC Ethernet. The register fields are
>>> similar to the ones in MT7531, except that the LPI threshold is in
>>> milliseconds.
>>>
>>> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
>>
>> @Felix, @Sean, @Lorenzo: could you please have a look?
> 
> That would be a waste of time, because it's implementing the "old way"
> including using phy_init_eee() which Andrew wants to get rid of. It
> should be using phylink's EEE management.
> 
> The patches for the mt753x driver converting that over have now been
> apparently merged last night according to patchwork into net-next, but
> something's gone wrong because there's no updates to the git trees
> on korg,

this series:

https://lore.kernel.org/all/Z6nWujbjxlkzK_3P@shell.armlinux.org.uk/

is in net-next commit 443b5ca4d7245eec9a9192461113a4c341e441e5.

In the past few days there has been a few slowdowns in the kernel infra.
Perhaps some mirror or cache not updated?

Cheers,

Paolo


