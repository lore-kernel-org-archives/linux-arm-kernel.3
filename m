Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8AEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVZ0tLlG0gxUYcMK2sjB46xw1TF5VnAEq4UYGXh3mEs=; b=wzTB0VM6Ys8sd1ZbpvDlGy1LIf
	Komascga4GdAgz3Pxlv2SqtascevaZG5mh8ThrUpAv42aQ5jtoueXc0nNqUmnI8OIQ6FmLLKcpyZO
	S99DcUIB59rEl8azWlLdGD61R6PG6FLK54vuTeZe4ZF3Kqu3IMRQHhm6jZo1a2otSot66cXtvSvUe
	FIRZof0L2MKr5ca0wQSIL8QwKIR4775tbjUTndTotoVFQVzZLvzlYSfJRo0skpnUbjWxk5NQi6u91
	pyUBNSnh2VIa8Fm8yYGS2tvKAKqETLiuCgeSUftdMJ2VdsWehIONl7jMfIzy+qe6on0IkKMALv10e
	LlrTMlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsego-0000000AhfQ-2qLV;
	Thu, 13 Mar 2025 09:17:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseda-0000000AgxU-2CAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 09:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741857235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVZ0tLlG0gxUYcMK2sjB46xw1TF5VnAEq4UYGXh3mEs=;
	b=COfY+IkAM5L9hhxWAY3Kw4nIJBJlO0qgoM/O/bvxRmwV9MXYVOx4vAcNi0fl6/U3uPtuOf
	D36e823QIXMav57ALcI9h1vgrJS3Moq1bIU1XNPv3T9Wt94OYLT2EEVJKirbIT3MEuwBmW
	td9r19E/9Ed27BLKoBWsgsrotoGDgU0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37--zj1tuq_PLmBpYoc2K46yw-1; Thu, 13 Mar 2025 05:13:53 -0400
X-MC-Unique: -zj1tuq_PLmBpYoc2K46yw-1
X-Mimecast-MFC-AGG-ID: -zj1tuq_PLmBpYoc2K46yw_1741857233
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39134c762ebso285121f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 02:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857233; x=1742462033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVZ0tLlG0gxUYcMK2sjB46xw1TF5VnAEq4UYGXh3mEs=;
        b=Zj1RhLTs8nk23pgsy+erLPnin35p8OrapwYKc7EhMbxcXG5aMW2hWV7FRs08m61oGY
         aPsi4rDx+hIg+kemn878fMqq2svF+gNTit4lx4v+sX4zpcTdS3MoGyGT8YgatoFrKFGY
         LACsHt+ORZyxJ+C8ebaTIN7mO7kYjC8ppyQwDm/6bXBL9INTcaecyhV/bxkq7UpBhKQB
         Cs1zje8CkAuqnhz4go2knFgFyhRHE4JPfyUaUALmv+Y0iOQ50EOkybYqHnaMBPjspBFH
         43Jg4aW+H6XHCu8UwWNjDpx5T9S37VOrrby4cSwPCAxtn2Jdqk16r44WzG16HMOU5Txr
         Gniw==
X-Forwarded-Encrypted: i=1; AJvYcCWka3YgYxnoOpuQtxXm3X8t4pk+j314+OJWjKVze21mVXB3fqEsbsa2+wDoIFH2bTrs1EioDYvOPv9o6ETxmD6Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KEaXTw30vHLOTd4kJWD/4HYsws3ev8ejOmI4pAWI+HUmi1AH
	I5Ihx94vvUjgB9vwueSZkG4TgmBJNFDXvv/lWS0MxSazyEassdt4B2/8j23rAGpxIS5oNy5iqjo
	xBntkEOQzeO/rNK7Q9ANhgw4XVuxy4zvoA2Y6eHO7+ADBSVKce1ZW3EYhpZ/hm1URtozzwrdV
X-Gm-Gg: ASbGnct8NRuAEO/Z3IFwyKjNnA88XYMCuuRLxuZydIiOhRgSpHmkjAKWqUcMMsox+Qc
	pWpqyPv14xKluiLe3ktxDRiIGRV3l14fclSun3iRwAoxpGby0tdaUqtjXuOgTAnvNLi+gg13tTR
	9MOz6EQMiZD+r1QFoBjGNzG5ryEMi6NMmlmlwKJ4fhnwq+cum4BvlJ5vrtSIaehM2qj8Ti9dnyM
	5gVV0/iTxqmug3/2yMeXbXbd5ynv53gFU0dQIetICxHt1hVy0hdmxMZZiupytUVrp0H7T9b6eaW
	eJ2HoptOc/pSmVGG7sRjz/29sia2H5Rvq5fP+mHqx/U=
X-Received: by 2002:a5d:64cb:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3913fa7c415mr17065940f8f.31.1741857232648;
        Thu, 13 Mar 2025 02:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbjX4TBW23c/gT1Ykr54Jxw9IBGriCcPT5Lz7WvNJIWr0e0qiBIFuFczS2FQTDIKFEENThyA==
X-Received: by 2002:a5d:64cb:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3913fa7c415mr17065917f8f.31.1741857232262;
        Thu, 13 Mar 2025 02:13:52 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-237.dyn.eolo.it. [146.241.7.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975bdfsm1423712f8f.49.2025.03.13.02.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:13:51 -0700 (PDT)
Message-ID: <92a9cb8d-fe6b-4389-9d65-64b668f1e221@redhat.com>
Date: Thu, 13 Mar 2025 10:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 00/13] net: phy: Rework linkmodes handling in
 a dedicated file
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yIaReKkB5nsGnFwOONjnP6ubKC80lBBcaeg-K-UqG5c_1741857233
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_021358_651162_29133275 
X-CRM114-Status: GOOD (  18.62  )
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

On 3/7/25 6:35 PM, Maxime Chevallier wrote:
> Hello everyone,
> 
> This is V5 of the phy_caps series. In a nutshell, this series reworks the way
> we maintain the list of speed/duplex capablities for each linkmode so that we
> no longer have multiple definition of these associations.
> 
> That will help making sure that when people add new linkmodes in
> include/uapi/linux/ethtool.h, they don't have to update phylib and phylink as
> well, making the process more straightforward and less error-prone.
> 
> It also generalises the phy_caps interface to be able to lookup linkmodes
> from phy_interface_t, which is needed for the multi-port work I've been working
> on for a while.
> 
> This V5 addresse Russell's and Paolo's reviews, namely :
> 
>  - Error out when encountering an unknown SPEED_XXX setting
> 
>    It prints an error and fails to initialize phylib. I've tested by
>    introducing a dummy 1.6T speed, I guess it's only a matter of time
>    before that actually happens :)
> 
>  - Deal more gracefully with the fixed-link settings, keeping some level of
>    compatibility with what we had before by making sure we report a
>    single BaseT mode like before.
> 
> V1 : https://lore.kernel.org/netdev/20250222142727.894124-1-maxime.chevallier@bootlin.com/
> V2 : https://lore.kernel.org/netdev/20250226100929.1646454-1-maxime.chevallier@bootlin.com/
> V3 : https://lore.kernel.org/netdev/20250228145540.2209551-1-maxime.chevallier@bootlin.com/
> V4 : https://lore.kernel.org/netdev/20250303090321.805785-1-maxime.chevallier@bootlin.com/

LGTM, waiting an extra bit to allow explicit acks from the phy crew.

Thanks,

Paolo


