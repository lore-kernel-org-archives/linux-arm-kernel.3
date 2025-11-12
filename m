Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F6ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvvE9WtcjHoTZVjSJYj4iXnVgOEsxF/6OfDNJ2uRNxg=; b=dsbqaMmGVmDc5bD/eSv8fYQjFY
	YNXsBO5SldpudjbhsUHUe/wxNUnMtf6IK2EroZp59p6xUZ8vDEGqi3Pd4kxS7JmtjVtCX+TrrMfFN
	9o08rIzSVoFWBK/I8kbbdJIEjg1LTX4u0UFumLqBuEw/KvEOxGtpaMu2GKCmqbCZvdvMu2wu7lJlp
	Ti36gxNNl+JYp5jBu1e7Clj26R/hejy8ddn1GDfu5Upqe+eDp6PEIWTwEa5pbd6sGCEnzpi/tnLiI
	OH8zTJsqLduAULQWupEixBQuAHPGRd2L7LYhpE5/hRtBsh4PJ58LlPqYH9JtLo3xMH+3p21hDWK07
	w9hnVIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAap-00000008orE-19oq;
	Wed, 12 Nov 2025 13:08:59 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAam-00000008oqC-44JV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HvvE9WtcjHoTZVjSJYj4iXnVgOEsxF/6OfDNJ2uRNxg=; b=12Ug5jifwKRDravl3MVuc8Khb0
	zSYZRFC5hAilUZhi8TUztAdeB7ycICRFykWuE4PjNgQrw429SxwEGklPRG2FxGe2qEAUutLSLkmE2
	j79MOlJirKQle8emeYrahQohQ0/wgr+6IdVxsrKQvLYH7hO2mMNIlzGGWutJuddLVmeC4pyWv/MmK
	5ZPg86sYC4yWBv9ufJManpACltCFYHY1oFeoriO56PJQOaqrxC5FHO7L/C7JsZmXk9Tu7tOwrgDYv
	RplyLdhvj19vsVpZZiTEDK6Xe1RCpRJUe/ELTKQ+AQzWZjS/NHjSxdCs1ZKgf4gcsZSxsrNn7d9kF
	sBHPlVhw==;
Received: from [122.175.9.182] (port=6520 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vJAa5-0000000Fnh7-2Yzi;
	Wed, 12 Nov 2025 08:08:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 215811A6489B;
	Wed, 12 Nov 2025 18:38:01 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FRgP7a_hUyVw; Wed, 12 Nov 2025 18:37:59 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B590A1A6489A;
	Wed, 12 Nov 2025 18:37:59 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id WxatnibBDCKn; Wed, 12 Nov 2025 18:37:59 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 8D3BD1A6489B;
	Wed, 12 Nov 2025 18:37:59 +0530 (IST)
Date: Wed, 12 Nov 2025 18:37:59 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <482294584.44920.1762952879480.JavaMail.zimbra@couthit.local>
In-Reply-To: <a29c40ff-7209-4b60-a17f-2aab09318dc1@oracle.com>
References: <20251110125539.31052-1-parvathi@couthit.com> <20251110125539.31052-2-parvathi@couthit.com> <a29c40ff-7209-4b60-a17f-2aab09318dc1@oracle.com>
Subject: Re: [External] : [PATCH net-next v4 1/3] net: ti: icssm-prueth:
 Adds helper functions to configure and maintain FDB
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: : [PATCH net-next v4 1/3] net: ti: icssm-prueth: Adds helper functions to configure and maintain FDB
Thread-Index: V0LWKQ7E4ab9hK965b5QamKIOHDnsg==
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
X-CRM114-CacheID: sfid-20251112_050857_099025_A648E09E 
X-CRM114-Status: UNSURE (   6.84  )
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

>> +static int icssm_prueth_sw_insert_fdb_entry(struct prueth_emac *emac,
>> +					    const u8 *mac, u8 is_static)
>> +{
>> +	struct fdb_index_tbl_entry __iomem *bucket_info;
>> +	struct fdb_mac_tbl_entry __iomem *mac_info;
>> +	struct prueth *prueth = emac->prueth;
>> +	struct prueth_emac *other_emac;
>> +	enum prueth_port other_port_id;
>> +	u8 hash_val, mac_tbl_idx;
>> +	struct fdb_tbl *fdb;
>> +	u8 flags;
>> +	u16 val;
>> +	s16 ret;
>> +	int err;
>> +
>> +	fdb = prueth->fdb_tbl;
>> +	other_port_id = (emac->port_id == PRUETH_PORT_MII0) ?
>> +			 PRUETH_PORT_MII1 : PRUETH_PORT_MII0;
>> +
>> +	other_emac = prueth->emac[other_port_id - 1];
>> +
>> +	if (fdb->total_entries == FDB_MAC_TBL_MAX_ENTRIES)
>> +		return -ENOMEM;
>> +
>> +	if (ether_addr_equal(mac, emac->mac_addr) ||
>> +	    ether_addr_equal(mac, other_emac->mac_addr)) {
>> +		/* Don't insert fdb of own mac addr */
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Get the bucket that the mac belongs to */
>> +	hash_val = icssm_prueth_sw_fdb_hash(mac);
>> +	bucket_info = FDB_IDX_TBL_ENTRY(hash_val);
>> +
>> +	if (!readw(&bucket_info->bucket_entries)) {
>> +		mac_tbl_idx = icssm_prueth_sw_fdb_find_open_slot(fdb);
>> +		writew(mac_tbl_idx, &bucket_info->bucket_idx);
>> +	}
>> +
>> +	ret = icssm_prueth_sw_find_fdb_insert(fdb, prueth, bucket_info, mac,
>> +					      emac->port_id - 1);
>> +	if (ret < 0)
>> +		/* mac is already in fdb table */
>> +		return 0;
>> +
>> +	mac_tbl_idx = ret;
> 
> If ret == -1 mac_tbl_idx wraps to 255 silently.
> 

Thanks. Theoretically, assigning -1 to an unsigned variable would
result in 255 due to signed-to-unsigned conversion. However, in
this case, the above code already checks if (ret < 0) and returns early,
so the assignment to mac_tbl_idx never happens when ret is negative. 

>> +
>> +	err = icssm_prueth_sw_fdb_spin_lock(fdb);
>> +	if (err) {
>> +		dev_err(prueth->dev, "PRU lock timeout %d\n", ret);
> 
> wrong var ret print.
> return ret or err here ?
> 

We will address this in the next version.


Thanks and Regards,
Parvathi.

