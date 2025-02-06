Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026FC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy52E7wooPVVAtEuLO+Qhyc2iLHEhNjVLiIzlhHyrWs=; b=lIFaSe6rOgt7Q9WnIPKC8dU+8V
	Z8W1OwgCV5nY+069vorJdlOZDStC81Hxn1MIi8EdiiWz/tartHn9mZU0+05TPnBW5CYgs1OF6HdEw
	uD2BznGbwVBTNNSabr/M3YgJY+S/9c735runI1zwVe2uAebZv8o1qE9fnqkKCjzBpbZh3CEVPLqhf
	uEpOen4neOcbsYlqwNRY86h2iVLj+jdaYviLN8TfkCgHidQTb6jt3PpZThp24slaXzDqGQ2xt88nB
	W++R71jsfQ4MS4zdQenGw//X2CTOdqmNeR7kdKQ6yL/bpg5oSmpMKL5xb4jJ13UpPUzMCt2APGBfr
	0MdfxZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2vZ-00000006b68-1poi;
	Thu, 06 Feb 2025 14:32:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2ll-00000006YV3-2RMg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:22:18 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab74ecfdae4so143941366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851736; x=1739456536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy52E7wooPVVAtEuLO+Qhyc2iLHEhNjVLiIzlhHyrWs=;
        b=pM/nAHsXAtqxMs0+OpDQzeMnBeu6sOEpI6Ee4E/JCfe+9gHBaKamPhh4YCUj6bKGRe
         fplN/9MTwoHM5Lo0fSjg0tQc3HmvoURDaIPfFD+2wTZ6ET8+ZJ/wmRp60BHwz+TYHr5H
         kKo+Wgaj/50s2lJolL/3aTYKjbCVKKyHojsL4LX7eZcpGONvPsNNSyPeTtpixDC2rQ3T
         mqIoYVlzaWHW4TTBRlvQiHDPUElbQPIFSKXKskIVzo7S5rtoBPAsoTOIqZRJlSAiyUKl
         zxzeAWrupQVBaKSJJUFzn1Pd4ueesH64yt310nb3S6fd7pkaKxhC83gK+z5QNdYe7S5x
         UVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851736; x=1739456536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy52E7wooPVVAtEuLO+Qhyc2iLHEhNjVLiIzlhHyrWs=;
        b=VL/TuiwFxgB4WYT1PVsYP83NzMyZ0WLRIlarhovKUk//pg/VrQJmFOV3nIEn4AvFB6
         MDSU+jOPf53ok/eQNqYRWEX20HTb5OYUgauejI7YeBX2aIbiOy//9u8Mkyln9f9peWTN
         QurHaMIvVrxaI7AirFWaPrrxtNB0lkOj0FTJPGtEcW+1SsC1jNCQLcWS/S+eIS38cam0
         avrrT5lLOQnvynlXML43FD1Jvzaet1tLNyv2+y4At7xyuTrXZu5ar4CP/fjuV4B+OcS7
         zzEYG9GmaaQvaFwRb+IFBXQJGTwLuMIaxrK3GDAwqtS3OlKrx04EZQii/qVIiNJZpMkJ
         pxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeLx3KNnDstL0qq1JucvqeH8157vWgZIsqKhU2qjsobeh5idrXkNQ6/EsMAFlTJQ0QdX2OMDLEJy5cjGRbf0H1@lists.infradead.org
X-Gm-Message-State: AOJu0YwknihzQYv4yrlOyEAUDJaSK6VJ37jaUj6iLo+gqBjAAT1eG4+e
	rryJRMDbKjANFdrTxDihylYHFcLKnISwOYBqj7csPq3cCpZl7jvsc3UTRoqi2Wg=
X-Gm-Gg: ASbGncsuZSp7J8WLsDsMh9tLPK9F9gAz6mdRmagSxQkqFyCvry2yEbQlkRcT7B4Hxti
	cJfTBWOiPb3h1BhCf1+uTHaw3u2G1IBHMVHk68QGGE3buk9ACzzKBDdoNhJm0dBv5zzkpJnHwSX
	J4GaG6lsbmDOu7DxJfB05BP1soDQt89KAzSxxFt81PG8KpO4FQQ7izflBoZwdGy9s4v85g+8oIs
	WbFVcWgEYkQa3WfrOxYRr8w/BMF1iNWK8FYOukSJY/x+JI9N26iWMcU+UUGc3FrmPL29hS61TDR
	KJpSJDKr2zYsswf4Oc4ZXB130eRsQJohCHsDvwAGXCA6JGk=
X-Google-Smtp-Source: AGHT+IG6aiDjgy1nFvIKHnHHwV2g9kBo0v+xziTDZFU9m8b3NS4nlzYz1Qp3ZZ0dcQwrhEvWNvqV8Q==
X-Received: by 2002:a17:907:7249:b0:ab6:36fd:1c8f with SMTP id a640c23a62f3a-ab75e2f655emr719799466b.39.1738851735691;
        Thu, 06 Feb 2025 06:22:15 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77f5f5a0esm40785966b.155.2025.02.06.06.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:22:15 -0800 (PST)
Message-ID: <cc8b741a-72a4-4059-bbcd-3f32c7ef56d0@blackwall.org>
Date: Thu, 6 Feb 2025 16:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 13/14] bridge: Introduce
 DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
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
 <20250204194921.46692-14-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-14-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062217_625795_2EE331D4 
X-CRM114-Status: GOOD (  12.84  )
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
> This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
> bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.
> 
> It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
> ingress_vlans set.
> 
> In the forward fastpath it is not needed.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/linux/netdevice.h        |  1 +
>  net/bridge/br_device.c           |  4 ++++
>  net/bridge/br_vlan.c             | 18 +++++++++++-------
>  net/netfilter/nft_flow_offload.c |  3 +++
>  4 files changed, 19 insertions(+), 7 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


