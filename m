Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8721C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoSPVAeyfLAakHdkwoRkZKuwxGIMQEg6NmXCD0Y72LU=; b=O1p0tUukt4/+blqq6A8sKxdnDN
	nc8ylLVatBP9AQJJytRQonqYs/JPJt10z0NwSpzP/4cbBK2fJi3ZAcfbcdotgAX/B7xSRaoapbB0x
	yj22mnYOGJKAzkrZLoRLJTUhJIfLCCaGH16mBTNzaTx0LKZ4zyFVLjMaTLrMFaY/8VBZWZd0Vl5ke
	/rmZzo7DoHii5FL75cf/0o9w+zA2C7yWpD4UEfmJeYcpN349Godz7JiCeInziT1UztxYSd490xUC5
	64AI1Cmmbl6uLnP468JZQFRg5QYZOQ5Z4gozW6nnm4A7Nw9XV0khtPADjTHZYXFr+Lqw8zH/CPP+Q
	NVWzSxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh34G-0000000EkUh-1djq;
	Tue, 07 Jul 2026 10:30:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh34E-0000000EkU5-0TB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783420215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoSPVAeyfLAakHdkwoRkZKuwxGIMQEg6NmXCD0Y72LU=;
	b=bjbhaiuHUp7lS5edjMbw0xDFz6MR85leQxmFE32mgnG1bG61EqiLJ0iv86+6MlP4OiKuCp
	SpeJeKX8OiGzAiObXNWxp50qWJsDbziaILLLuPEoc21NklZDUw+3KiEuObVH8YZee8+an9
	9NTs3dMsxuMvoaRTUMjSEvIYr6LqLkM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-6LU1WcdSO1GNCqJsk4iqhw-1; Tue, 07 Jul 2026 06:30:13 -0400
X-MC-Unique: 6LU1WcdSO1GNCqJsk4iqhw-1
X-Mimecast-MFC-AGG-ID: 6LU1WcdSO1GNCqJsk4iqhw_1783420212
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4744b72f90bso2467358f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 03:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420212; x=1784025012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoSPVAeyfLAakHdkwoRkZKuwxGIMQEg6NmXCD0Y72LU=;
        b=sFT3KAF5/TIyyt9TUICWFRO9YEQJBT0Kc6gM6FTvQi6D3cITwOaKNO3p1uX/KLSRSX
         Gpb7vtbUOZfBB5BuDGr9bWnSbHU4y1j3NzVDvsAr29MSQ1BVsBeB1UX5CpTPfmyowOxD
         Jm8Roer8D+6uUE3LiaX26KaMoTmeFD/gG4MKlonKXznTHtKZUgmp+InocJl+XvxRb18J
         E2cYUpgYCMHPkcRS6xIVVoDHFbZAnlNjPbVWQDQ8Zy2CQWhZ68pKfpJc9NxfTcEQ0wP0
         igD63QA3V5GM1M4wRI89150vIOThnqI5WKMKJvkP/L2WA+Ab1V1xifEyau3P6eByS0sx
         z7tA==
X-Gm-Message-State: AOJu0YwjE7bkCLiUGrL26ZNVpjq6AlX3HV9aYQi6XSOnho9Tv20UMPPK
	+SNkB3qqzPnwBCEKmzecMtjuf5f8RAM1wa8cA1p0u2a1lmF2sBKnQlgQFjkrI2DwIrTxVyDSC6/
	FvU150lHx199iNp7d6ukWWym6+6gyrRyNpMTet5552Ah6sibSC9ccBpm8waMagLffooC1UxDUVO
	r8
X-Gm-Gg: AfdE7clSINCHUHDoEHVVgl2e/QCOH2V7rH2OJt+tZBrFnKFmNhLtSBaBLF6Fb/jUK9Q
	pIj8uNJ2FoewyJGwI4SuXj0O1QcEexhyJphVa1e/CP8y9qKltKLFOO4JHVyVNb4Y/Qy1KlEgfM9
	xuXT0PxeffKs3qUQOBPJB59jDh1ZciT56KSIN2f1QwYOTS06M51VE5Q00Djgv0XFgVasC6p5+Gn
	QYlp7UtZPOfYmgLhJthgQxJGbsjsQNgSkQ3mSRLyTEfI/BOb5m+qDezyw5MOVYBxo7djl8eUlvQ
	bYtMa9AFeDRDw1vCuhRT11ZVkz/WnPtTOW2PZ+bRXiyEekjyU/1Cjb0+Sq93MxwviTOphFrWxGg
	sCCQUu1okIQMua4ScvV8/6vjc5wzGdoYYDsoMlkHBP6NQP89BPIjrSTcFiSb19a4Ajhw1/T+vKo
	GHoh7/pjx4KuKb
X-Received: by 2002:a05:6000:604:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47de668ef06mr4430906f8f.4.1783420212386;
        Tue, 07 Jul 2026 03:30:12 -0700 (PDT)
X-Received: by 2002:a05:6000:604:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47de668ef06mr4430875f8f.4.1783420211781;
        Tue, 07 Jul 2026 03:30:11 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm35594909f8f.7.2026.07.07.03.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:30:11 -0700 (PDT)
Message-ID: <71a1bacf-c54f-45b0-80df-7175261cf2ac@redhat.com>
Date: Tue, 7 Jul 2026 12:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix link-local addresses being
 forwarded out of slave ports
To: MD Danish Anwar <danishanwar@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Meghana Malladi <m-malladi@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260701112535.4027920-1-danishanwar@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260701112535.4027920-1-danishanwar@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqfJ1olXyK9Wpk1T3jgSQ-zSBUNPg5-QuDPH_9JR1pE_1783420212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_033018_231207_224EFDF5 
X-CRM114-Status: GOOD (  18.78  )
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

On 7/1/26 1:25 PM, MD Danish Anwar wrote:
> Link-local multicast addresses (01:80:c2:00:00:0x) must only be
> delivered to the host port (P0) and must not be forwarded out of
> the physical slave ports. icssg_fdb_add_del() was programming these
> addresses with P1/P2 membership bits set, causing the firmware to
> forward them out of slave ports.
> 
> Clear P1/P2 membership and set only P0 membership when
> is_link_local_ether_addr() returns true.
> 
> Fixes: 487f7323f39a ("net: ti: icssg-prueth: Add helper functions to configure FDB")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
> index 3f8237c17d099..04a81402e3f3c 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_config.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
> @@ -732,6 +732,16 @@ int icssg_fdb_add_del(struct prueth_emac *emac, const unsigned char *addr,
>  	u8 fid = vid;
>  	int ret;
>  
> +	/* Link-local addresses (01:80:c2:00:00:0x) must only be delivered to
> +	 * the host port (P0). Clear P1/P2 membership to prevent the firmware
> +	 * from forwarding them out of the physical slave ports.
> +	 */
> +	if (is_link_local_ether_addr(addr)) {
> +		fid_c2 |= ICSSG_FDB_ENTRY_P0_MEMBERSHIP;
> +		fid_c2 &= ~(ICSSG_FDB_ENTRY_P1_MEMBERSHIP |
> +			    ICSSG_FDB_ENTRY_P2_MEMBERSHIP);
> +	}

Sashiko gemeni mentioned it could be safer to reject entirely wrong masks:

https://sashiko.dev/#/patchset/20260701112535.4027920-1-danishanwar%40ti.com

It's not clear to me if the mentioned bad scenario is actually possibly,
please have a look.

/P


