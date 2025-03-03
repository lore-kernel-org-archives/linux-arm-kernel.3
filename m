Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtLTcgj+wTfwtj7P3s1/LE4IyDDTgXqvwipyBUTOI18=; b=Nq4jyqmPpdSPkYvds3dtIN2raM
	7T3ys5XT/8CXaeJyX6eQOT+852Get3tuGvJnzVLbgfo+ohmAPS6IgHwJFuUrVMrrv68P5iKlQfb9o
	IxROytjYREr9uhjnTtK274E9lNrDmB+JQm8XHp0YAYJ9xfqg0QYUU8OlI/18mzPHIA2mAwVo9e/cO
	aFYwFOe8BDYxMY7DtGPNG3DNL+EsasukYNj1MReJICzhx/uWbn7O0Kxv3K8SWEmmXE48s1b1h0Xfn
	UYMoNcF9HNwnLtnnPJLijzBfXyBAiCRWriPRHegnOqjyPEj7lbNls/DTgtdINYGPCpNvBDkcaEn9q
	LMmaV/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp53S-00000000llX-3mCH;
	Mon, 03 Mar 2025 12:37:54 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4JB-00000000dK7-2R8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:50:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523BnaOA2672834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 05:49:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741002576;
	bh=LtLTcgj+wTfwtj7P3s1/LE4IyDDTgXqvwipyBUTOI18=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ObLVyW93xulqoW6jAymFcaL01GbRW6yejSpjz1KmauRIAYoBh+4QLKrz7qVp+Uk1/
	 KP7AZorNrO+VZDq2nlT9Pwx6j6rpJpKtxfpdbC8vI3snKumo//FkBEA8Woj0NRjqyO
	 HVB++sLbrK15SZFx8qiV3E3OuMSu5BnunZSyAbCo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 523Bnaac119408
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 05:49:36 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 05:49:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 05:49:36 -0600
Received: from [172.24.21.156] (lt9560gk3.dhcp.ti.com [172.24.21.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523BnTXH029594;
	Mon, 3 Mar 2025 05:49:30 -0600
Message-ID: <06d2b616-9f11-46ae-91f7-e97f86f9f24c@ti.com>
Date: Mon, 3 Mar 2025 17:19:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 2/3] net: ti: icssg-prueth:
 introduce and use prueth_swdata struct for SWDATA
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <u.kleine-koenig@baylibre.com>,
        <matthias.schiffer@ew.tq-group.com>, <schnelle@linux.ibm.com>,
        <diogo.ivo@siemens.com>, <glaroque@baylibre.com>, <macro@orcam.me.uk>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-3-m-malladi@ti.com>
 <41fbeb70-bf49-4751-b4ba-6b122a45233d@stanley.mountain>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <41fbeb70-bf49-4751-b4ba-6b122a45233d@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_035005_708250_2276A03E 
X-CRM114-Status: GOOD (  28.35  )
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



On 2/26/2025 3:59 PM, Dan Carpenter wrote:
> On Mon, Feb 24, 2025 at 04: 31: 01PM +0530, Meghana Malladi wrote: > 
> From: Roger Quadros <rogerq@ kernel. org> > > We have different cases 
> for SWDATA (skb, page, cmd, etc) > so it is better to have a dedicated 
> data structure for
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> uldqnT1FPMdbygXOdhMC_1iqujTzdK2ZTrOjiy9hZrrhggm_lCduTFVqMq5QnhhjXmDeSX6KQhxE9U6zpHeghHYcqYQiiHpSSbljHpY$>
> ZjQcmQRYFpfptBannerEnd
> 
> On Mon, Feb 24, 2025 at 04:31:01PM +0530, Meghana Malladi wrote:
>> From: Roger Quadros <rogerq@kernel.org>
>> 
>> We have different cases for SWDATA (skb, page, cmd, etc)
>> so it is better to have a dedicated data structure for that.
>> We can embed the type field inside the struct and use it
>> to interpret the data in completion handlers.
>> 
>> Increase SWDATA size to 48 so we have some room to add
>> more data if required.
> 
> What is the "SWDATA size"?  Where is that specified?  Is
> that a variable or a define or the size of a struct or
> what?
> 

Will be removing this line, since "increase SWDATA size" change is not 
applicable anymore. It is a macro PRUETH_NAV_SW_DATA_SIZE used to define 
the size held for swdata.

>> 
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>> Changes since v2 (v3-v2):
>> - Fix leaking tx descriptor in emac_tx_complete_packets()
>> - Free rx descriptor if swdata type is not page in emac_rx_packet()
>> - Revert back the size of PRUETH_NAV_SW_DATA_SIZE
>> - Use build time check for prueth_swdata size
>> - re-write prueth_swdata to have enum type as first member in the struct
>> and prueth_data union embedded in the struct
>> 
>> All the above changes have been suggested by Roger Quadros <rogerq@kernel.org>
>> 
>>  drivers/net/ethernet/ti/icssg/icssg_common.c  | 52 +++++++++++++------
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  3 ++
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h  | 16 ++++++
>>  .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  4 +-
>>  4 files changed, 57 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> index acbb79ad8b0c..01eeabe83eff 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> @@ -136,12 +136,12 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>>  	struct net_device *ndev = emac->ndev;
>>  	struct cppi5_host_desc_t *desc_tx;
>>  	struct netdev_queue *netif_txq;
>> +	struct prueth_swdata *swdata;
>>  	struct prueth_tx_chn *tx_chn;
>>  	unsigned int total_bytes = 0;
>>  	struct sk_buff *skb;
>>  	dma_addr_t desc_dma;
>>  	int res, num_tx = 0;
>> -	void **swdata;
>>  
>>  	tx_chn = &emac->tx_chns[chn];
>>  
>> @@ -163,12 +163,19 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>>  		swdata = cppi5_hdesc_get_swdata(desc_tx);
>>  
>>  		/* was this command's TX complete? */
>> -		if (emac->is_sr1 && *(swdata) == emac->cmd_data) {
>> +		if (emac->is_sr1 && (void *)(swdata) == emac->cmd_data) {
> 
> I don't think this conversion is correct.  You still need to say:
> 
> 		if (emac->is_sr1 && swdata->data.something == emac->cmd_data) {
> 
> Where something is probably "page".
> 

Yes you are right. This needs to be changes to:

if (emac->is_sr1 && swdata->data.cmd== emac->cmd_data) {

This issue can be addressed more cleanly with the fix Roger mentioned 
here: 
https://lore.kernel.org/all/3d3d180a-12b7-4bee-8172-700f0dae2439@kernel.org/

> regards,
> dan carpenter
> 
>>  			prueth_xmit_free(tx_chn, desc_tx);
>>  			continue;
>>  		}
>>  
>> -		skb = *(swdata);
>> +		if (swdata->type != PRUETH_SWDATA_SKB) {
>> +			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
>> +			prueth_xmit_free(tx_chn, desc_tx);
>> +			budget++;
>> +			continue;
>> +		}
> 


