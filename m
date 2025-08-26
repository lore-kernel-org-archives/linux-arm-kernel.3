Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C802CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Up+ZYBhT8QrHZf6BT7jB0PeZJcHkilAw8/OUTiwhvLA=; b=btvMOLGji22mrH+1nHroLfNyof
	5VHEp1JuKq26oIP7ljucmhGqO5BMgTMzi+V0jzXjO2xxfPXKA5JKASZeV9diP4R8jnsrAV/8dlZ5Q
	GZUApY4GBY0nBqu8GZaE9PRzwr/AZ3EqKD/T+CE9ZJwAjz6zX8WJf1e8n5T1XnkjlVVTlNMjyMhwC
	qVpSLVv5yfmgPr5Dn3wAvrgnCsYg1h8RF1O5POfCMFqIvdged1M0W4k4EIlXZxIx6CWxIYRVIw6PS
	ubHrjMJ8mOwGovtVb8yJ1+Xv43T12cbWhSLRDZBicsJLnCqYv6LyIcLzODoxBzCzmNCrd6sht35zw
	VVSN0i9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqp5e-0000000B1YV-2v85;
	Tue, 26 Aug 2025 08:31:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqp1L-0000000B0oG-3qU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 08:27:13 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8QYjL1490705;
	Tue, 26 Aug 2025 03:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756196795;
	bh=Up+ZYBhT8QrHZf6BT7jB0PeZJcHkilAw8/OUTiwhvLA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HTkjHKqgBOhYCfjmgZlnluvXZdydWAd0LCYS9qOkZDbddhcqGaZ5Li0nawgQHh0Tf
	 MKCaXbQP0nCR56AyDoY8OL+CWHYkn44k78UEaPiXPT3KwlEmySi9l2xmfYUB0jDKty
	 qi6rZ5yco8+Bbx9qLN90tmF60xVuOw4BUR8ZfC0o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8QYmW2259941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:26:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:26:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:26:33 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8QQkQ1132570;
	Tue, 26 Aug 2025 03:26:27 -0500
Message-ID: <3b9f6ecc-2152-4385-bbdc-700b7eca94af@ti.com>
Date: Tue, 26 Aug 2025 13:56:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] Revert "media: platform: ti: Remove unused
 vpdma_update_dma_addr"
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-3-y-abhilashchandra@ti.com>
 <c453aadb-afd7-473c-bb39-cab1930c8baa@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <c453aadb-afd7-473c-bb39-cab1930c8baa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_012712_060148_2C341D1C 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Krzysztof,
Thanks for the review.

On 16/07/25 19:53, Krzysztof Kozlowski wrote:
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
>> This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.
>>
>> We're adding support for TI VIP driver, so this is no longer unused.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/platform/ti/vpe/vpdma.c | 32 +++++++++++++++++++++++++++
>>   drivers/media/platform/ti/vpe/vpdma.h |  3 +++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
>> index bb8a8bd7980c..da90d7f03f82 100644
>> --- a/drivers/media/platform/ti/vpe/vpdma.c
>> +++ b/drivers/media/platform/ti/vpe/vpdma.c
>> @@ -552,6 +552,38 @@ EXPORT_SYMBOL(vpdma_submit_descs);
>>   
>>   static void dump_dtd(struct vpdma_dtd *dtd);
>>   
> 
> 
> Please add kerneldoc.
> 

I will add kerneldoc in v3. Thanks

>> +void vpdma_update_dma_addr(struct vpdma_data *vpdma,
>> +	struct vpdma_desc_list *list, dma_addr_t dma_addr,
>> +	void *write_dtd, int drop, int idx)
>> +{
>> +	struct vpdma_dtd *dtd = list->buf.addr;
>> +	dma_addr_t write_desc_addr;
>> +	int offset;
>> +
>> +	dtd += idx;
>> +	vpdma_unmap_desc_buf(vpdma, &list->buf);
>> +
>> +	dtd->start_addr = dma_addr;
>> +
>> +	/* Calculate write address from the offset of write_dtd from start
>> +	 * of the list->buf
>> +	 */
>> +	offset = (void *)write_dtd - list->buf.addr;
>> +	write_desc_addr = list->buf.dma_addr + offset;
>> +
>> +	if (drop)
>> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
>> +							   1, 1, 0);
>> +	else
>> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
>> +							   1, 0, 0);
>> +
>> +	vpdma_map_desc_buf(vpdma, &list->buf);
>> +
>> +	dump_dtd(dtd);
>> +}
>> +EXPORT_SYMBOL(vpdma_update_dma_addr);
> 
> 
> This has to be GPL
> 

I will correct this in v3.

Thanks and Regards
Yemike Abhilash Chandra

>> +
>>   void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
>>   			u32 width, u32 height)
> 
> Best regards,
> Krzysztof


