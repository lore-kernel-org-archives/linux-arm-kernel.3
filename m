Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B0CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvYgm2ZiEhdQinQKcxWC99AV37HjB6EYaQCw2NitFgg=; b=wCrpWhMZfgpdlRZ4m8FcxpwzIh
	JQ+syhTqLXyjEPO8wOmgfIeuo/4Q2uqJ3D954vigRE2rF0b1Ghfq3uBhqC/nZHuNQsMu19EBeMTzu
	3wGLMK6Yb/gS+KGHlaeBWBA31YwvzRyyAOSO6c26r08ZDqUr25AXcTbcYzMMMWVH01d3fyZwyf+La
	kX+RRcXJ11uzuMvdYSfBafbZXf368lJD68DxsMfAQZph5H8Ypr9KSg6v1/UrfTFtDcNXpARZJ7n/X
	oDKK1digwsEAWHkYbUb9zbory5vwLtnLodleO9P3gYcgG19tfzoQEM8se5VJVHf1dAMBpMGf5e9fo
	QAdSyosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MM0-00000004c2v-0BnS;
	Thu, 16 Oct 2025 11:41:08 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MLu-00000004bwB-3w0w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 11:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XvYgm2ZiEhdQinQKcxWC99AV37HjB6EYaQCw2NitFgg=; b=ZPwtWfVfmH1BgOVMa3L70j0efc
	qqsLU2dGGGukihkkq+42UZcMLx8PX2kIvKq2VQScwsWmV3FqzlCOiWcaZ4II38HfGvqEPfD21HNRL
	kGzjp+NyLq+iH5rvz+NxDEejWy0YpC00XxoIDmHg/USbd8xKEjHt5J4OfvJ8i+676WT2bwZRuWC6p
	YFdnvdOUsNfsVD476lUnekQErRuvNNG71r6S9nrYXVddVMJqVz1YyY2tMYuSdbeDxui9CS22iAZde
	8xt8vJRlx4MbKGvSkc1tSeDJaZ9xYanDHGWDeViZI0601YhoSyL46ivOsN10QOcTh8XKpl4WlFCIX
	NPckYhlA==;
Received: from [122.175.9.182] (port=17170 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v9MLE-000000079MT-1SRX;
	Thu, 16 Oct 2025 07:40:20 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id E724F1783FF9;
	Thu, 16 Oct 2025 17:10:15 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D12ED1783FF4;
	Thu, 16 Oct 2025 17:10:15 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GzU_cDNcWiqS; Thu, 16 Oct 2025 17:10:15 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id A72EF1781C72;
	Thu, 16 Oct 2025 17:10:15 +0530 (IST)
Date: Thu, 16 Oct 2025 17:10:15 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <1633385931.433.1760614815573.JavaMail.zimbra@couthit.local>
In-Reply-To: <1e16ab86-ccc1-433a-a482-76d9ba567fb9@lunn.ch>
References: <20251014124018.1596900-1-parvathi@couthit.com> <20251014124018.1596900-2-parvathi@couthit.com> <1e16ab86-ccc1-433a-a482-76d9ba567fb9@lunn.ch>
Subject: Re: [PATCH net-next v3 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds helper functions to configure and maintain FDB
Thread-Index: XlOBMErJ6hpwpJMWg3cXMXchYoQRVA==
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
X-CRM114-CacheID: sfid-20251016_044102_999236_020061A6 
X-CRM114-Status: UNSURE (   5.92  )
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

>> +/* 4 bytes */
>> +struct fdb_index_tbl_entry_t {
>> +	/* Bucket Table index of first Bucket with this MAC address */
>> +	u16 bucket_idx;
>> +	u16 bucket_entries; /* Number of entries in this bucket */
>> +};
> 
> Please drop the _t. That is normally used to indicate a type, but this
> is actually a struct
>

Sure. We will remove _t from the struct definitions.

>> +void icssm_prueth_sw_fdb_tbl_init(struct prueth *prueth)
>> +{
>> +	struct fdb_tbl *t = prueth->fdb_tbl;
>> +
>> +	t->index_a = (struct fdb_index_array_t *)((__force const void *)
>> +			prueth->mem[V2_1_FDB_TBL_LOC].va +
>> +			V2_1_FDB_TBL_OFFSET);
> 
> You cast it to a const void * and then a non-const fdb_index_array_t *?

We will address this and remove the double casting completely.

Thanks and Regards,
Parvathi.

