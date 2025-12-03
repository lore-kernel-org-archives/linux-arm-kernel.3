Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B9DD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c4X3Sg9mK9CRq2MBgU2yKHdubh7UouDbU2leoDMNXc=; b=om268dg7kPcU9LM4TAh5Jozx53
	v8mtOnui46QLKsEK7jUtNZ2L1JtfyQTNXQftVFQoA1MsC7ukau/qnRb814gEYzDWfdo9LngLjJwMi
	IbvDTeuIpSjBPJ8NkfeoWcliY2ux4ztZ77GaSrj5q5BLNlP3OjnIhMFk+5nUxbbaHgcQ6fJOPq1F5
	ZTK70U6nu2LN2dA3fSKyS0Ee5k/mmegoEULedvVltR5Gw+1ivXLrDDvRUjb1mRIBGsk4QyVIn2pfV
	rEfRQq+FF/ILEf6M4iPXo+zdqfqU6cbLsCYerHTrUbI3ZvN4/V8RLq4fNeENGsAj9nNe5LHJr/e+e
	Y4Di96BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiPq-00000006KEJ-0DWa;
	Wed, 03 Dec 2025 08:40:50 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiPn-00000006KE0-3VhD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/c4X3Sg9mK9CRq2MBgU2yKHdubh7UouDbU2leoDMNXc=; b=JuyGi7L9fozo4eA1IjFJSmVGep
	Sj8guFkJYbm2pqpoZhSYv+LPz+zAT8lmWksSBDEefg+c5BRt8iddIcnPibuqQV0w6O6PkeUHd/wG7
	LdvDcc6R0LQCC6nblxMofHG/+XE0jrHtb99GuQw5ZoYr+biEgiJ8azllFP0ANRIvb3sSvS1syRnCC
	FRVTrzcJbijltMFiSnYUV4CiaWrf4Z2CveRLNtYsOMBTJjn951aC7frRWHcp1yxI0tnLanpgCcE0n
	UeasMhyWuWdTEcldxdVx/aISn4s2n6+RA0i9VFHoPv23iW4Z4itHnquKQ35p5doUWyV6ow9W3gZQs
	QJxG0vTw==;
Received: from [122.175.9.182] (port=24722 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vQiPl-00000001czT-2Sfy;
	Wed, 03 Dec 2025 03:40:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 617EB1A655AA;
	Wed,  3 Dec 2025 14:10:41 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id B7HvcGkoo9CQ; Wed,  3 Dec 2025 14:10:41 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 345D11A6575D;
	Wed,  3 Dec 2025 14:10:41 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Vdxto11muIzS; Wed,  3 Dec 2025 14:10:41 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 13FB61A655AA;
	Wed,  3 Dec 2025 14:10:41 +0530 (IST)
Date: Wed, 3 Dec 2025 14:10:41 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, pmohan <pmohan@couthit.com>, 
	basharath <basharath@couthit.com>, afd <afd@ti.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	ALOK TIWARI <alok.a.tiwari@oracle.com>, horms <horms@kernel.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <1648322401.84640.1764751241037.JavaMail.zimbra@couthit.local>
In-Reply-To: <20251201141858.399fff62@kernel.org>
References: <20251126163056.2697668-1-parvathi@couthit.com> <20251126163056.2697668-2-parvathi@couthit.com> <20251201141858.399fff62@kernel.org>
Subject: Re: [PATCH net-next v8 1/3] net: ti: icssm-prueth: Add helper
 functions to configure and maintain FDB
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Add helper functions to configure and maintain FDB
Thread-Index: eFQMmBav/YIGb0NrzZQd7Bcuvs/4Pg==
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
X-CRM114-CacheID: sfid-20251203_004047_937591_09D1C666 
X-CRM114-Status: UNSURE (   3.60  )
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

> On Wed, 26 Nov 2025 21:57:12 +0530 Parvathi Pudi wrote:
>> +	u8 hash_val, mac_tbl_idx;
> 
> Using narrow types is generally quite counter productive.
> It can easily mask out-of-range accesses and subtle errors,
> given that max is outside of the range of the u8 type:
> 
> +#define FDB_INDEX_TBL_MAX_ENTRIES     256
> +#define FDB_MAC_TBL_MAX_ENTRIES       256
> 
> You should consider changing all the local variables to unsigned int.

OK, we will update the code to use unsigned int for relevant local
variables to avoid any silent errors.

Thanks and Regards,
Parvathi.

