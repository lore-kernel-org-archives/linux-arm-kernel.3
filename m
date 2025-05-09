Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401E8C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5shS9aa9wXhOlBT7ksNlLhRZM4K9cenEEVtO8PY9I70=; b=qE/nvycRRtNKBH
	sarCF6hycCJzp6fIwlDvzl9Qu+pPkXzi3e3CaHek0PiR/No4spnXUY8oyEKXmu2qUHUqdnTrZGZLQ
	sacGeqdAo5uroHIiYn1qFqJKsuEBWH8UgHJclvWrS+5IycEEZRswxIeWvplNyRHXAnIPNgXHpFffL
	b3PwIlpR59fQkNh3/WA7/FMaBM7GkZkCgeukxJIL7J8RPLV2aDOFmM8GHcHqwc5gfKQ6gu6D2oE7F
	cKbQ+JQ2XhXptzACd8MZ9HrPkU2KfCiSU2HiQuJfehP3GBiKsSfvlMTGnGMKdJEx6EW8lMQ6oTu7X
	7IQu6N4Y3dLY5S8i41gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLmg-00000003Pri-17nR;
	Fri, 09 May 2025 11:20:54 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKrh-00000003FjL-1OA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5shS9aa9wXhOlBT7ksNlLhRZM4K9cenEEVtO8PY9I70=; b=qNLszmI3KfaEVfwHV4511bth5D
	BUy3yg9rpJXubGWsBsCbDUw+VxDPTk7OQjbj1JAflYE5iBN/GCEzzocg6krSa59K2cI4+mzEU+uil
	8qI4E6NfEPXfbq3UhItDbucG+CuARqBWyDPRU62BGanVHuFhJ15kgABXjWQgcmUZnaG8Z6sI15Jtk
	7Ri/Xl9y5Jq2FqjMAUQpXmr4G6l5xDyhJvRsr2KnbyahQFiBrYP90tDUDsNWwy227CZHe2+Y0iPRv
	Ptv0Ko3ItekA/8Yhh242YHjW1jItnoE0Op/h4/cKSbeg/Qoy7MjDRyuG4jUkGcXLCddQaimMdVF3E
	SZrFHE7g==;
Received: from [122.175.9.182] (port=48237 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uDKqx-000000003Ob-0ndo;
	Fri, 09 May 2025 15:51:15 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C16971783FF8;
	Fri,  9 May 2025 15:51:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 9E74B1781E1E;
	Fri,  9 May 2025 15:51:06 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d32p2WIoMBEs; Fri,  9 May 2025 15:51:06 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 4DCB51783FF8;
	Fri,  9 May 2025 15:51:06 +0530 (IST)
Date: Fri, 9 May 2025 15:51:06 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: pabeni <pabeni@redhat.com>
Message-ID: <1918420534.1246603.1746786066099.JavaMail.zimbra@couthit.local>
In-Reply-To: <ce36ce0e-ad16-4950-b601-ae1a555f2cfb@redhat.com>
References: <20250503121107.1973888-1-parvathi@couthit.com> <20250503131139.1975016-5-parvathi@couthit.com> <ce36ce0e-ad16-4950-b601-ae1a555f2cfb@redhat.com>
Subject: Re: [PATCH net-next v7 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: Yo3qDn3AUxHTr12WJKQJ6KqVwLl7QQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_032201_411961_46D016A4 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 5/3/25 3:11 PM, Parvathi Pudi wrote:
>> +/**
>> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
>> + * @irq: interrupt number
>> + * @dev_id: pointer to net_device
>> + *
>> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
>> + * irq thread function. There is only limited buffer at the ingress to
>> + * queue the frames. As the frames are to be emptied as quickly as
>> + * possible to avoid overflow, irq thread is necessary. Current implementation
>> + * based on NAPI poll results in packet loss due to overflow at
>> + * the ingress queues. Industrial use case requires loss free packet
>> + * processing. Tests shows that with threaded irq based processing,
>> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
>> + * meet the requirement for industrial use case.
> 
> The above statement is highly suspicious. On an non idle system the
> threaded irq can be delayed for an unbound amount of time. On an idle
> system napi_poll should be invoked with a latency comparable - if not
> less - to the threaded irq. Possibly you tripped on some H/W induced
> latency to re-program the ISR?
> 
> In any case I think we need a better argumented statement to
> intentionally avoid NAPI.
> 
> Cheers,
> 
> Paolo

The above comment was from the developer to highlight that there is an improvement in
performance with IRQ compared to NAPI. The improvement in performance was observed due to
the limited PRU buffer pool (holds only 3 MTU packets). We need to service the queue as
soon as a packet is written to prevent overflow. To achieve this, IRQs with highest
priority is used. We will clean up the comments in the next version.


Thanks and Regards,
Parvathi.

