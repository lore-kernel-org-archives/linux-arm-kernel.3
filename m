Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72257D1A61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzCNQyXXMi5hwZ8PwrIomidmWToeGC4NRFpddV19ges=; b=kyxTWhON4XjX2TBTBZPg6YE1tP
	kyql+G3NTAX1d07hLQXZr/Nbsb5T3O0Loy9/azon81aHqG5OVjHr2X4FAgtUaONn68uPo+/fTIUqP
	xGnP+mgDIAytVWnYCzjaXJzPQYAybGnUxNqFPmDlyeEiY9Y0XWYKZ62FL9XYGrMgxu6XG7ZJTKXkB
	jnhA0GkEYNJyqnSOp2plNgrK4ljF3cTNCVosKbgGiOvPPTGy7/V7kW+FiVi6ZhC9La9+pi0bHvyPp
	3Khp5dhJGFnTlUy4MBNtPU83cNQk0fUCOuzqkoKOqc098A++t+e0neEdEwA2agNpIm3Rk99ZcxaLK
	snnhr7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veChF-00000002MXb-1zIh;
	Fri, 09 Jan 2026 13:38:33 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veChD-00000002MX1-0kVj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jzCNQyXXMi5hwZ8PwrIomidmWToeGC4NRFpddV19ges=; b=YTAL0+CaomnDGZZ5XBWL5NPrlN
	J98hNz9x0nLokf6b5sEeR0FcyxWu+NXbR+T/Sg4e0Oxh2bnu4hgITrgq9xDDMKSs0FK/3DozVK6NX
	72DO+xPw1hVqBWYPAqx40CdN8tB1Fo/flLZAxxqQFyefMc2bWCNurz+85U8Eqn7Li3uQW9ahDkcU+
	ZKtTiNTcm4CE1ZxOsPJop0nLPgJ04BNXnM7Ht0CD0FodXGLTljqCSM5VRfxfWGf26wxmCZQIoDXbQ
	/najW2O76qgQr0GxZvl/AamGy2noMicAjn+0qsxuO586jD1/s4AIPjU4K5qmCgFMb3aDDC3f80wnL
	8xmRMpWA==;
Received: from [122.175.9.182] (port=48590 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1veChA-00000000ymB-0Ssm;
	Fri, 09 Jan 2026 08:38:28 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D68891A87E0F;
	Fri,  9 Jan 2026 19:08:21 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id btYwLIfbUPGt; Fri,  9 Jan 2026 19:08:20 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 462241A87E0D;
	Fri,  9 Jan 2026 19:08:20 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id stijPET9I-S2; Fri,  9 Jan 2026 19:08:20 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 24E7E1A87E0E;
	Fri,  9 Jan 2026 19:08:20 +0530 (IST)
Date: Fri, 9 Jan 2026 19:08:20 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, danishanwar <danishanwar@ti.com>, 
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
Message-ID: <951229905.101031.1767965900074.JavaMail.zimbra@couthit.local>
In-Reply-To: <a1341a4b-3ad0-43dd-adff-66d7d90be471@redhat.com>
References: <20260105122549.1808390-1-parvathi@couthit.com> <20260105122549.1808390-4-parvathi@couthit.com> <a1341a4b-3ad0-43dd-adff-66d7d90be471@redhat.com>
Subject: Re: [PATCH net-next v11 3/3] net: ti: icssm-prueth: Add support for
 ICSSM RSTP switch
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Add support for ICSSM RSTP switch
Thread-Index: 2yq6qhM507at40oktu8mVZ/W/fKYfA==
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
X-CRM114-CacheID: sfid-20260109_053831_245222_615D3A14 
X-CRM114-Status: UNSURE (   9.83  )
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

> On 1/5/26 1:23 PM, Parvathi Pudi wrote:
>> +static int icssm_prueth_ndev_port_link(struct net_device *ndev,
>> +				       struct net_device *br_ndev)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +	struct prueth *prueth = emac->prueth;
>> +	unsigned long flags;
>> +	int ret = 0;
>> +
>> +	dev_dbg(prueth->dev, "%s: br_mbrs=0x%x %s\n",
>> +		__func__, prueth->br_members, ndev->name);
>> +
>> +	spin_lock_irqsave(&emac->addr_lock, flags);
>> +
>> +	if (!prueth->br_members) {
>> +		prueth->hw_bridge_dev = br_ndev;
>> +	} else {
>> +		/* This is adding the port to a second bridge,
>> +		 * this is unsupported
>> +		 */
>> +		if (prueth->hw_bridge_dev != br_ndev) {
>> +			spin_unlock_irqrestore(&emac->addr_lock, flags);
>> +			return -EOPNOTSUPP;
>> +		}
>> +	}
>> +
>> +	prueth->br_members |= BIT(emac->port_id);
>> +
>> +	ret = icssm_prueth_port_offload_fwd_mark_update(prueth);
> 
> More AI generated feedback here that still looks valid to me:
> 
> """
> ndo_stop() can sleep (e.g., via rproc_shutdown()). This function appears
> to be called while holding a spinlock via the call chain:
> 
>  icssm_prueth_ndev_port_link()
>    -> spin_lock_irqsave(&emac->addr_lock)
>      -> icssm_prueth_port_offload_fwd_mark_update()
>        -> icssm_prueth_change_mode()
>          -> ndo_stop() / ndo_open()
> 
> Is this intentional? The ndo_open() path also calls
> icssm_prueth_sw_init_fdb_table() which does kmalloc(GFP_KERNEL) and
> rproc_boot(), both of which may sleep.
> """
> 
> There are other similar cases; for the full report see:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=ce23f731-f25b-4082-a5d0-c1261ab829ed
> 
> /P

Sure, we will review them and address the applicable changes in the next version.

Thanks and Regards,
Parvathi.


