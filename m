Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E345C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/3toa1ComUbw9a49HidEIdUKwiCcGuMGyG57aTNhN8=; b=wZzc4B4MVsy4k3MGKEVh/0B14z
	BjsoyiRSx5bQp2wxVUntuZxYBzKsgzIZL+UZApMuqHfdb1Jk715JuHNWgxcT5iAg+JreVYW7DK+9X
	30wwI1GzJJSZJtbSMluNfMIVCi+jHCfvEKBZ6rmvx75AVTGfYX9uKKMHB4Sok1NVgfl7lodcsqg86
	fWFbACMm6tO/nrPhONAVR6rS2WOvGn62fy+KcR03ehxeK5QBAKq0qDfC7iXBP/XVxME7BON1igd1b
	s1bk5j2ZoUJ3NaNpl2VjCCbhOkL2XxK/ru4MI+pBUgKzrzZt/FmLT8eOyOvVqEXiPPA5mdrgW5wBb
	TuPEphbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNCA-000000019ws-14GI;
	Tue, 04 Feb 2025 17:58:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfN9f-000000019Yb-3y32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:56:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514HtllI3196784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 11:55:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738691747;
	bh=v/3toa1ComUbw9a49HidEIdUKwiCcGuMGyG57aTNhN8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MXlm2fWRMcTT683EB8AHaEpEbi3X/GV6Leem5ZoZK5wLMWTbJJ/rNymOiWkAj6WeR
	 At2s9AqpFwfZEAw+SPrjVnrhgxuqoE4552Hox+QNK2DcIQbVmylKoe86AsYdsc+xNh
	 AsZoTiNhOpPDe/xcgckk1D5kqt/GlZhyMXhOlWbE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514HtlFm004039;
	Tue, 4 Feb 2025 11:55:47 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 11:55:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 11:55:47 -0600
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514HtdTZ063495;
	Tue, 4 Feb 2025 11:55:40 -0600
Message-ID: <f1cf5bfc-e767-4ced-9aad-76a578c53706@ti.com>
Date: Tue, 4 Feb 2025 23:25:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net 3/3] net: ti: icssg-prueth: Add AF_XDP
 support
To: Ido Schimmel <idosch@idosch.org>
CC: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <robh@kernel.org>,
        <matthias.schiffer@ew.tq-group.com>, <dan.carpenter@linaro.org>,
        <rdunlap@infradead.org>, <diogo.ivo@siemens.com>,
        <schnelle@linux.ibm.com>, <glaroque@baylibre.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122124951.3072410-4-m-malladi@ti.com> <Z5J7kGFU_ZgneFAF@shredder>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <Z5J7kGFU_ZgneFAF@shredder>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_095612_072127_29E95609 
X-CRM114-Status: GOOD (  20.15  )
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



On 1/23/2025 10:55 PM, Ido Schimmel wrote:
> s/AF_XDP/XDP/ ? On Wed, Jan 22, 2025 at 06: 19: 51PM +0530, Meghana 
> Malladi wrote: > From: Roger Quadros <rogerq@ kernel. org> > > Add 
> native XDP support. We do not support zero copy yet. There are various 
> XDP features (e. g. , NETDEV_XDP_ACT_BASIC)
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> v9dnXbjPnQP15quJdjhJcrR0CoEiGINyhi1SO3vz-ZB8Sgif7YzLnG8ayC2XmAQz6g$>
> ZjQcmQRYFpfptBannerEnd
> 
> s/AF_XDP/XDP/ ?
> 

Will fix the typo.

> On Wed, Jan 22, 2025 at 06:19:51PM +0530, Meghana Malladi wrote:
>> From: Roger Quadros <rogerq@kernel.org>
>> 
>> Add native XDP support. We do not support zero copy yet.
> 
> There are various XDP features (e.g., NETDEV_XDP_ACT_BASIC) to tell the
> stack what the driver supports. I don't see any of them being set here.
> 

Ok, I will add the feature flags in the v2 patch series.

>> 
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> 
> [...]
> 
>> +static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, int *xdp_state)
>>  {
>>  	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
>>  	u32 buf_dma_len, pkt_len, port_id = 0;
>> @@ -560,10 +732,12 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>>  	struct page *page, *new_page;
>>  	struct page_pool *pool;
>>  	struct sk_buff *skb;
>> +	struct xdp_buff xdp;
>>  	u32 *psdata;
>>  	void *pa;
>>  	int ret;
>>  
>> +	*xdp_state = 0;
>>  	pool = rx_chn->pg_pool;
>>  	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
>>  	if (ret) {
>> @@ -602,8 +776,17 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>>  		goto requeue;
>>  	}
>>  
>> -	/* prepare skb and send to n/w stack */
>>  	pa = page_address(page);
>> +	if (emac->xdp_prog) {
>> +		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
>> +		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
>> +
>> +		*xdp_state = emac_run_xdp(emac, &xdp, page);
>> +		if (*xdp_state != ICSSG_XDP_PASS)
>> +			goto requeue;
>> +	}
>> +
>> +	/* prepare skb and send to n/w stack */
>>  	skb = build_skb(pa, prueth_rxbuf_total_len(pkt_len));
>>  	if (!skb) {
>>  		ndev->stats.rx_dropped++;
> 
> XDP program could have changed the packet length, but driver seems to be

This will be true given, emac->xdp_prog is not NULL. What about when XDP 
is not enabled ?

> building the skb using original length read from the descriptor.
> Consider using xdp_build_skb_from_buff()
> 


