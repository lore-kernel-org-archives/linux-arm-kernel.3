Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B7CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=; b=X5JhMeEHj2rzloa8k4uPoGS7+W
	ckQ2CSsTqJQsq3+yccQOr5VSnuuwizYc24IKLCYpBR2ArC90Pjk4vIpQYR75A5UjzI6SzP93GGcGc
	Q3ge0LgRsZAveT/1YDRwnpG3m/m0O/d5kcb3aGrcM+qwP/B1LFyH64v2rIcFfEm/xF7oSX9FShiGE
	NqkcreY8ec9TJQOazfA20cFtJRnaqXTg09g/cYzcSOU1H1a5sSSdp0J354r52yteUtEmeuZP3gIm/
	A1FKN6jHhoqC/pf7TUIYvgJKxerSoco9zz8623hmdWuypmxg2FkA1Z198GcP/EyK25f97aF8CMCHN
	czu8Q+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTpK-00000002vl9-0E4g;
	Tue, 29 Sep 2026 09:08:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTpH-00000002vjb-09Yu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
	b=Laz9U01a9dvZ71QmzsnFfD4BjNqv21bngLSf7dfMmRLb+sdamLaqXa2dO96I5vEFMH3dzN
	SQK1mFwfgEfgue6KoIejh97Ww6S2/zy80f9eNjwllWPmvN2QqkfOweJbkvFlSoHjUeaIvG
	f2+bKwWQEghTyWHwDW2VnqZ0FzJW3VU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-fIOI5D0KOdWYWC_ihGqXSg-1; Tue, 29 Sep 2026 05:08:36 -0400
X-MC-Unique: fIOI5D0KOdWYWC_ihGqXSg-1
X-Mimecast-MFC-AGG-ID: fIOI5D0KOdWYWC_ihGqXSg_1790672915
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ffde4293cso19139965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672915; x=1791277715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
        b=cJl2lM3V7kgQ5Tj3RY0Wh2OcxZeLvPhs9h8cZUb39P4+GwpPkvGNvxFRc5Q57ZT9JY
         qVy38CayLPj1XuuCAFKgYO2ceH7tpLjKUdsYil8Ux2Yj9LzBzgcq5ygIOD4KWpAbApmy
         FHazeIbY9q3jTuki0YErx8BfQSiDDZMxdvrl/vtonUAV0Ypafz70zjawOze7XTw1cL5f
         0TCw8Dh9ecA/h5DAdJ5+PONbzGAACrLNLTt/QDIg6XqirxXwiZasTh37ZWwps++23hL7
         R26kLpbxsTPaNSe7NblPrvCgVrtgpIU0k1+8xq44h0fQZ156AtNCbKYXJ8dbREoBUxfD
         p/vw==
X-Forwarded-Encrypted: i=1; AKwUvBxBqEJhzCjzQnBxULHqfRVFKCIcK8shQzgbTF5y63vqnHvG117UVdljuaecUgevgpmCWC6vG8lX27WjfwnwcDfN@lists.infradead.org
X-Gm-Message-State: AFuF++mp2FGUDmCtN/yXLBMqqe5PDvck+McsREHrpy+suAFPvoCqdbBa
	5z7swI1/rBXdBCqEU1psetc743tNiisAnTkKtrKR17u+JwNA+Qhdhc8355a64+BYjWqsrw697uQ
	lPujcIcd/4lBMoc5bf9/DKeLeftljhE7YKiO2P73ou5x26qBYauiSfmmCDiJ2+fOsl7cO7qZZ2L
	ao
X-Gm-Gg: AYBFou36XjR4uMduIi/ckY2EN5sfIcd2W3U3PdplwsZhHOPRaSHPduuRWNWVlkZ99/M
	Ab/D7mDP3ihRNR2XeATLrFMtGnSJHQF0oQ5WoHW2Nv+lRFVzHL1/H480f5gj4g77LY5jlAHfaz2
	kDwZoRj5OT/Wuu2FhguLggzE4zCtXt7Mx+k7WTNitMhvHHCdrrR5TgjUsTnqNH3xqMli0pI4GSD
	X0RU705anpFGgViYGBrc8BmXDpmaAFU1LyMLLvAv1aM1DiizuWlsPz3dGkK89YX0nlt5rQjHOSc
	RQQKTkYLQX1VLotbIo5pUPTVwsu98QKiXGYhScHgPg70NdlgcFtgl2tUzy/irbTjtt/5s+wDEM4
	QQbthfp+wp2cmoeqSgTvavxKHQ86MHt++ZNXoVkNzfy0TbkTt3ZRGlQ6m8iMc8G6EQNq5/yGgGw
	==
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475445e9.27.1790672914992;
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475085e9.27.1790672914566;
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5080925sm2483598f8f.25.2026.09.29.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Message-ID: <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
Date: Tue, 29 Sep 2026 11:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding
 and egress tagging
To: Tao Gong <gongtao0607@gmail.com>, netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260923055103.949540-1-gongtao0607@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6GTJhz2XUtYsUSoRRwE0gQCPk1fLLu5SYUpZBvrqlHU_1790672915
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020839_167767_D7EE969B 
X-CRM114-Status: GOOD (  13.03  )
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

On 9/23/26 07:51, Tao Gong wrote:
> This series resolves two issues in the MT7530 DSA switch driver preventing
> trapped link-local control frames (such as STP BPDUs) from reaching the CPU
> host when bridge VLAN filtering is enabled:
> 
> 1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
>     link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN tags,
>     but in hardware this disables the per-packet override and causes
>     trapped frames to follow the CPU port's active VLAN table (VAWD2) rule.
>     When bridge VLAN filtering is active, the CPU port is in stack mode,
>     causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed with
>     a VLAN tag, which userspace STP daemons (such as ustpd) and the kernel
>     bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire state
>     (untagged frames stay untagged, tagged frames stay tagged).
> 
> 2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
>     CPU_PMAP alone is insufficient; the switch MAC forwarding control
>     (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured for
>     trapped frames to exit to the CPU conduit.
It's unclear to me if you are observing the issue with real H/W or if the
patches comes from LLMs or static analysis. Please clarify such info
in the next iteration.

Also clashiko feedback looks relevant, please have a look. You should
address LLM's feedback proactively.

/P


