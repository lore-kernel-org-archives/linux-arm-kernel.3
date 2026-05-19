Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35B4CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=; b=OKtXP25JUY4kjJY4BIuZ1r9g28
	TkTpHq127T6xliB8kY/61stbqa7hy0khhHdgkZOrcHmvDwjKH1ZbkYm7qt1a3luVIr5PnTJSmcL6Z
	iYbIZ0eBP0KYyIbO1gBROJ1Y2Zv/xNR+JxpzMSrET5jKZJtRZ46j3E/KAhzNgMhFdZzNwPoWqMfAN
	dxQvKnRVJV4QpBYgB4CA/pKTvoyKP6EDpdN+wtpp3vj7s7XEi2mtLQ4NPGw8Lj13T8sUxQyDcgnRg
	gbfzVd1X5s6dp8PIYWaf3yBxXWe7tQyLgXBEQGYUpUTy/IHL9HdBzqfIS+7lXsHTdDhGEdFEpAART
	kxIzmhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI50-00000001DdJ-1pGi;
	Tue, 19 May 2026 10:53:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI4y-00000001Dbz-07bA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779188019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=;
	b=Dn+b9WGT49zKGcfdmlw30u9FJLr7ChSQ8EvOsYsS0HVL64/krNeqCAWoWQln4IxRmWBfGl
	K3Zq3DPflturKbFi2sTjGkGc8KC3Lr6+u2p1P4VwURFSVXcjFklKiQNylskcBxXvPbRhoh
	4o0ajeRdEG0Hfs0D9T/J08KIJ2KQRtk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-5d8tKgVuNA6J8QibVxgKfA-1; Tue, 19 May 2026 06:53:35 -0400
X-MC-Unique: 5d8tKgVuNA6J8QibVxgKfA-1
X-Mimecast-MFC-AGG-ID: 5d8tKgVuNA6J8QibVxgKfA_1779188014
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fd33b4921so24398365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 03:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188014; x=1779792814;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUFo6hIuf2ZxDrSoEBKNJqzPv5wXEukq1eF4NrWaHmc=;
        b=h5K+UJhJyIX6t146tWAy+YFbZd5kgMd4SMXeMCzPklSyEpcrbRrQaDqpGZlAuI+/ul
         O8IPKlSFs0VlAod6fb4LFMu2ZsUKIeK3wBcIMfTmGHefxOF4DL4mNtve75mGy6ToxXnt
         c70Fzx7/J692OduUP67uBQNi1feRD4lCY7G7V7taShcaXesFY7miZoBQMOV08RSxysek
         mAVn7WgfQwCG860wKBf9QDcDlhI+aykRwI/vxMQFHv4PEtULtwK6WcBV/tk07r4xDj7O
         ZB5btwOzS1Y88egcQ9SLu03n5X4N6f3QevW9ZOY2KweTJYuE7FtAKJk3Np9kzv2kYQLN
         +yCQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Rua1aT7yLfb8XTnTFtIPzjbNVruVkkY2Wc+HPJ0OC0Sb2JVo3tPQLcXFpo02+bIHg1t4AC8dk+TBqq2om+cH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3XbSkdWPSL9jcnbN75HA0vhEN0gbxCz8oYWqNa5dtjvinm9zG
	LEY6Qg0rZeU5TbSQCst/bbiu6O4UJ7aBw2FyiLYdejLPIWRN9pUOMqpkfz4PdDDAjk4QzK6UFWj
	QX7pc53WWHuvnxJ/jGUs+PZevXHU+Wj3niJI5J6Gp8gKzFZvPsBB79eC+jru191Ku9zkmHvVgWd
	YN
X-Gm-Gg: Acq92OFXax0tacolnJOaWW9Aiuc/iGo5TsN6a18yjJGYht+dOVVjr/3XcU3Y153XbUx
	FhRDmceAhYY5oTgUKv1fQ44h1IfbYXz7WuPKwgQPq/GXe6VmNBYlT109e0n9yZ/J2fPXrZrjQ7A
	b+TERwrG/frA6N+PgsM6y302YB40yqfb/hypUdXs3vwr5lZrht+g7jIRmAum2OaFgMC9aFTBSDV
	s7+cQ+n98gbryOGxwMtdUk21D+hye8xzok3V+blhCIOd0wHoPmDS3hruy+qVCbzT7u2MGIMMRyz
	ZFoCsabuH0VYJX/Xg+ptGg2/mgGafK84NhClLLuK6oOuKMNPWxtH3IMCmW0cCYPO77lufkzV2Zb
	0smB9Iky2o3+7KGZg1SNKljqBV1XX2RkkB7tp730Wsg4ALRgdGLISnL+jdtnSgd4bWA==
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr282542375e9.21.1779188014444;
        Tue, 19 May 2026 03:53:34 -0700 (PDT)
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr282541945e9.21.1779188014000;
        Tue, 19 May 2026 03:53:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe78aadsm101525975e9.29.2026.05.19.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:53:33 -0700 (PDT)
Message-ID: <3a390dee-38e9-4df1-a94d-7128cd4eb834@redhat.com>
Date: Tue, 19 May 2026 12:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 4/5] net: dsa: mt7530: clear flood flags on bridge
 leave
To: Daniel Golle <daniel@makrotopia.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1778766629.git.daniel@makrotopia.org>
 <cc8d2f494dd202304a6f68332f3a90ea0a8a4618.1778766629.git.daniel@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cc8d2f494dd202304a6f68332f3a90ea0a8a4618.1778766629.git.daniel@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TqGaJY5OlsdbivavC2Hen7MIxPfhImEyLcJmsw5RSwI_1779188014
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_035340_149817_4552E0DF 
X-CRM114-Status: GOOD (  18.17  )
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

On 5/14/26 4:05 PM, Daniel Golle wrote:
> Flood flags set by port_bridge_flags persist after a port leaves the
> bridge, causing unknown unicast to be forwarded to standalone ports.
> 
> Clear UNU_FFP, UNM_FFP and BC_FFP in port_bridge_leave so that the
> port returns to its initial state without flooding.
> 
> Fixes: 5a30833b9a16 ("net: dsa: mt7530: support MDB and bridge flag operations")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: no changes
> 
>  drivers/net/dsa/mt7530.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 752ba92b0851..5b58e42bfda9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1767,6 +1767,11 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
>  	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
>  		   MT7530_PORT_MATRIX_MODE);
>  
> +	/* Clear flood flags so they don't persist across bridge leave */
> +	mt7530_clear(priv, MT753X_MFC,
> +		     UNU_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
> +		     BC_FFP(BIT(port)));

I think sashiko has a point here:

---
Will these cleared flags be immediately overwritten by the DSA core?
When a port leaves a bridge, the DSA core's dsa_port_bridge_leave()
broadcasts the DSA_NOTIFIER_BRIDGE_LEAVE event, which triggers this
callback and clears the bits.
However, immediately after the broadcast returns,
dsa_port_bridge_leave() unconditionally calls
dsa_port_switchdev_unsync_attrs(), which calls
dsa_port_clear_brport_flags().
This explicitly configures standalone ports to flood everything by
setting the BR_FLOOD, BR_MCAST_FLOOD, and BR_BCAST_FLOOD flags to 1, and
then invokes the driver's port_bridge_flags callback.
As a result, mt7530_port_bridge_flags() processes this call and executes
mt7530_rmw() to turn the UNU_FFP, UNM_FFP, and BC_FFP bits right back to
1 for the port.
Does this leave the isolation bug unfixed since the register clearing is
reverted before the DSA bridge leave sequence fully completes?
---

Since the other fixes are independent, I'm applying them.

/P


