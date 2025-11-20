Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31CECF8545
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv50Yi92TJYc/2wkVx9y8CSyBdscL+zkddlWIcgDCos=; b=vaT8aEdBkaqveTCvAmieeo/r1y
	Bt5ZvUMSlzuRiaHpWALZ9x8rPpLsfueA0r44JgJ03jzng10aH5YU4EnaA9Fn9thHo+YMM95qoYlw8
	fyAtisNGqncNa1uDCFmqMAf1vj3tY5vJ1L21ilGPO0o3KZSyY1zLT3joMYv4xmUp091k68CJg6eVV
	rOmI+paorCIJB+KcFdJqBKm6V0XpQ80VOiR++tzp3Pn0AmzHOB7067VX33OB+eRZy/WGX4tXo4spu
	YovaV7l5pcyXrwWCMKfVmFG2UwLqbsQMGk4WMTGHMOIlUkHDuUKnxEG3LOggbzDvMw8cbSTp2EZQo
	uEAzDlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy7N-00000006Dq8-0VU5;
	Thu, 20 Nov 2025 06:26:09 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy7K-00000006Dpb-2TQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 06:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kv50Yi92TJYc/2wkVx9y8CSyBdscL+zkddlWIcgDCos=; b=f1tpEB+pR0E4GIPzVPgwsc14aB
	KCdRzupP4uIs2M1M7T8+0kc++1vlU86QGC+rSRS5Nj6YrmSMSKsEva/m63Sn+MgqO9cwb8F9gulKq
	lA1lvXr9k0emQx2fmfaKnGkfQvhS2/1Ipq7ICZwdNx30hiP6/5zClj+znzkV3ZV30DiOfo0dX1Ijo
	x0fxLqqQu/LdrI0Wg272t138kY3qZYyOeOvvsT5JmSIpLF3ruFR+WJXbj6QNt+6nhXvKUeWAoWHzU
	QBvwqCQNURTPu9tqXENCEC98i3yjTi1q9TfJpLVlzdoK5rtKe/1BYRF2/nZh4l45ulyKbuFlPLmVe
	UJOeBLeg==;
Received: from [122.175.9.182] (port=39728 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vLy7I-00000004wzo-1KXt;
	Thu, 20 Nov 2025 01:26:04 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 96FD51A681B6;
	Thu, 20 Nov 2025 11:55:51 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id i_MBSIC7OPKA; Thu, 20 Nov 2025 11:55:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4C7F51A681B4;
	Thu, 20 Nov 2025 11:55:51 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id IclgSBfrVVcw; Thu, 20 Nov 2025 11:55:51 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 251461A681B6;
	Thu, 20 Nov 2025 11:55:51 +0530 (IST)
Date: Thu, 20 Nov 2025 11:55:51 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Simon Horman <horms@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	ALOK TIWARI <alok.a.tiwari@oracle.com>, pratheesh <pratheesh@ti.com>, 
	j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <1355121310.5320.1763619951092.JavaMail.zimbra@couthit.local>
In-Reply-To: <aRuO-ib0us1JCrxc@horms.kernel.org>
References: <20251113101229.675141-1-parvathi@couthit.com> <20251113101229.675141-4-parvathi@couthit.com> <aRuO-ib0us1JCrxc@horms.kernel.org>
Subject: Re: [PATCH net-next v5 3/3] net: ti: icssm-prueth: Adds support for
 ICSSM RSTP switch
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Adds support for ICSSM RSTP switch
Thread-Index: 4DYZE/NR6J02f92V0LtZKAFjn//LuQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_222606_655528_215913E6 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi,

> On Thu, Nov 13, 2025 at 03:40:23PM +0530, Parvathi Pudi wrote:
> 
> ...
> 
>> @@ -1012,17 +1074,77 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
>>  	hrtimer_cancel(&emac->tx_hrtimer);
>>  
>>  	/* stop the PRU */
>> -	rproc_shutdown(emac->pru);
>> +	if (!PRUETH_IS_EMAC(prueth))
>> +		icssm_prueth_sw_shutdown_prus(emac, ndev);
>> +	else
>> +		rproc_shutdown(emac->pru);
>> +
>> +	/* free table memory of the switch */
>> +	if (PRUETH_IS_SWITCH(emac->prueth))
>> +		icssm_prueth_sw_free_fdb_table(prueth);
> 
> The conditional block above appears to open-code icssm_prueth_free_memory()
> which is also called below. I don't think this this duplication causes
> any harm, as it looks like the second, indirect, call to
> icssm_prueth_sw_free_fdb_table() will be a noop. But it does seem
> unnecessary.
> 

Sure. We will address this and remove the duplicate code.


Thanks and Regards,
Parvathi.

